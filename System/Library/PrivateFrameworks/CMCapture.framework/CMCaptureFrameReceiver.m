@interface CMCaptureFrameReceiver
+ (NSDictionary)availableFrameSenderEndpointsByPID;
+ (void)initialize;
- (CMCaptureFrameReceiver)initWithFrameSenderServerEndpoint:(id)a3 frameReceiverHandler:(id)a4;
- (NSData)endpointAuditToken;
- (NSData)endpointProxyAuditToken;
- (NSString)endpointUniqueID;
- (int)endpointPID;
- (int)endpointProxyPID;
- (void)dealloc;
@end

@implementation CMCaptureFrameReceiver

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (NSDictionary)availableFrameSenderEndpointsByPID
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = a1;
  if (availableFrameSenderEndpointsByPID_initFrameSenderEndpoints != -1) {
    dispatch_once(&availableFrameSenderEndpointsByPID_initFrameSenderEndpoints, block);
  }
  if (!availableFrameSenderEndpointsByPID_sIsEntitledToReceiveFrames) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
  v2 = (NSDictionary *)(id)[(id)availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPID copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
  return v2;
}

void __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke(uint64_t a1)
{
  availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPID = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v2)
  {
    v3 = v2;
    CFBooleanRef v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, @"com.apple.private.cmcapture.frame-receiver", 0);
    if (v4)
    {
      CFBooleanRef v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFBooleanGetTypeID()) {
        availableFrameSenderEndpointsByPID_sIsEntitledToReceiveFrames = CFBooleanGetValue(v5) != 0;
      }
      CFRelease(v5);
    }
    CFRelease(v3);
  }
  if (availableFrameSenderEndpointsByPID_sIsEntitledToReceiveFrames)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke_2;
    v7[3] = &unk_1E5C24480;
    v7[4] = *(void *)(a1 + 32);
    availableFrameSenderEndpointsByPID_sFrameSenderEndpointObserver = [[CMCaptureFrameSenderEndpointObserver alloc] initWithEndpointsChangedHandler:v7];
  }
}

void __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke_3;
  v3[3] = &unk_1E5C24458;
  uint64_t v2 = *(void *)(a1 + 32);
  v3[4] = a2;
  v3[5] = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = (id)[*(id *)(a1 + 32) allKeys];
  uint64_t v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v17)
  {
    uint64_t v15 = *(void *)v23;
    v16 = v2;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        CFBooleanRef v5 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          id v8 = 0;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v5);
              }
              v11 = [[CMCaptureFrameSenderEndpoint alloc] initWithDictionary:*(void *)(*((void *)&v18 + 1) + 8 * j)];
              if (v11)
              {
                v12 = v11;
                if (!v8) {
                  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                [v8 addObject:v12];
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v7);
        }
        else
        {
          id v8 = 0;
        }
        id v2 = v16;
        if (v16)
        {
          [v16 setObject:v8 forKeyedSubscript:v4];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v17);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
  char v13 = [v2 isEqual:availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPID];
  os_unfair_lock_unlock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
  if ((v13 & 1) == 0)
  {
    [*(id *)(a1 + 40) willChangeValueForKey:@"availableFrameSenderEndpointsByPID"];
    os_unfair_lock_lock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);

    availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPID = [v2 copy];
    os_unfair_lock_unlock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
    [*(id *)(a1 + 40) didChangeValueForKey:@"availableFrameSenderEndpointsByPID"];
  }
}

- (CMCaptureFrameReceiver)initWithFrameSenderServerEndpoint:(id)a3 frameReceiverHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 endpoint];
  id v8 = 0;
  if (a4)
  {
    if (v7)
    {
      v30.receiver = self;
      v30.super_class = (Class)CMCaptureFrameReceiver;
      id v8 = [(CMCaptureFrameReceiver *)&v30 init];
      if (v8)
      {
        xpc_connection_t v9 = xpc_connection_create_from_endpoint((xpc_endpoint_t)[a3 endpoint]);
        v10 = v9;
        if (v9)
        {
          v8->_connection = v9;
          v8->_endpointUniqueID = (NSString *)(id)[a3 endpointUniqueID];
          v8->_endpointAuditToken = (NSData *)(id)[a3 endpointAuditToken];
          v8->_endpointProxyAuditToken = (NSData *)(id)[a3 endpointProxyAuditToken];
          v8->_frameReceiverHandler = (id)[a4 copy];
          v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v12 = dispatch_queue_create("com.apple.cmio.frame-capture-receiver", v11);
          v8->_queue = (OS_dispatch_queue *)v12;
          v8->_connectionIsValid = 1;
          xpc_connection_set_target_queue(v8->_connection, v12);
          pid_t v13 = getpid();
          objc_initWeak(&location, v8);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __81__CMCaptureFrameReceiver_initWithFrameSenderServerEndpoint_frameReceiverHandler___block_invoke;
          handler[3] = &unk_1E5C244A8;
          objc_copyWeak(&v28, &location);
          handler[4] = v10;
          xpc_connection_set_event_handler(v10, handler);
          xpc_connection_activate(v8->_connection);
          v8->_endpointPID = [a3 endpointPID];
          if (dword_1E96B6C08)
          {
            unsigned int v26 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_string(v15, "call", "Ping");
          connection = v8->_connection;
          queue = v8->_queue;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __81__CMCaptureFrameReceiver_initWithFrameSenderServerEndpoint_frameReceiverHandler___block_invoke_104;
          v22[3] = &unk_1E5C244D0;
          objc_copyWeak(&v23, &location);
          pid_t v24 = v13;
          v22[4] = v8;
          xpc_connection_send_message_with_reply(connection, v15, queue, v22);
          xpc_release(v15);
          objc_destroyWeak(&v23);
          if (dword_1E96B6C08)
          {
            unsigned int v26 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            long long v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v19 = v26;
            if (os_log_type_enabled(v18, type)) {
              unsigned int v20 = v19;
            }
            else {
              unsigned int v20 = v19 & 0xFFFFFFFE;
            }
            if (v20)
            {
              int v31 = 136315651;
              v32 = "-[CMCaptureFrameReceiver initWithFrameSenderServerEndpoint:frameReceiverHandler:]";
              __int16 v33 = 1025;
              pid_t v34 = v13;
              __int16 v35 = 2112;
              v36 = v8;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_destroyWeak(&v28);
          objc_destroyWeak(&location);
        }
        else
        {

          return 0;
        }
      }
    }
  }
  return v8;
}

void __81__CMCaptureFrameReceiver_initWithFrameSenderServerEndpoint_frameReceiverHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MEMORY[0x1A62739E0](a2);
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  if (v5 != MEMORY[0x1E4F145A8])
  {
    if (v5 != MEMORY[0x1E4F14590]) {
      goto LABEL_53;
    }
    string = xpc_dictionary_get_string(a2, "call");
    if (!string || strncmp("frame-output-notification", string, 0x19uLL)) {
      goto LABEL_53;
    }
    xpc_object_t value = xpc_dictionary_get_value(a2, "sample-buffer");
    if (!value) {
      goto LABEL_46;
    }
    id v8 = value;
    CMSampleBufferRef sbuf = 0;
    CMBlockBufferRef blockBufferOut = 0;
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    CVPixelBufferRef pixelBufferOut = 0;
    CMSampleBufferRef sampleBufferOut = 0;
    xpc_object_t v9 = xpc_dictionary_get_value(value, "sample-buffer-basic-fields");
    if (v9)
    {
      v10 = v9;
      bytes_ptr = (void *)xpc_data_get_bytes_ptr(v9);
      if (bytes_ptr)
      {
        size_t length = xpc_data_get_length(v10);
        HIDWORD(customBlockSource.AllocateBlock) = 0;
        *(void *)&customBlockSource.version = 0;
        customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))cfr_bbufUtilXPCObjectReleaser;
        customBlockSource.refCon = v10;
        CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        OSStatus v14 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes_ptr, length, 0, &customBlockSource, 0, length, 0, &blockBufferOut);
        if (v14)
        {
          LODWORD(bytes_ptr) = v14;
        }
        else
        {
          xpc_retain(v10);
          int SampleBufferFromSerializedAtomDataBlockBuffer = FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer();
          if (!SampleBufferFromSerializedAtomDataBlockBuffer)
          {
            xpc_object_t v16 = xpc_dictionary_get_value(v8, "sample-buffer-iosurface");
            if (v16)
            {
              uint64_t v17 = IOSurfaceLookupFromXPCObject(v16);
              if (!v17)
              {
                FigDebugAssert3();
                LODWORD(bytes_ptr) = 0;
                goto LABEL_33;
              }
              CVReturn v18 = CVPixelBufferCreateWithIOSurface(v13, v17, 0, &pixelBufferOut);
              if (v18)
              {
                LODWORD(bytes_ptr) = v18;
              }
              else
              {
                OSStatus v19 = CMVideoFormatDescriptionCreateForImageBuffer(v13, pixelBufferOut, &formatDescriptionOut);
                if (v19)
                {
                  LODWORD(bytes_ptr) = v19;
                }
                else
                {
                  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
                  OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(sbuf, 1, &timingArrayOut, 0);
                  if (SampleTimingInfoArray)
                  {
                    LODWORD(bytes_ptr) = SampleTimingInfoArray;
                  }
                  else
                  {
                    LODWORD(bytes_ptr) = CMSampleBufferCreateForImageBuffer(v13, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, &timingArrayOut, &sampleBufferOut);
                    if (!bytes_ptr)
                    {
                      CMPropagateAttachments(sbuf, sampleBufferOut);
                      CFRelease(sbuf);
                      CMSampleBufferRef sbuf = sampleBufferOut;
                      CMSampleBufferRef sampleBufferOut = 0;
LABEL_33:
                      if (blockBufferOut) {
                        CFRelease(blockBufferOut);
                      }
                      if (v17) {
                        CFRelease(v17);
                      }
                      goto LABEL_37;
                    }
                  }
                }
              }
              FigDebugAssert3();
              goto LABEL_33;
            }
            LODWORD(bytes_ptr) = 0;
LABEL_32:
            uint64_t v17 = 0;
            goto LABEL_33;
          }
          LODWORD(bytes_ptr) = SampleBufferFromSerializedAtomDataBlockBuffer;
        }
        FigDebugAssert3();
        goto LABEL_32;
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      LODWORD(bytes_ptr) = 0;
    }
LABEL_37:
    if (pixelBufferOut) {
      CFRelease(pixelBufferOut);
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    if (sampleBufferOut) {
      CFRelease(sampleBufferOut);
    }
    CMSampleBufferRef v24 = sbuf;
    if (!bytes_ptr)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      xpc_object_t v25 = reply;
      if (v24)
      {
        xpc_dictionary_set_int64(reply, "errorReturn", 0);
        int v26 = 1;
LABEL_48:
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v25);
        xpc_release(v25);
        if (WeakRetained && v26) {
          (*(void (**)(void, CMSampleBufferRef))(WeakRetained[2] + 16))(WeakRetained[2], v24);
        }
        if (v24) {
          CFRelease(v24);
        }
        goto LABEL_53;
      }
LABEL_47:
      xpc_dictionary_set_int64(v25, "errorReturn", -50);
      int v26 = 0;
      CMSampleBufferRef v24 = 0;
      goto LABEL_48;
    }
    if (sbuf) {
      CFRelease(sbuf);
    }
LABEL_46:
    xpc_object_t v25 = xpc_dictionary_create_reply(a2);
    goto LABEL_47;
  }
  if (a2 == (void *)MEMORY[0x1E4F14528])
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    if (!WeakRetained) {
      goto LABEL_53;
    }
    if (*((unsigned char *)WeakRetained + 64))
    {
      if (dword_1E96B6C08)
      {
        LODWORD(blockBufferOut) = 0;
        LOBYTE(sbuf) = 0;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      *((unsigned char *)WeakRetained + 64) = 0;
      (*(void (**)(void, void))(WeakRetained[2] + 16))(WeakRetained[2], 0);
    }
  }
  BOOL v21 = a2 != (void *)MEMORY[0x1E4F14520] || WeakRetained == 0;
  if (!v21 && *((unsigned char *)WeakRetained + 64))
  {
    if (dword_1E96B6C08)
    {
      LODWORD(blockBufferOut) = 0;
      LOBYTE(sbuf) = 0;
      long long v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    *((unsigned char *)WeakRetained + 64) = 0;
    (*(void (**)(void, void))(WeakRetained[2] + 16))(WeakRetained[2], 0);
  }
LABEL_53:
}

void __81__CMCaptureFrameReceiver_initWithFrameSenderServerEndpoint_frameReceiverHandler___block_invoke_104(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = (xpc_connection_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (dword_1E96B6C08)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (WeakRetained)
  {
    if (a2 && MEMORY[0x1A62739E0](a2) != MEMORY[0x1E4F145A8])
    {
      pid_t pid = xpc_connection_get_pid(WeakRetained[3]);
      pid_t v7 = *((_DWORD *)WeakRetained + 10) == pid ? 0 : pid;
      if (*((_DWORD *)WeakRetained + 11) != v7)
      {
        [(xpc_connection_t *)WeakRetained willChangeValueForKey:@"endpointProxyPID"];
        if (dword_1E96B6C08)
        {
          id v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *((_DWORD *)WeakRetained + 11) = v7;
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", @"endpointProxyPID", v9, v10);
      }
    }
  }
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
  }
  dispatch_release((dispatch_object_t)self->_queue);

  v4.receiver = self;
  v4.super_class = (Class)CMCaptureFrameReceiver;
  [(CMCaptureFrameReceiver *)&v4 dealloc];
}

- (NSString)endpointUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int)endpointPID
{
  return self->_endpointPID;
}

- (int)endpointProxyPID
{
  return self->_endpointProxyPID;
}

- (NSData)endpointAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)endpointProxyAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

@end