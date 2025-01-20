@interface MTLEmulationIndirectArgumentBufferLayout
- (BOOL)bufferLayoutMatchesFrontEndLayout;
- (MTLEmulationIndirectArgumentBufferLayout)initWithStructType:(id)a3;
- (unint64_t)alignment;
- (unint64_t)offsetForBuffer:(unint64_t)a3;
- (unint64_t)offsetForConstant:(unint64_t)a3;
- (unint64_t)offsetForInstanceAccelerationStructure:(unint64_t)a3;
- (unint64_t)offsetForIntersectionFunctionTable:(unint64_t)a3;
- (unint64_t)offsetForPrimitiveAccelerationStructure:(unint64_t)a3;
- (unint64_t)offsetForSampler:(unint64_t)a3;
- (unint64_t)offsetForTexture:(unint64_t)a3;
- (unint64_t)offsetForVisibleFunctionTable:(unint64_t)a3;
- (unint64_t)stride;
- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unsigned)hashMask;
- (unsigned)hashOffset;
- (unsigned)hashSignature;
- (unsigned)hashValue;
- (void)dealloc;
- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
@end

@implementation MTLEmulationIndirectArgumentBufferLayout

- (MTLEmulationIndirectArgumentBufferLayout)initWithStructType:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLEmulationIndirectArgumentBufferLayout;
  if ([(_MTLIndirectArgumentBufferLayout *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  bufferIndices = self->_bufferIndices;
  if (bufferIndices)
  {
    uint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)bufferIndices);
    MEMORY[0x18530C140](v4, 0x10A0C408EF24B1CLL);
    self->_bufferIndices = 0;
  }
  textureIndices = self->_textureIndices;
  if (textureIndices)
  {
    uint64_t v6 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)textureIndices);
    MEMORY[0x18530C140](v6, 0x10A0C408EF24B1CLL);
    self->_textureIndices = 0;
  }
  samplerIndices = self->_samplerIndices;
  if (samplerIndices)
  {
    uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)samplerIndices);
    MEMORY[0x18530C140](v8, 0x10A0C408EF24B1CLL);
    self->_samplerIndices = 0;
  }
  constantIndices = self->_constantIndices;
  if (constantIndices)
  {
    uint64_t v10 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)constantIndices);
    MEMORY[0x18530C140](v10, 0x10A0C408EF24B1CLL);
    self->_constantIndices = 0;
  }
  constantOffsets = (void **)self->_constantOffsets;
  if (constantOffsets)
  {
    v12 = *constantOffsets;
    if (*constantOffsets)
    {
      constantOffsets[1] = v12;
      operator delete(v12);
    }
    MEMORY[0x18530C140](constantOffsets, 0x10C402FEFCB83);
    self->_constantOffsets = 0;
  }
  visibleFunctionTableIndices = self->_visibleFunctionTableIndices;
  if (visibleFunctionTableIndices)
  {
    uint64_t v14 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)visibleFunctionTableIndices);
    MEMORY[0x18530C140](v14, 0x10A0C408EF24B1CLL);
  }
  intersectionFunctionTableIndices = self->_intersectionFunctionTableIndices;
  if (intersectionFunctionTableIndices)
  {
    uint64_t v16 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)intersectionFunctionTableIndices);
    MEMORY[0x18530C140](v16, 0x10A0C408EF24B1CLL);
  }
  primitiveAccelerationStructureIndices = self->_primitiveAccelerationStructureIndices;
  if (primitiveAccelerationStructureIndices)
  {
    uint64_t v18 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)primitiveAccelerationStructureIndices);
    MEMORY[0x18530C140](v18, 0x10A0C408EF24B1CLL);
  }
  instanceAccelerationStructureIndices = self->_instanceAccelerationStructureIndices;
  if (instanceAccelerationStructureIndices)
  {
    uint64_t v20 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)instanceAccelerationStructureIndices);
    MEMORY[0x18530C140](v20, 0x10A0C408EF24B1CLL);
  }
  v21.receiver = self;
  v21.super_class = (Class)MTLEmulationIndirectArgumentBufferLayout;
  [(_MTLIndirectArgumentBufferLayout *)&v21 dealloc];
}

- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v7 = [a4 contents];
  return *(void **)(v7 + [(MTLEmulationIndirectArgumentBufferLayout *)self offsetForBuffer:a3] + 16);
}

- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v7 = [a4 contents];
  return *(void *)(v7 + [(MTLEmulationIndirectArgumentBufferLayout *)self offsetForTexture:a3]);
}

- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v7 = [a4 contents];
  return *(void *)(v7 + [(MTLEmulationIndirectArgumentBufferLayout *)self offsetForSampler:a3]);
}

- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout uniqueIdentifierForRenderPipelineAtIndex:inIndirectArgumentBuffer:atOffset:]", 2253, @"Setting a pipeline is not supported on this hardware", a5, v5, v6, v7, vars0);
  return 0;
}

- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout uniqueIdentifierForComputePipelineAtIndex:inIndirectArgumentBuffer:atOffset:]", 2261, @"Setting a pipeline is not supported on this hardware", a5, v5, v6, v7, vars0);
  return 0;
}

- (unint64_t)offsetForBuffer:(unint64_t)a3
{
  unint64_t v10 = a3;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((void *)self->_bufferIndices, &v10);
  if (!v8) {
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForBuffer:]", 2271, @"Invalid ID: %lu", v4, v5, v6, v7, v10);
  }
  return self->_bufferOffset + 24 * v8[3];
}

- (unint64_t)offsetForTexture:(unint64_t)a3
{
  unint64_t v10 = a3;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((void *)self->_textureIndices, &v10);
  if (!v8) {
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForTexture:]", 2283, @"Invalid ID: %lu", v4, v5, v6, v7, v10);
  }
  return self->_textureOffset + 8 * v8[3];
}

- (unint64_t)offsetForSampler:(unint64_t)a3
{
  unint64_t v10 = a3;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((void *)self->_samplerIndices, &v10);
  if (!v8) {
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForSampler:]", 2295, @"Invalid ID: %lu", v4, v5, v6, v7, v10);
  }
  return self->_samplerOffset + 8 * v8[3];
}

- (unint64_t)offsetForConstant:(unint64_t)a3
{
  unint64_t v10 = a3;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((void *)self->_constantIndices, &v10);
  if (!v8) {
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForConstant:]", 2307, @"Invalid ID: %lu", v4, v5, v6, v7, v10);
  }
  return *(void *)(*(void *)self->_constantOffsets + 8 * v8[3]);
}

- (unint64_t)offsetForVisibleFunctionTable:(unint64_t)a3
{
  unint64_t v10 = a3;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((void *)self->_visibleFunctionTableIndices, &v10);
  if (!v8) {
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForVisibleFunctionTable:]", 2323, @"Invalid ID: %lu", v4, v5, v6, v7, v10);
  }
  return self->_visibleFunctionTableOffset + 8 * v8[3];
}

- (unint64_t)offsetForIntersectionFunctionTable:(unint64_t)a3
{
  unint64_t v10 = a3;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((void *)self->_intersectionFunctionTableIndices, &v10);
  if (!v8) {
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForIntersectionFunctionTable:]", 2336, @"Invalid ID: %lu", v4, v5, v6, v7, v10);
  }
  return self->_intersectionFunctionTableOffset + 8 * v8[3];
}

- (unint64_t)offsetForPrimitiveAccelerationStructure:(unint64_t)a3
{
  unint64_t v10 = a3;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((void *)self->_primitiveAccelerationStructureIndices, &v10);
  if (!v8) {
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForPrimitiveAccelerationStructure:]", 2348, @"Invalid ID: %lu", v4, v5, v6, v7, v10);
  }
  return self->_primitiveAccelerationStructureOffset + 8 * v8[3];
}

- (unint64_t)offsetForInstanceAccelerationStructure:(unint64_t)a3
{
  unint64_t v10 = a3;
  uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((void *)self->_instanceAccelerationStructureIndices, &v10);
  if (!v8) {
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForInstanceAccelerationStructure:]", 2360, @"Invalid ID: %lu", v4, v5, v6, v7, v10);
  }
  return self->_instanceAccelerationStructureOffset + 8 * v8[3];
}

- (BOOL)bufferLayoutMatchesFrontEndLayout
{
  return 0;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (unsigned)hashValue
{
  return -1;
}

- (unsigned)hashOffset
{
  return -1;
}

- (unsigned)hashMask
{
  return -2097152;
}

- (unsigned)hashSignature
{
  return 2145386496;
}

- (unint64_t)stride
{
  return self->_stride;
}

@end