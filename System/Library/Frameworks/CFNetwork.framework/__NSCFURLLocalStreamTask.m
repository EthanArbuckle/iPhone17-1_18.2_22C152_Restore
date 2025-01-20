@interface __NSCFURLLocalStreamTask
- (BOOL)_cacheOnly;
- (BOOL)_disallowCellular;
- (BOOL)_goneSecure;
- (BOOL)_onqueue_shufflePendingFor:(uint64_t)a1;
- (NSData)_TCPConnectionMetadata;
- (NSData)_initialDataPayload;
- (NSError)error;
- (NSString)taskDescription;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (NSUUID)_uniqueIdentifier;
- (__CFDictionary)_copySocketStreamProperties;
- (__CFWriteStream)_onqueue_unscheduleStreams;
- (__NSCFURLLocalStreamTask)initWithHost:(id)a3 port:(int64_t)a4 taskGroup:(id)a5 disavow:(id)a6;
- (__NSCFURLLocalStreamTask)initWithNetService:(id)a3 taskGroup:(id)a4 disavow:(id)a5;
- (double)_timeWindowDelay;
- (double)_timeWindowDuration;
- (float)priority;
- (id)_boundInterfaceIdentifier;
- (id)_effectiveConfiguration;
- (id)_initWithExistingTask:(id)a3 disavow:(id)a4;
- (id)_legacySocketStreamProperties;
- (id)description;
- (id)workQueue;
- (int)_allowsCellularOverride;
- (int)_allowsConstrainedOverride;
- (int)_allowsExpensiveOverride;
- (int)_allowsUCAOverride;
- (int)_networkServiceType;
- (int64_t)computeAdjustedPoolPriority;
- (int64_t)countOfBytesClientExpectsToReceive;
- (int64_t)countOfBytesClientExpectsToSend;
- (int64_t)countOfBytesExpectedToReceive;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesReceived;
- (int64_t)countOfBytesSent;
- (int64_t)state;
- (uint64_t)_onqueue_addBlockOpAtHead:(uint64_t)a3 description:;
- (uint64_t)_onqueue_cancel;
- (uint64_t)_onqueue_checkForCompletion;
- (uint64_t)_onqueue_sendSessionChallenge:(void *)a3 completionHandler:;
- (unint64_t)taskIdentifier;
- (void)_initCommonWithGroup:(const void *)a3 disavow:;
- (void)_initWithTaskGroup:(const void *)a3 disavow:;
- (void)_init_setupTimeoutTimer;
- (void)_onSessionQueue_cleanupAndBreakCycles;
- (void)_onSessionQueue_disavow;
- (void)_onqueue_captureStreams;
- (void)_onqueue_closeReadOp;
- (void)_onqueue_closeWriteOp;
- (void)_onqueue_errorOrCancelError;
- (void)_onqueue_ioTick;
- (void)_onqueue_readStream:(const void *)a3 writeStreamAvailable:;
- (void)_onqueue_readStreamEvent:(uint64_t)a3;
- (void)_onqueue_resume;
- (void)_onqueue_scheduleStreams;
- (void)_onqueue_startSecureConnection;
- (void)_onqueue_writeStreamEvent:(uint64_t)a3;
- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4;
- (void)cancel;
- (void)captureStreams;
- (void)closeRead;
- (void)closeWrite;
- (void)copyStreamProperty:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)resume;
- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3;
- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3;
- (void)setCountOfBytesExpectedToReceive:(int64_t)a3;
- (void)setCountOfBytesExpectedToSend:(int64_t)a3;
- (void)setCountOfBytesReceived:(int64_t)a3;
- (void)setCountOfBytesSent:(int64_t)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setError:(id)a3;
- (void)setOriginalRequest:(id)a3;
- (void)setPriority:(float)a3;
- (void)setResponse:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTaskDescription:(id)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
- (void)set_TCPConnectionMetadata:(id)a3;
- (void)set_allowsCellularOverride:(int)a3;
- (void)set_allowsConstrainedOverride:(int)a3;
- (void)set_allowsExpensiveOverride:(int)a3;
- (void)set_allowsUCAOverride:(int)a3;
- (void)set_boundInterfaceIdentifier:(id)a3;
- (void)set_disallowCellular:(BOOL)a3;
- (void)set_initialDataPayload:(id)a3;
- (void)set_legacySocketStreamProperties:(id)a3;
- (void)set_networkServiceType:(int)a3;
- (void)set_timeWindowDelay:(double)a3;
- (void)set_timeWindowDuration:(double)a3;
- (void)startSecureConnection;
- (void)stopSecureConnection;
- (void)suspend;
- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation __NSCFURLLocalStreamTask

- (NSUUID)_uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 1152, 1);
}

- (void)set_initialDataPayload:(id)a3
{
}

- (NSData)_initialDataPayload
{
  return (NSData *)objc_getProperty(self, a2, 1136, 1);
}

- (void)set_TCPConnectionMetadata:(id)a3
{
}

- (NSData)_TCPConnectionMetadata
{
  return (NSData *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (void)setResponse:(id)a3
{
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setCurrentRequest:(id)a3
{
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 992, 1);
}

- (void)setOriginalRequest:(id)a3
{
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 984, 1);
}

- (void)setPriority:(float)a3
{
  self->priority = a3;
}

- (float)priority
{
  return self->priority;
}

- (void)setTaskDescription:(id)a3
{
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 928, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 936, 1);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)_goneSecure
{
  return self->_goneSecure;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (id)_legacySocketStreamProperties
{
  v2 = self->_legacySocketStreamProperties;

  return v2;
}

- (void)set_legacySocketStreamProperties:(id)a3
{
  self->_legacySocketStreamProperties = (NSDictionary *)[a3 copy];
}

- (int)_networkServiceType
{
  return self->_networkServiceType;
}

- (void)set_networkServiceType:(int)a3
{
  self->_networkServiceType = a3;
}

- (int)_allowsCellularOverride
{
  return self->_allowsCellularOverride;
}

- (void)set_allowsCellularOverride:(int)a3
{
  self->_allowsCellularOverride = a3;
}

- (int)_allowsUCAOverride
{
  return self->_allowsUCAOverride;
}

- (void)set_allowsUCAOverride:(int)a3
{
  self->_allowsUCAOverride = a3;
}

- (int)_allowsConstrainedOverride
{
  return self->_allowsConstrainedOverride;
}

- (void)set_allowsConstrainedOverride:(int)a3
{
  self->_allowsConstrainedOverride = a3;
}

- (int)_allowsExpensiveOverride
{
  return self->_allowsExpensiveOverride;
}

- (void)set_allowsExpensiveOverride:(int)a3
{
  self->_allowsExpensiveOverride = a3;
}

- (BOOL)_disallowCellular
{
  return self->_disallowCellular;
}

- (void)set_disallowCellular:(BOOL)a3
{
  self->_disallowCellular = a3;
}

- (id)_boundInterfaceIdentifier
{
  v2 = self->_boundInterfaceIdentifier;

  return v2;
}

- (void)set_boundInterfaceIdentifier:(id)a3
{
  self->_boundInterfaceIdentifier = (NSString *)[a3 copy];
}

- (double)_timeWindowDuration
{
  return self->_timeWindowDuration;
}

- (void)set_timeWindowDuration:(double)a3
{
  self->_timeWindowDuration = a3;
}

- (double)_timeWindowDelay
{
  return self->_timeWindowDelay;
}

- (void)set_timeWindowDelay:(double)a3
{
  self->_timeWindowDelay = a3;
}

- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4
{
}

- (void)_onSessionQueue_cleanupAndBreakCycles
{
  tickerTimeoutTimer = self->_tickerTimeoutTimer;
  if (tickerTimeoutTimer)
  {
    self->_tickerTimeoutTimer = 0;
    dispatch_source_set_timer(tickerTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_cancel(tickerTimeoutTimer);
    dispatch_release(tickerTimeoutTimer);
  }
}

- (void)_onSessionQueue_disavow
{
  disavow = (void (**)(id, __NSCFURLLocalStreamTask *))self->_disavow;
  self->_disavow = 0;
  disavow[2](disavow, self);

  _Block_release(disavow);
}

- (void)copyStreamProperty:(id)a3 completionHandler:(id)a4
{
}

- (void)stopSecureConnection
{
  v3 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48____NSCFURLLocalStreamTask_stopSecureConnection__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onqueue_ioTick
{
  v3 = (unsigned char *)MEMORY[0x1F4188790](a1, a2, a3);
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    if (v3[816])
    {
      v5 = [v3 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43____NSCFURLLocalStreamTask__onqueue_ioTick__block_invoke;
      block[3] = &unk_1E5258228;
      block[4] = v4;
      dispatch_async(v5, block);
      return;
    }
    if ([v3 state] != 1)
    {
      if (*(unsigned char *)(v4 + 816)) {
        __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_ioTick]", "LocalStreamTask.mm", 1700, "_doingWorkOnThisQueue == false");
      }
      *(unsigned char *)(v4 + 816) = 1;
      v6 = *(void **)(v4 + 808);
      *(void *)(v4 + 808) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      int v7 = 0;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v93 objects:v100 count:16];
      if (!v8)
      {
        uint64_t v83 = 0;
        int v82 = 0;
        uint64_t v10 = 0;
        goto LABEL_112;
      }
      uint64_t v83 = 0;
      int v82 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v94;
      CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      *(void *)&long long v9 = 138412546;
      long long v80 = v9;
      while (1)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v94 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v93 + 1) + 8 * v12);
          uint64_t v14 = objc_msgSend((id)v4, "state", v80);
          if (v10 >= 1) {
            goto LABEL_12;
          }
          if (v14 != 1)
          {
            uint64_t v15 = objc_opt_class();
            if (v15 == objc_opt_class())
            {
              if (v13)
              {
                if (*(unsigned char *)(v4 + 832))
                {
                  if (*(void *)(v4 + 792))
                  {
                    *(unsigned char *)(v4 + 832) = 0;
                    if (CFReadStreamHasBytesAvailable(*(CFReadStreamRef *)(v4 + 792)))
                    {
                      CFIndex v16 = CFReadStreamRead(*(CFReadStreamRef *)(v4 + 792), buffer, 0x20000);
                      CFIndex v17 = v16;
                      if (v16)
                      {
                        if (v16 < 0)
                        {
                          *(CFStreamError *)(v4 + 840) = CFReadStreamGetError((CFReadStreamRef)*(void *)(v4 + 792));
                        }
                        else
                        {
                          v18 = *(void **)(v4 + 824);
                          if (v18)
                          {
                            v19 = (void *)[v18 mutableCopy];
                            [v19 appendBytes:buffer length:v17];

                            *(void *)(v4 + 824) = v19;
                          }
                          else
                          {
                            *(void *)(v4 + 824) = (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:buffer length:v17];
                          }
                        }
                      }
                      else
                      {
                        *(unsigned char *)(v4 + 833) = 1;
                      }
                    }
                  }
                }
                unint64_t v31 = [*(id *)(v4 + 824) length];
                unint64_t v32 = v31;
                if (v31 && (v31 >= *(unsigned int *)(v13 + 44) || *(unsigned char *)(v4 + 833)))
                {
                  id v33 = *(id *)(v4 + 824);
                  if (v31 >= *(unsigned int *)(v13 + 48))
                  {
                    id v33 = (id)[*(id *)(v4 + 824) subdataWithRange:0];
                    v37 = objc_msgSend(*(id *)(v4 + 824), "subdataWithRange:", *(unsigned int *)(v13 + 48), v32 - *(unsigned int *)(v13 + 48));

                    id v34 = v37;
                    *(void *)(v4 + 824) = v34;
                  }
                  else
                  {
                    id v34 = 0;
                    *(void *)(v4 + 824) = 0;
                  }
                  if ([v34 length]) {
                    BOOL v38 = 0;
                  }
                  else {
                    BOOL v38 = *(unsigned char *)(v4 + 833) != 0;
                  }
                  objc_msgSend((id)v4, "setCountOfBytesReceived:", objc_msgSend(v33, "length") + objc_msgSend((id)v4, "countOfBytesReceived"));
                  (*(void (**)(void))(*(void *)(v13 + 56) + 16))();
                  if (v38) {
                    -[__NSCFURLLocalStreamTask _onqueue_closeReadOp]((void *)v4);
                  }

                  goto LABEL_84;
                }
                if (*(double *)(v13 + 16) != 0.0 && ![(id)v4 error] && !*(void *)(v4 + 840))
                {
                  BOOL v35 = *(double *)(v13 + 24) == 0.0;
                  double Current = CFAbsoluteTimeGetCurrent();
                  if (v35)
                  {
                    *(double *)(v13 + 24) = Current + *(double *)(v13 + 16);
                  }
                  else if (Current > *(double *)(v13 + 24))
                  {
                    *(void *)(v4 + 840) = 1;
                    *(_DWORD *)(v4 + 848) = 60;
                  }
                }
                if ([(id)v4 error])
                {
LABEL_83:
                  (*(void (**)(void, void, void, uint64_t))(*(void *)(v13 + 56) + 16))(*(void *)(v13 + 56), 0, 0, [(id)v4 error]);
                  -[__NSCFURLLocalStreamTask _onqueue_closeReadOp]((void *)v4);
                }
                else
                {
                  if (!*(unsigned char *)(v4 + 833) || [*(id *)(v4 + 824) length])
                  {
                    if (!*(void *)(v4 + 840) || !*(_DWORD *)(v4 + 848))
                    {
                      HIDWORD(v83) = 1;
                      int v7 = 1;
LABEL_12:
                      [*(id *)(v4 + 808) insertObject:v13 atIndex:v10++];
                      goto LABEL_100;
                    }
                    CFErrorRef CFErrorWithStreamError = __cfnCreateCFErrorWithStreamError(alloc, (int *)(v4 + 840));
                    [(id)v4 setError:CFErrorWithStreamError];
                    if (CFErrorWithStreamError) {
                      CFRelease(CFErrorWithStreamError);
                    }
                    goto LABEL_83;
                  }
                  (*(void (**)(void))(*(void *)(v13 + 56) + 16))();
                  -[__NSCFURLLocalStreamTask _onqueue_closeReadOp]((void *)v4);
                }
              }
LABEL_84:
              int v7 = 0;
              HIDWORD(v83) = 1;
              goto LABEL_100;
            }
            if (v15 == objc_opt_class())
            {
              if (v13)
              {
                uint64_t v20 = *(void *)(v4 + 888);
                if (!v20) {
                  goto LABEL_34;
                }
                *(void *)(v4 + 888) = 0;
                unint64_t v21 = *(void *)(v13 + 56);
                uint64_t v22 = v20 - v21;
                if (v20 >= v21)
                {
                  (*(void (**)(void))(*(void *)(v13 + 64) + 16))();
                  if (v22 > 0)
                  {
                    if (*(void *)(v4 + 888)) {
LABEL_188:
                    }
                      __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_processWriteWork:]", "LocalStreamTask.mm", 1551, "_writeBufferAlreadyWrittenForNextWrite == 0");
                    goto LABEL_45;
                  }
                }
                else
                {
                  *(void *)(v13 + 56) = v21 - v20;
                  if (v20 > 0)
                  {
                    if (*(void *)(v4 + 888)) {
                      goto LABEL_188;
                    }
                    *(void *)(v4 + 888) = v20;
                  }
LABEL_34:
                  if (*(unsigned char *)(v4 + 864) && [*(id *)(v4 + 856) length])
                  {
                    *(unsigned char *)(v4 + 864) = 0;
                    v23 = (const UInt8 *)[*(id *)(v4 + 856) bytes];
                    CFIndex v24 = [*(id *)(v4 + 856) length];
                    CFIndex v25 = CFWriteStreamWrite(*(CFWriteStreamRef *)(v4 + 800), v23, v24);
                    unint64_t v26 = v25;
                    if (!v25)
                    {
                      *(unsigned char *)(v4 + 865) = 1;
                      goto LABEL_72;
                    }
                    if (v25 < 0)
                    {
                      *(CFStreamError *)(v4 + 872) = CFWriteStreamGetError((CFWriteStreamRef)*(void *)(v4 + 800));
                      goto LABEL_72;
                    }
                    v27 = *(void **)(v4 + 856);
                    if (v24 == v26)
                    {

                      id v28 = 0;
                    }
                    else
                    {
                      v39 = objc_msgSend(v27, "subdataWithRange:", v26, v24 - v26);

                      id v28 = v39;
                    }
                    *(void *)(v4 + 856) = v28;
                    objc_msgSend((id)v4, "setCountOfBytesSent:", objc_msgSend((id)v4, "countOfBytesSent") + v26);
                    unint64_t v40 = *(void *)(v13 + 56);
                    uint64_t v22 = v26 - v40;
                    if (v26 < v40)
                    {
                      *(void *)(v13 + 56) = v40 - v26;
                      if (*(void *)(v4 + 888)) {
                        goto LABEL_189;
                      }
                      *(void *)(v4 + 888) = v26;
                      goto LABEL_72;
                    }
                    (*(void (**)(void))(*(void *)(v13 + 64) + 16))();
                    if (v22 >= 1)
                    {
                      if (*(void *)(v4 + 888)) {
LABEL_189:
                      }
                        __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_processWriteWork:]", "LocalStreamTask.mm", 1597, "_writeBufferAlreadyWrittenForNextWrite == 0");
LABEL_45:
                      LODWORD(v83) = 0;
                      *(void *)(v4 + 888) = v22;
LABEL_99:
                      int v82 = 1;
                      goto LABEL_100;
                    }
                  }
                  else
                  {
LABEL_72:
                    if (*(double *)(v13 + 16) != 0.0 && ![(id)v4 error] && !*(void *)(v4 + 872))
                    {
                      BOOL v41 = *(double *)(v13 + 24) == 0.0;
                      double v42 = CFAbsoluteTimeGetCurrent();
                      if (v41)
                      {
                        *(double *)(v13 + 24) = v42 + *(double *)(v13 + 16);
                      }
                      else if (v42 > *(double *)(v13 + 24))
                      {
                        *(void *)(v4 + 872) = 1;
                        *(_DWORD *)(v4 + 880) = 60;
                      }
                    }
                    if (![(id)v4 error])
                    {
                      if (!*(void *)(v4 + 872) || !*(_DWORD *)(v4 + 880))
                      {
                        int v82 = 1;
                        LODWORD(v83) = 1;
                        goto LABEL_12;
                      }
                      CFErrorRef v44 = __cfnCreateCFErrorWithStreamError(alloc, (int *)(v4 + 872));
                      [(id)v4 setError:v44];
                      if (v44) {
                        CFRelease(v44);
                      }
                    }
                    (*(void (**)(void, uint64_t))(*(void *)(v13 + 64) + 16))(*(void *)(v13 + 64), [(id)v4 error]);
                    -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp]((void *)v4);
                  }
                }
              }
              LODWORD(v83) = 0;
              goto LABEL_99;
            }
            if (v15 != objc_opt_class())
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
              {
                uint64_t v30 = objc_opt_class();
                *(_DWORD *)buffer = v80;
                uint64_t v102 = v30;
                __int16 v103 = 2112;
                uint64_t v104 = v13;
                _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "class %@ not  known for %@", buffer, 0x16u);
              }
              goto LABEL_12;
            }
            if (v13)
            {
              uint64_t v29 = *(void *)(v13 + 48);
              if (v29) {
                (*(void (**)(void))(v29 + 16))();
              }
            }
          }
LABEL_100:
          ++v12;
        }
        while (v8 != v12);
        uint64_t v45 = [v6 countByEnumeratingWithState:&v93 objects:v100 count:16];
        uint64_t v8 = v45;
        if (!v45)
        {
          if (v7)
          {
LABEL_114:
            if (((v7 ^ v83) & 1) == 0) {
              __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_ioTick]", "LocalStreamTask.mm", 1759, "readNotCompleted != writeNotCompleted");
            }
            if (v7)
            {
              uint64_t v47 = objc_opt_class();
              BOOL v48 = -[__NSCFURLLocalStreamTask _onqueue_shufflePendingFor:](v4, v47);
            }
            else
            {
              BOOL v48 = 1;
            }
            if (v83)
            {
              uint64_t v49 = objc_opt_class();
              BOOL v48 = -[__NSCFURLLocalStreamTask _onqueue_shufflePendingFor:](v4, v49);
            }
            BOOL v46 = v48;
            goto LABEL_121;
          }
LABEL_112:
          if (v83) {
            goto LABEL_114;
          }
          BOOL v46 = 0;
LABEL_121:

          if (((HIDWORD(v83) | v82) & 1) == 0)
          {
            if (![(id)v4 error])
            {
              if (*(void *)(v4 + 840))
              {
                CFErrorRef v73 = __cfnCreateCFErrorWithStreamError((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (int *)(v4 + 840));
                [(id)v4 setError:v73];
                if (v73) {
                  CFRelease(v73);
                }
              }
            }
            if (![(id)v4 error])
            {
              if (*(void *)(v4 + 872))
              {
                if (*(_DWORD *)(v4 + 880))
                {
                  CFErrorRef v74 = __cfnCreateCFErrorWithStreamError((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (int *)(v4 + 872));
                  [(id)v4 setError:v74];
                  if (v74) {
                    CFRelease(v74);
                  }
                }
              }
            }
            if ([(id)v4 error] || *(unsigned char *)(v4 + 833)) {
              -[__NSCFURLLocalStreamTask _onqueue_closeReadOp]((void *)v4);
            }
            if ([(id)v4 error] || *(unsigned char *)(v4 + 865)) {
              -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp]((void *)v4);
            }
            if (*(_DWORD *)(v4 + 776) != 1) {
              -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](v4);
            }
          }
          if ([*(id *)(v4 + 768) count])
          {
            v50 = *(void **)(v4 + 768);
            *(void *)(v4 + 768) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
            long long v89 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            uint64_t v51 = [v50 countByEnumeratingWithState:&v89 objects:v99 count:16];
            if (v51)
            {
              uint64_t v52 = *(void *)v90;
              do
              {
                for (uint64_t i = 0; i != v51; ++i)
                {
                  if (*(void *)v90 != v52) {
                    objc_enumerationMutation(v50);
                  }
                  uint64_t v54 = *(void *)(*((void *)&v89 + 1) + 8 * i);
                  if (v54)
                  {
                    uint64_t v55 = *(void *)(v54 + 48);
                    if (v55) {
                      (*(void (**)(void))(v55 + 16))();
                    }
                  }
                }
                uint64_t v51 = [v50 countByEnumeratingWithState:&v89 objects:v99 count:16];
              }
              while (v51);
            }
          }
          *(unsigned char *)(v4 + 816) = 0;
          uint64_t v56 = [*(id *)(v4 + 808) count];
          if (v10) {
            int v57 = v46;
          }
          else {
            int v57 = 1;
          }
          if (v56) {
            BOOL v58 = v57 == 0;
          }
          else {
            BOOL v58 = 1;
          }
          if (!v58 && *(int *)(v4 + 776) >= 2)
          {
            v59 = [(id)v4 workQueue];
            v88[0] = MEMORY[0x1E4F143A8];
            v88[1] = 3221225472;
            v88[2] = __43____NSCFURLLocalStreamTask__onqueue_ioTick__block_invoke_49;
            v88[3] = &unk_1E5258228;
            v88[4] = v4;
            dispatch_async(v59, v88);
          }
          if (*(unsigned char *)(v4 + 1120) && [(id)v4 state] != 1)
          {
            *(unsigned char *)(v4 + 1120) = 0;
            uint64_t v60 = *(void *)(v4 + 704);
            if (!v60) {
              uint64_t v60 = *(void *)(v4 + 696);
            }
            -[__NSCFURLSessionDelegateWrapper betterRouteDiscoveredForStreamTask:](v60, (void *)v4);
          }
          if (*(void *)(v4 + 968))
          {
            long long v86 = 0u;
            long long v87 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            v61 = *(void **)(v4 + 808);
            uint64_t v62 = [v61 countByEnumeratingWithState:&v84 objects:v98 count:16];
            if (!v62) {
              goto LABEL_175;
            }
            uint64_t v63 = *(void *)v85;
            double v64 = 0.0;
            do
            {
              for (uint64_t j = 0; j != v62; ++j)
              {
                if (*(void *)v85 != v63) {
                  objc_enumerationMutation(v61);
                }
                uint64_t v66 = *(void *)(*((void *)&v84 + 1) + 8 * j);
                double v67 = *(double *)(v66 + 24);
                if ((v67 < v64 || v64 == 0.0) && v67 > 0.0) {
                  double v64 = *(double *)(v66 + 24);
                }
              }
              uint64_t v62 = [v61 countByEnumeratingWithState:&v84 objects:v98 count:16];
            }
            while (v62);
            if (v64 != 0.0)
            {
              double v75 = v64 - CFAbsoluteTimeGetCurrent();
              v76 = *(NSObject **)(v4 + 968);
              double v77 = v75 * 1000000000.0;
              BOOL v78 = v75 < 0.0;
              double v79 = 0.0;
              if (!v78) {
                double v79 = v77;
              }
              dispatch_time_t v71 = dispatch_time(0x8000000000000000, (uint64_t)v79);
              v70 = v76;
              uint64_t v72 = 1000000000;
            }
            else
            {
LABEL_175:
              v70 = *(NSObject **)(v4 + 968);
              dispatch_time_t v71 = -1;
              uint64_t v72 = 0;
            }
            dispatch_source_set_timer(v70, v71, 0xFFFFFFFFFFFFFFFFLL, v72);
          }
          return;
        }
      }
    }
  }
}

- (BOOL)_onqueue_shufflePendingFor:(uint64_t)a1
{
  v3 = *(void **)(a1 + 808);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55____NSCFURLLocalStreamTask__onqueue_shufflePendingFor___block_invoke;
  v10[3] = &unk_1E5257418;
  v10[4] = a2;
  uint64_t v4 = [v3 indexOfObjectPassingTest:v10];
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = (id)[*(id *)(a1 + 808) objectAtIndex:v4];
    [*(id *)(a1 + 808) removeObjectAtIndex:v5];
    [*(id *)(a1 + 808) insertObject:v7 atIndex:0];
  }
  return v5 != 0x7FFFFFFFFFFFFFFFLL && v5 != 0;
}

- (void)_onqueue_closeReadOp
{
  if (a1)
  {
    v2 = (void *)a1[103];
    if (v2)
    {
      a1[103] = 0;
      id v3 = v2;
    }
    uint64_t v4 = (__CFReadStream *)a1[99];
    if (v4)
    {
      a1[99] = 0;
      CFReadStreamSetProperty(v4, (CFStreamPropertyKey)&unk_1EC09F398, 0);
      CFReadStreamSetClient(v4, 0, 0, 0);
      MEMORY[0x185319F20](v4, 0);
      CFReadStreamClose(v4);
      CFRelease(v4);
      uint64_t v5 = a1[88];
      if (!v5) {
        uint64_t v5 = a1[87];
      }
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __48____NSCFURLLocalStreamTask__onqueue_closeReadOp__block_invoke;
      v6[3] = &unk_1E5258228;
      v6[4] = a1;
      -[__NSCFURLSessionDelegateWrapper readClosedForStreamTask:completionHandler:](v5, a1, v6);
    }
  }
}

- (void)_onqueue_closeWriteOp
{
  if (a1)
  {
    v2 = (__CFWriteStream *)a1[100];
    if (v2)
    {
      a1[100] = 0;
      CFWriteStreamSetClient(v2, 0, 0, 0);
      MEMORY[0x18531A970](v2, 0);
      CFWriteStreamClose(v2);
      CFRelease(v2);
      uint64_t v3 = a1[88];
      if (!v3) {
        uint64_t v3 = a1[87];
      }
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __49____NSCFURLLocalStreamTask__onqueue_closeWriteOp__block_invoke;
      v4[3] = &unk_1E5258228;
      v4[4] = a1;
      -[__NSCFURLSessionDelegateWrapper writeClosedForStreamTask:completionHandler:](v3, a1, v4);
    }
  }
}

- (uint64_t)_onqueue_checkForCompletion
{
  if (result)
  {
    uint64_t v1 = result;
    result = [(id)result state];
    if (result <= 2 && (!*(void *)(v1 + 792) && !*(void *)(v1 + 800) || *(int *)(v1 + 776) <= 0))
    {
      if ([(id)v1 state] <= 1) {
        [(id)v1 setState:2];
      }
      uint64_t v2 = *(void *)(v1 + 760);
      if (v2) {
        (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
      }
      -[NSURLSession _onqueue_didCompleteTask:withError:]([(id)v1 session], (void *)v1, *(void **)(v1 + 936));
      -[__NSURLSessionLocal removeUnresumedTask:]([(id)v1 session], v1);
      [(id)v1 setState:3];
      return -[__NSCFURLLocalStreamTask _onqueue_ioTick](v1);
    }
  }
  return result;
}

- (void)startSecureConnection
{
  uint64_t v3 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49____NSCFURLLocalStreamTask_startSecureConnection__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onqueue_startSecureConnection
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(void *)(a1 + 792) || *(void *)(a1 + 800))
    {
      if ([(id)a1 state] <= 1)
      {
        long long v9 = &unk_1EC0A1778;
        v10[0] = *MEMORY[0x1E4F1CFC8];
        uint64_t v4 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
        uint64_t v5 = *(__CFReadStream **)(a1 + 792);
        if (v5) {
          CFReadStreamSetProperty(v5, @"kCFStreamPropertySSLSettings", v4);
        }
        else {
          CFWriteStreamSetProperty(*(CFWriteStreamRef *)(a1 + 800), @"kCFStreamPropertySSLSettings", v4);
        }
        if (*(unsigned char *)(a1 + 864)) {
          *(unsigned char *)(a1 + 864) = 0;
        }
        if (*(unsigned char *)(a1 + 832)) {
          *(unsigned char *)(a1 + 832) = 0;
        }
        *(unsigned char *)(a1 + 960) = 1;
      }
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58____NSCFURLLocalStreamTask__onqueue_startSecureConnection__block_invoke;
      v8[3] = &unk_1E5258228;
      v8[4] = a1;
      BOOL v6 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v8, (uint64_t)"jumping back once we have streams");
      id v7 = *(void **)(a1 + 904);
      if (!v7)
      {
        id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
        *(void *)(a1 + 904) = v7;
      }
      [v7 addObject:v6];
    }
    [(__NSCFURLLocalStreamTask *)a1 _onqueue_ioTick];
  }
}

- (void)closeRead
{
  uint64_t v3 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37____NSCFURLLocalStreamTask_closeRead__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)closeWrite
{
  uint64_t v3 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38____NSCFURLLocalStreamTask_closeWrite__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)captureStreams
{
  uint64_t v3 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42____NSCFURLLocalStreamTask_captureStreams__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
}

- (uint64_t)_onqueue_cancel
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(unsigned char *)(result + 1144))
    {
      *(unsigned char *)(result + 1144) = 1;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __43____NSCFURLLocalStreamTask__onqueue_cancel__block_invoke;
      v4[3] = &unk_1E5258228;
      v4[4] = result;
      -[__NSCFURLLocalStreamTask _onqueue_addBlockOpAtHead:description:](result, v4, (uint64_t)"cancel");
      [(__NSCFURLLocalStreamTask *)v1 _onqueue_ioTick];
      return -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](v1);
    }
  }
  return result;
}

- (void)_onqueue_captureStreams
{
  if (a1)
  {
    if (*((void *)a1 + 99) || *((void *)a1 + 100))
    {
      -[__NSCFURLLocalStreamTask _onqueue_unscheduleStreams](a1);
      uint64_t v2 = (__CFReadStream *)*((void *)a1 + 99);
      *((void *)a1 + 99) = 0;
      if (v2) {
        CFReadStreamSetProperty(v2, (CFStreamPropertyKey)&unk_1EC09F398, 0);
      }
      uint64_t v3 = (void *)*((void *)a1 + 100);
      *((void *)a1 + 100) = 0;
      [(__CFWriteStream *)a1 setState:3];
      uint64_t v4 = *((void *)a1 + 88);
      if (!v4) {
        uint64_t v4 = *((void *)a1 + 87);
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51____NSCFURLLocalStreamTask__onqueue_captureStreams__block_invoke_2;
      v7[3] = &unk_1E52582F0;
      v7[4] = a1;
      v7[5] = v2;
      v7[6] = v3;
      -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:](v4, a1, v2, v3, v7);
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51____NSCFURLLocalStreamTask__onqueue_captureStreams__block_invoke;
      v8[3] = &unk_1E5258228;
      v8[4] = a1;
      uint64_t v5 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v8, (uint64_t)"captureStreams");
      BOOL v6 = (void *)*((void *)a1 + 113);
      if (!v6)
      {
        BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
        *((void *)a1 + 113) = v6;
      }
      [v6 addObject:v5];
    }
  }
}

- (__CFWriteStream)_onqueue_unscheduleStreams
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (__CFReadStream *)*((void *)result + 99);
    if (v2)
    {
      CFReadStreamSetClient(v2, 0, 0, 0);
      MEMORY[0x185319F20](*((void *)v1 + 99), 0);
    }
    result = (__CFWriteStream *)*((void *)v1 + 100);
    if (result)
    {
      CFWriteStreamSetClient(result, 0, 0, 0);
      JUMPOUT(0x18531A970);
    }
  }
  return result;
}

- (uint64_t)_onqueue_addBlockOpAtHead:(uint64_t)a3 description:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v11 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, a2, a3);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = *(void **)(v3 + 808);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        unint64_t v10 = v7 + v6;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            unint64_t v10 = v7 + v9;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        unint64_t v7 = v10;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }
LABEL_13:
    if (v10 > [*(id *)(v3 + 808) count]) {
      __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_addBlockOpAtHead:description:]", "LocalStreamTask.mm", 2048, "i <= [_pendingWork count]");
    }
    return [*(id *)(v3 + 808) insertObject:v11 atIndex:v10];
  }
  return result;
}

- (void)_onqueue_errorOrCancelError
{
  if (result)
  {
    uint64_t v1 = result;
    if (![result error]) {
      objc_msgSend(v1, "setError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F289A0], -999, 0));
    }
    return (void *)[v1 error];
  }
  return result;
}

- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  uint64_t v9 = [(__NSCFURLLocalStreamTask *)self workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke;
  v10[3] = &unk_1E52573A0;
  void v10[5] = a3;
  v10[6] = a5;
  v10[4] = self;
  *(double *)&v10[7] = a4;
  dispatch_async(v9, v10);
}

- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  if (a4 <= a3) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = a4;
  }
  uint64_t v11 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84____NSCFURLLocalStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
  block[3] = &unk_1E5257350;
  block[6] = a3;
  block[7] = v10;
  *(double *)&block[8] = a5;
  block[4] = self;
  void block[5] = a6;
  dispatch_async(v11, block);
}

- (void)cancel
{
  uint64_t v3 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34____NSCFURLLocalStreamTask_cancel__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onqueue_resume
{
  if ([(__NSCFURLLocalStreamTask *)self state] == 1)
  {
    [(__NSCFURLLocalStreamTask *)self setState:0];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __43____NSCFURLLocalStreamTask__onqueue_resume__block_invoke;
    v3[3] = &unk_1E5258228;
    v3[4] = self;
    -[__NSCFURLLocalStreamTask _onqueue_addBlockOpAtHead:description:]((uint64_t)self, v3, (uint64_t)"resume");
  }
}

- (void)_onqueue_scheduleStreams
{
  if (result)
  {
    uint64_t v1 = result;
    clientContext.version = 0;
    clientContext.info = result;
    clientContext.retain = _rr_retain;
    clientContext.release = _rr_release;
    clientContext.copyDescription = (CFStringRef (__cdecl *)(void *))MEMORY[0x1E4F1C220];
    uint64_t v2 = (__CFReadStream *)result[99];
    if (v2)
    {
      CFReadStreamSetClient(v2, 0x1BuLL, (CFReadStreamClientCallBack)_onqueue_readStreamEvent, &clientContext);
      MEMORY[0x185319F20](v1[99], [v1 workQueue]);
    }
    result = (void *)v1[100];
    if (result)
    {
      CFWriteStreamSetClient((CFWriteStreamRef)result, 0x1DuLL, (CFWriteStreamClientCallBack)_onqueue_writeStreamEvent, &clientContext);
      return (void *)MEMORY[0x18531A970](v1[100], [v1 workQueue]);
    }
  }
  return result;
}

- (void)_onqueue_writeStreamEvent:(uint64_t)a3
{
  if (!a1 || !*(void *)(a1 + 800)) {
    return;
  }
  if (*(_DWORD *)(a1 + 776) == 1) {
    *(_DWORD *)(a1 + 776) = 2;
  }
  switch(a2)
  {
    case 16:
      uint64_t v4 = 865;
      goto LABEL_11;
    case 8:
      CFStreamError Error = CFWriteStreamGetError((CFWriteStreamRef)*(void *)(a1 + 800));
      a2 = *(CFIndex *)&Error.error;
      *(CFStreamError *)(a1 + 872) = Error;
      break;
    case 4:
      uint64_t v4 = 864;
LABEL_11:
      *(unsigned char *)(a1 + v4) = 1;
      break;
  }

  [(__NSCFURLLocalStreamTask *)a1 _onqueue_ioTick];
}

- (void)_onqueue_readStreamEvent:(uint64_t)a3
{
  if (!a1 || !*(void *)(a1 + 792)) {
    return;
  }
  if (*(_DWORD *)(a1 + 776) == 1) {
    *(_DWORD *)(a1 + 776) = 2;
  }
  switch(a2)
  {
    case 16:
      uint64_t v4 = 833;
      goto LABEL_11;
    case 8:
      CFStreamError Error = CFReadStreamGetError((CFReadStreamRef)*(void *)(a1 + 792));
      a2 = *(CFIndex *)&Error.error;
      *(CFStreamError *)(a1 + 840) = Error;
      break;
    case 2:
      uint64_t v4 = 832;
LABEL_11:
      *(unsigned char *)(a1 + v4) = 1;
      break;
  }

  [(__NSCFURLLocalStreamTask *)a1 _onqueue_ioTick];
}

- (void)resume
{
  uint64_t v3 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34____NSCFURLLocalStreamTask_resume__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
  uint64_t v4 = [(__NSCFURLLocalStreamTask *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34____NSCFURLLocalStreamTask_resume__block_invoke_2;
  v5[3] = &unk_1E5258228;
  v5[4] = self;
  dispatch_async(v4, v5);
}

- (void)suspend
{
  uint64_t v3 = [(__NSCFURLLocalStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35____NSCFURLLocalStreamTask_suspend__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
  uint64_t v4 = [(__NSCFURLLocalStreamTask *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35____NSCFURLLocalStreamTask_suspend__block_invoke_3;
  v5[3] = &unk_1E5258228;
  v5[4] = self;
  dispatch_async(v4, v5);
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_pendingWork];
  uint64_t v20 = NSString;
  uint64_t v19 = objc_opt_class();
  unint64_t v4 = [(__NSCFURLLocalStreamTask *)self state];
  if (v4 > 3) {
    uint64_t v5 = "UNKNOWN";
  }
  else {
    uint64_t v5 = off_1E52574A0[v4];
  }
  v18 = v5;
  uint64_t v17 = [v3 count];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        long long v12 = NSString;
        uint64_t v13 = objc_opt_class();
        if (v11) {
          uint64_t v14 = *(void *)(v11 + 8);
        }
        else {
          uint64_t v14 = 0;
        }
        [v6 addObject:objc_msgSend(v12, "stringWithFormat:", @"%@(%s)", v13, v14)];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v8 = v15;
    }
    while (v15);
  }
  return (id)[v20 stringWithFormat:@"<%@%p state %s, pending %d { %@ }>", v19, self, v18, v17, objc_msgSend(v6, "componentsJoinedByString:", @", ")];
}

- (__CFDictionary)_copySocketStreamProperties
{
  id v3 = (void *)[(__NSURLSessionTaskGroupForConfiguration *)[(NSURLSessionTask *)self _taskGroup] _groupConfiguration];
  CFDictionaryRef v4 = (const __CFDictionary *)[v3 _socketStreamProperties];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v4) {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v4);
  }
  else {
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v7 = MutableCopy;
  key = &unk_1EC0A0978;
  CFDictionaryAddValue(MutableCopy, &unk_1EC0A0978, (const void *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "allowsExpensiveNetworkAccess")));
  BOOL v41 = &unk_1EC0A0940;
  CFDictionaryAddValue(v7, &unk_1EC0A0940, (const void *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "allowsConstrainedNetworkAccess")));
  double v42 = &unk_1EC09F280;
  CFDictionaryAddValue(v7, &unk_1EC09F280, (const void *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "_allowsUCA")));
  CFDictionaryAddValue(v7, &unk_1EC09F2B8, (const void *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "_allowsVirtualInterfaces")));
  if ([v3 _multipathAlternatePort]) {
    CFDictionaryAddValue(v7, &unk_1EC09EC98, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "_multipathAlternatePort", &unk_1EC0A0978, &unk_1EC0A0940, 0x1EC09F280)));
  }
  if (objc_msgSend(v3, "_TCPAdaptiveReadTimeout", key)) {
    CFDictionaryAddValue(v7, &unk_1EC09FEC0, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "_TCPAdaptiveReadTimeout")));
  }
  if ([v3 _TCPAdaptiveWriteTimeout]) {
    CFDictionaryAddValue(v7, &unk_1EC09FEF8, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "_TCPAdaptiveWriteTimeout")));
  }
  int v8 = [v3 _allowsPowerNapScheduling];
  uint64_t v9 = (const void **)MEMORY[0x1E4F1CFD0];
  if (v8) {
    CFDictionaryAddValue(v7, &unk_1EC0A0EF0, (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  if ([v3 _tcpConnectionPoolName])
  {
    CFDictionaryAddValue(v7, &unk_1EC09F408, (const void *)[v3 _tcpConnectionPoolName]);
    CFDictionaryAddValue(v7, &unk_1EC09F440, (const void *)objc_msgSend(NSNumber, "numberWithLongLong:", -[__NSCFURLLocalStreamTask computeAdjustedPoolPriority](self, "computeAdjustedPoolPriority")));
  }
  if ([v3 _sourceApplicationBundleIdentifier]) {
    CFDictionaryAddValue(v7, &unk_1EC0A1190, (const void *)[v3 _sourceApplicationBundleIdentifier]);
  }
  if ([v3 _sourceApplicationSecondaryIdentifier]) {
    CFDictionaryAddValue(v7, &unk_1EC0A0908, (const void *)[v3 _sourceApplicationSecondaryIdentifier]);
  }
  if ([v3 _sourceApplicationAuditTokenData]) {
    CFDictionaryAddValue(v7, &unk_1EC0A1158, (const void *)[v3 _sourceApplicationAuditTokenData]);
  }
  if ([v3 _preventsIdleSleepOnceConnected]) {
    CFDictionaryAddValue(v7, &unk_1EC09EE20, *v9);
  }
  if ([v3 _forcesNewConnections]) {
    CFDictionaryAddValue(v7, @"uniqueTaskIdentifier", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__NSCFURLLocalStreamTask taskIdentifier](self, "taskIdentifier")));
  }
  if (([v3 allowsCellularAccess] & 1) == 0) {
    CFDictionarySetValue(v7, &unk_1EC0A0E48, *v9);
  }
  if ([v3 shouldUseExtendedBackgroundIdleMode]) {
    CFDictionarySetValue(v7, &unk_1EC0A0F60, *v9);
  }
  if ([v3 _allowsMultipathTCP]) {
    CFDictionarySetValue(v7, &unk_1EC0A0CC0, *v9);
  }
  if ([v3 _allowsResponseMonitoringDuringBodyTranmission]) {
    CFDictionarySetValue(v7, &unk_1EC0A3490, *v9);
  }
  if (([v3 waitsForConnectivity] & 1) != 0
    || [v3 _allowsIndefiniteConnections])
  {
    CFDictionarySetValue(v7, &unk_1EC0A0CF8, *v9);
  }
  if ([v3 _CTDataConnectionServiceType]) {
    CFDictionarySetValue(v7, &unk_1EC0A0BE0, (const void *)[v3 _CTDataConnectionServiceType]);
  }
  if ([v3 _allowsTCPFastOpen]) {
    CFDictionarySetValue(v7, &unk_1EC09F130, *v9);
  }
  if ([v3 _allowsTLSSessionTickets]) {
    CFDictionarySetValue(v7, &unk_1EC09F0F8, *v9);
  }
  char v10 = [v3 _allowsTLSSessionResumption];
  uint64_t v11 = (const void **)MEMORY[0x1E4F1CFC8];
  if ((v10 & 1) == 0) {
    CFDictionarySetValue(v7, &unk_1EC09F0C0, (const void *)*MEMORY[0x1E4F1CFC8]);
  }
  if ([v3 _tlsTrustPinningPolicyName]) {
    CFDictionarySetValue(v7, &unk_1EC09FE50, (const void *)[v3 _tlsTrustPinningPolicyName]);
  }
  if ([v3 _allowsTLSECH]) {
    CFDictionarySetValue(v7, &unk_1EC09F168, *v9);
  }
  if ([v3 _customReadBufferSize]) {
    CFDictionarySetValue(v7, &unk_1EC09FB08, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "_customReadBufferSize")));
  }
  [v3 _customReadBufferTimeout];
  if (v12 > 0.0)
  {
    uint64_t v13 = NSNumber;
    [v3 _customReadBufferTimeout];
    CFDictionarySetValue(v7, &unk_1EC09FB40, (const void *)objc_msgSend(v13, "numberWithDouble:"));
  }
  if ([(__NSCFURLLocalStreamTask *)self _boundInterfaceIdentifier]) {
    CFDictionaryAddValue(v7, &unk_1EC0A0A20, [(__NSCFURLLocalStreamTask *)self _boundInterfaceIdentifier]);
  }
  if ([(__NSCFURLLocalStreamTask *)self _allowsCellularOverride])
  {
    if ([(__NSCFURLLocalStreamTask *)self _allowsCellularOverride] == 2) {
      uint64_t v14 = v9;
    }
    else {
      uint64_t v14 = v11;
    }
    CFDictionarySetValue(v7, &unk_1EC0A0E48, *v14);
  }
  if ([(__NSCFURLLocalStreamTask *)self _disallowCellular]) {
    CFDictionarySetValue(v7, &unk_1EC0A0E48, *v9);
  }
  if ([(__NSCFURLLocalStreamTask *)self _allowsExpensiveOverride])
  {
    if ([(__NSCFURLLocalStreamTask *)self _allowsExpensiveOverride] == 1) {
      uint64_t v15 = v9;
    }
    else {
      uint64_t v15 = v11;
    }
    CFDictionarySetValue(v7, keya, *v15);
  }
  if ([(__NSCFURLLocalStreamTask *)self _allowsConstrainedOverride])
  {
    if ([(__NSCFURLLocalStreamTask *)self _allowsConstrainedOverride] == 1) {
      CFIndex v16 = v9;
    }
    else {
      CFIndex v16 = v11;
    }
    CFDictionarySetValue(v7, v41, *v16);
  }
  if ([(__NSCFURLLocalStreamTask *)self _allowsUCAOverride])
  {
    if ([(__NSCFURLLocalStreamTask *)self _allowsUCAOverride] == 1) {
      uint64_t v17 = v9;
    }
    else {
      uint64_t v17 = v11;
    }
    CFDictionarySetValue(v7, v42, *v17);
  }
  uint64_t v18 = [v3 _forcedNetworkServiceType];
  if (!v18) {
    LODWORD(v18) = [(__NSCFURLLocalStreamTask *)self _networkServiceType];
  }
  if (v18)
  {
    NetworkServiceTypeString = (const void *)ClassicURLConnection::getNetworkServiceTypeString(v18);
    CFDictionarySetValue(v7, &unk_1EC0A0668, NetworkServiceTypeString);
  }
  if ([(NSURLRequest *)[(__NSCFURLLocalStreamTask *)self currentRequest] _requiresShortConnectionTimeout])
  {
    uint64_t valuePtr = 0x4024000000000000;
    CFNumberRef v20 = CFNumberCreate(v5, kCFNumberDoubleType, &valuePtr);
    if (v20)
    {
      CFNumberRef v21 = v20;
      CFDictionarySetValue(v7, &unk_1EC09E6B0, v20);
      CFRelease(v21);
    }
  }
  if (self)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v7, &unk_1EC0A0A58);
    if (Value) {
      CFDictionaryRef Mutable = CFDictionaryCreateMutableCopy(v5, 0, Value);
    }
    else {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    CFDictionaryRef v24 = Mutable;
    if (Mutable
      && !CFDictionaryGetValue(Mutable, @"kConditionalConnectionIdentifier")
      && CFDictionaryGetValue(v24, @"kConditionalConnectionLaunchOnDemand")
      && (v37 = [(__NSCFURLLocalStreamTask *)self currentRequest]) != 0
      && (CFURLRef v38 = [(NSURLRequest *)v37 URL]) != 0)
    {
      CFStringRef v25 = CFURLGetString(v38);
    }
    else
    {
      CFStringRef v25 = 0;
    }
    [(__NSCFURLLocalStreamTask *)self _timeWindowDelay];
    uint64_t valuePtr = v26;
    [(__NSCFURLLocalStreamTask *)self _timeWindowDuration];
    double v44 = v27;
    if (v27 == 0.0)
    {
LABEL_97:
      if (v25) {
        CFDictionarySetValue(v24, @"kConditionalConnectionIdentifier", v25);
      }
      if (objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_requiresPowerPluggedIn"))CFDictionarySetValue(v24, @"kConditionalConnectionRequirementPowerPluggedIn", *v9); {
      if (v24)
      }
      {
        if (CFDictionaryGetCount(v24)) {
          CFDictionarySetValue(v7, &unk_1EC0A0A58, v24);
        }
        CFRelease(v24);
      }
      goto LABEL_105;
    }
    CFNumberRef v28 = CFNumberCreate(v5, kCFNumberDoubleType, &valuePtr);
    CFNumberRef v29 = CFNumberCreate(v5, kCFNumberDoubleType, &v44);
    CFNumberRef v30 = v29;
    if (v28 && v29)
    {
      CFDictionarySetValue(v24, @"kConditionalConnectionRequirementTimeWindowDelay", v28);
      CFDictionarySetValue(v24, @"kConditionalConnectionRequirementTimeWindowDuration", v30);
      unint64_t v31 = (void *)MEMORY[0x1E4F1C9C8];
      [(NSURLSessionTask *)self startTime];
      double v33 = v32;
      [(__NSCFURLLocalStreamTask *)self _timeWindowDelay];
      CFDictionarySetValue(v24, @"kConditionalConnectionRequirementTimeWindowStartTime", (const void *)[v31 dateWithTimeIntervalSinceReferenceDate:(double)(60 * ((unint64_t)(v33 + v34) / 0x3C))]);
    }
    else if (!v28)
    {
      goto LABEL_95;
    }
    CFRelease(v28);
LABEL_95:
    if (v30) {
      CFRelease(v30);
    }
    goto LABEL_97;
  }
LABEL_105:
  if ([(__NSCFURLLocalStreamTask *)self _legacySocketStreamProperties])
  {
    id v35 = [(__NSCFURLLocalStreamTask *)self _legacySocketStreamProperties];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __55____NSCFURLLocalStreamTask__copySocketStreamProperties__block_invoke;
    v43[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v43[4] = v7;
    [v35 enumerateKeysAndObjectsUsingBlock:v43];
  }
  return v7;
}

- (BOOL)_cacheOnly
{
  return 0;
}

- (int64_t)computeAdjustedPoolPriority
{
  double v3 = (double)[(NSURLSessionTask *)self _priorityValue];
  [(NSURLSessionTask *)self _loadingPriorityValue];
  return (uint64_t)(v3 + (0.5 - v4) * 50.0);
}

- (void)dealloc
{
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)[(NSURLSessionTask *)self session], (uint64_t)self);
  workQueueForStreamTask = self->_workQueueForStreamTask;
  if (workQueueForStreamTask)
  {
    dispatch_release(workQueueForStreamTask);
    self->_workQueueForStreamTask = 0;
  }
  socketStreamClient = self->_socketStreamClient;
  if (socketStreamClient)
  {
    (*((void (**)(BaseSocketStreamClient *))socketStreamClient->var0 + 1))(socketStreamClient);
    self->_socketStreamClient = 0;
  }
  readStream = self->_readStream;
  self->_readStream = 0;
  if (readStream) {
    CFRelease(readStream);
  }
  writeStream = self->_writeStream;
  self->_writeStream = 0;
  if (writeStream) {
    CFRelease(writeStream);
  }

  id disavow = self->_disavow;
  if (disavow)
  {
    _Block_release(disavow);
    self->_id disavow = 0;
  }
  [(__NSCFURLLocalStreamTask *)self setOriginalRequest:0];
  [(__NSCFURLLocalStreamTask *)self setCurrentRequest:0];
  [(__NSCFURLLocalStreamTask *)self setResponse:0];

  self->_uniqueIdentifier = 0;
  v8.receiver = self;
  v8.super_class = (Class)__NSCFURLLocalStreamTask;
  [(NSURLSessionTask *)&v8 dealloc];
}

- (id)workQueue
{
  id result = self->_workQueueForStreamTask;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)__NSCFURLLocalStreamTask;
    return [(NSURLSessionTask *)&v4 workQueue];
  }
  return result;
}

- (__NSCFURLLocalStreamTask)initWithNetService:(id)a3 taskGroup:(id)a4 disavow:(id)a5
{
  uint64_t v6 = (__NSCFURLLocalStreamTask *)-[__NSCFURLLocalStreamTask _initWithTaskGroup:disavow:](self, (uint64_t)a4, a5);
  uint64_t v7 = v6;
  if (v6) {
    (*((void (**)(BaseSocketStreamClient *, id))v6->_socketStreamClient->var0 + 3))(v6->_socketStreamClient, a3);
  }
  return v7;
}

- (void)_initWithTaskGroup:(const void *)a3 disavow:
{
  if (!a1) {
    return 0;
  }
  double v3 = -[__NSCFURLLocalStreamTask _initCommonWithGroup:disavow:](a1, a2, a3);
  if (v3)
  {
    objc_super v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3[98] = dispatch_queue_create("com.apple.NSURLSession.streamTask_work", v4);
    *((_DWORD *)v3 + 194) = 0;
    operator new();
  }
  return v3;
}

- (void)_initCommonWithGroup:(const void *)a3 disavow:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)__NSCFURLLocalStreamTask;
  objc_super v4 = objc_msgSendSuper2(&v8, sel_initWithTaskGroup_, a2);
  CFAllocatorRef v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setTaskIdentifier:", objc_msgSend((id)objc_msgSend(v4, "session"), "nextSeed"));
    [v5 setState:1];
    v5[144] = (id)[MEMORY[0x1E4F29128] UUID];
    v5[101] = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    v5[96] = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    v5[112] = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    v5[113] = 0;
    v5[122] = _Block_copy(a3);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v5[132] = v6;
  }
  return v5;
}

- (void)_init_setupTimeoutTimer
{
  uint64_t v2 = [(dispatch_source_t *)a1 workQueue];
  a1[121] = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v2);
  objc_initWeak(&location, a1);
  double v3 = a1[121];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51____NSCFURLLocalStreamTask__init_setupTimeoutTimer__block_invoke;
  v4[3] = &unk_1E5258100;
  objc_copyWeak(&v5, &location);
  dispatch_source_set_event_handler(v3, v4);
  dispatch_source_set_timer(a1[121], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(a1[121]);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_onqueue_readStream:(const void *)a3 writeStreamAvailable:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (*(_OWORD *)(a1 + 792) != 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "should only have gotten here once as a SocketStream client", buf, 2u);
    if (cf) {
      goto LABEL_5;
    }
LABEL_7:
    CFTypeRef v6 = 0;
    goto LABEL_8;
  }
  if (!cf) {
    goto LABEL_7;
  }
LABEL_5:
  CFTypeRef v6 = CFRetain(cf);
LABEL_8:
  *(void *)(a1 + 792) = v6;
  if (a3) {
    CFTypeRef v7 = CFRetain(a3);
  }
  else {
    CFTypeRef v7 = 0;
  }
  *(void *)(a1 + 800) = v7;
  uint64_t v8 = *(void *)(a1 + 704);
  if ((v8 || (uint64_t v8 = *(void *)(a1 + 696)) != 0)
    && (([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)v8 check_betterRouteDiscovered] & 1) != 0
     || [(__NSCFURLSessionDelegateWrapper *)*(unsigned __int8 **)(v8 + 24) check_betterRouteDiscovered]))
  {
    propertyValue[0] = MEMORY[0x1E4F143A8];
    propertyValue[1] = 3221225472;
    propertyValue[2] = __69____NSCFURLLocalStreamTask__onqueue_readStream_writeStreamAvailable___block_invoke;
    propertyValue[3] = &unk_1E5258228;
    propertyValue[4] = a1;
    CFReadStreamSetProperty((CFReadStreamRef)cf, (CFStreamPropertyKey)&unk_1EC09F398, propertyValue);
  }
  if (!*(unsigned char *)(a1 + 866))
  {
    *(unsigned char *)(a1 + 866) = 1;
    if (!*(_DWORD *)(a1 + 848)
      && !*(_DWORD *)(a1 + 880)
      && CFReadStreamGetStatus(*(CFReadStreamRef *)(a1 + 792)) != kCFStreamStatusError
      && CFWriteStreamGetStatus(*(CFWriteStreamRef *)(a1 + 800)) != kCFStreamStatusError)
    {
      uint64_t v10 = *(void *)(a1 + 704);
      if (!v10) {
        uint64_t v10 = *(void *)(a1 + 696);
      }
      -[__NSCFURLSessionDelegateWrapper _connectionEstablishedForStreamTask:](v10, (void *)a1);
    }
  }
  uint64_t v11 = *(void **)(a1 + 904);
  if (v11)
  {
    *(void *)(a1 + 904) = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          if (v15)
          {
            uint64_t v16 = *(void *)(v15 + 48);
            if (v16) {
              (*(void (**)(void))(v16 + 16))();
            }
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v12);
    }
  }
  if (*(void *)(a1 + 792) && *(void *)(a1 + 800))
  {
    -[__NSCFURLLocalStreamTask _onqueue_scheduleStreams]((void *)a1);
    CFStreamStatus Status = CFReadStreamGetStatus(*(CFReadStreamRef *)(a1 + 792));
    uint64_t v18 = *(__CFReadStream **)(a1 + 792);
    if (Status <= kCFStreamStatusNotOpen)
    {
      CFReadStreamOpen(v18);
    }
    else
    {
      CFStreamError Error = CFReadStreamGetError(v18);
      if (Error.domain && Error.error)
      {
        uint64_t v21 = 8;
      }
      else if (CFReadStreamHasBytesAvailable(*(CFReadStreamRef *)(a1 + 792)))
      {
        uint64_t v21 = 2;
      }
      else
      {
        uint64_t v21 = 1;
      }
      [(__NSCFURLLocalStreamTask *)a1 _onqueue_readStreamEvent:v19];
    }
    CFStreamStatus v22 = CFWriteStreamGetStatus(*(CFWriteStreamRef *)(a1 + 800));
    long long v23 = *(__CFWriteStream **)(a1 + 800);
    if (v22 <= kCFStreamStatusNotOpen)
    {
      CFWriteStreamOpen(v23);
    }
    else
    {
      CFStreamError v25 = CFWriteStreamGetError(v23);
      if (v25.domain && v25.error)
      {
        uint64_t v26 = 8;
      }
      else if (CFWriteStreamCanAcceptBytes(*(CFWriteStreamRef *)(a1 + 800)))
      {
        uint64_t v26 = 4;
      }
      else
      {
        uint64_t v26 = 1;
      }
      [(__NSCFURLLocalStreamTask *)a1 _onqueue_writeStreamEvent:v24];
    }
  }
}

- (uint64_t)_onqueue_sendSessionChallenge:(void *)a3 completionHandler:
{
  if (a1)
  {
    uint64_t v6 = a1[88];
    if (!v6) {
      uint64_t v6 = a1[87];
    }
    int v8 = [(__NSCFURLSessionDelegateWrapper *)v6 sessionDidReceiveChallenge];
    uint64_t v9 = a1[88];
    if (v9)
    {
      if (!v8)
      {
LABEL_9:
        if ([(__NSCFURLSessionDelegateWrapper *)v9 didReceiveChallenge])
        {
          uint64_t v10 = a1[88];
          if (!v10) {
            uint64_t v10 = a1[87];
          }
          goto LABEL_12;
        }
        return 0;
      }
    }
    else
    {
      uint64_t v9 = a1[87];
      if ((v8 & 1) == 0) {
        goto LABEL_9;
      }
    }
LABEL_8:
    -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:](v9, a2, a3);
    return 1;
  }
  char v13 = [(__NSCFURLSessionDelegateWrapper *)0 sessionDidReceiveChallenge];
  uint64_t v9 = 0;
  if (v13) {
    goto LABEL_8;
  }
  char v14 = [(__NSCFURLSessionDelegateWrapper *)0 didReceiveChallenge];
  uint64_t v10 = 0;
  if (v14)
  {
LABEL_12:
    -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v10, a1, a2, a3);
    return 1;
  }
  return 0;
}

- (__NSCFURLLocalStreamTask)initWithHost:(id)a3 port:(int64_t)a4 taskGroup:(id)a5 disavow:(id)a6
{
  int v8 = (__NSCFURLLocalStreamTask *)-[__NSCFURLLocalStreamTask _initWithTaskGroup:disavow:](self, (uint64_t)a5, a6);
  uint64_t v9 = v8;
  if (v8) {
    (*((void (**)(BaseSocketStreamClient *, id, int64_t))v8->_socketStreamClient->var0 + 2))(v8->_socketStreamClient, a3, a4);
  }
  return v9;
}

- (id)_initWithExistingTask:(id)a3 disavow:(id)a4
{
  id v5 = -[__NSCFURLLocalStreamTask _initCommonWithGroup:disavow:](self, [a3 _taskGroup], a4);
  if (v5)
  {
    uint64_t v6 = [a3 workQueue];
    v5[98] = v6;
    dispatch_retain(v6);
    *((_DWORD *)v5 + 194) = 0;
    operator new();
  }
  return 0;
}

- (id)_effectiveConfiguration
{
  uint64_t v2 = [(NSURLSessionTask *)self _taskGroup];

  return (id)[(__NSURLSessionTaskGroupForConfiguration *)v2 _groupConfiguration];
}

@end