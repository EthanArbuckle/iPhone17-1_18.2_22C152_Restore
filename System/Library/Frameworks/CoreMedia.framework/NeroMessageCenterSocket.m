@interface NeroMessageCenterSocket
- (BOOL)isActive;
- (BOOL)sendMemoryBlock:(void *)a3 withLength:(unint64_t)a4;
- (NeroMessageCenterSocket)initWithIDSSerivce:(id)a3 connection:(OpaqueFigTransportConnection *)a4;
- (void)activateConnection;
- (void)deactivateConnection;
- (void)dealloc;
- (void)mainLoop;
- (void)readPackage;
- (void)sendPackage;
@end

@implementation NeroMessageCenterSocket

- (NeroMessageCenterSocket)initWithIDSSerivce:(id)a3 connection:(OpaqueFigTransportConnection *)a4
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NeroMessageCenterSocket;
  v6 = [(NeroMessageCenterSocket *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_connection = a4;
    v6->_service = (IDSService *)a3;
    v11[0] = *(void *)ids_IDSOpenSocketOptionTransportKey;
    v12[0] = &unk_1EDF88DF8;
    v11[1] = *(void *)ids_IDSOpenSocketOptionPriorityKey;
    v12[1] = &unk_1EDF88E10;
    v11[2] = *(void *)ids_IDSOpenSocketOptionScopeKey;
    v12[2] = &unk_1EDF88DF8;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    v7->_outgoingPackageQueue.stqh_first = 0;
    v7->_options = (NSDictionary *)v8;
    v7->_idsDevice = 0;
    v7->_outgoingPackageQueue.stqh_last = &v7->_outgoingPackageQueue.stqh_first;
    v7->_outgoingQueueHeadBytesSent = 0;
    pthread_mutex_init(&v7->_outgoingQueueMutex, 0);
    v7->_receivalQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[@"FigTransportConnectionIDS.socketReceiver" UTF8String], 0);
    v7->_isActive = 0;
  }
  return v7;
}

- (void)activateConnection
{
  v24[3] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  if (!self->_isActive)
  {
    v4 = v3;
    service = self->_service;
    v23[0] = *(void *)ids_IDSLinkPreferenceOptionPacketsPerSecondKey;
    v24[0] = &unk_1EDF88DB0;
    v23[1] = *(void *)ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v24[1] = &unk_1EDF88DC8;
    v23[2] = *(void *)ids_IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v24[2] = &unk_1EDF88DC8;
    -[IDSService setLinkPreferences:](service, "setLinkPreferences:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3]);
    self->_idsDevice = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = (void *)[(IDSService *)self->_service devices];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(IDSDevice **)(*((void *)&v18 + 1) + 8 * i);
          if ([(IDSDevice *)v11 isDefaultPairedDevice]) {
            self->_idsDevice = v11;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    if (self->_idsDevice)
    {
      self->_pollfd.fd = -1;
      id v12 = objc_alloc((Class)ids_IDSDeviceConnectionClass);
      idsDevice = self->_idsDevice;
      options = self->_options;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __45__NeroMessageCenterSocket_activateConnection__block_invoke;
      v17[3] = &unk_1E56795A8;
      v17[4] = self;
      v17[5] = v4;
      self->_deviceConnection = (IDSDeviceConnection *)[v12 initSocketWithDevice:idsDevice options:options completionHandler:v17 queue:self->_receivalQueue];
      dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
      if (!fcntl(self->_pollfd.fd, 4, 4))
      {
        self->_pollfd.events = 5;
        dispatch_release(v4);
        self->_isActive = 1;
        receivalQueue = self->_receivalQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__NeroMessageCenterSocket_activateConnection__block_invoke_2;
        block[3] = &unk_1E5676460;
        block[4] = self;
        dispatch_async(receivalQueue, block);
      }
    }
  }
}

intptr_t __45__NeroMessageCenterSocket_activateConnection__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (!a3) {
    *(_DWORD *)(*(void *)(a1 + 32) + 48) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __45__NeroMessageCenterSocket_activateConnection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) mainLoop];
}

- (void)deactivateConnection
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if (self->_isActive)
  {
    self->_isActive = 0;
    self->_pollfd.events = 0;
    receivalQueue = self->_receivalQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__NeroMessageCenterSocket_deactivateConnection__block_invoke;
    v5[3] = &unk_1E5676460;
    v5[4] = self;
    dispatch_sync(receivalQueue, v5);
    [(IDSDeviceConnection *)self->_deviceConnection close];

    service = self->_service;
    v6[0] = *(void *)ids_IDSLinkPreferenceOptionPacketsPerSecondKey;
    v7[0] = &unk_1EDF88DE0;
    v6[1] = *(void *)ids_IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v7[1] = &unk_1EDF88DE0;
    v6[2] = *(void *)ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v7[2] = &unk_1EDF88DE0;
    -[IDSService setLinkPreferences:](service, "setLinkPreferences:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3]);
  }
}

void __47__NeroMessageCenterSocket_deactivateConnection__block_invoke(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 32); ; uint64_t i = *(void *)(a1 + 32))
  {
    dispatch_semaphore_t v3 = (void **)(i + 88);
    v4 = *(void ***)(i + 88);
    if (!v4) {
      break;
    }
    v5 = *v4;
    *dispatch_semaphore_t v3 = *v4;
    if (!v5) {
      *(void *)(*(void *)(a1 + 32) + 96) = *(void *)(a1 + 32) + 88;
    }
    free(v4[1]);
    free(v4);
  }
  v6 = *(const void **)(i + 80);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(*(void *)(a1 + 32) + 80) = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 72) = 0;
    *(void *)(*(void *)(a1 + 32) + 64) = 0;
  }
}

- (BOOL)sendMemoryBlock:(void *)a3 withLength:(unint64_t)a4
{
  if (!self->_isActive) {
    goto LABEL_4;
  }
  uint64_t v7 = (FigPackageRecord *)malloc_type_calloc(1uLL, 0x18uLL, 0x10A00404E934A1DuLL);
  if (v7)
  {
    uint64_t v8 = v7;
    *((void *)v7 + 1) = a3;
    *((void *)v7 + 2) = a4;
    pthread_mutex_lock(&self->_outgoingQueueMutex);
    *(void *)uint64_t v8 = 0;
    *self->_outgoingPackageQueue.stqh_last = v8;
    self->_outgoingPackageQueue.stqh_last = (FigPackageRecord **)v8;
    pthread_mutex_unlock(&self->_outgoingQueueMutex);
LABEL_4:
    LOBYTE(v7) = 1;
  }
  return (char)v7;
}

- (void)sendPackage
{
  p_outgoingQueueMutex = &self->_outgoingQueueMutex;
  pthread_mutex_lock(&self->_outgoingQueueMutex);
  p_outgoingPackageQueue = &self->_outgoingPackageQueue;
  stqh_first = self->_outgoingPackageQueue.stqh_first;
  if (stqh_first)
  {
    unint64_t outgoingQueueHeadBytesSent = self->_outgoingQueueHeadBytesSent;
    unint64_t v7 = *((void *)stqh_first + 2);
    uint64_t v8 = self->_outgoingPackageQueue.stqh_first;
    if (outgoingQueueHeadBytesSent >= v7)
    {
LABEL_6:
      self->_unint64_t outgoingQueueHeadBytesSent = 0;
      objc_super v10 = *(FigPackageRecord **)v8;
      self->_outgoingPackageQueue.stqh_first = *(FigPackageRecord **)v8;
      if (!v10) {
        self->_outgoingPackageQueue.stqh_last = &p_outgoingPackageQueue->stqh_first;
      }
      free(*((void **)stqh_first + 1));
      free(stqh_first);
    }
    else
    {
      while (1)
      {
        ssize_t v9 = write(self->_pollfd.fd, (const void *)(*((void *)stqh_first + 1) + outgoingQueueHeadBytesSent), v7 - outgoingQueueHeadBytesSent);
        if (!v9) {
          break;
        }
        unint64_t outgoingQueueHeadBytesSent = self->_outgoingQueueHeadBytesSent + v9;
        self->_unint64_t outgoingQueueHeadBytesSent = outgoingQueueHeadBytesSent;
        unint64_t v7 = *((void *)stqh_first + 2);
        if (outgoingQueueHeadBytesSent >= v7)
        {
          uint64_t v8 = p_outgoingPackageQueue->stqh_first;
          goto LABEL_6;
        }
      }
    }
  }

  pthread_mutex_unlock(p_outgoingQueueMutex);
}

- (void)readPackage
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage((uint64_t)self->_connection);
  size_t numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage;
  if (numBytesReceivedForIncomingPackage > 3)
  {
    size_t v7 = 0;
    v6 = 0;
LABEL_7:
    size_t lengthAtOffsetOut = v7;
    dataPointerOut = v6;
    p_incomingPackage = &self->_incomingPackage;
    if (self->_incomingPackage) {
      goto LABEL_8;
    }
    if (!CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, self->_incomingPackageSize, *(CFAllocatorRef *)(DerivedStorage + 64), 0, 0, self->_incomingPackageSize, 1u, &self->_incomingPackage)&& !CMBlockBufferReplaceDataBytes(&self->_incomingPackageSize, *p_incomingPackage, 0, 4uLL))
    {
      size_t numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage;
LABEL_8:
      while (1)
      {
        size_t incomingPackageSize = self->_incomingPackageSize;
        if (numBytesReceivedForIncomingPackage >= incomingPackageSize) {
          break;
        }
        if (CMBlockBufferGetDataPointer(*p_incomingPackage, numBytesReceivedForIncomingPackage, &lengthAtOffsetOut, 0, &dataPointerOut))
        {
          return;
        }
        ssize_t v11 = read(self->_pollfd.fd, dataPointerOut, lengthAtOffsetOut);
        if (v11 < 1) {
          return;
        }
        size_t numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage + v11;
        self->_size_t numBytesReceivedForIncomingPackage = numBytesReceivedForIncomingPackage;
      }
      if (numBytesReceivedForIncomingPackage >= 4 && numBytesReceivedForIncomingPackage == incomingPackageSize)
      {
        ids_didReceivePackage(self->_connection, self->_incomingPackage);
        CFRelease(self->_incomingPackage);
        self->_incomingPackage = 0;
        self->_size_t incomingPackageSize = 0;
        self->_size_t numBytesReceivedForIncomingPackage = 0;
      }
    }
  }
  else
  {
    p_size_t incomingPackageSize = &self->_incomingPackageSize;
    while (1)
    {
      v6 = (char *)p_incomingPackageSize + numBytesReceivedForIncomingPackage;
      size_t v7 = 4 - numBytesReceivedForIncomingPackage;
      ssize_t v8 = read(self->_pollfd.fd, (char *)p_incomingPackageSize + numBytesReceivedForIncomingPackage, 4 - numBytesReceivedForIncomingPackage);
      if (v8 < 1) {
        break;
      }
      size_t numBytesReceivedForIncomingPackage = self->_numBytesReceivedForIncomingPackage + v8;
      self->_size_t numBytesReceivedForIncomingPackage = numBytesReceivedForIncomingPackage;
      if (numBytesReceivedForIncomingPackage >= 4) {
        goto LABEL_7;
      }
    }
  }
}

- (void)mainLoop
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_isActive)
  {
    p_pollfd = &self->_pollfd;
    while (1)
    {
      poll(p_pollfd, 1u, 15);
      __int16 revents = self->_pollfd.revents;
      if ((revents & 8) != 0) {
        break;
      }
      if ((revents & 0x10) != 0)
      {
        int v15 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v15, &type);
        int v6 = v15;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
          unsigned int v10 = v6;
        }
        else {
          unsigned int v10 = v6 & 0xFFFFFFFE;
        }
        if (v10)
        {
          int v16 = 136315138;
          v17 = "-[NeroMessageCenterSocket mainLoop]";
          goto LABEL_21;
        }
        goto LABEL_22;
      }
      if (revents)
      {
        [(NeroMessageCenterSocket *)self readPackage];
        __int16 revents = self->_pollfd.revents;
      }
      if ((revents & 4) != 0) {
        [(NeroMessageCenterSocket *)self sendPackage];
      }
      if (!self->_isActive) {
        return;
      }
    }
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v15, &type);
    int v6 = v15;
    if (os_log_type_enabled(v5, type)) {
      unsigned int v8 = v6;
    }
    else {
      unsigned int v8 = v6 & 0xFFFFFFFE;
    }
    if (v8)
    {
      int v16 = 136315138;
      v17 = "-[NeroMessageCenterSocket mainLoop]";
LABEL_21:
      ssize_t v11 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v6) = v15;
      goto LABEL_23;
    }
LABEL_22:
    ssize_t v11 = 0;
LABEL_23:
    fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v11, v11 != &v18, v6, 0, v7);
    if (self->_isActive)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__NeroMessageCenterSocket_mainLoop__block_invoke;
      block[3] = &unk_1E5676460;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
  }
}

uint64_t __35__NeroMessageCenterSocket_mainLoop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateConnection];
}

- (void)dealloc
{
  [(NeroMessageCenterSocket *)self deactivateConnection];
  pthread_mutex_destroy(&self->_outgoingQueueMutex);
  receivalQueue = self->_receivalQueue;
  if (receivalQueue)
  {
    dispatch_release(receivalQueue);
    self->_receivalQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)NeroMessageCenterSocket;
  [(NeroMessageCenterSocket *)&v4 dealloc];
}

- (BOOL)isActive
{
  return self->_isActive;
}

@end