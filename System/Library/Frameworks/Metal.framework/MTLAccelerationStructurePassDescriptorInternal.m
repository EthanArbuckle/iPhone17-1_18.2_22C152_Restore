@interface MTLAccelerationStructurePassDescriptorInternal
- (BOOL)enableSubstreams;
- (MTLAccelerationStructurePassDescriptorInternal)init;
- (void)setEnableSubstreams:(BOOL)a3;
@end

@implementation MTLAccelerationStructurePassDescriptorInternal

- (MTLAccelerationStructurePassDescriptorInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLAccelerationStructurePassDescriptorInternal;
  v2 = [(MTLAccelerationStructurePassDescriptor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTLAccelerationStructurePassDescriptorInternal *)v2 setEnableSubstreams:1];
  }
  return v3;
}

- (BOOL)enableSubstreams
{
  return self->_enableSubstreams;
}

- (void)setEnableSubstreams:(BOOL)a3
{
  self->_enableSubstreams = a3;
}

@end