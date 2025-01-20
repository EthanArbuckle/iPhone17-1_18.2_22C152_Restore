@interface MTLGPUBVHBuilder
+ (BOOL)supportsDevice:(id)a3;
+ (unint64_t)breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:(unint64_t)a3;
+ (unint64_t)getMaxAccelerationStructureTraversalDepth:(unint64_t)a3;
+ (unint64_t)prefixSumScratchBufferSizeWithCapacity:(unint64_t)a3;
- ($D4F0DBFB58BF58C1D2D6E8FF21CEAEC6)getMTLSWBVHSizeAndOffsetsForDescriptor:(SEL)a3 bvhDescriptor:(id)a4;
- (BOOL)isCompatibleWithAccelerationStructure:(id)a3;
- (BOOL)useResourceBufferForDescriptor:(id)a3;
- (BOOL)useSpatialSplitsForDescriptor:(id)a3;
- (BOOL)writeGenericBVHStructureSizesWithEncoder:(id)a3 version:(unint64_t)a4 BVHBuffer:(id)a5 BVHBufferOffset:(unint64_t)a6 toBuffer:(id)a7 sizesBufferOffset:(unint64_t)a8;
- (BOOL)writeGenericBVHStructureWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 into:(id)a6;
- (MTLGPUBVHBuilder)initWithDevice:(id)a3;
- (id).cxx_construct;
- (id)newGeometryBufferWithGeometryDescriptors:(id)a3 retainedResources:(id)a4;
- (id)newIndirectBufferWithCapacity:(unint64_t)a3 withRetainedResources:(id)a4 indirectBufferStride:(unint64_t *)a5;
- (id)newInstanceBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5;
- (id)newInstanceBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5 encodedStride:(unint64_t *)a6;
- (id)newPrimitiveCountBufferWithEncoder:(id)a3 descriptor:(id)a4 retainedResources:(id)a5;
- (id)newResourceBufferWithDescriptor:(id)a3 retainedResources:(id)a4;
- (id)newResourceIDsBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5;
- (id)retainedResourcesArrayWithEncoder:(id)a3;
- (uint64_t)initWithDevice:;
- (unint64_t)fragmentScratchSizeForDescriptor:(id)a3;
- (unint64_t)fragmentTotalThreadgroupCountForDescriptor:(id)a3;
- (unint64_t)getBuildScratchBufferSizeForDescriptor:(id)a3;
- (unint64_t)getEncodeMTLSWBVHScratchBufferSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4;
- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3;
- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3 nodeOffset:(unint64_t *)a4 fragmentOffset:(unint64_t *)a5 fragmentIndexOffset:(unint64_t *)a6 childIndexOffset:(unint64_t *)a7;
- (unint64_t)getMTLSWBVHSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4;
- (unint64_t)getMTLSWBVHSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4 refitDataOffset:(unint64_t *)a5 innerNodeOffset:(unint64_t *)a6 leafNodeOffset:(unint64_t *)a7 primitiveOffset:(unint64_t *)a8 controlPointOffset:(unint64_t *)a9 primitiveRefitDataOffset:(unint64_t *)a10 geometryOffset:(unint64_t *)a11 primitiveBVHOffset:(unint64_t *)a12 transformOffset:(unint64_t *)a13 instancedResourceIDsOffset:(unint64_t *)a14;
- (unint64_t)getRefitScratchBufferSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4;
- (unint64_t)maxDepthForDescriptor:(id)a3;
- (void)addPrefixSumsWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10;
- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8;
- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8 primitiveCountBuffer:(id)a9 primitiveCountBufferOffset:(unint64_t)a10;
- (void)buildWithEncoder:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6 fragmentBuffer:(id)a7 fragmentBufferOffset:(unint64_t)a8 fragmentIndexBuffer0:(id)a9 fragmentIndexBuffer0Offset:(unint64_t)a10 nodeBuffer:(id)a11 nodeBufferOffset:(unint64_t)a12 childIndexBuffer:(id)a13 childIndexBufferOffset:(unint64_t)a14 counterBuffer:(id)a15 counterBufferOffset:(unint64_t)a16 fragmentCountBuffer:(id)a17 fragmentCountBufferOffset:(unint64_t)a18 boundsMinBuffer:(id)a19 boundsMinBufferOffset:(unint64_t)a20 boundsMaxBuffer:(id)a21 boundsMaxBufferOffset:(unint64_t)a22 boundsEndMinBuffer:(id)a23 boundsEndMinBufferOffset:(unint64_t)a24 boundsEndMaxBuffer:(id)a25 boundsEndMaxBufferOffset:(unint64_t)a26 boundsEndTimeBuffer:(id)a27 boundsEndTimeBufferOffset:(unint64_t)a28 boundsStartTimeBuffer:(id)a29 boundsStartTimeBufferOffset:(unint64_t)a30 scratchBufferOffsets:(ScratchBufferOffset *)a31;
- (void)copyAndCompactMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9;
- (void)copyAndCompactMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9;
- (void)copyFromBuffer:(id)a3 sourceBufferOffset:(unint64_t)a4 toBuffer:(id)a5 destinationBufferOffset:(unint64_t)a6 length:(unint64_t)a7 encoder:(id)a8;
- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9;
- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9 compact:(BOOL)a10 copyVertexData:(BOOL)a11 copyPerPrimitiveData:(BOOL)a12;
- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9;
- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9 compact:(BOOL)a10 copyVertexData:(BOOL)a11 copyPerPrimitiveData:(BOOL)a12;
- (void)dealloc;
- (void)dispatchIndirect64:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10;
- (void)dispatchIndirect:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5 counterIndex:(unint64_t)a6 threadgroupSize:(unint64_t)a7 encoder:(id)a8;
- (void)dispatchIndirect:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5 threadgroupSize:(unint64_t)a6 encoder:(id)a7;
- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 counterBuffer:(id)a6 counterBufferOffset:(unint64_t)a7 counterIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10;
- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 counterBuffer:(id)a6 counterBufferOffset:(unint64_t)a7 counterIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 threadgroupSize:(unint64_t)a10 encoder:(id)a11;
- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10;
- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 threadgroupSize:(unint64_t)a10 encoder:(id)a11;
- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 accelerationStructureUniqueIdentifier:(unint64_t)a12;
- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 gpuResourceID:(MTLResourceID)a12 accelerationStructureUniqueIdentifier:(unint64_t)a13;
- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 uniqueIdentifier:(unint64_t)a12;
- (void)fastIndirectGPUMemcpyWithEncoder:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 srcBuffer:(id)a6 srcBufferOffset:(unint64_t)a7 dstBuffer:(id)a8 dstBufferOffset:(unint64_t)a9 lengthBuffer:(id)a10 lengthOffset:(unint64_t)a11 retainedResources:(id)a12;
- (void)getBoundingBoxFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24 fragmentScratchBuffer:(id)a25 fragmentScratchBufferOffset:(unint64_t)a26;
- (void)getCurveFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24;
- (void)getMTLInstanceBoundingBoxesWithEncoder:(id)a3 descriptor:(id)a4 boundingBoxBuffer:(id)a5 boundingBoxBufferOffset:(unint64_t)a6;
- (void)getPolygonFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24;
- (void)initPipelinesWithDevice:(id)a3;
- (void)initWithDevice:;
- (void)initializeCounterBuffer:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5;
- (void)layoutNodesBreadthFirstWithEncoder:(id)a3 descriptor:(id)a4 BVHBuffer:(id)a5 BVHBufferOffset:(unint64_t)a6 counterBuffer:(id)a7 counterBufferOffset:(unint64_t)a8 nodeMappingBuffer:(id)a9 nodeMappingBufferOffset:(unint64_t)a10 levelOffsetsBuffer:(id)a11 levelOffsetsBufferOffset:(unint64_t)a12 levelCountsBuffer:(id)a13 levelCountsBufferOffset:(unint64_t)a14 scratchBuffer:(id)a15 scratchBufferOffset:(unint64_t)a16;
- (void)prefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 scratchBuffer:(id)a8 scratchBufferOffset:(unint64_t)a9 countBuffer:(id)a10 countBufferOffset:(unint64_t)a11 capacity:(unint64_t)a12;
- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13;
- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13 options:(unint64_t)a14;
- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13;
- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13 options:(unint64_t)a14;
- (void)refitPrimitiveData:(id)a3 inPlace:(BOOL)a4 bvhDescriptor:(id)a5;
- (void)refitVertexDataWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 inPlace:(BOOL)a6 sourceBuffer:(id)a7 sourceBufferOffset:(unint64_t)a8 scratchBuffer:(id)a9 scratchBufferOffset:(unint64_t)a10 retainedResources:(id)a11 innerNodeCapacity:(unint64_t)a12 leafNodeCapacity:(unint64_t)a13;
- (void)setCounters:(const CounterValue *)a3 numCounters:(unint64_t)a4 encoder:(id)a5;
- (void)setGeometryBufferWithGeometryDescriptors:(id)a3 retainedResources:(id)a4 onEncoder:(id)a5 atIndex:(unint64_t)a6;
- (void)setResourceBufferWithDescriptor:(id)a3 retainedResources:(id)a4 onEncoder:(id)a5 atIndex:(unint64_t)a6;
- (void)threadgroupPrefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10;
- (void)writeAccelerationStructureSerializationDataWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7;
- (void)writeBVHHeaderWithEncoder:(id)a3 descriptor:(id)a4 tmpCounterBuffer:(id)a5 tmpCounterBufferOffset:(unint64_t)a6 nodeBuffer:(id)a7 nodeBufferOffset:(unint64_t)a8 headerBuffer:(id)a9 headerBufferOffset:(unint64_t)a10 nodeOffset:(unint64_t)a11 fragmentOffset:(unint64_t)a12 fragmentIndexOffset:(unint64_t)a13 childIndexOffset:(unint64_t)a14 size:(unint64_t)a15;
- (void)writeCompactedMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7 sizeDataType:(unint64_t)a8;
- (void)writeDeserializedMTLSWBVHSizeWithEncoder:(id)a3 serializedBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7;
- (void)writeDeserializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 fromBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8 accelerationStructureMTLResourceID:(MTLResourceID)a9 accelerationStructureUniqueIdentifier:(unint64_t)a10;
- (void)writeDeserializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 fromBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8 accelerationStructureMTLResourceID:(MTLResourceID)a9 uniqueIdentifier:(unint64_t)a10;
- (void)writeDeserializedMTLSWPrimitiveBVHSizesWithEncoder:(id)a3 serializedBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizesBufferOffset:(unint64_t)a7;
- (void)writeGenericBVHStructureSizesWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizesBufferOffset:(unint64_t)a7;
- (void)writeGenericBVHStructureWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 header:(id)a6 headerBufferOffset:(unint64_t)a7 innerNodes:(id)a8 innerNodeBufferOffset:(unint64_t)a9 leafNodes:(id)a10 leafNodeBufferOffset:(unint64_t)a11 primitives:(id)a12 primitiveBufferOffset:(unint64_t)a13 geometry:(id)a14 geometryOffset:(unint64_t)a15 instanceTransform:(id)a16 instanceTransformOffset:(unint64_t)a17 controlPoints:(id)a18 controlPointBufferOffset:(unint64_t)a19;
- (void)writeMTLSWBVHAccelerationStructureDepthWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7;
- (void)writeMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7;
- (void)writeSerializationDataWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7;
- (void)writeSerializedGeometryPrimitiveCountWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 countBufferOffset:(unint64_t)a7;
- (void)writeSerializedGeometrySizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7;
- (void)writeSerializedGeometryWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 geometryBufferOffset:(unint64_t)a7;
- (void)writeSerializedMTLSWBVHRawSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7;
- (void)writeSerializedMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7;
- (void)writeSerializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 toBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8;
@end

@implementation MTLGPUBVHBuilder

- ($D4F0DBFB58BF58C1D2D6E8FF21CEAEC6)getMTLSWBVHSizeAndOffsetsForDescriptor:(SEL)a3 bvhDescriptor:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  int MTLSWBVHType = getMTLSWBVHType((MTLAccelerationStructureDescriptor *)a4);
  unsigned int MTLSWBVHPrimitiveType = getMTLSWBVHPrimitiveType((MTLAccelerationStructureDescriptor *)a4);
  BOOL MTLSWBVHMotion = getMTLSWBVHMotion((MTLAccelerationStructureDescriptor *)a4);
  BOOL v12 = MTLSWBVHMotion;
  if (MTLSWBVHType) {
    uint64_t v13 = 44;
  }
  else {
    uint64_t v13 = 16;
  }
  if (MTLSWBVHType)
  {
    uint64_t v14 = 0;
  }
  else
  {
    if (MTLSWBVHPrimitiveType > 2) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = *(void *)&a0_0[8 * MTLSWBVHPrimitiveType];
    }
    if (MTLSWBVHPrimitiveType - 1 >= 2 && !MTLSWBVHPrimitiveType)
    {
      uint64_t v44 = 8;
      goto LABEL_13;
    }
  }
  uint64_t v44 = 0;
LABEL_13:
  uint64_t v15 = 64;
  if (MTLSWBVHMotion) {
    uint64_t v15 = 124;
  }
  uint64_t v43 = v15;
  if ([a5 primitiveMotion]) {
    v14 *= [a5 primitiveKeyframeCount];
  }
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v49 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a5 fragmentCapacity:&v53 fragmentIndexCapacity:&v49 innerNodeCapacity:&v52 leafNodeCapacity:&v51 primitiveDataCapacity:&v50];
  if (MTLSWBVHType)
  {
    v16 = objc_opt_class();
    if ([v16 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v17 = [a4 instanceCount];
      if (v12)
      {
        uint64_t v18 = [a4 motionTransformCount];
LABEL_33:
        uint64_t v27 = v18;
LABEL_38:
        uint64_t v23 = 0;
        uint64_t v28 = 255;
        goto LABEL_39;
      }
    }
    else
    {
      v26 = objc_opt_class();
      if (![v26 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v17 = 0;
        uint64_t v27 = 0;
        goto LABEL_38;
      }
      uint64_t v17 = [a4 maxInstanceCount];
      if (v12)
      {
        uint64_t v18 = [a4 maxMotionTransformCount];
        goto LABEL_33;
      }
    }
    uint64_t v23 = 0;
    uint64_t v28 = 255;
    uint64_t v27 = v17;
    goto LABEL_39;
  }
  uint64_t v19 = objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count");
  uint64_t v42 = v13;
  if (MTLSWBVHPrimitiveType == 2
    && (long long v47 = 0u,
        long long v48 = 0u,
        long long v45 = 0u,
        long long v46 = 0u,
        v20 = (void *)[a5 geometryDescriptors],
        (uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v54 count:16]) != 0))
  {
    uint64_t v22 = v21;
    uint64_t v23 = 0;
    uint64_t v24 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v20);
        }
        v23 += [*(id *)(*((void *)&v45 + 1) + 8 * i) controlPointCount];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v22);
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v17 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 8 * v19 + 255;
  uint64_t v13 = v42;
LABEL_39:
  unint64_t v29 = 256;
  retstr->var1 = 256;
  if ([a4 usage]) {
    unint64_t v29 = (8 * [a5 maxDepth] + 511) & 0xFFFFFFFFFFFFFF00;
  }
  unint64_t v30 = ((v29 | 0xFC) + v43 + v43 * v52) & 0xFFFFFFFFFFFFFF00;
  retstr->var2 = v29;
  retstr->var3 = v30;
  unint64_t v31 = (v30 + v51 * v13 + 255) & 0xFFFFFFFFFFFFFF00;
  uint64_t v32 = v31 + v49 * v14 + 255;
  retstr->var4 = v31;
  retstr->var5 = v32 & 0xFFFFFFFFFFFFFF00;
  if ([a5 motion]) {
    uint64_t v33 = [a5 primitiveKeyframeCount];
  }
  else {
    uint64_t v33 = 1;
  }
  uint64_t v34 = (v32 | 0xF0) + 16 * v23 * v33;
  retstr->var6 = v34 & 0xFFFFFFFFFFFFFF00;
  result = ($D4F0DBFB58BF58C1D2D6E8FF21CEAEC6 *)[a4 usage];
  unint64_t v36 = ((v34 | 0xF8) + (((uint64_t)((void)result << 63) >> 63) & (v49 * v44))) & 0xFFFFFFFFFFFFFF00;
  unint64_t v37 = (v28 + v36) & 0xFFFFFFFFFFFFFF00;
  retstr->var7 = v36;
  retstr->var8 = v37;
  uint64_t v38 = 8 * v17 + 255;
  unint64_t v39 = (v38 + v37) & 0xFFFFFFFFFFFFFF00;
  unint64_t v40 = (v39 + (v27 << 7) + 255) & 0xFFFFFFFFFFFFFF00;
  retstr->var9 = v39;
  retstr->var10 = v40;
  unint64_t v41 = (v50 + v40 + 255) & 0xFFFFFFFFFFFFFF00;
  retstr->var11 = v41;
  retstr->var0 = (v38 + v41) & 0xFFFFFFFFFFFFFF00;
  return result;
}

- (MTLGPUBVHBuilder)initWithDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)MTLGPUBVHBuilder;
  v4 = [(MTLBVHBuilder *)&v12 init];
  if (v4)
  {
    *((void *)v4 + 1) = a3;
    *((unsigned char *)v4 + 144) = [a3 supportsFamily:1007];
    *((unsigned char *)v4 + 145) = [a3 supportsFamily:1008];
    *((unsigned char *)v4 + 146) = [a3 supportsFamily:1006];
    v4[4] = 64;
    v4[5] = 512;
    v4[6] = 0x2000;
    if (objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", @"Apple"))
    {
      getBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 1;
      int v5 = 512;
    }
    else if (getBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize)
    {
      int v5 = 512;
    }
    else
    {
      int v5 = 64;
    }
    v4[7] = v5;
    if (objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", @"Apple"))
    {
      getSpatialBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 1;
      int v6 = 256;
    }
    else if (getSpatialBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize)
    {
      int v6 = 256;
    }
    else
    {
      int v6 = 64;
    }
    v4[8] = v6;
    if (objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", @"Apple")) {
      int v7 = 256;
    }
    else {
      int v7 = 64;
    }
    v4[9] = v7;
    v4[10] = 64;
    v4[11] = getDispatchBinsSmallTGSize((uint64_t)a3);
    *((unsigned char *)v4 + 48) = [a3 supportsFamily:1006];
    uint64_t v11 = 0;
    *((void *)v4 + 7) = objc_msgSend(a3, "newLibraryWithURL:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", @"MTLBVHBuilder", @"metallib"), &v11);
    *((void *)v4 + 13) = v4[4];
    *(void *)&long long v13 = &unk_1ECAC7100;
    *((void *)&v13 + 1) = v4;
    uint64_t v15 = &v13;
    std::__function::__value_func<objc_object  {objcproto23MTLComputePipelineState}* ()(PipelineKey const&)>::swap[abi:ne180100](&v13, (void *)v4 + 14);
    std::__function::__value_func<objc_object  {objcproto23MTLComputePipelineState}* ()(PipelineKey const&)>::~__value_func[abi:ne180100](&v13);
    v8 = (void *)*((void *)v4 + 1);
    if (v8)
    {
      [v8 maxThreadsPerThreadgroup];
    }
    else
    {
      long long v13 = 0uLL;
      uint64_t v14 = 0;
    }
    uint64_t v9 = v14;
    *(_OWORD *)(v4 + 38) = v13;
    *((void *)v4 + 21) = v9;
    [v4 initPipelinesWithDevice:a3];
  }
  return (MTLGPUBVHBuilder *)v4;
}

- (void)initPipelinesWithDevice:(id)a3
{
  self->KERNEL_INDEX_DISPATCH_BINS = 0;
  self->KERNEL_INDEX_BIN_FRAGMENTS = 1;
  self->KERNEL_INDEX_CLEAR_BATCHES = 2;
  self->KERNEL_INDEX_CREATE_BVH_NODES = 3;
  self->KERNEL_INDEX_FIND_BEST_SPLIT = 4;
  self->KERNEL_INDEX_SPLIT_FRAGMENTS = 5;
  self->KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL = 6;
  self->KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT = 7;
  self->KERNEL_INDEX_INITIALIZE_QUEUE = 8;
  self->KERNEL_INDEX_INITIALIZE_DEBUG_FRAGMENT_INDICES = 9;
  self->KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES = 10;
  self->KERNEL_INDEX_INITIALIZE_FRAGMENTS = 11;
  self->KERNEL_INDEX_INITIALIZE_COUNTERS = 12;
  self->KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS = 13;
  self->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS = 14;
  self->KERNEL_INDEX_GET_POLYGON_FRAGMENTS = 15;
  self->KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS = 16;
  self->KERNEL_INDEX_GET_CURVE_FRAGMENTS = 17;
  self->KERNEL_INDEX_WRITE_BVH_METADATA = 18;
  self->KERNEL_INDEX_SET_COUNTERS = 19;
  self->KERNEL_INDEX_COPY_COUNTERS = 20;
  self->KERNEL_INDEX_DISPATCH_INDIRECT = 21;
  self->KERNEL_INDEX_ENCODE_MTL_BVH_NODE0 = 22;
  self->KERNEL_INDEX_ENCODE_MTL_PRIMITIVE_BVH = 23;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH = 24;
  self->KERNEL_INDEX_ENCODE_MTL_PRIMITIVE_BVH_INNER_NODE = 25;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_INNER_NODE = 26;
  self->KERNEL_INDEX_ENCODE_MTL_TRIANGLE_BVH_LEAF_NODE = 27;
  self->KERNEL_INDEX_ENCODE_MTL_BBOX_BVH_LEAF_NODE = 28;
  self->KERNEL_INDEX_ENCODE_MTL_CURVE_BVH_LEAF_NODE = 29;
  self->KERNEL_INDEX_ENCODE_MTL_CURVE_BVH_CONTROL_POINTS = 30;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_DEFAULT = 31;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_USER_ID = 32;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT = 33;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_RESOURCE_IDS_DEFAULT = 34;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_RESOURCE_IDS_USER_ID = 35;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_RESOURCE_IDS_INDIRECT = 36;
  self->KERNEL_INDEX_GET_COMPACTED_MTL_BVH_SIZE_32 = 37;
  self->KERNEL_INDEX_GET_COMPACTED_MTL_BVH_SIZE_64 = 38;
  self->KERNEL_INDEX_GET_MTL_BVH_SIZE = 39;
  self->KERNEL_INDEX_GET_MTL_BVH_DEPTH = 40;
  self->KERNEL_INDEX_COPY_AND_COMPACT_MTL_BVH_HEADER = 41;
  self->KERNEL_INDEX_COPY_MTL_BVH_HEADER = 42;
  self->KERNEL_INDEX_COPY_MTL_BVH_INNER_NODES = 43;
  self->KERNEL_INDEX_COPY_MTL_BVH_LEAF_NODES = 44;
  self->KERNEL_INDEX_COPY_MTL_BVH_PRIMITIVES = 45;
  self->KERNEL_INDEX_COPY_MTL_BVH_GEOMETRIES = 46;
  self->KERNEL_INDEX_COPY_MTL_BVH_TRANSFORMS = 47;
  self->KERNEL_INDEX_COPY_MTL_PRIMITIVE_BVHS = 48;
  self->KERNEL_INDEX_COPY_MTL_BVH_CONTROL_POINTS = 49;
  self->KERNEL_INDEX_COPY_MTL_BVH_RESOURCE_IDS = 50;
  self->KERNEL_INDEX_GET_MTL_INSTANCE_BOUNDING_BOXES_DEFAULT = 51;
  self->KERNEL_INDEX_GET_MTL_INSTANCE_BOUNDING_BOXES_USER_ID = 52;
  self->KERNEL_INDEX_GET_MTL_INSTANCE_BOUNDING_BOXES_INDIRECT = 53;
  self->KERNEL_INDEX_COPY = 54;
  self->KERNEL_INDEX_REFIT_TRIANGLE_LEAF_NODE = 55;
  self->KERNEL_INDEX_REFIT_TRIANGLE_LEAF_NODE_IN_PLACE = 56;
  self->KERNEL_INDEX_REFIT_BBOX_LEAF_NODE = 57;
  self->KERNEL_INDEX_REFIT_BBOX_LEAF_NODE_IN_PLACE = 58;
  self->KERNEL_INDEX_REFIT_CURVE_LEAF_NODE = 59;
  self->KERNEL_INDEX_REFIT_CURVE_LEAF_NODE_IN_PLACE = 60;
  self->KERNEL_INDEX_REFIT_CURVE_CONTROL_POINTS = 61;
  self->KERNEL_INDEX_REFIT_CURVE_CONTROL_POINTS_IN_PLACE = 62;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT = 63;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID = 64;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT = 65;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT_IN_PLACE = 66;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID_IN_PLACE = 67;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT_IN_PLACE = 68;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_DEFAULT = 69;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_USER_ID = 70;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_INDIRECT = 71;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_DEFAULT_IN_PLACE = 72;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_USER_ID_IN_PLACE = 73;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_INDIRECT_IN_PLACE = 74;
  self->KERNEL_INDEX_REFIT_INNER_NODE = 75;
  self->KERNEL_INDEX_REFIT_INNER_NODE_IN_PLACE = 76;
  self->KERNEL_INDEX_REFIT_GEOMETRIES = 77;
  self->KERNEL_INDEX_REFIT_GEOMETRIES_IN_PLACE = 78;
  self->KERNEL_INDEX_GET_SERIALIZED_MTL_BVH_SIZE = 79;
  self->KERNEL_INDEX_GET_SERIALIZED_MTL_BVH_RAW_SIZE = 80;
  self->KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE = 81;
  self->KERNEL_INDEX_GET_DESERIALIZED_MTL_PRIMITIVE_BVH_SIZES = 82;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SERIALIZATION_DATA = 83;
  self->KERNEL_INDEX_WRITE_SERIALIZED_MTL_BVH = 84;
  self->KERNEL_INDEX_WRITE_DESERIALIZED_MTL_BVH = 85;
  self->KERNEL_INDEX_GET_GEOMETRY_SIZE = 86;
  self->KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT = 87;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_PRIMITIVES = 88;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_1 = 89;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_1 = 90;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_INNER_NODES = 91;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_1 = 92;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_PRIMITIVE_NODES = 93;
  self->KERNEL_INDEX_PATCH_SERIALIZED_MTL_BVH = 94;
  self->KERNEL_INDEX_PATCH_DESERIALIZED_MTL_BVH = 95;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY = 96;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_TRANSFORMS = 97;
  self->KERNEL_INDEX_DISPATCH_INDIRECT_64 = 98;
  self->KERNEL_INDEX_DISPATCH_BINS_WIDE = 99;
  self->KERNEL_INDEX_MEMCPY_INDIRECT_64 = 100;
  self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_INIT = 101;
  self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_FINISH_ITERATION = 102;
  self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_CLASSIFY = 103;
  self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT = 104;
  self->KERNEL_INDEX_PREFIX_SUM = 105;
  self->KERNEL_INDEX_PREFIX_SUM_REDUCE = 106;
  self->KERNEL_INDEX_PREFIX_SUM_ADD = 107;
  self->KERNEL_INDEX_COPY_FRAGMENT_INDICES = 108;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_0 = 109;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_0 = 110;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_0 = 111;
  self->KERNEL_INDEX_WRITE_SERIALIZATION_DATA = 112;
  self->KERNEL_INDEX_ENCODE_PRIMITIVE_DATA = 113;
  self->KERNEL_INDEX_REFIT_PRIMITIVE_DATA = 114;
  self->KERNEL_INDEX_REFIT_PRIMITIVE_DATA_IN_PLACE = 115;
  self->KERNEL_INDEX_COPY_PRIMITIVE_DATA = 116;
  self->KERNEL_INDEX_EXTRACT_PRIMITIVE_DATA = 117;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_2 = 118;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2 = 119;
  self->KERNEL_INDEX_REFIT_HEADER = 120;
  self->KERNEL_INDEX_REFIT_HEADER_IN_PLACE = 121;
  self->KERNEL_INDEX_FINISH_BUILD_ITERATION = 122;
  self->KERNEL_INDEX_THREADGROUP_BREADTH_FIRST_LAYOUT = 123;
  self->KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL = 124;
  self->KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT = 125;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_3 = 126;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_3 = 127;
  self->KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM = 128;
  self->KERNEL_INDEX_ZERO_BUFFER = 129;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_4 = 130;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_5 = 131;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_4 = 132;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_5 = 133;
  self->KERNEL_INDEX_EXTRACT_CONTROL_POINT_DATA = 134;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_5 = 135;
  operator new[]();
}

- (void)dealloc
{
  pipelineInfos = self->_pipelineInfos;
  if (pipelineInfos)
  {
    MEMORY[0x18530C120](pipelineInfos, 0x1050C80A90F5278);
    self->_pipelineInfos = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)MTLGPUBVHBuilder;
  [(MTLGPUBVHBuilder *)&v4 dealloc];
}

+ (BOOL)supportsDevice:(id)a3
{
  return [a3 supportsIndirectDrawAndDispatch];
}

- (unint64_t)maxDepthForDescriptor:(id)a3
{
  return _MTLClampMaxDepthForDescriptor((MTLBVHDescriptor *)a3);
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  return a3 == 0x200000000;
}

- (BOOL)useSpatialSplitsForDescriptor:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count");
  if (v4)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      LOBYTE(v4) = [a3 splitHeuristic] == 3;
    }
  }
  return v4;
}

- (BOOL)useResourceBufferForDescriptor:(id)a3
{
  BOOL result = 1;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count") <= 1
    && ([a3 primitiveMotion] & 1) == 0)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count")) {
      return 0;
    }
    int v5 = objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "objectAtIndexedSubscript:", 0);
    if (([v5 primitiveType] || !objc_msgSend(v5, "transformationMatrixBuffer"))
      && (![v5 primitiveDataBuffer] || !objc_msgSend(v5, "primitiveDataElementSize"))
      && [v5 primitiveType] != 2)
    {
      return 0;
    }
  }
  return result;
}

- (unint64_t)fragmentScratchSizeForDescriptor:(id)a3
{
  if (![a3 deterministic]) {
    return 0;
  }
  unint64_t v5 = [(MTLGPUBVHBuilder *)self fragmentTotalThreadgroupCountForDescriptor:a3];
  return +[MTLGPUBVHBuilder prefixSumScratchBufferSizeWithCapacity:v5]+ 4 * v5;
}

- (unint64_t)getBuildScratchBufferSizeForDescriptor:(id)a3
{
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  unint64_t v33 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a3 fragmentCapacity:&v37 fragmentIndexCapacity:&v33 innerNodeCapacity:&v36 leafNodeCapacity:&v35 primitiveDataCapacity:&v34];
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  if (v33 > 0x2000)
  {
    unint64_t batchSize = self->_batchSize;
    unint64_t v8 = (v33 + batchSize) / (batchSize + 1);
    if (v8 >= 2) {
      uint64_t v5 = 2 * v8;
    }
    else {
      uint64_t v5 = 2;
    }
    if ((v33 + batchSize - 1) / batchSize <= 1) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = (v33 + batchSize - 1) / batchSize;
    }
  }
  unint64_t v9 = [(MTLGPUBVHBuilder *)self fragmentScratchSizeForDescriptor:a3];
  unint64_t v10 = v33;
  unint64_t v11 = (4 * v33 + 255) & 0xFFFFFFFFFFFFFF00;
  uint64_t v12 = [a3 maxSubKeyframeTemporalSplits];
  uint64_t v13 = 2 * v10 + 255;
  if (!v12) {
    uint64_t v13 = 0;
  }
  unint64_t v14 = (((((((((v13 + v11) & 0xFFFFFFFFFFFFFF00) + 259) & 0xFFFFFFFFFFFFFF00) + 271) & 0xFFFFFFFFFFFFFF00) + 271) & 0xFFFFFFFFFFFFFF00)
       + 3071) & 0xFFFFFFFFFFFFFF00;
  if ([a3 motion]) {
    uint64_t v15 = 256;
  }
  else {
    uint64_t v15 = 0;
  }
  if ([a3 motion]) {
    uint64_t v16 = 256;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = v16 + v15;
  if ([a3 motion]) {
    uint64_t v18 = 256;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = v18 + v17;
  if ([a3 motion]) {
    uint64_t v20 = 256;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v21 = (24 * v5
       + 255
       + ((24 * v5
         + 255
         + ((192 * v6
           + 255
           + ((192 * v6
             + 255
             + ((192 * v6
               + 255
               + ((8 * v35
                 + 255
                 + 1536 * v6
                 + ((8 * v35 + 255 + ((v9 + v20 + v19 + v14 + 255) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00;
  int v22 = [a3 motion];
  uint64_t v23 = 76;
  if (v22) {
    uint64_t v23 = 140;
  }
  unint64_t v24 = (((16 * v6
         + 255
         + ((16 * v6
           + 255
           + ((4 * v6 + 255 + ((4 * v6 + 255 + ((v21 + v23 * v5 + 255) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)
       + 275) & 0xFFFFFFFFFFFFFF00;
  int v25 = [a3 motion];
  if ([a3 motion]) {
    uint64_t v26 = 768 * v6;
  }
  else {
    uint64_t v26 = 0;
  }
  if (v25) {
    uint64_t v27 = 768 * v6 + 267;
  }
  else {
    uint64_t v27 = 256;
  }
  unint64_t v28 = (v27 + v26 + v24) & 0xFFFFFFFFFFFFFF00;
  if ([a3 motion]) {
    uint64_t v29 = 192 * v6 + 255;
  }
  else {
    uint64_t v29 = 0;
  }
  unint64_t v30 = (v29 + v28) & 0xFFFFFFFFFFFFFF00;
  if ([a3 motion]) {
    uint64_t v31 = 192 * v6;
  }
  else {
    uint64_t v31 = 0;
  }
  return v30 + v31;
}

- (unint64_t)fragmentTotalThreadgroupCountForDescriptor:(id)a3
{
  uint64_t v4 = (void *)[a3 geometryDescriptors];
  uint64_t v5 = [v4 count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  for (uint64_t i = 0; i != v6; ++i)
  {
    int v9 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", i), "primitiveCount");
    if (v9) {
      v7 += (v9 + self->_threadgroupSize - 1) / self->_threadgroupSize;
    }
  }
  return v7;
}

- (id)retainedResourcesArrayWithEncoder:(id)a3
{
  v3 = (void *)[a3 commandBuffer];
  if ([v3 retainedReferences]) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MTLGPUBVHBuilder_retainedResourcesArrayWithEncoder___block_invoke;
  v6[3] = &unk_1E521FA10;
  v6[4] = v4;
  [v3 addCompletedHandler:v6];
  return v4;
}

void __54__MTLGPUBVHBuilder_retainedResourcesArrayWithEncoder___block_invoke(uint64_t a1)
{
}

- (id)newResourceBufferWithDescriptor:(id)a3 retainedResources:(id)a4
{
  id v5 = a3;
  unint64_t v7 = (void *)[a3 geometryDescriptors];
  LODWORD(v5) = [v5 primitiveMotion];
  uint64_t v8 = [v7 count];
  unsigned int v12 = 0;
  int v9 = (void *)[(MTLDevice *)self->_device newBufferWithLength:computeResourceBufferLength((int)v5, &v12, v8, v7) options:0];
  uint64_t v10 = [v9 contents];
  setResourceBufferContents(v10, (int)v5, v12, v8, v7, [v9 gpuAddress]);
  [a4 addObject:v9];
  return v9;
}

- (void)setResourceBufferWithDescriptor:(id)a3 retainedResources:(id)a4 onEncoder:(id)a5 atIndex:(unint64_t)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = (void *)[a3 geometryDescriptors];
  int v12 = [a3 primitiveMotion];
  unint64_t v13 = [v11 count];
  unsigned int v21 = 0;
  size_t v14 = computeResourceBufferLength(v12, &v21, v13, v11);
  size_t v15 = v14;
  if (v13 > 0x10) {
    int v16 = 1;
  }
  else {
    int v16 = v12;
  }
  if (v16)
  {
    id v20 = (id)[(MTLDevice *)self->_device newBufferWithLength:v14 options:0];
    uint64_t v17 = (char *)[v20 contents];
  }
  else
  {
    uint64_t v17 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v17, v14);
    id v20 = 0;
  }
  setResourceBufferContents((uint64_t)v17, v12, v21, v13, v11, [v20 gpuAddress]);
  if (v16)
  {
    [a5 setBuffer:v20 offset:0 atIndex:a6];
    [a4 addObject:v20];
    id v18 = v20;
  }
  else
  {
    [a5 setBytes:v17 length:v15 atIndex:a6];
  }
}

- (id)newIndirectBufferWithCapacity:(unint64_t)a3 withRetainedResources:(id)a4 indirectBufferStride:(unint64_t *)a5
{
  if (self->_supportsDispatchThreadsWithIndirectBuffer) {
    unint64_t v7 = 12;
  }
  else {
    unint64_t v7 = 256;
  }
  uint64_t v8 = (void *)[(MTLDevice *)self->_device newBufferWithLength:v7 * a3 options:0];
  if (a5) {
    *a5 = v7;
  }
  [a4 addObject:v8];
  return v8;
}

- (id)newPrimitiveCountBufferWithEncoder:(id)a3 descriptor:(id)a4 retainedResources:(id)a5
{
  unint64_t v7 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4 * objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors", a3), "count"), 0);
  [a5 addObject:v7];
  uint64_t v8 = [v7 contents];
  if (objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"))
  {
    unint64_t v9 = 0;
    do
    {
      *(_DWORD *)(v8 + 4 * v9) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", v9), "primitiveCount");
      ++v9;
    }
    while (v9 < objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"));
  }
  return v7;
}

- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3 nodeOffset:(unint64_t *)a4 fragmentOffset:(unint64_t *)a5 fragmentIndexOffset:(unint64_t *)a6 childIndexOffset:(unint64_t *)a7
{
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a3 fragmentCapacity:&v25 fragmentIndexCapacity:&v21 innerNodeCapacity:&v24 leafNodeCapacity:&v23 primitiveDataCapacity:&v22];
  *a4 = 256;
  int v12 = [a3 motion];
  uint64_t v13 = 36;
  if (v12) {
    uint64_t v13 = 72;
  }
  uint64_t v14 = (v23 + v24) * v13 + 511;
  *a5 = v14 & 0xFFFFFFFFFFFFFF00;
  int v15 = [a3 motion];
  uint64_t v16 = 40;
  if (v15) {
    uint64_t v16 = 72;
  }
  unint64_t v17 = ((v14 | 0xF8) + v25 * v16) & 0xFFFFFFFFFFFFFF00;
  *a6 = v17;
  unint64_t v18 = (v17 + 4 * v21 + 255) & 0xFFFFFFFFFFFFFF00;
  *a7 = v18;
  if ([a3 branchingFactor] != 2)
  {
    uint64_t v19 = v24;
    v18 += 4 * v19 * [a3 branchingFactor];
  }
  return (v18 + 255) & 0xFFFFFFFFFFFFFF00;
}

- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v4 = 0;
  return [(MTLGPUBVHBuilder *)self getGenericBVHSizeForDescriptor:a3 nodeOffset:&v7 fragmentOffset:&v6 fragmentIndexOffset:&v5 childIndexOffset:&v4];
}

- (void)setCounters:(const CounterValue *)a3 numCounters:(unint64_t)a4 encoder:(id)a5
{
  uint64_t v14 = 0;
  p_pipelineCache = &self->_pipelineCache;
  int KERNEL_INDEX_SET_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_SET_COUNTERS);
  *(_OWORD *)&v16[4] = 0u;
  long long v17 = 0u;
  int v15 = KERNEL_INDEX_SET_COUNTERS_low;
  *(void *)uint64_t v16 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  objc_msgSend(a5, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v15, &v14));
  [a5 setBytes:a3 length:16 * a4 atIndex:30];
  if ([a5 dispatchType] == 1) {
    [a5 memoryBarrierWithScope:1];
  }
  unint64_t v12 = a4;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v10 = v14;
  int64x2_t v11 = v13;
  [a5 dispatchThreads:&v12 threadsPerThreadgroup:&v10];
}

- (void)copyFromBuffer:(id)a3 sourceBufferOffset:(unint64_t)a4 toBuffer:(id)a5 destinationBufferOffset:(unint64_t)a6 length:(unint64_t)a7 encoder:(id)a8
{
  if (a7)
  {
    unint64_t v9 = a7;
    unint64_t v21 = 0;
    p_pipelineCache = &self->_pipelineCache;
    int KERNEL_INDEX_COPY_low = LOBYTE(self->KERNEL_INDEX_COPY);
    *(_OWORD *)&v22[8] = 0u;
    long long v23 = 0u;
    *(_DWORD *)uint64_t v22 = KERNEL_INDEX_COPY_low;
    *(void *)&v22[4] = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
    objc_msgSend(a8, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v22, &v21));
    [a8 setBuffer:a5 offset:0 atIndex:28];
    [a8 setBuffer:a3 offset:0 atIndex:29];
    *(void *)uint64_t v22 = a4 >> 2;
    *(void *)&v22[8] = a6 >> 2;
    v9 += 3;
    *(void *)&v22[16] = v9 >> 2;
    [a8 setBytes:v22 length:24 atIndex:30];
    unint64_t v16 = (v21 + (v9 >> 2) - 1) / v21;
    if ([a8 dispatchType] == 1) {
      [a8 memoryBarrierWithScope:1];
    }
    unint64_t v19 = v16;
    int64x2_t v20 = vdupq_n_s64(1uLL);
    unint64_t v17 = v21;
    int64x2_t v18 = v20;
    [a8 dispatchThreadgroups:&v19 threadsPerThreadgroup:&v17];
  }
}

- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 threadgroupSize:(unint64_t)a10 encoder:(id)a11
{
  int v11 = a8;
  unint64_t threadgroupSize = a10;
  if (!a10) {
    unint64_t threadgroupSize = self->_threadgroupSize;
  }
  uint64_t v27 = 0;
  p_pipelineCache = &self->_pipelineCache;
  int KERNEL_INDEX_DISPATCH_INDIRECT_low = LOBYTE(self->KERNEL_INDEX_DISPATCH_INDIRECT);
  *(_OWORD *)&v29[4] = 0u;
  long long v30 = 0u;
  int v28 = KERNEL_INDEX_DISPATCH_INDIRECT_low;
  *(void *)uint64_t v29 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  objc_msgSend(a11, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v28, &v27));
  [a11 setBuffer:a6 offset:a7 atIndex:28];
  int v28 = v11;
  *(_DWORD *)uint64_t v29 = a9;
  [a11 setBytes:&v28 length:8 atIndex:29];
  [a11 setBuffer:a4 offset:a5 atIndex:30];
  uint64_t v20 = v27;
  if ([a11 dispatchType] == 1) {
    [a11 memoryBarrierWithScope:1];
  }
  int64x2_t v24 = vdupq_n_s64(1uLL);
  int64x2_t v25 = v24;
  uint64_t v26 = 1;
  uint64_t v23 = v20;
  [a11 dispatchThreadgroups:&v25 threadsPerThreadgroup:&v23];
  if ([a11 dispatchType] == 1) {
    [a11 memoryBarrierWithScope:1];
  }
  [a11 setComputePipelineState:a3];
  unint64_t v21 = threadgroupSize;
  int64x2_t v22 = vdupq_n_s64(1uLL);
  [a11 dispatchThreadgroupsWithIndirectBuffer:a4 indirectBufferOffset:a5 threadsPerThreadgroup:&v21];
}

- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10
{
}

- (void)fastIndirectGPUMemcpyWithEncoder:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 srcBuffer:(id)a6 srcBufferOffset:(unint64_t)a7 dstBuffer:(id)a8 dstBufferOffset:(unint64_t)a9 lengthBuffer:(id)a10 lengthOffset:(unint64_t)a11 retainedResources:(id)a12
{
  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_DISPATCH_INDIRECT_64, self->_pipelineCache.baseThreadgroupSize, 0);
  unint64_t v19 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_MEMCPY_INDIRECT_64, p_pipelineCache->baseThreadgroupSize, 0);
  [a3 setComputePipelineState:Pipeline];
  [a3 setBuffer:a10 offset:a11 atIndex:28];
  unsigned int v20 = 16 * self->_threadgroupSize;
  v30[0] = 0;
  v30[1] = v20;
  [a3 setBytes:v30 length:8 atIndex:29];
  [a3 setBuffer:a4 offset:0 atIndex:30];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v28 = vdupq_n_s64(1uLL);
  uint64_t v29 = 1;
  int64x2_t v26 = v28;
  uint64_t v27 = 1;
  [a3 dispatchThreadgroups:&v28 threadsPerThreadgroup:&v26];
  [a3 setComputePipelineState:v19];
  [a3 setBuffer:a6 offset:a7 atIndex:0];
  [a3 setBuffer:a8 offset:a9 atIndex:1];
  [a3 setBuffer:a10 offset:a11 atIndex:2];
  uint64_t threadgroupSize = self->_threadgroupSize;
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  uint64_t v24 = threadgroupSize;
  int64x2_t v25 = vdupq_n_s64(1uLL);
  [a3 dispatchThreadgroupsWithIndirectBuffer:a4 indirectBufferOffset:a5 threadsPerThreadgroup:&v24];
}

- (void)dispatchIndirect64:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10
{
  int v10 = a8;
  uint64_t v27 = 0;
  p_pipelineCache = &self->_pipelineCache;
  int KERNEL_INDEX_DISPATCH_INDIRECT_64_low = LOBYTE(self->KERNEL_INDEX_DISPATCH_INDIRECT_64);
  *(_OWORD *)&v29[4] = 0u;
  long long v30 = 0u;
  int v28 = KERNEL_INDEX_DISPATCH_INDIRECT_64_low;
  *(void *)uint64_t v29 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  objc_msgSend(a10, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v28, &v27));
  [a10 setBuffer:a6 offset:a7 atIndex:28];
  int v28 = v10;
  *(_DWORD *)uint64_t v29 = a9;
  [a10 setBytes:&v28 length:8 atIndex:29];
  [a10 setBuffer:a4 offset:a5 atIndex:30];
  uint64_t v19 = v27;
  if ([a10 dispatchType] == 1) {
    [a10 memoryBarrierWithScope:1];
  }
  int64x2_t v24 = vdupq_n_s64(1uLL);
  int64x2_t v25 = v24;
  uint64_t v26 = 1;
  uint64_t v23 = v19;
  [a10 dispatchThreadgroups:&v25 threadsPerThreadgroup:&v23];
  [a10 setComputePipelineState:a3];
  uint64_t threadgroupSize = self->_threadgroupSize;
  if ([a10 dispatchType] == 1) {
    [a10 memoryBarrierWithScope:1];
  }
  uint64_t v21 = threadgroupSize;
  int64x2_t v22 = vdupq_n_s64(1uLL);
  [a10 dispatchThreadgroupsWithIndirectBuffer:a4 indirectBufferOffset:a5 threadsPerThreadgroup:&v21];
}

- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 counterBuffer:(id)a6 counterBufferOffset:(unint64_t)a7 counterIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 threadgroupSize:(unint64_t)a10 encoder:(id)a11
{
  if (a9 == 1) {
    [(MTLGPUBVHBuilder *)self dispatchIndirect:a3 counterBuffer:a6 counterBufferOffset:a7 counterIndex:a8 threadgroupSize:a10 encoder:a11];
  }
  else {
    -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:", a3, a4, a5, a6, a7, (a8 & 0xFFFFFFFFFFFFFFLL) << 6);
  }
}

- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 counterBuffer:(id)a6 counterBufferOffset:(unint64_t)a7 counterIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10
{
}

- (void)dispatchIndirect:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5 counterIndex:(unint64_t)a6 threadgroupSize:(unint64_t)a7 encoder:(id)a8
{
  unint64_t threadgroupSize = a7;
  if (!a7) {
    unint64_t threadgroupSize = self->_threadgroupSize;
  }
  [a8 setComputePipelineState:a3];
  if ([a8 dispatchType] == 1) {
    [a8 memoryBarrierWithScope:1];
  }
  unint64_t v13 = threadgroupSize;
  int64x2_t v14 = vdupq_n_s64(1uLL);
  [a8 dispatchThreadgroupsWithIndirectBuffer:a4 indirectBufferOffset:a5 + (a6 << 8) threadsPerThreadgroup:&v13];
}

- (void)dispatchIndirect:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5 threadgroupSize:(unint64_t)a6 encoder:(id)a7
{
  unint64_t threadgroupSize = a6;
  if (!a6) {
    unint64_t threadgroupSize = self->_threadgroupSize;
  }
  [a7 setComputePipelineState:a3];
  if ([a7 dispatchType] == 1) {
    [a7 memoryBarrierWithScope:1];
  }
  unint64_t v11 = threadgroupSize;
  int64x2_t v12 = vdupq_n_s64(1uLL);
  [a7 dispatchThreadgroupsWithIndirectBuffer:a4 indirectBufferOffset:a5 threadsPerThreadgroup:&v11];
}

- (void)getPolygonFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24
{
  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_INITIALIZE_FRAGMENTS, a4);
  v80 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_GET_POLYGON_FRAGMENTS, a4);
  [a3 setBuffer:a11 offset:a12 atIndex:1];
  [a3 setBuffer:a9 offset:a10 atIndex:2];
  [a3 setBuffer:a13 offset:a14 atIndex:7];
  [a3 setBuffer:a15 offset:a16 atIndex:8];
  if ([a4 primitiveMotion])
  {
    *(_DWORD *)v93 = [a4 primitiveKeyframeCount];
    [a3 setBytes:v93 length:4 atIndex:14];
    [a4 primitiveMotionStartTime];
    LODWORD(v96) = v28;
    [a3 setBytes:&v96 length:4 atIndex:15];
    [a4 primitiveMotionEndTime];
    LODWORD(v95) = v29;
    [a3 setBytes:&v95 length:4 atIndex:16];
    [a3 setBuffer:a17 offset:a18 atIndex:17];
    [a3 setBuffer:a19 offset:a20 atIndex:18];
    [a3 setBuffer:a23 offset:a24 atIndex:19];
    [a3 setBuffer:a21 offset:a22 atIndex:20];
  }
  [a3 setComputePipelineState:Pipeline];
  uint64_t threadgroupSize = self->_threadgroupSize;
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v105 = vdupq_n_s64(1uLL);
  uint64_t v106 = 1;
  uint64_t v103 = threadgroupSize;
  int64x2_t v104 = v105;
  [a3 dispatchThreadgroups:&v105 threadsPerThreadgroup:&v103];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  v82 = (void *)[a4 geometryDescriptors];
  uint64_t v31 = [v82 count];
  if (a7)
  {
    uint64_t v95 = 0;
    uint64_t v96 = 0;
    if (self->_supportsDispatchThreadsWithIndirectBuffer)
    {
      id v81 = a5;
      unint64_t v73 = a6 + 200;
      int KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_COPY_COUNTERS);
      *(_OWORD *)&v93[8] = 0u;
      long long v94 = 0u;
      *(_DWORD *)v93 = KERNEL_INDEX_COPY_COUNTERS_low;
      *(void *)&v93[4] = (log2((double)p_pipelineCache->baseThreadgroupSize) & 0xF) << 13;
      v71 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v93, &v95);
      unint64_t v33 = v82;
      if (!v31)
      {
LABEL_60:

        return;
      }
    }
    else
    {
      id v47 = [(MTLGPUBVHBuilder *)self retainedResourcesArrayWithEncoder:a3];
      unint64_t v33 = v82;
      if ((unint64_t)[v82 count] <= 4) {
        uint64_t v48 = [v82 count];
      }
      else {
        uint64_t v48 = 4;
      }
      id v81 = [(MTLGPUBVHBuilder *)self newIndirectBufferWithCapacity:v48 withRetainedResources:v47 indirectBufferStride:&v96];
      unint64_t v73 = 0;
      v71 = 0;
      if (!v31) {
        goto LABEL_60;
      }
    }
    uint64_t v49 = 0;
    unsigned int v70 = self->_threadgroupSize;
    unint64_t v76 = a8;
    uint64_t v78 = 0;
    unint64_t v72 = v31;
    do
    {
      uint64_t v50 = v49 + 4;
      unint64_t v74 = v49 + 4;
      if (v49 + 4 >= (unint64_t)[v33 count]) {
        uint64_t v50 = [v33 count];
      }
      if (self->_supportsDispatchThreadsWithIndirectBuffer)
      {
        *(void *)v93 = a8 + 4 * v49 + [a7 gpuAddress];
        *(void *)&v93[8] = [v81 gpuAddress] + v73;
        if (v50 != v49)
        {
          uint64_t v51 = 0;
          uint64_t v52 = v50 + v78;
          if ((unint64_t)(v50 + v78) <= 1) {
            uint64_t v52 = 1;
          }
          uint64_t v53 = (unsigned int *)&v93[20];
          do
          {
            *((_WORD *)v53 - 2) = 4 * v51;
            *((_WORD *)v53 - 1) = 12 * v51;
            *uint64_t v53 = v70;
            v53 += 2;
            ++v51;
          }
          while (v52 != v51);
        }
        [a3 setComputePipelineState:v71];
        [a3 setBytes:v93 length:48 atIndex:30];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        uint64_t v91 = v50 - v49;
        int64x2_t v92 = vdupq_n_s64(1uLL);
        uint64_t v89 = v95;
        int64x2_t v90 = v92;
        [a3 dispatchThreads:&v91 threadsPerThreadgroup:&v89];
      }
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      [a3 setComputePipelineState:v80];
      if (v50 != v49)
      {
        uint64_t v54 = 0;
        unint64_t v55 = v76;
        if ((unint64_t)(v50 + v78) <= 1) {
          uint64_t v56 = 1;
        }
        else {
          uint64_t v56 = v50 + v78;
        }
        unint64_t v57 = v73;
        do
        {
          v58 = (void *)[v33 objectAtIndexedSubscript:v49 + v54];
          if ([v58 primitiveCount])
          {
            [a3 setBuffer:a7 offset:v55 atIndex:0];
            objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v58, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v58, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 3);
            objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v58, "indexBuffer"), objc_msgSend(v58, "indexBufferOffset"), 4);
            *(_DWORD *)v93 = v49 + v54;
            int v102 = 0;
            int v59 = [v58 polygonType];
            int v101 = 0;
            int v102 = v59;
            uint64_t v60 = [v58 vertexStride];
            MTLAttributeFormat v61 = [v58 vertexFormat];
            if (!v60) {
              LODWORD(v60) = MTLAttributeFormatSize(v61, v62, v63, v64, v65, v66, v67, v68);
            }
            int v101 = v60;
            int v88 = 0;
            if ([v58 indexBuffer])
            {
              if ([v58 indexType]) {
                int v69 = 4;
              }
              else {
                int v69 = 2;
              }
            }
            else
            {
              int v69 = 0;
            }
            unint64_t v33 = v82;
            int v88 = v69;
            [a3 setBytes:v93 length:4 atIndex:9];
            [a3 setBytes:&v102 length:4 atIndex:10];
            [a3 setBytes:&v101 length:4 atIndex:11];
            [a3 setBytes:&v88 length:4 atIndex:12];
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              uint64_t v86 = self->_threadgroupSize;
              int64x2_t v87 = vdupq_n_s64(1uLL);
              [a3 dispatchThreadgroupsWithIndirectBuffer:v81 indirectBufferOffset:v57 threadsPerThreadgroup:&v86];
            }
            else
            {
              [(MTLGPUBVHBuilder *)self dispatchIndirect:v80 indirectBuffer:v81 indirectBufferOffset:v96 * v54 threadCountBuffer:a7 threadCountBufferOffset:a8 threadCountIndex:v49 + v54 threadgroupDivisor:self->_threadgroupSize encoder:a3];
            }
          }
          ++v54;
          v57 += 12;
          v55 += 4;
        }
        while (v56 != v54);
      }
      v49 += 4;
      v76 += 16;
      v78 -= 4;
    }
    while (v74 < v72);
    goto LABEL_60;
  }
  [a3 setComputePipelineState:v80];
  if (v31)
  {
    uint64_t v34 = 0;
    int64x2_t v85 = vdupq_n_s64(1uLL);
    do
    {
      uint64_t v35 = (void *)[v82 objectAtIndexedSubscript:v34];
      *(_DWORD *)v93 = 0;
      *(_DWORD *)v93 = [v35 primitiveCount];
      if (*(_DWORD *)v93)
      {
        [a3 setBytes:v93 length:4 atIndex:0];
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 3);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v35, "indexBuffer"), objc_msgSend(v35, "indexBufferOffset"), 4);
        LODWORD(v96) = v34;
        LODWORD(v95) = 0;
        LODWORD(v95) = [v35 polygonType];
        int v102 = 0;
        uint64_t v36 = [v35 vertexStride];
        MTLAttributeFormat v37 = [v35 vertexFormat];
        if (!v36) {
          LODWORD(v36) = MTLAttributeFormatSize(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        int v101 = 0;
        int v102 = v36;
        if ([v35 indexBuffer])
        {
          if ([v35 indexType]) {
            int v45 = 4;
          }
          else {
            int v45 = 2;
          }
        }
        else
        {
          int v45 = 0;
        }
        int v101 = v45;
        [a3 setBytes:&v96 length:4 atIndex:9];
        [a3 setBytes:&v95 length:4 atIndex:10];
        [a3 setBytes:&v102 length:4 atIndex:11];
        [a3 setBytes:&v101 length:4 atIndex:12];
        uint64_t v46 = self->_threadgroupSize;
        uint64_t v99 = (*(_DWORD *)v93 + (int)v46 - 1) / v46;
        int64x2_t v100 = v85;
        uint64_t v97 = v46;
        int64x2_t v98 = v85;
        [a3 dispatchThreadgroups:&v99 threadsPerThreadgroup:&v97];
      }
      ++v34;
    }
    while (v31 != v34);
  }
}

- (void)getBoundingBoxFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24 fragmentScratchBuffer:(id)a25 fragmentScratchBufferOffset:(unint64_t)a26
{
  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_INITIALIZE_FRAGMENTS, a4);
  v118[0] = 3;
  uint64_t v89 = self;
  int v87 = [a4 deterministic];
  if (v87)
  {
    unsigned int KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS = self->KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS;
    v118[0] = 3;
    memset(v100, 0, 40);
    PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)p_pipelineCache, KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS, a4, p_pipelineCache->baseThreadgroupSize, v118, (uint64_t)v100);
    v71 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v100, 0);
    v118[0] |= 4u;
    unsigned int v32 = self->KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS;
    memset(v100, 0, 40);
    PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)p_pipelineCache, v32, a4, p_pipelineCache->baseThreadgroupSize, v118, (uint64_t)v100);
    int64x2_t v85 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v100, 0);
  }
  else
  {
    int64x2_t v85 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS, a4);
    v71 = 0;
  }
  [a3 setBuffer:a11 offset:a12 atIndex:1];
  [a3 setBuffer:a9 offset:a10 atIndex:2];
  [a3 setBuffer:a13 offset:a14 atIndex:7];
  [a3 setBuffer:a15 offset:a16 atIndex:8];
  if ([a4 primitiveMotion])
  {
    LODWORD(v100[0]) = 0;
    LODWORD(v100[0]) = [a4 primitiveKeyframeCount];
    [a3 setBytes:v100 length:4 atIndex:12];
    LODWORD(v111) = 0;
    [a4 primitiveMotionStartTime];
    LODWORD(v111) = v33;
    [a3 setBytes:&v111 length:4 atIndex:13];
    LODWORD(v102) = 0;
    [a4 primitiveMotionEndTime];
    LODWORD(v102) = v34;
    [a3 setBytes:&v102 length:4 atIndex:14];
  }
  if ([a4 motion])
  {
    [a3 setBuffer:a17 offset:a18 atIndex:17];
    [a3 setBuffer:a19 offset:a20 atIndex:18];
    [a3 setBuffer:a23 offset:a24 atIndex:19];
    [a3 setBuffer:a21 offset:a22 atIndex:20];
  }
  [a3 setComputePipelineState:Pipeline];
  uint64_t threadgroupSize = self->_threadgroupSize;
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v116 = vdupq_n_s64(1uLL);
  uint64_t v117 = 1;
  uint64_t v114 = threadgroupSize;
  int64x2_t v115 = v116;
  [a3 dispatchThreadgroups:&v116 threadsPerThreadgroup:&v114];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v92 = (void *)[a4 geometryDescriptors];
  unint64_t v36 = [v92 count];
  v111 = 0;
  v112 = 0;
  uint64_t v113 = 0;
  if (v87)
  {
    std::vector<unsigned long>::resize((uint64_t)&v111, v36);
    MTLAttributeFormat v37 = self;
    if (v36)
    {
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      do
      {
        int v40 = objc_msgSend((id)objc_msgSend(v92, "objectAtIndexedSubscript:", v38), "primitiveCount");
        v111[v38] = 4 * v39;
        if (v40) {
          v39 += (v40 + self->_threadgroupSize - 1) / self->_threadgroupSize;
        }
        ++v38;
      }
      while (v36 != v38);
    }
    else
    {
      uint64_t v39 = 0;
    }
    uint64_t v69 = 4 * v39;
    if (a7)
    {
      objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_ZERO_BUFFER, p_pipelineCache->baseThreadgroupSize, 0));
      [a3 setBuffer:a25 offset:a26 atIndex:0];
      LODWORD(v100[0]) = v39;
      [a3 setBytes:v100 length:4 atIndex:1];
      unint64_t v41 = self->_threadgroupSize;
      unint64_t v109 = (v39 + v41 - 1) / v41;
      int64x2_t v110 = vdupq_n_s64(1uLL);
      unint64_t v107 = v41;
      int64x2_t v108 = v110;
      [a3 dispatchThreadgroups:&v109 threadsPerThreadgroup:&v107];
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      [a3 setBuffer:a11 offset:a12 atIndex:1];
      int v74 = 2;
      goto LABEL_26;
    }
    int v74 = 2;
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v69 = 0;
    int v74 = 1;
    MTLAttributeFormat v37 = self;
    if (a7)
    {
LABEL_26:
      uint64_t v101 = 0;
      uint64_t v102 = 0;
      if (v37->_supportsDispatchThreadsWithIndirectBuffer)
      {
        id v88 = a5;
        int KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(v37->KERNEL_INDEX_COPY_COUNTERS);
        memset((char *)v100 + 8, 0, 32);
        LODWORD(v100[0]) = KERNEL_INDEX_COPY_COUNTERS_low;
        *(void *)((char *)v100 + 4) = (log2((double)p_pipelineCache->baseThreadgroupSize) & 0xF) << 13;
        unint64_t v76 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v100, &v101);
        unint64_t v80 = a6 + 200;
      }
      else
      {
        uint64_t v43 = [(MTLGPUBVHBuilder *)v37 retainedResourcesArrayWithEncoder:a3];
        if ((unint64_t)[v92 count] <= 4) {
          uint64_t v44 = [v92 count];
        }
        else {
          uint64_t v44 = 4;
        }
        id v88 = [(MTLGPUBVHBuilder *)v37 newIndirectBufferWithCapacity:v44 withRetainedResources:v43 indirectBufferStride:&v102];
        unint64_t v80 = 0;
        unint64_t v76 = 0;
      }
      int v53 = 0;
      unsigned int v54 = v37->_threadgroupSize;
      unint64_t v70 = v36;
      uint64_t v73 = v39;
      unsigned int v77 = v54;
      do
      {
        int v75 = v53;
        if (v37->_supportsDispatchThreadsWithIndirectBuffer) {
          uint64_t v55 = v36;
        }
        else {
          uint64_t v55 = 1;
        }
        unint64_t v79 = v55;
        if (v55)
        {
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          v58 = v71;
          if ((v87 & (v53 == 0)) == 0) {
            v58 = v85;
          }
          uint64_t v78 = v58;
          unint64_t v82 = a8;
          uint64_t v84 = 0;
          do
          {
            uint64_t v59 = v57 + 4;
            if (v57 + 4 >= (unint64_t)[v92 count]) {
              uint64_t v59 = [v92 count];
            }
            if (v37->_supportsDispatchThreadsWithIndirectBuffer)
            {
              *(void *)&v100[0] = a8 + 4 * v57 + [a7 gpuAddress];
              *((void *)&v100[0] + 1) = [v88 gpuAddress] + v80;
              if (v59 != v57)
              {
                uint64_t v60 = 0;
                uint64_t v61 = v59 + v84;
                if ((unint64_t)(v59 + v84) <= 1) {
                  uint64_t v61 = 1;
                }
                uint64_t v62 = (unsigned int *)&v100[1] + 1;
                do
                {
                  *((_WORD *)v62 - 2) = 4 * v60;
                  *((_WORD *)v62 - 1) = 12 * v60;
                  *uint64_t v62 = v54;
                  v62 += 2;
                  ++v60;
                }
                while (v61 != v60);
              }
              [a3 setComputePipelineState:v76];
              [a3 setBytes:v100 length:48 atIndex:30];
              if ([a3 dispatchType] == 1) {
                [a3 memoryBarrierWithScope:1];
              }
              uint64_t v98 = v59 - v57;
              int64x2_t v99 = vdupq_n_s64(1uLL);
              uint64_t v96 = v101;
              int64x2_t v97 = v99;
              [a3 dispatchThreads:&v98 threadsPerThreadgroup:&v96];
            }
            if ([a3 dispatchType] == 1) {
              [a3 memoryBarrierWithScope:1];
            }
            [a3 setComputePipelineState:v78];
            unint64_t v81 = v57 + 4;
            if (v59 != v57)
            {
              uint64_t v63 = 0;
              if ((unint64_t)(v59 + v84) <= 1) {
                uint64_t v64 = 1;
              }
              else {
                uint64_t v64 = v59 + v84;
              }
              unint64_t v65 = v82;
              unint64_t v66 = v80;
              do
              {
                uint64_t v67 = (void *)[v92 objectAtIndexedSubscript:v57 + v63];
                if ([v67 primitiveCount])
                {
                  [a3 setBuffer:a7 offset:v65 atIndex:0];
                  if (v87) {
                    [a3 setBuffer:a25 offset:v111[v56 + v63] + a26 atIndex:21];
                  }
                  objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v67, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v67, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 3);
                  LODWORD(v100[0]) = v57 + v63;
                  int v95 = 0;
                  int v95 = [v67 boundingBoxStride];
                  [a3 setBytes:v100 length:4 atIndex:9];
                  [a3 setBytes:&v95 length:4 atIndex:10];
                  if (v89->_supportsDispatchThreadsWithIndirectBuffer)
                  {
                    uint64_t v93 = v89->_threadgroupSize;
                    int64x2_t v94 = vdupq_n_s64(1uLL);
                    [a3 dispatchThreadgroupsWithIndirectBuffer:v88 indirectBufferOffset:v66 threadsPerThreadgroup:&v93];
                  }
                  else
                  {
                    [(MTLGPUBVHBuilder *)v89 dispatchIndirect:v85 indirectBuffer:v88 indirectBufferOffset:v102 * v63 threadCountBuffer:a7 threadCountBufferOffset:a8 threadCountIndex:v57 + v63 threadgroupDivisor:v89->_threadgroupSize encoder:a3];
                  }
                }
                ++v63;
                v66 += 12;
                v65 += 4;
              }
              while (v64 != v63);
            }
            v57 += 4;
            v82 += 16;
            v84 -= 4;
            v56 += 4;
            MTLAttributeFormat v37 = v89;
            unsigned int v54 = v77;
          }
          while (v81 < v79);
        }
        char v68 = v87;
        if (v53) {
          char v68 = 0;
        }
        if (v68)
        {
          [(MTLGPUBVHBuilder *)v37 prefixSumWithEncoder:a3 inputBuffer:a25 inputBufferOffset:a26 reducedBuffer:0 reducedBufferOffset:0 scratchBuffer:a25 scratchBufferOffset:v69 countBuffer:0 countBufferOffset:0 capacity:v73];
          if ([a3 dispatchType] == 1) {
            [a3 memoryBarrierWithScope:1];
          }
        }
        ++v53;
        unint64_t v36 = v70;
      }
      while (v75 + 1 != v74);

      goto LABEL_90;
    }
  }
  uint64_t v72 = v39;
  unint64_t v45 = v36;
  for (int i = 0; i != v74; ++i)
  {
    BOOL v47 = i == 0;
    char v48 = v87 & v47;
    if ((v87 & v47) != 0) {
      uint64_t v49 = v71;
    }
    else {
      uint64_t v49 = v85;
    }
    [a3 setComputePipelineState:v49];
    if (v45)
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        uint64_t v51 = (void *)[v92 objectAtIndexedSubscript:j];
        LODWORD(v100[0]) = 0;
        LODWORD(v100[0]) = [v51 primitiveCount];
        if (LODWORD(v100[0]))
        {
          [a3 setBytes:v100 length:4 atIndex:0];
          if (v87) {
            [a3 setBuffer:a25 offset:v111[j] + a26 atIndex:21];
          }
          objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 3);
          LODWORD(v102) = j;
          LODWORD(v101) = 0;
          LODWORD(v101) = [v51 boundingBoxStride];
          [a3 setBytes:&v102 length:4 atIndex:9];
          [a3 setBytes:&v101 length:4 atIndex:10];
          uint64_t v52 = v37->_threadgroupSize;
          uint64_t v105 = (LODWORD(v100[0]) + (int)v52 - 1) / v52;
          int64x2_t v106 = vdupq_n_s64(1uLL);
          uint64_t v103 = v52;
          int64x2_t v104 = v106;
          [a3 dispatchThreadgroups:&v105 threadsPerThreadgroup:&v103];
        }
      }
    }
    if (v48)
    {
      [(MTLGPUBVHBuilder *)v37 prefixSumWithEncoder:a3 inputBuffer:a25 inputBufferOffset:a26 reducedBuffer:0 reducedBufferOffset:0 scratchBuffer:a25 scratchBufferOffset:v69 countBuffer:0 countBufferOffset:0 capacity:v72];
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
    }
  }
LABEL_90:
  if (v111)
  {
    v112 = v111;
    operator delete(v111);
  }
}

- (void)getCurveFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24
{
  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_INITIALIZE_FRAGMENTS, a4);
  uint64_t v58 = (uint64_t)p_pipelineCache;
  uint64_t v61 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_GET_CURVE_FRAGMENTS, a4);
  [a3 setBuffer:a11 offset:a12 atIndex:1];
  [a3 setBuffer:a9 offset:a10 atIndex:2];
  [a3 setBuffer:a13 offset:a14 atIndex:7];
  [a3 setBuffer:a15 offset:a16 atIndex:8];
  if ([a4 primitiveMotion])
  {
    *(_DWORD *)uint64_t v72 = [a4 primitiveKeyframeCount];
    [a3 setBytes:v72 length:4 atIndex:14];
    [a4 primitiveMotionStartTime];
    LODWORD(v75) = v29;
    [a3 setBytes:&v75 length:4 atIndex:15];
    [a4 primitiveMotionEndTime];
    LODWORD(v74) = v30;
    [a3 setBytes:&v74 length:4 atIndex:16];
    [a3 setBuffer:a17 offset:a18 atIndex:17];
    [a3 setBuffer:a19 offset:a20 atIndex:18];
    [a3 setBuffer:a23 offset:a24 atIndex:19];
    [a3 setBuffer:a21 offset:a22 atIndex:20];
  }
  [a3 setComputePipelineState:Pipeline];
  uint64_t threadgroupSize = self->_threadgroupSize;
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v82 = vdupq_n_s64(1uLL);
  uint64_t v83 = 1;
  uint64_t v80 = threadgroupSize;
  int64x2_t v81 = v82;
  [a3 dispatchThreadgroups:&v82 threadsPerThreadgroup:&v80];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  unsigned int v32 = (void *)[a4 geometryDescriptors];
  uint64_t v33 = [v32 count];
  if (a7)
  {
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    id v62 = a7;
    if (self->_supportsDispatchThreadsWithIndirectBuffer)
    {
      id v63 = a5;
      unint64_t v53 = a6 + 200;
      int KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_COPY_COUNTERS);
      *(_OWORD *)&v72[8] = 0u;
      long long v73 = 0u;
      *(_DWORD *)uint64_t v72 = KERNEL_INDEX_COPY_COUNTERS_low;
      *(void *)&v72[4] = (log2((double)*(unint64_t *)(v58 + 40)) & 0xF) << 13;
      uint64_t v51 = PipelineCache<PipelineKey>::getPipeline(v58, (uint64_t)v72, &v74);
    }
    else
    {
      id v38 = [(MTLGPUBVHBuilder *)self retainedResourcesArrayWithEncoder:a3];
      if ((unint64_t)[v32 count] <= 4) {
        uint64_t v39 = [v32 count];
      }
      else {
        uint64_t v39 = 4;
      }
      id v63 = [(MTLGPUBVHBuilder *)self newIndirectBufferWithCapacity:v39 withRetainedResources:v38 indirectBufferStride:&v75];
      unint64_t v53 = 0;
      uint64_t v51 = 0;
    }
    if (self->_supportsDispatchThreadsWithIndirectBuffer) {
      uint64_t v40 = v33;
    }
    else {
      uint64_t v40 = 1;
    }
    unint64_t v52 = v40;
    if (v40)
    {
      uint64_t v41 = 0;
      unsigned int v50 = self->_threadgroupSize;
      unint64_t v57 = a8;
      uint64_t v59 = 0;
      do
      {
        uint64_t v42 = v41 + 4;
        unint64_t v55 = v41 + 4;
        if (v41 + 4 >= (unint64_t)[v32 count]) {
          uint64_t v42 = [v32 count];
        }
        if (self->_supportsDispatchThreadsWithIndirectBuffer)
        {
          *(void *)uint64_t v72 = a8 + 4 * v41 + [v62 gpuAddress];
          *(void *)&v72[8] = [v63 gpuAddress] + v53;
          if (v42 != v41)
          {
            uint64_t v43 = 0;
            uint64_t v44 = v42 + v59;
            if ((unint64_t)(v42 + v59) <= 1) {
              uint64_t v44 = 1;
            }
            unint64_t v45 = (unsigned int *)&v72[20];
            do
            {
              *((_WORD *)v45 - 2) = 4 * v43;
              *((_WORD *)v45 - 1) = 12 * v43;
              *unint64_t v45 = v50;
              v45 += 2;
              ++v43;
            }
            while (v44 != v43);
          }
          [a3 setComputePipelineState:v51];
          [a3 setBytes:v72 length:48 atIndex:30];
          if ([a3 dispatchType] == 1) {
            [a3 memoryBarrierWithScope:1];
          }
          uint64_t v70 = v42 - v41;
          int64x2_t v71 = vdupq_n_s64(1uLL);
          uint64_t v68 = v74;
          int64x2_t v69 = v71;
          [a3 dispatchThreads:&v70 threadsPerThreadgroup:&v68];
        }
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        [a3 setComputePipelineState:v61];
        if (v42 != v41)
        {
          uint64_t v46 = 0;
          if ((unint64_t)(v42 + v59) <= 1) {
            uint64_t v47 = 1;
          }
          else {
            uint64_t v47 = v42 + v59;
          }
          unint64_t v48 = v57;
          unint64_t v49 = v53;
          do
          {
            if (objc_msgSend((id)objc_msgSend(v32, "objectAtIndexedSubscript:", v41 + v46), "primitiveCount"))
            {
              [a3 setBuffer:v62 offset:v48 atIndex:0];
              *(_DWORD *)uint64_t v72 = v41 + v46;
              [a3 setBytes:v72 length:4 atIndex:9];
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                uint64_t v66 = self->_threadgroupSize;
                int64x2_t v67 = vdupq_n_s64(1uLL);
                [a3 dispatchThreadgroupsWithIndirectBuffer:v63 indirectBufferOffset:v49 threadsPerThreadgroup:&v66];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v61 indirectBuffer:v63 indirectBufferOffset:v75 * v46 threadCountBuffer:v62 threadCountBufferOffset:a8 threadCountIndex:v41 + v46 threadgroupDivisor:self->_threadgroupSize encoder:a3];
              }
            }
            ++v46;
            v49 += 12;
            v48 += 4;
          }
          while (v47 != v46);
        }
        v41 += 4;
        v57 += 16;
        v59 -= 4;
      }
      while (v55 < v52);
    }
  }
  else
  {
    [a3 setComputePipelineState:v61];
    if (v33)
    {
      uint64_t v35 = 0;
      int64x2_t v65 = vdupq_n_s64(1uLL);
      do
      {
        unint64_t v36 = (void *)[v32 objectAtIndexedSubscript:v35];
        *(_DWORD *)uint64_t v72 = 0;
        *(_DWORD *)uint64_t v72 = [v36 primitiveCount];
        if (*(_DWORD *)v72)
        {
          [a3 setBytes:v72 length:4 atIndex:0];
          LODWORD(v75) = v35;
          [a3 setBytes:&v75 length:4 atIndex:9];
          uint64_t v37 = self->_threadgroupSize;
          uint64_t v78 = (*(_DWORD *)v72 + (int)v37 - 1) / v37;
          int64x2_t v79 = v65;
          uint64_t v76 = v37;
          int64x2_t v77 = v65;
          [a3 dispatchThreadgroups:&v78 threadsPerThreadgroup:&v76];
        }
        ++v35;
      }
      while (v33 != v35);
    }
  }
}

- (void)buildWithEncoder:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6 fragmentBuffer:(id)a7 fragmentBufferOffset:(unint64_t)a8 fragmentIndexBuffer0:(id)a9 fragmentIndexBuffer0Offset:(unint64_t)a10 nodeBuffer:(id)a11 nodeBufferOffset:(unint64_t)a12 childIndexBuffer:(id)a13 childIndexBufferOffset:(unint64_t)a14 counterBuffer:(id)a15 counterBufferOffset:(unint64_t)a16 fragmentCountBuffer:(id)a17 fragmentCountBufferOffset:(unint64_t)a18 boundsMinBuffer:(id)a19 boundsMinBufferOffset:(unint64_t)a20 boundsMaxBuffer:(id)a21 boundsMaxBufferOffset:(unint64_t)a22 boundsEndMinBuffer:(id)a23 boundsEndMinBufferOffset:(unint64_t)a24 boundsEndMaxBuffer:(id)a25 boundsEndMaxBufferOffset:(unint64_t)a26 boundsEndTimeBuffer:(id)a27 boundsEndTimeBufferOffset:(unint64_t)a28 boundsStartTimeBuffer:(id)a29 boundsStartTimeBufferOffset:(unint64_t)a30 scratchBufferOffsets:(ScratchBufferOffset *)a31
{
  uint64_t v316 = *MEMORY[0x1E4F143B8];
  uint64_t v309 = 0;
  uint64_t v308 = 0;
  uint64_t v307 = 0;
  uint64_t v306 = 0;
  unint64_t v305 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a4 fragmentCapacity:&v309 fragmentIndexCapacity:&v305 innerNodeCapacity:&v308 leafNodeCapacity:&v307 primitiveDataCapacity:&v306];
  unint64_t var1 = a31->var1;
  unint64_t var2 = a31->var2;
  unint64_t v210 = [a4 fragmentCount];
  uint64_t v35 = 0;
  unint64_t v36 = 0;
  if (v305 > 0x2000)
  {
    unint64_t batchSize = self->_batchSize;
    unint64_t v38 = (v305 + batchSize) / (batchSize + 1);
    if (v38 >= 2) {
      uint64_t v35 = 2 * v38;
    }
    else {
      uint64_t v35 = 2;
    }
    if ((v305 + batchSize - 1) / batchSize <= 1) {
      unint64_t v36 = 1;
    }
    else {
      unint64_t v36 = (v305 + batchSize - 1) / batchSize;
    }
  }
  uint64_t v39 = 8 * v307 + 255;
  unint64_t v247 = (a6 + 255) & 0xFFFFFFFFFFFFFF00;
  unint64_t v211 = (v39 + v247) & 0xFFFFFFFFFFFFFF00;
  unint64_t v193 = v39 + v211;
  uint64_t v191 = v39 + v211 + 768 * v36;
  uint64_t v40 = 192 * v36 + 255;
  unint64_t v194 = (v191 + 768 * v36) & 0xFFFFFFFFFFFFFF00;
  unint64_t v197 = (v40 + v194) & 0xFFFFFFFFFFFFFF00;
  unint64_t v199 = (v40 + v197) & 0xFFFFFFFFFFFFFF00;
  uint64_t v41 = 24 * v35 + 255;
  unint64_t v201 = (v40 + v199) & 0xFFFFFFFFFFFFFF00;
  [a4 motion];
  if ([a4 motion]) {
    uint64_t v42 = 140;
  }
  else {
    uint64_t v42 = 76;
  }
  [a4 motion];
  if ([a4 motion]) {
    uint64_t v43 = 768 * v36;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v187 = v43;
  [a4 motion];
  if ([a4 motion]) {
    uint64_t v44 = 768 * v36;
  }
  else {
    uint64_t v44 = 0;
  }
  uint64_t v186 = v44;
  [a4 motion];
  if ([a4 motion]) {
    uint64_t v45 = 192 * v36 + 255;
  }
  else {
    uint64_t v45 = 0;
  }
  uint64_t v185 = v45;
  [a4 motion];
  [a4 motion];
  obuint64_t j = (id)[a4 geometryDescriptors];
  unint64_t v46 = v305;
  BOOL v229 = +[MTLBVHBuilder useTemporalSplitsForDescriptor:a4];
  unint64_t v207 = v46;
  if (v46 <= 0x2000)
  {
    unint64_t v48 = &OBJC_IVAR___MTLGPUBVHBuilder__dispatchBinsTGSize;
    unsigned int dispatchBinsTGSize = 256;
  }
  else
  {
    unsigned int dispatchBinsTGSize = self->_dispatchBinsTGSize;
    unint64_t v48 = &OBJC_IVAR___MTLGPUBVHBuilder__dispatchBinsSmallTGSize;
  }
  unint64_t v253 = (v41 + v201) & 0xFFFFFFFFFFFFFF00;
  unint64_t v233 = *(unsigned int *)((char *)&self->super.super.isa + *v48);
  unint64_t binningTGSize = self->_binningTGSize;
  uint64_t spatialBinningTGSize = self->_spatialBinningTGSize;
  unint64_t splitTGSize = self->_splitTGSize;
  uint64_t v49 = [a4 minPrimitivesPerLeaf];
  uint64_t v195 = [a4 maxPrimitivesPerLeaf];
  unsigned int v304 = [(MTLGPUBVHBuilder *)self maxDepthForDescriptor:a4];
  uint64_t v204 = [a4 maxPrimitivesPerInnerNode];
  if (v204)
  {
    if ([a4 minPrimitivesPerInnerNode] <= (unint64_t)(2 * v49)) {
      uint64_t v50 = 2 * v49;
    }
    else {
      uint64_t v50 = [a4 minPrimitivesPerInnerNode];
    }
    [a4 setMinPrimitivesPerLeaf:v50];
    objc_msgSend(a4, "setMaxPrimitivesPerLeaf:", objc_msgSend(a4, "maxPrimitivesPerInnerNode"));
    [a4 updatePipelineKey];
  }
  uint64_t v196 = v49;
  int v228 = [a4 deterministic];
  int v303 = (v204 == 0) | 2;
  uint64_t v302 = 0;
  long long v300 = 0u;
  long long v301 = 0u;
  PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&self->_pipelineCache, self->KERNEL_INDEX_DISPATCH_BINS, a4, dispatchBinsTGSize, &v303, (uint64_t)&v300);
  p_pipelineCache = (unsigned __int8 *)&self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v300);
  v227 = 0;
  if ([a4 branchingFactor] != 2)
  {
    unsigned int KERNEL_INDEX_DISPATCH_BINS_WIDE = self->KERNEL_INDEX_DISPATCH_BINS_WIDE;
    *(_OWORD *)v310 = v300;
    *(_OWORD *)&v310[16] = v301;
    *(void *)&v310[32] = v302;
    v310[0] = KERNEL_INDEX_DISPATCH_BINS_WIDE;
    if (dispatchBinsTGSize)
    {
      long double v52 = log2((double)dispatchBinsTGSize);
      *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v52 & 0xF) << 13);
    }
    v227 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  }
  unint64_t v245 = (v41 + v253) & 0xFFFFFFFFFFFFFF00;
  unsigned int KERNEL_INDEX_DISPATCH_BINS = self->KERNEL_INDEX_DISPATCH_BINS;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_DISPATCH_BINS;
  if (v233)
  {
    long double v54 = log2((double)v233);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v54 & 0xF) << 13);
  }
  unint64_t v55 = v245 + v42 * v35;
  v230 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  if ([a4 branchingFactor] == 2)
  {
    v232 = 0;
  }
  else
  {
    unsigned int v56 = self->KERNEL_INDEX_DISPATCH_BINS_WIDE;
    *(_OWORD *)v310 = v300;
    *(_OWORD *)&v310[16] = v301;
    *(void *)&v310[32] = v302;
    v310[0] = v56;
    if (v233)
    {
      long double v57 = log2((double)v233);
      *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v57 & 0xF) << 13);
    }
    v232 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  }
  unint64_t v58 = v55 + 255;
  char KERNEL_INDEX_BIN_FRAGMENTS = self->KERNEL_INDEX_BIN_FRAGMENTS;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_BIN_FRAGMENTS;
  if (binningTGSize)
  {
    long double v60 = log2((double)binningTGSize);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v60 & 0xF) << 13);
  }
  unint64_t v61 = v58 & 0xFFFFFFFFFFFFFF00;
  uint64_t v62 = 4 * v36 + 255;
  v225 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  unsigned int KERNEL_INDEX_CLEAR_BATCHES = self->KERNEL_INDEX_CLEAR_BATCHES;
  unsigned int threadgroupSize = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_CLEAR_BATCHES;
  if (threadgroupSize)
  {
    long double v65 = log2((double)threadgroupSize);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v65 & 0xF) << 13);
  }
  v242 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  unsigned int KERNEL_INDEX_CREATE_BVH_NODES = self->KERNEL_INDEX_CREATE_BVH_NODES;
  unsigned int v67 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_CREATE_BVH_NODES;
  if (v67)
  {
    long double v68 = log2((double)v67);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v68 & 0xF) << 13);
  }
  unint64_t v243 = (v62 + v61) & 0xFFFFFFFFFFFFFF00;
  v224 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  unsigned int KERNEL_INDEX_FIND_BEST_SPLIT = self->KERNEL_INDEX_FIND_BEST_SPLIT;
  unsigned int v70 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_FIND_BEST_SPLIT;
  if (v70)
  {
    long double v71 = log2((double)v70);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v71 & 0xF) << 13);
  }
  uint64_t v72 = &self->_pipelineCache;
  v223 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  if (v228)
  {
    LODWORD(v271[0]) = (v204 == 0) | 2;
    unsigned int KERNEL_INDEX_SPLIT_FRAGMENTS = self->KERNEL_INDEX_SPLIT_FRAGMENTS;
    memset(v310, 0, sizeof(v310));
    PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, KERNEL_INDEX_SPLIT_FRAGMENTS, a4, splitTGSize, v271, (uint64_t)v310);
    v218 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
    unsigned int KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM = self->KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM;
    memset(v310, 0, sizeof(v310));
    PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM, a4, 0x400uLL, v271, (uint64_t)v310);
    v217 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
    LODWORD(v271[0]) |= 4u;
    unsigned int v75 = self->KERNEL_INDEX_SPLIT_FRAGMENTS;
    memset(v310, 0, sizeof(v310));
    PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, v75, a4, splitTGSize, v271, (uint64_t)v310);
    v222 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
  }
  else
  {
    unsigned int v76 = self->KERNEL_INDEX_SPLIT_FRAGMENTS;
    *(_OWORD *)v310 = v300;
    *(_OWORD *)&v310[16] = v301;
    *(void *)&v310[32] = v302;
    v310[0] = v76;
    if (splitTGSize)
    {
      long double v77 = log2((double)splitTGSize);
      *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v77 & 0xF) << 13);
    }
    uint64_t v72 = &self->_pipelineCache;
    v222 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
    v217 = 0;
    v218 = 0;
  }
  unint64_t v235 = (v62 + v243) & 0xFFFFFFFFFFFFFF00;
  uint64_t v78 = 16 * v36 + 255;
  char KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL = self->KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL;
  if (spatialBinningTGSize)
  {
    long double v80 = log2((double)spatialBinningTGSize);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v80 & 0xF) << 13);
  }
  v216 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (uint64_t)v310);
  unsigned int KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT = self->KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT;
  unsigned int v82 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT;
  if (v82)
  {
    long double v83 = log2((double)v82);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v83 & 0xF) << 13);
  }
  unint64_t v240 = (v78 + v235) & 0xFFFFFFFFFFFFFF00;
  v215 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (uint64_t)v310);
  unsigned int KERNEL_INDEX_INITIALIZE_QUEUE = self->KERNEL_INDEX_INITIALIZE_QUEUE;
  unsigned int v85 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_INITIALIZE_QUEUE;
  if (v85)
  {
    long double v86 = log2((double)v85);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v86 & 0xF) << 13);
  }
  unint64_t v87 = v78 + v240;
  v189 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (uint64_t)v310);
  unsigned int KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES = self->KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES;
  unsigned int v89 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES;
  if (v89)
  {
    long double v90 = log2((double)v89);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v90 & 0xF) << 13);
  }
  id v205 = a4;
  unint64_t v91 = v87 & 0xFFFFFFFFFFFFFF00;
  v190 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (uint64_t)v310);
  unsigned int KERNEL_INDEX_COPY_FRAGMENT_INDICES = self->KERNEL_INDEX_COPY_FRAGMENT_INDICES;
  unsigned int v93 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_COPY_FRAGMENT_INDICES;
  if (v93)
  {
    long double v94 = log2((double)v93);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v94 & 0xF) << 13);
  }
  v192 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  unsigned int KERNEL_INDEX_FINISH_BUILD_ITERATION = self->KERNEL_INDEX_FINISH_BUILD_ITERATION;
  unsigned int v96 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(void *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_FINISH_BUILD_ITERATION;
  if (v96)
  {
    long double v97 = log2((double)v96);
    *(void *)&v310[4] = *(void *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v97 & 0xF) << 13);
  }
  unint64_t v252 = (v91 + 275) & 0xFFFFFFFFFFFFFF00;
  v237 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  if (v229)
  {
    id v98 = a4;
    unsigned int KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL = self->KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL;
    LODWORD(v271[0]) = (v204 == 0) | 2;
    memset(v310, 0, sizeof(v310));
    PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL, a4, binningTGSize, v271, (uint64_t)v310);
    v214 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
    v213 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT, a4, v204 == 0, 1);
  }
  else
  {
    v213 = 0;
    v214 = 0;
    id v98 = a4;
  }
  [a3 setBuffer:a11 offset:a12 atIndex:0];
  [a3 setBuffer:a5 offset:v247 atIndex:1];
  [a3 setBuffer:a9 offset:a10 atIndex:2];
  [a3 setBuffer:a17 offset:a18 atIndex:3];
  [a3 setBytes:&v305 length:8 atIndex:4];
  [a3 setBuffer:a19 offset:a20 atIndex:5];
  [a3 setBuffer:a21 offset:a22 atIndex:6];
  [a3 setBuffer:a5 offset:v91 atIndex:7];
  [a3 setBuffer:a15 offset:a16 atIndex:8];
  if ([v98 motion])
  {
    [a3 setBuffer:a23 offset:a24 atIndex:9];
    [a3 setBuffer:a25 offset:a26 atIndex:10];
    [a3 setBuffer:a29 offset:a30 atIndex:11];
    [a3 setBuffer:a27 offset:a28 atIndex:12];
  }
  [a3 setBytes:&v304 length:4 atIndex:13];
  [a3 setBuffer:a5 offset:v252 atIndex:30];
  if (v229)
  {
    [a4 primitiveMotionStartTime];
    *(_DWORD *)v310 = v100;
    [a4 primitiveMotionEndTime];
    *(_DWORD *)&v310[4] = v101;
    *(_DWORD *)&v310[8] = [a4 primitiveKeyframeCount];
    *(_DWORD *)&v310[12] = var2 - var1;
    [a3 setBytes:v310 length:16 atIndex:14];
  }
  [a3 setComputePipelineState:v189];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v297 = vdupq_n_s64(1uLL);
  int64x2_t v298 = v297;
  uint64_t v299 = 1;
  uint64_t v296 = self->_threadgroupSize;
  [a3 dispatchThreadgroups:&v298 threadsPerThreadgroup:&v296];
  [(MTLGPUBVHBuilder *)self dispatchIndirect:v190 counterBuffer:a5 counterBufferOffset:v252 threadgroupSize:self->_threadgroupSize encoder:a3];
  [a3 setBuffer:a5 offset:v91 atIndex:0];
  [a3 setBuffer:a7 offset:a8 atIndex:2];
  [a3 setBuffer:a5 offset:v193 & 0xFFFFFFFFFFFFFF00 atIndex:7];
  [a3 setBuffer:a5 offset:v191 & 0xFFFFFFFFFFFFFF00 atIndex:8];
  [a3 setBuffer:a5 offset:v194 atIndex:9];
  [a3 setBuffer:a5 offset:v61 atIndex:10];
  [a3 setBuffer:a5 offset:v243 atIndex:11];
  [a3 setBuffer:a5 offset:v197 atIndex:12];
  [a3 setBuffer:a5 offset:v199 atIndex:13];
  [a3 setBuffer:a5 offset:v201 atIndex:14];
  [a3 setBuffer:a5 offset:v253 atIndex:15];
  [a3 setBuffer:a5 offset:v235 atIndex:16];
  [a3 setBuffer:a5 offset:v240 atIndex:17];
  [a3 setBuffer:a5 offset:v245 atIndex:18];
  [a3 setBuffer:a11 offset:a12 atIndex:19];
  [a3 setBuffer:a13 offset:a14 atIndex:24];
  [a3 setBuffer:a15 offset:a16 atIndex:22];
  [a3 setBuffer:a9 offset:a10 atIndex:3];
  [a3 setBuffer:a5 offset:var1 atIndex:4];
  if ([(MTLGPUBVHBuilder *)self useSpatialSplitsForDescriptor:a4])
  {
    if (objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"))
    {
      uint64_t v102 = (void *)[obj objectAtIndexedSubscript:0];
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 20);
      uint64_t v103 = [v102 indexBuffer];
      unint64_t v104 = [v102 indexBufferOffset];
      id v105 = a3;
      id v106 = (id)v103;
LABEL_78:
      [v105 setBuffer:v106 offset:v104 atIndex:21];
    }
  }
  else if ([a4 motion])
  {
    unint64_t v107 = v252 + 267 + v187;
    unint64_t v108 = (v107 + v186) & 0xFFFFFFFFFFFFFF00;
    unint64_t v109 = v107 & 0xFFFFFFFFFFFFFF00;
    [a3 setBuffer:a5 offset:(v252 + 267) & 0xFFFFFFFFFFFFFF00 atIndex:25];
    [a3 setBuffer:a5 offset:v109 atIndex:26];
    [a3 setBuffer:a5 offset:v108 atIndex:20];
    id v105 = a3;
    id v106 = a5;
    unint64_t v104 = (v185 + v108) & 0xFFFFFFFFFFFFFF00;
    goto LABEL_78;
  }
  if ([a4 requiresResourceBuffer])
  {
    long long v294 = 0u;
    long long v295 = 0u;
    long long v292 = 0u;
    long long v293 = 0u;
    uint64_t v110 = [obj countByEnumeratingWithState:&v292 objects:v315 count:16];
    if (v110)
    {
      uint64_t v111 = v110;
      uint64_t v254 = *(void *)v293;
      do
      {
        for (uint64_t i = 0; i != v111; ++i)
        {
          if (*(void *)v293 != v254) {
            objc_enumerationMutation(obj);
          }
          uint64_t v113 = *(void **)(*((void *)&v292 + 1) + 8 * i);
          uint64_t v114 = objc_opt_class();
          if ([v114 isSubclassOfClass:objc_opt_class()])
          {
            long long v290 = 0u;
            long long v291 = 0u;
            long long v288 = 0u;
            long long v289 = 0u;
            int64x2_t v115 = (void *)[v113 vertexBuffers];
            uint64_t v116 = [v115 countByEnumeratingWithState:&v288 objects:v314 count:16];
            if (v116)
            {
              uint64_t v117 = v116;
              uint64_t v118 = *(void *)v289;
              do
              {
                for (uint64_t j = 0; j != v117; ++j)
                {
                  if (*(void *)v289 != v118) {
                    objc_enumerationMutation(v115);
                  }
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v288 + 1) + 8 * j), "buffer"), 1);
                }
                uint64_t v117 = [v115 countByEnumeratingWithState:&v288 objects:v314 count:16];
              }
              while (v117);
            }
            if ([v113 indexBuffer]) {
              objc_msgSend(a3, "useResource:usage:", objc_msgSend(v113, "indexBuffer"), 1);
            }
            if ([v113 transformationMatrixBuffer])
            {
              uint64_t v120 = [v113 transformationMatrixBuffer];
LABEL_122:
              [a3 useResource:v120 usage:1];
            }
          }
          else
          {
            v121 = objc_opt_class();
            if (![v121 isSubclassOfClass:objc_opt_class()])
            {
              v127 = objc_opt_class();
              if (![v127 isSubclassOfClass:objc_opt_class()]) {
                goto LABEL_123;
              }
              long long v283 = 0u;
              long long v282 = 0u;
              long long v281 = 0u;
              long long v280 = 0u;
              v128 = (void *)[v113 controlPointBuffers];
              uint64_t v129 = [v128 countByEnumeratingWithState:&v280 objects:v312 count:16];
              if (v129)
              {
                uint64_t v130 = v129;
                uint64_t v131 = *(void *)v281;
                do
                {
                  for (uint64_t k = 0; k != v130; ++k)
                  {
                    if (*(void *)v281 != v131) {
                      objc_enumerationMutation(v128);
                    }
                    objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v280 + 1) + 8 * k), "buffer"), 1);
                  }
                  uint64_t v130 = [v128 countByEnumeratingWithState:&v280 objects:v312 count:16];
                }
                while (v130);
              }
              long long v279 = 0u;
              long long v278 = 0u;
              long long v277 = 0u;
              long long v276 = 0u;
              v133 = (void *)[v113 radiusBuffers];
              uint64_t v134 = [v133 countByEnumeratingWithState:&v276 objects:v311 count:16];
              if (v134)
              {
                uint64_t v135 = v134;
                uint64_t v136 = *(void *)v277;
                do
                {
                  for (uint64_t m = 0; m != v135; ++m)
                  {
                    if (*(void *)v277 != v136) {
                      objc_enumerationMutation(v133);
                    }
                    objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v276 + 1) + 8 * m), "buffer"), 1);
                  }
                  uint64_t v135 = [v133 countByEnumeratingWithState:&v276 objects:v311 count:16];
                }
                while (v135);
              }
              uint64_t v120 = [v113 indexBuffer];
              goto LABEL_122;
            }
            long long v286 = 0u;
            long long v287 = 0u;
            long long v284 = 0u;
            long long v285 = 0u;
            v122 = (void *)[v113 boundingBoxBuffers];
            uint64_t v123 = [v122 countByEnumeratingWithState:&v284 objects:v313 count:16];
            if (v123)
            {
              uint64_t v124 = v123;
              uint64_t v125 = *(void *)v285;
              do
              {
                for (uint64_t n = 0; n != v124; ++n)
                {
                  if (*(void *)v285 != v125) {
                    objc_enumerationMutation(v122);
                  }
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v284 + 1) + 8 * n), "buffer"), 1);
                }
                uint64_t v124 = [v122 countByEnumeratingWithState:&v284 objects:v313 count:16];
              }
              while (v124);
            }
          }
LABEL_123:
          if ([v113 primitiveDataBuffer]) {
            objc_msgSend(a3, "useResource:usage:", objc_msgSend(v113, "primitiveDataBuffer"), 1);
          }
        }
        uint64_t v111 = [obj countByEnumeratingWithState:&v292 objects:v315 count:16];
      }
      while (v111);
    }
  }
  v138 = v205;
  BOOL v236 = [(MTLGPUBVHBuilder *)self useSpatialSplitsForDescriptor:v205];
  unsigned int v200 = [v205 branchingFactor];
  [v205 branchingFactor];
  uint64_t v275 = 0;
  if (v207 > 0x2000)
  {
    int KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS);
    memset(&v310[8], 0, 32);
    *(_DWORD *)v310 = KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low;
    *(void *)&v310[4] = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
    PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, &v275);
  }
  unsigned int v140 = v304;
  unint64_t v141 = v247;
  if (v304)
  {
    long double v142 = log2((double)v200);
    int v143 = 0;
    unsigned int v202 = v142;
    BOOL v144 = v229;
    if (v207 <= 0x2000) {
      BOOL v144 = 0;
    }
    BOOL v198 = v144;
    id obja = (id)(a16 + 512);
    unint64_t v241 = a16 + 1024;
    unint64_t v220 = a16 + 768;
    unint64_t v221 = a16 + 1280;
    do
    {
      int v274 = 0;
      BOOL v145 = v143 == v140 - 1 || v204 == 0;
      BOOL v146 = v143 != v140 - 1 || v204 == 0;
      if (v145) {
        unsigned int v147 = v140;
      }
      else {
        unsigned int v147 = v140 - 1;
      }
      int v209 = v143;
      v273[0] = v143;
      v273[1] = v147;
      [a3 setBytes:v273 length:12 atIndex:1];
      unint64_t v248 = v141;
      [a3 setBuffer:a5 offset:v141 atIndex:5];
      [a3 setBuffer:a5 offset:v211 atIndex:6];
      if (!v146)
      {
        [v138 setMinPrimitivesPerLeaf:v196];
        [v138 setMaxPrimitivesPerLeaf:v195];
        [v138 updatePipelineKey];
        unsigned int v304 = [v138 maxDepth];
        int v272 = 9;
        unsigned int v148 = self->KERNEL_INDEX_DISPATCH_BINS;
        memset(v310, 0, sizeof(v310));
        PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, v148, v138, v233, &v272, (uint64_t)v310);
        v230 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
        v232 = 0;
        if ([v138 branchingFactor] != 2)
        {
          unsigned int v149 = self->KERNEL_INDEX_DISPATCH_BINS_WIDE;
          memset(v310, 0, sizeof(v310));
          PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, v149, v138, v233, &v272, (uint64_t)v310);
          v232 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
        }
        v150 = PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, self->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS, v138, self->_threadgroupSize);
        v271[0] = [a15 gpuAddress] + a16;
        v271[1] = 0;
        [(MTLGPUBVHBuilder *)self setCounters:v271 numCounters:1 encoder:a3];
        uint64_t v151 = self->_threadgroupSize;
        if (self->_supportsDispatchThreadsWithIndirectBuffer)
        {
          [a3 setComputePipelineState:v150];
          if ([a3 dispatchType] == 1) {
            [a3 memoryBarrierWithScope:1];
          }
          *(void *)v310 = v151;
          *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
          [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:a16 + 1536 threadsPerThreadgroup:v310];
        }
        else
        {
          [(MTLGPUBVHBuilder *)self dispatchIndirect:v150 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:6 threadgroupDivisor:v151 threadgroupSize:self->_threadgroupSize encoder:a3];
        }
      }
      int v152 = 0;
      if ([v138 useFastBuild] && v200 >= 3) {
        int v152 = [v138 deterministic] ^ 1;
      }
      unsigned int v153 = [v138 branchingFactor] - 1;
      v271[0] = 0;
      if (v207 <= 0x2000)
      {
        v234 = 0;
        if (v153 >= 2) {
          unsigned int v153 = 2;
        }
      }
      else
      {
        int v154 = LOBYTE(self->KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS);
        memset(&v310[8], 0, 32);
        *(_DWORD *)v310 = v154;
        *(void *)&v310[4] = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
        v234 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, v271);
      }
      unint64_t v155 = v248;
      unsigned int v156 = v200 - 1;
      if (v146) {
        unsigned int v156 = v202;
      }
      if (!v152) {
        unsigned int v156 = v153;
      }
      if (v156)
      {
        int v157 = 0;
        BOOL v158 = v207 > 0x2000 && v146;
        BOOL v255 = v158;
        if (v209) {
          int v159 = v152;
        }
        else {
          int v159 = 0;
        }
        int v249 = v146 & v159;
        int v246 = v152 | v198;
        unint64_t v160 = v211;
        BOOL v161 = v210 > 0x100 && v146;
        BOOL v244 = v161;
        int v162 = -v156;
        char v231 = v152;
        do
        {
          unint64_t v163 = v155;
          objc_msgSend(a3, "setBuffer:offset:atIndex:", a5);
          [a3 setBuffer:a5 offset:v160 atIndex:6];
          if (v255)
          {
            [a3 setComputePipelineState:v234];
            int64x2_t v269 = vdupq_n_s64(1uLL);
            uint64_t v270 = 1;
            uint64_t v267 = v271[0];
            int64x2_t v268 = v269;
            [a3 dispatchThreadgroups:&v269 threadsPerThreadgroup:&v267];
          }
          if ([a3 dispatchType] == 1) {
            [a3 memoryBarrierWithScope:1];
          }
          if (v157) {
            int v164 = 1;
          }
          else {
            int v164 = v249;
          }
          if ((v164 & v246) == 1)
          {
            int v274 = v157;
            [a3 setBytes:v273 length:12 atIndex:1];
          }
          if (v244)
          {
            if (v164) {
              v165 = v227;
            }
            else {
              v165 = Pipeline;
            }
            [a3 setComputePipelineState:v165];
            uint64_t v265 = dispatchBinsTGSize;
            v166 = (unint64_t *)&v265;
          }
          else
          {
            if (v164) {
              v167 = v232;
            }
            else {
              v167 = v230;
            }
            [a3 setComputePipelineState:v167];
            unint64_t v266 = v233;
            v166 = &v266;
          }
          v166[1] = 1;
          v166[2] = 1;
          objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, a16);
          if (v255)
          {
            uint64_t v168 = self->_threadgroupSize;
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              [a3 setComputePipelineState:v242];
              if ([a3 dispatchType] == 1) {
                [a3 memoryBarrierWithScope:1];
              }
              *(void *)v310 = v168;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:obja threadsPerThreadgroup:v310];
            }
            else
            {
              [(MTLGPUBVHBuilder *)self dispatchIndirect:v242 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:2 threadgroupDivisor:1 threadgroupSize:self->_threadgroupSize encoder:a3];
            }
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              unint64_t v169 = binningTGSize;
              if (!binningTGSize) {
                unint64_t v169 = self->_threadgroupSize;
              }
              [a3 setComputePipelineState:v225];
              if ([a3 dispatchType] == 1) {
                [a3 memoryBarrierWithScope:1];
              }
              *(void *)v310 = v169;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:v241 threadsPerThreadgroup:v310];
            }
            else
            {
              [(MTLGPUBVHBuilder *)self dispatchIndirect:v225 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:4 threadgroupDivisor:1 threadgroupSize:binningTGSize encoder:a3];
            }
            uint64_t v170 = self->_threadgroupSize;
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              [a3 setComputePipelineState:v223];
              if ([a3 dispatchType] == 1) {
                [a3 memoryBarrierWithScope:1];
              }
              *(void *)v310 = v170;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:obja threadsPerThreadgroup:v310];
            }
            else
            {
              [(MTLGPUBVHBuilder *)self dispatchIndirect:v223 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:2 threadgroupDivisor:1 threadgroupSize:self->_threadgroupSize encoder:a3];
            }
            if (v236)
            {
              uint64_t v171 = self->_threadgroupSize;
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                [a3 setComputePipelineState:v242];
                if ([a3 dispatchType] == 1) {
                  [a3 memoryBarrierWithScope:1];
                }
                *(void *)v310 = v171;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:obja threadsPerThreadgroup:v310];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v242 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:2 threadgroupDivisor:1 threadgroupSize:self->_threadgroupSize encoder:a3];
              }
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                uint64_t v172 = spatialBinningTGSize;
                if (!spatialBinningTGSize) {
                  uint64_t v172 = self->_threadgroupSize;
                }
                [a3 setComputePipelineState:v216];
                if ([a3 dispatchType] == 1) {
                  [a3 memoryBarrierWithScope:1];
                }
                *(void *)v310 = v172;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:v221 threadsPerThreadgroup:v310];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v216 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:5 threadgroupDivisor:1 threadgroupSize:spatialBinningTGSize encoder:a3];
              }
              uint64_t v173 = self->_threadgroupSize;
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                [a3 setComputePipelineState:v215];
                if ([a3 dispatchType] == 1) {
                  [a3 memoryBarrierWithScope:1];
                }
                *(void *)v310 = v173;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:v220 threadsPerThreadgroup:v310];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v215 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:3 threadgroupDivisor:1 threadgroupSize:self->_threadgroupSize encoder:a3];
              }
            }
            if (v229)
            {
              uint64_t v174 = self->_threadgroupSize;
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                [a3 setComputePipelineState:v242];
                if ([a3 dispatchType] == 1) {
                  [a3 memoryBarrierWithScope:1];
                }
                *(void *)v310 = v174;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:obja threadsPerThreadgroup:v310];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v242 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:2 threadgroupDivisor:1 threadgroupSize:self->_threadgroupSize encoder:a3];
              }
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                unint64_t v175 = binningTGSize;
                if (!binningTGSize) {
                  unint64_t v175 = self->_threadgroupSize;
                }
                [a3 setComputePipelineState:v214];
                if ([a3 dispatchType] == 1) {
                  [a3 memoryBarrierWithScope:1];
                }
                *(void *)v310 = v175;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:v221 threadsPerThreadgroup:v310];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v214 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:5 threadgroupDivisor:1 threadgroupSize:binningTGSize encoder:a3];
              }
              uint64_t v176 = self->_threadgroupSize;
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                [a3 setComputePipelineState:v213];
                if ([a3 dispatchType] == 1) {
                  [a3 memoryBarrierWithScope:1];
                }
                *(void *)v310 = v176;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:v220 threadsPerThreadgroup:v310];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v213 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:3 threadgroupDivisor:1 threadgroupSize:self->_threadgroupSize encoder:a3];
              }
            }
            if (v228)
            {
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                unint64_t v177 = splitTGSize;
                if (!splitTGSize) {
                  unint64_t v177 = self->_threadgroupSize;
                }
                [a3 setComputePipelineState:v218];
                if ([a3 dispatchType] == 1) {
                  [a3 memoryBarrierWithScope:1];
                }
                *(void *)v310 = v177;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:v241 threadsPerThreadgroup:v310];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v218 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:4 threadgroupDivisor:1 threadgroupSize:splitTGSize encoder:a3];
              }
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                [a3 setComputePipelineState:v217];
                if ([a3 dispatchType] == 1) {
                  [a3 memoryBarrierWithScope:1];
                }
                *(_OWORD *)v310 = xmmword_1828D63F0;
                *(void *)&v310[16] = 1;
                [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:obja threadsPerThreadgroup:v310];
              }
              else
              {
                [(MTLGPUBVHBuilder *)self dispatchIndirect:v217 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:2 threadgroupDivisor:1 threadgroupSize:1024 encoder:a3];
              }
            }
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              unint64_t v178 = splitTGSize;
              if (!splitTGSize) {
                unint64_t v178 = self->_threadgroupSize;
              }
              [a3 setComputePipelineState:v222];
              if ([a3 dispatchType] == 1) {
                [a3 memoryBarrierWithScope:1];
              }
              *(void *)v310 = v178;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:v241 threadsPerThreadgroup:v310];
            }
            else
            {
              [(MTLGPUBVHBuilder *)self dispatchIndirect:v222 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:4 threadgroupDivisor:1 threadgroupSize:splitTGSize encoder:a3];
            }
            uint64_t v179 = self->_threadgroupSize;
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              [a3 setComputePipelineState:v224];
              LOBYTE(v152) = v231;
              if ([a3 dispatchType] == 1) {
                [a3 memoryBarrierWithScope:1];
              }
              *(void *)v310 = v179;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:obja threadsPerThreadgroup:v310];
            }
            else
            {
              [(MTLGPUBVHBuilder *)self dispatchIndirect:v224 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:2 threadgroupDivisor:1 threadgroupSize:self->_threadgroupSize encoder:a3];
              LOBYTE(v152) = v231;
            }
          }
          char v180 = v152 ^ 1;
          if (v162 + v157 == -1) {
            char v180 = 1;
          }
          if (v180)
          {
            unint64_t v181 = v160;
            unint64_t v155 = v163;
            unint64_t v160 = v163;
          }
          else
          {
            [a3 setComputePipelineState:v237];
            if ([a3 dispatchType] == 1) {
              [a3 memoryBarrierWithScope:1];
            }
            int64x2_t v263 = vdupq_n_s64(1uLL);
            uint64_t v264 = 1;
            uint64_t v261 = self->_threadgroupSize;
            int64x2_t v262 = v263;
            [a3 dispatchThreadgroups:&v263 threadsPerThreadgroup:&v261];
            unint64_t v181 = v163;
            unint64_t v155 = v160;
          }
          ++v157;
          unint64_t v182 = v160;
          unint64_t v160 = v181;
        }
        while (v162 + v157);
      }
      else
      {
        unint64_t v181 = v211;
        unint64_t v182 = v248;
      }
      unint64_t v211 = v182;
      objc_msgSend(a3, "setComputePipelineState:", v237, v155);
      v138 = v205;
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      int64x2_t v259 = vdupq_n_s64(1uLL);
      uint64_t v260 = 1;
      uint64_t v257 = self->_threadgroupSize;
      int64x2_t v258 = v259;
      [a3 dispatchThreadgroups:&v259 threadsPerThreadgroup:&v257];
      unint64_t v183 = (unint64_t)(float)((float)v210 * 1.08);
      if (!v236) {
        unint64_t v183 = v210;
      }
      unint64_t v210 = (unint64_t)(float)((float)(1.4 / (float)v200) * (float)v183);
      int v143 = v209 + 1;
      unsigned int v140 = v304;
      unint64_t v141 = v181;
    }
    while (v209 + 1 < v304);
  }
  uint64_t v184 = self->_threadgroupSize;
  if (self->_supportsDispatchThreadsWithIndirectBuffer)
  {
    [a3 setComputePipelineState:v192];
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    *(void *)v310 = v184;
    *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
    [a3 dispatchThreadgroupsWithIndirectBuffer:a15 indirectBufferOffset:a16 + 1536 threadsPerThreadgroup:v310];
  }
  else
  {
    [(MTLGPUBVHBuilder *)self dispatchIndirect:v192 indirectBuffer:a5 indirectBufferOffset:v252 counterBuffer:a15 counterBufferOffset:a16 counterIndex:6 threadgroupDivisor:1 threadgroupSize:self->_threadgroupSize encoder:a3];
  }
}

- (void)writeBVHHeaderWithEncoder:(id)a3 descriptor:(id)a4 tmpCounterBuffer:(id)a5 tmpCounterBufferOffset:(unint64_t)a6 nodeBuffer:(id)a7 nodeBufferOffset:(unint64_t)a8 headerBuffer:(id)a9 headerBufferOffset:(unint64_t)a10 nodeOffset:(unint64_t)a11 fragmentOffset:(unint64_t)a12 fragmentIndexOffset:(unint64_t)a13 childIndexOffset:(unint64_t)a14 size:(unint64_t)a15
{
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_BVH_METADATA, a4);
  [a3 setBuffer:a5 offset:a6 atIndex:0];
  [a3 setBuffer:a7 offset:a8 atIndex:1];
  [a3 setBuffer:a9 offset:a10 atIndex:2];
  unint64_t v30 = a12;
  unint64_t v31 = a11;
  unint64_t v28 = a14;
  unint64_t v29 = a13;
  unint64_t v27 = a15;
  [a3 setBytes:&v31 length:8 atIndex:3];
  [a3 setBytes:&v30 length:8 atIndex:4];
  [a3 setBytes:&v29 length:8 atIndex:5];
  [a3 setBytes:&v28 length:8 atIndex:6];
  [a3 setBytes:&v27 length:8 atIndex:7];
  [a3 setComputePipelineState:Pipeline];
  uint64_t threadgroupSize = self->_threadgroupSize;
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v24 = vdupq_n_s64(1uLL);
  int64x2_t v25 = v24;
  uint64_t v26 = 1;
  uint64_t v23 = threadgroupSize;
  [a3 dispatchThreadgroups:&v25 threadsPerThreadgroup:&v23];
}

- (void)initializeCounterBuffer:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int binningTGSize = self->_binningTGSize;
  unsigned int spatialBinningTGSize = self->_spatialBinningTGSize;
  unsigned int threadgroupSize = self->_threadgroupSize;
  int32x4_t v15 = vdupq_n_s32(threadgroupSize);
  unsigned int v16 = binningTGSize;
  unsigned int v17 = spatialBinningTGSize;
  int32x4_t v18 = v15;
  unsigned int v19 = threadgroupSize;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_INITIALIZE_COUNTERS, self->_pipelineCache.baseThreadgroupSize, 0));
  [a3 setBuffer:a4 offset:a5 atIndex:29];
  [a3 setBytes:&v15 length:44 atIndex:30];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  long long v13 = xmmword_1828D6400;
  uint64_t v14 = 1;
  long long v11 = xmmword_1828D6410;
  uint64_t v12 = 1;
  [a3 dispatchThreads:&v13 threadsPerThreadgroup:&v11];
}

- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8 primitiveCountBuffer:(id)a9 primitiveCountBufferOffset:(unint64_t)a10
{
  if ([a4 splitHeuristic] != 2 && objc_msgSend(a4, "splitHeuristic") != 3) {
    MTLReportFailure(0, "-[MTLGPUBVHBuilder buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:]", 5294, @"GPU BVH builder only supports BinnedSAH and BinnedSpatialSAH split heuristics", v16, v17, v18, v19, v55);
  }
  if ((unint64_t)[a4 branchingFactor] < 2
    || (unint64_t)[a4 branchingFactor] >= 9)
  {
    MTLReportFailure(0, "-[MTLGPUBVHBuilder buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:]", 5296, @"Branching factor must be between 2 and 8 inclusive", v20, v21, v22, v23, v55);
  }
  id v64 = a5;
  id v74 = a3;
  if (!+[MTLGPUBVHBuilder supportsDevice:self->_device]) {
    MTLReportFailure(0, "-[MTLGPUBVHBuilder buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:]", 5298, @"GPU BVH builder is not supported on this Metal device", v24, v25, v26, v27, v55);
  }
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v80 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a4 fragmentCapacity:&v84 fragmentIndexCapacity:&v80 innerNodeCapacity:&v83 leafNodeCapacity:&v82 primitiveDataCapacity:&v81];
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  unint64_t v73 = [(MTLGPUBVHBuilder *)self getGenericBVHSizeForDescriptor:a4 nodeOffset:&v79 fragmentOffset:&v78 fragmentIndexOffset:&v77 childIndexOffset:&v76];
  [a4 updatePipelineKey];
  unint64_t v71 = [(MTLGPUBVHBuilder *)self fragmentScratchSizeForDescriptor:a4];
  uint64_t v28 = v80;
  unint64_t v29 = (((a8 + 255) | 0xFC) + 4 * v80) & 0xFFFFFFFFFFFFFF00;
  uint64_t v30 = [a4 maxSubKeyframeTemporalSplits];
  uint64_t v31 = 2 * v28 + 255;
  if (!v30) {
    uint64_t v31 = 0;
  }
  unint64_t v72 = v29;
  unint64_t v67 = (v31 + v29) & 0xFFFFFFFFFFFFFF00;
  unint64_t v66 = (v67 + 259) & 0xFFFFFFFFFFFFFF00;
  unint64_t v32 = (v66 + 271) & 0xFFFFFFFFFFFFFF00;
  unint64_t v33 = (v32 + 271) & 0xFFFFFFFFFFFFFF00;
  if ([a4 motion]) {
    uint64_t v34 = 256;
  }
  else {
    uint64_t v34 = 0;
  }
  unint64_t v65 = (v33 + 3071) & 0xFFFFFFFFFFFFFF00;
  unint64_t v35 = v34 + v65;
  if ([a4 motion]) {
    uint64_t v36 = 256;
  }
  else {
    uint64_t v36 = 0;
  }
  unint64_t v37 = v36 + v35;
  if ([a4 motion]) {
    uint64_t v38 = 256;
  }
  else {
    uint64_t v38 = 0;
  }
  unint64_t v63 = v37;
  unint64_t v39 = v38 + v37;
  if ([a4 motion]) {
    uint64_t v40 = 256;
  }
  else {
    uint64_t v40 = 0;
  }
  unint64_t v70 = (v32 + 271) & 0xFFFFFFFFFFFFFF00;
  [(MTLGPUBVHBuilder *)self initializeCounterBuffer:v74 counterBuffer:a7 counterBufferOffset:v70];
  id v41 = [(MTLGPUBVHBuilder *)self retainedResourcesArrayWithEncoder:v74];
  if ([a4 requiresResourceBuffer]) {
    [(MTLGPUBVHBuilder *)self setResourceBufferWithDescriptor:a4 retainedResources:v41 onEncoder:v74 atIndex:23];
  }
  unint64_t v68 = v40 + v39;
  unint64_t v62 = v35;
  unint64_t v61 = v39;
  if (!objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count")
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType"))
  {
    uint64_t v58 = v39;
    unint64_t v51 = v63;
    id v42 = v64;
    unint64_t v56 = v35;
    uint64_t v50 = self;
    unint64_t v46 = v65;
    unint64_t v47 = (v67 + 259) & 0xFFFFFFFFFFFFFF00;
    unint64_t v49 = v67;
    long double v52 = self;
    id v48 = v74;
    -[MTLGPUBVHBuilder getPolygonFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:](v52, "getPolygonFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:", v74, a4, v64, a6, a9, a10, v64, v78 + a6, a7, v67, a7, v66, a7, (v66 + 271) & 0xFFFFFFFFFFFFFF00,
      a7,
      v65,
      a7,
      v56,
      a7,
      v63,
      a7,
      v58);
LABEL_29:
    uint64_t v44 = v61;
    unint64_t v43 = (v66 + 271) & 0xFFFFFFFFFFFFFF00;
    uint64_t v45 = v51;
    goto LABEL_30;
  }
  long double v60 = self;
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType") != 1)
  {
    id v48 = v74;
    uint64_t v54 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType");
    uint64_t v44 = v39;
    unint64_t v49 = v67;
    unint64_t v43 = (v66 + 271) & 0xFFFFFFFFFFFFFF00;
    unint64_t v46 = (v33 + 3071) & 0xFFFFFFFFFFFFFF00;
    unint64_t v47 = (v67 + 259) & 0xFFFFFFFFFFFFFF00;
    unint64_t v53 = v35;
    uint64_t v45 = v63;
    id v42 = v64;
    uint64_t v50 = v60;
    if (v54 != 2) {
      goto LABEL_31;
    }
    unint64_t v51 = v63;
    -[MTLGPUBVHBuilder getCurveFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:](v60, "getCurveFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:", v74, a4, v64, a6, a9, a10, v64, v78 + a6, a7, v67, a7, v66, a7, v43,
      a7,
      v65,
      a7,
      v53,
      a7,
      v63,
      a7,
      v44);
    goto LABEL_29;
  }
  uint64_t v59 = v40 + v39;
  uint64_t v57 = v39;
  id v42 = v64;
  -[MTLGPUBVHBuilder getBoundingBoxFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:fragmentScratchBuffer:fragmentScratchBufferOffset:](self, "getBoundingBoxFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:fragmentScratchBuffer:fragmentScratchBufferOffset:", v64, v78 + a6, a7, v67, a7, v66, a7, v32, a7, v65, a7, v35, a7,
    v63,
    a7,
    v57,
    a7,
    v59);
  uint64_t v44 = v61;
  unint64_t v43 = (v66 + 271) & 0xFFFFFFFFFFFFFF00;
  uint64_t v45 = v63;
  unint64_t v46 = (v33 + 3071) & 0xFFFFFFFFFFFFFF00;
  unint64_t v47 = (v67 + 259) & 0xFFFFFFFFFFFFFF00;
  id v48 = v74;
  unint64_t v49 = v67;
  uint64_t v50 = v60;
LABEL_30:
  unint64_t v53 = v62;
LABEL_31:
  v75[0] = 0;
  v75[1] = (a8 + 255) & 0xFFFFFFFFFFFFFF00;
  v75[2] = v72;
  -[MTLGPUBVHBuilder buildWithEncoder:descriptor:scratchBuffer:scratchBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentIndexBuffer0:fragmentIndexBuffer0Offset:nodeBuffer:nodeBufferOffset:childIndexBuffer:childIndexBufferOffset:counterBuffer:counterBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:scratchBufferOffsets:](v50, "buildWithEncoder:descriptor:scratchBuffer:scratchBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentIndexBuffer0:fragmentIndexBuffer0Offset:nodeBuffer:nodeBufferOffset:childIndexBuffer:childIndexBufferOffset:counterBuffer:counterBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:scratchBufferOffsets:", v48, a4, a7, v68 + v71, v42, v78 + a6, v42, v77 + a6, v42, v79 + a6, v42, v76 + a6, a7,
    v70,
    a7,
    v49,
    a7,
    v47,
    a7,
    v43,
    a7,
    v46,
    a7,
    v53,
    a7,
    v45,
    a7,
    v44,
    v75);
  [(MTLGPUBVHBuilder *)v50 writeBVHHeaderWithEncoder:v48 descriptor:a4 tmpCounterBuffer:a7 tmpCounterBufferOffset:v70 nodeBuffer:v42 nodeBufferOffset:v79 + a6 headerBuffer:v42 headerBufferOffset:a6 nodeOffset:v79 fragmentOffset:v78 fragmentIndexOffset:v77 childIndexOffset:v76 size:v73];
}

- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8
{
}

+ (unint64_t)prefixSumScratchBufferSizeWithCapacity:(unint64_t)a3
{
  if (a3 < 0x201) {
    return 0;
  }
  uint64_t v3 = 0;
  do
  {
    unint64_t v4 = a3 + 511;
    a3 = (a3 + 511) >> 9;
    v3 += v4 >> 9;
  }
  while (a3 > 0x200);
  return 4 * v3;
}

- (void)threadgroupPrefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10
{
  if (a6) {
    unint64_t v14 = a7;
  }
  else {
    unint64_t v14 = a5;
  }
  if (a6) {
    id v15 = a6;
  }
  else {
    id v15 = a4;
  }
  uint64_t v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_PREFIX_SUM_REDUCE;
  if (!a6) {
    uint64_t v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_PREFIX_SUM;
  }
  int v17 = *((unsigned __int8 *)&self->super.super.isa + *v16);
  *(_OWORD *)&v23[4] = 0u;
  long long v24 = 0u;
  int v22 = v17;
  *(void *)uint64_t v23 = 57344;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v22));
  [a3 setBuffer:a4 offset:a5 atIndex:28];
  [a3 setBuffer:v15 offset:v14 atIndex:29];
  if (a8)
  {
    [a3 setBuffer:a8 offset:a9 atIndex:30];
  }
  else
  {
    int v22 = a10;
    [a3 setBytes:&v22 length:4 atIndex:30];
  }
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  unint64_t v20 = (a10 + 511) >> 9;
  int64x2_t v21 = vdupq_n_s64(1uLL);
  long long v18 = xmmword_1828D6420;
  uint64_t v19 = 1;
  [a3 dispatchThreadgroups:&v20 threadsPerThreadgroup:&v18];
}

- (void)addPrefixSumsWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10
{
  int KERNEL_INDEX_PREFIX_SUM_ADD_low = LOBYTE(self->KERNEL_INDEX_PREFIX_SUM_ADD);
  *(_OWORD *)&v22[4] = 0u;
  long long v23 = 0u;
  int v21 = KERNEL_INDEX_PREFIX_SUM_ADD_low;
  *(void *)int v22 = 57344;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v21));
  [a3 setBuffer:a4 offset:a5 atIndex:28];
  [a3 setBuffer:a6 offset:a7 atIndex:29];
  if (a8)
  {
    [a3 setBuffer:a8 offset:a9 atIndex:30];
  }
  else
  {
    int v21 = a10;
    [a3 setBytes:&v21 length:4 atIndex:30];
  }
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  unint64_t v19 = (a10 + 511) >> 9;
  int64x2_t v20 = vdupq_n_s64(1uLL);
  long long v17 = xmmword_1828D6420;
  uint64_t v18 = 1;
  [a3 dispatchThreadgroups:&v19 threadsPerThreadgroup:&v17];
}

- (void)prefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 scratchBuffer:(id)a8 scratchBufferOffset:(unint64_t)a9 countBuffer:(id)a10 countBufferOffset:(unint64_t)a11 capacity:(unint64_t)a12
{
  if (a12)
  {
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    if (a12 > 0x200)
    {
      [(MTLGPUBVHBuilder *)self threadgroupPrefixSumWithEncoder:a3 inputBuffer:a4 inputBufferOffset:a5 reducedBuffer:a8 reducedBufferOffset:a9 countBuffer:a10 countBufferOffset:a11 capacity:a12];
      [(MTLGPUBVHBuilder *)self prefixSumWithEncoder:a3 inputBuffer:a8 inputBufferOffset:a9 reducedBuffer:a6 reducedBufferOffset:a7 scratchBuffer:a8 scratchBufferOffset:a9 + 4 * ((a12 + 511) >> 9) countBuffer:0 countBufferOffset:0 capacity:(a12 + 511) >> 9];
      -[MTLGPUBVHBuilder addPrefixSumsWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "addPrefixSumsWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a8, a9, a10);
    }
    else
    {
      -[MTLGPUBVHBuilder threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a6, a7, a10);
    }
  }
}

+ (unint64_t)breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:(unint64_t)a3
{
  return +[MTLGPUBVHBuilder prefixSumScratchBufferSizeWithCapacity:](MTLGPUBVHBuilder, "prefixSumScratchBufferSizeWithCapacity:")+ 16 * a3;
}

- (void)layoutNodesBreadthFirstWithEncoder:(id)a3 descriptor:(id)a4 BVHBuffer:(id)a5 BVHBufferOffset:(unint64_t)a6 counterBuffer:(id)a7 counterBufferOffset:(unint64_t)a8 nodeMappingBuffer:(id)a9 nodeMappingBufferOffset:(unint64_t)a10 levelOffsetsBuffer:(id)a11 levelOffsetsBufferOffset:(unint64_t)a12 levelCountsBuffer:(id)a13 levelCountsBufferOffset:(unint64_t)a14 scratchBuffer:(id)a15 scratchBufferOffset:(unint64_t)a16
{
  uint64_t v76 = 0;
  v77[0] = 0;
  uint64_t v74 = 0;
  unint64_t v75 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a4 fragmentCapacity:v77 innerNodeCapacity:&v76 leafNodeCapacity:&v75 primitiveDataCapacity:&v74];
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  [(MTLGPUBVHBuilder *)self getGenericBVHSizeForDescriptor:a4 nodeOffset:&v73 fragmentOffset:&v72 fragmentIndexOffset:&v71 childIndexOffset:&v70];
  unint64_t v44 = +[MTLGPUBVHBuilder prefixSumScratchBufferSizeWithCapacity:v75]+ a16;
  unint64_t v39 = v44 + 4 * v75;
  unint64_t v21 = v39 + 4 * v75;
  unint64_t v22 = v21 + 4 * v75;
  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((unsigned __int8 *)&self->_pipelineCache, self->KERNEL_INDEX_THREADGROUP_BREADTH_FIRST_LAYOUT, a4, self->_maxThreadsPerThreadgroup.width);
  unint64_t v47 = self;
  id v48 = a4;
  uint64_t v25 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_INIT, a4);
  unint64_t v26 = [Pipeline maxTotalThreadsPerThreadgroup];
  double v27 = log2((double)v75);
  id v41 = 0;
  id v42 = 0;
  uint64_t v40 = 0;
  unint64_t v43 = v26;
  if (v26 < (unint64_t)exp2(ceil(v27)))
  {
    id v42 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, v47->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_FINISH_ITERATION, v48);
    id v41 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, v47->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_CLASSIFY, v48);
    uint64_t v40 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, v47->KERNEL_INDEX_BREADTH_FIRST_LAYOUT, v48);
  }
  [a3 setBuffer:a15 offset:v21 atIndex:0];
  [a3 setBuffer:a15 offset:v22 atIndex:1];
  [a3 setBuffer:a15 offset:v44 atIndex:2];
  [a3 setBuffer:a15 offset:v39 atIndex:3];
  [a3 setBuffer:a5 offset:v73 + a6 atIndex:4];
  [a3 setBuffer:a5 offset:v70 + a6 atIndex:5];
  [a3 setBuffer:a7 offset:a8 atIndex:6];
  [a3 setBuffer:a9 offset:a10 atIndex:7];
  [a3 setBuffer:a11 offset:a12 atIndex:8];
  [a3 setBuffer:a13 offset:a14 atIndex:9];
  [a3 setComputePipelineState:v25];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v67 = vdupq_n_s64(1uLL);
  int64x2_t v68 = v67;
  uint64_t v69 = 1;
  uint64_t threadgroupSize = v47->_threadgroupSize;
  [a3 dispatchThreadgroups:&v68 threadsPerThreadgroup:&threadgroupSize];
  double v28 = log2((double)(unint64_t)[v48 branchingFactor]);
  if ([v48 maxDepth])
  {
    char v29 = 0;
    unint64_t v30 = 0;
    do
    {
      unint64_t v31 = v22;
      [a3 setBuffer:a15 offset:v21 atIndex:0];
      [a3 setBuffer:a15 offset:v22 atIndex:1];
      int v65 = v30;
      [a3 setBytes:&v65 length:4 atIndex:10];
      if (1 << v29 >= v75) {
        uint64_t v32 = v75;
      }
      else {
        uint64_t v32 = 1 << v29;
      }
      double v33 = log2((double)(unint64_t)v32);
      unint64_t v34 = (unint64_t)exp2(ceil(v33));
      if (v26 >= v34)
      {
        [a3 setComputePipelineState:Pipeline];
        uint64_t v37 = [v48 branchingFactor];
        char v38 = 2;
        if (v37 != 2) {
          char v38 = 3;
        }
        [a3 setThreadgroupMemoryLength:((v34 << v38) + 15) & 0xFFFFFFFFFFFFFFF0 atIndex:0];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        int64x2_t v62 = vdupq_n_s64(1uLL);
        int64x2_t v63 = v62;
        uint64_t v64 = 1;
        unint64_t v61 = v34;
        [a3 dispatchThreadgroups:&v63 threadsPerThreadgroup:&v61];
      }
      else
      {
        [a3 setComputePipelineState:v41];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        unint64_t v35 = v47->_threadgroupSize;
        unint64_t v59 = (v32 - 1 + v35) / v35;
        int64x2_t v60 = vdupq_n_s64(1uLL);
        unint64_t v57 = v35;
        int64x2_t v58 = v60;
        [a3 dispatchThreadgroups:&v59 threadsPerThreadgroup:&v57];
        [(MTLGPUBVHBuilder *)v47 prefixSumWithEncoder:a3 inputBuffer:a15 inputBufferOffset:v44 reducedBuffer:0 reducedBufferOffset:0 scratchBuffer:a15 scratchBufferOffset:a16 countBuffer:a7 countBufferOffset:a8 capacity:v32];
        if ([v48 branchingFactor] != 2) {
          [(MTLGPUBVHBuilder *)v47 prefixSumWithEncoder:a3 inputBuffer:a15 inputBufferOffset:v39 reducedBuffer:0 reducedBufferOffset:0 scratchBuffer:a15 scratchBufferOffset:a16 countBuffer:a7 countBufferOffset:a8 capacity:v32];
        }
        [a3 setComputePipelineState:v40];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        unint64_t v36 = v47->_threadgroupSize;
        unint64_t v55 = (v32 - 1 + v36) / v36;
        int64x2_t v56 = vdupq_n_s64(1uLL);
        unint64_t v53 = v36;
        int64x2_t v54 = v56;
        [a3 dispatchThreadgroups:&v55 threadsPerThreadgroup:&v53];
        [a3 setComputePipelineState:v42];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        int64x2_t v50 = vdupq_n_s64(1uLL);
        int64x2_t v51 = v50;
        uint64_t v52 = 1;
        uint64_t v49 = v47->_threadgroupSize;
        [a3 dispatchThreadgroups:&v51 threadsPerThreadgroup:&v49];
        unint64_t v26 = v43;
      }
      ++v30;
      v29 += (unint64_t)v28;
      unint64_t v22 = v21;
      unint64_t v21 = v31;
    }
    while (v30 < [v48 maxDepth]);
  }
}

- (unint64_t)getEncodeMTLSWBVHScratchBufferSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a4 fragmentCapacity:&v12 innerNodeCapacity:&v11 leafNodeCapacity:&v10 primitiveDataCapacity:&v9];
  unint64_t v5 = (((((4 * (v11 + v10) + 255) & 0xFFFFFFFFFFFFFF00) + 3071) & 0xFFFFFFFFFFFFFF00) + 1023) & 0xFFFFFFFFFFFFFF00;
  unint64_t v6 = (+[MTLGPUBVHBuilder breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:"breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:"]+ v5+ 255) & 0xFFFFFFFFFFFFFF00;
  unint64_t v7 = (v6 + 4 * [a4 maxDepth] + 255) & 0xFFFFFFFFFFFFFF00;
  return v7 + 4 * [a4 maxDepth];
}

- (unint64_t)getMTLSWBVHSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4 refitDataOffset:(unint64_t *)a5 innerNodeOffset:(unint64_t *)a6 leafNodeOffset:(unint64_t *)a7 primitiveOffset:(unint64_t *)a8 controlPointOffset:(unint64_t *)a9 primitiveRefitDataOffset:(unint64_t *)a10 geometryOffset:(unint64_t *)a11 primitiveBVHOffset:(unint64_t *)a12 transformOffset:(unint64_t *)a13 instancedResourceIDsOffset:(unint64_t *)a14
{
  if (self)
  {
    [self getMTLSWBVHSizeAndOffsetsForDescriptor:a3 bvhDescriptor:a4];
    self = 0;
  }
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  *a11 = 0;
  *a12 = 0;
  *a13 = 0;
  *a14 = 0;
  return self;
}

- (unint64_t)getMTLSWBVHSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4
{
  if (self)
  {
    [self getMTLSWBVHSizeAndOffsetsForDescriptor:a3 bvhDescriptor:a4];
    return v4;
  }
  return self;
}

- (id)newGeometryBufferWithGeometryDescriptors:(id)a3 retainedResources:(id)a4
{
  unint64_t v7 = [a3 count];
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = (void *)[(MTLDevice *)self->_device newBufferWithLength:8 * v8 options:0];
  uint64_t v10 = [v9 contents];
  if (v7)
  {
    uint64_t v11 = 0;
    uint64_t v12 = (_DWORD *)(v10 + 4);
    do
    {
      long long v13 = (void *)[a3 objectAtIndexedSubscript:v11];
      *(v12 - 1) = [v13 opaque];
      *uint64_t v12 = [v13 intersectionFunctionTableOffset];
      v12 += 2;
      ++v11;
    }
    while (v7 != v11);
  }
  [a4 addObject:v9];
  return v9;
}

- (void)setGeometryBufferWithGeometryDescriptors:(id)a3 retainedResources:(id)a4 onEncoder:(id)a5 atIndex:(unint64_t)a6
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v11 = [a3 count];
  unint64_t v12 = v11;
  if (v11 >= 0x11)
  {
    v18[0] = (id)[(MTLDevice *)self->_device newBufferWithLength:8 * v11 options:0];
    long long v13 = (char *)[v18[0] contents];
  }
  else
  {
    long long v13 = (char *)v18 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, 8 * v11);
    if (!v12)
    {
LABEL_11:
      [a5 setBytes:v13 length:8 * v12 atIndex:a6];
      return;
    }
    v18[0] = 0;
  }
  uint64_t v14 = 0;
  id v15 = v13 + 4;
  do
  {
    uint64_t v16 = objc_msgSend(a3, "objectAtIndexedSubscript:", v14, v18[0]);
    *(v15 - 1) = [v16 opaque];
    *id v15 = [v16 intersectionFunctionTableOffset];
    v15 += 2;
    ++v14;
  }
  while (v12 != v14);
  if (!v18[0]) {
    goto LABEL_11;
  }
  [a4 addObject:v18[0]];
  id v17 = v18[0];
}

- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 gpuResourceID:(MTLResourceID)a12 accelerationStructureUniqueIdentifier:(unint64_t)a13
{
  uint64_t v16 = self;
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v137 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  uint64_t v236 = 0;
  uint64_t v235 = 0;
  uint64_t v234 = 0;
  uint64_t v233 = 0;
  [(MTLBVHBuilder *)v16 getCapacitiesForDescriptor:a5 fragmentCapacity:&v236 innerNodeCapacity:&v235 leafNodeCapacity:&v234 primitiveDataCapacity:&v233];
  uint64_t v232 = 0;
  uint64_t v231 = 0;
  uint64_t v230 = 0;
  uint64_t v229 = 0;
  [(MTLGPUBVHBuilder *)v16 getGenericBVHSizeForDescriptor:a5 nodeOffset:&v232 fragmentOffset:&v231 fragmentIndexOffset:&v230 childIndexOffset:&v229];
  long long v228 = 0u;
  memset(&v227[1], 0, 80);
  if (v16) {
    [(MTLGPUBVHBuilder *)v16 getMTLSWBVHSizeAndOffsetsForDescriptor:a4 bvhDescriptor:a5];
  }
  unint64_t v17 = (((a11 + 255) | 0xFC) + 4 * (v235 + v234)) & 0xFFFFFFFFFFFFFF00;
  unint64_t v143 = (v17 + 3071) & 0xFFFFFFFFFFFFFF00;
  unint64_t v18 = (+[MTLGPUBVHBuilder breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:"breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:"]+ ((v143 + 1023) & 0xFFFFFFFFFFFFFF00)+ 255) & 0xFFFFFFFFFFFFFF00;
  id v144 = a5;
  unint64_t v19 = (v18 + 4 * [a5 maxDepth] + 255) & 0xFFFFFFFFFFFFFF00;
  [v144 maxDepth];
  [v144 updatePipelineKey];
  unint64_t v129 = v18;
  id v122 = a10;
  unint64_t v130 = v19;
  unint64_t v140 = v17;
  -[MTLGPUBVHBuilder layoutNodesBreadthFirstWithEncoder:descriptor:BVHBuffer:BVHBufferOffset:counterBuffer:counterBufferOffset:nodeMappingBuffer:nodeMappingBufferOffset:levelOffsetsBuffer:levelOffsetsBufferOffset:levelCountsBuffer:levelCountsBufferOffset:scratchBuffer:scratchBufferOffset:](v16, "layoutNodesBreadthFirstWithEncoder:descriptor:BVHBuffer:BVHBufferOffset:counterBuffer:counterBufferOffset:nodeMappingBuffer:nodeMappingBufferOffset:levelOffsetsBuffer:levelOffsetsBufferOffset:levelCountsBuffer:levelCountsBufferOffset:scratchBuffer:scratchBufferOffset:", a3, v144, a8, a9);
  int MTLSWBVHType = getMTLSWBVHType((MTLAccelerationStructureDescriptor *)a4);
  int MTLSWBVHPrimitiveType = getMTLSWBVHPrimitiveType((MTLAccelerationStructureDescriptor *)a4);
  BOOL MTLSWBVHMotion = getMTLSWBVHMotion((MTLAccelerationStructureDescriptor *)a4);
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_BVH_NODE0, v144);
  v227[0] = 0;
  uint64_t v226 = 0;
  id v142 = a4;
  uint64_t p_pipelineCache = (uint64_t)&v16->_pipelineCache;
  int v148 = MTLSWBVHPrimitiveType;
  int v141 = MTLSWBVHType;
  if (!MTLSWBVHType)
  {
    char v29 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_PRIMITIVE_BVH, v144);
    unint64_t v30 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_PRIMITIVE_BVH_INNER_NODE, v144);
    unint64_t v31 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_ENCODE_MTL_CURVE_BVH_LEAF_NODE;
    if (MTLSWBVHPrimitiveType == 1) {
      unint64_t v31 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_ENCODE_MTL_BBOX_BVH_LEAF_NODE;
    }
    if (!MTLSWBVHPrimitiveType) {
      unint64_t v31 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_ENCODE_MTL_TRIANGLE_BVH_LEAF_NODE;
    }
    v126 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, *(_DWORD *)((char *)&v16->super.super.isa + *v31), v144);
    obuint64_t j = (id)[v144 geometryDescriptors];
    uint64_t v135 = [obj count];
    uint64_t v123 = v16;
    uint64_t v125 = Pipeline;
    uint64_t v131 = v29;
    v132 = v30;
    if (v135)
    {
      int v32 = MTLSWBVHPrimitiveType;
      if ([v144 requiresResourceBuffer])
      {
        long long v224 = 0u;
        long long v225 = 0u;
        long long v222 = 0u;
        long long v223 = 0u;
        uint64_t v33 = [obj countByEnumeratingWithState:&v222 objects:v245 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v147 = 0;
          uint64_t v35 = *(void *)v223;
          while (1)
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v223 != v35) {
                objc_enumerationMutation(obj);
              }
              uint64_t v37 = *(void **)(*((void *)&v222 + 1) + 8 * i);
              if (v32)
              {
                if (v32 == 1)
                {
                  long long v216 = 0uLL;
                  long long v217 = 0uLL;
                  long long v214 = 0uLL;
                  long long v215 = 0uLL;
                  char v38 = (void *)[v37 boundingBoxBuffers];
                  uint64_t v39 = [v38 countByEnumeratingWithState:&v214 objects:v243 count:16];
                  if (!v39) {
                    goto LABEL_56;
                  }
                  uint64_t v40 = v39;
                  uint64_t v41 = *(void *)v215;
                  do
                  {
                    for (uint64_t j = 0; j != v40; ++j)
                    {
                      if (*(void *)v215 != v41) {
                        objc_enumerationMutation(v38);
                      }
                      objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v214 + 1) + 8 * j), "buffer"), 1);
                    }
                    uint64_t v40 = [v38 countByEnumeratingWithState:&v214 objects:v243 count:16];
                  }
                  while (v40);
                }
                else
                {
                  long long v212 = 0uLL;
                  long long v213 = 0uLL;
                  long long v210 = 0uLL;
                  long long v211 = 0uLL;
                  id v48 = (void *)[v37 controlPointBuffers];
                  uint64_t v49 = [v48 countByEnumeratingWithState:&v210 objects:v242 count:16];
                  if (v49)
                  {
                    uint64_t v50 = v49;
                    uint64_t v51 = *(void *)v211;
                    do
                    {
                      for (uint64_t k = 0; k != v50; ++k)
                      {
                        if (*(void *)v211 != v51) {
                          objc_enumerationMutation(v48);
                        }
                        objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v210 + 1) + 8 * k), "buffer"), 1);
                      }
                      uint64_t v50 = [v48 countByEnumeratingWithState:&v210 objects:v242 count:16];
                    }
                    while (v50);
                  }
                  long long v208 = 0u;
                  long long v209 = 0u;
                  long long v206 = 0u;
                  long long v207 = 0u;
                  unint64_t v53 = (void *)[v37 radiusBuffers];
                  uint64_t v54 = [v53 countByEnumeratingWithState:&v206 objects:v241 count:16];
                  if (v54)
                  {
                    uint64_t v55 = v54;
                    uint64_t v56 = *(void *)v207;
                    do
                    {
                      for (uint64_t m = 0; m != v55; ++m)
                      {
                        if (*(void *)v207 != v56) {
                          objc_enumerationMutation(v53);
                        }
                        objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v206 + 1) + 8 * m), "buffer"), 1);
                      }
                      uint64_t v55 = [v53 countByEnumeratingWithState:&v206 objects:v241 count:16];
                    }
                    while (v55);
                  }
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(v37, "indexBuffer"), 1);
                  v147 += [v37 controlPointCount];
                }
              }
              else
              {
                long long v220 = 0uLL;
                long long v221 = 0uLL;
                long long v218 = 0uLL;
                long long v219 = 0uLL;
                unint64_t v43 = (void *)[v37 vertexBuffers];
                uint64_t v44 = [v43 countByEnumeratingWithState:&v218 objects:v244 count:16];
                if (v44)
                {
                  uint64_t v45 = v44;
                  uint64_t v46 = *(void *)v219;
                  do
                  {
                    for (uint64_t n = 0; n != v45; ++n)
                    {
                      if (*(void *)v219 != v46) {
                        objc_enumerationMutation(v43);
                      }
                      objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v218 + 1) + 8 * n), "buffer"), 1);
                    }
                    uint64_t v45 = [v43 countByEnumeratingWithState:&v218 objects:v244 count:16];
                  }
                  while (v45);
                }
                if ([v37 indexBuffer]) {
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(v37, "indexBuffer"), 1);
                }
                if ([v37 transformationMatrixBuffer]) {
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(v37, "transformationMatrixBuffer"), 1);
                }
              }
              int v32 = v148;
LABEL_56:
              if ([v37 primitiveDataBuffer]) {
                objc_msgSend(a3, "useResource:usage:", objc_msgSend(v37, "primitiveDataBuffer"), 1);
              }
            }
            uint64_t v34 = [obj countByEnumeratingWithState:&v222 objects:v245 count:16];
            if (!v34)
            {
LABEL_69:
              a4 = v142;
              uint64_t v16 = v123;
              uint64_t v127 = -[MTLGPUBVHBuilder newGeometryBufferWithGeometryDescriptors:retainedResources:](v123, "newGeometryBufferWithGeometryDescriptors:retainedResources:", [v142 geometryDescriptors], v137);
              int v62 = 0;
              BOOL v65 = 0;
              unsigned int v66 = 0;
              id obja = 0;
              uint64_t v64 = v144;
              Pipeline = v125;
              uint64_t v67 = v135;
              unsigned int v63 = v147;
              goto LABEL_94;
            }
          }
        }
      }
      else if (!MTLSWBVHPrimitiveType)
      {
        int64x2_t v68 = (void *)[obj objectAtIndexedSubscript:0];
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 5);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v68, "indexBuffer"), objc_msgSend(v68, "indexBufferOffset"), 6);
      }
    }
    LODWORD(v147) = 0;
    goto LABEL_69;
  }
  long long v23 = objc_opt_class();
  if ([v23 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v124 = Pipeline;
    long long v24 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH, v144);
    uint64_t v25 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_INNER_NODE, v144);
    uint64_t v26 = [a4 instanceDescriptorType];
    uint64_t v27 = v26;
    uint64_t v131 = v24;
    v132 = v25;
    if (v26 == 4 || v26 == 2) {
      int v28 = [a4 motionTransformCount];
    }
    else {
      int v28 = [a4 instanceCount];
    }
    int v62 = v28;
    unsigned int v237 = 3;
    uint64_t v69 = [a4 instanceTransformationMatrixLayout];
    unsigned int v237 = v237 & 0xFFFFFFEF | (16 * (v69 == 1));
    BOOL v65 = [a4 instanceTransformationMatrixLayout] == 1;
    unsigned int v66 = [a4 motionTransformType];
    switch(v27)
    {
      case 0:
      case 2:
        uint64_t v74 = 308;
        goto LABEL_79;
      case 1:
        uint64_t v74 = 312;
        goto LABEL_79;
      case 3:
      case 4:
        uint64_t v74 = 316;
LABEL_79:
        int v83 = *(_DWORD *)((char *)&v16->super.super.isa + v74);
        *(void *)&long long v190 = 0;
        long long v189 = 0u;
        long long v188 = 0u;
        PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&v16->_pipelineCache, v83, v144, v16->_pipelineCache.baseThreadgroupSize, &v237, (uint64_t)&v188);
        v126 = PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, (uint64_t)&v188, 0);
        break;
      default:
        MTLReportFailure(0, "-[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:]", 6590, @"Unhandled instance descriptor type", v70, v71, v72, v73, (uint64_t)a10);
        v126 = 0;
        break;
    }
    objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceDescriptorBuffer"), objc_msgSend(a4, "instanceDescriptorBufferOffset"), 8);
    LODWORD(v226) = [a4 instanceDescriptorStride];
    id obja = -[MTLGPUBVHBuilder newInstanceBufferWithBVHs:retainedResources:encoder:encodedStride:](v16, "newInstanceBufferWithBVHs:retainedResources:encoder:encodedStride:", [a4 instancedAccelerationStructures], v137, a3, v227);
    objc_msgSend(a3, "setBuffer:offset:atIndex:");
    if (v27 == 4 || v27 == 2) {
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "motionTransformBuffer"), objc_msgSend(a4, "motionTransformBufferOffset"), 11);
    }
    char v84 = [a4 usage];
    unsigned int v63 = 0;
    uint64_t v67 = 0;
    uint64_t v127 = 0;
    if ((v84 & 4) != 0) {
      int v85 = -1;
    }
    else {
      int v85 = 255;
    }
    HIDWORD(v226) = v85;
    uint64_t v64 = v144;
    Pipeline = v124;
  }
  else
  {
    int64x2_t v58 = objc_opt_class();
    if ([v58 isSubclassOfClass:objc_opt_class()])
    {
      unint64_t v59 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH, v144);
      int64x2_t v60 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_INNER_NODE, v144);
      uint64_t v61 = [a4 instanceDescriptorType];
      uint64_t v131 = v59;
      v132 = v60;
      if (v61 == 4) {
        int v75 = [a4 maxMotionTransformCount];
      }
      else {
        int v75 = [a4 maxInstanceCount];
      }
      int v76 = v75;
      unsigned int v237 = 3;
      uint64_t v77 = [a4 instanceTransformationMatrixLayout];
      unsigned int v237 = v237 & 0xFFFFFFEF | (16 * (v77 == 1));
      BOOL v65 = [a4 instanceTransformationMatrixLayout] == 1;
      unsigned int v66 = [a4 motionTransformType];
      if (v61 == 3 || v61 == 4)
      {
        unsigned int KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT = v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT;
        *(void *)&long long v190 = 0;
        long long v189 = 0u;
        long long v188 = 0u;
        PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&v16->_pipelineCache, KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT, v144, v16->_pipelineCache.baseThreadgroupSize, &v237, (uint64_t)&v188);
        v126 = PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, (uint64_t)&v188, 0);
      }
      else
      {
        MTLReportFailure(0, "-[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:]", 6652, @"Unhandled instance descriptor type", v78, v79, v80, v81, (uint64_t)a10);
        v126 = 0;
      }
      int v62 = v76;
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceDescriptorBuffer"), objc_msgSend(a4, "instanceDescriptorBufferOffset"), 8);
      LODWORD(v226) = [a4 instanceDescriptorStride];
      id obja = [(MTLGPUBVHBuilder *)v16 newInstanceBufferWithBVHs:0 retainedResources:v137 encoder:a3 encodedStride:v227];
      objc_msgSend(a3, "setBuffer:offset:atIndex:");
      if ([a4 instanceDescriptorType] == 4) {
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "motionTransformBuffer"), objc_msgSend(a4, "motionTransformBufferOffset"), 11);
      }
      char v86 = [a4 usage];
      unsigned int v63 = 0;
      uint64_t v67 = 0;
      uint64_t v127 = 0;
      if ((v86 & 4) != 0) {
        int v87 = -1;
      }
      else {
        int v87 = 255;
      }
      HIDWORD(v226) = v87;
      uint64_t v64 = v144;
    }
    else
    {
      int v62 = 0;
      unsigned int v63 = 0;
      uint64_t v64 = v144;
      BOOL v65 = 0;
      unsigned int v66 = 0;
      uint64_t v67 = 0;
      v126 = 0;
      uint64_t v127 = 0;
      id obja = 0;
      uint64_t v131 = 0;
      v132 = 0;
    }
  }
LABEL_94:
  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v201 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v188 = 0u;
  *(void *)&long long v189 = 0;
  long long v190 = 0u;
  long long v191 = *(_OWORD *)&v227[2];
  long long v192 = *(_OWORD *)&v227[4];
  long long v193 = *(_OWORD *)&v227[6];
  long long v194 = *(_OWORD *)&v227[8];
  HIDWORD(v190) = v227[0];
  uint64_t v195 = v227[10];
  uint64_t v196 = v227[1];
  *((void *)&v189 + 1) = __PAIR64__(v67, v63);
  LODWORD(v188) = (2 * (v148 & 3)) | v141;
  uint64_t v136 = v67;
  DWORD1(v190) = v62;
  *(void *)&long long v197 = a13;
  *(void *)&long long v202 = *((void *)&v228 + 1);
  uint64_t v199 = v228;
  uint64_t v200 = v233;
  char v88 = [v64 maxDepth];
  LODWORD(v188) = v188 & 0xFFFF80FF | ((v88 & 0x7F) << 8);
  char v89 = [a4 usage];
  if (MTLSWBVHMotion) {
    int v90 = 8;
  }
  else {
    int v90 = 0;
  }
  LODWORD(v188) = v188 & 0xFFFFFFE7 | v90 & 0xFFFFFFEF | (16 * (v89 & 1));
  *((void *)&v205 + 1) = __PAIR64__(v66, v65);
  if (!v141)
  {
    DWORD2(v190) = [v142 motionKeyframeCount];
    [v142 motionStartTime];
    DWORD1(v188) = v91;
    [v142 motionEndTime];
    DWORD2(v188) = v92;
    char v93 = [v142 motionStartBorderMode];
    LODWORD(v188) = v188 & 0xFFFFFFDF | (32 * (v93 & 1));
    char v94 = [v142 motionEndBorderMode];
    LODWORD(v188) = v188 & 0xFFFFFFBF | ((v94 & 1) << 6);
  }
  [a3 setBytes:&v226 length:8 atIndex:0];
  [a3 setBytes:&v188 length:256 atIndex:9];
  [a3 setBuffer:a8 offset:a9 atIndex:1];
  [a3 setBuffer:a6 offset:a7 atIndex:2];
  [a3 setBuffer:a10 offset:(a11 + 255) & 0xFFFFFFFFFFFFFF00 atIndex:3];
  [a3 setBuffer:a10 offset:v140 atIndex:4];
  [a3 setBuffer:a6 offset:(void)v228 + a7 atIndex:12];
  [a3 setBuffer:a10 offset:v129 atIndex:13];
  [a3 setBuffer:a10 offset:v130 atIndex:14];
  uint64_t threadgroupSize = v16->_threadgroupSize;
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v186 = vdupq_n_s64(1uLL);
  uint64_t v187 = 1;
  uint64_t v184 = threadgroupSize;
  int64x2_t v185 = v186;
  [a3 dispatchThreadgroups:&v186 threadsPerThreadgroup:&v184];
  if (v233)
  {
    objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, v16->KERNEL_INDEX_ENCODE_PRIMITIVE_DATA, v144));
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    int64x2_t v181 = vdupq_n_s64(1uLL);
    int64x2_t v182 = v181;
    uint64_t v183 = 1;
    uint64_t v180 = threadgroupSize;
    [a3 dispatchThreadgroups:&v182 threadsPerThreadgroup:&v180];
  }
  v174[0] = [a10 gpuAddress] + v140;
  v174[1] = [a10 gpuAddress] + v143;
  unsigned int v96 = v16->_threadgroupSize;
  int v175 = 1536;
  unsigned int v176 = v96;
  uint64_t v177 = 0x101000900;
  int v178 = 33556480;
  unsigned int v179 = v96;
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  uint64_t v173 = 0;
  unsigned int KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(v16->KERNEL_INDEX_COPY_COUNTERS);
  *(_OWORD *)&v238[4] = 0u;
  long long v239 = 0u;
  unsigned int v237 = KERNEL_INDEX_COPY_COUNTERS_low;
  *(void *)v238 = (log2((double)*(unint64_t *)(p_pipelineCache + 40)) & 0xF) << 13;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, (uint64_t)&v237, &v173));
  [a3 setBytes:v174 length:40 atIndex:30];
  uint64_t v172 = 1;
  uint64_t v169 = v173;
  int64x2_t v170 = vdupq_n_s64(1uLL);
  long long v171 = xmmword_1828D6430;
  [a3 dispatchThreads:&v171 threadsPerThreadgroup:&v169];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  [a3 setComputePipelineState:v131];
  uint64_t v167 = v16->_threadgroupSize;
  int64x2_t v168 = vdupq_n_s64(1uLL);
  [a3 dispatchThreadgroupsWithIndirectBuffer:a10 indirectBufferOffset:v143 threadsPerThreadgroup:&v167];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  [a3 setComputePipelineState:v126];
  uint64_t v165 = v16->_threadgroupSize;
  int64x2_t v166 = vdupq_n_s64(1uLL);
  [a3 dispatchThreadgroupsWithIndirectBuffer:a10 indirectBufferOffset:v143 + 256 threadsPerThreadgroup:&v165];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  [a3 setComputePipelineState:v132];
  uint64_t v163 = v16->_threadgroupSize;
  int64x2_t v164 = vdupq_n_s64(1uLL);
  [a3 dispatchThreadgroupsWithIndirectBuffer:a10 indirectBufferOffset:v143 + 512 threadsPerThreadgroup:&v163];
  if (v141)
  {
    id v98 = objc_opt_class();
    if ([v98 isSubclassOfClass:objc_opt_class()])
    {
      int64x2_t v99 = v16;
      uint64_t v100 = [v142 instanceDescriptorType];
      unsigned int v237 = [v142 instanceCount];
      [a3 setBytes:&v237 length:4 atIndex:15];
      int v101 = v99;
      id v102 = -[MTLGPUBVHBuilder newResourceIDsBufferWithBVHs:retainedResources:encoder:](v99, "newResourceIDsBufferWithBVHs:retainedResources:encoder:", [v142 instancedAccelerationStructures], v137, a3);
      [a3 setBuffer:v102 offset:0 atIndex:16];
      unint64_t v107 = (void *)v127;
      if (!v237) {
        goto LABEL_137;
      }
LABEL_130:
      switch(v100)
      {
        case 0:
        case 2:
          uint64_t v119 = 320;
          goto LABEL_135;
        case 1:
          uint64_t v119 = 324;
          goto LABEL_135;
        case 3:
        case 4:
          uint64_t v119 = 328;
LABEL_135:
          uint64_t v120 = PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, *(_DWORD *)((char *)&v101->super.super.isa + v119), v144);
          break;
        default:
          MTLReportFailure(0, "-[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:]", 6901, @"Unexpected MTLAccelerationStructureInstanceDescriptorType", v103, v104, v105, v106, (uint64_t)v122);
          uint64_t v120 = 0;
          break;
      }
      [a3 setComputePipelineState:v120];
      uint64_t v121 = v101->_threadgroupSize;
      uint64_t v152 = (v237 + v121 - 1) / v121;
      int64x2_t v153 = vdupq_n_s64(1uLL);
      uint64_t v150 = v121;
      int64x2_t v151 = v153;
      [a3 dispatchThreadgroups:&v152 threadsPerThreadgroup:&v150];
      goto LABEL_137;
    }
    uint64_t v113 = objc_opt_class();
    unint64_t v107 = (void *)v127;
    if (![v113 isSubclassOfClass:objc_opt_class()])
    {
      MTLReportFailure(0, "-[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:]", 6879, @"Unexpected MTLAccelerationStructureDescriptor type", v114, v115, v116, v117, (uint64_t)v122);
      id v102 = 0;
      goto LABEL_137;
    }
    int v101 = v16;
    uint64_t v100 = [v142 instanceDescriptorType];
    unsigned int v118 = [v142 maxInstanceCount];
    unsigned int v237 = v118;
    objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v142, "instanceCountBuffer"), objc_msgSend(v142, "instanceCountBufferOffset"), 15);
    id v102 = 0;
    if (v118) {
      goto LABEL_130;
    }
  }
  else
  {
    unint64_t v107 = (void *)v127;
    [(MTLGPUBVHBuilder *)v16 copyFromBuffer:v127 sourceBufferOffset:0 toBuffer:a6 destinationBufferOffset:v227[8] + a7 length:8 * v136 encoder:a3];
    id v102 = 0;
    if (v148 == 2)
    {
      objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_CURVE_BVH_CONTROL_POINTS, v144));
      unsigned int v237 = 0;
      long long v159 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      unint64_t v108 = (void *)[v144 geometryDescriptors];
      id v102 = (id)[v108 countByEnumeratingWithState:&v159 objects:v240 count:16];
      if (v102)
      {
        uint64_t v109 = *(void *)v160;
        int64x2_t v149 = vdupq_n_s64(1uLL);
        do
        {
          for (iuint64_t i = 0; ii != v102; iuint64_t i = (char *)ii + 1)
          {
            if (*(void *)v160 != v109) {
              objc_enumerationMutation(v108);
            }
            uint64_t v111 = *(void **)(*((void *)&v159 + 1) + 8 * (void)ii);
            int v158 = 0;
            int v158 = [v111 controlPointCount];
            if (v158)
            {
              [a3 setBytes:&v158 length:4 atIndex:15];
              [a3 setBytes:&v237 length:4 atIndex:16];
              uint64_t v112 = v16->_threadgroupSize;
              uint64_t v156 = (v158 + (int)v112 - 1) / v112;
              int64x2_t v157 = v149;
              uint64_t v154 = v112;
              int64x2_t v155 = v149;
              [a3 dispatchThreadgroups:&v156 threadsPerThreadgroup:&v154];
            }
            ++v237;
          }
          id v102 = (id)[v108 countByEnumeratingWithState:&v159 objects:v240 count:16];
        }
        while (v102);
      }
    }
  }
LABEL_137:
}

- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 accelerationStructureUniqueIdentifier:(unint64_t)a12
{
}

- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 uniqueIdentifier:(unint64_t)a12
{
}

- (void)writeMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  uint64_t v19 = 0;
  uint64_t p_pipelineCache = &self->_pipelineCache;
  int KERNEL_INDEX_GET_MTL_BVH_SIZE_low = LOBYTE(self->KERNEL_INDEX_GET_MTL_BVH_SIZE);
  *(_OWORD *)&v21[4] = 0u;
  long long v22 = 0u;
  int v20 = KERNEL_INDEX_GET_MTL_BVH_SIZE_low;
  *(void *)unint64_t v21 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v20, &v19);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v16 = vdupq_n_s64(1uLL);
  int64x2_t v17 = v16;
  uint64_t v18 = 1;
  uint64_t v15 = v19;
  [a3 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
}

- (void)writeCompactedMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7 sizeDataType:(unint64_t)a8
{
  uint64_t v21 = 0;
  uint64_t p_pipelineCache = &self->_pipelineCache;
  if (a8 == 33) {
    uint64_t v14 = 332;
  }
  else {
    uint64_t v14 = 336;
  }
  int v15 = *((unsigned __int8 *)&self->super.super.isa + v14);
  *(_OWORD *)&v23[4] = 0u;
  long long v24 = 0u;
  int v22 = v15;
  *(void *)long long v23 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v22, &v21);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v18 = vdupq_n_s64(1uLL);
  int64x2_t v19 = v18;
  uint64_t v20 = 1;
  uint64_t v17 = v21;
  [a3 dispatchThreadgroups:&v19 threadsPerThreadgroup:&v17];
}

- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9 compact:(BOOL)a10 copyVertexData:(BOOL)a11 copyPerPrimitiveData:(BOOL)a12
{
  BOOL v18 = a12;
  BOOL v19 = a11;
  v77[8] = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0, a6, a7, a8._impl);
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setBytes:&a9 length:8 atIndex:2];
  unint64_t v20 = 0x1E8F57000uLL;
  unint64_t v21 = 0x1E8F57000uLL;
  if (v19)
  {
    uint64_t p_pipelineCache = &self->_pipelineCache;
    if (a10) {
      long long v23 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_COPY_AND_COMPACT_MTL_BVH_HEADER;
    }
    else {
      long long v23 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_COPY_MTL_BVH_HEADER;
    }
    objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v23), self->_pipelineCache.baseThreadgroupSize, 0));
    uint64_t v24 = (self->_threadgroupSize + 31) / self->_threadgroupSize;
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    uint64_t v75 = v24;
    int64x2_t v76 = vdupq_n_s64(1uLL);
    uint64_t threadgroupSize = self->_threadgroupSize;
    int64x2_t v74 = v76;
    [a3 dispatchThreadgroups:&v75 threadsPerThreadgroup:&threadgroupSize];
    v77[0] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_INNER_NODES, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[1] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_LEAF_NODES, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[2] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_PRIMITIVES, self->_pipelineCache.baseThreadgroupSize, 0);
    uint64_t v77[3] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_GEOMETRIES, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[4] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_TRANSFORMS, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[5] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_PRIMITIVE_BVHS, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[6] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_CONTROL_POINTS, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[7] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_RESOURCE_IDS, self->_pipelineCache.baseThreadgroupSize, 0);
    uint64_t v72 = 0;
    int KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_COPY_COUNTERS);
    *(_OWORD *)&v63[8] = 0u;
    long long v64 = 0u;
    *(_DWORD *)unsigned int v63 = KERNEL_INDEX_COPY_COUNTERS_low;
    *(void *)&v63[4] = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
    Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v63, &v72);
    if (self->_supportsDispatchThreadsWithIndirectBuffer)
    {
      unsigned int v26 = self->_threadgroupSize;
      *(void *)unsigned int v63 = [a4 gpuAddress] + a5;
      uint64_t v27 = [a4 gpuAddress];
      unint64_t v28 = 0;
      *(void *)&v63[8] = a5 + v27 + 200;
      do
      {
        uint64_t v29 = 0;
        unint64_t v30 = v28;
        uint64_t v31 = v28 ^ 7;
        if ((v28 ^ 7) >= 3) {
          uint64_t v31 = 3;
        }
        uint64_t v51 = v31;
        uint64_t v32 = v31 + 1;
        uint64_t v33 = &word_1828D6450[v28];
        uint64_t v34 = (unsigned int *)&v63[20];
        do
        {
          *((_WORD *)v34 - 2) = v33[v29];
          *((_WORD *)v34 - 1) = 12 * v29;
          *uint64_t v34 = v26;
          v34 += 2;
          ++v29;
        }
        while (v32 != v29);
        [a3 setComputePipelineState:Pipeline];
        [a3 setBytes:v63 length:48 atIndex:30];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        uint64_t v70 = v32;
        int64x2_t v71 = vdupq_n_s64(1uLL);
        uint64_t v68 = v72;
        int64x2_t v69 = v71;
        [a3 dispatchThreads:&v70 threadsPerThreadgroup:&v68];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        unint64_t v50 = v30 + v29;
        uint64_t v35 = &v77[v30];
        uint64_t v36 = -12;
        do
        {
          uint64_t v37 = *v35++;
          [a3 setComputePipelineState:v37];
          uint64_t v66 = self->_threadgroupSize;
          int64x2_t v67 = vdupq_n_s64(1uLL);
          [a3 dispatchThreadgroupsWithIndirectBuffer:a4 indirectBufferOffset:v36 + 212 threadsPerThreadgroup:&v66];
          v36 += 12;
        }
        while (12 * v51 != v36);
        unint64_t v28 = v50;
      }
      while (v50 <= 7);
      unint64_t v21 = 0x1E8F57000;
      unint64_t v20 = 0x1E8F57000;
    }
    else
    {
      id v38 = [(MTLGPUBVHBuilder *)self retainedResourcesArrayWithEncoder:a3];
      uint64_t v65 = 0;
      id v39 = [(MTLGPUBVHBuilder *)self newIndirectBufferWithCapacity:8 withRetainedResources:v38 indirectBufferStride:&v65];
      [v38 addObject:v39];
      unsigned int v40 = self->_threadgroupSize;
      *(void *)unsigned int v63 = [a4 gpuAddress] + a5;
      uint64_t v41 = [v39 gpuAddress];
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      *(void *)&v63[8] = v41;
      uint64_t v44 = word_1828D6450;
      uint64_t v45 = v65;
      do
      {
        __int16 v46 = *v44++;
        unint64_t v47 = &v63[v43];
        *((_WORD *)v47 + 8) = v46;
        *((_WORD *)v47 + 9) = v42;
        *((_DWORD *)v47 + 5) = v40;
        v43 += 8;
        v42 += v45;
      }
      while (v43 != 64);
      [a3 setComputePipelineState:Pipeline];
      [a3 setBytes:v63 length:80 atIndex:30];
      unint64_t v20 = 0x1E8F57000uLL;
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      uint64_t v62 = 1;
      uint64_t v59 = v72;
      int64x2_t v60 = vdupq_n_s64(1uLL);
      long long v61 = xmmword_1828D6440;
      [a3 dispatchThreads:&v61 threadsPerThreadgroup:&v59];
      unint64_t v21 = 0x1E8F57000uLL;
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      uint64_t v48 = 0;
      int64x2_t v52 = vdupq_n_s64(1uLL);
      do
      {
        [a3 setComputePipelineState:v77[v48]];
        uint64_t v57 = self->_threadgroupSize;
        int64x2_t v58 = v52;
        [a3 dispatchThreadgroupsWithIndirectBuffer:v39 indirectBufferOffset:v65 * v48++ threadsPerThreadgroup:&v57];
      }
      while (v48 != 8);
    }
  }
  if (v18)
  {
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)self + *(int *)(v20 + 3336), self->KERNEL_INDEX_COPY_PRIMITIVE_DATA, *(void *)((char *)&self->_dispatchBinsTGSize + *(int *)(v20 + 3336)), 0));
    int64x2_t v54 = vdupq_n_s64(1uLL);
    int64x2_t v55 = v54;
    uint64_t v56 = 1;
    uint64_t v53 = *(unsigned int *)((char *)&self->super.super.isa + *(int *)(v21 + 3340));
    [a3 dispatchThreadgroups:&v55 threadsPerThreadgroup:&v53];
  }
}

- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9 compact:(BOOL)a10 copyVertexData:(BOOL)a11 copyPerPrimitiveData:(BOOL)a12
{
}

- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9
{
  BYTE2(v9) = 1;
  LOWORD(v9) = 256;
  -[MTLGPUBVHBuilder copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:](self, "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:", a3, a4, a5, a6, a7, a8._impl, a9, v9);
}

- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9
{
}

- (void)copyAndCompactMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9
{
  BYTE2(v9) = 1;
  LOWORD(v9) = 257;
  -[MTLGPUBVHBuilder copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:](self, "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:", a3, a4, a5, a6, a7, a8._impl, a9, v9);
}

- (void)copyAndCompactMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9
{
}

- (id)newInstanceBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5 encodedStride:(unint64_t *)a6
{
  if (a6) {
    *a6 = 8;
  }
  device = self->_device;
  if ((unint64_t)objc_msgSend(a3, "count", a3, a4, a5) < 2) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = 8 * [a3 count];
  }
  uint64_t v10 = (void *)[(MTLDevice *)device newBufferWithLength:v9 options:0];
  uint64_t v11 = [v10 contents];
  if ([a3 count])
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "buffer"), "gpuAddress");
      *(void *)(v11 + 8 * v12) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "bufferOffset")
                                 + v13;
      ++v12;
    }
    while (v12 < [a3 count]);
  }
  [a4 addObject:v10];
  return v10;
}

- (id)newResourceIDsBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5
{
  device = self->_device;
  if ((unint64_t)[a3 count] < 2) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = 8 * [a3 count];
  }
  uint64_t v9 = (void *)[(MTLDevice *)device newBufferWithLength:v8 options:0];
  uint64_t v10 = [v9 contents];
  if ([a3 count])
  {
    unint64_t v11 = 0;
    do
    {
      *(void *)(v10 + 8 * v11) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v11), "gpuResourceID");
      ++v11;
    }
    while (v11 < [a3 count]);
  }
  [a4 addObject:v9];
  return v9;
}

- (id)newInstanceBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5
{
  return [(MTLGPUBVHBuilder *)self newInstanceBufferWithBVHs:a3 retainedResources:a4 encoder:a5 encodedStride:0];
}

- (void)getMTLInstanceBoundingBoxesWithEncoder:(id)a3 descriptor:(id)a4 boundingBoxBuffer:(id)a5 boundingBoxBufferOffset:(unint64_t)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = objc_opt_class();
  if ([v11 isSubclassOfClass:objc_opt_class()])
  {
    if ([a4 instanceCount])
    {
      id v12 = [(MTLGPUBVHBuilder *)self retainedResourcesArrayWithEncoder:a3];
      uint64_t v13 = (void *)[a4 instancedAccelerationStructures];
      id v14 = [(MTLGPUBVHBuilder *)self newInstanceBufferWithBVHs:v13 retainedResources:v12 encoder:a3];
      useResourcesBatched(v13, 1, a3);
      int v51 = [a4 instanceCount];
      int v50 = [a4 instanceDescriptorStride];
      unint64_t v49 = 0;
      uint64_t v15 = [a4 instanceDescriptorType];
      uint64_t v16 = [a4 instanceTransformationMatrixLayout] == 1;
      uint64_t v54 = 0;
      long long v52 = 0u;
      long long v53 = 0u;
      unint64_t v17 = ((log2((double)self->_threadgroupSize) & 0xF) << 13) | (unint64_t)(v16 << 40);
      switch(v15)
      {
        case 0:
          uint64_t v18 = 388;
          goto LABEL_13;
        case 1:
          uint64_t v18 = 392;
          goto LABEL_13;
        case 2:
          uint64_t v25 = 388;
          goto LABEL_15;
        case 3:
          uint64_t v18 = 396;
LABEL_13:
          LODWORD(v52) = *((unsigned __int8 *)&self->super.super.isa + v18);
          goto LABEL_16;
        case 4:
          uint64_t v25 = 396;
LABEL_15:
          LODWORD(v52) = *((unsigned __int8 *)&self->super.super.isa + v25);
          v17 |= 0x10uLL;
LABEL_16:
          *(void *)((char *)&v52 + 4) = v17;
          Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v52, &v49);
          break;
        default:
          Pipeline = 0;
          break;
      }
      [a3 setComputePipelineState:Pipeline];
      [a3 setBytes:&v51 length:4 atIndex:0];
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceDescriptorBuffer"), objc_msgSend(a4, "instanceDescriptorBufferOffset"), 1);
      [a3 setBytes:&v50 length:4 atIndex:2];
      [a3 setBuffer:v14 offset:0 atIndex:3];
      [a3 setBuffer:a5 offset:a6 atIndex:4];
      if ([a4 motionTransformBuffer]) {
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "motionTransformBuffer"), objc_msgSend(a4, "motionTransformBufferOffset"), 5);
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      unsigned int v26 = (void *)[a4 instancedAccelerationStructures];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v46;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v46 != v29) {
              objc_enumerationMutation(v26);
            }
            [a3 useResource:*(void *)(*((void *)&v45 + 1) + 8 * v30++) usage:1];
          }
          while (v28 != v30);
          uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v28);
      }
      unint64_t v31 = v49;
      unint64_t v32 = (v31 + [a4 instanceCount] - 1) / v31;
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      unint64_t v43 = v32;
      int64x2_t v44 = vdupq_n_s64(1uLL);
      unint64_t v41 = v31;
      int64x2_t v42 = v44;
      [a3 dispatchThreadgroups:&v43 threadsPerThreadgroup:&v41];
    }
  }
  else
  {
    BOOL v19 = objc_opt_class();
    if ([v19 isSubclassOfClass:objc_opt_class()] && objc_msgSend(a4, "maxInstanceCount"))
    {
      int v51 = [a4 instanceDescriptorStride];
      unint64_t v49 = 0;
      uint64_t v20 = [a4 instanceDescriptorType];
      uint64_t v21 = [a4 instanceTransformationMatrixLayout] == 1;
      uint64_t v54 = 0;
      long long v52 = 0u;
      long long v53 = 0u;
      unint64_t v22 = ((log2((double)self->_threadgroupSize) & 0xF) << 13) | (unint64_t)(v21 << 40);
      switch(v20)
      {
        case 0:
          uint64_t v23 = 388;
          goto LABEL_33;
        case 1:
          uint64_t v23 = 392;
          goto LABEL_33;
        case 2:
          uint64_t v34 = 388;
          goto LABEL_35;
        case 3:
          uint64_t v23 = 396;
LABEL_33:
          LODWORD(v52) = *((unsigned __int8 *)&self->super.super.isa + v23);
          goto LABEL_36;
        case 4:
          uint64_t v34 = 396;
LABEL_35:
          LODWORD(v52) = *((unsigned __int8 *)&self->super.super.isa + v34);
          v22 |= 0x10uLL;
LABEL_36:
          *(void *)((char *)&v52 + 4) = v22;
          uint64_t v33 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v52, &v49);
          break;
        default:
          uint64_t v33 = 0;
          break;
      }
      [a3 setComputePipelineState:v33];
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceCountBuffer"), objc_msgSend(a4, "instanceCountBufferOffset"), 0);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceDescriptorBuffer"), objc_msgSend(a4, "instanceDescriptorBufferOffset"), 1);
      [a3 setBytes:&v51 length:4 atIndex:2];
      [a3 setBuffer:a5 offset:a6 atIndex:4];
      if ([a4 motionTransformBuffer]) {
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "motionTransformBuffer"), objc_msgSend(a4, "motionTransformBufferOffset"), 5);
      }
      unint64_t v35 = v49;
      unint64_t v36 = (v35 + [a4 maxInstanceCount] - 1) / v35;
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      unint64_t v39 = v36;
      int64x2_t v40 = vdupq_n_s64(1uLL);
      unint64_t v37 = v35;
      int64x2_t v38 = v40;
      [a3 dispatchThreadgroups:&v39 threadsPerThreadgroup:&v37];
    }
  }
}

- (unint64_t)getRefitScratchBufferSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:a4 fragmentCapacity:&v9 innerNodeCapacity:&v8 leafNodeCapacity:&v7 primitiveDataCapacity:&v6];
  return 12 * [a4 maxDepth] + 12;
}

- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13
{
}

- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13
{
}

- (void)refitVertexDataWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 inPlace:(BOOL)a6 sourceBuffer:(id)a7 sourceBufferOffset:(unint64_t)a8 scratchBuffer:(id)a9 scratchBufferOffset:(unint64_t)a10 retainedResources:(id)a11 innerNodeCapacity:(unint64_t)a12 leafNodeCapacity:(unint64_t)a13
{
  BOOL v13 = a6;
  uint64_t v15 = (MTLAccelerationStructureDescriptor *)a4;
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  int MTLSWBVHType = getMTLSWBVHType((MTLAccelerationStructureDescriptor *)a4);
  int MTLSWBVHPrimitiveType = getMTLSWBVHPrimitiveType(v15);
  if (v13) {
    uint64_t v20 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INNER_NODE_IN_PLACE;
  }
  else {
    uint64_t v20 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INNER_NODE;
  }
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v20), a5);
  unint64_t v107 = v15;
  int v110 = MTLSWBVHType;
  if (!MTLSWBVHType)
  {
    uint64_t v29 = (void *)[a5 geometryDescriptors];
    if ([v29 count])
    {
      if (v13)
      {
        if (refitUpdatesOpacityAndFunctionTableOffset(void)::pred != -1) {
          dispatch_once(&refitUpdatesOpacityAndFunctionTableOffset(void)::pred, &__block_literal_global_1);
        }
        if (refitUpdatesOpacityAndFunctionTableOffset(void)::useNewRefitBehavior) {
          goto LABEL_47;
        }
        uint64_t v30 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_GEOMETRIES_IN_PLACE;
      }
      else
      {
        uint64_t v30 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_GEOMETRIES;
      }
      objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v30), a5));
      [(MTLGPUBVHBuilder *)self setGeometryBufferWithGeometryDescriptors:[(MTLAccelerationStructureDescriptor *)v15 geometryDescriptors] retainedResources:a11 onEncoder:a3 atIndex:13];
      unint64_t v37 = ([v29 count] + (unint64_t)self->_threadgroupSize - 1) / self->_threadgroupSize;
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      unint64_t v145 = v37;
      int64x2_t v146 = vdupq_n_s64(1uLL);
      uint64_t threadgroupSize = self->_threadgroupSize;
      int64x2_t v144 = v146;
      [a3 dispatchThreadgroups:&v145 threadsPerThreadgroup:&threadgroupSize];
      uint64_t v15 = v107;
    }
LABEL_47:
    if (MTLSWBVHPrimitiveType == 1)
    {
      if ([v29 count])
      {
        unint64_t v41 = (void *)[v29 objectAtIndexedSubscript:0];
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v41, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v41, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 5);
      }
      unint64_t v39 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_BBOX_LEAF_NODE;
      int64x2_t v40 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_BBOX_LEAF_NODE_IN_PLACE;
    }
    else
    {
      if (MTLSWBVHPrimitiveType)
      {
        int64x2_t v42 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_CURVE_LEAF_NODE;
        if (v13)
        {
          int64x2_t v42 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_CURVE_LEAF_NODE_IN_PLACE;
          unint64_t v43 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_CURVE_CONTROL_POINTS_IN_PLACE;
        }
        else
        {
          unint64_t v43 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_CURVE_CONTROL_POINTS;
        }
        uint64_t v28 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v42), a5);
        uint64_t v106 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v43), a5);
        goto LABEL_63;
      }
      if ([v29 count])
      {
        int64x2_t v38 = (void *)[v29 objectAtIndexedSubscript:0];
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 2);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v38, "indexBuffer"), objc_msgSend(v38, "indexBufferOffset"), 3);
      }
      unint64_t v39 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_TRIANGLE_LEAF_NODE;
      int64x2_t v40 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_TRIANGLE_LEAF_NODE_IN_PLACE;
    }
    if (v13) {
      unint64_t v39 = v40;
    }
    uint64_t v28 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v39), a5);
LABEL_58:
    uint64_t v106 = 0;
LABEL_63:
    id v105 = 0;
    goto LABEL_64;
  }
  uint64_t v21 = objc_opt_class();
  if (![v21 isSubclassOfClass:objc_opt_class()])
  {
    unint64_t v31 = objc_opt_class();
    if (![v31 isSubclassOfClass:objc_opt_class()])
    {
      id v105 = 0;
      uint64_t v106 = 0;
      uint64_t v28 = 0;
      goto LABEL_64;
    }
    if ([(MTLAccelerationStructureDescriptor *)v15 instanceTransformationMatrixLayout] == 1)int v32 = 19; {
    else
    }
      int v32 = 3;
    int v147 = v32;
    if ([(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType]
      && [(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType] != 2)
    {
      if ([(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType] != 1)
      {
        if ([(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType] != 3
          && [(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType] != 4)
        {
          MTLReportFailure(0, "-[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:]", 8036, @"Unhandled instance descriptor type", v95, v96, v97, v98, v100);
          uint64_t v28 = 0;
          goto LABEL_37;
        }
        int64x2_t v99 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT;
        if (v13) {
          int64x2_t v99 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT_IN_PLACE;
        }
        unint64_t v36 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v99), a5, &v147, 0);
LABEL_36:
        uint64_t v28 = v36;
LABEL_37:
        objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor instanceDescriptorBuffer](v15, "instanceDescriptorBuffer"), -[MTLAccelerationStructureDescriptor instanceDescriptorBufferOffset](v15, "instanceDescriptorBufferOffset"), 6);
        LODWORD(v140) = 0;
        LODWORD(v140) = [(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorStride];
        [a3 setBytes:&v140 length:4 atIndex:7];
        if ([(MTLAccelerationStructureDescriptor *)v15 motionTransformBuffer]) {
          objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor motionTransformBuffer](v15, "motionTransformBuffer"), -[MTLAccelerationStructureDescriptor motionTransformBufferOffset](v15, "motionTransformBufferOffset"), 11);
        }
        LODWORD(v139) = 255;
        if (([(MTLAccelerationStructureDescriptor *)v15 usage] & 4) != 0) {
          LODWORD(v139) = -1;
        }
        [a3 setBytes:&v139 length:4 atIndex:12];
        goto LABEL_58;
      }
      uint64_t v33 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID;
      uint64_t v34 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID_IN_PLACE;
    }
    else
    {
      uint64_t v33 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT;
      uint64_t v34 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT_IN_PLACE;
    }
    if (v13) {
      uint64_t v33 = v34;
    }
    int v35 = *(_DWORD *)((char *)&self->super.super.isa + *v33);
    uint64_t v142 = 0;
    long long v140 = 0u;
    long long v141 = 0u;
    PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&self->_pipelineCache, v35, a5, self->_pipelineCache.baseThreadgroupSize, &v147, (uint64_t)&v140);
    unint64_t v36 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v140, 0);
    goto LABEL_36;
  }
  unint64_t v22 = (void *)[(MTLAccelerationStructureDescriptor *)v15 instancedAccelerationStructures];
  id v23 = [(MTLGPUBVHBuilder *)self newInstanceBufferWithBVHs:v22 retainedResources:a11 encoder:a3];
  useResourcesBatched(v22, 1, a3);
  id v105 = v23;
  [a3 setBuffer:v23 offset:0 atIndex:10];
  if ([(MTLAccelerationStructureDescriptor *)v15 instanceTransformationMatrixLayout] == 1)int v24 = 19; {
  else
  }
    int v24 = 3;
  int v147 = v24;
  if (![(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType]
    || [(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType] == 2)
  {
    uint64_t v25 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT;
    unsigned int v26 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT_IN_PLACE;
LABEL_12:
    if (v13) {
      uint64_t v25 = v26;
    }
    int v27 = *(_DWORD *)((char *)&self->super.super.isa + *v25);
    uint64_t v142 = 0;
    long long v140 = 0u;
    long long v141 = 0u;
    PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&self->_pipelineCache, v27, a5, self->_pipelineCache.baseThreadgroupSize, &v147, (uint64_t)&v140);
    uint64_t v28 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v140, 0);
    goto LABEL_15;
  }
  if ([(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType] == 1)
  {
    uint64_t v25 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID;
    unsigned int v26 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID_IN_PLACE;
    goto LABEL_12;
  }
  if ([(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType] == 3
    || [(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType] == 4)
  {
    uint64_t v25 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT;
    unsigned int v26 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT_IN_PLACE;
    goto LABEL_12;
  }
  MTLReportFailure(0, "-[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:]", 7998, @"Unhandled instance descriptor type", v91, v92, v93, v94, v100);
  uint64_t v28 = 0;
LABEL_15:
  objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor instanceDescriptorBuffer](v15, "instanceDescriptorBuffer"), -[MTLAccelerationStructureDescriptor instanceDescriptorBufferOffset](v15, "instanceDescriptorBufferOffset"), 6);
  LODWORD(v140) = 0;
  LODWORD(v140) = [(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorStride];
  [a3 setBytes:&v140 length:4 atIndex:7];
  if ([(MTLAccelerationStructureDescriptor *)v15 motionTransformBuffer]) {
    objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor motionTransformBuffer](v15, "motionTransformBuffer"), -[MTLAccelerationStructureDescriptor motionTransformBufferOffset](v15, "motionTransformBufferOffset"), 11);
  }
  LODWORD(v139) = 255;
  if (([(MTLAccelerationStructureDescriptor *)v15 usage] & 4) != 0) {
    LODWORD(v139) = -1;
  }
  [a3 setBytes:&v139 length:4 atIndex:12];
  uint64_t v106 = 0;
LABEL_64:
  unint64_t v44 = [a5 maxDepth];
  uint64_t p_pipelineCache = &self->_pipelineCache;
  unint64_t v112 = (a10 + 255) & 0xFFFFFFFFFFFFFF00;
  if (self->_supportsDispatchThreadsWithIndirectBuffer)
  {
    id v45 = a5;
    BOOL v46 = v13;
    unsigned int v104 = 4 * v44 + 256;
    int v101 = v28;
    unsigned int v47 = self->_threadgroupSize;
    *(void *)&long long v140 = [a7 gpuAddress] + a8;
    *((void *)&v140 + 1) = [a9 gpuAddress] + ((a10 + 255) & 0xFFFFFFFFFFFFFF00);
    if (v110) {
      unsigned int v48 = v47;
    }
    else {
      unsigned int v48 = 0;
    }
    LODWORD(v141) = 16;
    DWORD1(v141) = v48;
    if (v44 >= 0x1F) {
      unint64_t v49 = 31;
    }
    else {
      unint64_t v49 = v44;
    }
    uint64_t v50 = 4 * v44;
    if (v49)
    {
      uint64_t v51 = 0;
      long long v52 = (unsigned int *)&v141 + 3;
      uint64_t v53 = v50 + v104 - 4;
      do
      {
        ++v51;
        *((_WORD *)v52 - 2) = v53;
        *((_WORD *)v52 - 1) = 12 * v51;
        *long long v52 = v47;
        v52 += 2;
        v53 -= 4;
      }
      while (v49 != v51);
    }
    BOOL v102 = v46;
    uint64_t v103 = v45;
    uint64_t v139 = 0;
    int KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_COPY_COUNTERS);
    *(_OWORD *)&v148[4] = 0u;
    long long v149 = 0u;
    int v147 = KERNEL_INDEX_COPY_COUNTERS_low;
    *(void *)int v148 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
    objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v147, &v139));
    [a3 setBytes:&v140 length:8 * (v49 + 1) + 16 atIndex:30];
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    unint64_t v137 = v49 + 1;
    int64x2_t v138 = vdupq_n_s64(1uLL);
    uint64_t v135 = v139;
    int64x2_t v136 = v138;
    [a3 dispatchThreads:&v137 threadsPerThreadgroup:&v135];
    if (v44 >= 0x20)
    {
      unint64_t v55 = v44 - v49;
      uint64_t v56 = v50 + v104 - 4 * v49 - 4;
      do
      {
        unint64_t v57 = v55 - 32;
        if (v55 >= 0x20) {
          unint64_t v55 = 32;
        }
        if (v44 - v49 >= 0x20) {
          uint64_t v58 = 32;
        }
        else {
          uint64_t v58 = v44 - v49;
        }
        if (v58)
        {
          uint64_t v59 = 0;
          int64x2_t v60 = (unsigned int *)&v141 + 1;
          uint64_t v61 = v56;
          do
          {
            *((_WORD *)v60 - 2) = v61;
            *((_WORD *)v60 - 1) = 12 * v59;
            *int64x2_t v60 = v47;
            v60 += 2;
            ++v59;
            v61 -= 4;
          }
          while (v55 != v59);
        }
        [a3 setBytes:&v140 length:8 * v58 + 16 atIndex:30];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        uint64_t v133 = v58;
        int64x2_t v134 = vdupq_n_s64(1uLL);
        uint64_t v131 = v139;
        int64x2_t v132 = v134;
        [a3 dispatchThreads:&v133 threadsPerThreadgroup:&v131];
        v49 += 32;
        v56 -= 128;
        unint64_t v55 = v57;
      }
      while (v49 < v44);
    }
    a5 = v103;
    BOOL v13 = v102;
    uint64_t v15 = v107;
    uint64_t v28 = v101;
  }
  else
  {
    unsigned int v104 = (4 * v44 + 256) >> 2;
  }
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  if (self->_supportsDispatchThreadsWithIndirectBuffer)
  {
    [(MTLGPUBVHBuilder *)self dispatchIndirect:v28 counterBuffer:a9 counterBufferOffset:v112 threadgroupSize:self->_threadgroupSize encoder:a3];
    if (v44)
    {
      unint64_t v62 = v112 + 12;
      do
      {
        LODWORD(v140) = v44 - 1;
        [a3 setBytes:&v140 length:4 atIndex:14];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        [(MTLGPUBVHBuilder *)self dispatchIndirect:Pipeline counterBuffer:a9 counterBufferOffset:v62 threadgroupSize:self->_threadgroupSize encoder:a3];
        v62 += 12;
        --v44;
      }
      while (v44);
    }
  }
  else
  {
    if (v110) {
      uint64_t v63 = self->_threadgroupSize;
    }
    else {
      uint64_t v63 = 1;
    }
    [(MTLGPUBVHBuilder *)self dispatchIndirect:v28 indirectBuffer:a9 indirectBufferOffset:v112 threadCountBuffer:a7 threadCountBufferOffset:a8 threadCountIndex:4 threadgroupDivisor:v63 encoder:a3];
    for (; v44; --v44)
    {
      LODWORD(v140) = v44 - 1;
      [a3 setBytes:&v140 length:4 atIndex:14];
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      [(MTLGPUBVHBuilder *)self dispatchIndirect:Pipeline indirectBuffer:a9 indirectBufferOffset:v112 threadCountBuffer:a7 threadCountBufferOffset:a8 threadCountIndex:v104 - 1 + v44 threadgroupDivisor:self->_threadgroupSize encoder:a3];
    }
  }
  long long v64 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_HEADER;
  if (v13) {
    long long v64 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_HEADER_IN_PLACE;
  }
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v64), a5));
  unint64_t v65 = ((unint64_t)self->_threadgroupSize + 31) / self->_threadgroupSize;
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  unint64_t v129 = v65;
  int64x2_t v130 = vdupq_n_s64(1uLL);
  uint64_t v127 = self->_threadgroupSize;
  int64x2_t v128 = v130;
  [a3 dispatchThreadgroups:&v129 threadsPerThreadgroup:&v127];
  if (v106)
  {
    objc_msgSend(a3, "setComputePipelineState:");
    LODWORD(v140) = 0;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    uint64_t v66 = (void *)[a5 geometryDescriptors];
    uint64_t v67 = [v66 countByEnumeratingWithState:&v123 objects:v150 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v124;
      int64x2_t v114 = vdupq_n_s64(1uLL);
      do
      {
        for (uint64_t i = 0; i != v68; ++i)
        {
          if (*(void *)v124 != v69) {
            objc_enumerationMutation(v66);
          }
          int64x2_t v71 = *(void **)(*((void *)&v123 + 1) + 8 * i);
          int v147 = 0;
          int v147 = [v71 controlPointCount];
          [a3 setBytes:&v147 length:4 atIndex:15];
          [a3 setBytes:&v140 length:4 atIndex:16];
          uint64_t v72 = self->_threadgroupSize;
          uint64_t v121 = (v147 + (int)v72 - 1) / v72;
          int64x2_t v122 = v114;
          uint64_t v119 = v72;
          int64x2_t v120 = v114;
          [a3 dispatchThreadgroups:&v121 threadsPerThreadgroup:&v119];
          LODWORD(v140) = v140 + 1;
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v123 objects:v150 count:16];
      }
      while (v68);
    }
    uint64_t v15 = v107;
  }
  if (!v110) {
    goto LABEL_129;
  }
  uint64_t v73 = objc_opt_class();
  if (![v73 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v80 = objc_opt_class();
    if ([v80 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v74 = [(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType];
      int v85 = [(MTLAccelerationStructureDescriptor *)v15 maxInstanceCount];
      LODWORD(v140) = v85;
      objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor instanceCountBuffer](v15, "instanceCountBuffer"), -[MTLAccelerationStructureDescriptor instanceCountBufferOffset](v15, "instanceCountBufferOffset"), 15);
      id v75 = 0;
      if (v85) {
        goto LABEL_126;
      }
LABEL_130:
      char v88 = v105;
      goto LABEL_141;
    }
    MTLReportFailure(0, "-[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:]", 8231, @"Unexpected MTLAccelerationStructureDescriptor type", v81, v82, v83, v84, v100);
LABEL_129:
    id v75 = 0;
    goto LABEL_130;
  }
  uint64_t v74 = [(MTLAccelerationStructureDescriptor *)v15 instanceDescriptorType];
  LODWORD(v140) = [(MTLAccelerationStructureDescriptor *)v15 instanceCount];
  [a3 setBytes:&v140 length:4 atIndex:15];
  id v75 = [(MTLGPUBVHBuilder *)self newResourceIDsBufferWithBVHs:[(MTLAccelerationStructureDescriptor *)v15 instancedAccelerationStructures] retainedResources:a11 encoder:a3];
  [a3 setBuffer:v75 offset:0 atIndex:16];
  if (!v140) {
    goto LABEL_130;
  }
LABEL_126:
  switch(v74)
  {
    case 0:
    case 2:
      char v86 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_DEFAULT;
      int v87 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_DEFAULT_IN_PLACE;
      goto LABEL_137;
    case 1:
      char v86 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_USER_ID;
      int v87 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_USER_ID_IN_PLACE;
      goto LABEL_137;
    case 3:
    case 4:
      char v86 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_INDIRECT;
      int v87 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_INDIRECT_IN_PLACE;
LABEL_137:
      if (v13) {
        char v86 = v87;
      }
      char v89 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v86), a5);
      break;
    default:
      MTLReportFailure(0, "-[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:]", 8253, @"Unexpected MTLAccelerationStructureInstanceDescriptorType", v76, v77, v78, v79, v100);
      char v89 = 0;
      break;
  }
  char v88 = v105;
  [a3 setComputePipelineState:v89];
  uint64_t v90 = self->_threadgroupSize;
  uint64_t v117 = ((int)v140 + (int)v90 - 1) / v90;
  int64x2_t v118 = vdupq_n_s64(1uLL);
  uint64_t v115 = v90;
  int64x2_t v116 = v118;
  [a3 dispatchThreadgroups:&v117 threadsPerThreadgroup:&v115];
LABEL_141:
}

- (void)refitPrimitiveData:(id)a3 inPlace:(BOOL)a4 bvhDescriptor:(id)a5
{
  uint64_t p_pipelineCache = &self->_pipelineCache;
  if (a4) {
    uint64_t v8 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_PRIMITIVE_DATA_IN_PLACE;
  }
  else {
    uint64_t v8 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_PRIMITIVE_DATA;
  }
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v8), a5));
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  uint64_t threadgroupSize = self->_threadgroupSize;
  int64x2_t v11 = vdupq_n_s64(1uLL);
  int64x2_t v12 = v11;
  uint64_t v13 = 1;
  uint64_t v10 = threadgroupSize;
  [a3 dispatchThreadgroups:&v12 threadsPerThreadgroup:&v10];
}

- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13 options:(unint64_t)a14
{
  char v21 = a14;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v61 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  int MTLSWBVHType = getMTLSWBVHType((MTLAccelerationStructureDescriptor *)a4);
  id v60 = a4;
  uint64_t MTLSWBVHPrimitiveType = getMTLSWBVHPrimitiveType((MTLAccelerationStructureDescriptor *)a4);
  [a5 updatePipelineKey];
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  id v65 = a5;
  uint64_t v66 = self;
  id v24 = a5;
  uint64_t v25 = MTLSWBVHPrimitiveType;
  [(MTLBVHBuilder *)self getCapacitiesForDescriptor:v24 fragmentCapacity:&v92 innerNodeCapacity:&v91 leafNodeCapacity:&v90 primitiveDataCapacity:&v89];
  ++v91;
  BOOL v27 = a6 == a8 && a7 == a9;
  if (a8) {
    int v28 = v27;
  }
  else {
    int v28 = 1;
  }
  unsigned int v64 = v28;
  id v62 = a6;
  unint64_t v63 = a7;
  [a3 setBuffer:a6 offset:a7 atIndex:0];
  id v59 = a8;
  [a3 setBuffer:a8 offset:a9 atIndex:1];
  if (!MTLSWBVHType)
  {
    if ([(MTLGPUBVHBuilder *)self useResourceBufferForDescriptor:v65])
    {
      [(MTLGPUBVHBuilder *)self setResourceBufferWithDescriptor:v65 retainedResources:v61 onEncoder:a3 atIndex:23];
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      obuint64_t j = (id)[v65 geometryDescriptors];
      uint64_t v29 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v86;
        uint64_t v67 = *(void *)v86;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v86 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v33 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            if ((v21 & 2) != 0 && [*(id *)(*((void *)&v85 + 1) + 8 * i) primitiveDataBuffer]) {
              objc_msgSend(a3, "useResource:usage:", objc_msgSend(v33, "primitiveDataBuffer"), 1);
            }
            if (v21)
            {
              if (v25 == 1)
              {
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                unint64_t v41 = (void *)[v33 boundingBoxBuffers];
                uint64_t v42 = [v41 countByEnumeratingWithState:&v77 objects:v95 count:16];
                if (v42)
                {
                  uint64_t v43 = v42;
                  uint64_t v44 = *(void *)v78;
                  do
                  {
                    for (uint64_t j = 0; j != v43; ++j)
                    {
                      if (*(void *)v78 != v44) {
                        objc_enumerationMutation(v41);
                      }
                      objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * j), "buffer"), 1);
                    }
                    uint64_t v43 = [v41 countByEnumeratingWithState:&v77 objects:v95 count:16];
                  }
                  while (v43);
                }
              }
              else
              {
                uint64_t v34 = v25;
                if (v25)
                {
                  long long v75 = 0uLL;
                  long long v76 = 0uLL;
                  long long v73 = 0uLL;
                  long long v74 = 0uLL;
                  BOOL v46 = (void *)[v33 controlPointBuffers];
                  uint64_t v47 = [v46 countByEnumeratingWithState:&v73 objects:v94 count:16];
                  if (v47)
                  {
                    uint64_t v48 = v47;
                    uint64_t v49 = *(void *)v74;
                    do
                    {
                      for (uint64_t k = 0; k != v48; ++k)
                      {
                        if (*(void *)v74 != v49) {
                          objc_enumerationMutation(v46);
                        }
                        objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * k), "buffer"), 1);
                      }
                      uint64_t v48 = [v46 countByEnumeratingWithState:&v73 objects:v94 count:16];
                    }
                    while (v48);
                  }
                  long long v71 = 0u;
                  long long v72 = 0u;
                  long long v69 = 0u;
                  long long v70 = 0u;
                  uint64_t v51 = (void *)[v33 radiusBuffers];
                  uint64_t v52 = [v51 countByEnumeratingWithState:&v69 objects:v93 count:16];
                  if (v52)
                  {
                    uint64_t v53 = v52;
                    uint64_t v54 = *(void *)v70;
                    do
                    {
                      for (uint64_t m = 0; m != v53; ++m)
                      {
                        if (*(void *)v70 != v54) {
                          objc_enumerationMutation(v51);
                        }
                        objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * m), "buffer"), 1);
                      }
                      uint64_t v53 = [v51 countByEnumeratingWithState:&v69 objects:v93 count:16];
                    }
                    while (v53);
                  }
                  uint64_t v40 = [v33 indexBuffer];
                  uint64_t v25 = v34;
                  uint64_t v31 = v67;
                  goto LABEL_57;
                }
                long long v83 = 0uLL;
                long long v84 = 0uLL;
                long long v81 = 0uLL;
                long long v82 = 0uLL;
                int v35 = (void *)[v33 vertexBuffers];
                uint64_t v36 = [v35 countByEnumeratingWithState:&v81 objects:v96 count:16];
                if (v36)
                {
                  uint64_t v37 = v36;
                  uint64_t v38 = *(void *)v82;
                  do
                  {
                    for (uint64_t n = 0; n != v37; ++n)
                    {
                      if (*(void *)v82 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * n), "buffer"), 1);
                    }
                    uint64_t v37 = [v35 countByEnumeratingWithState:&v81 objects:v96 count:16];
                  }
                  while (v37);
                }
                if ([v33 indexBuffer]) {
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(v33, "indexBuffer"), 1);
                }
                uint64_t v25 = v34;
                uint64_t v31 = v67;
                if ([v33 transformationMatrixBuffer])
                {
                  uint64_t v40 = [v33 transformationMatrixBuffer];
LABEL_57:
                  [a3 useResource:v40 usage:1];
                  continue;
                }
              }
            }
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
        }
        while (v30);
      }
    }
  }
  [a3 setBytes:&a11 length:8 atIndex:9];
  if (v21) {
    [(MTLGPUBVHBuilder *)v66 refitVertexDataWithEncoder:a3 descriptor:v60 bvhDescriptor:v65 inPlace:v64 sourceBuffer:v62 sourceBufferOffset:v63 scratchBuffer:a12 scratchBufferOffset:a13 retainedResources:v61 innerNodeCapacity:v91 leafNodeCapacity:v90];
  }
  if ((v21 & 2) != 0 && v89) {
    [(MTLGPUBVHBuilder *)v66 refitPrimitiveData:a3 inPlace:v64 bvhDescriptor:v65];
  }
  if ((v64 & 1) == 0)
  {
    BOOL v57 = (v21 & 2) == 0 && v89 != 0;
    if ((v21 & 1) == 0 || v57)
    {
      BYTE2(v58) = v57;
      BYTE1(v58) = (v21 & 1) == 0;
      LOBYTE(v58) = 0;
      -[MTLGPUBVHBuilder copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:](v66, "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:", a3, v62, v63, v59, a9, a10._impl, a11, v58);
    }
  }
}

- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13 options:(unint64_t)a14
{
}

- (void)writeSerializedMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_GET_SERIALIZED_MTL_BVH_SIZE, self->_pipelineCache.baseThreadgroupSize, 0);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v15 = vdupq_n_s64(1uLL);
  uint64_t v16 = 1;
  int64x2_t v13 = v15;
  uint64_t v14 = 1;
  [a3 dispatchThreadgroups:&v15 threadsPerThreadgroup:&v13];
}

- (void)writeSerializedMTLSWBVHRawSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_GET_SERIALIZED_MTL_BVH_RAW_SIZE, self->_pipelineCache.baseThreadgroupSize, 0);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v15 = vdupq_n_s64(1uLL);
  uint64_t v16 = 1;
  int64x2_t v13 = v15;
  uint64_t v14 = 1;
  [a3 dispatchThreadgroups:&v15 threadsPerThreadgroup:&v13];
}

- (void)writeDeserializedMTLSWBVHSizeWithEncoder:(id)a3 serializedBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  uint64_t v19 = 0;
  uint64_t p_pipelineCache = &self->_pipelineCache;
  int KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE_low = LOBYTE(self->KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE);
  *(_OWORD *)&v21[4] = 0u;
  long long v22 = 0u;
  int v20 = KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE_low;
  *(void *)char v21 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v20, &v19);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v16 = vdupq_n_s64(1uLL);
  int64x2_t v17 = v16;
  uint64_t v18 = 1;
  uint64_t v15 = v19;
  [a3 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
}

- (void)writeDeserializedMTLSWPrimitiveBVHSizesWithEncoder:(id)a3 serializedBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizesBufferOffset:(unint64_t)a7
{
  id v13 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  uint64_t v14 = (void *)[(MTLDevice *)self->_device newBufferWithLength:8 options:0];
  [v13 addObject:v14];
  [(MTLGPUBVHBuilder *)self writeDeserializedMTLSWBVHSizeWithEncoder:a3 serializedBuffer:a4 serializedBufferOffset:a5 toBuffer:v14 sizeBufferOffset:0];
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_GET_DESERIALIZED_MTL_PRIMITIVE_BVH_SIZES, self->_pipelineCache.baseThreadgroupSize, 0);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  id v16 = [(MTLGPUBVHBuilder *)self newIndirectBufferWithCapacity:1 withRetainedResources:v13 indirectBufferStride:0];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  [(MTLGPUBVHBuilder *)self dispatchIndirect64:Pipeline indirectBuffer:v16 indirectBufferOffset:0 threadCountBuffer:v14 threadCountBufferOffset:0 threadCountIndex:0 threadgroupDivisor:self->_threadgroupSize encoder:a3];
}

- (void)writeSerializationDataWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7
{
  id v13 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  uint64_t v14 = (void *)[(MTLDevice *)self->_device newBufferWithLength:8 options:0];
  [v13 addObject:v14];
  [(MTLGPUBVHBuilder *)self writeSerializedMTLSWBVHSizeWithEncoder:a3 BVHBuffer:a4 BVHBufferOffset:a5 toBuffer:v14 sizeBufferOffset:0];
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_MTL_BVH_SERIALIZATION_DATA, self->_pipelineCache.baseThreadgroupSize, 0);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:v14 offset:0 atIndex:1];
  [a3 setBuffer:a6 offset:a7 atIndex:2];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v18 = vdupq_n_s64(1uLL);
  uint64_t v19 = 1;
  int64x2_t v16 = v18;
  uint64_t v17 = 1;
  [a3 dispatchThreadgroups:&v18 threadsPerThreadgroup:&v16];
}

- (void)writeSerializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 toBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8
{
  id v14 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  [(MTLGPUBVHBuilder *)self writeSerializationDataWithEncoder:a3 BVHBuffer:a4 BVHBufferOffset:a5 toBuffer:a7 destinationBufferOffset:a8];
  uint64_t v15 = (void *)[(MTLDevice *)self->_device newBufferWithLength:8 options:0];
  int64x2_t v16 = (void *)[(MTLDevice *)self->_device newBufferWithLength:4 options:0];
  [v14 addObject:v15];
  [(MTLGPUBVHBuilder *)self writeSerializedMTLSWBVHRawSizeWithEncoder:a3 BVHBuffer:a4 BVHBufferOffset:a5 toBuffer:v15 sizeBufferOffset:0];
  unint64_t v17 = a8 + 24;
  id v26 = [(MTLGPUBVHBuilder *)self newIndirectBufferWithCapacity:1 withRetainedResources:v14 indirectBufferStride:0];
  -[MTLGPUBVHBuilder fastIndirectGPUMemcpyWithEncoder:indirectBuffer:indirectBufferOffset:srcBuffer:srcBufferOffset:dstBuffer:dstBufferOffset:lengthBuffer:lengthOffset:retainedResources:](self, "fastIndirectGPUMemcpyWithEncoder:indirectBuffer:indirectBufferOffset:srcBuffer:srcBufferOffset:dstBuffer:dstBufferOffset:lengthBuffer:lengthOffset:retainedResources:", a3, v17, v15, 0, v14);
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_SERIALIZED_MTL_BVH, self->_pipelineCache.baseThreadgroupSize, 0);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setComputePipelineState:Pipeline];
  [a3 setBuffer:v16 offset:0 atIndex:1];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v30 = vdupq_n_s64(1uLL);
  uint64_t v31 = 1;
  int64x2_t v28 = v30;
  uint64_t v29 = 1;
  [a3 dispatchThreadgroups:&v30 threadsPerThreadgroup:&v28];
  [a3 setBuffer:a7 offset:v17 atIndex:1];
  if (a6)
  {
    uint64_t v19 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_PATCH_SERIALIZED_MTL_BVH, self->_pipelineCache.baseThreadgroupSize, 0);
    id v20 = [(MTLGPUBVHBuilder *)self newInstanceBufferWithBVHs:a6 retainedResources:v14 encoder:a3];
    id v21 = [(MTLGPUBVHBuilder *)self newResourceIDsBufferWithBVHs:a6 retainedResources:v14 encoder:a3];
    useResourcesBatched(a6, 1, a3);
    int v27 = [a6 count];
    [a3 setBuffer:v20 offset:0 atIndex:2];
    [a3 setBytes:&v27 length:4 atIndex:3];
    [a3 setBuffer:v21 offset:0 atIndex:4];
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    uint64_t threadgroupSize = self->_threadgroupSize;
    long long v22 = self;
    id v23 = v26;
    [(MTLGPUBVHBuilder *)v22 dispatchIndirect:v19 indirectBuffer:v26 indirectBufferOffset:0 threadCountBuffer:v16 threadCountBufferOffset:0 threadCountIndex:0 threadgroupDivisor:threadgroupSize encoder:a3];
  }
  else
  {
    id v20 = 0;
    id v21 = 0;
    id v23 = v26;
  }
}

- (void)writeDeserializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 fromBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8 accelerationStructureMTLResourceID:(MTLResourceID)a9 accelerationStructureUniqueIdentifier:(unint64_t)a10
{
  id v16 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  unint64_t v17 = (void *)[(MTLDevice *)self->_device newBufferWithLength:8 options:0];
  int64x2_t v18 = (void *)[(MTLDevice *)self->_device newBufferWithLength:4 options:0];
  [v16 addObject:v17];
  [(MTLGPUBVHBuilder *)self writeDeserializedMTLSWBVHSizeWithEncoder:a3 serializedBuffer:a7 serializedBufferOffset:a8 toBuffer:v17 sizeBufferOffset:0];
  id v26 = [(MTLGPUBVHBuilder *)self newIndirectBufferWithCapacity:1 withRetainedResources:v16 indirectBufferStride:0];
  -[MTLGPUBVHBuilder fastIndirectGPUMemcpyWithEncoder:indirectBuffer:indirectBufferOffset:srcBuffer:srcBufferOffset:dstBuffer:dstBufferOffset:lengthBuffer:lengthOffset:retainedResources:](self, "fastIndirectGPUMemcpyWithEncoder:indirectBuffer:indirectBufferOffset:srcBuffer:srcBufferOffset:dstBuffer:dstBufferOffset:lengthBuffer:lengthOffset:retainedResources:", a3, a5, v17, 0, v16);
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_DESERIALIZED_MTL_BVH, self->_pipelineCache.baseThreadgroupSize, 0));
  [a3 setBuffer:a7 offset:a8 + 24 atIndex:0];
  [a3 setBuffer:a4 offset:a5 atIndex:1];
  [a3 setBuffer:v18 offset:0 atIndex:2];
  [a3 setBytes:&a10 length:8 atIndex:3];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v29 = vdupq_n_s64(1uLL);
  uint64_t v30 = 1;
  int64x2_t v27 = v29;
  uint64_t v28 = 1;
  [a3 dispatchThreadgroups:&v29 threadsPerThreadgroup:&v27];
  if (a6)
  {
    Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_PATCH_DESERIALIZED_MTL_BVH, self->_pipelineCache.baseThreadgroupSize, 0);
    id v20 = [(MTLGPUBVHBuilder *)self newInstanceBufferWithBVHs:a6 retainedResources:v16 encoder:a3];
    id v21 = [(MTLGPUBVHBuilder *)self newResourceIDsBufferWithBVHs:a6 retainedResources:v16 encoder:a3];
    useResourcesBatched(a6, 1, a3);
    [a3 setBuffer:v20 offset:0 atIndex:2];
    [a3 setBuffer:v21 offset:0 atIndex:3];
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    uint64_t threadgroupSize = self->_threadgroupSize;
    long long v22 = self;
    id v23 = v26;
    [(MTLGPUBVHBuilder *)v22 dispatchIndirect:Pipeline indirectBuffer:v26 indirectBufferOffset:0 threadCountBuffer:v18 threadCountBufferOffset:0 threadCountIndex:0 threadgroupDivisor:threadgroupSize encoder:a3];
  }
  else
  {
    id v20 = 0;
    id v21 = 0;
    id v23 = v26;
  }
}

- (void)writeDeserializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 fromBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8 accelerationStructureMTLResourceID:(MTLResourceID)a9 uniqueIdentifier:(unint64_t)a10
{
}

- (void)writeSerializedGeometrySizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  uint64_t v19 = 0;
  uint64_t p_pipelineCache = &self->_pipelineCache;
  int KERNEL_INDEX_GET_GEOMETRY_SIZE_low = LOBYTE(self->KERNEL_INDEX_GET_GEOMETRY_SIZE);
  *(_OWORD *)&v21[4] = 0u;
  long long v22 = 0u;
  int v20 = KERNEL_INDEX_GET_GEOMETRY_SIZE_low;
  *(void *)id v21 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v20, &v19);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v16 = vdupq_n_s64(1uLL);
  int64x2_t v17 = v16;
  uint64_t v18 = 1;
  uint64_t v15 = v19;
  [a3 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
}

- (void)writeSerializedGeometryPrimitiveCountWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 countBufferOffset:(unint64_t)a7
{
  uint64_t v19 = 0;
  uint64_t p_pipelineCache = &self->_pipelineCache;
  int KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT_low = LOBYTE(self->KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT);
  *(_OWORD *)&v21[4] = 0u;
  long long v22 = 0u;
  int v20 = KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT_low;
  *(void *)id v21 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v20, &v19);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v16 = vdupq_n_s64(1uLL);
  int64x2_t v17 = v16;
  uint64_t v18 = 1;
  uint64_t v15 = v19;
  [a3 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
}

- (void)writeSerializedGeometryWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 geometryBufferOffset:(unint64_t)a7
{
  id v13 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_PRIMITIVES, self->_pipelineCache.baseThreadgroupSize, 0);
  uint64_t v15 = (void *)[(MTLDevice *)self->_device newBufferWithLength:4 options:0];
  [v13 addObject:v15];
  [(MTLGPUBVHBuilder *)self writeSerializedGeometryPrimitiveCountWithEncoder:a3 BVHBuffer:a4 BVHBufferOffset:a5 toBuffer:v15 countBufferOffset:0];
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  id v16 = [(MTLGPUBVHBuilder *)self newIndirectBufferWithCapacity:1 withRetainedResources:v13 indirectBufferStride:0];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  [(MTLGPUBVHBuilder *)self dispatchIndirect:Pipeline indirectBuffer:v16 indirectBufferOffset:0 threadCountBuffer:v15 threadCountBufferOffset:0 threadCountIndex:0 threadgroupDivisor:self->_threadgroupSize threadgroupSize:self->_threadgroupSize encoder:a3];
}

- (void)writeGenericBVHStructureSizesWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizesBufferOffset:(unint64_t)a7
{
}

- (BOOL)writeGenericBVHStructureSizesWithEncoder:(id)a3 version:(unint64_t)a4 BVHBuffer:(id)a5 BVHBufferOffset:(unint64_t)a6 toBuffer:(id)a7 sizesBufferOffset:(unint64_t)a8
{
  unint64_t v8 = a4 - 256;
  if (a4 - 256 <= 5)
  {
    Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *off_1E521FA30[v8]), self->_pipelineCache.baseThreadgroupSize, 0);
    [a3 setBuffer:a5 offset:a6 atIndex:0];
    [a3 setBuffer:a7 offset:a8 atIndex:1];
    [a3 setComputePipelineState:Pipeline];
    if ([a3 dispatchType] == 1) {
      [a3 memoryBarrierWithScope:1];
    }
    int64x2_t v18 = vdupq_n_s64(1uLL);
    uint64_t v19 = 1;
    int64x2_t v16 = v18;
    uint64_t v17 = 1;
    [a3 dispatchThreadgroups:&v18 threadsPerThreadgroup:&v16];
  }
  return v8 < 6;
}

- (void)writeGenericBVHStructureWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 header:(id)a6 headerBufferOffset:(unint64_t)a7 innerNodes:(id)a8 innerNodeBufferOffset:(unint64_t)a9 leafNodes:(id)a10 leafNodeBufferOffset:(unint64_t)a11 primitives:(id)a12 primitiveBufferOffset:(unint64_t)a13 geometry:(id)a14 geometryOffset:(unint64_t)a15 instanceTransform:(id)a16 instanceTransformOffset:(unint64_t)a17 controlPoints:(id)a18 controlPointBufferOffset:(unint64_t)a19
{
  id v26 = [[MTLGenericBVHBuffersSPI alloc] initWithVersion:256];
  [(MTLGenericBVHBuffersSPI *)v26 setHeaderBuffer:a6];
  [(MTLGenericBVHBuffersSPI *)v26 setHeaderBufferOffset:a7];
  [(MTLGenericBVHBuffersSPI *)v26 setInnerNodeBuffer:a8];
  [(MTLGenericBVHBuffersSPI *)v26 setInnerNodeBufferOffset:a9];
  [(MTLGenericBVHBuffersSPI *)v26 setLeafNodeBuffer:a10];
  [(MTLGenericBVHBuffersSPI *)v26 setLeafNodeBufferOffset:a11];
  [(MTLGenericBVHBuffersSPI *)v26 setPrimitiveBuffer:a12];
  [(MTLGenericBVHBuffersSPI *)v26 setPrimitiveBufferOffset:a13];
  [(MTLGenericBVHBuffersSPI *)v26 setGeometryBuffer:a14];
  [(MTLGenericBVHBuffersSPI *)v26 setGeometryBufferOffset:a15];
  [(MTLGenericBVHBuffersSPI *)v26 setInstanceTransformBuffer:a16];
  [(MTLGenericBVHBuffersSPI *)v26 setInstanceTransformBufferOffset:a17];
  [(MTLGenericBVHBuffersSPI *)v26 setControlPointBuffer:a18];
  [(MTLGenericBVHBuffersSPI *)v26 setControlPointBufferOffset:a19];
  [(MTLGPUBVHBuilder *)self writeGenericBVHStructureWithEncoder:a3 BVHBuffer:a4 BVHBufferOffset:a5 into:v26];
}

- (BOOL)writeGenericBVHStructureWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 into:(id)a6
{
  uint64_t v10 = [a6 headerBuffer];
  uint64_t v48 = [a6 headerBufferOffset];
  uint64_t v46 = [a6 innerNodeBuffer];
  uint64_t v11 = [a6 innerNodeBufferOffset];
  uint64_t v42 = [a6 leafNodeBuffer];
  uint64_t v36 = [a6 leafNodeBufferOffset];
  uint64_t v43 = [a6 primitiveBuffer];
  uint64_t v37 = [a6 primitiveBufferOffset];
  uint64_t v44 = (void *)[a6 geometryBuffer];
  uint64_t v38 = [a6 geometryBufferOffset];
  id v45 = (void *)[a6 instanceTransformBuffer];
  uint64_t v39 = [a6 instanceTransformBufferOffset];
  uint64_t v12 = [a6 perPrimitiveDataBuffer];
  uint64_t v13 = [a6 perPrimitiveDataBufferOffset];
  uint64_t v40 = (void *)v12;
  unint64_t v41 = (void *)[a6 controlPointBuffer];
  uint64_t v34 = v13;
  uint64_t v35 = [a6 controlPointBufferOffset];
  switch([a6 version])
  {
    case 256:
      uint64_t p_pipelineCache = &self->_pipelineCache;
      Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_0, self->_pipelineCache.baseThreadgroupSize, 0);
      uint64_t v33 = 28;
      uint64_t v32 = 24;
      uint64_t v31 = 20;
      uint64_t v30 = 16;
      uint64_t v29 = 12;
      int64x2_t v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_0;
      goto LABEL_9;
    case 257:
    case 258:
      uint64_t p_pipelineCache = &self->_pipelineCache;
      Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_1, self->_pipelineCache.baseThreadgroupSize, 0);
      uint64_t v33 = 32;
      uint64_t v32 = 28;
      uint64_t v31 = 24;
      uint64_t v30 = 20;
      uint64_t v29 = 16;
      int64x2_t v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_1;
      goto LABEL_9;
    case 259:
      uint64_t p_pipelineCache = &self->_pipelineCache;
      uint64_t v18 = 544;
      goto LABEL_8;
    case 260:
      uint64_t p_pipelineCache = &self->_pipelineCache;
      uint64_t v18 = 712;
      goto LABEL_8;
    case 261:
      uint64_t p_pipelineCache = &self->_pipelineCache;
      uint64_t v18 = 716;
LABEL_8:
      Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + v18), p_pipelineCache->baseThreadgroupSize, 0);
      uint64_t v33 = 32;
      uint64_t v32 = 28;
      uint64_t v31 = 24;
      uint64_t v30 = 20;
      uint64_t v29 = 16;
      int64x2_t v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_3;
LABEL_9:
      uint64_t v19 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v16), p_pipelineCache->baseThreadgroupSize, 0);
      [a3 setBuffer:a4 offset:a5 atIndex:0];
      [a3 setBuffer:v10 offset:v48 atIndex:1];
      [a3 setComputePipelineState:Pipeline];
      if ([a3 dispatchType] == 1) {
        [a3 memoryBarrierWithScope:1];
      }
      int64x2_t v59 = vdupq_n_s64(1uLL);
      uint64_t v60 = 1;
      int64x2_t v57 = v59;
      uint64_t v58 = 1;
      [a3 dispatchThreadgroups:&v59 threadsPerThreadgroup:&v57];
      int v20 = (void *)[(MTLDevice *)self->_device newBufferWithLength:12 options:0];
      if (v46)
      {
        id v21 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_INNER_NODES, self->_pipelineCache.baseThreadgroupSize, 0);
        [a3 setBuffer:a4 offset:a5 atIndex:0];
        [a3 setBuffer:v46 offset:v11 atIndex:1];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        [(MTLGPUBVHBuilder *)self dispatchIndirect:v21 indirectBuffer:v20 indirectBufferOffset:0 threadCountBuffer:v10 threadCountBufferOffset:v29 + v48 threadCountIndex:0 threadgroupDivisor:self->_threadgroupSize threadgroupSize:self->_threadgroupSize encoder:a3];
      }
      if (v42)
      {
        [a3 setBuffer:a4 offset:a5 atIndex:0];
        [a3 setBuffer:v42 offset:v36 atIndex:1];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        [(MTLGPUBVHBuilder *)self dispatchIndirect:v19 indirectBuffer:v20 indirectBufferOffset:0 threadCountBuffer:v10 threadCountBufferOffset:v30 + v48 threadCountIndex:0 threadgroupDivisor:self->_threadgroupSize threadgroupSize:self->_threadgroupSize encoder:a3];
      }
      if (v43)
      {
        long long v22 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_PRIMITIVE_NODES, self->_pipelineCache.baseThreadgroupSize, 0);
        [a3 setBuffer:a4 offset:a5 atIndex:0];
        [a3 setBuffer:v43 offset:v37 atIndex:1];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        [(MTLGPUBVHBuilder *)self dispatchIndirect:v22 indirectBuffer:v20 indirectBufferOffset:0 threadCountBuffer:v10 threadCountBufferOffset:v31 + v48 threadCountIndex:0 threadgroupDivisor:self->_threadgroupSize threadgroupSize:self->_threadgroupSize encoder:a3];
      }
      if ([v44 length])
      {
        if ((unint64_t)[a6 version] < 0x103)
        {
          unint64_t v25 = [a6 version];
          unint64_t baseThreadgroupSize = self->_pipelineCache.baseThreadgroupSize;
          if (v25 < 0x102) {
            uint64_t v26 = 568;
          }
          else {
            uint64_t v26 = 660;
          }
          unsigned int KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2 = *(_DWORD *)((char *)&self->super.super.isa + v26);
        }
        else
        {
          unsigned int KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2 = self->KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2;
          unint64_t baseThreadgroupSize = self->_pipelineCache.baseThreadgroupSize;
        }
        int64x2_t v27 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2, baseThreadgroupSize, 0);
        [a3 setBuffer:a4 offset:a5 atIndex:0];
        [a3 setBuffer:v44 offset:v38 atIndex:1];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        [(MTLGPUBVHBuilder *)self dispatchIndirect:v27 indirectBuffer:v20 indirectBufferOffset:0 threadCountBuffer:v10 threadCountBufferOffset:v32 + v48 threadCountIndex:0 threadgroupDivisor:self->_threadgroupSize encoder:a3];
      }
      if ([v45 length])
      {
        uint64_t v28 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_TRANSFORMS, self->_pipelineCache.baseThreadgroupSize, 0);
        [a3 setBuffer:a4 offset:a5 atIndex:0];
        [a3 setBuffer:v45 offset:v39 atIndex:1];
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        [(MTLGPUBVHBuilder *)self dispatchIndirect:v28 indirectBuffer:v20 indirectBufferOffset:0 threadCountBuffer:v10 threadCountBufferOffset:v33 + v48 threadCountIndex:0 threadgroupDivisor:self->_threadgroupSize encoder:a3];
      }
      if ([v40 length])
      {
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_PRIMITIVE_DATA, self->_pipelineCache.baseThreadgroupSize, 0));
        [a3 setBuffer:a4 offset:a5 atIndex:0];
        [a3 setBuffer:v40 offset:v34 atIndex:1];
        int64x2_t v54 = vdupq_n_s64(1uLL);
        int64x2_t v55 = v54;
        uint64_t v56 = 1;
        uint64_t threadgroupSize = self->_threadgroupSize;
        [a3 dispatchThreadgroups:&v55 threadsPerThreadgroup:&threadgroupSize];
      }
      if ([v41 length])
      {
        if ([a3 dispatchType] == 1) {
          [a3 memoryBarrierWithScope:1];
        }
        objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_CONTROL_POINT_DATA, self->_pipelineCache.baseThreadgroupSize, 0));
        [a3 setBuffer:a4 offset:a5 atIndex:0];
        [a3 setBuffer:v41 offset:v35 atIndex:1];
        int64x2_t v50 = vdupq_n_s64(1uLL);
        int64x2_t v51 = v50;
        uint64_t v52 = 1;
        uint64_t v49 = self->_threadgroupSize;
        [a3 dispatchThreadgroups:&v51 threadsPerThreadgroup:&v49];
      }

      BOOL result = 1;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)writeAccelerationStructureSerializationDataWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7
{
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_SERIALIZATION_DATA, self->_pipelineCache.baseThreadgroupSize, 0);
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  [a3 setComputePipelineState:Pipeline];
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  int64x2_t v15 = vdupq_n_s64(1uLL);
  uint64_t v16 = 1;
  int64x2_t v13 = v15;
  uint64_t v14 = 1;
  [a3 dispatchThreadgroups:&v15 threadsPerThreadgroup:&v13];
}

+ (unint64_t)getMaxAccelerationStructureTraversalDepth:(unint64_t)a3
{
  return 32 * a3;
}

- (void)writeMTLSWBVHAccelerationStructureDepthWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  if ([a3 dispatchType] == 1) {
    [a3 memoryBarrierWithScope:1];
  }
  [a3 setBuffer:a4 offset:a5 atIndex:0];
  [a3 setBuffer:a6 offset:a7 atIndex:1];
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_GET_MTL_BVH_DEPTH, self->_pipelineCache.baseThreadgroupSize, 0));
  int64x2_t v15 = vdupq_n_s64(1uLL);
  uint64_t v16 = 1;
  int64x2_t v13 = v15;
  uint64_t v14 = 1;
  [a3 dispatchThreadgroups:&v15 threadsPerThreadgroup:&v13];
}

- (void).cxx_destruct
{
  uint64_t p_pipelineCache = &self->_pipelineCache;
  std::__hash_table<std::__hash_value_type<PipelineCache<PipelineKey>::HashKey,PipelineValue>,std::__unordered_map_hasher<PipelineCache<PipelineKey>::HashKey,std::__hash_value_type<PipelineCache<PipelineKey>::HashKey,PipelineValue>,PipelineCache<PipelineKey>::Hasher,std::equal_to<PipelineCache<PipelineKey>::HashKey>,true>,std::__unordered_map_equal<PipelineCache<PipelineKey>::HashKey,std::__hash_value_type<PipelineCache<PipelineKey>::HashKey,PipelineValue>,std::equal_to<PipelineCache<PipelineKey>::HashKey>,PipelineCache<PipelineKey>::Hasher,true>,std::allocator<std::__hash_value_type<PipelineCache<PipelineKey>::HashKey,PipelineValue>>>::clear((uint64_t)&self->_pipelineCache);
  std::__function::__value_func<objc_object  {objcproto23MTLComputePipelineState}* ()(PipelineKey const&)>::~__value_func[abi:ne180100](p_pipelineCache->createPipeline.__f_.__buf_.__lx);

  std::__hash_table<std::__hash_value_type<PipelineCache<PipelineKey>::HashKey,PipelineValue>,std::__unordered_map_hasher<PipelineCache<PipelineKey>::HashKey,std::__hash_value_type<PipelineCache<PipelineKey>::HashKey,PipelineValue>,PipelineCache<PipelineKey>::Hasher,std::equal_to<PipelineCache<PipelineKey>::HashKey>,true>,std::__unordered_map_equal<PipelineCache<PipelineKey>::HashKey,std::__hash_value_type<PipelineCache<PipelineKey>::HashKey,PipelineValue>,std::equal_to<PipelineCache<PipelineKey>::HashKey>,PipelineCache<PipelineKey>::Hasher,true>,std::allocator<std::__hash_value_type<PipelineCache<PipelineKey>::HashKey,PipelineValue>>>::~__hash_table((uint64_t)p_pipelineCache);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((void *)self + 17) = 0;
  *(_DWORD *)((char *)self + 143) = 0;
  return self;
}

- (void)initWithDevice:
{
}

- (uint64_t)initWithDevice:
{
    return a1 + 8;
  else {
    return 0;
  }
}

@end