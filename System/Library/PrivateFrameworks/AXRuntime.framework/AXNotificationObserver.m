@interface AXNotificationObserver
- (AXNotificationObserver)initWithNotifications:(id)a3;
- (AXNotificationObserverDelegate)delegate;
- (NSArray)notifications;
- (void)_didObserveNotification:(int)a3 notificationData:(void *)a4;
- (void)_registerForAXNotifications:(BOOL)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setNotifications:(id)a3;
@end

@implementation AXNotificationObserver

- (AXNotificationObserver)initWithNotifications:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXNotificationObserver;
  v5 = [(AXNotificationObserver *)&v12 init];
  if (!v5) {
    goto LABEL_5;
  }
  if (_AXSApplicationAccessibilityEnabled() || _AXSAccessibilityNeedsMiniServer())
  {
    [(AXNotificationObserver *)v5 setNotifications:v4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__AXNotificationObserver_initWithNotifications___block_invoke;
    v9[3] = &unk_1E6220560;
    v10 = v5;
    id v11 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v9);

LABEL_5:
    v6 = v5;
    goto LABEL_6;
  }
  v8 = AXLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    -[AXNotificationObserver initWithNotifications:](v8);
  }

  v6 = 0;
LABEL_6:

  return v6;
}

void __48__AXNotificationObserver_initWithNotifications___block_invoke(uint64_t a1)
{
  v2 = +[AXElement systemWideElement];
  int v3 = AXObserverCreateWithPidObserver([v2 pid], (uint64_t)_accessibilityNotificationCallback, (uint64_t *)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 32));

  if (v3)
  {
    id v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__AXNotificationObserver_initWithNotifications___block_invoke_cold_2(v3, v4);
    }
LABEL_4:

    return;
  }
  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(*(AXObserverRef *)(*(void *)(a1 + 32) + 8));
  if (!RunLoopSource)
  {
    id v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__AXNotificationObserver_initWithNotifications___block_invoke_cold_1(v4);
    }
    goto LABEL_4;
  }
  v6 = RunLoopSource;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  v8 = *(void **)(a1 + 32);
  [v8 _registerForAXNotifications:1];
}

- (void)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(AXNotificationObserver *)self notifications];
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(obj);
      }
      CFStringRef v9 = (const __CFString *)[*(id *)(*((void *)&v19 + 1) + 8 * i) intValue];
      observer = self->_observer;
      id v11 = +[AXElement systemWideElement];
      objc_super v12 = [v11 uiElement];
      v13 = (const __AXUIElement *)[v12 axElement];
      if (v3)
      {
        AXError v14 = AXObserverAddNotification(observer, v13, v9, self);

        if (v14)
        {
          v16 = AXLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[AXNotificationObserver _registerForAXNotifications:]();
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        AXError v15 = AXObserverRemoveNotification(observer, v13, v9);

        if (v15)
        {
          v16 = AXLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[AXNotificationObserver _registerForAXNotifications:]();
          }
          goto LABEL_17;
        }
      }
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_18:
}

- (void)_didObserveNotification:(int)a3 notificationData:(void *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"AXNotificationObserver.m" lineNumber:95 description:@"Expected notification callback on the main thread"];
  }
  v8 = [(AXNotificationObserver *)self notifications];
  CFStringRef v9 = [NSNumber numberWithInt:v5];
  int v10 = [v8 containsObject:v9];

  if (v10)
  {
    id v12 = [(AXNotificationObserver *)self delegate];
    [v12 observer:self didObserveNotification:v5 notificationData:a4];
  }
}

- (void)dealloc
{
  if (self->_observer)
  {
    [(AXNotificationObserver *)self _registerForAXNotifications:0];
    CFRelease(self->_observer);
  }
  v3.receiver = self;
  v3.super_class = (Class)AXNotificationObserver;
  [(AXNotificationObserver *)&v3 dealloc];
}

- (AXNotificationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXNotificationObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithNotifications:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BA657000, log, OS_LOG_TYPE_FAULT, "AXNotificationObserver was made without Accessibility Enabled or miniServer. This will hang the process", v1, 2u);
}

void __48__AXNotificationObserver_initWithNotifications___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BA657000, log, OS_LOG_TYPE_ERROR, "Unable to get observer run loop source", v1, 2u);
}

void __48__AXNotificationObserver_initWithNotifications___block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "Error creating AXObserver: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)_registerForAXNotifications:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BA657000, v0, v1, "Unable to register for notification %ld with error %d", v2, v3);
}

- (void)_registerForAXNotifications:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BA657000, v0, v1, "Unable to unregister for notification %ld with error %d", v2, v3);
}

@end