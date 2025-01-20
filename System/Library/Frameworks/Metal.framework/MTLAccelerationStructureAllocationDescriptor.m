@interface MTLAccelerationStructureAllocationDescriptor
- (BOOL)forceResourceIndex;
- (BOOL)isEqual:(id)a3;
- (MTLAccelerationStructureAllocationDescriptor)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)resourceIndex;
- (unint64_t)storageMode;
- (void)setForceResourceIndex:(BOOL)a3;
- (void)setResourceIndex:(unint64_t)a3;
- (void)setStorageMode:(unint64_t)a3;
@end

@implementation MTLAccelerationStructureAllocationDescriptor

- (MTLAccelerationStructureAllocationDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureAllocationDescriptor;
  result = [(MTLAccelerationStructureAllocationDescriptor *)&v3 init];
  if (result) {
    result->_storageMode = 2;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setStorageMode:self->_storageMode];
  [v4 setForceResourceIndex:self->_forceResourceIndex];
  [v4 setResourceIndex:self->_resourceIndex];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    return 0;
  }
  unint64_t v6 = [(MTLAccelerationStructureAllocationDescriptor *)self storageMode];
  if (v6 != [a3 storageMode]) {
    return 0;
  }
  int v7 = [(MTLAccelerationStructureAllocationDescriptor *)self forceResourceIndex];
  if (v7 != [a3 forceResourceIndex]) {
    return 0;
  }
  unint64_t v9 = [(MTLAccelerationStructureAllocationDescriptor *)self resourceIndex];
  return v9 == [a3 resourceIndex];
}

- (unint64_t)hash
{
  bzero(v4, 0x18uLL);
  v4[0] = [(MTLAccelerationStructureAllocationDescriptor *)self storageMode];
  v4[1] = [(MTLAccelerationStructureAllocationDescriptor *)self forceResourceIndex];
  v4[2] = [(MTLAccelerationStructureAllocationDescriptor *)self resourceIndex];
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_storageMode = a3;
}

- (BOOL)forceResourceIndex
{
  return self->_forceResourceIndex;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  self->_forceResourceIndex = a3;
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_resourceIndex = a3;
}

@end