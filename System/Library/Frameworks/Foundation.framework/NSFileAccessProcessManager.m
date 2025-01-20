@interface NSFileAccessProcessManager
+ (BOOL)needToManageConnection:(id)a3 forURLs:(id)a4;
- (NSArray)URLs;
- (NSFileAccessProcessManager)initWithClient:(id)a3 queue:(id)a4;
- (id)suspensionHandler;
- (void)_ensureMonitor;
- (void)allowSuspension;
- (void)dealloc;
- (void)invalidate;
- (void)killProcessWithMessage:(id)a3;
- (void)preventSuspensionWithActivityName:(id)a3;
- (void)processSuspended;
- (void)safelySendMessageWithReplyUsingBlock:(id)a3;
- (void)setSuspensionHandler:(id)a3;
- (void)setURLs:(id)a3;
@end

@implementation NSFileAccessProcessManager

- (void)preventSuspensionWithActivityName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1EDA28 != -1) {
    dispatch_once(&qword_1EB1EDA28, &__block_literal_global_110);
  }
  if (_MergedGlobals_138
    && +[NSFileAccessProcessManager needToManageConnection:self->_connection forURLs:self->_urls]&& !self->_assertionToken)
  {
    v5 = (void *)xpc_connection_copy_bundle_id();
    if (v5)
    {
      uint64_t pid = xpc_connection_get_pid(self->_connection);
      v7 = _NSFCProcessMonitorLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8[0] = 67109378;
        v8[1] = pid;
        __int16 v9 = 2114;
        id v10 = a3;
        _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "Scheduling suspension prevention of pid %d for activity: %{public}@", (uint8_t *)v8, 0x12u);
      }
      self->_assertionToken = [+[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance] addAssertionWithName:a3 forPID:pid];
    }
    free(v5);
  }
}

- (void)invalidate
{
  [(NSFileAccessProcessManager *)self setSuspensionHandler:0];
  [+[NSFileAccessProcessMonitor sharedInstance] removeProcessManager:self forPID:self->_pid];

  [(NSFileAccessProcessManager *)self allowSuspension];
}

- (void)_ensureMonitor
{
  if ((self->_suspensionHandler || self->_pendingMessageCount >= 1)
    && +[NSFileAccessProcessManager needToManageConnection:self->_connection forURLs:self->_urls])
  {
    v3 = +[NSFileAccessProcessMonitor sharedInstance];
    uint64_t pid = self->_pid;
    [(NSFileAccessProcessMonitor *)v3 addProcessManager:self forPID:pid];
  }
  else
  {
    v5 = +[NSFileAccessProcessMonitor sharedInstance];
    uint64_t v6 = self->_pid;
    [(NSFileAccessProcessMonitor *)v5 removeProcessManager:self forPID:v6];
  }
}

+ (BOOL)needToManageConnection:(id)a3 forURLs:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![a4 count]) {
    return 0;
  }
  if (qword_1EB1EDA00 != -1) {
    dispatch_once(&qword_1EB1EDA00, &__block_literal_global_63);
  }
  if (!off_1EB1ED9F8)
  {
    v19 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buffer = 0;
      _os_log_error_impl(&dword_181795000, v19, OS_LOG_TYPE_ERROR, "Could not find SecTaskCopySigningIdentifier symbol", (uint8_t *)buffer, 2u);
    }
    return 1;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  xpc_connection_get_audit_token();
  uint64_t v5 = *MEMORY[0x1E4F1CFB0];
  *(_OWORD *)buffer = 0u;
  long long v40 = 0u;
  CFStringRef v6 = (const __CFString *)off_1EB1ED9F0(v5, buffer);
  CFTypeRef cf = 0;
  CFStringRef v7 = (const __CFString *)off_1EB1ED9F8(v6, &cf);
  if (!v7)
  {
    v20 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buffer = 138412290;
      *(void *)&buffer[4] = cf;
      _os_log_error_impl(&dword_181795000, v20, OS_LOG_TYPE_ERROR, "Could not get signing identifier: %@", (uint8_t *)buffer, 0xCu);
    }
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_41;
  }
  CFStringRef v8 = v7;
  if (!CFStringGetCStringPtr(v7, 0x8000100u) && !CFStringGetCString(v8, buffer, 1024, 0x8000100u))
  {
    v25 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v36 = v8;
      _os_log_error_impl(&dword_181795000, v25, OS_LOG_TYPE_ERROR, "Could not convert signing identifier %{public}@", buf, 0xCu);
    }
LABEL_41:
    CFStringRef v24 = v6;
LABEL_42:
    CFRelease(v24);
    return 1;
  }
  __int16 v9 = (const char *)container_create_or_lookup_path_for_current_user();
  if (!v9)
  {
    v22 = _NSFCProcessMonitorLog();
    v23 = v22;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v36 = v8;
      __int16 v37 = 2048;
      uint64_t v38 = 1;
      _os_log_error_impl(&dword_181795000, v23, OS_LOG_TYPE_ERROR, "Could not get container for signing identifier %{public}@. Error: %llu", buf, 0x16u);
    }
    CFRelease(v6);
    CFStringRef v24 = v8;
    goto LABEL_42;
  }
  id v10 = [[NSString alloc] initWithBytesNoCopy:v9 length:strlen(v9) encoding:4 freeWhenDone:1];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v11 = [a4 countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v32;
    *(void *)&long long v12 = 138478083;
    long long v27 = v12;
    CFStringRef v28 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(a4);
        }
        v16 = (__CFString *)objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "path", v27);
        if ([(__CFString *)v16 hasPrefix:@"/var"]) {
          v16 = (__CFString *)[@"/private" stringByAppendingString:v16];
        }
        if (![(__CFString *)v16 hasPrefix:v10]
          || [(__CFString *)v16 containsString:@"/com.apple.watchconnectivity/"])
        {
          v21 = _NSFCProcessMonitorLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543619;
            CFStringRef v36 = v8;
            __int16 v37 = 2113;
            uint64_t v38 = (uint64_t)v16;
            _os_log_debug_impl(&dword_181795000, v21, OS_LOG_TYPE_DEBUG, "Will be managing connection for %{public}@ because path is not private %{private}@", buf, 0x16u);
          }
          BOOL v18 = 1;
          CFStringRef v6 = v28;
          goto LABEL_35;
        }
        v17 = _NSFCProcessMonitorLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v27;
          CFStringRef v36 = v16;
          __int16 v37 = 2114;
          uint64_t v38 = (uint64_t)v8;
          _os_log_debug_impl(&dword_181795000, v17, OS_LOG_TYPE_DEBUG, "Skipping path %{private}@ for %{public}@ because path it is private", buf, 0x16u);
        }
      }
      uint64_t v13 = [a4 countByEnumeratingWithState:&v31 objects:v30 count:16];
      BOOL v18 = 0;
      CFStringRef v6 = v28;
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_35:
  CFRelease(v6);
  CFRelease(v8);

  return v18;
}

- (void)setSuspensionHandler:(id)a3
{
  id suspensionHandler = self->_suspensionHandler;
  if (suspensionHandler != a3)
  {

    self->_id suspensionHandler = (id)[a3 copy];
    [(NSFileAccessProcessManager *)self _ensureMonitor];
  }
}

- (void)setURLs:(id)a3
{
  urls = self->_urls;
  if (urls != a3)
  {

    self->_urls = (NSArray *)[a3 copy];
    [(NSFileAccessProcessManager *)self _ensureMonitor];
  }
}

- (NSFileAccessProcessManager)initWithClient:(id)a3 queue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSFileAccessProcessManager;
  CFStringRef v6 = [(NSFileAccessProcessManager *)&v8 init];
  if (v6)
  {
    v6->_connection = (OS_xpc_object *)xpc_retain(a3);
    v6->_uint64_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [+[NSFileAccessProcessMonitor sharedInstance] removeProcessManager:self forPID:self->_pid];
  connection = self->_connection;
  if (connection) {
    xpc_release(connection);
  }
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  id assertionToken = self->_assertionToken;
  if (assertionToken)
  {
    [+[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance] removeAssertionWithToken:self->_assertionToken];
    id assertionToken = self->_assertionToken;
  }

  v6.receiver = self;
  v6.super_class = (Class)NSFileAccessProcessManager;
  [(NSFileAccessProcessManager *)&v6 dealloc];
}

- (void)allowSuspension
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    pid_t pid = xpc_connection_get_pid(self->_connection);
    v6[0] = 67109120;
    v6[1] = pid;
    _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "Re-allowing suspension for pid: %d", (uint8_t *)v6, 8u);
  }
  id assertionToken = self->_assertionToken;
  if (assertionToken)
  {
    [+[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance] removeAssertionWithToken:self->_assertionToken];
    id assertionToken = self->_assertionToken;
  }

  self->_id assertionToken = 0;
}

void *__61__NSFileAccessProcessManager_needToManageConnection_forURLs___block_invoke()
{
  result = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (result)
  {
    v1 = result;
    off_1EB1ED9F0 = (uint64_t (*)(void, void))dlsym(result, "SecTaskCreateWithAuditToken");
    result = dlsym(v1, "SecTaskCopySigningIdentifier");
    off_1EB1ED9F8 = (uint64_t (*)(void, void))result;
  }
  return result;
}

- (void)processSuspended
{
  v3[5] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__NSFileAccessProcessManager_processSuspended__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = self;
  dispatch_async(queue, v3);
}

uint64_t __46__NSFileAccessProcessManager_processSuspended__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Detected process suspension: %i", (uint8_t *)v7, 8u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v4 + 32);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(int *)(v4 + 56) >= 1)
  {
    objc_super v6 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_181795000, v6, OS_LOG_TYPE_DEFAULT, "Killing process because it has oustanding messages", (uint8_t *)v7, 2u);
    }
    return [*(id *)(a1 + 32) killProcessWithMessage:@"The process did not finish responding to an NSFilePresenter message before being suspended"];
  }
  return result;
}

- (id)suspensionHandler
{
  id v2 = self->_suspensionHandler;

  return v2;
}

- (NSArray)URLs
{
  id v2 = self->_urls;

  return v2;
}

- (void)killProcessWithMessage:(id)a3
{
  uint64_t pid = xpc_connection_get_pid(self->_connection);
  if (qword_1EB1EDA20 != -1) {
    dispatch_once(&qword_1EB1EDA20, &__block_literal_global_106);
  }
  if (off_1EB1EDA08) {
    off_1EB1EDA08(pid, 0, a3);
  }

  kill(pid, 9);
}

- (void)safelySendMessageWithReplyUsingBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1EDA28 != -1) {
    dispatch_once(&qword_1EB1EDA28, &__block_literal_global_110);
  }
  if (_MergedGlobals_138
    && +[NSFileAccessProcessManager needToManageConnection:self->_connection forURLs:self->_urls])
  {
    uint64_t v5 = (char *)xpc_connection_copy_bundle_id();
    if (v5)
    {
      ++self->_pendingMessageCount;
      [(NSFileAccessProcessManager *)self _ensureMonitor];
      uint64_t pid = xpc_connection_get_pid(self->_connection);
      BOOL v7 = [+[NSFileAccessProcessMonitor sharedInstance] processWithPIDIsSuspended:pid];
      uint64_t v8 = _NSFCProcessMonitorLog();
      uint64_t v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = pid;
          _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Killing %d because it was suspended when we tried to send it an NSFilePresenter message", (uint8_t *)&buf, 8u);
        }
        -[NSFileAccessProcessManager killProcessWithMessage:](self, "killProcessWithMessage:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Tried to send an NSFilePresenter message requiring a response, but process was suspended. You should unregister NSFilePresenters when a process is no longer active. The NSFilePresenter being messaged has a presentedItemURL of '%@'", objc_msgSend(-[NSArray firstObject](self->_urls, "firstObject"), "path")));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_31;
        v15[3] = &unk_1E51F71D0;
        v15[4] = self;
        (*((void (**)(id, void *))a3 + 2))(a3, v15);
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 136446210;
          *(void *)((char *)&buf + 4) = v5;
          _os_log_debug_impl(&dword_181795000, v9, OS_LOG_TYPE_DEBUG, "Taking assertion for %{public}s while sending it an NSFilePresenter message", (uint8_t *)&buf, 0xCu);
        }
        uint64_t v11 = _NSFCProcessMonitorLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          long long v12 = strdup(v5);
        }
        else {
          long long v12 = 0;
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v20 = 0x3052000000;
        v21 = __Block_byref_object_copy__21;
        v22 = __Block_byref_object_dispose__21;
        uint64_t v23 = 0;
        id v13 = objc_alloc(objc_lookUpClass("BKSProcessAssertion"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke;
        v18[3] = &unk_1E51FB198;
        v18[4] = self;
        v18[5] = a3;
        v18[6] = &buf;
        v18[7] = v12;
        uint64_t v14 = (void *)[v13 initWithPID:pid flags:3 reason:4 name:@"filecoordinationd waiting for response from NSFilePresenter" withHandler:v18];
        *(void *)(*((void *)&buf + 1) + 40) = v14;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_24;
        v16[3] = &unk_1E51F7B08;
        int v17 = pid;
        v16[4] = self;
        [v14 setInvalidationHandler:v16];
        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      (*((void (**)(id, void))a3 + 2))(a3, 0);
    }
    free(v5);
  }
  else
  {
    id v10 = (void (*)(id, void))*((void *)a3 + 2);
    v10(a3, 0);
  }
}

void __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v1 = *(_OWORD *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 48);
  int v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_2;
  block[3] = &unk_1E51FB170;
  long long v5 = v1;
  long long v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_3;
  v3[3] = &unk_1E51FB148;
  uint64_t v1 = *(void *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  return (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v2 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    int v4 = 136446210;
    uint64_t v5 = v3;
    _os_log_debug_impl(&dword_181795000, v2, OS_LOG_TYPE_DEBUG, "Releasing assertion after sending message to %{public}s", (uint8_t *)&v4, 0xCu);
  }
  --*(_DWORD *)(*(void *)(a1 + 32) + 56);
  [*(id *)(a1 + 32) _ensureMonitor];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setInvalidationHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];

  free(*(void **)(a1 + 48));
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_24(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v2 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Killing %d because it was suspended before replying to an NSFilePresenter method", (uint8_t *)v5, 8u);
  }
  return [*(id *)(a1 + 32) killProcessWithMessage:@"The process did not finish responding to an NSFilePresenter message before being suspended."];
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_31(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureMonitor];
}

@end