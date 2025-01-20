@interface _MTLSharedEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsRollback;
- (MTLDevice)device;
- (NSString)label;
- (_MTLSharedEvent)initWithMachPort:(unsigned int)a3;
- (_MTLSharedEvent)initWithOptions:(int64_t)a3;
- (_MTLSharedEvent)initWithSharedEventHandle:(id)a3;
- (id)newSharedEventHandle;
- (id)retainedLabel;
- (unint64_t)labelTraceID;
- (unsigned)encodeConditionalEventAbortCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3;
- (unsigned)encodeKernelSignalEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4;
- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4;
- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5;
- (void)dealloc;
- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5;
- (void)setLabel:(id)a3;
@end

@implementation _MTLSharedEvent

- (unsigned)encodeKernelSignalEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4
{
  a3->var0 = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F2EFA0]);
  a3->var3 = a4;
  return 4;
}

- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4
{
  a3->var0 = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F2EFA0]);
  a3->var3 = a4;
  return 5;
}

- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  a3->var0 = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F2EFA0]);
  a3->var3 = a4;
  if (a5 >= 0xFFFF) {
    unsigned __int16 v5 = -1;
  }
  else {
    unsigned __int16 v5 = a5;
  }
  a3->var2 = v5;
  return 11;
}

- (unsigned)encodeConditionalEventAbortCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3
{
  a3->var0 = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F2EFA0]);
  a3->var3 = 0;
  a3->var2 = 0;
  return 13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLSharedEvent;
  [(IOSurfaceSharedEvent *)&v3 dealloc];
}

- (MTLDevice)device
{
  return 0;
}

- (BOOL)supportsRollback
{
  return 0;
}

- (_MTLSharedEvent)initWithSharedEventHandle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MTLSharedEvent;
  v4 = -[IOSurfaceSharedEvent initWithMachPort:](&v6, sel_initWithMachPort_, [a3 eventPort]);
  if (v4)
  {
    v4->_label = (NSString *)objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
    v4->_labelLock._os_unfair_lock_opaque = 0;
    v4->_labelTraceID = [a3 labelTraceID];
  }
  return v4;
}

- (_MTLSharedEvent)initWithMachPort:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MTLSharedEvent;
  result = [(IOSurfaceSharedEvent *)&v4 initWithMachPort:*(void *)&a3];
  if (result) {
    result->_labelLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (_MTLSharedEvent)initWithOptions:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MTLSharedEvent;
  result = [(IOSurfaceSharedEvent *)&v4 initWithOptions:a3];
  if (result) {
    result->_labelLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)newSharedEventHandle
{
  objc_super v3 = [MTLSharedEventHandle alloc];

  return [(MTLSharedEventHandle *)v3 initWithSharedEvent:self];
}

- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5
{
}

- (id)retainedLabel
{
  p_labelLock = &self->_labelLock;
  os_unfair_lock_lock(&self->_labelLock);
  objc_super v4 = self->_label;
  os_unfair_lock_unlock(p_labelLock);
  return v4;
}

- (NSString)label
{
  id v2 = [(_MTLSharedEvent *)self retainedLabel];

  return (NSString *)v2;
}

- (void)setLabel:(id)a3
{
  if (MTLTraceEnabledSPI() && *(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [a3 cStringUsingEncoding:1];
    self->_labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
  unsigned __int16 v5 = (NSString *)[a3 copy];
  os_unfair_lock_lock(&self->_labelLock);
  label = self->_label;
  self->_label = v5;
  os_unfair_lock_unlock(&self->_labelLock);
}

- (unint64_t)labelTraceID
{
  return self->_labelTraceID;
}

@end