@interface MTLAccelerationStructureDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstanceDescriptor;
- (MTLAccelerationStructureUsage)usage;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setUsage:(MTLAccelerationStructureUsage)usage;
@end

@implementation MTLAccelerationStructureDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setUsage:self->_usage];
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
  MTLAccelerationStructureUsage v7 = [(MTLAccelerationStructureDescriptor *)self usage];
  return v7 == [a3 usage];
}

- (unint64_t)hash
{
  MTLAccelerationStructureUsage v3 = [(MTLAccelerationStructureDescriptor *)self usage];
  return _MTLHashState((int *)&v3, 8uLL);
}

- (BOOL)isInstanceDescriptor
{
  return 0;
}

- (MTLAccelerationStructureUsage)usage
{
  return self->_usage;
}

- (void)setUsage:(MTLAccelerationStructureUsage)usage
{
  self->_usage = usage;
}

@end