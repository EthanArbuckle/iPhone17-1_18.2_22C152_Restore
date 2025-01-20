@interface _CUIThemeModelMeshRendition
- (NSArray)submeshKeys;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)initForArchiving:(id)a3 withSubmeshRenditionKeys:(id)a4;
- (id)modelMesh;
- (unint64_t)writeToData:(id)a3;
- (void)dealloc;
@end

@implementation _CUIThemeModelMeshRendition

- (id)initForArchiving:(id)a3 withSubmeshRenditionKeys:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_CUIThemeModelMeshRendition;
  v6 = [(_CUIThemeModelMeshRendition *)&v8 init];
  if (v6)
  {
    v6->_mesh = (MDLMesh *)a3;
    v6->_submeshKeys = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeModelMeshRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v40.receiver = self;
  v40.super_class = (Class)_CUIThemeModelMeshRendition;
  v6 = [(CUIThemeRendition *)&v40 _initWithCSIHeader:a3 version:*(void *)&a4];
  if (v6)
  {
    memset(v42, 0, 92);
    v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
    int v9 = *((_DWORD *)v7 + 45);
    objc_super v8 = v7 + 180;
    if (v9 != 1297040461) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIThemeModelMeshRendition.m" lineNumber:102 description:@"CoreUI: Expecting a kCSIModelMeshSignature but didn't find it"];
    }
    id v10 = [objc_alloc((Class)NSString) initWithBytes:v8 + 52 length:*((unsigned int *)v8 + 2) encoding:4];
    [v6 setName:v10];

    v11 = (unsigned int *)&v8[*((unsigned int *)v8 + 2) + 52];
    v12 = +[NSMutableArray arrayWithCapacity:*((unsigned int *)v8 + 5)];
    if (*(void *)(v8 + 20))
    {
      v13 = v6;
      unint64_t v14 = 0;
      do
      {
        id v15 = [objc_alloc((Class)NSString) initWithBytes:v11 + 8 length:v11[7] encoding:4];
        id v16 = [objc_alloc(getMDLVertexAttributeClass()) initWithName:v15 format:*(void *)v11 offset:v11[4] bufferIndex:v11[6]];
        [(NSMutableArray *)v12 addObject:v16];

        v11 = (unsigned int *)((char *)v11 + v11[7] + *((void *)v11 + 1) * *(void *)(v8 + 12) + 32);
        ++v14;
      }
      while (v14 < *(void *)(v8 + 20));
      uint64_t v17 = *(void *)(v8 + 20);
      v6 = v13;
    }
    else
    {
      uint64_t v17 = 0;
    }
    v18 = +[NSMutableArray arrayWithCapacity:v17];
    if (*(void *)(v8 + 28))
    {
      v19 = v18;
      unint64_t v20 = 0;
      do
      {
        id v21 = objc_alloc(getMDLVertexBufferLayoutClass());
        unsigned int v22 = *v11;
        v11 += 2;
        id v23 = [v21 initWithStride:v22];
        [(NSMutableArray *)v19 addObject:v23];

        ++v20;
      }
      while (v20 < *(void *)(v8 + 28));
    }
    v24 = +[NSMutableArray arrayWithCapacity:*((unsigned int *)v8 + 9)];
    if (*(void *)(v8 + 36))
    {
      unint64_t v25 = 0;
      do
      {
        v26 = [[CUIMeshBuffer alloc] initWithBytes:v11 + 2 andLength:*v11 ofType:1];
        [(NSMutableArray *)v24 addObject:v26];

        v11 = (unsigned int *)((char *)v11 + *(void *)v11 + 8);
        ++v25;
      }
      while (v25 < *(void *)(v8 + 36));
    }
    v6[28] = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((unsigned int *)v8 + 11)];
    if (*(void *)(v8 + 44))
    {
      unint64_t v27 = 0;
      do
      {
        __memcpy_chk();
        v28 = [[CUIRenditionKey alloc] initWithKeyList:v42];
        [v6[28] addObject:v28];

        v11 = (unsigned int *)((char *)v11 + *v11 + 4);
        ++v27;
      }
      while (v27 < *(void *)(v8 + 44));
    }
    id v29 = objc_alloc_init(getMDLVertexDescriptorClass());
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v30 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v12);
          }
          [v29 addOrReplaceAttribute:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        }
        id v31 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v31);
    }
    id v34 = objc_alloc_init((Class)NSArray);
    v6[27] = [objc_alloc(getMDLMeshClass()) initWithVertexBuffers:v24 vertexCount:*((unsigned int *)v8 + 3) descriptor:v29 submeshes:v34];
    objc_msgSend(v6[27], "setName:", objc_msgSend(v6, "name"));
  }
  return v6;
}

- (NSArray)submeshKeys
{
  return &self->_submeshKeys->super;
}

- (id)modelMesh
{
  return self->_mesh;
}

- (unint64_t)writeToData:(id)a3
{
  unsigned int v70 = 0;
  id v41 = [a3 length];
  id v47 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v71 = 0x14D4F444DLL;
  NSUInteger v45 = [(MDLMesh *)self->_mesh vertexCount];
  NSUInteger v73 = v45;
  uint64_t v75 = 0;
  uint64_t v74 = 0;
  NSUInteger v76 = [(NSArray *)[(MDLMesh *)self->_mesh vertexBuffers] count];
  id v77 = [(NSMutableArray *)self->_submeshKeys count];
  id v43 = [(MDLMesh *)self->_mesh name];
  unsigned int v72 = [v43 length];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v46 = self;
  obj = [(MDLVertexDescriptor *)[(MDLMesh *)self->_mesh vertexDescriptor] attributes];
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v82 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v67;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v67 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v11 = -[MDLMesh vertexAttributeDataForAttributeNamed:](v46->_mesh, "vertexAttributeDataForAttributeNamed:", objc_msgSend(v10, "name", v41));
        if ([(MDLVertexAttributeData *)v11 format])
        {
          long long v64 = 0u;
          long long v65 = 0u;
          id v12 = +[NSMutableData data];
          v13 = +[NSData dataWithBytes:[(MDLVertexAttributeData *)v11 dataStart] length:[(MDLVertexAttributeData *)v11 stride] * v45];
          *(void *)&long long v64 = [(MDLVertexAttributeData *)v11 format];
          *((void *)&v64 + 1) = [(MDLVertexAttributeData *)v11 stride];
          *(void *)&long long v65 = [v10 offset];
          DWORD2(v65) = [v10 bufferIndex];
          HIDWORD(v65) = objc_msgSend(objc_msgSend(v10, "name"), "length");
          [v12 appendBytes:&v64 length:32];
          id v14 = objc_msgSend(objc_msgSend(v10, "name"), "UTF8String");
          [v12 appendBytes:v14 length:HIDWORD(v65)];
          [v12 appendData:v13];
          [v47 addObject:v12];
          uint64_t v74 = ++v7;
        }
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v82 count:16];
    }
    while (v6);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v15 = [(MDLVertexDescriptor *)[(MDLMesh *)v46->_mesh vertexDescriptor] layouts];
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v61;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v61 != v19) {
          objc_enumerationMutation(v15);
        }
        id v21 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        if ([v21 stride])
        {
          *(void *)&long long v64 = 0;
          id v22 = +[NSMutableData data];
          *(void *)&long long v64 = [v21 stride];
          [v22 appendBytes:&v64 length:8];
          [v47 addObject:v22];
          uint64_t v75 = ++v18;
        }
      }
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v60 objects:v81 count:16];
    }
    while (v17);
  }
  [a3 appendBytes:&v71 length:52];
  id v23 = [v43 UTF8String];
  [a3 appendBytes:v23 length:v72];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v24 = [v47 countByEnumeratingWithState:&v56 objects:v80 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v57;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v57 != v26) {
          objc_enumerationMutation(v47);
        }
        [a3 appendData:*(void *)(*((void *)&v56 + 1) + 8 * (void)k)];
      }
      id v25 = [v47 countByEnumeratingWithState:&v56 objects:v80 count:16];
    }
    while (v25);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v28 = [(MDLMesh *)v46->_mesh vertexBuffers];
  id v29 = [(NSArray *)v28 countByEnumeratingWithState:&v52 objects:v79 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v53;
    do
    {
      for (m = 0; m != v30; m = (char *)m + 1)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v52 + 1) + 8 * (void)m);
        *(void *)&long long v64 = 0;
        *(void *)&long long v64 = [v33 length];
        [a3 appendBytes:&v64 length:8];
        objc_msgSend(a3, "appendData:", objc_msgSend(v33, "data"));
      }
      id v30 = [(NSArray *)v28 countByEnumeratingWithState:&v52 objects:v79 count:16];
    }
    while (v30);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  submeshKeys = v46->_submeshKeys;
  id v35 = [(NSMutableArray *)submeshKeys countByEnumeratingWithState:&v48 objects:v78 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v49;
    do
    {
      for (n = 0; n != v36; n = (char *)n + 1)
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(submeshKeys);
        }
        id v39 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)n) keyList];
        unsigned int v70 = 4 * CUIRenditionKeyTokenCount((uint64_t)v39) + 4;
        [a3 appendBytes:&v70 length:4];
        [a3 appendBytes:v39 length:v70];
      }
      id v36 = [(NSMutableArray *)submeshKeys countByEnumeratingWithState:&v48 objects:v78 count:16];
    }
    while (v36);
  }

  return (unint64_t)[a3 length] - v42;
}

@end