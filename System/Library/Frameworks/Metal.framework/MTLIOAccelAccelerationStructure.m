@interface MTLIOAccelAccelerationStructure
- (MTLAccelerationStructureDescriptor)descriptor;
- (MTLBuffer)buffer;
- (MTLIOAccelAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4;
- (MTLIOAccelAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (unint64_t)bufferOffset;
- (unint64_t)gpuHandle;
- (unint64_t)resourceIndex;
- (unint64_t)size;
- (void)copyPropertiesFromBuffer:(id)a3;
- (void)dealloc;
- (void)setDescriptor:(id)a3;
@end

@implementation MTLIOAccelAccelerationStructure

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)bufferOffset
{
  return self->_bufferOffset;
}

- (unint64_t)size
{
  return [(MTLBuffer *)self->_buffer length];
}

- (void)copyPropertiesFromBuffer:(id)a3
{
  v4 = (char *)a3 + 32;
  id v5 = *((id *)a3 + 30);
  uint64_t v6 = *((void *)v4 + 27);
  *(void *)&self->super._anon_50[160] = v5;
  *(void *)&self->super._anon_50[168] = v6;
  *(_OWORD *)&self->super._anon_50[176] = *((_OWORD *)v4 + 14);
  self->super._anon_50[192] = v4[240];
  *(void *)&self->super._anon_50[24] = *((void *)v4 + 9);
  *(void *)&self->super._anon_50[88] = *((void *)v4 + 17);
}

- (MTLIOAccelAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelAccelerationStructure;
  uint64_t v6 = -[MTLIOAccelResource initWithResource:](&v8, sel_initWithResource_);
  if (v6)
  {
    v6->_buffer = (MTLBuffer *)a3;
    v6->_bufferOffset = a4;
    [(MTLIOAccelAccelerationStructure *)v6 copyPropertiesFromBuffer:a3];
  }
  return v6;
}

- (MTLIOAccelAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLIOAccelAccelerationStructure;
  objc_super v8 = -[MTLIOAccelResource initWithResource:](&v10, sel_initWithResource_);
  if (v8)
  {
    v8->_buffer = (MTLBuffer *)a3;
    v8->_bufferOffset = a4;
    v8->_resourceIndex = a5;
    [(MTLIOAccelAccelerationStructure *)v8 copyPropertiesFromBuffer:a3];
  }
  return v8;
}

- (void)dealloc
{
  *(void *)&self->super._anon_50[160] = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelAccelerationStructure;
  [(MTLIOAccelResource *)&v3 dealloc];
}

- (unint64_t)gpuHandle
{
  if ([(MTLDevice *)[(MTLIOAccelResource *)self device] requiresRaytracingEmulation])
  {
    objc_super v3 = [(MTLIOAccelAccelerationStructure *)self buffer];
    return [(MTLBuffer *)v3 gpuAddress];
  }
  else
  {
    return [(MTLIOAccelAccelerationStructure *)self resourceIndex];
  }
}

- (MTLAccelerationStructureDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

@end