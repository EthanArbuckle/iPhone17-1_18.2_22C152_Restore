@interface AGXG17FamilyRayTracingCPUBuilder
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)calcAllocSizesFromDescriptor:(SEL)a3;
- (AGXG17FamilyRayTracingCPUBuilder)init;
- (id).cxx_construct;
- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7;
- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6;
- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6;
- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6;
- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17;
- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5;
- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5;
- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
@end

@implementation AGXG17FamilyRayTracingCPUBuilder

- (id).cxx_construct
{
  v2 = &unk_268D5A000;
  {
    id v6 = self;
    v2 = &unk_268D5A000;
    int v5 = v4;
    self = v6;
    if (v5)
    {
      AGX::RayTracingCPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
      v2 = (_DWORD *)&unk_268D5A000;
      self = v6;
    }
  }
  int v3 = v2[74];
  if (v3 <= 0) {
    int v3 = 2;
  }
  *((_DWORD *)self + 22) = v3;
  return self;
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v6 = (char *)a3 + 320;
  uint64_t v7 = *((void *)a3 + 41);
  size_t v8 = *(void *)(v7 + 72);
  uint64_t v9 = [a4 contents];
  v10 = &unk_268D5A000;
  {
    uint64_t v17 = v9;
    v10 = &unk_268D5A000;
    int v16 = v15;
    uint64_t v9 = v17;
    if (v16)
    {
      AGX::RayTracingCPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
      v10 = (_DWORD *)&unk_268D5A000;
      uint64_t v9 = v17;
    }
  }
  int v11 = v10[74];
  if (v11 <= 0) {
    int v11 = 2;
  }
  unint64_t v12 = v9 + a5;
  *(_DWORD *)unint64_t v12 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::kBvhChipCodes[v11];
  *(_DWORD *)(v12 + 4) = *(_DWORD *)(v7 + 64);
  *(void *)(v12 + 8) = v8 + 24;
  *(void *)(v12 + 16) = v8;
  v13 = (void *)(v9 + a5 + 24);
  v14 = (const void *)*((void *)v6 + 1);

  memcpy(v13, v14, v8);
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  unint64_t v8 = [a3 contents] + a4;
  *(void *)([a5 contents] + a6) = *(void *)(v8 + 16);
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  uint64_t v5 = *(void *)(*((void *)a3 + 41) + 72) + 24;
  *(void *)([a4 contents] + a5) = v5;
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  uint64_t v5 = (char *)a4 + 320;
  memcpy(*((void **)a4 + 41), *((const void **)a3 + 41), *(void *)(*((void *)a3 + 41) + 72));
  uint64_t v6 = *((void *)v5 + 1);
  *(void *)(v6 + 144) = [a4 uniqueIdentifier];
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  uint64_t v5 = *(void *)(*((void *)a3 + 41) + 72);
  *(void *)([a4 contents] + a5) = v5;
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
}

- (AGXG17FamilyRayTracingCPUBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyRayTracingCPUBuilder;
  return [(_MTLObjectWithLabel *)&v3 init];
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)calcAllocSizesFromDescriptor:(SEL)a3
{
  *(_OWORD *)&retstr->var0 = xmmword_242EA84A0;
  retstr->var2 = 16;
  return result;
}

@end