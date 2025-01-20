@interface CUReachabilityMonitor
- (BOOL)_captiveDetectedCheck;
- (CUReachabilityMonitor)init;
- (NSURL)destinationURL;
- (OS_dispatch_queue)dispatchQueue;
- (double)timeout;
- (id)completionHandler;
- (int64_t)mode;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_activate;
- (void)_complete:(id)a3;
- (void)_pathMonitorStart;
- (void)_pathMonitorUpdated:(id)a3;
- (void)_startDownload;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setCompletionHandler:(id)a3;
- (void)setDestinationURL:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setTimeout:(double)a3;
@end

@implementation CUReachabilityMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDestinationURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v11 code] == -1001)
  {
    if (gLogCategory_CUReachability <= 60
      && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor URLSession:task:didCompleteWithError:]", 0x3Cu, (uint64_t)"### CFURL timeout for <%@>: %{error}, retrying...\n", v6, v7, v8, v9, (uint64_t)self->_destinationURL);
    }
    [(NSURLSession *)self->_urlSession invalidateAndCancel];
    urlSession = self->_urlSession;
    self->_urlSession = 0;

    [(CUReachabilityMonitor *)self _startDownload];
  }
  else
  {
    [(CUReachabilityMonitor *)self _complete:v11];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v27[0] = 0;
  if ([v6 getFileSystemRepresentation:v27 maxLength:1024])
  {
    memset(&v26, 0, sizeof(v26));
    int v11 = stat(v27, &v26);
    if ((unint64_t)(v26.st_size - 1001) >= 0xFFFFFFFFFFFFFC18) {
      int v12 = 0;
    }
    else {
      int v12 = -6743;
    }
    if (v11) {
      int v13 = v11;
    }
    else {
      int v13 = v12;
    }
    if (!v13)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6 options:2 error:0];
      v15 = v14;
      if (v14)
      {
        id v16 = v14;
        v17 = (const char *)[v16 bytes];
        if (strncasestr(v17, "<BODY>Success</BODY>", [v16 length]))
        {

          self->_downloadStatus = 0;
          if (gLogCategory_CUReachability <= 30
            && (gLogCategory_CUReachability != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
          {
            LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]", 0x1Eu, (uint64_t)"Downloaded to <%@>, %lld bytes\n", v22, v23, v24, v25, (uint64_t)v6);
          }
          goto LABEL_19;
        }
        int v13 = 301048;
        if (gLogCategory_CUReachability <= 60
          && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]", 0x3Cu, (uint64_t)"### Downloaded content mismatch:\n%.2H\n", v18, v19, v20, v21, (uint64_t)v17);
        }
      }
      else
      {
        int v13 = -6755;
      }
    }
  }
  else
  {
    int v13 = -6704;
  }
  self->_downloadStatus = v13;
  if (gLogCategory_CUReachability <= 60
    && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]", 0x3Cu, (uint64_t)"### Downloaded to <%@> bad: %#m\n", v7, v8, v9, v10, (uint64_t)v6);
  }
LABEL_19:
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CUReachabilityMonitor_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__CUReachabilityMonitor_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUReachability <= 30
    && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v10);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9[5])
  {
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", a3, a4, a5, a6, a7, a8, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v9 _complete:v11];
  }
  else
  {
    [v9 _complete:0];
  }
}

- (void)_complete:(id)a3
{
  id v4 = a3;
  int captiveNotifyToken = self->_captiveNotifyToken;
  if (captiveNotifyToken != -1)
  {
    id v23 = v4;
    notify_cancel(captiveNotifyToken);
    id v4 = v23;
    self->_int captiveNotifyToken = -1;
  }
  if (!v4)
  {
    uint64_t downloadStatus = self->_downloadStatus;
    if (!downloadStatus)
    {
      p_completionHandler = &self->_completionHandler;
      if (!self->_completionHandler)
      {
        id v25 = 0;
        goto LABEL_22;
      }
      goto LABEL_13;
    }
    NSErrorWithOSStatusF(downloadStatus, (uint64_t)"Download failed", v5, v6, v7, v8, v9, v10, v22);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  p_completionHandler = &self->_completionHandler;
  if (!self->_completionHandler)
  {
    id v25 = v4;
    goto LABEL_22;
  }
  if (!v4)
  {
LABEL_13:
    if (gLogCategory_CUReachability <= 30
      && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor _complete:]", 0x1Eu, (uint64_t)"Reachable: <%@>\n", v7, v8, v9, v10, (uint64_t)self->_destinationURL);
    }
    id v4 = 0;
    goto LABEL_21;
  }
  if (gLogCategory_CUReachability <= 60)
  {
    id v24 = v4;
    if (gLogCategory_CUReachability != -1
      || (v14 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu), id v4 = v24, v14))
    {
      LogPrintF((uint64_t)&gLogCategory_CUReachability, (uint64_t)"-[CUReachabilityMonitor _complete:]", 0x3Cu, (uint64_t)"### Not reachable <%@>: %{error}\n", v7, v8, v9, v10, (uint64_t)self->_destinationURL);
      id v4 = v24;
    }
  }
LABEL_21:
  id v25 = v4;
  (*((void (**)(void))*p_completionHandler + 2))();
  id v15 = *p_completionHandler;
  id *p_completionHandler = 0;

LABEL_22:
  pathMonitor = self->_pathMonitor;
  if (pathMonitor)
  {
    nw_path_monitor_cancel(pathMonitor);
    v17 = self->_pathMonitor;
    self->_pathMonitor = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v19 = timeoutTimer;
    dispatch_source_cancel(v19);
    uint64_t v20 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  urlSession = self->_urlSession;
  self->_urlSession = 0;
}

- (void)_pathMonitorUpdated:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = logger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_18E2F5000, v5, OS_LOG_TYPE_DEFAULT, "Path monitor update: path=%@", (uint8_t *)&v6, 0xCu);
  }

  if (nw_path_get_status(v4) == nw_path_status_satisfied) {
    [(CUReachabilityMonitor *)self _complete:0];
  }
}

- (void)_pathMonitorStart
{
  v3 = (OS_nw_path_monitor *)nw_path_monitor_create();
  pathMonitor = self->_pathMonitor;
  self->_pathMonitor = v3;

  nw_path_monitor_set_queue((nw_path_monitor_t)self->_pathMonitor, (dispatch_queue_t)self->_dispatchQueue);
  objc_initWeak(&location, self);
  uint64_t v5 = self->_pathMonitor;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CUReachabilityMonitor__pathMonitorStart__block_invoke;
  v6[3] = &unk_1E55BE990;
  objc_copyWeak(&v7, &location);
  nw_path_monitor_set_update_handler(v5, v6);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__CUReachabilityMonitor__pathMonitorStart__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _pathMonitorUpdated:v3];
}

- (void)_startDownload
{
  id v3 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  [v3 setDiscretionary:0];
  [v3 setHTTPCookieAcceptPolicy:1];
  [v3 setHTTPCookieStorage:0];
  [v3 setHTTPShouldSetCookies:0];
  [v3 setRequestCachePolicy:1];
  [v3 setURLCredentialStorage:0];
  [v3 setURLCache:0];
  [v3 setWaitsForConnectivity:1];
  id v19 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v19 setUnderlyingQueue:self->_dispatchQueue];
  id v4 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v3 delegate:self delegateQueue:v19];
  urlSession = self->_urlSession;
  self->_urlSession = v4;

  if (self->_urlSession)
  {
    int v12 = self->_destinationURL;
    int v13 = [(NSURLSession *)self->_urlSession downloadTaskWithURL:v12];
    if (v13)
    {
      id v15 = v13;
      LODWORD(v14) = 1.0;
      [v13 setPriority:v14];
      [v15 resume];
LABEL_4:

      goto LABEL_5;
    }
    id v16 = "Create DownloadTask failed";
  }
  else
  {
    int v12 = 0;
    id v16 = "Create NSURLSession failed";
  }
  uint64_t v17 = NSErrorWithOSStatusF(4294960596, (uint64_t)v16, v6, v7, v8, v9, v10, v11, v18);
  if (v17)
  {
    id v15 = (void *)v17;
    [(CUReachabilityMonitor *)self _complete:v17];
    goto LABEL_4;
  }
LABEL_5:
}

- (BOOL)_captiveDetectedCheck
{
  v13[1] = *MEMORY[0x1E4F143B8];
  int captiveNotifyToken = self->_captiveNotifyToken;
  v13[0] = 0;
  notify_get_state(captiveNotifyToken, v13);
  uint64_t v4 = v13[0];
  uint64_t v5 = logger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v13[0]) = 67109120;
    HIDWORD(v13[0]) = v4 == 1;
    _os_log_impl(&dword_18E2F5000, v5, OS_LOG_TYPE_DEFAULT, "Captive network state: detected=%{BOOL}d", (uint8_t *)v13, 8u);
  }

  if (v4 == 1)
  {
    uint64_t v11 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 301047, (uint64_t)"Captive network detected", v6, v7, v8, v9, v10, v13[0]);
    [(CUReachabilityMonitor *)self _complete:v11];
  }
  return v4 == 1;
}

- (void)_activate
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!self->_urlSession)
  {
    if (!self->_destinationURL)
    {
      id v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://captive.apple.com"];
      destinationURL = self->_destinationURL;
      self->_destinationURL = v3;
    }
    uint64_t v5 = logger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t mode = self->_mode;
      if (mode > 2) {
        uint64_t v7 = @"?";
      }
      else {
        uint64_t v7 = off_1E55BE9B0[mode];
      }
      uint64_t v8 = self->_destinationURL;
      double timeout = self->_timeout;
      *(_DWORD *)buf = 138412802;
      stat v26 = v7;
      __int16 v27 = 2112;
      uint64_t v28 = v8;
      __int16 v29 = 2048;
      double v30 = timeout;
      _os_log_impl(&dword_18E2F5000, v5, OS_LOG_TYPE_DEFAULT, "Activate: mode=%@, url=%@, timeout=%f seconds", buf, 0x20u);
    }

    if ((unint64_t)(self->_mode - 1) > 1) {
      goto LABEL_12;
    }
    objc_initWeak((id *)buf, self);
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __34__CUReachabilityMonitor__activate__block_invoke;
    handler[3] = &unk_1E55BE940;
    objc_copyWeak(&v24, (id *)buf);
    notify_register_dispatch("com.apple.coreutils.captive-network-state", &self->_captiveNotifyToken, dispatchQueue, handler);
    LOBYTE(dispatchQueue) = [(CUReachabilityMonitor *)self _captiveDetectedCheck];
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
    if ((dispatchQueue & 1) == 0)
    {
LABEL_12:
      if (self->_timeout > 0.0)
      {
        uint64_t v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        timeoutTimer = self->_timeoutTimer;
        self->_timeoutTimer = v11;

        objc_initWeak((id *)buf, self);
        int v13 = self->_timeoutTimer;
        uint64_t v18 = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        uint64_t v20 = __34__CUReachabilityMonitor__activate__block_invoke_2;
        uint64_t v21 = &unk_1E55BE968;
        objc_copyWeak(&v22, (id *)buf);
        dispatch_source_set_event_handler(v13, &v18);
        double v14 = self->_timeoutTimer;
        unint64_t v15 = (unint64_t)(self->_timeout * 1000000000.0);
        dispatch_time_t v16 = dispatch_time(0, v15);
        dispatch_source_set_timer(v14, v16, 0xFFFFFFFFFFFFFFFFLL, v15 >> 2);
        dispatch_resume((dispatch_object_t)self->_timeoutTimer);
        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
      }
      int64_t v17 = self->_mode;
      switch(v17)
      {
        case 2:
          goto LABEL_17;
        case 1:
          [(CUReachabilityMonitor *)self _pathMonitorStart];
          break;
        case 0:
LABEL_17:
          self->_uint64_t downloadStatus = 1;
          [(CUReachabilityMonitor *)self _startDownload];
          break;
      }
    }
  }
}

void __34__CUReachabilityMonitor__activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _captiveDetectedCheck];
}

void __34__CUReachabilityMonitor__activate__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960574, (uint64_t)"Timeout", v1, v2, v3, v4, v5, v7);
  [WeakRetained _complete:v6];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CUReachabilityMonitor_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__CUReachabilityMonitor_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)dealloc
{
  urlSession = self->_urlSession;
  uint64_t v4 = logger();
  uint64_t v5 = v4;
  if (urlSession)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18E2F5000, v5, OS_LOG_TYPE_DEFAULT, "dealloc: active", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18E2F5000, v5, OS_LOG_TYPE_DEBUG, "dealloc: inactive", buf, 2u);
  }

  int captiveNotifyToken = self->_captiveNotifyToken;
  if (captiveNotifyToken != -1)
  {
    notify_cancel(captiveNotifyToken);
    self->_int captiveNotifyToken = -1;
  }
  pathMonitor = self->_pathMonitor;
  if (pathMonitor)
  {
    nw_path_monitor_cancel(pathMonitor);
    uint64_t v8 = self->_pathMonitor;
    self->_pathMonitor = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    uint64_t v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  int v12 = self->_urlSession;
  if (v12)
  {
    [(NSURLSession *)v12 invalidateAndCancel];
    int v13 = self->_urlSession;
    self->_urlSession = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)CUReachabilityMonitor;
  [(CUReachabilityMonitor *)&v14 dealloc];
}

- (CUReachabilityMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUReachabilityMonitor;
  uint64_t v2 = [(CUReachabilityMonitor *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_int captiveNotifyToken = -1;
    uint64_t v3 = v2;
  }

  return v2;
}

@end