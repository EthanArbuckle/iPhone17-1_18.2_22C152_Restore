@interface SCNGeometrySource
+ (BOOL)supportsSecureCoding;
+ (SCNGeometrySource)geometrySourceWithBuffer:(id)buffer vertexFormat:(MTLVertexFormat)vertexFormat semantic:(SCNGeometrySourceSemantic)semantic vertexCount:(NSInteger)vertexCount dataOffset:(NSInteger)offset dataStride:(NSInteger)stride;
+ (SCNGeometrySource)geometrySourceWithColorComponents:(const float *)a3 count:(int64_t)a4 hasAlpha:(BOOL)a5 colorSpace:(CGColorSpace *)a6;
+ (SCNGeometrySource)geometrySourceWithColorData:(id)a3 colorSpace:(CGColorSpace *)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10;
+ (SCNGeometrySource)geometrySourceWithData:(NSData *)data semantic:(SCNGeometrySourceSemantic)semantic vectorCount:(NSInteger)vectorCount floatComponents:(BOOL)floatComponents componentsPerVector:(NSInteger)componentsPerVector bytesPerComponent:(NSInteger)bytesPerComponent dataOffset:(NSInteger)offset dataStride:(NSInteger)stride;
+ (SCNGeometrySource)geometrySourceWithMDLVertexAttribute:(id)a3 mesh:(id)a4;
+ (SCNGeometrySource)geometrySourceWithMeshSourceRef:(__C3DMeshSource *)a3;
+ (SCNGeometrySource)geometrySourceWithNormals:(const SCNVector3 *)normals count:(NSInteger)count;
+ (SCNGeometrySource)geometrySourceWithTextureCoordinates:(const CGPoint *)texcoord count:(NSInteger)count;
+ (SCNGeometrySource)geometrySourceWithVertices:(const SCNVector3 *)vertices count:(NSInteger)count;
+ (id)_geometrySourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9;
+ (id)_geometrySourceWithSource:(id)a3 vertexFormat:(unint64_t)a4;
+ (id)dataByConvertingDoublesToFloats:(const double *)a3 count:(int64_t)a4;
+ (id)dataWithPointArray:(const CGPoint *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5;
+ (id)dataWithVector3Array:(const SCNVector3 *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5;
- (BOOL)_encodeDataAsHalf;
- (BOOL)floatComponents;
- (NSData)data;
- (NSInteger)bytesPerComponent;
- (NSInteger)componentsPerVector;
- (NSInteger)dataOffset;
- (NSInteger)dataStride;
- (NSInteger)vectorCount;
- (SCNGeometrySource)init;
- (SCNGeometrySource)initWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8;
- (SCNGeometrySource)initWithCoder:(id)a3;
- (SCNGeometrySource)initWithData:(id)a3 semantic:(id)a4 colorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 floatComponents:(BOOL)a7 componentsPerVector:(int64_t)a8 bytesPerComponent:(int64_t)a9 dataOffset:(int64_t)a10 dataStride:(int64_t)a11;
- (SCNGeometrySource)initWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9;
- (SCNGeometrySource)initWithMeshSource:(__C3DMeshSource *)a3;
- (SCNGeometrySourceSemantic)semantic;
- (__C3DMeshSource)meshSource;
- (__C3DScene)sceneRef;
- (id)_uninterleaveData:(id)a3 count:(unint64_t)a4 srcOffset:(unint64_t)a5 srcStride:(unint64_t)a6 dstStride:(unint64_t)a7;
- (id)dataByConvertingColorData:(id)a3 colorSpace:(CGColorSpace *)a4 newColorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10 newDataOffset:(int64_t *)a11 newDataStride:(int64_t *)a12;
- (id)description;
- (id)mkSemantic;
- (id)scene;
- (signed)_componentType;
- (void)_clearC3DCache;
- (void)_printData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)meshSource;
- (void)setMkSemantic:(id)a3;
- (void)set_encodeDataAsHalf:(BOOL)a3;
@end

@implementation SCNGeometrySource

void __28__SCNGeometrySource_dealloc__block_invoke(uint64_t a1)
{
}

+ (SCNGeometrySource)geometrySourceWithMDLVertexAttribute:(id)a3 mesh:(id)a4
{
  v6 = (void *)[a4 vertexDescriptor];
  unsigned int v7 = ([a3 format] >> 16) & 0xF;
  if (v7 >= 5)
  {
    BOOL v8 = 0;
    uint64_t v9 = 2;
    if (v7 >= 9)
    {
      unsigned int v10 = v7 - 11;
      if (v10)
      {
        BOOL v8 = v10 < 0xFFFFFFFE;
        uint64_t v9 = 4;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
    uint64_t v9 = 1;
  }
  v11 = (void *)[a3 name];
  char v12 = [v11 containsString:*MEMORY[0x263F135C8]];
  v13 = (void *)MEMORY[0x263F13598];
  if (v12)
  {
    v14 = &SCNGeometrySourceSemanticVertex;
  }
  else
  {
    if (([v11 containsString:*MEMORY[0x263F135B8]] & 1) == 0)
    {
      if ([v11 containsString:*MEMORY[0x263F135D8]])
      {
        v14 = &SCNGeometrySourceSemanticTexcoord;
        goto LABEL_14;
      }
      if ([v11 containsString:*MEMORY[0x263F135D0]])
      {
        v14 = &SCNGeometrySourceSemanticTangent;
        goto LABEL_14;
      }
      v15 = @"aoCoord";
      if (([v11 isEqualToString:@"aoCoord"] & 1) != 0
        || (v15 = @"lightmapCoord", ([v11 isEqualToString:@"lightmapCoord"] & 1) != 0))
      {
        v14 = &SCNGeometrySourceSemanticTexcoord;
        goto LABEL_15;
      }
      if (([v11 containsString:*v13] & 1) != 0
        || ([v11 containsString:*MEMORY[0x263F135C0]] & 1) != 0)
      {
        v14 = &SCNGeometrySourceSemanticColor;
        goto LABEL_14;
      }
      v53 = scn_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        +[SCNGeometrySource(SCNModelIO) geometrySourceWithMDLVertexAttribute:mesh:]((uint64_t)v11, v53);
      }
    }
    v14 = &SCNGeometrySourceSemanticNormal;
  }
LABEL_14:
  v15 = @"unknown";
LABEL_15:
  SCNGeometrySourceSemantic v16 = *v14;
  unint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "stride");
  char v18 = [a3 format];
  uint64_t v19 = [a3 offset];
  if (!objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", *v13)
    || [a3 format] != 65540)
  {
    uint64_t v27 = v18 & 7;
    uint64_t v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexBuffers"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "map"), "bytes");
    uint64_t v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexBuffers"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "length");
    v30 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:v28 length:v29];
    if (v30) {
      goto LABEL_38;
    }
    return 0;
  }
  uint64_t v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexBuffers"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "map"), "bytes");
  unint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexBuffers"), "objectAtIndexedSubscript:", objc_msgSend(a3, "bufferIndex")), "length");
  if ([a3 format] == 786436)
  {
    __p = 0;
    v55 = 0;
    uint64_t v56 = 0;
    if (v21 >= 0x10)
    {
      unint64_t v22 = v21 >> 4;
      std::vector<unsigned char>::__append((unint64_t *)&__p, 4 * v22);
      uint64_t v23 = 0;
      if (v22 <= 1) {
        uint64_t v24 = 1;
      }
      else {
        uint64_t v24 = v22;
      }
      uint64_t v25 = 4 * v24;
      v26 = (float *)(v20 + 8);
      do
      {
        *((unsigned char *)__p + v23) = (int)(float)(*(v26 - 2) * 255.0);
        *((unsigned char *)__p + v23 + 1) = (int)(float)(*(v26 - 1) * 255.0);
        *((unsigned char *)__p + v23 + 2) = (int)(float)(*v26 * 255.0);
        *((unsigned char *)__p + v23 + 3) = (int)(float)(v26[1] * 255.0);
        v23 += 4;
        v26 += 4;
      }
      while (v25 != v23);
    }
LABEL_34:
    v30 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:__p length:v55 - (unsigned char *)__p];
    if (__p)
    {
      v55 = __p;
      operator delete(__p);
    }
    uint64_t v19 = 0;
    BOOL v8 = 0;
    unint64_t v17 = 4;
    uint64_t v9 = 1;
    goto LABEL_37;
  }
  if ([a3 format] == 786435)
  {
    __p = 0;
    v55 = 0;
    uint64_t v56 = 0;
    if (v21 >= 0xC)
    {
      unint64_t v31 = v21 / 0xC;
      std::vector<unsigned char>::__append((unint64_t *)&__p, 4 * v31);
      uint64_t v32 = 0;
      if (v31 <= 1) {
        uint64_t v33 = 1;
      }
      else {
        uint64_t v33 = v31;
      }
      uint64_t v34 = 4 * v33;
      v35 = (float *)(v20 + 4);
      do
      {
        *((unsigned char *)__p + v32) = (int)(float)(*(v35 - 1) * 255.0);
        *((unsigned char *)__p + v32 + 1) = (int)(float)(*v35 * 255.0);
        *((unsigned char *)__p + v32 + 2) = (int)(float)(v35[1] * 255.0);
        *((unsigned char *)__p + v32 + 3) = -1;
        v32 += 4;
        v35 += 3;
      }
      while (v34 != v32);
    }
    goto LABEL_34;
  }
  if ([a3 format] == 65539)
  {
    __p = 0;
    v55 = 0;
    uint64_t v56 = 0;
    std::vector<float>::resize((uint64_t)&__p, 4 * (v21 / 3));
    v39 = __p;
    if (v21 >= 3)
    {
      if (v21 / 3 <= 1) {
        unint64_t v40 = 1;
      }
      else {
        unint64_t v40 = v21 / 3;
      }
      v41 = (float *)((char *)__p + 8);
      v42 = (unsigned char *)(v20 + 2);
      do
      {
        LOBYTE(v38) = *(v42 - 2);
        *(float *)&unsigned int v43 = (float)LODWORD(v38) / 255.0;
        *(v41 - 2) = *(float *)&v43;
        LOBYTE(v43) = *(v42 - 1);
        *(float *)&unsigned int v44 = (float)v43 / 255.0;
        *(v41 - 1) = *(float *)&v44;
        LOBYTE(v44) = *v42;
        float v38 = (float)v44 / 255.0;
        float *v41 = v38;
        v41[1] = 1.0;
        v41 += 4;
        v42 += 3;
        --v40;
      }
      while (v40);
    }
  }
  else
  {
    if ([a3 format] != 65540) {
      return 0;
    }
    __p = 0;
    v55 = 0;
    uint64_t v56 = 0;
    std::vector<float>::resize((uint64_t)&__p, v21 & 0xFFFFFFFFFFFFFFFCLL);
    v39 = __p;
    if (v21 >= 4)
    {
      uint64_t v46 = v21 >> 2;
      if (v21 >> 2 <= 1) {
        uint64_t v46 = 1;
      }
      v47 = (unsigned char *)(v20 + 3);
      v48 = (float *)((char *)__p + 8);
      do
      {
        LOBYTE(v45) = *(v47 - 3);
        *(float *)&unsigned int v49 = (float)LODWORD(v45) / 255.0;
        *(v48 - 2) = *(float *)&v49;
        LOBYTE(v49) = *(v47 - 2);
        *(float *)&unsigned int v50 = (float)v49 / 255.0;
        *(v48 - 1) = *(float *)&v50;
        LOBYTE(v50) = *(v47 - 1);
        *(float *)&unsigned int v51 = (float)v50 / 255.0;
        float *v48 = *(float *)&v51;
        LOBYTE(v51) = *v47;
        float v45 = (float)v51 / 255.0;
        v48[1] = v45;
        v47 += 4;
        v48 += 4;
        --v46;
      }
      while (v46);
    }
  }
  v30 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:v39 length:v55 - v39];
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  uint64_t v19 = 0;
  BOOL v8 = 1;
  unint64_t v17 = 16;
  uint64_t v9 = 4;
LABEL_37:
  uint64_t v27 = 4;
  if (!v30) {
    return 0;
  }
LABEL_38:
  unint64_t v36 = [v30 length] / v17;
  if ((C3DWasLinkedBeforeMajorOSYear2018() & 1) == 0
    && [(NSString *)v16 isEqualToString:@"kGeometrySourceSemanticTexcoord"])
  {
    flip_UVs((MDLVertexFormat)[a3 format], (char *)objc_msgSend(v30, "bytes"), v19, v17, v36);
  }
  v37 = +[SCNGeometrySource geometrySourceWithData:v30 semantic:v16 vectorCount:v36 floatComponents:v8 componentsPerVector:v27 bytesPerComponent:v9 dataOffset:v19 dataStride:v17];
  [(SCNGeometrySource *)v37 setMkSemantic:v15];
  return v37;
}

- (void)setMkSemantic:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x263F13580]])
  {
    char v5 = 0;
  }
  else if ([a3 isEqualToString:*MEMORY[0x263F135C8]])
  {
    char v5 = 1;
  }
  else if ([a3 isEqualToString:*MEMORY[0x263F135D8]])
  {
    char v5 = 2;
  }
  else if ([a3 isEqualToString:*MEMORY[0x263F135B8]])
  {
    char v5 = 3;
  }
  else if ([a3 isEqualToString:@"aoCoord"])
  {
    char v5 = 4;
  }
  else if ([a3 isEqualToString:*MEMORY[0x263F13598]])
  {
    char v5 = 5;
  }
  else if ([a3 isEqualToString:*MEMORY[0x263F135C0]])
  {
    char v5 = 6;
  }
  else if ([a3 isEqualToString:*MEMORY[0x263F135D0]])
  {
    char v5 = 7;
  }
  else if ([a3 isEqualToString:*MEMORY[0x263F13588]])
  {
    char v5 = 8;
  }
  else if ([a3 isEqualToString:@"lightmapCoord"])
  {
    char v5 = 9;
  }
  else
  {
    char v5 = 0;
  }
  self->_mkSemantic = v5;
  meshSource = self->_meshSource;
  if (meshSource)
  {
    C3DMeshSourceSetModelKitSemantic((uint64_t)meshSource, v5);
  }
}

+ (SCNGeometrySource)geometrySourceWithData:(NSData *)data semantic:(SCNGeometrySourceSemantic)semantic vectorCount:(NSInteger)vectorCount floatComponents:(BOOL)floatComponents componentsPerVector:(NSInteger)componentsPerVector bytesPerComponent:(NSInteger)bytesPerComponent dataOffset:(NSInteger)offset dataStride:(NSInteger)stride
{
  unsigned int v10 = (void *)[objc_alloc((Class)a1) initWithData:data semantic:semantic colorSpace:0 vectorCount:vectorCount floatComponents:floatComponents componentsPerVector:componentsPerVector bytesPerComponent:bytesPerComponent dataOffset:offset dataStride:stride];

  return (SCNGeometrySource *)v10;
}

- (SCNGeometrySource)initWithData:(id)a3 semantic:(id)a4 colorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 floatComponents:(BOOL)a7 componentsPerVector:(int64_t)a8 bytesPerComponent:(int64_t)a9 dataOffset:(int64_t)a10 dataStride:(int64_t)a11
{
  BOOL v12 = a7;
  int64_t v18 = a10;
  int64_t v19 = a11;
  if ((SCNGeometrySourceSemanticIsValid(a4) & 1) == 0)
  {
    unint64_t v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometrySource initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:]();
    }
    goto LABEL_11;
  }
  v25.receiver = self;
  v25.super_class = (Class)SCNGeometrySource;
  self = [(SCNGeometrySource *)&v25 init];
  if (self)
  {
    int64_t v20 = a9;
    if (a9 == 8)
    {
      if (v18 || v19 && 8 * a8 != v19)
      {
        unint64_t v21 = scn_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[SCNGeometrySource initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:]();
        }
LABEL_11:

        return 0;
      }
      a3 = (id)objc_msgSend((id)objc_opt_class(), "dataByConvertingDoublesToFloats:count:", objc_msgSend(a3, "bytes"), a8 * a6);
      int64_t v19 = 4 * a8;
      a11 = 4 * a8;
      int64_t v20 = 4;
    }
    if (a5 && [a4 isEqualToString:@"kGeometrySourceSemanticColor"]) {
      a3 = [(SCNGeometrySource *)self dataByConvertingColorData:a3 colorSpace:a5 newColorSpace:&self->_colorSpace vectorCount:a6 componentsPerVector:a8 bytesPerComponent:v20 dataOffset:v18 dataStride:v19 newDataOffset:&a10 newDataStride:&a11];
    }
    self->_data = (NSData *)a3;
    self->_semantic = (NSString *)[a4 copy];
    self->_vectorCount = a6;
    self->_componentType = C3DBaseTypeFromDescription(v20, 1, v12);
    self->_componentCount = a8;
    int64_t v23 = a11;
    if (!a11) {
      int64_t v23 = v20 * a8;
    }
    self->_dataOffset = a10;
    self->_dataStride = v23;
  }
  return self;
}

- (void)dealloc
{
  meshSource = self->_meshSource;
  if (meshSource)
  {
    C3DEntitySetObjCWrapper((uint64_t)meshSource, 0);
    v4 = self->_meshSource;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNGeometrySource_dealloc__block_invoke;
    v7[3] = &__block_descriptor_40_e8_v16__0d8l;
    v7[4] = v4;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v7];
  }

  colorSpace = self->_colorSpace;
  if (colorSpace)
  {
    CFRelease(colorSpace);
    self->_colorSpace = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SCNGeometrySource;
  [(SCNGeometrySource *)&v6 dealloc];
}

- (__C3DMeshSource)meshSource
{
  if (!self->_meshSource)
  {
    if (self->_componentType)
    {
      mtlBuffer = self->_mtlBuffer;
      __int16 v5 = SCNGeometrySourceSemanticToMeshSourceSemantic(self->_semantic);
      if (mtlBuffer) {
        objc_super v6 = (__C3DMeshSource *)C3DMeshSourceCreateWithMTLBuffer(v5, self->_mtlBuffer, self->_mtlVertexFormat, self->_vectorCount, self->_dataStride, self->_dataOffset);
      }
      else {
        objc_super v6 = (__C3DMeshSource *)C3DMeshSourceCreateWithData(v5, self->_data, self->_componentType, self->_componentCount, self->_vectorCount, self->_dataStride, self->_dataOffset);
      }
      self->_meshSource = v6;
      C3DMeshSourceSetModelKitSemantic((uint64_t)v6, self->_mkSemantic);
      meshSource = self->_meshSource;
      if (meshSource) {
        C3DEntitySetObjCWrapper((uint64_t)meshSource, self);
      }
    }
    else
    {
      unsigned int v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SCNGeometrySource meshSource]();
      }
    }
  }
  return self->_meshSource;
}

- (void)_clearC3DCache
{
  if (self->_data)
  {
    meshSource = self->_meshSource;
    if (meshSource)
    {
      if (!C3DMeshSourceOwnsItsData((uint64_t)meshSource))
      {
        v4 = self->_meshSource;
        if (v4)
        {
          C3DEntitySetObjCWrapper((uint64_t)v4, 0);
          __int16 v5 = self->_meshSource;
          if (v5)
          {
            CFRelease(v5);
            self->_meshSource = 0;
          }
        }
      }
    }
  }
}

+ (SCNGeometrySource)geometrySourceWithMeshSourceRef:(__C3DMeshSource *)a3
{
  result = (SCNGeometrySource *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    objc_super v6 = (void *)[objc_alloc((Class)a1) initWithMeshSource:a3];
    return (SCNGeometrySource *)v6;
  }
  return result;
}

- (SCNGeometrySource)initWithMeshSource:(__C3DMeshSource *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SCNGeometrySource;
  v4 = [(SCNGeometrySource *)&v11 init];
  if (a3)
  {
    v4->_meshSource = (__C3DMeshSource *)CFRetain(a3);
    v4->_data = (NSData *)(id)C3DMeshSourceGetData(a3);
    C3DMeshSourceGetContent((uint64_t)a3);
    unint64_t v6 = v5;
    unsigned int Semantic = C3DMeshSourceGetSemantic((uint64_t)a3);
    if (Semantic > 8) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = off_264009EA8[Semantic];
    }
    v4->_semantic = (NSString *)v8;
    v4->_vectorCount = v6;
    v4->_componentType = BYTE6(v6);
    v4->_componentCount = HIBYTE(v6);
    v4->_mkunsigned int Semantic = C3DMeshSourceGetModelKitSemantic((uint64_t)a3);
    C3DEntitySetObjCWrapper((uint64_t)a3, v4);
    uint64_t Accessor = C3DMeshSourceGetAccessor(a3);
    v4->_dataOffset = C3DSourceAccessorGetOffset(Accessor);
    v4->_dataStride = C3DSceneSourceGetLibrary(Accessor);
  }
  return v4;
}

- (SCNGeometrySource)init
{
  return [(SCNGeometrySource *)self initWithMeshSource:0];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  return (id)[v3 stringWithFormat:@"<%@: %p | semantic=%@ vectors=%d %@x%d>", v5, self, -[SCNGeometrySource semantic](self, "semantic"), -[SCNGeometrySource vectorCount](self, "vectorCount"), C3DBaseTypeStringDescription(self->_componentType), -[SCNGeometrySource componentsPerVector](self, "componentsPerVector")];
}

+ (id)dataByConvertingDoublesToFloats:(const double *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  int64_t v6 = 4 * a4;
  unsigned int v7 = (float *)malloc_type_malloc(4 * a4, 0xF32501EDuLL);
  BOOL v8 = v7;
  if (v4 >= 1)
  {
    uint64_t v9 = v7;
    do
    {
      double v10 = *a3++;
      float v11 = v10;
      *v9++ = v11;
      --v4;
    }
    while (v4);
  }
  BOOL v12 = (void *)MEMORY[0x263EFF8F8];

  return (id)[v12 dataWithBytesNoCopy:v8 length:v6 freeWhenDone:1];
}

+ (id)dataWithVector3Array:(const SCNVector3 *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5
{
  if (a5) {
    *a5 = 4;
  }
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:a3 length:12 * a4];
}

+ (id)dataWithPointArray:(const CGPoint *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5
{
  int64_t v5 = a4;
  if (a5) {
    *a5 = 4;
  }
  int64_t v7 = 8 * a4;
  BOOL v8 = (float32x2_t *)malloc_type_malloc(8 * a4, 0xBDF142ABuLL);
  uint64_t v9 = v8;
  if (v5 >= 1)
  {
    double v10 = v8;
    do
    {
      float64x2_t v11 = *(float64x2_t *)a3++;
      *v10++ = vcvt_f32_f64(v11);
      --v5;
    }
    while (v5);
  }
  BOOL v12 = (void *)MEMORY[0x263EFF8F8];

  return (id)[v12 dataWithBytesNoCopy:v9 length:v7 freeWhenDone:1];
}

- (SCNGeometrySource)initWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9
{
  unsigned __int16 v10 = a7;
  int v11 = a6;
  if (SCNGeometrySourceSemanticIsValid(a4))
  {
    v20.receiver = self;
    v20.super_class = (Class)SCNGeometrySource;
    SCNGeometrySourceSemantic v16 = [(SCNGeometrySource *)&v20 init];
    if (v16)
    {
      int64_t v17 = a9;
      v16->_data = (NSData *)a3;
      v16->_semantic = (NSString *)[a4 copy];
      v16->_vectorCount = a5;
      v16->_componentType = v11;
      v16->_componentCount = v10;
      v16->_dataOffset = a8;
      if (!a9) {
        int64_t v17 = C3DSizeOfBaseType(v11) * v16->_componentCount;
      }
      v16->_dataStride = v17;
    }
  }
  else
  {
    int64_t v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometrySource initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:]();
    }

    return 0;
  }
  return v16;
}

- (SCNGeometrySource)initWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8
{
  if (SCNGeometrySourceSemanticIsValid(a5))
  {
    v19.receiver = self;
    v19.super_class = (Class)SCNGeometrySource;
    v15 = [(SCNGeometrySource *)&v19 init];
    if (v15)
    {
      v15->_mtlBuffer = (MTLBuffer *)a3;
      v15->_semantic = (NSString *)[a5 copy];
      v15->_vectorCount = a6;
      v15->_mtlVertexFormat = a4;
      unsigned int v16 = SCNMTLVertexFormatToC3DBaseType(a4);
      v15->_componentType = C3DBaseTypeGetComponentType(v16);
      v15->_componentCount = C3DBaseTypeGetComponentCount(v16);
      v15->_dataOffset = a7;
      if (!a8) {
        a8 = C3DSizeOfBaseType(v16);
      }
      v15->_dataStride = a8;
    }
  }
  else
  {
    int64_t v17 = scn_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometrySource initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:]();
    }

    return 0;
  }
  return v15;
}

+ (id)_geometrySourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9
{
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithData:a3 semantic:a4 vectorCount:a5 componentType:a6 componentCount:a7 dataOffset:a8 dataStride:a9];

  return v9;
}

+ (SCNGeometrySource)geometrySourceWithVertices:(const SCNVector3 *)vertices count:(NSInteger)count
{
  uint64_t v8 = 0;
  uint64_t v6 = [a1 dataWithVector3Array:vertices count:count bytesPerComponent:&v8];
  return (SCNGeometrySource *)[a1 geometrySourceWithData:v6 semantic:@"kGeometrySourceSemanticVertex" vectorCount:count floatComponents:1 componentsPerVector:3 bytesPerComponent:v8 dataOffset:0 dataStride:0];
}

+ (SCNGeometrySource)geometrySourceWithNormals:(const SCNVector3 *)normals count:(NSInteger)count
{
  uint64_t v8 = 0;
  uint64_t v6 = [a1 dataWithVector3Array:normals count:count bytesPerComponent:&v8];
  return (SCNGeometrySource *)[a1 geometrySourceWithData:v6 semantic:@"kGeometrySourceSemanticNormal" vectorCount:count floatComponents:1 componentsPerVector:3 bytesPerComponent:v8 dataOffset:0 dataStride:0];
}

+ (SCNGeometrySource)geometrySourceWithTextureCoordinates:(const CGPoint *)texcoord count:(NSInteger)count
{
  uint64_t v8 = 0;
  uint64_t v6 = [a1 dataWithPointArray:texcoord count:count bytesPerComponent:&v8];
  return (SCNGeometrySource *)[a1 geometrySourceWithData:v6 semantic:@"kGeometrySourceSemanticTexcoord" vectorCount:count floatComponents:1 componentsPerVector:2 bytesPerComponent:v8 dataOffset:0 dataStride:0];
}

- (id)dataByConvertingColorData:(id)a3 colorSpace:(CGColorSpace *)a4 newColorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10 newDataOffset:(int64_t *)a11 newDataStride:(int64_t *)a12
{
  int64_t v17 = a12;
  int64_t v18 = a9;
  C3DGetColorTransformToGlobalColorSpace();
  ColorSpace = (CGColorSpace *)CGColorTransformGetColorSpace();
  objc_super v20 = *a5;
  if (*a5 != ColorSpace)
  {
    if (v20)
    {
      CFRelease(v20);
      *a5 = 0;
    }
    if (ColorSpace) {
      unint64_t v21 = (CGColorSpace *)CFRetain(ColorSpace);
    }
    else {
      unint64_t v21 = 0;
    }
    *a5 = v21;
  }
  if (CFEqual(a4, ColorSpace)) {
    goto LABEL_19;
  }
  int64_t v22 = a8 * a7;
  if (a10) {
    int64_t v23 = a10;
  }
  else {
    int64_t v23 = a8 * a7;
  }
  id v34 = a3;
  uint64_t v24 = [a3 bytes];
  int64_t v33 = v22 * a6;
  objc_super v25 = (char *)malloc_type_malloc(v22 * a6, 0x74179ECDuLL);
  if (!CGColorTransformConvertData())
  {
    free(v25);
    int64_t v18 = a9;
    int64_t v17 = a12;
    a3 = v34;
LABEL_19:
    *a11 = v18;
    *int64_t v17 = a10;
    return a3;
  }
  *a11 = 0;
  *a12 = v22;
  if (a7 == 4)
  {
    v26 = v25;
    if (a6 >= 1)
    {
      uint64_t v27 = v24;
      uint64_t v28 = &v25[3 * a8];
      uint64_t v29 = (char *)(v27 + 3 * a8 + a9);
      do
      {
        memcpy(v28, v29, a8);
        v28 += v22;
        v29 += v23;
        --a6;
      }
      while (a6);
    }
    v30 = (void *)MEMORY[0x263EFF8F8];
    unint64_t v31 = v26;
  }
  else
  {
    v30 = (void *)MEMORY[0x263EFF8F8];
    unint64_t v31 = v25;
  }

  return (id)[v30 dataWithBytesNoCopy:v31 length:v33 freeWhenDone:1];
}

+ (SCNGeometrySource)geometrySourceWithColorComponents:(const float *)a3 count:(int64_t)a4 hasAlpha:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  BOOL v7 = a5;
  C3DGetColorTransformToGlobalColorSpace();
  ColorSpace = (const void *)CGColorTransformGetColorSpace();
  if (!a6) {
    a6 = (CGColorSpace *)C3DColorSpaceSRGB();
  }
  if (v7) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 3;
  }
  if (CFEqual(a6, ColorSpace))
  {
    uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:4 * v12 * a4];
  }
  else
  {
    id v24 = a1;
    v14 = malloc_type_malloc(4 * v12 * a4, 0x556E0EF9uLL);
    LODWORD(v23) = 4 * v12;
    LODWORD(v22) = 4 * v12;
    if (CGColorTransformConvertData())
    {
      if (a4 >= 1 && v7)
      {
        v15 = v14 + 3;
        unsigned int v16 = a3 + 3;
        int64_t v17 = a4;
        do
        {
          int v18 = *(_DWORD *)v16;
          v16 += 4;
          _DWORD *v15 = v18;
          v15 += 4;
          --v17;
        }
        while (v17);
      }
      uint64_t v19 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v14, 4 * v12 * a4, 1, v22, v14, 96, v23);
    }
    else
    {
      free(v14);
      uint64_t v19 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a3, 4 * v12 * a4, v22, v14, 96, v23);
    }
    uint64_t v13 = v19;
    a1 = v24;
  }
  objc_super v20 = (void *)[objc_alloc((Class)a1) initWithData:v13 semantic:@"kGeometrySourceSemanticColor" colorSpace:ColorSpace vectorCount:a4 floatComponents:1 componentsPerVector:v12 bytesPerComponent:4 dataOffset:0 dataStride:4 * v12];

  return (SCNGeometrySource *)v20;
}

+ (SCNGeometrySource)geometrySourceWithColorData:(id)a3 colorSpace:(CGColorSpace *)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10
{
  unsigned __int16 v10 = (void *)[objc_alloc((Class)a1) initWithData:a3 semantic:@"kGeometrySourceSemanticColor" colorSpace:a4 vectorCount:a5 floatComponents:a6 componentsPerVector:a7 bytesPerComponent:a8 dataOffset:a9 dataStride:a10];

  return (SCNGeometrySource *)v10;
}

+ (SCNGeometrySource)geometrySourceWithBuffer:(id)buffer vertexFormat:(MTLVertexFormat)vertexFormat semantic:(SCNGeometrySourceSemantic)semantic vertexCount:(NSInteger)vertexCount dataOffset:(NSInteger)offset dataStride:(NSInteger)stride
{
  if (vertexFormat)
  {
    uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithBuffer:buffer vertexFormat:vertexFormat semantic:semantic vertexCount:vertexCount dataOffset:offset dataStride:stride];
    return (SCNGeometrySource *)v8;
  }
  else
  {
    unsigned __int16 v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SCNGeometrySource geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:]();
    }
    return 0;
  }
}

+ (id)_geometrySourceWithSource:(id)a3 vertexFormat:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  if (!a4)
  {
    unsigned __int16 v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SCNGeometrySource _geometrySourceWithSource:vertexFormat:]();
    }
    return 0;
  }
  unsigned int v6 = SCNMTLVertexFormatToC3DBaseType(a4);
  uint64_t CopyWithBaseType = C3DMeshSourceCreateCopyWithBaseType([a3 meshSource], v6, 0);
  if (!CopyWithBaseType)
  {
    NSLog(&cfstr_Geometrysource_1.isa);
    return 0;
  }
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithMeshSource:CopyWithBaseType];

  return v8;
}

- (BOOL)_encodeDataAsHalf
{
  return self->_encodeDataAsHalf;
}

- (void)set_encodeDataAsHalf:(BOOL)a3
{
  self->_encodeDataAsHalf = a3;
}

- (id)mkSemantic
{
  mkunsigned int Semantic = (char)self->_mkSemantic;
  if (mkSemantic > 9) {
    v3 = (id *)MEMORY[0x263F13598];
  }
  else {
    v3 = (id *)qword_264009EF0[mkSemantic];
  }
  return *v3;
}

- (NSData)data
{
  result = self->_data;
  if (!result)
  {
    result = (NSData *)self->_mtlBuffer;
    if (result)
    {
      int64_t v4 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v5 = [(NSData *)result contents];
      uint64_t v6 = [(MTLBuffer *)self->_mtlBuffer length];
      return (NSData *)[v4 dataWithBytesNoCopy:v5 length:v6 freeWhenDone:0];
    }
  }
  return result;
}

- (void)_printData
{
  v2 = [(SCNGeometrySource *)self meshSource];
  uint64_t Count = C3DMeshSourceGetCount((uint64_t)v2);

  C3DMeshSourcePrintData((uint64_t)v2, Count);
}

- (SCNGeometrySourceSemantic)semantic
{
  return self->_semantic;
}

- (NSInteger)vectorCount
{
  return self->_vectorCount;
}

- (BOOL)floatComponents
{
  return C3DBaseTypeIsFloatingValue(self->_componentType);
}

- (NSInteger)componentsPerVector
{
  return self->_componentCount;
}

- (NSInteger)bytesPerComponent
{
  return C3DBaseTypeGetBytesPerComponent(self->_componentType);
}

- (NSInteger)dataOffset
{
  return self->_dataOffset;
}

- (NSInteger)dataStride
{
  return self->_dataStride;
}

- (signed)_componentType
{
  return self->_componentType;
}

- (__C3DScene)sceneRef
{
  v2 = [(SCNGeometrySource *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNGeometrySource *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (id)_uninterleaveData:(id)a3 count:(unint64_t)a4 srcOffset:(unint64_t)a5 srcStride:(unint64_t)a6 dstStride:(unint64_t)a7
{
  unint64_t v10 = a4;
  unint64_t v12 = a7 * a4;
  uint64_t v13 = (void *)[MEMORY[0x263EFF990] dataWithCapacity:a7 * a4];
  [v13 setLength:v12];
  v14 = (char *)[v13 mutableBytes];
  uint64_t v15 = [a3 bytes];
  if (v10)
  {
    unsigned int v16 = (char *)(v15 + a5);
    do
    {
      memcpy(v14, v16, a7);
      v16 += a6;
      v14 += a7;
      --v10;
    }
    while (v10);
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  LOWORD(v5) = self->_componentType;
  int64_t dataOffset = self->_dataOffset;
  int64_t dataStride = self->_dataStride;
  uint64_t v8 = [(SCNGeometrySource *)self data];
  if (v8)
  {
    uint64_t v9 = v8;
    if (self->_encodeDataAsHalf && C3DSceneSourceGetSceneCount())
    {
      int componentType = (unsigned __int16)self->_componentType;
      if (componentType != (unsigned __int16)C3DBaseTypeGetComponentType((__int16)componentType))
      {
        int v11 = scn_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[SCNGeometrySource encodeWithCoder:].cold.5(v11, v12, v13, v14, v15, v16, v17, v18);
        }
      }
      if (self->_componentType == 15)
      {
        uint64_t v19 = v9;
      }
      else
      {
        if (self->_componentCount - 2 >= 3)
        {
          objc_super v25 = scn_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
            -[SCNGeometrySource encodeWithCoder:].cold.4(v25, v26, v27, v28, v29, v30, v31, v32);
          }
        }
        uint64_t CopyWithBaseType = (const void *)C3DMeshSourceCreateCopyWithBaseType((uint64_t)self->_meshSource, *(__int16 *)&asc_20B6A370A[2 * self->_componentCount - 4], 0);
        if (!CopyWithBaseType)
        {
          id v34 = scn_default_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
            -[SCNGeometrySource encodeWithCoder:](v34, v35, v36, v37, v38, v39, v40, v41);
          }
        }
        uint64_t Accessor = C3DMeshSourceGetAccessor(CopyWithBaseType);
        unsigned int ComponentsValueType = C3DSourceAccessorGetComponentsValueType(Accessor);
        int v5 = C3DBaseTypeGetComponentType(ComponentsValueType);
        int64_t dataStride = C3DSceneSourceGetLibrary(Accessor);
        int64_t dataOffset = C3DSourceAccessorGetOffset(Accessor);
        if (v5 != 15)
        {
          unsigned int v44 = scn_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
            -[SCNGeometrySource encodeWithCoder:](v44, v45, v46, v47, v48, v49, v50, v51);
          }
        }
        C3DSizeOfBaseType(v5);
        uint64_t v19 = (NSData *)(id)C3DMeshSourceGetData(CopyWithBaseType);
        CFRelease(CopyWithBaseType);
      }
      uint64_t v68 = vImageEncodeVectorOptionsCreate();
      vImageEncodeVectorOptionsSetQuantization();
      uint64_t v67 = 0;
      [(NSData *)v19 bytes];
      [(NSData *)v19 length];
      uint64_t v52 = vImageEncodeVectorHalf();

      if (!v52)
      {
        v53 = scn_default_log();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
          -[SCNGeometrySource encodeWithCoder:](v53, v54, v55, v56, v57, v58, v59, v60);
        }
      }
      vImageEncodeVectorOptionsFree();
      uint64_t v24 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v67 length:v52];
      uint64_t v22 = @"cdata";
      id v23 = a3;
    }
    else
    {
      NSInteger v20 = [(SCNGeometrySource *)self bytesPerComponent];
      int64_t v21 = [(SCNGeometrySource *)self componentsPerVector] * v20;
      if (v21 < self->_dataStride)
      {
        uint64_t v9 = -[SCNGeometrySource _uninterleaveData:count:srcOffset:srcStride:dstStride:](self, "_uninterleaveData:count:srcOffset:srcStride:dstStride:", v9, self->_vectorCount, self->_dataOffset);
        int64_t dataOffset = 0;
        int64_t dataStride = v21;
      }
      uint64_t v22 = @"data";
      id v23 = a3;
      uint64_t v24 = (uint64_t)v9;
    }
    [v23 encodeObject:v24 forKey:v22];
  }
  semantic = self->_semantic;
  if (semantic) {
    [a3 encodeObject:semantic forKey:@"semantic"];
  }
  [a3 encodeInteger:self->_vectorCount forKey:@"vectorCount"];
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  unsigned __int8 v66 = 0;
  if (C3DBaseTypeDescription((__int16)v5, &v68, &v67, &v66))
  {
    [a3 encodeBool:v66 forKey:@"floatComponents"];
    uint64_t v62 = v68;
    v63 = @"bytesPerComponent";
  }
  else
  {
    uint64_t v62 = (__int16)v5;
    v63 = @"componentType";
  }
  [a3 encodeInteger:v62 forKey:v63];
  [a3 encodeInteger:self->_componentCount forKey:@"componentsPerVector"];
  [a3 encodeInteger:dataOffset forKey:@"dataOffset"];
  [a3 encodeInteger:dataStride forKey:@"dataStride"];
  [a3 encodeInt:self->_mkSemantic forKey:@"mkSemantic"];
  colorSpace = self->_colorSpace;
  if (colorSpace)
  {
    CFPropertyListRef v65 = CGColorSpaceCopyPropertyList(colorSpace);
    [a3 encodeObject:v65 forKey:@"colorSpace"];
    CFRelease(v65);
  }
}

- (SCNGeometrySource)initWithCoder:(id)a3
{
  v50.receiver = self;
  v50.super_class = (Class)SCNGeometrySource;
  int64_t v4 = [(SCNGeometrySource *)&v50 init];
  if (!v4) {
    return v4;
  }
  BOOL v5 = +[SCNTransaction immediateMode];
  +[SCNTransaction setImmediateMode:1];
  uint64_t v6 = objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"semantic");
  if ((SCNGeometrySourceSemanticIsValid(v6) & 1) == 0)
  {
    uint64_t v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometrySource initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:]();
    }
    goto LABEL_43;
  }
  v4->_semantic = (NSString *)v6;
  v4->_vectoruint64_t Count = [a3 decodeIntegerForKey:@"vectorCount"];
  v4->_int64_t dataOffset = [a3 decodeIntegerForKey:@"dataOffset"];
  v4->_int64_t dataStride = [a3 decodeIntegerForKey:@"dataStride"];
  v4->_componentuint64_t Count = [a3 decodeIntegerForKey:@"componentsPerVector"];
  unsigned __int16 v7 = [a3 decodeIntegerForKey:@"componentType"];
  v4->_int componentType = v7;
  if (v7)
  {
    if (v7 >= 0x2Eu)
    {
      uint64_t v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SCNGeometrySource initWithCoder:].cold.8();
      }
      goto LABEL_44;
    }
  }
  else
  {
    v4->_int componentType = C3DBaseTypeFromDescription([a3 decodeIntegerForKey:@"bytesPerComponent"], 1, objc_msgSend(a3, "decodeBoolForKey:", @"floatComponents"));
  }
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"cdata"];
  v4->_encodeDataAsHalf = v10 != 0;
  if (v10)
  {
    int v11 = (void *)v10;
    if (!C3DSceneSourceGetSceneCount())
    {
      uint64_t v30 = scn_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[SCNGeometrySource initWithCoder:].cold.7();
      }
      goto LABEL_29;
    }
    int componentType = (unsigned __int16)v4->_componentType;
    unsigned __int16 v13 = C3DBaseTypeGetComponentType((__int16)componentType);
    BOOL v14 = componentType != v13;
    if (componentType != v13)
    {
      uint64_t v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SCNGeometrySource initWithCoder:].cold.6();
      }
    }
    if (v4->_componentType != 15)
    {
      uint64_t v16 = scn_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SCNGeometrySource initWithCoder:].cold.5();
      }
      BOOL v14 = 1;
    }
    if (v4->_componentCount - 2 >= 3)
    {
      uint64_t v41 = scn_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[SCNGeometrySource initWithCoder:].cold.4();
      }
      goto LABEL_43;
    }
    if (v14)
    {
LABEL_43:
      +[SCNTransaction setImmediateMode:v5];
LABEL_44:

      return 0;
    }
    C3DSizeOfBaseType(v4->_componentType);
    size_t v17 = v4->_dataStride * v4->_vectorCount;
    uint64_t v18 = malloc_type_malloc(v17, 0x2915D644uLL);
    [v11 bytes];
    [v11 length];
    uint64_t v19 = v18;
    size_t v20 = v17;
    if (vImageDecodeVectorHalf() != v17)
    {
      int64_t v21 = scn_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[SCNGeometrySource initWithCoder:](v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    uint64_t v29 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v19 length:v20 freeWhenDone:1];
  }
  else
  {
    uint64_t v29 = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  }
  v4->_data = v29;
LABEL_29:
  uint64_t v31 = [(SCNGeometrySource *)v4 bytesPerComponent];
  uint64_t v32 = [(SCNGeometrySource *)v4 componentsPerVector];
  if ([(NSData *)v4->_data length] < v4->_dataOffset + v32 * v31 + (v4->_vectorCount - 1) * v4->_dataStride)
  {
    int64_t v33 = scn_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometrySource initWithCoder:]();
    }
    goto LABEL_43;
  }
  v4->_mkunsigned int Semantic = [a3 decodeIntForKey:@"mkSemantic"];
  id v34 = (const void *)[a3 decodePropertyListForKey:@"colorSpace"];
  if (v34)
  {
    CGColorSpaceRef v35 = CGColorSpaceCreateWithPropertyList(v34);
    if (v35)
    {
      CGColorSpaceRef v36 = v35;
      v4->_data = (NSData *)[(SCNGeometrySource *)v4 dataByConvertingColorData:v4->_data colorSpace:v35 newColorSpace:&v4->_colorSpace vectorCount:v4->_vectorCount componentsPerVector:v4->_componentCount bytesPerComponent:C3DBaseTypeGetBytesPerComponent(v4->_componentType) dataOffset:v4->_dataOffset dataStride:v4->_dataStride newDataOffset:&v4->_dataOffset newDataStride:&v4->_dataStride];
      CFRelease(v36);
    }
  }
  if (!C3DMetalIsSupported() || C3DPreferencesGetBool(0))
  {
    unsigned int v37 = (unsigned __int16)v4->_componentType;
    if (v37 <= 0x18 && ((1 << v37) & 0x1808000) != 0)
    {
      uint64_t v38 = [(SCNGeometrySource *)v4 meshSource];
      unsigned int Semantic = C3DMeshSourceGetSemantic(v38);
      if ((unsigned __int16)v4->_componentType - 23 >= 2)
      {
        componentuint64_t Count = v4->_componentCount;
      }
      else
      {
        componentuint64_t Count = 4;
        v4->_componentuint64_t Count = 4;
      }
      if (componentCount == 4 && Semantic <= 1)
      {
        componentuint64_t Count = 3;
        v4->_componentuint64_t Count = 3;
      }
      unsigned int CompoundType = C3DBaseTypeGetCompoundType(1, componentCount);
      uint64_t CopyWithBaseType = C3DMeshSourceCreateCopyWithBaseType(v38, CompoundType, 0);
      if (CopyWithBaseType)
      {
        uint64_t v45 = CopyWithBaseType;
        meshSource = v4->_meshSource;
        if (meshSource) {
          CFRelease(meshSource);
        }
        v4->_meshSource = (__C3DMeshSource *)v45;

        v4->_data = (NSData *)(id)C3DMeshSourceGetData(v45);
        C3DMeshSourceGetContent(v45);
        v4->_int componentType = 1;
        v4->_componentuint64_t Count = HIBYTE(v47);
        C3DEntitySetObjCWrapper(v45, v4);
        uint64_t Accessor = C3DMeshSourceGetAccessor(v45);
        v4->_int64_t dataOffset = C3DSourceAccessorGetOffset(Accessor);
        v4->_int64_t dataStride = C3DSceneSourceGetLibrary(Accessor);
      }
      else
      {
        uint64_t v49 = scn_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[SCNGeometrySource initWithCoder:]();
        }
      }
    }
  }
  +[SCNTransaction setImmediateMode:v5];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: geometrySourceWithData: interleaved buffers as doubles are not supported", v2, v3, v4, v5, v6);
}

- (void)initWithData:semantic:colorSpace:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Geometry source has invalid semantic", v2, v3, v4, v5, v6);
}

+ (void)geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: geometrySourceWithBuffer - invalid vertex format", v2, v3, v4, v5, v6);
}

+ (void)_geometrySourceWithSource:vertexFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _geometrySourceWithSource - invalid vertex format", v2, v3, v4, v5, v6);
}

- (void)meshSource
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not create mesh source", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Geometry source has invalid bounds", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _geometrySourceWithSource - Conversion failed", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: vImageEncodeVectorHalf only supports half2/3/4", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Data is marked as compressed but does not contain half components", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: SCNGeometrySource should only store a base type", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Failed to decompress data because vImageDecodeVectorHalf is not available", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Unknown component type", v2, v3, v4, v5, v6);
}

@end