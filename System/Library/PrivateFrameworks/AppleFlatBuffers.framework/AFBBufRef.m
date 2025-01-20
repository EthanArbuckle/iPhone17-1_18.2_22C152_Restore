@interface AFBBufRef
- (AFBBufRef)initWithData:(id)a3;
- (NSData)data;
- (__CFAllocator)deallocator;
- (void)dealloc;
@end

@implementation AFBBufRef

- (AFBBufRef)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFBBufRef;
  v6 = [(AFBBufRef *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    context.version = 0;
    context.info = v7;
    memset(&context.retain, 0, 24);
    context.allocate = (CFAllocatorAllocateCallBack)cfAllocateAlwaysFailing;
    context.reallocate = 0;
    context.deallocate = (CFAllocatorDeallocateCallBack)cfDeallocateBackingObject;
    context.preferredSize = 0;
    v7->_cfReleaseBackingDataDeallocator = CFAllocatorCreate(0, &context);
  }

  return v7;
}

- (__CFAllocator)deallocator
{
  return self->_cfReleaseBackingDataDeallocator;
}

- (void)dealloc
{
  cfReleaseBackingDataDeallocator = self->_cfReleaseBackingDataDeallocator;
  if (cfReleaseBackingDataDeallocator) {
    CFRelease(cfReleaseBackingDataDeallocator);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFBBufRef;
  [(AFBBufRef *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

- (NSData)data
{
  return self->_data;
}

@end