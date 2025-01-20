@interface SCNGeometryElement
+ (BOOL)supportsSecureCoding;
+ (SCNGeometryElement)geometryElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8;
+ (SCNGeometryElement)geometryElementWithBuffer:(id)buffer primitiveType:(SCNGeometryPrimitiveType)primitiveType primitiveCount:(NSInteger)primitiveCount bytesPerIndex:(NSInteger)bytesPerIndex;
+ (SCNGeometryElement)geometryElementWithData:(NSData *)data primitiveType:(SCNGeometryPrimitiveType)primitiveType primitiveCount:(NSInteger)primitiveCount bytesPerIndex:(NSInteger)bytesPerIndex;
+ (SCNGeometryElement)geometryElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8;
+ (SCNGeometryElement)geometryElementWithMDLSubmesh:(MDLSubmesh *)mdlSubMesh;
+ (id)_optimizedGeometryElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6;
+ (id)geometryElementWithMeshElementRef:(id *)a3;
- (BOOL)hasInterleavedIndicesChannels;
- (CGFloat)maximumPointScreenSpaceRadius;
- (CGFloat)minimumPointScreenSpaceRadius;
- (CGFloat)pointSize;
- (NSData)data;
- (NSInteger)bytesPerIndex;
- (NSInteger)primitiveCount;
- (NSRange)primitiveRange;
- (SCNGeometryElement)init;
- (SCNGeometryElement)initWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8;
- (SCNGeometryElement)initWithCoder:(id)a3;
- (SCNGeometryElement)initWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8;
- (SCNGeometryElement)initWithMeshElement:(const void *)a3;
- (SCNGeometryPrimitiveType)primitiveType;
- (__C3DMeshElement)meshElement;
- (__C3DScene)sceneRef;
- (double)_computeACMR;
- (id)description;
- (id)primitiveRanges;
- (id)scene;
- (int64_t)indicesChannelCount;
- (unint64_t)indexCount;
- (void)_optimizeTriangleIndices;
- (void)_printData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumPointScreenSpaceRadius:(CGFloat)maximumPointScreenSpaceRadius;
- (void)setMinimumPointScreenSpaceRadius:(CGFloat)minimumPointScreenSpaceRadius;
- (void)setPointSize:(CGFloat)pointSize;
- (void)setPrimitiveRange:(NSRange)primitiveRange;
- (void)setPrimitiveRanges:(id)a3;
@end

@implementation SCNGeometryElement

void __29__SCNGeometryElement_dealloc__block_invoke(uint64_t a1)
{
}

+ (SCNGeometryElement)geometryElementWithMDLSubmesh:(MDLSubmesh *)mdlSubMesh
{
  uint64_t v5 = [(MDLSubmesh *)mdlSubMesh faceIndexing];
  MDLGeometryType v6 = [(MDLSubmesh *)mdlSubMesh geometryType];
  if (!v5)
  {
    switch(v6)
    {
      case MDLGeometryTypePoints:
        goto LABEL_11;
      case MDLGeometryTypeLines:
        unint64_t v8 = [(MDLSubmesh *)mdlSubMesh indexCount] >> 1;
        uint64_t v9 = 2;
        break;
      case MDLGeometryTypeTriangles:
        uint64_t v9 = 0;
        unint64_t v8 = [(MDLSubmesh *)mdlSubMesh indexCount] / 3;
        break;
      case MDLGeometryTypeTriangleStrips:
        unint64_t v8 = [(MDLSubmesh *)mdlSubMesh indexCount] - 2;
        uint64_t v9 = 1;
        break;
      case MDLGeometryTypeQuads:
        unint64_t v8 = [(MDLSubmesh *)mdlSubMesh indexCount] >> 2;
        goto LABEL_16;
      case MDLGeometryTypeVariableTopology:
        unint64_t v8 = [(MDLSubmeshTopology *)[(MDLSubmesh *)mdlSubMesh topology] faceCount];
LABEL_16:
        uint64_t v9 = 4;
        break;
      default:
        v10 = scn_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          +[SCNGeometryElement(SCNModelIO) geometryElementWithMDLSubmesh:v12];
        }
LABEL_11:
        unint64_t v8 = [(MDLSubmesh *)mdlSubMesh indexCount];
        uint64_t v9 = 3;
        break;
    }
    unint64_t v13 = (unint64_t)[(MDLSubmesh *)mdlSubMesh indexType] >> 3;
    uint64_t v14 = objc_msgSend((id)objc_msgSend(-[MDLSubmesh indexBuffer](mdlSubMesh, "indexBuffer"), "map"), "bytes");
    uint64_t v15 = objc_msgSend(-[MDLSubmesh indexBuffer](mdlSubMesh, "indexBuffer"), "length");
    if ([(MDLSubmesh *)mdlSubMesh geometryType] == MDLGeometryTypeQuads)
    {
      v16 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:v15 + v13 * v8];
      [v16 setLength:v13 * v8];
      if (v8)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          switch(v13)
          {
            case 1uLL:
              *(unsigned char *)([v16 mutableBytes] + i) = 4;
              break;
            case 2uLL:
              *(_WORD *)([v16 mutableBytes] + 2 * i) = 4;
              break;
            case 4uLL:
              *(_DWORD *)([v16 mutableBytes] + 4 * i) = 4;
              break;
            case 8uLL:
              *(void *)([v16 mutableBytes] + 8 * i) = 4;
              break;
            default:
              continue;
          }
        }
      }
      [v16 appendBytes:v14 length:v15];
      id v18 = v16;
    }
    else
    {
      if ([(MDLSubmesh *)mdlSubMesh geometryType] == MDLGeometryTypeVariableTopology)
      {
        uint64_t v27 = v9;
        uint64_t v19 = objc_msgSend((id)objc_msgSend(-[MDLSubmeshTopology faceTopology](-[MDLSubmesh topology](mdlSubMesh, "topology"), "faceTopology"), "map"), "bytes");
        v20 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:v15 + v13 * v8];
        [v20 setLength:v13 * v8];
        if (v8)
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            switch(v13)
            {
              case 1uLL:
                char v22 = *(unsigned char *)(v19 + j);
                *(unsigned char *)([v20 mutableBytes] + j) = v22;
                break;
              case 2uLL:
                __int16 v23 = *(unsigned __int8 *)(v19 + j);
                *(_WORD *)([v20 mutableBytes] + 2 * j) = v23;
                break;
              case 4uLL:
                int v24 = *(unsigned __int8 *)(v19 + j);
                *(_DWORD *)([v20 mutableBytes] + 4 * j) = v24;
                break;
              case 8uLL:
                uint64_t v25 = *(unsigned __int8 *)(v19 + j);
                *(void *)([v20 mutableBytes] + 8 * j) = v25;
                break;
              default:
                continue;
            }
          }
        }
        [v20 appendBytes:v14 length:v15];
        id v26 = v20;
        uint64_t v9 = v27;
        return (SCNGeometryElement *)[a1 geometryElementWithData:v26 primitiveType:v9 primitiveCount:v8 bytesPerIndex:v13];
      }
      id v18 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:v14 length:v15];
    }
    id v26 = v18;
    return (SCNGeometryElement *)[a1 geometryElementWithData:v26 primitiveType:v9 primitiveCount:v8 bytesPerIndex:v13];
  }
  if (v6 != MDLGeometryTypeVariableTopology) {
    return 0;
  }

  return _indexedGeometryElement(mdlSubMesh);
}

+ (SCNGeometryElement)geometryElementWithData:(NSData *)data primitiveType:(SCNGeometryPrimitiveType)primitiveType primitiveCount:(NSInteger)primitiveCount bytesPerIndex:(NSInteger)bytesPerIndex
{
  MDLGeometryType v6 = (void *)[objc_alloc((Class)a1) initWithData:data primitiveType:primitiveType primitiveCount:primitiveCount indicesChannelCount:1 interleavedIndicesChannels:1 bytesPerIndex:bytesPerIndex];

  return (SCNGeometryElement *)v6;
}

- (SCNGeometryElement)initWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  v31.receiver = self;
  v31.super_class = (Class)SCNGeometryElement;
  uint64_t v14 = [(SCNGeometryElement *)&v31 init];
  if (!v14) {
    return v14;
  }
  if (a4 != 4) {
    goto LABEL_23;
  }
  if ([a3 length] < (unint64_t)(a8 * a5))
  {
    uint64_t v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      [(SCNGeometryElement *)v15 initWithData:v17 primitiveType:v18 primitiveCount:v19 indicesChannelCount:v20 interleavedIndicesChannels:v21 bytesPerIndex:v22];
    }
  }
  if (a5 < 1)
  {
LABEL_22:
    a3 = (id)objc_msgSend(a3, "subdataWithRange:", a8 * a5, objc_msgSend(a3, "length") - a8 * a5);
    a4 = 0;
    goto LABEL_23;
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  BOOL v25 = 1;
  while (1)
  {
    uint64_t v26 = [a3 bytes];
    switch(a8)
    {
      case 4:
        unint64_t v27 = *(unsigned int *)(v26 + v23);
        break;
      case 2:
        unint64_t v27 = *(unsigned __int16 *)(v26 + v23);
        break;
      case 1:
        unint64_t v27 = *(unsigned __int8 *)(v26 + v23);
        break;
      default:
        v30 = scn_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[SCNGeometryElement initWithData:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:](a8, v30);
        }
        goto LABEL_27;
    }
    if (v27 <= 2)
    {
      v28 = scn_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[SCNGeometryElement initWithData:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:](v27, v28);
      }
LABEL_27:

      return 0;
    }
    if (v27 != 3) {
      break;
    }
    BOOL v25 = ++v24 < a5;
    v23 += a8;
    if (a5 == v24) {
      goto LABEL_22;
    }
  }
  if (!v25) {
    goto LABEL_22;
  }
  a4 = 4;
LABEL_23:
  v14->_elementData = (NSData *)[a3 copy];
  v14->_primitiveType = a4;
  v14->_primitiveCount = a5;
  v14->_indicesChannelCount = a6;
  v14->_interleavedIndicesChannels = a7;
  v14->_bytesPerIndex = a8;
  return v14;
}

- (void)dealloc
{
  meshElement = self->_meshElement;
  if (meshElement)
  {
    C3DEntitySetObjCWrapper((uint64_t)meshElement, 0);
    v4 = self->_meshElement;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __29__SCNGeometryElement_dealloc__block_invoke;
    v6[3] = &__block_descriptor_40_e8_v16__0d8l;
    v6[4] = v4;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v6];
  }

  v5.receiver = self;
  v5.super_class = (Class)SCNGeometryElement;
  [(SCNGeometryElement *)&v5 dealloc];
}

- (__C3DMeshElement)meshElement
{
  result = self->_meshElement;
  if (!result)
  {
    v4 = (__C3DMeshElement *)C3DMeshElementCreate();
    self->_meshElement = v4;
    mtlBuffer = self->_mtlBuffer;
    char primitiveType = self->_primitiveType;
    int64_t primitiveCount = self->_primitiveCount;
    char indicesChannelCount = self->_indicesChannelCount;
    char interleavedIndicesChannels = self->_interleavedIndicesChannels;
    if (mtlBuffer) {
      C3DMeshElementInitIndexedWithMTLBuffer((uint64_t)v4, primitiveType, primitiveCount, indicesChannelCount, interleavedIndicesChannels, mtlBuffer, self->_bytesPerIndex);
    }
    else {
      C3DMeshElementInitIndexed((uint64_t)v4, primitiveType, primitiveCount, indicesChannelCount, interleavedIndicesChannels, self->_elementData, self->_bytesPerIndex);
    }
    __C3DMeshElementSetPrimitiveRanges((uint64_t)self->_meshElement, self->_primitiveRanges);
    result = self->_meshElement;
    if (result)
    {
      C3DEntitySetObjCWrapper((uint64_t)result, self);
      return self->_meshElement;
    }
  }
  return result;
}

- (int64_t)indicesChannelCount
{
  return self->_indicesChannelCount;
}

- (SCNGeometryElement)initWithMeshElement:(const void *)a3
{
  v20.receiver = a1;
  v20.super_class = (Class)SCNGeometryElement;
  v4 = [(SCNGeometryElement *)&v20 init];
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&v4->_pointSize = _D0;
  v4->_maximumPointScreenSpaceRadius = 1.0;
  if (a3)
  {
    C3DEntitySetObjCWrapper((uint64_t)a3, v4);
    unsigned int v19 = 0;
    v4->_meshElement = (__C3DMeshElement *)CFRetain(a3);
    v4->_elementData = (NSData *)(id)C3DMeshElementGetIndexes((uint64_t)a3, &v19);
    v4->_char primitiveType = (int)C3DMeshElementGetType((uint64_t)a3);
    v4->_int64_t primitiveCount = C3DMeshElementGetPrimitiveCount((uint64_t)a3);
    v4->_char indicesChannelCount = C3DMeshElementGetIndicesChannelCount((uint64_t)a3);
    v4->_char interleavedIndicesChannels = C3DMeshElementGetUsesInterleavedIndicesChannels((uint64_t)a3);
    unsigned __int16 v18 = 0;
    uint64_t PrimitiveRanges = C3DMeshElementGetPrimitiveRanges((uint64_t)a3, &v18);
    if (PrimitiveRanges)
    {
      uint64_t v11 = PrimitiveRanges;
      id v12 = objc_alloc(MEMORY[0x263EFF980]);
      unint64_t v13 = (NSArray *)[v12 initWithCapacity:v18];
      if (v18)
      {
        unint64_t v14 = 0;
        uint64_t v15 = (void *)(v11 + 8);
        do
        {
          if (*(v15 - 1) == -1) {
            uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v16 = *(v15 - 1);
          }
          -[NSArray addObject:](v13, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v16, *v15));
          ++v14;
          v15 += 2;
        }
        while (v14 < v18);
      }
      v4->_primitiveRanges = v13;
    }
    v4->_bytesPerIndex = v19;
    v4->_pointSize = C3DMeshElementGetPointSize((uint64_t)a3);
    v4->_minimumPointScreenSpaceRadius = C3DMeshElementGetMinimumPointScreenRadius((uint64_t)a3);
    v4->_maximumPointScreenSpaceRadius = C3DMeshElementGetMaximumPointScreenRadius((uint64_t)a3);
  }
  return v4;
}

- (SCNGeometryElement)init
{
  return [(SCNGeometryElement *)self initWithMeshElement:0];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  unint64_t primitiveType = self->_primitiveType;
  int64_t primitiveCount = self->_primitiveCount;
  if (primitiveType > 4) {
    unint64_t v8 = @"unknown";
  }
  else {
    unint64_t v8 = off_264009F40[primitiveType];
  }
  int64_t indicesChannelCount = self->_indicesChannelCount;
  int v10 = C3DBaseTypeFromDescription(self->_bytesPerIndex, 1, 0);
  return (id)[v3 stringWithFormat:@"<%@: %p | %u x %@, %u channels, %@ indices>", v5, self, primitiveCount, v8, indicesChannelCount, C3DBaseTypeStringDescription(v10)];
}

+ (SCNGeometryElement)geometryElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  unint64_t v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuffer:a3 primitiveType:a4 primitiveCount:a5 indicesChannelCount:a6 interleavedIndicesChannels:a7 bytesPerIndex:a8];

  return (SCNGeometryElement *)v8;
}

- (SCNGeometryElement)initWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  v17.receiver = self;
  v17.super_class = (Class)SCNGeometryElement;
  unint64_t v14 = [(SCNGeometryElement *)&v17 init];
  if (v14)
  {
    if (a4 == 4)
    {
      uint64_t v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SCNGeometryElement initWithBuffer:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:]();
      }
    }
    v14->_mtlBuffer = (MTLBuffer *)a3;
    v14->_unint64_t primitiveType = a4;
    v14->_int64_t primitiveCount = a5;
    v14->_int64_t indicesChannelCount = a6;
    v14->_char interleavedIndicesChannels = a7;
    v14->_bytesPerIndex = a8;
  }
  return v14;
}

+ (id)geometryElementWithMeshElementRef:(id *)a3
{
  result = C3DEntityGetObjCWrapper(a3);
  if (!result)
  {
    MDLGeometryType v6 = (void *)[[a1 alloc] initWithMeshElement:a3];
    return (id *)v6;
  }
  return result;
}

+ (SCNGeometryElement)geometryElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  unint64_t v8 = (void *)[objc_alloc((Class)a1) initWithData:a3 primitiveType:a4 primitiveCount:a5 indicesChannelCount:a6 interleavedIndicesChannels:a7 bytesPerIndex:a8];

  return (SCNGeometryElement *)v8;
}

+ (SCNGeometryElement)geometryElementWithBuffer:(id)buffer primitiveType:(SCNGeometryPrimitiveType)primitiveType primitiveCount:(NSInteger)primitiveCount bytesPerIndex:(NSInteger)bytesPerIndex
{
  return (SCNGeometryElement *)[a1 geometryElementWithBuffer:buffer primitiveType:primitiveType primitiveCount:primitiveCount indicesChannelCount:1 interleavedIndicesChannels:1 bytesPerIndex:bytesPerIndex];
}

- (NSData)data
{
  result = self->_elementData;
  if (!result)
  {
    result = (NSData *)self->_mtlBuffer;
    if (result)
    {
      v4 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v5 = [(NSData *)result contents];
      uint64_t v6 = [(MTLBuffer *)self->_mtlBuffer length];
      return (NSData *)[v4 dataWithBytesNoCopy:v5 length:v6 freeWhenDone:0];
    }
  }
  return result;
}

- (void)_printData
{
  v2 = [(SCNGeometryElement *)self meshElement];

  C3DMeshElementPrintData((uint64_t)v2);
}

- (unint64_t)indexCount
{
  v2 = [(SCNGeometryElement *)self meshElement];

  return C3DMeshElementGetIndexCount((uint64_t)v2);
}

- (SCNGeometryPrimitiveType)primitiveType
{
  return self->_primitiveType;
}

- (NSInteger)primitiveCount
{
  return self->_primitiveCount;
}

- (BOOL)hasInterleavedIndicesChannels
{
  return self->_interleavedIndicesChannels;
}

- (__C3DScene)sceneRef
{
  v2 = [(SCNGeometryElement *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNGeometryElement *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (NSRange)primitiveRange
{
  if ([(NSArray *)self->_primitiveRanges count] == 1)
  {
    id v3 = [(NSArray *)self->_primitiveRanges objectAtIndexedSubscript:0];
    NSUInteger v4 = [v3 rangeValue];
  }
  else
  {
    NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v5 = 0;
  }
  result.length = v5;
  result.location = v4;
  return result;
}

- (void)setPrimitiveRange:(NSRange)primitiveRange
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", primitiveRange.location, primitiveRange.length);
  -[SCNGeometryElement setPrimitiveRanges:](self, "setPrimitiveRanges:", [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1]);
}

- (id)primitiveRanges
{
  return self->_primitiveRanges;
}

- (void)setPrimitiveRanges:(id)a3
{
  primitiveRanges = self->_primitiveRanges;
  if (primitiveRanges != a3)
  {

    uint64_t v6 = (NSArray *)[a3 count];
    if (v6) {
      uint64_t v6 = (NSArray *)[a3 copy];
    }
    self->_primitiveRanges = v6;
    v7 = [(SCNGeometryElement *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__SCNGeometryElement_setPrimitiveRanges___block_invoke;
    v8[3] = &unk_264006160;
    v8[4] = self;
    v8[5] = a3;
    +[SCNTransaction postCommandWithContext:v7 object:0 applyBlock:v8];
  }
}

void __41__SCNGeometryElement_setPrimitiveRanges___block_invoke(uint64_t a1)
{
}

- (CGFloat)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(CGFloat)pointSize
{
  if (self->_pointSize != pointSize)
  {
    float v5 = pointSize;
    self->_pointSize = v5;
    uint64_t v6 = [(SCNGeometryElement *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__SCNGeometryElement_setPointSize___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = pointSize;
    +[SCNTransaction postCommandWithContext:v6 object:0 applyBlock:v7];
  }
}

uint64_t __35__SCNGeometryElement_setPointSize___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  return C3DMeshElementSetPointSize(*(void *)(*(void *)(a1 + 32) + 8), v1);
}

- (CGFloat)minimumPointScreenSpaceRadius
{
  return self->_minimumPointScreenSpaceRadius;
}

- (void)setMinimumPointScreenSpaceRadius:(CGFloat)minimumPointScreenSpaceRadius
{
  if (self->_minimumPointScreenSpaceRadius != minimumPointScreenSpaceRadius)
  {
    float v5 = minimumPointScreenSpaceRadius;
    self->_minimumPointScreenSpaceRadius = v5;
    uint64_t v6 = [(SCNGeometryElement *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__SCNGeometryElement_setMinimumPointScreenSpaceRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = minimumPointScreenSpaceRadius;
    +[SCNTransaction postCommandWithContext:v6 object:0 applyBlock:v7];
  }
}

uint64_t __55__SCNGeometryElement_setMinimumPointScreenSpaceRadius___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  return C3DMeshElementSetMinimumPointScreenRadius(*(void *)(*(void *)(a1 + 32) + 8), v1);
}

- (CGFloat)maximumPointScreenSpaceRadius
{
  return self->_maximumPointScreenSpaceRadius;
}

- (void)setMaximumPointScreenSpaceRadius:(CGFloat)maximumPointScreenSpaceRadius
{
  if (self->_maximumPointScreenSpaceRadius != maximumPointScreenSpaceRadius)
  {
    float v5 = maximumPointScreenSpaceRadius;
    self->_maximumPointScreenSpaceRadius = v5;
    uint64_t v6 = [(SCNGeometryElement *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__SCNGeometryElement_setMaximumPointScreenSpaceRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = maximumPointScreenSpaceRadius;
    +[SCNTransaction postCommandWithContext:v6 object:0 applyBlock:v7];
  }
}

uint64_t __55__SCNGeometryElement_setMaximumPointScreenSpaceRadius___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  return C3DMeshElementSetMaximumPointScreenRadius(*(void *)(*(void *)(a1 + 32) + 8), v1);
}

- (NSInteger)bytesPerIndex
{
  return self->_bytesPerIndex;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_elementData)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"SCNSceneExportCompressGeometryElements"), "BOOLValue"))
    {
      elementData = self->_elementData;
      if (!self->_primitiveType) {
        elementData = [(NSData *)elementData scn_indexedDataEncodingTrianglePairsWithBytesPerIndex:self->_bytesPerIndex];
      }
      uint64_t v6 = (NSData *)objc_msgSend(-[NSData scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:](elementData, "scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:", self->_bytesPerIndex), "scn_compressedDataUsingCompressionAlgorithm:", 774);
      v7 = @"compressedElementData";
    }
    else
    {
      uint64_t v6 = self->_elementData;
      v7 = @"elementData";
    }
    [a3 encodeObject:v6 forKey:v7];
  }
  [a3 encodeInteger:self->_primitiveType forKey:@"primitiveType"];
  [a3 encodeInteger:self->_primitiveCount forKey:@"primitiveCount"];
  if ([(NSArray *)self->_primitiveRanges count] == 1)
  {
    uint64_t v8 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_primitiveRanges, "objectAtIndexedSubscript:", 0), "rangeValue");
    uint64_t v10 = v9;
    [a3 encodeInteger:v8 forKey:@"primitiveRangeLocation"];
    [a3 encodeInteger:v10 forKey:@"primitiveRangeLength"];
  }
  [a3 encodeInteger:self->_indicesChannelCount forKey:@"indicesChannelCount"];
  [a3 encodeBool:self->_interleavedIndicesChannels forKey:@"interleavedIndicesChannels"];
  [a3 encodeInteger:self->_bytesPerIndex forKey:@"bytesPerIndex"];
  *(float *)&double v11 = self->_pointSize;
  [a3 encodeFloat:@"ptSize" forKey:v11];
  *(float *)&double v12 = self->_minimumPointScreenSpaceRadius;
  [a3 encodeFloat:@"minimumPointScreenSpaceRadius" forKey:v12];
  *(float *)&double v13 = self->_maximumPointScreenSpaceRadius;

  [a3 encodeFloat:@"maximumPointScreenSpaceRadius" forKey:v13];
}

- (SCNGeometryElement)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SCNGeometryElement;
  NSUInteger v4 = [(SCNGeometryElement *)&v15 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->_unint64_t primitiveType = [a3 decodeIntegerForKey:@"primitiveType"];
    v4->_int64_t primitiveCount = [a3 decodeIntegerForKey:@"primitiveCount"];
    if ([a3 containsValueForKey:@"primitiveRangeLocation"]
      && [a3 containsValueForKey:@"primitiveRangeLength"])
    {
      uint64_t v6 = [a3 decodeIntegerForKey:@"primitiveRangeLocation"];
      uint64_t v7 = [a3 decodeIntegerForKey:@"primitiveRangeLength"];
      uint64_t v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v6, v7);
      v4->_primitiveRanges = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:&v14 count:1];
    }
    if ([a3 containsValueForKey:@"indicesChannelCount"]
      && [a3 containsValueForKey:@"interleavedIndicesChannels"])
    {
      v4->_int64_t indicesChannelCount = [a3 decodeIntegerForKey:@"indicesChannelCount"];
      v4->_char interleavedIndicesChannels = [a3 decodeBoolForKey:@"interleavedIndicesChannels"];
    }
    else
    {
      v4->_int64_t indicesChannelCount = 1;
      v4->_char interleavedIndicesChannels = 1;
    }
    v4->_bytesPerIndex = [a3 decodeIntegerForKey:@"bytesPerIndex"];
    if ([a3 containsValueForKey:@"ptSize"])
    {
      [a3 decodeFloatForKey:@"pointSize"];
      v4->_pointSize = v8;
      [a3 decodeFloatForKey:@"minimumPointScreenSpaceRadius"];
      v4->_minimumPointScreenSpaceRadius = v9;
      [a3 decodeFloatForKey:@"maximumPointScreenSpaceRadius"];
      v4->_maximumPointScreenSpaceRadius = v10;
    }
    double v11 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"compressedElementData"];
    if (v11)
    {
      double v12 = objc_msgSend((id)objc_msgSend(v11, "scn_uncompressedDataUsingCompressionAlgorithm:", 774), "scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:", v4->_bytesPerIndex);
      if (!v4->_primitiveType) {
        double v12 = objc_msgSend(v12, "scn_indexedDataDecodingTrianglePairsWithBytesPerIndex:", v4->_bytesPerIndex);
      }
    }
    else
    {
      double v12 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"elementData"];
    }
    v4->_elementData = (NSData *)v12;
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_optimizedGeometryElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6
{
  if (a4)
  {
    float v10 = objc_opt_class();
    id v11 = a3;
    int64_t v12 = a4;
  }
  else
  {
    CFDataRef v13 = C3DDataCreateOptimizedIndices((const __CFData *)a3, a5, a6);
    float v10 = objc_opt_class();
    id v11 = v13;
    int64_t v12 = 0;
  }

  return (id)[v10 geometryElementWithData:v11 primitiveType:v12 primitiveCount:a5 bytesPerIndex:a6];
}

- (void)_optimizeTriangleIndices
{
  if (!self->_primitiveType)
  {
    C3DMeshElementOptimizeIndices((uint64_t)self->_meshElement);
    unsigned int v3 = 0;
    self->_elementData = (NSData *)(id)C3DMeshElementGetIndexes((uint64_t)self->_meshElement, &v3);
    self->_unint64_t primitiveType = (int)C3DMeshElementGetType((uint64_t)self->_meshElement);
    self->_int64_t primitiveCount = C3DMeshElementGetPrimitiveCount((uint64_t)self->_meshElement);
    self->_bytesPerIndex = v3;
  }
}

- (double)_computeACMR
{
  return C3DMeshElementComputeACMR((uint64_t)self->_meshElement, 0x20uLL);
}

- (void)initWithBuffer:primitiveType:primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: SCNGeometryPrimitiveTypePolygon not supported with MTLBuffers", v2, v3, v4, v5, v6);
}

- (void)initWithData:(uint64_t)a1 primitiveType:(NSObject *)a2 primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: SCNGeometryElement initialization - Invalid index size (%ld bytes)", (uint8_t *)&v2, 0xCu);
}

- (void)initWithData:(uint64_t)a1 primitiveType:(NSObject *)a2 primitiveCount:indicesChannelCount:interleavedIndicesChannels:bytesPerIndex:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: SCNGeometryElement initialization - Invalid polygon edge count (%ld)", (uint8_t *)&v2, 0xCu);
}

- (void)initWithData:(uint64_t)a3 primitiveType:(uint64_t)a4 primitiveCount:(uint64_t)a5 indicesChannelCount:(uint64_t)a6 interleavedIndicesChannels:(uint64_t)a7 bytesPerIndex:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end