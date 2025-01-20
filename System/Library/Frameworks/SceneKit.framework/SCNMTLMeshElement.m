@interface SCNMTLMeshElement
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)effectiveIndexOffset;
- (uint64_t)effectivePrimitiveCount;
- (uint64_t)indexBuffer;
- (uint64_t)primitiveCount;
- (uint64_t)setIndexCount:(uint64_t)result;
- (uint64_t)setIndexType:(uint64_t)result;
- (uint64_t)setInstanceCount:(uint64_t)result;
- (uint64_t)setSharedIndexBufferOffset:(uint64_t)result;
- (void)dealloc;
- (void)setDrawIndexedPrimitivesIndirectBuffer:(void *)a1;
- (void)setIndexBuffer:(void *)a1;
- (void)setPrimitiveRange:(uint64_t)a3;
- (void)setupWithElement:(void *)result;
@end

@implementation SCNMTLMeshElement

- (uint64_t)indexBuffer
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void)setupWithElement:(void *)result
{
  if (result)
  {
    v3 = result;
    int Type = C3DMeshElementGetType(a2);
    v3[1] = C3DMeshElementTypeToMTLPrimitiveType(Type);
    v3[2] = C3DMeshElementGetIndexCount(a2);
    int v10 = 0;
    if ((C3DMeshElementGetIndexes(a2, &v10) || C3DMeshElementGetMTLBuffer(a2)) && (v10 - 1) >= 2)
    {
      if (v10 == 4)
      {
        uint64_t v5 = 1;
LABEL_12:
        v3[7] = v5;
        v3[3] = C3DMeshElementGetInstanceCount(a2);
        uint64_t PrimitiveRange = C3DMeshElementGetPrimitiveRange(a2);
        return [(SCNMTLMeshElement *)v3 setPrimitiveRange:v9];
      }
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLMeshElement setupWithElement:](&v10, v6);
      }
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLMeshElement setupWithElement:](&v10, v7);
      }
    }
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  return result;
}

- (void)setPrimitiveRange:(uint64_t)a3
{
  if (result)
  {
    if (a2 == -1)
    {
      result[8] = 0;
      a3 = result[2];
LABEL_10:
      result[9] = a3;
    }
    else
    {
      switch(result[1])
      {
        case 0:
          result[8] = a2;
          goto LABEL_10;
        case 1:
          result[8] = 2 * a2;
          a3 *= 2;
          goto LABEL_10;
        case 2:
          result[8] = a2;
          ++a3;
          goto LABEL_10;
        case 3:
          result[8] = 3 * a2;
          a3 *= 3;
          goto LABEL_10;
        case 4:
          result[8] = a2;
          a3 += 2;
          goto LABEL_10;
        default:
          return result;
      }
    }
  }
  return result;
}

- (uint64_t)setInstanceCount:(uint64_t)result
{
  if (result) {
    *(void *)(result + 24) = a2;
  }
  return result;
}

- (void)setIndexBuffer:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 40);
  }
}

- (uint64_t)effectivePrimitiveCount
{
  if (result)
  {
    switch(*(void *)(result + 8))
    {
      case 0:
        result = *(void *)(result + 72);
        break;
      case 1:
        result = *(void *)(result + 72) / 2;
        break;
      case 2:
        result = *(void *)(result + 72) - 1;
        break;
      case 3:
        result = *(void *)(result + 72) / 3;
        break;
      case 4:
        result = *(void *)(result + 72) - 2;
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

- (uint64_t)effectiveIndexOffset
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&self->_primitiveType;
  *((void *)v4 + 3) = self->_instanceCount;
  *((void *)v4 + 4) = self->_sharedIndexBufferOffset;
  *((void *)v4 + 5) = self->_indexBuffer;
  *((void *)v4 + 6) = self->_drawIndexedPrimitivesIndirectBuffer;
  *(_OWORD *)(v4 + 56) = *(_OWORD *)&self->_indexType;
  *((void *)v4 + 9) = self->_effectiveIndexCount;
  return v4;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 40);
    objc_setProperty_nonatomic(self, v3, 0, 48);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNMTLMeshElement;
  [(SCNMTLMeshElement *)&v4 dealloc];
}

- (void)setDrawIndexedPrimitivesIndirectBuffer:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 48);
  }
}

- (id)description
{
  uint64_t primitiveType_low = LODWORD(self->_primitiveType);
  indexBuffer = self->_indexBuffer;
  drawIndexedPrimitivesIndirectBuffer = self->_drawIndexedPrimitivesIndirectBuffer;
  uint64_t indexCount_low = LODWORD(self->_indexCount);
  uint64_t effectiveIndexOffset_low = LODWORD(self->_effectiveIndexOffset);
  if (drawIndexedPrimitivesIndirectBuffer) {
    return (id)[NSString stringWithFormat:@"<SCNMTLMeshElement: %p | type: %d, index buffer: %@ (%d indices), indirect buffer: %@, effective count: %d, offset: %d>", self, primitiveType_low, indexBuffer, indexCount_low, drawIndexedPrimitivesIndirectBuffer, LODWORD(self->_effectiveIndexCount), effectiveIndexOffset_low];
  }
  else {
    return (id)[NSString stringWithFormat:@"<SCNMTLMeshElement: %p | type: %d, index buffer: %@ (%d indices), effective count: %d, offset: %d>", self, primitiveType_low, indexBuffer, indexCount_low, LODWORD(self->_effectiveIndexCount), effectiveIndexOffset_low, v8];
  }
}

- (uint64_t)primitiveCount
{
  if (result)
  {
    switch(*(void *)(result + 8))
    {
      case 0:
        result = *(void *)(result + 16);
        break;
      case 1:
        result = *(void *)(result + 16) / 2;
        break;
      case 2:
        result = *(void *)(result + 16) - 1;
        break;
      case 3:
        result = *(void *)(result + 16) / 3;
        break;
      case 4:
        result = *(void *)(result + 16) - 2;
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

- (uint64_t)setIndexCount:(uint64_t)result
{
  if (result) {
    *(void *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setSharedIndexBufferOffset:(uint64_t)result
{
  if (result) {
    *(void *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)setIndexType:(uint64_t)result
{
  if (result) {
    *(void *)(result + 56) = a2;
  }
  return result;
}

- (void)setupWithElement:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid index size (%d bytes per index)", (uint8_t *)v3, 8u);
}

- (void)setupWithElement:(int *)a1 .cold.2(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Invalid index size (%d bytes per index)", (uint8_t *)v3, 8u);
}

@end