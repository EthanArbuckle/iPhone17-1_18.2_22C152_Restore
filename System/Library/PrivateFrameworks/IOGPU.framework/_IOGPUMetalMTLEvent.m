@interface _IOGPUMetalMTLEvent
- (MTLDevice)device;
- (NSString)label;
- (_IOGPUMetalMTLEvent)initWithDevice:(id)a3;
- (_IOGPUMetalMTLEvent)initWithDevice:(id)a3 options:(unint64_t)a4;
- (id)retainedLabel;
- (void)dealloc;
- (void)setLabel:(id)a3;
@end

@implementation _IOGPUMetalMTLEvent

- (_IOGPUMetalMTLEvent)initWithDevice:(id)a3
{
  return [(_IOGPUMetalMTLEvent *)self initWithDevice:a3 options:0];
}

- (_IOGPUMetalMTLEvent)initWithDevice:(id)a3 options:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_IOGPUMetalMTLEvent;
  v5 = -[IOGPUMTLEvent initWithDeviceRef:options:](&v7, sel_initWithDeviceRef_options_, [a3 deviceRef], a4);
  if (v5)
  {
    v5->_device = (MTLDevice *)a3;
    v5->_labelLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_IOGPUMetalMTLEvent;
  [(IOGPUMTLEvent *)&v3 dealloc];
}

- (id)retainedLabel
{
  p_labelLock = &self->_labelLock;
  os_unfair_lock_lock(&self->_labelLock);
  v4 = self->_label;
  os_unfair_lock_unlock(p_labelLock);
  return v4;
}

- (NSString)label
{
  id v2 = [(_IOGPUMetalMTLEvent *)self retainedLabel];
  return (NSString *)v2;
}

- (void)setLabel:(id)a3
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    unint64_t globalTraceObjectID = self->super._globalTraceObjectID;
    unint64_t labelTraceID = self->_labelTraceID;
    [a3 cStringUsingEncoding:1];
    self->_unint64_t labelTraceID = IOGPUDeviceTraceObjectLabel(0, 8, 0, globalTraceObjectID, labelTraceID);
  }
  objc_super v7 = (NSString *)[a3 copy];
  os_unfair_lock_lock(&self->_labelLock);
  label = self->_label;
  self->_label = v7;
  os_unfair_lock_unlock(&self->_labelLock);
}

- (MTLDevice)device
{
  return self->_device;
}

@end