@interface _FPDExtensionRequestRecord
- (FPXPCAutomaticErrorProxy)proxy;
- (_FPDExtensionRequestRecord)initWithSelector:(SEL)a3 proxy:(id)a4 timeout:(double)a5 queue:(id)a6 log:(id)a7 timeoutHandler:(id)a8;
- (const)_timeoutExpirationState;
- (id)description;
- (void)_handleTimeout;
- (void)_setupProgressTimer;
- (void)_setupTimer:(double)a3;
- (void)cancelTimeout;
- (void)monitorProgress:(id)a3;
@end

@implementation _FPDExtensionRequestRecord

- (_FPDExtensionRequestRecord)initWithSelector:(SEL)a3 proxy:(id)a4 timeout:(double)a5 queue:(id)a6 log:(id)a7 timeoutHandler:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_FPDExtensionRequestRecord;
  v18 = [(_FPDExtensionRequestRecord *)&v26 init];
  v19 = v18;
  if (v18)
  {
    if (a3) {
      SEL v20 = a3;
    }
    else {
      SEL v20 = 0;
    }
    v18->_selector = v20;
    objc_storeWeak((id *)&v18->_proxy, v14);
    if (a5 > 0.0)
    {
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a5];
      timeout = v19->_timeout;
      v19->_timeout = (NSDate *)v21;
    }
    objc_storeStrong((id *)&v19->_queue, a6);
    objc_storeStrong((id *)&v19->_log, a7);
    uint64_t v23 = MEMORY[0x1D9471EC0](v17);
    id handler = v19->_handler;
    v19->_id handler = (id)v23;

    [(_FPDExtensionRequestRecord *)v19 _setupTimer:a5];
  }

  return v19;
}

- (void)cancelTimeout
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v6 = self->_progressTimer;
    self->_progressTimer = 0;
  }
  fractionCompletedObservation = self->_fractionCompletedObservation;
  if (fractionCompletedObservation)
  {
    [(NSObservation *)fractionCompletedObservation finishObserving];
    v8 = self->_fractionCompletedObservation;
    self->_fractionCompletedObservation = 0;
  }
}

- (void)_setupTimer:(double)a3
{
  if (!self->_handler)
  {
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"[ASSERT] ‼️ setting up timer without a timeout handler", a3);
    v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
    }

    __assert_rtn("-[_FPDExtensionRequestRecord _setupTimer:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionRequestRecord.m", 116, (const char *)[v12 UTF8String]);
  }
  if (a3 > 0.0)
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v5;

    v7 = self->_timer;
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_set_qos_class_fallback();
    id location = 0;
    objc_initWeak(&location, self);
    v9 = self->_timer;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42___FPDExtensionRequestRecord__setupTimer___block_invoke;
    v14[3] = &unk_1E6A74010;
    objc_copyWeak(&v15, &location);
    v10 = v9;
    dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v14);
    dispatch_source_set_event_handler(v10, v11);

    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (FPXPCAutomaticErrorProxy)proxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);
  return (FPXPCAutomaticErrorProxy *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxy);
  objc_storeStrong((id *)&self->_fractionCompletedObservation, 0);
  objc_storeStrong((id *)&self->_lastEventDate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)monitorProgress:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_timeout)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46___FPDExtensionRequestRecord_monitorProgress___block_invoke;
    v7[3] = &unk_1E6A736C0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_handleTimeout
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: soft expiration reached, cancelling progress", v1, 0xCu);
}

- (void)_setupProgressTimer
{
  if (!self->_handler)
  {
    id v15 = [NSString stringWithFormat:@"[ASSERT] ‼️ setting up timer without a timeout handler"];
    id v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
    }

    __assert_rtn("-[_FPDExtensionRequestRecord _setupProgressTimer]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionRequestRecord.m", 144, (const char *)[v15 UTF8String]);
  }
  v3 = +[FPDConfigurationStore defaultStore];
  [v3 upcallExcutionTimeLimitStaleProgress];
  double v5 = v4;
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v7 = self->_progressTimer;
    self->_progressTimer = 0;
  }
  if (v5 > 0.0)
  {
    id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    v9 = self->_progressTimer;
    self->_progressTimer = v8;

    v10 = self->_progressTimer;
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)((v5 + 5.0) * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_set_qos_class_fallback();
    id location = 0;
    objc_initWeak(&location, self);
    v12 = self->_progressTimer;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49___FPDExtensionRequestRecord__setupProgressTimer__block_invoke;
    v17[3] = &unk_1E6A74010;
    objc_copyWeak(&v18, &location);
    v13 = v12;
    dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
    dispatch_source_set_event_handler(v13, v14);

    dispatch_resume((dispatch_object_t)self->_progressTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (const)_timeoutExpirationState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained timeoutState];
    double v5 = "not expired";
    if (v4 == 1) {
      double v5 = "soft expired";
    }
    if (v4 == 2) {
      v6 = "hard expired";
    }
    else {
      v6 = v5;
    }
  }
  else
  {
    v6 = "no proxy";
  }

  return v6;
}

- (id)description
{
  progress = self->_progress;
  if (progress)
  {
    uint64_t v4 = NSString;
    [(NSProgress *)progress fractionCompleted];
    objc_msgSend(v4, "stringWithFormat:", @"%.1f%%", v5 * 100.0);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"no progress";
  }
  SEL selector = self->_selector;
  id v8 = NSString;
  if (self->_timeout)
  {
    if (selector) {
      v9 = self->_selector;
    }
    else {
      v9 = 0;
    }
    dispatch_time_t v11 = NSStringFromSelector(v9);
    [v8 stringWithFormat:@"%@ (%@ - %s), %@", v11, self->_timeout, -[_FPDExtensionRequestRecord _timeoutExpirationState](self, "_timeoutExpirationState"), v6];
  }
  else
  {
    if (selector) {
      v10 = self->_selector;
    }
    else {
      v10 = 0;
    }
    dispatch_time_t v11 = NSStringFromSelector(v10);
    [v8 stringWithFormat:@"%@ (no timeout), %@", v11, v6, v14, v15];
  v12 = };

  return v12;
}

@end