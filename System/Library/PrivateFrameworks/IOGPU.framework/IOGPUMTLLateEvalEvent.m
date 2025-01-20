@interface IOGPUMTLLateEvalEvent
- (IOGPUMTLLateEvalEvent)initWithDevice:(__IOGPUDevice *)a3;
- (unint64_t)signaledValue;
- (void)dealloc;
- (void)setSignaledValue:(unint64_t)a3;
@end

@implementation IOGPUMTLLateEvalEvent

- (IOGPUMTLLateEvalEvent)initWithDevice:(__IOGPUDevice *)a3
{
  output[2] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMTLLateEvalEvent;
  v4 = [(IOGPUMTLLateEvalEvent *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_deviceRef = a3;
    CFRetain(a3);
    uint32_t outputCnt = 2;
    if (IOConnectCallMethod(v5->_deviceRef->var2, 0x1Du, 0, 0, 0, 0, output, &outputCnt, 0, 0))
    {

      return 0;
    }
    else
    {
      uint64_t v6 = output[1];
      v5->_eventName = output[0];
      v5->_globalTraceObjectID = v6;
    }
  }
  return v5;
}

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    if (self->_eventName)
    {
      uint64_t input = self->_eventName;
      IOConnectCallMethod(deviceRef->var2, 0x1Eu, &input, 1u, 0, 0, 0, 0, 0, 0);
      deviceRef = self->_deviceRef;
    }
    CFRelease(deviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMTLLateEvalEvent;
  [(IOGPUMTLLateEvalEvent *)&v4 dealloc];
}

- (void)setSignaledValue:(unint64_t)a3
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = self->_eventName;
  input[1] = a3;
  IOConnectCallMethod(self->_deviceRef->var2, 0x1Fu, input, 2u, 0, 0, 0, 0, 0, 0);
}

- (unint64_t)signaledValue
{
  output[2] = *MEMORY[0x263EF8340];
  uint64_t input = self->_eventName;
  output[0] = 0;
  output[1] = 0;
  uint32_t outputCnt = 2;
  IOConnectCallMethod(self->_deviceRef->var2, 0x20u, &input, 1u, 0, 0, output, &outputCnt, 0, 0);
  return output[0];
}

@end