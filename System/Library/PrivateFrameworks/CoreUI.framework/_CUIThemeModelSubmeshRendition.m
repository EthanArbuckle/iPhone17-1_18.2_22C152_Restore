@interface _CUIThemeModelSubmeshRendition
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)initForArchiving:(id)a3;
- (id)modelSubmesh;
- (unint64_t)writeToData:(id)a3;
- (void)dealloc;
@end

@implementation _CUIThemeModelSubmeshRendition

- (id)initForArchiving:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_CUIThemeModelSubmeshRendition;
  v4 = [(_CUIThemeModelSubmeshRendition *)&v6 init];
  if (v4) {
    v4->_submesh = (MDLSubmesh *)a3;
  }
  return v4;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v38.receiver = self;
  v38.super_class = (Class)_CUIThemeModelSubmeshRendition;
  objc_super v6 = [(CUIThemeRendition *)&v38 _initWithCSIHeader:a3 version:*(void *)&a4];
  if (v6)
  {
    v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
    int v9 = *((_DWORD *)v7 + 45);
    v8 = (unsigned int *)(v7 + 180);
    if (v9 != 1297040467) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIThemeModelSubmeshRendition.m" lineNumber:84 description:@"CoreUI: Expecting a kCSIModelMeshSignature but didn't find it"];
    }
    uint64_t v37 = v8[2];
    uint64_t v36 = v8[4];
    uint64_t v35 = v8[6];
    id v34 = [objc_alloc((Class)NSString) initWithBytes:(char *)v8 + 45 length:v8[8] encoding:4];
    v33 = [[CUIMeshBuffer alloc] initWithBytes:(char *)v8 + v8[8] + 45 andLength:v8[9] ofType:2];
    uint64_t v10 = (uint64_t)v8 + v8[8] + *(void *)(v8 + 9) + 45;
    id v11 = [objc_alloc((Class)NSString) initWithBytes:v10 + 20 length:*(unsigned int *)(v10 + 8) encoding:4];
    v12 = (unsigned int *)(v10 + 20 + *(unsigned int *)(v10 + 8));
    v13 = (NSString *)[objc_alloc((Class)NSString) initWithBytes:v12 + 2 length:*v12 encoding:4];
    NSClassFromString(v13);
    v14 = objc_opt_new();

    id v15 = [objc_alloc(getMDLMaterialClass()) initWithName:v11 scatteringFunction:v14];
    if (*(void *)(v10 + 12))
    {
      uint64_t v16 = 0;
      v17 = (void *)((char *)v12 + *(void *)v12 + 8);
      while (2)
      {
        uint64_t v18 = v17[1];
        id v19 = [objc_alloc((Class)NSString) initWithBytes:v17 + 4 length:*((unsigned int *)v17 + 4) encoding:4];
        v20 = (double *)((char *)v17 + v17[2] + 32);
        switch(v18)
        {
          case 1:
            id v21 = [objc_alloc((Class)NSString) initWithBytes:v20 length:*((unsigned int *)v17 + 6) encoding:4];
            id v22 = [(objc_class *)getMDLTextureClass() textureNamed:v21];

            if (!v22)
            {
              id v25 = [objc_alloc(getMDLMaterialPropertyClass()) initWithName:v19 semantic:*v17 string:v21];
              goto LABEL_17;
            }
            id v23 = objc_alloc_init(getMDLTextureSamplerClass());
            [v23 setTexture:v22];
            id v24 = [objc_alloc(getMDLMaterialPropertyClass()) initWithName:v19 semantic:*v17 textureSampler:v23];

            goto LABEL_18;
          case 4:
            v26 = (CGFloat *)malloc_type_malloc(8 * *((unsigned int *)v20 + 3), 0x100004000313F17uLL);
            SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
            v28 = CGColorCreate(SRGB, v26);
            id v24 = [objc_alloc(getMDLMaterialPropertyClass()) initWithName:v19 semantic:*v17 color:v28];
            CGColorRelease(v28);
            free(v26);
            goto LABEL_18;
          case 5:
            id v29 = objc_alloc(getMDLMaterialPropertyClass());
            LODWORD(v30) = *(_DWORD *)v20;
            id v25 = [v29 initWithName:v19 semantic:*v17 float:v30];
            goto LABEL_17;
          case 6:
            id v25 = [objc_alloc(getMDLMaterialPropertyClass()) initWithName:v19 semantic:*v17 float2:*v20];
            goto LABEL_17;
          case 7:
            double v31 = *v20;
            id v25 = [objc_alloc(getMDLMaterialPropertyClass()) initWithName:v19 semantic:*v17 float3:v31];
            goto LABEL_17;
          case 8:
            id v25 = [objc_alloc(getMDLMaterialPropertyClass()) initWithName:v19 semantic:*v17 float4:*v20];
            goto LABEL_17;
          case 9:
            id v25 = objc_msgSend(objc_alloc(getMDLMaterialPropertyClass()), "initWithName:semantic:matrix4x4:", v19, *v17, *(double *)((char *)v20 + 4), *(double *)((char *)v20 + 20), *(double *)((char *)v20 + 36), *(double *)((char *)v20 + 52));
            goto LABEL_17;
          default:
            id v25 = [objc_alloc(getMDLMaterialPropertyClass()) initWithName:v19 semantic:*v17];
LABEL_17:
            id v24 = v25;
LABEL_18:

            [v15 setProperty:v24];
            v17 = (void *)((char *)v20 + v17[3]);
            if ((unint64_t)++v16 >= *(void *)(v10 + 12)) {
              break;
            }
            continue;
        }
        break;
      }
    }
    v6[27] = [objc_alloc(getMDLSubmeshClass()) initWithName:v34 indexBuffer:v33 indexCount:v37 indexType:v36 geometryType:v35 material:v15 topology:0];
  }
  return v6;
}

- (id)modelSubmesh
{
  return self->_submesh;
}

- (unint64_t)writeToData:(id)a3
{
  id v3 = a3;
  char v76 = 0;
  v5 = [a3 length];
  v73[0] = 0x14D4F4453;
  unsigned int v74 = [(NSString *)[(MDLSubmesh *)self->_submesh name] length];
  v73[1] = [(MDLSubmesh *)self->_submesh indexCount];
  v73[2] = [(MDLSubmesh *)self->_submesh indexType];
  v73[3] = [(MDLSubmesh *)self->_submesh geometryType];
  id v75 = objc_msgSend(-[MDLSubmesh indexBuffer](self->_submesh, "indexBuffer"), "length");
  [v3 appendBytes:v73 length:45];
  objc_super v6 = [(NSString *)[(MDLSubmesh *)self->_submesh name] UTF8String];
  [v3 appendBytes:v6 length:v74];
  id v7 = objc_msgSend(objc_msgSend(-[MDLSubmesh indexBuffer](self->_submesh, "indexBuffer"), "map"), "bytes");
  [v3 appendBytes:v7 length:v75];
  if ([(MDLSubmesh *)self->_submesh material])
  {
    v56 = v5;
    v57 = v3;
    id v55 = +[NSMutableData data];
    memset(&v72[1], 0, 12);
    v8 = [(MDLSubmesh *)self->_submesh material];
    char v76 = 1;
    v72[0] = [(MDLMaterial *)v8 materialFace];
    v72[1] = [(NSString *)[(MDLMaterial *)v8 name] length];
    [(MDLMaterial *)v8 scatteringFunction];
    int v9 = (objc_class *)objc_opt_class();
    NSUInteger v71 = [NSStringFromClass(v9) length];
    id v10 = +[NSMutableData data];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v11 = (char *)[(MDLMaterial *)v8 countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      uint64_t v14 = *(void *)v68;
      v59 = v8;
      do
      {
        v58 = v13;
        for (i = 0; i != v12; ++i)
        {
          if (*(void *)v68 != v14) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          long long v65 = 0u;
          long long v66 = 0u;
          *(void *)&long long v65 = [v16 semantic];
          *((void *)&v65 + 1) = [v16 type];
          *(void *)&long long v66 = objc_msgSend(objc_msgSend(v16, "name"), "length");
          id v17 = +[NSMutableData data];
          switch((unint64_t)[v16 type])
          {
            case 1uLL:
              Components = (const CGFloat *)objc_msgSend(objc_msgSend(v16, "stringValue"), "UTF8String");
              uint64_t v19 = (uint64_t)objc_msgSend(objc_msgSend(v16, "stringValue"), "length");
              goto LABEL_21;
            case 3uLL:
              NSLog(&cfstr_DoSomethingFor_0.isa);
              break;
            case 4uLL:
              long long v60 = 0uLL;
              v20 = (CGColor *)[v16 color];
              DWORD2(v60) &= 0xFFFFFF00;
              HIDWORD(v60) = CGColorGetNumberOfComponents(v20);
              if (HIDWORD(v60)) {
                Components = CGColorGetComponents(v20);
              }
              else {
                Components = 0;
              }
              [v17 appendBytes:&v60 length:16];
              uint64_t v19 = 8 * HIDWORD(v60);
LABEL_21:
              id v23 = v17;
              id v22 = Components;
              goto LABEL_22;
            case 5uLL:
              long long v60 = 0uLL;
              [v16 floatValue];
              LODWORD(v60) = v21;
              id v22 = (const CGFloat *)&v60;
              id v23 = v17;
              uint64_t v19 = 4;
              goto LABEL_22;
            case 6uLL:
              long long v60 = 0uLL;
              [v16 float2Value];
              LODWORD(v60) = v31;
              [v16 float2Value];
              DWORD1(v60) = v32;
              id v22 = (const CGFloat *)&v60;
              id v23 = v17;
              uint64_t v19 = 8;
              goto LABEL_22;
            case 7uLL:
              long long v60 = 0uLL;
              [v16 float3Value];
              LODWORD(v60) = v24;
              [v16 float3Value];
              DWORD1(v60) = v25;
              [v16 float3Value];
              DWORD2(v60) = v26;
              id v22 = (const CGFloat *)&v60;
              id v23 = v17;
              uint64_t v19 = 12;
              goto LABEL_22;
            case 8uLL:
              long long v60 = 0uLL;
              [v16 float4Value];
              LODWORD(v60) = v27;
              [v16 float4Value];
              DWORD1(v60) = v28;
              [v16 float4Value];
              DWORD2(v60) = v29;
              [v16 float4Value];
              HIDWORD(v60) = v30;
              id v22 = (const CGFloat *)&v60;
              id v23 = v17;
              uint64_t v19 = 16;
LABEL_22:
              [v23 appendBytes:v22 length:v19];
              break;
            case 9uLL:
              int v64 = 0;
              long long v62 = 0u;
              long long v63 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              [v16 matrix4x4];
              DWORD1(v60) = v33;
              [v16 matrix4x4];
              DWORD2(v60) = v34;
              [v16 matrix4x4];
              *(_DWORD *)((unint64_t)&v60 | 0xC) = v35;
              [v16 matrix4x4];
              LODWORD(v61) = v36;
              [v16 matrix4x4];
              DWORD1(v61) = v37;
              [v16 matrix4x4];
              DWORD2(v61) = v38;
              [v16 matrix4x4];
              HIDWORD(v61) = v39;
              [v16 matrix4x4];
              LODWORD(v62) = v40;
              [v16 matrix4x4];
              DWORD1(v62) = v41;
              [v16 matrix4x4];
              DWORD2(v62) = v42;
              [v16 matrix4x4];
              HIDWORD(v62) = v43;
              [v16 matrix4x4];
              v8 = v59;
              LODWORD(v63) = v44;
              [v16 matrix4x4];
              DWORD1(v63) = v45;
              [v16 matrix4x4];
              DWORD2(v63) = v46;
              [v16 matrix4x4];
              HIDWORD(v63) = v47;
              [v16 matrix4x4];
              int v64 = v48;
              [v17 appendBytes:&v60 length:68];
              goto LABEL_17;
            case 0xAuLL:
LABEL_17:
              NSLog(&cfstr_DoSomethingFor.isa);
              break;
            default:
              break;
          }
          *((void *)&v66 + 1) = [v17 length];
          [v10 appendBytes:&v65 length:32];
          id v49 = objc_msgSend(objc_msgSend(v16, "name"), "UTF8String");
          [v10 appendBytes:v49 length:v66];
          id v50 = [v17 bytes];
          [v10 appendBytes:v50 length:DWORD2(v66)];
        }
        v13 = &v12[(void)v58];
        v12 = (char *)[(MDLMaterial *)v8 countByEnumeratingWithState:&v67 objects:v77 count:16];
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }
    *(void *)((char *)&v72[1] + 4) = v13;
    [v55 appendBytes:v72 length:20];
    v51 = [(NSString *)[(MDLMaterial *)v8 name] UTF8String];
    [v55 appendBytes:v51 length:LODWORD(v72[1])];
    [v55 appendBytes:&v71 length:8];
    [(MDLMaterial *)v8 scatteringFunction];
    v52 = (objc_class *)objc_opt_class();
    v53 = [NSStringFromClass(v52) UTF8String];
    [v55 appendBytes:v53 length:v71];
    [v55 appendData:v10];
    id v3 = v57;
    [v57 appendData:v55];
    v5 = v56;
  }
  return (unsigned char *)[v3 length] - v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeModelSubmeshRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

@end