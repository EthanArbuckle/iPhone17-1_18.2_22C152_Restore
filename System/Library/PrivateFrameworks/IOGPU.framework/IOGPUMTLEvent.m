@interface IOGPUMTLEvent
- (BOOL)enableBarrier;
- (BOOL)supportsRollback;
- (IOGPUMTLEvent)initWithDeviceRef:(__IOGPUDevice *)a3;
- (IOGPUMTLEvent)initWithDeviceRef:(__IOGPUDevice *)a3 options:(unint64_t)a4;
- (unsigned)_encodeIOGPUKernelConditionalEventAbortCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3;
- (unsigned)_encodeIOGPUKernelSignalEventAgentCommandArgs:(IOGPUKernelCommandSignalEventAgentArgs *)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5;
- (unsigned)_encodeIOGPUKernelSignalEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4;
- (unsigned)_encodeIOGPUKernelSignalEventScheduledCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3;
- (unsigned)_encodeIOGPUKernelWaitEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5;
- (void)dealloc;
- (void)setEnableBarrier:(BOOL)a3;
@end

@implementation IOGPUMTLEvent

- (IOGPUMTLEvent)initWithDeviceRef:(__IOGPUDevice *)a3
{
  return [(IOGPUMTLEvent *)self initWithDeviceRef:a3 options:0];
}

- (IOGPUMTLEvent)initWithDeviceRef:(__IOGPUDevice *)a3 options:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)IOGPUMTLEvent;
  v6 = [(IOGPUMTLEvent *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_deviceRef = a3;
    CFRetain(a3);
    uint64_t input = a4;
    uint64_t outputStruct = 0;
    long long v11 = 0uLL;
    size_t v9 = 24;
    if (IOConnectCallMethod(v7->_deviceRef->var2, 0x14u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9))
    {

      return 0;
    }
    else
    {
      v7->_eventName = outputStruct;
      *(_OWORD *)&v7->_globalTraceObjectID = v11;
      v7->_enableBarrier = 1;
    }
  }
  return v7;
}

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    if (self->_eventName)
    {
      uint64_t input = self->_eventName;
      IOConnectCallMethod(deviceRef->var2, 0x15u, &input, 1u, 0, 0, 0, 0, 0, 0);
      deviceRef = self->_deviceRef;
    }
    CFRelease(deviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMTLEvent;
  [(IOGPUMTLEvent *)&v4 dealloc];
}

- (unsigned)_encodeIOGPUKernelSignalEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4
{
  a3->var0 = self->_eventName;
  a3->var2 = a4;
  return 5;
}

- (unsigned)_encodeIOGPUKernelWaitEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  unsigned int eventName = self->_eventName;
  a3->var2 = a4;
  a3->var0 = eventName;
  a3->var1 = a5;
  if (self->_enableBarrier) {
    return 6;
  }
  else {
    return 10;
  }
}

- (unsigned)_encodeIOGPUKernelSignalEventAgentCommandArgs:(IOGPUKernelCommandSignalEventAgentArgs *)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
}

- (unsigned)_encodeIOGPUKernelConditionalEventAbortCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3
{
}

- (unsigned)_encodeIOGPUKernelSignalEventScheduledCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3
{
}

- (BOOL)supportsRollback
{
  return self->_eventOptions & 1;
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