@interface _MTLHeap
- (BOOL)detachBacking;
- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4;
- (_MTLHeap)init;
- (_MTLHeap)initWithType:(int64_t)a3 options:(unint64_t)a4;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (int64_t)type;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuAddress;
- (unint64_t)hazardTrackingMode;
- (unint64_t)memoryPoolId;
- (unint64_t)resourceOptions;
- (unint64_t)storageMode;
- (unint64_t)unfilteredResourceOptions;
@end

@implementation _MTLHeap

- (unint64_t)resourceOptions
{
  char v3 = [(_MTLHeap *)self storageMode];
  char v4 = [(_MTLHeap *)self cpuCacheMode];
  return v4 & 0xF | (unint64_t)(16 * (v3 & 0xF)) | (([(_MTLHeap *)self hazardTrackingMode] & 3) << 8);
}

- (unint64_t)storageMode
{
  return self->_heapResourceOptions >> 4;
}

- (unint64_t)hazardTrackingMode
{
  unint64_t heapResourceOptions = self->_heapResourceOptions;
  if (((heapResourceOptions >> 8) & 2) != 0) {
    return (heapResourceOptions >> 8) & 3;
  }
  else {
    return 1;
  }
}

- (unint64_t)cpuCacheMode
{
  return self->_heapResourceOptions & 0xF;
}

- (_MTLHeap)initWithType:(int64_t)a3 options:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_MTLHeap;
  result = [(_MTLAllocation *)&v7 initWithAllocationType:2];
  if (result)
  {
    result->_heapType = a3;
    result->_unint64_t heapResourceOptions = a4;
  }
  return result;
}

- (int64_t)type
{
  return self->_heapType;
}

- (_MTLHeap)init
{
  return [(_MTLHeap *)self initWithType:0 options:0];
}

- (unint64_t)unfilteredResourceOptions
{
  return self->_heapResourceOptions;
}

- (unint64_t)memoryPoolId
{
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  v18[24] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = [(_MTLObjectWithLabel *)self retainedLabel];
  v6 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)_MTLHeap;
  id v7 = [(_MTLHeap *)&v17 description];
  v18[0] = v4;
  v18[1] = @"label =";
  v8 = @"<none>";
  if (v5) {
    v8 = v5;
  }
  v18[2] = v8;
  v18[3] = v4;
  v18[4] = @"type =";
  int64_t v9 = [(_MTLHeap *)self type];
  v10 = @"MTLHeapTypePlacement";
  if (v9 != 1) {
    v10 = @"Invalid";
  }
  if (!v9) {
    v10 = @"MTLHeapTypeAutomatic";
  }
  v18[5] = v10;
  v18[6] = v4;
  v18[7] = @"size =";
  v18[8] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_MTLHeap size](self, "size"));
  v18[9] = v4;
  v18[10] = @"usedSize =";
  v18[11] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_MTLHeap usedSize](self, "usedSize"));
  v18[12] = v4;
  v18[13] = @"cpuCacheMode =";
  unint64_t v11 = [(_MTLHeap *)self cpuCacheMode];
  v12 = @"MTLCPUCacheModeDefaultCache";
  if (v11) {
    v12 = @"Invalid";
  }
  if (v11 == 1) {
    v12 = @"MTLCPUCacheModeWriteCombined";
  }
  v18[14] = v12;
  v18[15] = v4;
  v18[16] = @"storageMode =";
  unint64_t v13 = [(_MTLHeap *)self storageMode];
  v14 = @"MTLStorageModePrivate";
  if (v13 != 2) {
    v14 = @"Invalid";
  }
  if (!v13) {
    v14 = @"MTLStorageModeShared";
  }
  v18[17] = v14;
  v18[18] = v4;
  v18[19] = @"hazardTrackingMode =";
  v18[20] = MTLHazardTrackingModeString([(_MTLHeap *)self hazardTrackingMode]);
  v18[21] = v4;
  v18[22] = @"resourceOptions =";
  v18[23] = MTLResourceOptionsString([(_MTLHeap *)self resourceOptions]);
  v15 = (void *)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 24), "componentsJoinedByString:", @" "];

  return v15;
}

- (id)description
{
  return [(_MTLHeap *)self formattedDescription:0];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)detachBacking
{
  return [(_MTLHeap *)self doesNotRecognizeSelector:a2];
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  return 0;
}

- (unint64_t)gpuAddress
{
  return self->_gpuAddress;
}

@end