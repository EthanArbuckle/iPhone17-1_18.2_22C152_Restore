@interface IOSurfaceMemoryPool
- (IOSurfaceMemoryPool)initWithProperties:(id)a3;
- (id)copyDebugInfo;
- (int)ensureMemory:(id)a3;
- (int)flush:(id)a3;
- (unint64_t)poolId;
- (void)dealloc;
@end

@implementation IOSurfaceMemoryPool

- (unint64_t)poolId
{
  return self->_poolId;
}

- (int)flush:(id)a3
{
  kern_return_t v9;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v4 = IOCFSerialize(a3, 1uLL);
  if (!v4) {
    return -536870206;
  }
  CFDataRef v5 = v4;
  input[0] = self->_poolPort;
  mach_port_t v6 = _ioSurfaceConnect();
  BytePtr = CFDataGetBytePtr(v5);
  size_t Length = CFDataGetLength(v5);
  v9 = IOConnectCallMethod(v6, 0x30u, input, 1u, BytePtr, Length, 0, 0, 0, 0);
  CFRelease(v5);
  return v9;
}

- (int)ensureMemory:(id)a3
{
  kern_return_t v9;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v4 = IOCFSerialize(a3, 1uLL);
  if (!v4) {
    return -536870206;
  }
  CFDataRef v5 = v4;
  input[0] = self->_poolPort;
  mach_port_t v6 = _ioSurfaceConnect();
  BytePtr = CFDataGetBytePtr(v5);
  size_t Length = CFDataGetLength(v5);
  v9 = IOConnectCallMethod(v6, 0x2Fu, input, 1u, BytePtr, Length, 0, 0, 0, 0);
  CFRelease(v5);
  return v9;
}

- (IOSurfaceMemoryPool)initWithProperties:(id)a3
{
  kern_return_t v10;
  unint64_t v11;
  uint32_t outputCnt;
  objc_super v14;
  uint64_t output;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)IOSurfaceMemoryPool;
  CFDataRef v4 = [(IOSurfaceMemoryPool *)&v14 init];
  if (v4)
  {
    CFDataRef v5 = IOCFSerialize(a3, 1uLL);
    if (v5)
    {
      CFDataRef v6 = v5;
      output = 0;
      v16 = 0;
      outputCnt = 2;
      mach_port_t v7 = _ioSurfaceConnect();
      BytePtr = CFDataGetBytePtr(v6);
      size_t Length = CFDataGetLength(v6);
      v10 = IOConnectCallMethod(v7, 0x2Eu, 0, 0, BytePtr, Length, &output, &outputCnt, 0, 0);
      CFRelease(v6);
      if (!v10)
      {
        v11 = v16;
        v4->_poolPort = output;
        v4->_poolId = v11;
        return v4;
      }
    }
    return 0;
  }
  return v4;
}

- (id)copyDebugInfo
{
  outputStruct[1] = *(const char **)MEMORY[0x1E4F143B8];
  outputStruct[0] = 0;
  uint64_t input = self->_poolPort;
  size_t bufferSize = -3;
  mach_port_t v2 = _ioSurfaceConnect();
  CFTypeRef v3 = 0;
  if (!IOConnectCallMethod(v2, 0x31u, &input, 1u, 0, 0, 0, 0, outputStruct, &bufferSize))
  {
    CFStringRef errorString = 0;
    CFTypeRef v3 = IOCFUnserializeBinary(outputStruct[0], bufferSize, 0, 0, &errorString);
    if (!v3)
    {
      if (errorString)
      {
        NSLog(&cfstr_FailedToUnseri.isa, errorString);
        CFRelease(errorString);
      }
      else
      {
        NSLog(&cfstr_FailedToUnseri_0.isa);
      }
    }
    mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)outputStruct[0], bufferSize);
  }
  return (id)v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  mach_port_mod_refs(*MEMORY[0x1E4F14960], self->_poolPort, 0, -1);
  v3.receiver = self;
  v3.super_class = (Class)IOSurfaceMemoryPool;
  [(IOSurfaceMemoryPool *)&v3 dealloc];
}

@end