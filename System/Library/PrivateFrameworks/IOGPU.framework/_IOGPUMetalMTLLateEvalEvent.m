@interface _IOGPUMetalMTLLateEvalEvent
- (MTLDevice)device;
- (NSString)label;
- (_IOGPUMetalMTLLateEvalEvent)initWithDevice:(id)a3;
- (id)newSharedEventHandle;
- (id)retainedLabel;
- (void)dealloc;
- (void)setLabel:(id)a3;
@end

@implementation _IOGPUMetalMTLLateEvalEvent

- (_IOGPUMetalMTLLateEvalEvent)initWithDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_IOGPUMetalMTLLateEvalEvent;
  v4 = -[IOGPUMTLLateEvalEvent initWithDevice:](&v6, sel_initWithDevice_, [a3 deviceRef]);
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    v4->_labelLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_IOGPUMetalMTLLateEvalEvent;
  [(IOGPUMTLLateEvalEvent *)&v3 dealloc];
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
  id v2 = [(_IOGPUMetalMTLLateEvalEvent *)self retainedLabel];
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
  v7 = (NSString *)[a3 copy];
  os_unfair_lock_lock(&self->_labelLock);
  label = self->_label;
  self->_label = v7;
  os_unfair_lock_unlock(&self->_labelLock);
}

- (id)newSharedEventHandle
{
  return 0;
}

- (MTLDevice)device
{
  return self->_device;
}

@end