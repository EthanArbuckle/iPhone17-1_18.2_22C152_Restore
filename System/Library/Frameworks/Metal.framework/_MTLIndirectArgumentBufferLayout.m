@interface _MTLIndirectArgumentBufferLayout
- (BOOL)bufferLayoutMatchesFrontEndLayout;
- (MTLDeviceSPI)device;
- (_MTLIndirectArgumentBufferLayout)init;
- (id)bufferLayoutForResourceAtIndex:(unint64_t)a3;
- (unint64_t)alignment;
- (unint64_t)constantOffsetAtIndex:(unint64_t)a3;
- (unint64_t)encodedLength;
- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForInstanceAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForIntersectionFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForPrimitiveAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unint64_t)uniqueIdentifierForVisibleFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
- (unsigned)hashMask;
- (unsigned)hashOffset;
- (unsigned)hashSignature;
- (unsigned)hashValue;
- (void)dealloc;
- (void)setStructType:(id)a3 withDevice:(id)a4;
- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5;
@end

@implementation _MTLIndirectArgumentBufferLayout

- (void)dealloc
{
  v3 = (id *)self->_private;
  if (v3)
  {
    _MTLIndirectArgumentBufferLayoutPrivate::~_MTLIndirectArgumentBufferLayoutPrivate(v3);
    MEMORY[0x18530C140]();
  }
  v4.receiver = self;
  v4.super_class = (Class)_MTLIndirectArgumentBufferLayout;
  [(_MTLIndirectArgumentBufferLayout *)&v4 dealloc];
}

- (void)setStructType:(id)a3 withDevice:(id)a4
{
}

- (_MTLIndirectArgumentBufferLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLIndirectArgumentBufferLayout;
  return [(_MTLIndirectArgumentBufferLayout *)&v3 init];
}

- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  return 0;
}

- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  return 0;
}

- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  return 0;
}

- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  return 0;
}

- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  return 0;
}

- (unint64_t)uniqueIdentifierForVisibleFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  if ([(MTLDeviceSPI *)[(_MTLIndirectArgumentBufferLayout *)self device] requiresRaytracingEmulation])
  {
    uint64_t v9 = [a4 contents];
    return *(void *)(v9 + [self->_private offsetForVisibleFunctionTable:a3]);
  }
  else
  {
    [(_MTLIndirectArgumentBufferLayout *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (unint64_t)uniqueIdentifierForIntersectionFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  if ([(MTLDeviceSPI *)[(_MTLIndirectArgumentBufferLayout *)self device] requiresRaytracingEmulation])
  {
    uint64_t v9 = [a4 contents];
    return *(void *)(v9 + [self->_private offsetForIntersectionFunctionTable:a3]);
  }
  else
  {
    [(_MTLIndirectArgumentBufferLayout *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (unint64_t)uniqueIdentifierForInstanceAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  if ([(MTLDeviceSPI *)[(_MTLIndirectArgumentBufferLayout *)self device] requiresRaytracingEmulation])
  {
    uint64_t v9 = [a4 contents];
    return *(void *)(v9 + [self->_private offsetForInstanceAccelerationStructure:a3]);
  }
  else
  {
    [(_MTLIndirectArgumentBufferLayout *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (unint64_t)uniqueIdentifierForPrimitiveAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  if ([(MTLDeviceSPI *)[(_MTLIndirectArgumentBufferLayout *)self device] requiresRaytracingEmulation])
  {
    uint64_t v9 = [a4 contents];
    return *(void *)(v9 + [self->_private offsetForPrimitiveAccelerationStructure:a3]);
  }
  else
  {
    [(_MTLIndirectArgumentBufferLayout *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (BOOL)bufferLayoutMatchesFrontEndLayout
{
  return 1;
}

- (unint64_t)encodedLength
{
  return -1;
}

- (unint64_t)alignment
{
  return -1;
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

- (unint64_t)constantOffsetAtIndex:(unint64_t)a3
{
  return -1;
}

- (id)bufferLayoutForResourceAtIndex:(unint64_t)a3
{
  objc_super v3 = self->_private;
  unint64_t v5 = a3;
  id result = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(v3 + 1, &v5);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (MTLDeviceSPI)device
{
  return *(MTLDeviceSPI **)self->_private;
}

@end