@interface CMContinuityCaptureiOSNotificationCenter
- (BOOL)shouldDisplayNotification:(int64_t)a3;
- (CMContinuityCaptureiOSNotificationCenter)initWithQueue:(id)a3;
- (void)_scheduleNotification:(int64_t)a3 data:(id)a4;
- (void)scheduleNotification:(int64_t)a3 data:(id)a4;
@end

@implementation CMContinuityCaptureiOSNotificationCenter

- (CMContinuityCaptureiOSNotificationCenter)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMContinuityCaptureiOSNotificationCenter;
  v6 = [(CMContinuityCaptureUserNotificationCenter *)&v10 initWithQueue:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)scheduleNotification:(int64_t)a3 data:(id)a4
{
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__CMContinuityCaptureiOSNotificationCenter_scheduleNotification_data___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureiOSNotificationCenter_scheduleNotification_data___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _scheduleNotification:*(void *)(a1 + 48) data:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_scheduleNotification:(int64_t)a3 data:(id)a4
{
  v48[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [(CMContinuityCaptureiOSNotificationCenter *)self shouldDisplayNotification:a3];
  id v8 = 0;
  v9 = 0;
  id v10 = 0;
  v11 = 0;
  if (!v6 || !v7) {
    goto LABEL_14;
  }
  v9 = [v6 objectForKey:@"kContinuityCaptureNotificationKeyTitle"];

  if (!v9)
  {
    id v8 = 0;
    id v10 = 0;
LABEL_17:
    v11 = 0;
    goto LABEL_14;
  }
  id v10 = [v6 objectForKey:@"kContinuityCaptureNotificationKeyBody"];

  if (!v10)
  {
    id v8 = 0;
    v9 = 0;
    goto LABEL_17;
  }
  v11 = [v6 objectForKey:@"kContinuityCaptureNotificationKeyButtonTitle"];

  if (v11)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v12 = [v6 objectForKeyedSubscript:@"kContinuityCaptureNotificationKeyTitle"];
    v13 = [v6 objectForKeyedSubscript:@"kContinuityCaptureNotificationKeyTitleArgs"];
    id v8 = CMContinuityCaptureCreateLocalizedString(v12, v13, v14, v15, v16, v17, v18, v19, v41);

    v20 = [v6 objectForKeyedSubscript:@"kContinuityCaptureNotificationKeyBody"];
    v21 = [v6 objectForKeyedSubscript:@"kContinuityCaptureNotificationKeyBodyArgs"];
    v9 = CMContinuityCaptureCreateLocalizedString(v20, v21, v22, v23, v24, v25, v26, v27, v42);

    v28 = [v6 objectForKeyedSubscript:@"kContinuityCaptureNotificationKeyButtonTitle"];
    v29 = [v6 objectForKeyedSubscript:@"kContinuityCaptureNotificationKeyButtonTitle"];
    id v10 = CMContinuityCaptureCreateLocalizedString(v28, v29, v30, v31, v32, v33, v34, v35, v43);

    uint64_t v36 = *MEMORY[0x263EFFFD8];
    v47[0] = *MEMORY[0x263EFFFC8];
    v47[1] = v36;
    v48[0] = v8;
    v48[1] = v9;
    uint64_t v37 = *MEMORY[0x263EFFFE0];
    v47[2] = *MEMORY[0x263F00000];
    v47[3] = v37;
    v48[2] = v10;
    v48[3] = MEMORY[0x263EFFA88];
    v11 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
    v38 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v11;
      _os_log_impl(&dword_235FC2000, v38, OS_LOG_TYPE_DEFAULT, "Displaying UI notification: %@", buf, 0xCu);
    }

    SInt32 error = 0;
    CFUserNotificationRef v39 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 2uLL, &error, (CFDictionaryRef)v11);
    if (v39 && !error) {
      goto LABEL_13;
    }
    v40 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureiOSNotificationCenter _scheduleNotification:data:](&error, (uint64_t)v39, v40);
    }

    if (v39) {
LABEL_13:
    }
      CFRelease(v39);
  }
  else
  {
    id v8 = 0;
    v9 = 0;
    id v10 = 0;
  }
LABEL_14:
}

- (BOOL)shouldDisplayNotification:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 != 12)
  {
    id v5 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      id v8 = self;
      __int16 v9 = 1024;
      int v10 = a3;
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Unsupported Notification Type for iOS Platform. (Type: %d)", (uint8_t *)&v7, 0x12u);
    }
  }
  return a3 == 12;
}

- (void).cxx_destruct
{
}

- (void)_scheduleNotification:(os_log_t)log data:.cold.1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "CFUserNotificationCreate gave error %d with notification result %p", (uint8_t *)v4, 0x12u);
}

@end