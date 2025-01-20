@interface _MTLIOAccelMTLEvent
- (BOOL)enableBarrier;
- (MTLDevice)device;
- (NSString)label;
- (_MTLIOAccelMTLEvent)initWithDevice:(id)a3;
- (_MTLIOAccelMTLEvent)initWithDevice:(id)a3 options:(int64_t)a4;
- (id)retainedLabel;
- (void)dealloc;
- (void)setEnableBarrier:(BOOL)a3;
- (void)setLabel:(id)a3;
@end

@implementation _MTLIOAccelMTLEvent

- (_MTLIOAccelMTLEvent)initWithDevice:(id)a3
{
  return [(_MTLIOAccelMTLEvent *)self initWithDevice:a3 options:0];
}

- (_MTLIOAccelMTLEvent)initWithDevice:(id)a3 options:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_MTLIOAccelMTLEvent;
  v5 = -[IOAccelMTLEvent initWithShared:options:](&v7, sel_initWithShared_options_, [a3 sharedRef], a4);
  if (v5)
  {
    v5->_device = (MTLDevice *)a3;
    v5->_labelLock._os_unfair_lock_opaque = 0;
    v5->_enableBarrier = 1;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLIOAccelMTLEvent;
  [(IOAccelMTLEvent *)&v3 dealloc];
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
  id v2 = [(_MTLIOAccelMTLEvent *)self retainedLabel];

  return (NSString *)v2;
}

- (void)setLabel:(id)a3
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [a3 cStringUsingEncoding:1];
    self->_labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
  v5 = (NSString *)[a3 copy];
  os_unfair_lock_lock(&self->_labelLock);
  label = self->_label;
  self->_label = v5;
  os_unfair_lock_unlock(&self->_labelLock);
}

- (MTLDevice)device
{
  return self->_device;
}

- (BOOL)enableBarrier
{
  return self->_enableBarrier;
}

- (void)setEnableBarrier:(BOOL)a3
{
  self->_enableBarrier = a3;
}

@end