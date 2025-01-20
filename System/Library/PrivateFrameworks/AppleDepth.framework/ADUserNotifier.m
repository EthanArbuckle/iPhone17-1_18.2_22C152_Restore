@interface ADUserNotifier
+ (id)defaultUserNotifier;
- (ADUserNotifier)init;
- (BOOL)createNotificationWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6 responseBlock:(id)a7;
- (id)buildTapToRadarURLWithRadarTitle:(id)a3 radarComponent:(unint64_t)a4;
- (void)dealloc;
- (void)dismissNotification;
- (void)setComponentID:(id)a3 componentName:(id)a4 forQuery:(id)a5;
- (void)showUserNotificationWithTitle:(id)a3 message:(id)a4;
- (void)triggerApplicationWithNotificationTitle:(id)a3 notificationMessage:(id)a4 acceptButtonText:(id)a5 rejectButtonText:(id)a6 applicationURL:(id)a7;
- (void)triggerTapToRadarWithNotificationTitle:(id)a3 notificationMessage:(id)a4 radarTitle:(id)a5 radarComponent:(unint64_t)a6;
@end

@implementation ADUserNotifier

- (void).cxx_destruct
{
}

- (id)buildTapToRadarURLWithRadarTitle:(id)a3 radarComponent:(unint64_t)a4
{
  v31[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9A0];
  v30[0] = @"Title";
  v30[1] = @"Classification";
  id v22 = v6;
  v31[0] = v6;
  v31[1] = @"Other Bug";
  v30[2] = @"Reproducibility";
  v31[2] = @"I Didn't Try";
  v8 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  v9 = [v7 dictionaryWithDictionary:v8];

  if (a4 >= 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v29 = a4;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADUserNotifier: Unknown radar component: %lu", buf, 0xCu);
    }
  }
  else
  {
    [(ADUserNotifier *)self setComponentID:off_26425BAA0[a4] componentName:off_26425BAC0[a4] forQuery:v9];
  }
  v10 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x263F08BD0];
        v17 = [v11 objectForKeyedSubscript:v15];
        v18 = [v16 queryItemWithName:v15 value:v17];
        [v10 addObject:v18];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  v19 = [MEMORY[0x263F08BA0] componentsWithString:@"tap-to-radar://new"];
  [v19 setQueryItems:v10];
  v20 = [v19 URL];

  return v20;
}

- (void)setComponentID:(id)a3 componentName:(id)a4 forQuery:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = a5;
  [v8 setObject:v9 forKey:@"ComponentID"];
  [v8 setObject:v7 forKey:@"ComponentName"];
}

- (void)dealloc
{
  [(ADUserNotifier *)self dismissNotification];
  v3.receiver = self;
  v3.super_class = (Class)ADUserNotifier;
  [(ADUserNotifier *)&v3 dealloc];
}

- (void)dismissNotification
{
  source = self->_source;
  if (source)
  {
    CFRunLoopSourceInvalidate(source);
    CFRelease(self->_source);
    self->_source = 0;
  }
  if (self->_notification)
  {
    objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (ADUserNotificationAlertResultBlockMap(void)::onceToken != -1) {
      dispatch_once(&ADUserNotificationAlertResultBlockMap(void)::onceToken, &__block_literal_global);
    }
    id v4 = (id)ADUserNotificationAlertResultBlockMap(void)::s_map;
    [v4 removeObjectForKey:v5];
    CFUserNotificationCancel(self->_notification);
    CFRelease(self->_notification);
    self->_notification = 0;
  }
}

- (BOOL)createNotificationWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6 responseBlock:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (+[ADDeviceConfiguration isInternalBuild])
  {
    if (self->_notification)
    {
      BOOL v17 = 0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v12;
        v18 = &_os_log_internal;
        v19 = "Another notification is currently active, canceling notification with title: %@";
LABEL_8:
        _os_log_impl(&dword_215F16000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
LABEL_24:
        BOOL v17 = 0;
      }
    }
    else
    {
      CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263EFFFC8], v12);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263EFFFD8], v13);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F00000], v14);
      if (v15) {
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263EFFFE8], v15);
      }
      SInt32 error = 0;
      id v22 = CFUserNotificationCreate(v20, 0.0, 0, &error, Mutable);
      self->_notification = v22;
      if (!v22)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = error;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create a user notification with error %i", buf, 8u);
        }
        goto LABEL_24;
      }
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v20, v22, (CFUserNotificationCallBack)userNotificationCallback, 0);
      self->_source = RunLoopSource;
      if (!RunLoopSource)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create user notifier run loop source", buf, 2u);
        }
        goto LABEL_24;
      }
      long long v24 = [MEMORY[0x263F08D40] valueWithPointer:self->_notification];
      if (ADUserNotificationAlertResultBlockMap(void)::onceToken != -1) {
        dispatch_once(&ADUserNotificationAlertResultBlockMap(void)::onceToken, &__block_literal_global);
      }
      id v25 = (id)ADUserNotificationAlertResultBlockMap(void)::s_map;
      long long v26 = (void *)MEMORY[0x2166C6370](v16);
      [v25 setObject:v26 forKey:v24];

      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, self->_source, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v12;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Notification has been triggered with title: %@", buf, 0xCu);
      }
      CFRelease(Mutable);

      BOOL v17 = 1;
    }
  }
  else
  {
    if (!ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v12;
        _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Customer build, canceling notification with title: %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
    BOOL v17 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v12;
      v18 = &_os_log_internal;
      v19 = "Customer build, canceling notification with title: %@";
      goto LABEL_8;
    }
  }

  return v17;
}

- (void)triggerTapToRadarWithNotificationTitle:(id)a3 notificationMessage:(id)a4 radarTitle:(id)a5 radarComponent:(unint64_t)a6
{
  id v12 = a3;
  id v10 = a4;
  id v11 = [(ADUserNotifier *)self buildTapToRadarURLWithRadarTitle:a5 radarComponent:a6];
  [(ADUserNotifier *)self triggerApplicationWithNotificationTitle:v12 notificationMessage:v10 acceptButtonText:@"File a radar" rejectButtonText:@"Cancel" applicationURL:v11];
}

- (void)triggerApplicationWithNotificationTitle:(id)a3 notificationMessage:(id)a4 acceptButtonText:(id)a5 rejectButtonText:(id)a6 applicationURL:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v16;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Triggering notification with title: %@; Application URL: %@",
      buf,
      0x16u);
  }
  notificationQueue = self->_notificationQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __127__ADUserNotifier_triggerApplicationWithNotificationTitle_notificationMessage_acceptButtonText_rejectButtonText_applicationURL___block_invoke;
  v23[3] = &unk_26425BA60;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v15;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v15;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(notificationQueue, v23);
}

void __127__ADUserNotifier_triggerApplicationWithNotificationTitle_notificationMessage_acceptButtonText_rejectButtonText_applicationURL___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __127__ADUserNotifier_triggerApplicationWithNotificationTitle_notificationMessage_acceptButtonText_rejectButtonText_applicationURL___block_invoke_2;
  v7[3] = &unk_26425BA38;
  objc_copyWeak(&v9, &location);
  id v8 = *(id *)(a1 + 72);
  [v2 createNotificationWithTitle:v3 message:v4 defaultButton:v5 alternateButton:v6 responseBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __127__ADUserNotifier_triggerApplicationWithNotificationTitle_notificationMessage_acceptButtonText_rejectButtonText_applicationURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissNotification];

  if (a2 == 1)
  {
    id v5 = [MEMORY[0x263F01880] defaultWorkspace];
    [v5 openURL:*(void *)(a1 + 32) configuration:0 completionHandler:0];
  }
}

- (void)showUserNotificationWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ADUserNotifier_showUserNotificationWithTitle_message___block_invoke;
  block[3] = &unk_26425BA10;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(notificationQueue, block);
}

void __56__ADUserNotifier_showUserNotificationWithTitle_message___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__ADUserNotifier_showUserNotificationWithTitle_message___block_invoke_2;
  v5[3] = &unk_26425B9E8;
  objc_copyWeak(&v6, &location);
  [v2 createNotificationWithTitle:v3 message:v4 defaultButton:@"OK" alternateButton:0 responseBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__ADUserNotifier_showUserNotificationWithTitle_message___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissNotification];
}

- (ADUserNotifier)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADUserNotifier;
  v2 = [(ADUserNotifier *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppleDepth.userNotificationQueue", v3);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)defaultUserNotifier
{
  uint64_t v3 = (void *)+[ADUserNotifier defaultUserNotifier]::defaultUserNotifier;
  if (!+[ADUserNotifier defaultUserNotifier]::defaultUserNotifier)
  {
    id v4 = objc_alloc_init((Class)a1);
    id v5 = (void *)+[ADUserNotifier defaultUserNotifier]::defaultUserNotifier;
    +[ADUserNotifier defaultUserNotifier]::defaultUserNotifier = (uint64_t)v4;

    uint64_t v3 = (void *)+[ADUserNotifier defaultUserNotifier]::defaultUserNotifier;
  }
  return v3;
}

@end