@interface MMCSHTTPContext
- (BOOL)createNewRequestBodyInputStream;
- (BOOL)didOpen;
- (BOOL)isHandlingError;
- (BOOL)isTaskDone;
- (BOOL)isValid;
- (BOOL)requestBodyCanAcceptData;
- (BOOL)requestIsStreamed;
- (MMCSHTTPContext)initWithContext:(mmcs_http_context *)a3 options:(const mmcs_http_context_options *)a4 activityMarker:(os_activity_s *)a5;
- (NSDictionary)timingData;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (NSString)description;
- (NSURLSession)urlSession;
- (NSURLSessionDataTask)dataTask;
- (__CFError)send;
- (int64_t)containerType;
- (int64_t)countOfRequestBodyBytesSent;
- (int64_t)writeRequestBody:(const char *)a3 maxLength:(unint64_t)a4;
- (mmcs_http_context)hc;
- (os_activity_s)activityMarker;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)cleanupResponse;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateStreamPair;
- (void)requestBodyDone;
- (void)setActivityMarker:(os_activity_s *)a3;
- (void)setContainerType:(int64_t)a3;
- (void)setDataTask:(id)a3;
- (void)setDidOpen:(BOOL)a3;
- (void)setHc:(mmcs_http_context *)a3;
- (void)setInputStream:(id)a3;
- (void)setIsHandlingError:(BOOL)a3;
- (void)setIsTaskDone:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setOutputStream:(id)a3;
- (void)setRequestIsStreamed:(BOOL)a3;
- (void)setTimingData:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation MMCSHTTPContext

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self hc][584], &state);
  v7 = self;
  id v8 = [(MMCSHTTPContext *)v7 outputStream];
  if (v8 == v6 && ![(MMCSHTTPContext *)v7 isTaskDone])
  {
    BOOL v12 = [(MMCSHTTPContext *)v7 isValid];

    if (!v12) {
      goto LABEL_4;
    }
    if ((uint64_t)a4 > 7)
    {
      if (a4 == 8)
      {
        v28 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [v6 streamError];
          CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ stream %@ error %@", v7, v6, v29);

          v31 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            CFStringRef v45 = v30;
            _os_log_impl(&dword_1DC1CA000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
          if (v30) {
            CFRelease(v30);
          }
        }
        v32 = NSString;
        v33 = [v6 streamError];
        v34 = [v32 stringWithFormat:@"Write stream had error:%@", v33];

        v35 = (void *)[v6 streamError];
        error_with_underlying_error = mmcs_cferror_create_error_with_underlying_error(@"com.apple.mmcs", 38, v35, @"%@", v36, v37, v38, v39, (char)v34);
        mmcs_http_context_set_error((uint64_t)[(MMCSHTTPContext *)v7 hc], error_with_underlying_error);
        if (error_with_underlying_error) {
          CFRelease(error_with_underlying_error);
        }
        v41 = [(MMCSHTTPContext *)v7 outputStream];
        [v41 close];

        if (!(void)[(MMCSHTTPContext *)v7 hc][496]) {
          __assert_rtn("-[MMCSHTTPContext stream:handleEvent:]", "MMCSHTTPContext.m", 138, "self.hc->requestBodyCallback");
        }
        ((void (*)(mmcs_http_context *, void, uint64_t))[(MMCSHTTPContext *)v7 hc][496])([(MMCSHTTPContext *)v7 hc], (void)[(MMCSHTTPContext *)v7 hc][576], 3);

        goto LABEL_9;
      }
      if (a4 != 16) {
        goto LABEL_33;
      }
      if (gMMCS_DebugLevel >= 4)
      {
        v16 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ stream %@ ended", v7, v6);
          v18 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            CFStringRef v45 = v17;
            _os_log_impl(&dword_1DC1CA000, v18, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }
          if (v17) {
            CFRelease(v17);
          }
        }
      }
      if (!(void)[(MMCSHTTPContext *)v7 hc][496])
      {
        int v42 = 148;
        goto LABEL_59;
      }
      v19 = (void (*)(uint64_t, void, uint64_t))[(MMCSHTTPContext *)v7 hc][496];
      uint64_t v20 = [(MMCSHTTPContext *)v7 hc];
      uint64_t v21 = [(MMCSHTTPContext *)v7 hc];
      uint64_t v22 = 4;
    }
    else
    {
      if (a4 != 1)
      {
        if (a4 == 4)
        {
          if (gMMCS_DebugLevel >= 5)
          {
            v13 = mmcs_logging_logger_default();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ stream %@ has space available", v7, v6);
              v15 = mmcs_logging_logger_default();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                CFStringRef v45 = v14;
                _os_log_impl(&dword_1DC1CA000, v15, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
              }
              if (v14) {
                CFRelease(v14);
              }
            }
          }
          if ((void)[(MMCSHTTPContext *)v7 hc][496])
          {
            ((void (*)(mmcs_http_context *, void, uint64_t))[(MMCSHTTPContext *)v7 hc][496])([(MMCSHTTPContext *)v7 hc], (void)[(MMCSHTTPContext *)v7 hc][576], 2);
            if (![(MMCSHTTPContext *)v7 isTaskDone]) {
              [(MMCSHTTPContext *)v7 isValid];
            }
            goto LABEL_9;
          }
          int v42 = 121;
LABEL_59:
          __assert_rtn("-[MMCSHTTPContext stream:handleEvent:]", "MMCSHTTPContext.m", v42, "self.hc->requestBodyCallback");
        }
LABEL_33:
        v23 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ ignoring stream event %u from stream %@", v7, a4, v6);
          v24 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            CFStringRef v45 = v10;
            _os_log_impl(&dword_1DC1CA000, v24, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
          if (v10) {
            goto LABEL_8;
          }
        }
        goto LABEL_9;
      }
      if (gMMCS_DebugLevel >= 4)
      {
        v25 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ stream %@ opened", v7, v6);
          v27 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            CFStringRef v45 = v26;
            _os_log_impl(&dword_1DC1CA000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }
          if (v26) {
            CFRelease(v26);
          }
        }
      }
      if (!(void)[(MMCSHTTPContext *)v7 hc][496])
      {
        int v42 = 113;
        goto LABEL_59;
      }
      v19 = (void (*)(uint64_t, void, uint64_t))[(MMCSHTTPContext *)v7 hc][496];
      uint64_t v20 = [(MMCSHTTPContext *)v7 hc];
      uint64_t v21 = [(MMCSHTTPContext *)v7 hc];
      uint64_t v22 = 1;
    }
    v19(v20, *(void *)(v21 + 576), v22);
    goto LABEL_9;
  }

LABEL_4:
  v9 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ ignoring stream event %u from stream %@", v7, a4, v6);
    v11 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v45 = v10;
      _os_log_impl(&dword_1DC1CA000, v11, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    if (v10) {
LABEL_8:
    }
      CFRelease(v10);
  }
LABEL_9:

  os_activity_scope_leave(&state);
}

- (int64_t)writeRequestBody:(const char *)a3 maxLength:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  v7 = [(MMCSHTTPContext *)v6 outputStream];
  BOOL v8 = [(MMCSHTTPContext *)v6 isHandlingError];
  objc_sync_exit(v6);

  if (v7) {
    char v9 = v8;
  }
  else {
    char v9 = 1;
  }
  if (v9)
  {
    CFStringRef v10 = mmcs_logging_logger_default();
    if (v7)
    {
      if (!v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ not writing to output stream for unknown reason; attempted to write %lu bytes.",
                  v6,
                  a4);
          uint64_t v20 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            CFStringRef v24 = v11;
            _os_log_impl(&dword_1DC1CA000, v20, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
          int64_t v15 = -1;
          if (v11) {
            goto LABEL_30;
          }
        }
        else
        {
          int64_t v15 = -1;
        }
        goto LABEL_31;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ writing 0 bytes because request cannot accept data at the moment.", v6);
        BOOL v12 = mmcs_logging_logger_default();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_29;
        }
        *(_DWORD *)buf = 138543362;
        CFStringRef v24 = v11;
        v13 = v12;
        os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
        goto LABEL_28;
      }
LABEL_17:
      int64_t v15 = 0;
      goto LABEL_31;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ output stream is nil; attempted to write %lu bytes.",
            v6,
            a4);
    v19 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v24 = v11;
LABEL_27:
    v13 = v19;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_28:
    _os_log_impl(&dword_1DC1CA000, v13, v14, "%{public}@", buf, 0xCu);
    goto LABEL_29;
  }
  int64_t v15 = [v7 write:a3 maxLength:a4];
  if (v15 != -1) {
    goto LABEL_31;
  }
  v16 = mmcs_logging_logger_default();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
  unint64_t v17 = [v7 streamStatus];
  if (v17 > 7) {
    v18 = @"none";
  }
  else {
    v18 = off_1E6C33980[v17];
  }
  uint64_t v21 = [v7 streamError];
  CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ output stream %@ had an error writing in state %@: stream error %@: Ignoring this, and treating this as if the stream cannot accept data at the moment", v6, v7, v18, v21);

  v19 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v24 = v11;
    goto LABEL_27;
  }
LABEL_29:
  int64_t v15 = 0;
  if (v11) {
LABEL_30:
  }
    CFRelease(v11);
LABEL_31:

  return v15;
}

- (void)requestBodyDone
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(MMCSHTTPContext *)self outputStream];

  if (v3)
  {
    id v7 = [(MMCSHTTPContext *)self outputStream];
    [v7 close];
  }
  else
  {
    v4 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ has no output stream to close.", self);
      id v6 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v9 = v5;
        _os_log_impl(&dword_1DC1CA000, v6, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      if (v5) {
        CFRelease(v5);
      }
    }
  }
}

- (NSString)description
{
  v3 = NSString;
  if ([(MMCSHTTPContext *)self isValid]) {
    v4 = "valid";
  }
  else {
    v4 = "invalid";
  }
  if ([(MMCSHTTPContext *)self isTaskDone]) {
    CFStringRef v5 = "done";
  }
  else {
    CFStringRef v5 = "undone";
  }
  return (NSString *)[v3 stringWithFormat:@"%s %s %@", v4, v5, MMCSRequestOptionsDiscretionaryNetworkBehaviorGetString(*(void *)((void)-[MMCSHTTPContext hc](self, "hc")[368]+ 88))];
}

- (void)invalidateStreamPair
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v17 = [(MMCSHTTPContext *)self inputStream];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CFStringRef v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  id v11 = [(MMCSHTTPContext *)self outputStream];
  if (v13[5] || v7[5])
  {
    v3 = [(MMCSHTTPContext *)self outputStream];
    [v3 setDelegate:0];

    v4 = [(MMCSHTTPContext *)self outputStream];
    [v4 close];

    [(MMCSHTTPContext *)self setOutputStream:0];
    [(MMCSHTTPContext *)self setInputStream:0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__MMCSHTTPContext_invalidateStreamPair__block_invoke;
    v5[3] = &unk_1E6C33848;
    v5[4] = &v12;
    v5[5] = &v6;
    HttpContextPerformBlockAsync(self, v5);
  }
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

void __39__MMCSHTTPContext_invalidateStreamPair__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (BOOL)requestBodyCanAcceptData
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = [(MMCSHTTPContext *)v2 outputStream];

  if (v3)
  {
    uint64_t v4 = [(MMCSHTTPContext *)v2 outputStream];
    int v5 = [v4 hasSpaceAvailable];

    if (v5) {
      LODWORD(v3) = ![(MMCSHTTPContext *)v2 isHandlingError];
    }
    else {
      LODWORD(v3) = 0;
    }
  }
  objc_sync_exit(v2);

  if (gMMCS_DebugLevel >= 5)
  {
    uint64_t v6 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = @"NO";
      if (v3) {
        id v7 = @"YES";
      }
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ canAcceptData %@", v2, v7);
      CFStringRef v9 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v12 = v8;
        _os_log_impl(&dword_1DC1CA000, v9, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v8) {
        CFRelease(v8);
      }
    }
  }
  return (char)v3;
}

- (int64_t)countOfRequestBodyBytesSent
{
  uint64_t v2 = [(MMCSHTTPContext *)self dataTask];
  int64_t v3 = [v2 countOfBytesSent];

  return v3;
}

- (BOOL)createNewRequestBodyInputStream
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (gMMCS_DebugLevel >= 4)
  {
    int64_t v3 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"createNewRequestBodyInputStream %@", self);
      int v5 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v16 = v4;
        _os_log_impl(&dword_1DC1CA000, v5, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v4) {
        CFRelease(v4);
      }
    }
  }
  [(MMCSHTTPContext *)self invalidateStreamPair];
  mmcs_http_reset_context_for_new_stream((uint64_t)[(MMCSHTTPContext *)self hc]);
  id v13 = 0;
  id v14 = 0;
  [MEMORY[0x1E4F1CAE0] getBoundStreamsWithBufferSize:0x8000 inputStream:&v14 outputStream:&v13];
  id v6 = v14;
  id v7 = v13;
  CFStringRef v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
  if (!v9)
  {
    [(MMCSHTTPContext *)self setInputStream:v6];
    [(MMCSHTTPContext *)self setOutputStream:v8];
    id v11 = self;
    objc_sync_enter(v11);
    [(MMCSHTTPContext *)v11 setIsHandlingError:0];
    objc_sync_exit(v11);

    [v8 setDelegate:v11];
    mmcs_nshttp_schedule_stream((uint64_t)[(MMCSHTTPContext *)v11 hc]);
    [v8 open];
  }

  return v10;
}

- (MMCSHTTPContext)initWithContext:(mmcs_http_context *)a3 options:(const mmcs_http_context_options *)a4 activityMarker:(os_activity_s *)a5
{
  if (!a3) {
    -[MMCSHTTPContext initWithContext:options:activityMarker:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)MMCSHTTPContext;
  id v7 = [(MMCSHTTPContext *)&v12 init];
  CFStringRef v8 = v7;
  if (v7)
  {
    [(MMCSHTTPContext *)v7 setHc:a3];
    C3BaseRetain([(MMCSHTTPContext *)v8 hc]);
    *(void *)([(MMCSHTTPContext *)v8 hc] + 560) = appendTrailers;
    [(MMCSHTTPContext *)v8 setIsValid:1];
    if (a5) {
      os_retain(a5);
    }
    [(MMCSHTTPContext *)v8 setActivityMarker:a5];
    uint64_t valuePtr = 0;
    if (*(void *)((void)[(MMCSHTTPContext *)v8 hc][368] + 144))
    {
      CFNumberGetValue(*(CFNumberRef *)((void)[(MMCSHTTPContext *)v8 hc][368] + 144), kCFNumberNSIntegerType, &valuePtr);
      uint64_t v9 = valuePtr;
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(MMCSHTTPContext *)v8 setContainerType:v9];
  }
  return v8;
}

- (__CFError)send
{
  uint64_t v3 = (uint64_t)[(MMCSHTTPContext *)self hc][368];
  [(MMCSHTTPContext *)self setIsHandlingError:0];
  CFStringRef v4 = [MEMORY[0x1E4F50D70] sharedManager];
  CFURLRef v5 = CFHTTPMessageCopyRequestURL((CFHTTPMessageRef)[(MMCSHTTPContext *)self hc][336]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v5 cachePolicy:0 timeoutInterval:300.0];
  id v7 = (__CFString *)CFHTTPMessageCopyRequestMethod((CFHTTPMessageRef)[(MMCSHTTPContext *)self hc][336]);
  if (v7)
  {
    [v6 setHTTPMethod:v7];
    [v6 _setRequiresShortConnectionTimeout:*(unsigned char *)(v3 + 76) != 0];
    [v6 setHTTPShouldHandleCookies:0];
    [v6 setAllowsCellularAccess:*(unsigned char *)(v3 + 74) != 0];
    CFStringRef v8 = *(void **)(v3 + 56);
    if (v8) {
      objc_msgSend(v6, "setNetworkServiceType:", (int)objc_msgSend(v8, "intValue"));
    }
    if (*(void *)(v3 + 16)) {
      objc_msgSend(v6, "setBoundInterfaceIdentifier:");
    }
    CFDictionaryRef v9 = CFHTTPMessageCopyAllHeaderFields((CFHTTPMessageRef)[(MMCSHTTPContext *)self hc][336]);
    if (v9) {
      [v6 setAllHTTPHeaderFields:v9];
    }
    BOOL v10 = [(__CFDictionary *)v9 objectForKey:@"Trailer"];

    if (v10)
    {
      [v6 _CFURLRequest];
      _CFURLRequestSetAllowedProtocolTypes();
    }
    if ((void)[(MMCSHTTPContext *)self hc][496])
    {
      if (![(MMCSHTTPContext *)self createNewRequestBodyInputStream])
      {
        error = mmcs_cferror_create_error(@"com.apple.mmcs", 1, @"createNewRequestBodyInputStream failed");
        goto LABEL_69;
      }
      CFDictionaryRef v47 = v9;
      CFURLRef v11 = v5;
      objc_super v12 = v4;
      id v13 = [(MMCSHTTPContext *)self inputStream];
      [v6 setHTTPBodyStream:v13];
    }
    else
    {
      id v13 = CFHTTPMessageCopyBody((CFHTTPMessageRef)[(MMCSHTTPContext *)self hc][336]);
      CFDictionaryRef v47 = v9;
      CFURLRef v11 = v5;
      objc_super v12 = v4;
      if (v13) {
        [v6 setHTTPBody:v13];
      }
    }

    int64_t v15 = NSString;
    v51.receiver = self;
    v51.super_class = (Class)MMCSHTTPContext;
    CFStringRef v16 = [(MMCSHTTPContext *)&v51 description];
    uint64_t v17 = [v15 stringWithFormat:@"%@ hc=%p tx%04ld uuid:%@", v16, -[MMCSHTTPContext hc](self, "hc"), (void)-[MMCSHTTPContext hc](self, "hc")[272], (void)-[MMCSHTTPContext hc](self, "hc")[304]];

    if (mmcs_http_request_options_is_background(v3) && (double)[(MMCSHTTPContext *)self hc][384] > 0.0)
    {
      v18 = v17;
      v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MMCSHTTPContext hc](self, "hc")[384]);
      [v6 _setStartTimeoutDate:v19];

      uint64_t v17 = v18;
      [v6 _setPayloadTransmissionTimeout:3600.0];
    }
    CFStringRef v4 = v12;
    if (v12)
    {
      uint64_t v46 = v12;
      id v20 = objc_alloc_init(MEMORY[0x1E4F50D78]);
      uint64_t v21 = (uint64_t)[(MMCSHTTPContext *)self hc][368];
      [v20 setQualityOfService:*(void *)(v21 + 80)];
      if (*(void *)(v21 + 88) <= 2uLL) {
        objc_msgSend(v20, "setDiscretionaryNetworkBehavior:");
      }
      CFStringRef v45 = v17;
      if (*(void *)(v21 + 96) <= 2uLL) {
        objc_msgSend(v20, "setDuetPreClearedMode:");
      }
      objc_msgSend(v20, "set_allowsRetryForBackgroundDataTasks:", *(unsigned char *)(v21 + 104) != 0);
      if (*(void *)(v21 + 112))
      {
        uint64_t v22 = (void *)[objc_alloc(NSNumber) initWithBool:CFBooleanGetValue(*(CFBooleanRef *)(v21 + 112)) != 0];
        [v20 setPrivacyProxyFailClosedOverride:v22];
      }
      CFURLRef v5 = v11;
      if (*(void *)(v21 + 120))
      {
        v23 = (void *)[objc_alloc(NSNumber) initWithBool:CFBooleanGetValue(*(CFBooleanRef *)(v21 + 120)) != 0];
        [v20 setUseNWLoaderOverride:v23];
      }
      objc_msgSend(v20, "setTlsPinning:", mmcs_http_context_is_to_mobile_me((uint64_t)-[MMCSHTTPContext hc](self, "hc")) != 0);
      objc_msgSend(v20, "setAllowRouting:", mmcs_http_context_is_to_mobile_me((uint64_t)-[MMCSHTTPContext hc](self, "hc")) != 0);
      [v20 setMetricOptions:*(void *)(v21 + 128)];
      [v20 setNetworkingDelegate:*(void *)(v21 + 136)];
      [v20 setRedactRemoteEndpointFromNetworkMetrics:*(unsigned char *)(v21 + 77) != 0];
      [v20 setRedactUniformResourceIdentifierFromNetworkMetrics:1];
      CFDictionaryRef v9 = v47;
      if ((void)[(MMCSHTTPContext *)self hc][304])
      {
        CFStringRef v24 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFUUIDRef)[(MMCSHTTPContext *)self hc][304]);
        if (v24)
        {
          CFStringRef v25 = v24;
          CFStringRef v26 = [NSString stringWithFormat:@"%@ requestUUID:%@", (void)-[MMCSHTTPContext hc](self, "hc")[264], v24];
          CFRelease(v25);
          if (v26)
          {
            [v20 setIdentifier:v26];
          }
        }
      }
      double v27 = mmcs_http_total_timeout(3600.0);
      if (v27 <= 0.0) {
        double v27 = 3600.0;
      }
      objc_msgSend(v20, "set_timeoutIntervalForResource:", v27);
      if (mmcs_http_context_is_container_upload((uint64_t)[(MMCSHTTPContext *)self hc])) {
        objc_msgSend(v20, "set_timeoutIntervalForRequest:", 600.0);
      }
      objc_msgSend(v20, "set_appleIDContextSessionIdentifier:", 0);
      if (v20)
      {
        [v20 setOutOfProcessPoolName:*(void *)(v21 + 48)];
        [v20 setAllowsCellularAccess:*(unsigned char *)(v21 + 74) != 0];
        objc_msgSend(v20, "set_allowsExpensiveAccess:", *(unsigned char *)(v21 + 75) != 0);
        objc_msgSend(v20, "set_allowsPowerNapScheduling:", *(unsigned char *)(v21 + 73) != 0);
      }
      CFNumberRef v28 = *(const __CFNumber **)(v21 + 144);
      CFStringRef v4 = v46;
      if (v28)
      {
        *(void *)uint64_t valuePtr = 0;
        if (CFNumberGetValue(v28, kCFNumberNSIntegerType, valuePtr)) {
          [v20 setContainerType:*(void *)valuePtr];
        }
      }
      if (*(void *)((void)[(MMCSHTTPContext *)self hc][368] + 24)) {
        objc_msgSend(v20, "set_sourceApplicationBundleIdentifier:", *(void *)((void)-[MMCSHTTPContext hc](self, "hc")[368] + 24));
      }
      if (*(void *)((void)[(MMCSHTTPContext *)self hc][368] + 32)) {
        objc_msgSend(v20, "set_sourceApplicationSecondaryIdentifier:", *(void *)((void)-[MMCSHTTPContext hc](self, "hc")[368] + 32));
      }
      if (*(void *)((void)[(MMCSHTTPContext *)self hc][368] + 40)) {
        objc_msgSend(v20, "set_sourceApplicationAuditTokenData:", *(void *)((void)-[MMCSHTTPContext hc](self, "hc")[368] + 40));
      }
      id v49 = 0;
      v29 = [v46 createDataTaskWithRequest:v6 options:v20 delegate:self sessionHandle:&v49];
      id v30 = v49;
      [(MMCSHTTPContext *)self setDataTask:v29];

      v31 = [(MMCSHTTPContext *)self dataTask];

      if (v31)
      {
        if (mmcs_http_request_options_is_background(v3))
        {
          uint64_t v32 = (uint64_t)[(MMCSHTTPContext *)self hc][352];
          if (v32 != -1)
          {
            v33 = [(MMCSHTTPContext *)self dataTask];
            [v33 setCountOfBytesClientExpectsToSend:v32];
          }
          uint64_t v34 = (uint64_t)[(MMCSHTTPContext *)self hc][360];
          if (v34 != -1)
          {
            v35 = [(MMCSHTTPContext *)self dataTask];
            [v35 setCountOfBytesClientExpectsToReceive:v34];
          }
        }
        if (*(unsigned char *)((void)[(MMCSHTTPContext *)self hc][368] + 152))
        {
          uint64_t v36 = [(MMCSHTTPContext *)self hc];
          if (v20)
          {
            if (!v36->var48)
            {
              id v48 = 0;
              uint64_t v37 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v20 requiringSecureCoding:1 error:&v48];
              uint64_t v38 = (__CFError *)v48;
              if (v37)
              {
                id v39 = v37;
                *(void *)([(MMCSHTTPContext *)self hc] + 616) = v39;
              }
              else
              {
                v40 = mmcs_logging_logger_default();
                if (v38)
                {
                  XCFPrintError(v40, @"ErrorSerializingWarmRequestOptions", v38);
                }
                else
                {
                  log = v40;
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)uint64_t valuePtr = 0;
                    _os_log_impl(&dword_1DC1CA000, log, OS_LOG_TYPE_ERROR, "Unable to serialize archivedData, error not returned.", valuePtr, 2u);
                  }
                }
              }
            }
          }
        }
      }

      uint64_t v17 = v45;
    }
    else
    {
      id v30 = 0;
      CFURLRef v5 = v11;
      CFDictionaryRef v9 = v47;
    }
    v41 = [(MMCSHTTPContext *)self dataTask];

    if (v41)
    {
      [(MMCSHTTPContext *)self setUrlSession:v30];
      int v42 = [(MMCSHTTPContext *)self dataTask];
      [v42 resume];

      error = 0;
      goto LABEL_70;
    }
    [(MMCSHTTPContext *)self setIsTaskDone:1];
    error = mmcs_cferror_create_error(@"com.apple.mmcs", 50, @"Session was invalidated");

LABEL_69:
    goto LABEL_70;
  }
  error = mmcs_cferror_create_error(@"com.apple.mmcs", 1, @"CFHTTPMessageCopyRequestMethod failed");
LABEL_70:

  return error;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (gMMCS_DebugLevel >= 5)
  {
    uint64_t v3 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"dealloc");
      CFURLRef v5 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v8 = v4;
        _os_log_impl(&dword_1DC1CA000, v5, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v4) {
        CFRelease(v4);
      }
    }
  }
  if ([(MMCSHTTPContext *)self activityMarker]) {
    os_release([(MMCSHTTPContext *)self activityMarker]);
  }
  [(MMCSHTTPContext *)self setActivityMarker:0];
  if ([(MMCSHTTPContext *)self hc]) {
    C3BaseRelease([(MMCSHTTPContext *)self hc]);
  }
  [(MMCSHTTPContext *)self setHc:0];
  v6.receiver = self;
  v6.super_class = (Class)MMCSHTTPContext;
  [(MMCSHTTPContext *)&v6 dealloc];
}

- (void)cleanupResponse
{
  [(MMCSHTTPContext *)self invalidate];
  [(MMCSHTTPContext *)self setUrlSession:0];
  [(MMCSHTTPContext *)self setDataTask:0];
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (gMMCS_DebugLevel >= 4)
  {
    uint64_t v3 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ invalidate", self);
      CFURLRef v5 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v8 = v4;
        _os_log_impl(&dword_1DC1CA000, v5, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v4) {
        CFRelease(v4);
      }
    }
  }
  [(MMCSHTTPContext *)self invalidateStreamPair];
  [(MMCSHTTPContext *)self setIsValid:0];
  objc_super v6 = [(MMCSHTTPContext *)self dataTask];
  [v6 cancel];

  [(MMCSHTTPContext *)self setDataTask:0];
  [(MMCSHTTPContext *)self setUrlSession:0];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  CFStringRef v16 = (void (**)(id, id))a7;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self activityMarker], &v17);
  v16[2](v16, v15);
  os_activity_scope_leave(&v17);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v11 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self activityMarker], &state);
  if (gMMCS_DebugLevel >= 5)
  {
    id v12 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ %@ %@ didSendBodyData:%lld totalBytesSent:%lld totalBytesExpectedToSend:%lld", self, v30, v11, a5, a6, a7);
      id v14 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v34 = v13;
        _os_log_impl(&dword_1DC1CA000, v14, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v13) {
        CFRelease(v13);
      }
    }
  }
  if ([(MMCSHTTPContext *)self isValid])
  {
    id v15 = [(MMCSHTTPContext *)self dataTask];
    CFStringRef v16 = [v15 taskDescription];
    if (v16)
    {
      os_activity_scope_state_s v17 = [(MMCSHTTPContext *)self dataTask];
      v18 = [v17 taskDescription];
      v19 = [v11 taskDescription];
      char v20 = [v18 isEqualToString:v19];

      if (v20)
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __91__MMCSHTTPContext_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
        v31[3] = &unk_1E6C33870;
        v31[4] = self;
        v31[5] = a5;
        v31[6] = a6;
        v31[7] = a7;
        HttpContextPerformBlockAsync(self, v31);
        goto LABEL_22;
      }
    }
    else
    {
    }
    CFStringRef v24 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v25 = [v11 taskDescription];
      CFStringRef v26 = [(MMCSHTTPContext *)self dataTask];
      double v27 = [v26 taskDescription];
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ unknown task %@. Expected %@: ignoring delegate callback", self, v25, v27);

      CFNumberRef v28 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v34 = v22;
        _os_log_impl(&dword_1DC1CA000, v28, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v22) {
LABEL_21:
      }
        CFRelease(v22);
    }
  }
  else
  {
    uint64_t v21 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ invalid: ignoring delegate callback", self);
      v23 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v34 = v22;
        _os_log_impl(&dword_1DC1CA000, v23, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v22) {
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  os_activity_scope_leave(&state);
}

void __91__MMCSHTTPContext_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isValid])
  {
    uint64_t v2 = [*(id *)(a1 + 32) hc];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    mmcs_nshttp_sent_data(v2, v3, v4);
  }
  else
  {
    CFURLRef v5 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ invalid: ignoring delegate callback", *(void *)(a1 + 32));
      id v7 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v9 = v6;
        _os_log_impl(&dword_1DC1CA000, v7, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v6) {
        CFRelease(v6);
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self activityMarker], &state);
  if (gMMCS_DebugLevel >= 5)
  {
    id v11 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ %@ %@ needNewBodyStream", self, v8, v9);
      CFStringRef v13 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v34 = v12;
        _os_log_impl(&dword_1DC1CA000, v13, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v12) {
        CFRelease(v12);
      }
    }
  }
  if (![(MMCSHTTPContext *)self isValid])
  {
    char v20 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ invalid: calling completionHandler with nil", self);
    CFStringRef v22 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v34 = v21;
      _os_log_impl(&dword_1DC1CA000, v22, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v21) {
      goto LABEL_22;
    }
LABEL_21:
    CFRelease(v21);
LABEL_22:
    v10[2](v10, 0);
    goto LABEL_23;
  }
  id v14 = [(MMCSHTTPContext *)self dataTask];
  id v15 = [v14 taskDescription];
  if (!v15)
  {

    goto LABEL_17;
  }
  CFStringRef v16 = [(MMCSHTTPContext *)self dataTask];
  os_activity_scope_state_s v17 = [v16 taskDescription];
  v18 = [v9 taskDescription];
  char v19 = [v17 isEqualToString:v18];

  if ((v19 & 1) == 0)
  {
LABEL_17:
    v23 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    CFStringRef v24 = [v9 taskDescription];
    CFStringRef v25 = [(MMCSHTTPContext *)self dataTask];
    CFStringRef v26 = [v25 taskDescription];
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ unknown task %@. Expected %@: ignoring delegate callback", self, v24, v26);

    double v27 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v34 = v21;
      _os_log_impl(&dword_1DC1CA000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v21) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53__MMCSHTTPContext_URLSession_task_needNewBodyStream___block_invoke;
  v28[3] = &unk_1E6C33898;
  v28[4] = self;
  v31 = v10;
  id v29 = v8;
  id v30 = v9;
  HttpContextPerformBlockAsync(self, v28);

LABEL_23:
  os_activity_scope_leave(&state);
}

void __53__MMCSHTTPContext_URLSession_task_needNewBodyStream___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isValid])
  {
    if (gMMCS_DebugLevel >= 4)
    {
      uint64_t v2 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ %@ %@ needNewBodyStream on run loop", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
        uint64_t v4 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v10 = v3;
          _os_log_impl(&dword_1DC1CA000, v4, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        if (v3) {
          CFRelease(v3);
        }
      }
    }
    [*(id *)(a1 + 32) setDidOpen:0];
    if ([*(id *)(a1 + 32) createNewRequestBodyInputStream])
    {
      CFURLRef v5 = [*(id *)(a1 + 32) inputStream];
    }
    else
    {
      CFURLRef v5 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    CFStringRef v6 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ invalid. Returning nil body stream", *(void *)(a1 + 32));
      id v8 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v10 = v7;
        _os_log_impl(&dword_1DC1CA000, v8, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v7) {
        CFRelease(v7);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v8 = a4;
  id v9 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self activityMarker], &state);
  [(MMCSHTTPContext *)self setIsTaskDone:1];
  if ((double)[(MMCSHTTPContext *)self hc][120] == 0.0)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(CFAbsoluteTime *)([(MMCSHTTPContext *)self hc] + 120) = Current;
  }
  uint64_t v11 = self;
  objc_sync_enter(v11);
  [(MMCSHTTPContext *)v11 setIsHandlingError:1];
  objc_sync_exit(v11);

  [(MMCSHTTPContext *)v11 cleanupRequest];
  CFStringRef v12 = [v8 _timingData];
  CFStringRef v13 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [v8 originalRequest];
    id v15 = [v14 URL];
    if (v9)
    {
      CFStringRef v16 = [v9 description];
    }
    else
    {
      CFStringRef v16 = &stru_1F363CBE8;
    }
    CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ with %@ did complete %@", v11, v15, v16, v33);
    if (v9) {

    }
    v18 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v40 = v17;
      _os_log_impl(&dword_1DC1CA000, v18, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v17) {
      CFRelease(v17);
    }
  }
  if ([(MMCSHTTPContext *)v11 isValid])
  {
    char v19 = [(MMCSHTTPContext *)v11 dataTask];
    char v20 = [v19 taskDescription];
    if (v20)
    {
      CFStringRef v21 = [(MMCSHTTPContext *)v11 dataTask];
      CFStringRef v22 = [v21 taskDescription];
      v23 = [v8 taskDescription];
      char v24 = [v22 isEqualToString:v23];

      if (v24)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __56__MMCSHTTPContext_URLSession_task_didCompleteWithError___block_invoke;
        v34[3] = &unk_1E6C338C0;
        v34[4] = v11;
        id v35 = v12;
        id v36 = v8;
        id v37 = v9;
        HttpContextPerformBlockAsync(v11, v34);

        goto LABEL_28;
      }
    }
    else
    {
    }
    CFNumberRef v28 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v29 = [v8 taskDescription];
      id v30 = [(MMCSHTTPContext *)v11 dataTask];
      v31 = [v30 taskDescription];
      CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ unknown task %@. Expected %@: ignoring delegate callback", v11, v29, v31);

      uint64_t v32 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v40 = v26;
        _os_log_impl(&dword_1DC1CA000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v26) {
LABEL_27:
      }
        CFRelease(v26);
    }
  }
  else
  {
    CFStringRef v25 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ invalid: ignoring delegate callback", v11);
      double v27 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v40 = v26;
        _os_log_impl(&dword_1DC1CA000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v26) {
        goto LABEL_27;
      }
    }
  }
LABEL_28:

  os_activity_scope_leave(&state);
}

void __56__MMCSHTTPContext_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isValid])
  {
    [*(id *)(a1 + 32) setTimingData:*(void *)(a1 + 40)];
    if (gMMCS_DebugLevel >= 5)
    {
      uint64_t v2 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        uint64_t v4 = *(void **)(a1 + 32);
        CFURLRef v5 = [v4 timingData];
        CFStringRef v6 = [v5 description];
        CFStringRef v7 = CFStringCreateWithFormat(v3, 0, @"%@ %@", v4, v6);

        id v8 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v15 = v7;
          _os_log_impl(&dword_1DC1CA000, v8, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        if (v7) {
          CFRelease(v7);
        }
      }
    }
    if (([*(id *)(a1 + 32) didOpen] & 1) == 0)
    {
      [*(id *)(a1 + 32) setDidOpen:1];
      mmcs_nshttp_did_open([*(id *)(a1 + 32) hc]);
    }
    uint64_t v9 = [*(id *)(a1 + 32) hc];
    uint64_t v10 = [*(id *)(a1 + 48) countOfBytesSent];
    [*(id *)(a1 + 48) countOfBytesExpectedToSend];
    mmcs_nshttp_sent_data(v9, 0, v10);
    mmcs_nshttp_did_complete([*(id *)(a1 + 32) hc], *(id *)(a1 + 56));
  }
  else
  {
    uint64_t v11 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ invalid: ignoring delegate callback", *(void *)(a1 + 32));
      CFStringRef v13 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v15 = v12;
        _os_log_impl(&dword_1DC1CA000, v13, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v12) {
        CFRelease(v12);
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self activityMarker], &state);
  if ([(MMCSHTTPContext *)self isValid])
  {
    uint64_t v11 = [(MMCSHTTPContext *)self dataTask];
    CFStringRef v12 = [v11 taskDescription];
    if (v12)
    {
      CFStringRef v13 = [(MMCSHTTPContext *)self dataTask];
      id v14 = [v13 taskDescription];
      CFStringRef v15 = [v9 taskDescription];
      char v16 = [v14 isEqualToString:v15];

      if (v16)
      {
LABEL_16:
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54__MMCSHTTPContext_URLSession_dataTask_didReceiveData___block_invoke;
        v26[3] = &unk_1E6C338E8;
        v26[4] = self;
        id v27 = v9;
        id v28 = v10;
        HttpContextPerformBlockSync(self, v26);

        goto LABEL_17;
      }
    }
    else
    {
    }
    char v20 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v21 = [v9 taskDescription];
      CFStringRef v22 = [(MMCSHTTPContext *)self dataTask];
      v23 = [v22 taskDescription];
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ unknown task %@. Expected %@: ignoring delegate callback", self, v21, v23);

      CFStringRef v25 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v31 = v24;
        _os_log_impl(&dword_1DC1CA000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v24) {
        CFRelease(v24);
      }
    }
    goto LABEL_16;
  }
  CFStringRef v17 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ invalid: ignoring delegate callback", self);
    char v19 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v31 = v18;
      _os_log_impl(&dword_1DC1CA000, v19, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v18) {
      CFRelease(v18);
    }
  }
LABEL_17:
  os_activity_scope_leave(&state);
}

void __54__MMCSHTTPContext_URLSession_dataTask_didReceiveData___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([a1[4] isValid])
  {
    if (([a1[4] didOpen] & 1) == 0)
    {
      uint64_t v2 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        id v4 = a1[4];
        CFURLRef v5 = [a1[5] response];
        CFStringRef v6 = CFStringCreateWithFormat(v3, 0, @"%@ not already open. Is there a response?'%@'", v4, v5);

        CFStringRef v7 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v12 = v6;
          _os_log_impl(&dword_1DC1CA000, v7, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }
        if (v6) {
          CFRelease(v6);
        }
      }
      [a1[4] setDidOpen:1];
      mmcs_nshttp_did_open([a1[4] hc]);
    }
    mmcs_nshttp_received_data([a1[4] hc], a1[6]);
  }
  else
  {
    id v8 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ invalid: ignoring delegate callback", a1[4]);
      id v10 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v12 = v9;
        _os_log_impl(&dword_1DC1CA000, v10, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v9) {
        CFRelease(v9);
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v10 = a4;
  id v11 = a5;
  CFStringRef v12 = (void (**)(id, void))a6;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self activityMarker], &state);
  uint64_t v13 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ URLSession:%@ dataTask:%@ didReceiveResponse:%@", self, v31, v10, v11);
    CFStringRef v15 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v36 = v14;
      _os_log_impl(&dword_1DC1CA000, v15, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v14) {
      CFRelease(v14);
    }
  }
  if ((double)[(MMCSHTTPContext *)self hc][120] == 0.0)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(CFAbsoluteTime *)([(MMCSHTTPContext *)self hc] + 120) = Current;
  }
  if (![(MMCSHTTPContext *)self isValid])
  {
    v23 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ invalid: calling completionHandler with NSURLSessionResponseCancel", self);
    CFStringRef v25 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v36 = v24;
      _os_log_impl(&dword_1DC1CA000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v24) {
      goto LABEL_23;
    }
LABEL_22:
    CFRelease(v24);
LABEL_23:
    v12[2](v12, 0);
    goto LABEL_24;
  }
  CFStringRef v17 = [(MMCSHTTPContext *)self dataTask];
  CFStringRef v18 = [v17 taskDescription];
  if (!v18)
  {

    goto LABEL_18;
  }
  char v19 = [(MMCSHTTPContext *)self dataTask];
  char v20 = [v19 taskDescription];
  CFStringRef v21 = [v10 taskDescription];
  char v22 = [v20 isEqualToString:v21];

  if ((v22 & 1) == 0)
  {
LABEL_18:
    CFStringRef v26 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    id v27 = [v10 taskDescription];
    id v28 = [(MMCSHTTPContext *)self dataTask];
    id v29 = [v28 taskDescription];
    CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ unknown task %@. Expected %@: ignoring delegate callback", self, v27, v29);

    id v30 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v36 = v24;
      _os_log_impl(&dword_1DC1CA000, v30, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v24) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __76__MMCSHTTPContext_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v32[3] = &unk_1E6C33910;
  v32[4] = self;
  id v33 = v12;
  HttpContextPerformBlockAsync(self, v32);

LABEL_24:
  os_activity_scope_leave(&state);
}

uint64_t __76__MMCSHTTPContext_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isValid])
  {
    if (([*(id *)(a1 + 32) didOpen] & 1) == 0)
    {
      [*(id *)(a1 + 32) setDidOpen:1];
      mmcs_nshttp_did_open([*(id *)(a1 + 32) hc]);
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    id v4 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ invalid: ignoring delegate callback", *(void *)(a1 + 32));
      CFStringRef v6 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v8 = v5;
        _os_log_impl(&dword_1DC1CA000, v6, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v5) {
        CFRelease(v5);
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v10 = a4;
  id v42 = a5;
  id v11 = (void (**)(id, void))a6;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self activityMarker], &state);
  if (gMMCS_DebugLevel >= 4)
  {
    CFStringRef v12 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ %@ %@ %@", self, v41, v10, v42);
      CFStringRef v14 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v50 = v13;
        _os_log_impl(&dword_1DC1CA000, v14, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v13) {
        CFRelease(v13);
      }
    }
  }
  if (![(MMCSHTTPContext *)self isValid])
  {
    CFStringRef v25 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ invalid: calling completionHandler with nil request", self);
    id v27 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v50 = v26;
      _os_log_impl(&dword_1DC1CA000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v26) {
      goto LABEL_26;
    }
LABEL_25:
    CFRelease(v26);
LABEL_26:
    id v33 = 0;
LABEL_27:
    ((void (**)(id, id))v11)[2](v11, v33);
    goto LABEL_28;
  }
  CFStringRef v15 = [(MMCSHTTPContext *)self dataTask];
  char v16 = [v15 taskDescription];
  if (!v16)
  {

    goto LABEL_21;
  }
  CFStringRef v17 = [(MMCSHTTPContext *)self dataTask];
  CFStringRef v18 = [v17 taskDescription];
  char v19 = [v10 taskDescription];
  char v20 = [v18 isEqualToString:v19];

  if ((v20 & 1) == 0)
  {
LABEL_21:
    id v28 = mmcs_logging_logger_default();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    id v29 = [v10 taskDescription];
    id v30 = [(MMCSHTTPContext *)self dataTask];
    id v31 = [v30 taskDescription];
    CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ unknown task %@. Expected %@: ignoring delegate callback", self, v29, v31);

    uint64_t v32 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v50 = v26;
      _os_log_impl(&dword_1DC1CA000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (!v26) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (![(MMCSHTTPContext *)self requestIsStreamed])
  {
    id v33 = v42;
    if (gMMCS_DebugLevel < 5) {
      goto LABEL_27;
    }
    CFStringRef v34 = mmcs_logging_logger_default();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);
    id v33 = v42;
    if (!v35) {
      goto LABEL_27;
    }
    CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ %@ %@ %@ is not streamed; using as is.",
            self,
            v41,
            v10,
            v42);
    uint64_t v37 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v50 = v36;
      _os_log_impl(&dword_1DC1CA000, v37, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    id v33 = v42;
    if (!v36) {
      goto LABEL_27;
    }
LABEL_34:
    CFRelease(v36);
    id v33 = v42;
    goto LABEL_27;
  }
  if ([(MMCSHTTPContext *)self requestIsStreamed])
  {
    CFStringRef v21 = [v42 HTTPBodyStream];
    if (v21)
    {
      char v22 = [v42 HTTPBodyStream];
      v23 = [(MMCSHTTPContext *)self inputStream];
      BOOL v24 = v22 == v23;

      if (v24)
      {
        id v33 = v42;
        if (gMMCS_DebugLevel < 5) {
          goto LABEL_27;
        }
        uint64_t v38 = mmcs_logging_logger_default();
        BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
        id v33 = v42;
        if (!v39) {
          goto LABEL_27;
        }
        CFStringRef v36 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ %@ %@ %@ is streamed, and the request input stream is non-nil and equal context input stream; using as is.",
                self,
                v41,
                v10,
                v42);
        CFStringRef v40 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v50 = v36;
          _os_log_impl(&dword_1DC1CA000, v40, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        id v33 = v42;
        if (!v36) {
          goto LABEL_27;
        }
        goto LABEL_34;
      }
    }
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __94__MMCSHTTPContext_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
  v43[3] = &unk_1E6C33938;
  v43[4] = self;
  CFDictionaryRef v47 = v11;
  id v44 = v41;
  id v45 = v10;
  id v46 = v42;
  HttpContextPerformBlockAsync(self, v43);

LABEL_28:
  os_activity_scope_leave(&state);
}

void __94__MMCSHTTPContext_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isValid])
  {
    if (gMMCS_DebugLevel >= 5)
    {
      uint64_t v2 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        id v4 = *(void **)(a1 + 32);
        long long v18 = *(_OWORD *)(a1 + 40);
        uint64_t v5 = *(void *)(a1 + 56);
        CFStringRef v6 = [v4 inputStream];
        CFStringRef v7 = @"using existing stream";
        if (!v6) {
          CFStringRef v7 = @"creating new stream";
        }
        CFStringRef v8 = CFStringCreateWithFormat(v3, 0, @"%@ %@ %@ %@ is streamed, and the request input stream is nil or not equal the context input stream; %@.",
               v4,
               v18,
               v5,
               v7);

        uint64_t v9 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v20 = v8;
          _os_log_impl(&dword_1DC1CA000, v9, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
        }
        if (v8) {
          CFRelease(v8);
        }
      }
    }
    mmcs_http_context_mark_as_writing([*(id *)(a1 + 32) hc]);
    id v10 = [*(id *)(a1 + 32) inputStream];

    if (!v10) {
      [*(id *)(a1 + 32) createNewRequestBodyInputStream];
    }
    id v11 = [*(id *)(a1 + 32) inputStream];

    if (v11)
    {
      CFStringRef v12 = (void *)[*(id *)(a1 + 56) mutableCopy];
      CFStringRef v13 = [*(id *)(a1 + 32) inputStream];
      [v12 setHTTPBodyStream:v13];

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      return;
    }
    CFStringRef v17 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ unable to create new input stream", *(void *)(a1 + 32));
      char v16 = mmcs_logging_logger_default();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v20 = v15;
LABEL_20:
      _os_log_impl(&dword_1DC1CA000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
LABEL_21:
      if (v15) {
        CFRelease(v15);
      }
    }
  }
  else
  {
    CFStringRef v14 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ invalid: ignoring delegate callback", *(void *)(a1 + 32));
      char v16 = mmcs_logging_logger_default();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v20 = v15;
      goto LABEL_20;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)[(MMCSHTTPContext *)self activityMarker], &state);
  id v11 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ %@ %@ _willRetryBackgroundDataTask after error %@", self, v8, v9, v10);
    CFStringRef v13 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v34 = v12;
      _os_log_impl(&dword_1DC1CA000, v13, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v12) {
      CFRelease(v12);
    }
  }
  if ([(MMCSHTTPContext *)self isValid])
  {
    CFStringRef v14 = [(MMCSHTTPContext *)self dataTask];
    CFStringRef v15 = [v14 taskDescription];
    if (v15)
    {
      char v16 = [(MMCSHTTPContext *)self dataTask];
      CFStringRef v17 = [v16 taskDescription];
      long long v18 = [v9 taskDescription];
      char v19 = [v17 isEqualToString:v18];

      if (v19)
      {
        CFStringRef v20 = self;
        objc_sync_enter(v20);
        [(MMCSHTTPContext *)v20 setIsHandlingError:1];
        objc_sync_exit(v20);

        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __69__MMCSHTTPContext_URLSession__willRetryBackgroundDataTask_withError___block_invoke;
        v29[3] = &unk_1E6C338E8;
        v29[4] = v20;
        id v30 = v9;
        id v31 = v10;
        HttpContextPerformBlockSync(v20, v29);

        goto LABEL_21;
      }
    }
    else
    {
    }
    BOOL v24 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v25 = [v9 taskDescription];
      CFStringRef v26 = [(MMCSHTTPContext *)self dataTask];
      id v27 = [v26 taskDescription];
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ unknown task %@. Expected %@: ignoring delegate callback", self, v25, v27);

      id v28 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v34 = v22;
        _os_log_impl(&dword_1DC1CA000, v28, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v22) {
LABEL_20:
      }
        CFRelease(v22);
    }
  }
  else
  {
    uint64_t v21 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ invalid: ignoring delegate callback", self);
      v23 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v34 = v22;
        _os_log_impl(&dword_1DC1CA000, v23, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      if (v22) {
        goto LABEL_20;
      }
    }
  }
LABEL_21:
  os_activity_scope_leave(&state);
}

void __69__MMCSHTTPContext_URLSession__willRetryBackgroundDataTask_withError___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v25 = a1[4];
    CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ synchronous callback");
    id v4 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v27 = v3;
      _os_log_impl(&dword_1DC1CA000, v4, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v3) {
      CFRelease(v3);
    }
  }
  if ([a1[4] isValid])
  {
    uint64_t v5 = [a1[5] _timingData];
    [a1[4] setTimingData:v5];

    [a1[4] invalidateStreamPair];
    mmcs_nshttp_will_retry_in_background([a1[4] hc], a1[6]);
    if (![a1[4] hc] || *(unsigned char *)(objc_msgSend(a1[4], "hc") + 292)) {
      goto LABEL_9;
    }
    uint64_t user_data = mmcs_http_context_get_user_data([a1[4] hc]);
    if (*(void *)([a1[4] hc] + 368) && *(unsigned char *)(*(void *)(objc_msgSend(a1[4], "hc") + 368) + 76))
    {
      id v10 = [a1[6] domain];
      if ([v10 isEqualToString:*MEMORY[0x1E4F289A0]])
      {
        uint64_t v11 = [a1[6] code];

        if (v11 == -1001)
        {
          CFStringRef v12 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"Cancelling request with FailFail enabled after initial background error");
            long long v18 = mmcs_logging_logger_default();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              CFStringRef v27 = v17;
              _os_log_impl(&dword_1DC1CA000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
            if (v17) {
              CFRelease(v17);
            }
          }
          id v19 = a1[6];
          CFStringRef v20 = @"Fastfail enabled; cancelling background request after timeout.";
LABEL_36:
          error_with_underlying_error = mmcs_cferror_create_error_with_underlying_error(@"com.apple.mmcs", 38, v19, v20, v13, v14, v15, v16, (char)v25);
          mmcs_http_context_should_cancel((unsigned char *)[a1[4] hc], error_with_underlying_error);
          if (error_with_underlying_error) {
            CFRelease(error_with_underlying_error);
          }
        }
      }
      else
      {
      }
    }
    else if (mmcs_http_context_is_request_body_done([a1[4] hc]) {
           && user_data
    }
           && mmcs_http_request_is_put_complete_at_edge_protocol_v2(*(void *)(user_data + 24)))
    {
      uint64_t v21 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"Cancelling background retry with PutCompleteAtEdge && RequestBodyDone after initial background error");
        v23 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v27 = v22;
          _os_log_impl(&dword_1DC1CA000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
        if (v22) {
          CFRelease(v22);
        }
      }
      id v19 = a1[6];
      CFStringRef v20 = @"PutCompleteAtEdge && RequestBodyDone; cancelling background request upon automatic retry.";
      goto LABEL_36;
    }
LABEL_9:
    if ([a1[4] isValid]) {
      [a1[4] setDidOpen:0];
    }
    return;
  }
  CFStringRef v6 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"mmcs runloop: %@ invalid: ignoring delegate callback", a1[4]);
    id v8 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v27 = v7;
      _os_log_impl(&dword_1DC1CA000, v8, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }
    if (v7) {
      CFRelease(v7);
    }
  }
}

- (mmcs_http_context)hc
{
  return self->_hc;
}

- (void)setHc:(mmcs_http_context *)a3
{
  self->_hc = a3;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

- (void)setDataTask:(id)a3
{
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
}

- (BOOL)didOpen
{
  return self->_didOpen;
}

- (void)setDidOpen:(BOOL)a3
{
  self->_didOpen = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isTaskDone
{
  return self->_isTaskDone;
}

- (void)setIsTaskDone:(BOOL)a3
{
  self->_isTaskDone = a3;
}

- (BOOL)requestIsStreamed
{
  return self->_requestIsStreamed;
}

- (void)setRequestIsStreamed:(BOOL)a3
{
  self->_requestIsStreamed = a3;
}

- (BOOL)isHandlingError
{
  return self->_isHandlingError;
}

- (void)setIsHandlingError:(BOOL)a3
{
  self->_isHandlingError = a3;
}

- (os_activity_s)activityMarker
{
  return self->_activityMarker;
}

- (void)setActivityMarker:(os_activity_s *)a3
{
  self->_activityMarker = a3;
}

- (int64_t)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(int64_t)a3
{
  self->_containerType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

- (void)initWithContext:options:activityMarker:.cold.1()
{
}

@end