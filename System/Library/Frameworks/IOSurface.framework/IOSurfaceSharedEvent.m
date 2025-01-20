@interface IOSurfaceSharedEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsLowLatencySignalAndWait;
- (BOOL)supportsRollback;
- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4;
- (IOSurfaceSharedEvent)init;
- (IOSurfaceSharedEvent)initWithCoder:(id)a3;
- (IOSurfaceSharedEvent)initWithMachPort:(unsigned int)a3;
- (IOSurfaceSharedEvent)initWithOptions:(unint64_t)a3;
- (unint64_t)globalTraceObjectID;
- (unint64_t)signaledValue;
- (unsigned)eventPort;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5;
- (void)setSignaledValue:(unint64_t)a3;
@end

@implementation IOSurfaceSharedEvent

- (IOSurfaceSharedEvent)init
{
  return [(IOSurfaceSharedEvent *)self initWithOptions:0];
}

- (IOSurfaceSharedEvent)initWithOptions:(unint64_t)a3
{
  output[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)IOSurfaceSharedEvent;
  v4 = [(IOSurfaceSharedEvent *)&v13 init];
  if (v4)
  {
    uint64_t input = a3;
    uint32_t outputCnt = 2;
    mach_port_t v5 = _ioSurfaceConnect();
    if (IOConnectCallMethod(v5, 0x24u, &input, 1u, 0, 0, output, &outputCnt, 0, 0)) {
      goto LABEL_4;
    }
    uint64_t v6 = LODWORD(output[0]);
    *((_DWORD *)v4 + 2) = output[0];
    *((void *)v4 + 2) = output[1];
    uint64_t v10 = v6;
    *(_OWORD *)v14 = 0u;
    long long v15 = 0u;
    uint32_t v9 = 4;
    mach_port_t v7 = _ioSurfaceConnect();
    if (IOConnectCallMethod(v7, 0x26u, &v10, 1u, 0, 0, v14, &v9, 0, 0))
    {
LABEL_4:

      return 0;
    }
    else
    {
      *(_OWORD *)(v4 + 24) = v15;
    }
  }
  return (IOSurfaceSharedEvent *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IOSurfaceSharedEvent)initWithMachPort:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  mach_port_mod_refs(*MEMORY[0x1E4F14960], a3, 0, 1);
  self->_eventPort = a3;
  uint64_t input = a3;
  *(_OWORD *)output = 0u;
  long long v10 = 0u;
  uint32_t outputCnt = 4;
  mach_port_t v5 = _ioSurfaceConnect();
  if (IOConnectCallMethod(v5, 0x26u, &input, 1u, 0, 0, output, &outputCnt, 0, 0))
  {

    return 0;
  }
  else
  {
    self->_signaledValue = (const unint64_t *)output[1];
    *(_OWORD *)&self->_globalTraceObjectID = v10;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This object may only be encoded by an NSXPCCoder."];
  }
  v4 = (void *)xpc_mach_send_create();
  [a3 encodeXPCObject:v4 forKey:@"IOSurface.port"];

  xpc_release(v4);
}

- (IOSurfaceSharedEvent)initWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  if ([a3 decodeXPCObjectOfType:MEMORY[0x1E4F145C8] forKey:@"IOSurface.port"]
    && (uint64_t right = xpc_mach_send_get_right(), right))
  {
    return [(IOSurfaceSharedEvent *)self initWithMachPort:right];
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  mach_port_mod_refs(*MEMORY[0x1E4F14960], self->_eventPort, 0, -1);
  v3.receiver = self;
  v3.super_class = (Class)IOSurfaceSharedEvent;
  [(IOSurfaceSharedEvent *)&v3 dealloc];
}

- (void)setSignaledValue:(unint64_t)a3
{
  io_connect_t v5 = _ioSurfaceConnect();
  uintptr_t eventPort = self->_eventPort;

  IOConnectTrap2(v5, 7u, eventPort, a3);
}

- (unint64_t)signaledValue
{
  return *self->_signaledValue;
}

- (BOOL)supportsRollback
{
  return self->_eventOptions & 1;
}

- (BOOL)supportsLowLatencySignalAndWait
{
  return (LOBYTE(self->_eventOptions) >> 1) & 1;
}

- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4
{
  if (*self->_signaledValue >= a3) {
    return 1;
  }
  io_connect_t v7 = _ioSurfaceConnect();
  return IOConnectTrap3(v7, 6u, self->_eventPort, a3, a4) == 0;
}

- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5
{
}

- (unsigned)eventPort
{
  return self->_eventPort;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

@end