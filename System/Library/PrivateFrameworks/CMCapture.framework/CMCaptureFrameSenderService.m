@interface CMCaptureFrameSenderService
+ (void)initialize;
- (CMCaptureFrameSenderService)init;
- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3;
- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3 endpointCameraUniqueID:(id)a4;
- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3 endpointPID:(int)a4 endpointProxyPID:(int)a5 endpointAuditToken:(id)a6 endpointProxyAuditToken:(id)a7 endpointCameraUniqueID:(id)a8;
- (int)sendFrame:(opaqueCMSampleBuffer *)a3;
- (opaqueCMSampleBuffer)_newSampleBufferToSendFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_addConnection:(id)a3;
- (void)_cleanupSendingPixelBufferMachinery;
- (void)dealloc;
@end

@implementation CMCaptureFrameSenderService

- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3 endpointPID:(int)a4 endpointProxyPID:(int)a5 endpointAuditToken:(id)a6 endpointProxyAuditToken:(id)a7 endpointCameraUniqueID:(id)a8
{
  v30.receiver = self;
  v30.super_class = (Class)CMCaptureFrameSenderService;
  v14 = [(CMCaptureFrameSenderService *)&v30 init];
  if (v14)
  {
    *((void *)v14 + 1) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    *((void *)v14 + 2) = [[NSString alloc] initWithString:a3];
    v14[12] = a4;
    v14[13] = a5;
    *((void *)v14 + 4) = a6;
    *((void *)v14 + 5) = a7;
    id v15 = [NSString alloc];
    if (a8) {
      v16 = (__CFString *)a8;
    }
    else {
      v16 = @"unknown";
    }
    *((void *)v14 + 3) = [v15 initWithString:v16];
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_create("com.apple.CMCapture.CMCaptureFrameSender", v17);
    *((void *)v14 + 7) = v18;
    v19 = xpc_connection_create(0, v18);
    *((void *)v14 + 8) = v19;
    *((void *)v14 + 9) = xpc_endpoint_create(v19);
    *((void *)v14 + 10) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((void *)v14 + 11) = dispatch_queue_create("com.apple.CMCapture.CMCaptureFrameSender.clients", v20);
    objc_initWeak(&location, v14);
    v21 = (_xpc_connection_s *)*((void *)v14 + 8);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke;
    handler[3] = &unk_1E5C24538;
    objc_copyWeak(&v28, &location);
    xpc_connection_set_event_handler(v21, handler);
    xpc_connection_activate(*((xpc_connection_t *)v14 + 8));
    if (initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID__initAtExitHandler != -1) {
      dispatch_once(&initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID__initAtExitHandler, &__block_literal_global_2);
    }
    if (sRunningInsideCameracaptured)
    {
      if (+[CMCaptureFrameSenderEndpointsServerSideSingleton addEndpoint:*((void *)v14 + 9) endpointUniqueID:*((void *)v14 + 1) endpointType:*((void *)v14 + 2) endpointPID:v14[12] endpointProxyPID:v14[13] endpointAuditToken:*((void *)v14 + 4) endpointProxyAuditToken:*((void *)v14 + 5) endpointCameraUniqueID:*((void *)v14 + 3)])
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter"), "postNotificationName:object:", @"FrameServerEndpointsChanged", 0);
      }
    }
    else
    {
      FigCaptureSourceRemotePublishFrameSenderServerEndpoint(*((void **)v14 + 9), *((void **)v14 + 1), *((void **)v14 + 2), v14[12], v14[13], *((void *)v14 + 4), *((void *)v14 + 5), *((void **)v14 + 3));
    }
    *((void *)v14 + 12) = 0;
    *((void *)v14 + 13) = 0;
    *((void *)v14 + 19) = 0;
    *((void *)v14 + 20) = 0;
    v14[42] = 5;
    *((unsigned char *)v14 + 172) = 0;
    *((void *)v14 + 14) = 0;
    *((void *)v14 + 15) = 0;
    *((void *)v14 + 17) = 0x4014000000000000;
    *((void *)v14 + 18) = 0;
    v22 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v14 + 11));
    *((void *)v14 + 16) = v22;
    dispatch_source_set_timer(v22, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v23 = *((void *)v14 + 16);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke_3;
    v25[3] = &unk_1E5C24580;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v23, v25);
    dispatch_activate(*((dispatch_object_t *)v14 + 16));
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return (CMCaptureFrameSenderService *)v14;
}

- (int)sendFrame:(opaqueCMSampleBuffer *)a3
{
  if (a3)
  {
    objc_initWeak(&location, self);
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__CMCaptureFrameSenderService_sendFrame___block_invoke;
    block[3] = &unk_1E5C245D0;
    objc_copyWeak(v8, &location);
    v8[1] = a3;
    dispatch_async_and_wait(clientQueue, block);
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
  return 0;
}

void __41__CMCaptureFrameSenderService_sendFrame___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    return;
  }
  id v3 = WeakRetained;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v4 = (void *)WeakRetained[10];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (!v5)
  {
    id v7 = 0;
    goto LABEL_49;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  v8 = 0;
  xpc_object_t v9 = 0;
  char v10 = 0;
  uint64_t v11 = *(void *)v42;
  CFAllocatorRef blockAllocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v35 = v4;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(v4);
      }
      v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
      if (objc_msgSend(v13, "connectionIsValid", v32, v33))
      {
        if (v10) {
          goto LABEL_31;
        }
        v14 = *((void *)v3 + 16);
        dispatch_time_t v15 = dispatch_time(0, (uint64_t)(*((double *)v3 + 17) * 1000000000.0));
        dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
        v8 = (opaqueCMSampleBuffer *)[v3 _newSampleBufferToSendFromSampleBuffer:*(void *)(a1 + 40)];
        if (!v8) {
          goto LABEL_30;
        }
        dataPointerOut = 0;
        CMBlockBufferRef theBuffer = 0;
        size_t totalLengthOut = 0;
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        int SerializedAtomDataBlockBufferForSampleBuffer = FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer();
        if (SerializedAtomDataBlockBufferForSampleBuffer)
        {
          uint64_t v33 = v1;
          LODWORD(v32) = SerializedAtomDataBlockBufferForSampleBuffer;
        }
        else
        {
          int IsRangeContiguous = CMBlockBufferIsRangeContiguous(theBuffer, 0, 0);
          v18 = theBuffer;
          if (IsRangeContiguous) {
            goto LABEL_16;
          }
          CMBlockBufferRef blockBufferOut = 0;
          OSStatus v19 = CMBlockBufferCreateContiguous(blockAllocator, theBuffer, blockAllocator, 0, 0, 0, 0, &blockBufferOut);
          if (v19)
          {
            uint64_t v33 = v1;
            LODWORD(v32) = v19;
          }
          else
          {
            if (theBuffer) {
              CFRelease(theBuffer);
            }
            v18 = blockBufferOut;
            CMBlockBufferRef theBuffer = blockBufferOut;
LABEL_16:
            OSStatus DataPointer = CMBlockBufferGetDataPointer(v18, 0, 0, &totalLengthOut, &dataPointerOut);
            if (!DataPointer)
            {
              xpc_object_t v21 = xpc_data_create(dataPointerOut, totalLengthOut);
              xpc_dictionary_set_value(v9, "sample-buffer-basic-fields", v21);
              ImageBuffer = CMSampleBufferGetImageBuffer(v8);
              if (ImageBuffer)
              {
                IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
                if (IOSurface)
                {
                  xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
                  xpc_dictionary_set_value(v9, "sample-buffer-iosurface", XPCObject);
                  xpc_release(XPCObject);
                }
              }
              int v25 = 0;
LABEL_21:
              if (theBuffer) {
                CFRelease(theBuffer);
              }
              if (v21) {
                xpc_release(v21);
              }
              if (v9) {
                int v26 = v25;
              }
              else {
                int v26 = 0;
              }
              if (v26 == 1)
              {
                xpc_release(v9);
                xpc_object_t v9 = 0;
              }
LABEL_30:
              v4 = v35;
LABEL_31:
              if (v9) {
                [v13 sendXCPSampleBuffer:v9];
              }
              char v10 = 1;
              goto LABEL_37;
            }
            uint64_t v33 = v1;
            LODWORD(v32) = DataPointer;
          }
        }
        FigDebugAssert3();
        xpc_object_t v21 = 0;
        int v25 = 1;
        goto LABEL_21;
      }
      if (!v7) {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      [v7 addObject:v13];
LABEL_37:
      ++v12;
    }
    while (v6 != v12);
    uint64_t v27 = [v4 countByEnumeratingWithState:&v41 objects:v50 count:16];
    uint64_t v6 = v27;
  }
  while (v27);
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    xpc_release(v9);
  }
LABEL_49:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v49, 16, v32);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(v7);
        }
        [*((id *)v3 + 10) removeObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v29 = [v7 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v29);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (CMCaptureFrameSenderService)init
{
  return [(CMCaptureFrameSenderService *)self initWithEndpointType:@"ApplicationVideo"];
}

- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3
{
  return [(CMCaptureFrameSenderService *)self initWithEndpointType:a3 endpointCameraUniqueID:@"unkown"];
}

- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3 endpointCameraUniqueID:(id)a4
{
  memset(v9, 0, sizeof(v9));
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v9, 32, FigCaptureGetCurrentProcessAuditToken(v9));
  return [(CMCaptureFrameSenderService *)self initWithEndpointType:a3 endpointPID:getpid() endpointProxyPID:0 endpointAuditToken:v7 endpointProxyAuditToken:0 endpointCameraUniqueID:a4];
}

void __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (MEMORY[0x1A62739E0](a2) == MEMORY[0x1E4F14578])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      if (WeakRetained)
      {
        id v5 = WeakRetained;
        [WeakRetained _addConnection:a2];
      }
    }
  }
}

uint64_t __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke_2()
{
  if (FigCaptureCurrentProcessIsCameracaptured()) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = FigCaptureCurrentProcessIsMediaserverd() != 0;
  }
  sRunningInsideCameracaptured = v0;
  return atexit((void (*)(void))cfss_atExitHandler);
}

void __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (dword_1EB4C5310)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v2, "_cleanupSendingPixelBufferMachinery", v4, v5);
  }
}

- (void)dealloc
{
  if (sRunningInsideCameracaptured)
  {
    if (+[CMCaptureFrameSenderEndpointsServerSideSingleton removeEndpointWithUniqueID:self->_endpointUniqueID])
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter"), "postNotificationName:object:", @"FrameServerEndpointsChanged", 0);
    }
  }
  else
  {
    FigCaptureSourceRemoteSuppressFrameSenderServerEndpoint(self->_endpointUniqueID);
  }
  reapSendingPixelTransferSessionTimer = self->_reapSendingPixelTransferSessionTimer;
  if (reapSendingPixelTransferSessionTimer)
  {
    dispatch_source_cancel(reapSendingPixelTransferSessionTimer);

    self->_reapSendingPixelTransferSessionTimer = 0;
  }

  listener = self->_listener;
  if (listener)
  {
    xpc_connection_cancel(listener);
  }
  [(CMCaptureFrameSenderService *)self _cleanupSendingPixelBufferMachinery];
  v5.receiver = self;
  v5.super_class = (Class)CMCaptureFrameSenderService;
  [(CMCaptureFrameSenderService *)&v5 dealloc];
}

- (void)_addConnection:(id)a3
{
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CMCaptureFrameSenderService__addConnection___block_invoke;
  block[3] = &unk_1E5C245A8;
  objc_copyWeak(&v7, &location);
  void block[4] = a3;
  dispatch_async(clientQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__CMCaptureFrameSenderService__addConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [[CMCaptureFrameSenderClient alloc] initWithConnection:*(void *)(a1 + 32) queue:*((void *)WeakRetained + 11)];
    if (v2)
    {
      id v3 = v2;
      [*((id *)WeakRetained + 10) addObject:v2];
    }
  }
}

- (void)_cleanupSendingPixelBufferMachinery
{
  reapSendingPixelTransferSessionTimer = self->_reapSendingPixelTransferSessionTimer;
  if (reapSendingPixelTransferSessionTimer)
  {
    if (dword_1EB4C5310)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      reapSendingPixelTransferSessionTimer = self->_reapSendingPixelTransferSessionTimer;
    }
    dispatch_source_set_timer(reapSendingPixelTransferSessionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  self->_sendingPixelBufferIsAWeirdSize = 0;
  self->_sendingPixelBufferHeight = 0;
  *(void *)&self->_sendingPixelBufferPixelFormatType = 0;
  self->_sendingPixelBufferWidth = 0;
  sendingPixelBufferPool = self->_sendingPixelBufferPool;
  if (sendingPixelBufferPool)
  {
    CFRelease(sendingPixelBufferPool);
    self->_sendingPixelBufferPool = 0;
  }
  sendingSampleBufferFormatDescription = self->_sendingSampleBufferFormatDescription;
  if (sendingSampleBufferFormatDescription)
  {
    CFRelease(sendingSampleBufferFormatDescription);
    self->_sendingSampleBufferFormatDescription = 0;
  }
  sendingPixelTransferSession = self->_sendingPixelTransferSession;
  if (sendingPixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(sendingPixelTransferSession);
    v8 = self->_sendingPixelTransferSession;
    if (v8)
    {
      CFRelease(v8);
      self->_sendingPixelTransferSession = 0;
    }
  }
  sendingPixelRotationSession = self->_sendingPixelRotationSession;
  if (sendingPixelRotationSession)
  {
    VTPixelRotationSessionInvalidate(sendingPixelRotationSession);
    char v10 = self->_sendingPixelRotationSession;
    if (v10)
    {
      CFRelease(v10);
      self->_sendingPixelRotationSession = 0;
    }
  }
}

- (opaqueCMSampleBuffer)_newSampleBufferToSendFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v91[4] = *MEMORY[0x1E4F143B8];
  CMSampleBufferRef sampleBufferOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    CMSampleBufferRef sampleBufferOut = (CMSampleBufferRef)CFRetain(a3);
    goto LABEL_91;
  }
  id v7 = ImageBuffer;
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(v7);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v7);
  int v11 = objc_msgSend((id)CMGetAttachment(a3, @"CrossPlatformRotationDegrees", 0), "intValue");
  int v12 = v11;
  BOOL v13 = self->_sendingPixelBufferWidth != Width
     || self->_sendingPixelBufferHeight != Height
     || self->_sendingPixelBufferPixelFormatType != PixelFormatType
     || self->_crossPlatformRotationDegrees != v11;
  sendingPixelBufferPool = self->_sendingPixelBufferPool;
  if (sendingPixelBufferPool && v13)
  {
    [(CMCaptureFrameSenderService *)self _cleanupSendingPixelBufferMachinery];
    sendingPixelBufferPool = self->_sendingPixelBufferPool;
  }
  dispatch_time_t v15 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (!sendingPixelBufferPool)
  {
    self->_sendingPixelBuffersize_t Width = Width;
    self->_sendingPixelBuffersize_t Height = Height;
    self->_sendingPixelBufferOSType PixelFormatType = PixelFormatType;
    self->_crossPlatformRotationDegrees = v12;
    if (v12 == 270) {
      size_t v16 = Width;
    }
    else {
      size_t v16 = Height;
    }
    if (v12 == 270) {
      size_t v17 = Height;
    }
    else {
      size_t v17 = Width;
    }
    if (v12 == 90)
    {
      size_t v18 = Height;
    }
    else
    {
      size_t Width = v16;
      size_t v18 = v17;
    }
    v90[0] = *MEMORY[0x1E4F24E10];
    v91[0] = [NSNumber numberWithUnsignedLong:v18];
    v90[1] = *MEMORY[0x1E4F24D08];
    v91[1] = [NSNumber numberWithUnsignedLong:Width];
    v90[2] = *MEMORY[0x1E4F24D70];
    uint64_t v19 = [NSNumber numberWithUnsignedInt:self->_sendingPixelBufferPixelFormatType];
    v90[3] = *MEMORY[0x1E4F24D20];
    v91[2] = v19;
    v91[3] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v20 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:4];
    v88[0] = *MEMORY[0x1E4F24D90];
    uint64_t v21 = [NSNumber numberWithInt:self->_sendingPixelBufferPoolSize];
    v88[1] = *MEMORY[0x1E4F24D88];
    v89[0] = v21;
    v89[1] = &unk_1EFAFDC68;
    CVReturn v22 = CVPixelBufferPoolCreate(*v15, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2], v20, &self->_sendingPixelBufferPool);
    if (dword_1EB4C5310)
    {
      int v79 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      dispatch_time_t v15 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
    }
    if (v22)
    {
      LODWORD(v66) = v22;
      goto LABEL_97;
    }
    BOOL v24 = self->_sendingPixelBufferWidth >= 0x4000 && self->_sendingPixelBufferHeight < 0x21;
    self->_sendingPixelBufferIsAWeirdSize = v24;
    if (!v24) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (self->_sendingPixelBufferIsAWeirdSize)
  {
LABEL_30:
    if (dword_1EB4C5310)
    {
      int v79 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
LABEL_32:
  p_sendingPixelTransferSession = &self->_sendingPixelTransferSession;
  if (!self->_sendingPixelTransferSession && !self->_sendingPixelRotationSession)
  {
    CFAllocatorRef v27 = *v15;
    if (self->_crossPlatformRotationDegrees)
    {
      OSStatus v28 = VTPixelRotationSessionCreate(v27, &self->_sendingPixelRotationSession);
      if (v28)
      {
        LODWORD(v66) = v28;
        goto LABEL_97;
      }
      sendingPixelRotationSession = self->_sendingPixelRotationSession;
      CFStringRef v30 = (const __CFString *)*MEMORY[0x1E4F450C0];
      v31 = (const void *)FigCaptureVTRotationFromDegrees(360 - self->_crossPlatformRotationDegrees);
      OSStatus v32 = VTSessionSetProperty(sendingPixelRotationSession, v30, v31);
      if (v32)
      {
        LODWORD(v66) = v32;
LABEL_97:
        FigDebugAssert3();
        [(CMCaptureFrameSenderService *)self _cleanupSendingPixelBufferMachinery];
        goto LABEL_91;
      }
    }
    else
    {
      OSStatus v33 = VTPixelTransferSessionCreate(v27, &self->_sendingPixelTransferSession);
      if (v33)
      {
        LODWORD(v66) = v33;
        goto LABEL_97;
      }
    }
  }
  CFAllocatorRef v34 = *v15;
  if (CVPixelBufferPoolCreatePixelBuffer(*v15, self->_sendingPixelBufferPool, &pixelBufferOut)) {
    goto LABEL_94;
  }
  if (*p_sendingPixelTransferSession)
  {
    if (VTPixelTransferSessionTransferImage(*p_sendingPixelTransferSession, v7, pixelBufferOut)) {
      goto LABEL_94;
    }
  }
  else if (VTPixelRotationSessionRotateImage(self->_sendingPixelRotationSession, v7, pixelBufferOut))
  {
    goto LABEL_94;
  }
  p_sendingSampleBufferFormatDescription = &self->_sendingSampleBufferFormatDescription;
  if (!self->_sendingSampleBufferFormatDescription)
  {
    OSStatus v36 = CMVideoFormatDescriptionCreateForImageBuffer(v34, pixelBufferOut, &self->_sendingSampleBufferFormatDescription);
    if (v36)
    {
      LODWORD(v66) = v36;
      goto LABEL_97;
    }
  }
  CMItemCount timingArrayEntriesNeededOut = 0;
  long long v37 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&timingArrayOut.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&timingArrayOut.decodeTimeStamp.value = v37;
  timingArrayOut.decodeTimeStamp.epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v38 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(_OWORD *)&timingArrayOut.duration.value = *MEMORY[0x1E4F1FA70];
  *(_OWORD *)&timingArrayOut.duration.epoch = v38;
  if (CMSampleBufferGetSampleTimingInfoArray(a3, 1, 0, &timingArrayEntriesNeededOut)
    || timingArrayEntriesNeededOut
    && CMSampleBufferGetSampleTimingInfoArray(a3, timingArrayEntriesNeededOut, &timingArrayOut, &timingArrayEntriesNeededOut))
  {
    goto LABEL_94;
  }
  OSStatus v39 = CMSampleBufferCreateForImageBuffer(v34, pixelBufferOut, 1u, 0, 0, *p_sendingSampleBufferFormatDescription, &timingArrayOut, &sampleBufferOut);
  if (v39 == -12743)
  {
    if (*p_sendingSampleBufferFormatDescription)
    {
      CFRelease(*p_sendingSampleBufferFormatDescription);
      *p_sendingSampleBufferFormatDescription = 0;
    }
    if (CMVideoFormatDescriptionCreateForImageBuffer(v34, pixelBufferOut, &self->_sendingSampleBufferFormatDescription)) {
      goto LABEL_94;
    }
    OSStatus v39 = CMSampleBufferCreateForImageBuffer(v34, pixelBufferOut, 1u, 0, 0, *p_sendingSampleBufferFormatDescription, &timingArrayOut, &sampleBufferOut);
  }
  if (v39)
  {
LABEL_94:
    FigDebugAssert3();
    goto LABEL_91;
  }
  CFStringRef v40 = (const __CFString *)*MEMORY[0x1E4F53070];
  CFTypeRef v41 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CFStringRef key = v40;
  if (v41)
  {
    long long v42 = (void *)v41;
    uint64_t v43 = *MEMORY[0x1E4F54128];
    uint64_t v44 = *MEMORY[0x1E4F53DE0];
    v85[0] = *MEMORY[0x1E4F54128];
    v85[1] = v44;
    uint64_t v68 = v44;
    v45 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      id v48 = 0;
      uint64_t v49 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v75 != v49) {
            objc_enumerationMutation(v45);
          }
          uint64_t v51 = *(void *)(*((void *)&v74 + 1) + 8 * i);
          uint64_t v52 = objc_msgSend(v42, "objectForKeyedSubscript:", v51, v66, v67);
          if (v52)
          {
            uint64_t v53 = v52;
            if (!v48) {
              id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            [v48 setObject:v53 forKeyedSubscript:v51];
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v74 objects:v84 count:16];
      }
      while (v47);
    }
    else
    {
      id v48 = 0;
    }
    v56 = objc_msgSend(v42, "objectForKeyedSubscript:", v43, v66);
    if ([v56 isEqualToString:*MEMORY[0x1E4F52E10]]) {
      char v54 = 1;
    }
    else {
      char v54 = [v56 isEqualToString:*MEMORY[0x1E4F52DF8]];
    }
    BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", v68), "integerValue"));
  }
  else
  {
    id v48 = 0;
    char v54 = 0;
    BOOL IsExtensionDeviceType = 0;
  }
  v83[0] = 0x1EFA56D20;
  v83[1] = @"MirroredVertical";
  v83[2] = @"MirroredHorizontal";
  v57 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v83, 3, v66);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v71;
    char v61 = v54 ^ 1 | IsExtensionDeviceType;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v71 != v60) {
          objc_enumerationMutation(v57);
        }
        v63 = *(__CFString **)(*((void *)&v70 + 1) + 8 * j);
        v64 = (void *)CMGetAttachment(v7, v63, 0);
        if ((v61 & 1) == 0
          && [(__CFString *)v63 isEqualToString:0x1EFA56D20]
          && (FigCaptureCameraRequires180DegreesRotation(1, 0) & 1) == 0)
        {
          v64 = objc_msgSend(NSNumber, "numberWithInt:", FigCaptureNormalizeAngle(objc_msgSend(v64, "intValue") + 180));
        }
        if (v64)
        {
          if (!v48) {
            id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          [v48 setObject:v64 forKeyedSubscript:v63];
        }
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v59);
  }
  if (v48)
  {
    CMSetAttachment(sampleBufferOut, key, v48, 1u);
  }
LABEL_91:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  return sampleBufferOut;
}

@end