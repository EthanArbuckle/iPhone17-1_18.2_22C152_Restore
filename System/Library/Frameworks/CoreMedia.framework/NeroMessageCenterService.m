@interface NeroMessageCenterService
- (BOOL)isActive;
- (BOOL)sendMemoryBlock:(void *)a3 withLength:(unint64_t)a4;
- (NeroMessageCenterService)initWithIDSSerivce:(id)a3 connection:(OpaqueFigTransportConnection *)a4;
- (void)activateConnection;
- (void)deactivateConnection;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation NeroMessageCenterService

- (NeroMessageCenterService)initWithIDSSerivce:(id)a3 connection:(OpaqueFigTransportConnection *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NeroMessageCenterService;
  v6 = [(NeroMessageCenterService *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_connection = a4;
    v6->_service = (IDSService *)a3;
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[@"FigTransportConnectionIDS.delegate" UTF8String], 0);
    v7->_options = 0;
    v7->_serviceQueue = (OS_dispatch_queue *)v8;
    v7->_isActive = 0;
    service = v7->_service;
    if (!service || ![(IDSService *)service canSend] || !v7->_serviceQueue) {
      return 0;
    }
  }
  return v7;
}

- (void)activateConnection
{
  v5[3] = *MEMORY[0x1E4F143B8];
  if (!self->_isActive)
  {
    [(IDSService *)self->_service addDelegate:self queue:self->_serviceQueue];
    service = self->_service;
    v4[0] = *(void *)ids_IDSLinkPreferenceOptionPacketsPerSecondKey;
    v5[0] = &unk_1EDF88DB0;
    v4[1] = *(void *)ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v5[1] = &unk_1EDF88DC8;
    v4[2] = *(void *)ids_IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v5[2] = &unk_1EDF88DC8;
    -[IDSService setLinkPreferences:](service, "setLinkPreferences:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3]);
    [(IDSService *)self->_service canSend];
    self->_incomingPackage = 0;
    self->_incomingPackageSize = 0;
    self->_numBytesReceivedForIncomingPackage = 0;
    self->_isActive = 1;
  }
}

- (void)deactivateConnection
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if (self->_isActive)
  {
    self->_isActive = 0;
    service = self->_service;
    v6[0] = *(void *)ids_IDSLinkPreferenceOptionPacketsPerSecondKey;
    v7[0] = &unk_1EDF88DE0;
    v6[1] = *(void *)ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v7[1] = &unk_1EDF88DE0;
    v6[2] = *(void *)ids_IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v7[2] = &unk_1EDF88DE0;
    -[IDSService setLinkPreferences:](service, "setLinkPreferences:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3]);
    [(IDSService *)self->_service removeDelegate:self];
    serviceQueue = self->_serviceQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__NeroMessageCenterService_deactivateConnection__block_invoke;
    v5[3] = &unk_1E5676460;
    void v5[4] = self;
    dispatch_async(serviceQueue, v5);
  }
}

void __48__NeroMessageCenterService_deactivateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(const void **)(v2 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 48) = 0;
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
}

- (BOOL)sendMemoryBlock:(void *)a3 withLength:(unint64_t)a4
{
  id v9 = 0;
  uint64_t v10 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"__IDS_DEFAULT_PAIRED_DEVICE__"];
  if (!self->_isActive) {
    return 1;
  }
  -[IDSService sendData:toDestinations:priority:options:identifier:error:](self->_service, "sendData:toDestinations:priority:options:identifier:error:", [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:a3 length:a4 freeWhenDone:1], v7, 300, self->_options, &v10, &v9);
  [v9 code];
  return v9 == 0;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = (unsigned int *)objc_msgSend(a5, "bytes", a3, a4);
  unint64_t v10 = [a5 length];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage((uint64_t)self->_connection);
  if (self->_isActive && v10 != 0)
  {
    uint64_t v13 = DerivedStorage;
    unint64_t v14 = 0;
    p_incomingPackage = &self->_incomingPackage;
    CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      v17 = *p_incomingPackage;
      if (v10 > 3)
      {
        if (!v17)
        {
          size_t v19 = *v9;
          self->_incomingPackageSize = v19;
          if (CMBlockBufferCreateWithMemoryBlock(v16, 0, v19, *(CFAllocatorRef *)(v13 + 64), 0, 0, v19, 1u, &self->_incomingPackage))
          {
            return;
          }
          v17 = *p_incomingPackage;
        }
      }
      else
      {
        if (v17) {
          BOOL v18 = v10 == v14;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18) {
          return;
        }
      }
      size_t numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage;
      if (v10 >= self->_incomingPackageSize - numBytesReceivedForIncomingPackage) {
        size_t v21 = self->_incomingPackageSize - numBytesReceivedForIncomingPackage;
      }
      else {
        size_t v21 = v10;
      }
      if (CMBlockBufferReplaceDataBytes(v9, v17, numBytesReceivedForIncomingPackage, v21)) {
        break;
      }
      unint64_t v22 = self->_numBytesReceivedForIncomingPackage + v21;
      self->_size_t numBytesReceivedForIncomingPackage = v22;
      if (v22 == self->_incomingPackageSize)
      {
        ids_didReceivePackage(self->_connection, self->_incomingPackage);
        incomingPackage = self->_incomingPackage;
        if (incomingPackage)
        {
          CFRelease(incomingPackage);
          *p_incomingPackage = 0;
        }
        self->_incomingPackageSize = 0;
        self->_size_t numBytesReceivedForIncomingPackage = 0;
      }
      v14 += v21;
    }
    while (v14 < v10);
  }
}

- (void)dealloc
{
  [(NeroMessageCenterService *)self deactivateConnection];
  serviceQueue = self->_serviceQueue;
  if (serviceQueue)
  {
    dispatch_release(serviceQueue);
    self->_serviceQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)NeroMessageCenterService;
  [(NeroMessageCenterService *)&v4 dealloc];
}

- (BOOL)isActive
{
  return self->_isActive;
}

@end