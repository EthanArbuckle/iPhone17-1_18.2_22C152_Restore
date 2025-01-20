@interface MTLHeapDescriptorInternal
- (BOOL)isEqual:(id)a3;
- (BOOL)sparsePageAccessCountersEnabled;
- (BOOL)validateWithDevice:(id)a3;
- (MTLHeapDescriptorInternal)init;
- (const)descriptorPrivate;
- (id)addressRanges;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (int64_t)sparsePageSize;
- (int64_t)type;
- (unint64_t)cpuCacheMode;
- (unint64_t)hash;
- (unint64_t)hazardTrackingMode;
- (unint64_t)memoryPoolId;
- (unint64_t)pinnedGPUAddress;
- (unint64_t)protectionOptions;
- (unint64_t)resourceOptions;
- (unint64_t)size;
- (unint64_t)storageMode;
- (void)dealloc;
- (void)setAddressRanges:(id)a3;
- (void)setCpuCacheMode:(unint64_t)a3;
- (void)setHazardTrackingMode:(unint64_t)a3;
- (void)setMemoryPoolId:(unint64_t)a3;
- (void)setPinnedGPUAddress:(unint64_t)a3;
- (void)setProtectionOptions:(unint64_t)a3;
- (void)setResourceOptions:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)setSparsePageAccessCountersEnabled:(BOOL)a3;
- (void)setSparsePageSize:(int64_t)a3;
- (void)setStorageMode:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MTLHeapDescriptorInternal

- (BOOL)validateWithDevice:(id)a3
{
  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  _MTLMessageContextBegin_((uint64_t)v24, (uint64_t)"-[MTLHeapDescriptorInternal validateWithDevice:]", 364, (uint64_t)a3, 2, (uint64_t)"Heap Descriptor Validation");
  int v10 = [a3 supportsSharedStorageHeapResources];
  int v11 = 0;
  int64_t var5 = self->_private->var5;
  if (!var5) {
    goto LABEL_7;
  }
  if (var5 == 2)
  {
    int v11 = 1;
    if (([a3 supportsSparseHeaps] & 1) == 0)
    {
      v13 = @"Sparse heaps are not supported.";
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (var5 != 1)
  {
    v13 = @"Unknown heap type.";
    goto LABEL_10;
  }
  int v11 = 0;
  if ([a3 isPlacementHeapSupported])
  {
LABEL_7:
    char v14 = 1;
    goto LABEL_11;
  }
  v13 = @"Placement heap type is not supported.";
LABEL_10:
  _MTLMessageContextPush_((uint64_t)v24, 4, (uint64_t)v13, v5, v6, v7, v8, v9, (uint64_t)v23);
  char v14 = 0;
LABEL_11:
  v15 = self->_private;
  unint64_t var2 = v15->var2;
  if (var2 >= 2)
  {
    _MTLMessageContextPush_((uint64_t)v24, 4, @"Invalid cpuCacheMode (%@)", v5, v6, v7, v8, v9, @"Invalid");
    v15 = self->_private;
  }
  unint64_t var1 = v15->var1;
  if (var1 == 2) {
    goto LABEL_19;
  }
  if (!var1)
  {
    if ((v11 | v10 ^ 1) == 1)
    {
      if (v11) {
        v18 = @"Sparse heap cannot have shared storage mode";
      }
      else {
        v18 = @"Shared storage mode disallowed";
      }
      goto LABEL_21;
    }
LABEL_19:
    char v19 = 1;
    goto LABEL_22;
  }
  v23 = @"Invalid";
  v18 = @"Invalid storageMode (%@)";
LABEL_21:
  _MTLMessageContextPush_((uint64_t)v24, 4, (uint64_t)v18, v5, v6, v7, v8, v9, (uint64_t)v23);
  char v19 = 0;
LABEL_22:
  char v20 = v14 & v19;
  if (*(void *)&v24[0]) {
    char v20 = 0;
  }
  if (var2 < 2) {
    BOOL v21 = v20;
  }
  else {
    BOOL v21 = 0;
  }
  _MTLMessageContextEnd((uint64_t)v24);
  return v21;
}

- (int64_t)type
{
  return self->_private->var5;
}

- (unint64_t)resourceOptions
{
  return self->_private->var6;
}

- (unint64_t)hazardTrackingMode
{
  return (self->_private->var6 >> 8) & 3;
}

- (const)descriptorPrivate
{
  return self->_private;
}

- (id)addressRanges
{
  return self->_addressRanges;
}

- (unint64_t)size
{
  return self->_private->var0;
}

- (unint64_t)protectionOptions
{
  return self->_private->var8;
}

- (unint64_t)pinnedGPUAddress
{
  return self->_private->var7;
}

- (unint64_t)memoryPoolId
{
  return self->_private->var9;
}

- (void)setSize:(unint64_t)a3
{
  self->_private->var0 = a3;
}

- (void)setProtectionOptions:(unint64_t)a3
{
  self->_private->var8 = a3;
}

- (void)setStorageMode:(unint64_t)a3
{
  v3 = self->_private;
  v3->unint64_t var1 = a3;
  v3->var6 = v3->var6 & 0xFFFFFFFFFFFFFF0FLL | (16 * a3);
}

- (void)setResourceOptions:(unint64_t)a3
{
  v3 = self->_private;
  v3->var6 = a3;
  v3->unint64_t var1 = a3 >> 4;
  v3->unint64_t var2 = a3 & 0xF;
}

- (void)setCpuCacheMode:(unint64_t)a3
{
  v3 = self->_private;
  v3->unint64_t var2 = a3;
  v3->var6 = v3->var6 & 0xFFFFFFFFFFFFFFF0 | a3;
}

- (void)dealloc
{
  free(self->_private);

  self->_addressRanges = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLHeapDescriptorInternal;
  [(MTLHeapDescriptorInternal *)&v3 dealloc];
}

- (void)setHazardTrackingMode:(unint64_t)a3
{
  self->_private->var6 = self->_private->var6 & 0xFFFFFFFFFFFFFCFFLL | (a3 << 8);
}

- (MTLHeapDescriptorInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLHeapDescriptorInternal;
  v2 = [(MTLHeapDescriptorInternal *)&v5 init];
  if (v2)
  {
    objc_super v3 = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x1000040E69F3CC4uLL);
    v2->_private = (MTLHeapDescriptorPrivate *)v3;
    if (v3)
    {
      *(_OWORD *)objc_super v3 = xmmword_1828E1E10;
      *((_OWORD *)v3 + 1) = xmmword_1828F0F40;
      v3[32] = 1;
      *(_OWORD *)(v3 + 40) = xmmword_1828F0F50;
      *((void *)v3 + 8) = 0;
      *((void *)v3 + 9) = 0;
      *((void *)v3 + 7) = 0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3)
      || ([(MTLHeapDescriptorInternal *)self addressRanges] != 0) == (*((void *)a3 + 3) == 0))
    {
      LOBYTE(v6) = 0;
    }
    else if (![(MTLHeapDescriptorInternal *)self addressRanges] {
           || (int v6 = objc_msgSend(-[MTLHeapDescriptorInternal addressRanges](self, "addressRanges"), "isEqual:", *((void *)a3 + 3))) != 0)
    }
    {
      LOBYTE(v6) = memcmp(self->_private, *((const void **)a3 + 2), 0x50uLL) == 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  unsigned int v3 = _MTLHashState((int *)self->_private, 0x50uLL);
  return [(MTLResourceAddressRangeArray *)self->_addressRanges hash] + v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = (void *)v4;
  if (v4)
  {
    int v6 = *(_OWORD **)(v4 + 16);
    uint64_t v7 = self->_private;
    *int v6 = *(_OWORD *)&v7->var0;
    long long v8 = *(_OWORD *)&v7->var8;
    long long v10 = *(_OWORD *)&v7->var2;
    long long v9 = *(_OWORD *)&v7->var4;
    v6[3] = *(_OWORD *)&v7->var6;
    v6[4] = v8;
    v6[1] = v10;
    v6[2] = v9;
    *(void *)(v4 + 24) = [(MTLResourceAddressRangeArray *)self->_addressRanges copy];
  }
  return v5;
}

- (unint64_t)cpuCacheMode
{
  return self->_private->var2;
}

- (unint64_t)storageMode
{
  return self->_private->var1;
}

- (int64_t)sparsePageSize
{
  return self->_private->var3;
}

- (void)setSparsePageSize:(int64_t)a3
{
  self->_private->var3 = a3;
}

- (BOOL)sparsePageAccessCountersEnabled
{
  return self->_private->var4;
}

- (void)setSparsePageAccessCountersEnabled:(BOOL)a3
{
  self->_private->var4 = a3;
}

- (void)setType:(int64_t)a3
{
  self->_private->int64_t var5 = a3;
}

- (id)description
{
  return [(MTLHeapDescriptorInternal *)self formattedDescription:0];
}

- (id)formattedDescription:(unint64_t)a3
{
  v20[21] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  unint64_t var6 = self->_private->var6;
  uint64_t v7 = @"MTLStorageModePrivate";
  if (var6 >> 4 != 2) {
    uint64_t v7 = @"Invalid";
  }
  long long v8 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)MTLHeapDescriptorInternal;
  if (var6 >> 4) {
    long long v9 = v7;
  }
  else {
    long long v9 = @"MTLStorageModeShared";
  }
  id v10 = [(MTLHeapDescriptorInternal *)&v19 description];
  v20[0] = v5;
  v20[1] = @"size =";
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:self->_private->var0];
  v12 = @"MTLCPUCacheModeDefaultCache";
  v20[2] = v11;
  v20[3] = v5;
  if ((var6 & 0xF) != 0) {
    v12 = @"Invalid";
  }
  if ((var6 & 0xF) == 1) {
    v12 = @"MTLCPUCacheModeWriteCombined";
  }
  v20[4] = @"cpuCacheMode =";
  v20[5] = v12;
  v20[6] = v5;
  v20[7] = @"storageMode =";
  v20[8] = v9;
  v20[9] = v5;
  v20[10] = @"hazardTrackingMode =";
  v20[11] = MTLHazardTrackingModeString((var6 >> 8) & 3);
  v20[12] = v5;
  v20[13] = @"resourceOptions =";
  v20[14] = MTLResourceOptionsString(var6);
  v20[15] = v5;
  v20[16] = @"type =";
  int64_t var5 = self->_private->var5;
  char v14 = @"MTLHeapTypePlacement";
  if (var5 != 1) {
    char v14 = @"Invalid";
  }
  if (var5) {
    v15 = v14;
  }
  else {
    v15 = @"MTLHeapTypeAutomatic";
  }
  v20[17] = v15;
  v20[18] = v5;
  v20[19] = @"addressRanges =";
  addressRanges = self->_addressRanges;
  if (addressRanges) {
    v17 = [(MTLResourceAddressRangeArray *)addressRanges formattedDescription:v4];
  }
  else {
    v17 = @"nil";
  }
  v20[20] = v17;
  return (id)[v8 stringWithFormat:@"%@%@", v10, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 21), "componentsJoinedByString:", @" "];
}

- (void)setPinnedGPUAddress:(unint64_t)a3
{
  self->_private->var7 = a3;
}

- (void)setMemoryPoolId:(unint64_t)a3
{
  self->_private->var9 = a3;
}

- (void)setAddressRanges:(id)a3
{
  addressRanges = self->_addressRanges;
  if (addressRanges != a3)
  {

    self->_addressRanges = (MTLResourceAddressRangeArray *)a3;
  }
}

@end