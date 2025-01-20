@interface AXSSMotionTrackingHIDManager
- (AXSSMotionTrackingHIDManager)init;
- (AXSSMotionTrackingHIDManagerDelegate)delegate;
- (BOOL)_monitoring;
- (HIDManager)_hidManager;
- (NSArray)devices;
- (NSMutableArray)_devices;
- (OS_dispatch_queue)_hidManagerDispatchQueue;
- (void)_deviceNotification:(id)a3 added:(BOOL)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)set_devices:(id)a3;
- (void)set_hidManager:(id)a3;
- (void)set_hidManagerDispatchQueue:(id)a3;
- (void)set_monitoring:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation AXSSMotionTrackingHIDManager

- (AXSSMotionTrackingHIDManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXSSMotionTrackingHIDManager;
  v2 = [(AXSSMotionTrackingHIDManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    devices = v2->__devices;
    v2->__devices = (NSMutableArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MotionTrackingHIDManager.hidManagerDispatchQueue", 0);
    hidManagerDispatchQueue = v2->__hidManagerDispatchQueue;
    v2->__hidManagerDispatchQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)dealloc
{
  if (self->__monitoring)
  {
    [(HIDManager *)self->__hidManager cancel];
    hidManager = self->__hidManager;
    self->__hidManager = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXSSMotionTrackingHIDManager;
  [(AXSSMotionTrackingHIDManager *)&v4 dealloc];
}

- (void)startMonitoring
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "AXSSMotionTrackingHIDManager: startMonitoring %@", (uint8_t *)&v2, 0xCu);
}

void __47__AXSSMotionTrackingHIDManager_startMonitoring__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AXSSMotionTrackingHIDManager_startMonitoring__block_invoke_2;
  block[3] = &unk_1E606DB60;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v8 = v5;
  char v10 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __47__AXSSMotionTrackingHIDManager_startMonitoring__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _deviceNotification:*(void *)(a1 + 32) added:*(unsigned __int8 *)(a1 + 48)];
}

- (void)stopMonitoring
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "AXSSMotionTrackingHIDManager: stopMonitoring %@", (uint8_t *)&v2, 0xCu);
}

- (NSArray)devices
{
  int v2 = [(AXSSMotionTrackingHIDManager *)self _devices];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)_deviceNotification:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AXSSMotionTrackingHIDManager _deviceNotification:added:].cold.4((uint64_t)v6, v4, v7);
  }

  if (v4)
  {
    if (!+[AXSSMotionTrackingUtilities axss_HIDDeviceIsMFiAuthenticated:v6])
    {
      char v10 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXSSMotionTrackingHIDManager _deviceNotification:added:]();
      }
      goto LABEL_20;
    }
    id v8 = +[AXSSMotionTrackingUtilities axss_xPositionElementMatchingDict];
    id v9 = [v6 elementsMatching:v8];
    char v10 = [v9 firstObject];

    v11 = +[AXSSMotionTrackingUtilities axss_yPositionElementMatchingDict];
    v12 = [v6 elementsMatching:v11];
    v13 = [v12 firstObject];

    if (!v10 || !v13)
    {
      v21 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[AXSSMotionTrackingHIDManager _deviceNotification:added:]();
      }

      goto LABEL_19;
    }
    v14 = [(AXSSMotionTrackingHIDManager *)self _devices];
    [v14 addObject:v6];
  }
  else
  {
    v15 = [(AXSSMotionTrackingHIDManager *)self _devices];
    int v16 = [v15 containsObject:v6];

    if (!v16) {
      goto LABEL_21;
    }
    char v10 = [(AXSSMotionTrackingHIDManager *)self _devices];
    [v10 removeObject:v6];
  }

  v17 = [(AXSSMotionTrackingHIDManager *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v19 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[AXSSMotionTrackingHIDManager _deviceNotification:added:](self, v19);
    }

    char v10 = [(AXSSMotionTrackingHIDManager *)self delegate];
    v13 = [(AXSSMotionTrackingHIDManager *)self _devices];
    v20 = (void *)[v13 copy];
    [v10 motionTrackingHIDManager:self updatedDevices:v20];

LABEL_19:
LABEL_20:
  }
LABEL_21:
}

- (AXSSMotionTrackingHIDManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSSMotionTrackingHIDManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_monitoring
{
  return self->__monitoring;
}

- (void)set_monitoring:(BOOL)a3
{
  self->__monitoring = a3;
}

- (OS_dispatch_queue)_hidManagerDispatchQueue
{
  return self->__hidManagerDispatchQueue;
}

- (void)set_hidManagerDispatchQueue:(id)a3
{
}

- (HIDManager)_hidManager
{
  return self->__hidManager;
}

- (void)set_hidManager:(id)a3
{
}

- (NSMutableArray)_devices
{
  return self->__devices;
}

- (void)set_devices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__devices, 0);
  objc_storeStrong((id *)&self->__hidManager, 0);
  objc_storeStrong((id *)&self->__hidManagerDispatchQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_deviceNotification:added:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(&dword_1B3B9D000, v0, OS_LOG_TYPE_ERROR, "%s: device does not support X or Y position usages: %@", (uint8_t *)v1, 0x16u);
}

- (void)_deviceNotification:(void *)a1 added:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _devices];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_7();
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "%s: notifying delegate of updated devices: %@", (uint8_t *)v4, 0x16u);
}

- (void)_deviceNotification:added:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(&dword_1B3B9D000, v0, OS_LOG_TYPE_ERROR, "%s: device is not MFi authenticated!: %@", (uint8_t *)v1, 0x16u);
}

- (void)_deviceNotification:(os_log_t)log added:.cold.4(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"NO";
  uint64_t v5 = "-[AXSSMotionTrackingHIDManager _deviceNotification:added:]";
  int v4 = 136315650;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  if (a2) {
    uint64_t v3 = @"YES";
  }
  __int16 v8 = 2112;
  id v9 = v3;
  _os_log_debug_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_DEBUG, "%s: device: %@, added: %@", (uint8_t *)&v4, 0x20u);
}

@end