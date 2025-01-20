@interface CFPDCFDataBuffer
- (CFPDCFDataBuffer)initWithCFData:(__CFData *)a3;
- (__CFData)copyCFData;
- (id)copyXPCData;
- (unint64_t)length;
- (void)bytes;
- (void)dealloc;
@end

@implementation CFPDCFDataBuffer

- (CFPDCFDataBuffer)initWithCFData:(__CFData *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  v6.receiver = self;
  v6.super_class = (Class)CFPDCFDataBuffer;
  v4 = [(CFPDCFDataBuffer *)&v6 init];
  if (v4) {
    v4->data = (__CFData *)CFRetain(a3);
  }
  return v4;
}

- (void)bytes
{
  return (void *)CFDataGetBytePtr(self->data);
}

- (unint64_t)length
{
  return CFDataGetLength(self->data);
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  CFRelease(self->data);
  v3.receiver = self;
  v3.super_class = (Class)CFPDCFDataBuffer;
  [(CFPDCFDataBuffer *)&v3 dealloc];
}

- (__CFData)copyCFData
{
  return CFDataCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, self->data);
}

- (id)copyXPCData
{
  DispatchData = _CFDataCreateDispatchData(self->data);
  xpc_object_t v3 = xpc_data_create_with_dispatch_data(DispatchData);
  dispatch_release(DispatchData);
  return v3;
}

@end