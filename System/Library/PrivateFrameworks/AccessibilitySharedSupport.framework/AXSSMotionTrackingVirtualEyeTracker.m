@interface AXSSMotionTrackingVirtualEyeTracker
+ (NSData)_eyeTrackerHIDReportDescriptorData;
+ (NSDictionary)_eyeTrackerHIDDeviceProperties;
+ (id)_hidReportWithButtonDown:(BOOL)a3;
+ (id)_hidReportWithPoint:(CGPoint)a3 reportID:(unint64_t)a4 timestamp:(unint64_t)a5 version:(unint64_t)a6;
+ (id)_hidReportWithStatusChange:(unint64_t)a3;
- (AXSSMotionTrackingVirtualEyeTracker)initWithScreenBounds:(CGRect)a3;
- (BOOL)_activated;
- (CGRect)screenBounds;
- (HIDUserDevice)_hidUserDevice;
- (OS_dispatch_queue)_hidUserDeviceQueue;
- (OS_dispatch_queue)_reportingQueue;
- (void)_activateOnReportingQueue;
- (void)_changeStatusOnReportingQueueTo:(unint64_t)a3;
- (void)_clickOnReportingQueueWithButtonDown:(BOOL)a3;
- (void)_deactivateOnReportingQueue;
- (void)_moveOnReportingQueueToPoint:(CGPoint)a3;
- (void)activate;
- (void)changeStatusTo:(unint64_t)a3;
- (void)click;
- (void)deactivate;
- (void)dealloc;
- (void)moveToPoint:(CGPoint)a3;
- (void)setScreenBounds:(CGRect)a3;
- (void)set_activated:(BOOL)a3;
- (void)set_hidUserDevice:(id)a3;
- (void)set_hidUserDeviceQueue:(id)a3;
- (void)set_reportingQueue:(id)a3;
@end

@implementation AXSSMotionTrackingVirtualEyeTracker

- (AXSSMotionTrackingVirtualEyeTracker)initWithScreenBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)AXSSMotionTrackingVirtualEyeTracker;
  v7 = [(AXSSMotionTrackingVirtualEyeTracker *)&v21 init];
  v8 = v7;
  if (v7)
  {
    v7->_screenBounds.origin.CGFloat x = x;
    v7->_screenBounds.origin.CGFloat y = y;
    v7->_screenBounds.size.CGFloat width = width;
    v7->_screenBounds.size.CGFloat height = height;
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.accessibility.AXSSMotionTrackingVirtualEyeTracker.%p.hidQueue", v7);
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    hidUserDeviceQueue = v8->__hidUserDeviceQueue;
    v8->__hidUserDeviceQueue = (OS_dispatch_queue *)v12;

    v14 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.accessibility.AXSSMotionTrackingVirtualEyeTracker.%p.reportingQueue", v8);

    id v15 = v14;
    v16 = (const char *)[v15 UTF8String];
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    reportingQueue = v8->__reportingQueue;
    v8->__reportingQueue = (OS_dispatch_queue *)v18;
  }
  return v8;
}

- (void)dealloc
{
  hidUserDevice = self->__hidUserDevice;
  if (hidUserDevice) {
    [(HIDUserDevice *)hidUserDevice cancel];
  }
  v4.receiver = self;
  v4.super_class = (Class)AXSSMotionTrackingVirtualEyeTracker;
  [(AXSSMotionTrackingVirtualEyeTracker *)&v4 dealloc];
}

- (void)activate
{
  v3 = [(AXSSMotionTrackingVirtualEyeTracker *)self _reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AXSSMotionTrackingVirtualEyeTracker_activate__block_invoke;
  block[3] = &unk_1E606C8C0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __47__AXSSMotionTrackingVirtualEyeTracker_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateOnReportingQueue];
}

- (void)deactivate
{
  v3 = [(AXSSMotionTrackingVirtualEyeTracker *)self _reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AXSSMotionTrackingVirtualEyeTracker_deactivate__block_invoke;
  block[3] = &unk_1E606C8C0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __49__AXSSMotionTrackingVirtualEyeTracker_deactivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateOnReportingQueue];
}

- (void)moveToPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ([(AXSSMotionTrackingVirtualEyeTracker *)self _activated])
  {
    v6 = [(AXSSMotionTrackingVirtualEyeTracker *)self _reportingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__AXSSMotionTrackingVirtualEyeTracker_moveToPoint___block_invoke;
    block[3] = &unk_1E606CD58;
    block[4] = self;
    *(CGFloat *)&void block[5] = x;
    *(CGFloat *)&block[6] = y;
    dispatch_sync(v6, block);
  }
  else
  {
    v7 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AXSSMotionTrackingVirtualEyeTracker moveToPoint:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

uint64_t __51__AXSSMotionTrackingVirtualEyeTracker_moveToPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moveOnReportingQueueToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)click
{
}

uint64_t __44__AXSSMotionTrackingVirtualEyeTracker_click__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clickOnReportingQueueWithButtonDown:1];
}

uint64_t __44__AXSSMotionTrackingVirtualEyeTracker_click__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clickOnReportingQueueWithButtonDown:0];
}

- (void)changeStatusTo:(unint64_t)a3
{
  if ([(AXSSMotionTrackingVirtualEyeTracker *)self _activated])
  {
    v5 = [(AXSSMotionTrackingVirtualEyeTracker *)self _reportingQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__AXSSMotionTrackingVirtualEyeTracker_changeStatusTo___block_invoke;
    v14[3] = &unk_1E606CD80;
    v14[4] = self;
    v14[5] = a3;
    dispatch_sync(v5, v14);
  }
  else
  {
    v6 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXSSMotionTrackingVirtualEyeTracker changeStatusTo:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

uint64_t __54__AXSSMotionTrackingVirtualEyeTracker_changeStatusTo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeStatusOnReportingQueueTo:*(void *)(a1 + 40)];
}

+ (NSDictionary)_eyeTrackerHIDDeviceProperties
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v5[0] = @"ReportDescriptor";
  v2 = [a1 _eyeTrackerHIDReportDescriptorData];
  v6[0] = v2;
  v6[1] = @"Virtual Eye Tracker (Testing Use Only)";
  v5[1] = @"Product";
  v5[2] = @"VendorID";
  v6[2] = &unk_1F0C67110;
  v6[3] = &unk_1F0C67110;
  v5[3] = @"ProductID";
  v5[4] = @"ReportInterval";
  v5[5] = @"Authenticated";
  v6[4] = &unk_1F0C67128;
  v6[5] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];

  return (NSDictionary *)v3;
}

+ (NSData)_eyeTrackerHIDReportDescriptorData
{
  if (_eyeTrackerHIDReportDescriptorData_onceToken != -1) {
    dispatch_once(&_eyeTrackerHIDReportDescriptorData_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_eyeTrackerHIDReportDescriptorData_s_eyeTrackerHIDReportDescriptorData;

  return (NSData *)v2;
}

void __73__AXSSMotionTrackingVirtualEyeTracker__eyeTrackerHIDReportDescriptorData__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[8] = xmmword_1B3BE7588;
  *(_OWORD *)v3 = unk_1B3BE7598;
  *(void *)&v3[13] = 0xC0C0068102950875;
  v2[4] = xmmword_1B3BE7548;
  v2[5] = unk_1B3BE7558;
  v2[6] = xmmword_1B3BE7568;
  v2[7] = unk_1B3BE7578;
  v2[0] = xmmword_1B3BE7508;
  v2[1] = unk_1B3BE7518;
  v2[2] = xmmword_1B3BE7528;
  v2[3] = unk_1B3BE7538;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v2 length:165];
  v1 = (void *)_eyeTrackerHIDReportDescriptorData_s_eyeTrackerHIDReportDescriptorData;
  _eyeTrackerHIDReportDescriptorData_s_eyeTrackerHIDReportDescriptorData = v0;
}

- (void)_activateOnReportingQueue
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[AXSSMotionTrackingVirtualEyeTracker _activateOnReportingQueue]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "%s: Couldn't create HID user device with properties: %@! You probably need entitlements...", (uint8_t *)&v2, 0x16u);
}

- (void)_moveOnReportingQueueToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(AXSSMotionTrackingVirtualEyeTracker *)self _reportingQueue];
  dispatch_assert_queue_V2(v6);

  if ([(AXSSMotionTrackingVirtualEyeTracker *)self _activated])
  {
    uint64_t v7 = [(AXSSMotionTrackingVirtualEyeTracker *)self _hidUserDevice];

    if (v7)
    {
      uint64_t v8 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v33.double x = x;
        v33.double y = y;
        uint64_t v9 = NSStringFromPoint(v33);
        *(_DWORD *)buf = 136315394;
        v29 = "-[AXSSMotionTrackingVirtualEyeTracker _moveOnReportingQueueToPoint:]";
        __int16 v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_1B3B9D000, v8, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
      }
      double v10 = fmax(x, 0.0);
      [(AXSSMotionTrackingVirtualEyeTracker *)self screenBounds];
      if (v10 >= v11) {
        double v10 = v11;
      }
      double v12 = fmax(y, 0.0);
      [(AXSSMotionTrackingVirtualEyeTracker *)self screenBounds];
      if (v12 >= v13) {
        double v14 = v13;
      }
      else {
        double v14 = v12;
      }
      [(AXSSMotionTrackingVirtualEyeTracker *)self screenBounds];
      double v16 = v10 / v15;
      [(AXSSMotionTrackingVirtualEyeTracker *)self screenBounds];
      double v18 = v14 / v17;
      if (_moveOnReportingQueueToPoint__onceToken != -1) {
        dispatch_once(&_moveOnReportingQueueToPoint__onceToken, &__block_literal_global_41);
      }
      double v19 = v16 / *(double *)&_moveOnReportingQueueToPoint__s_unitExponent;
      double v20 = v18 / *(double *)&_moveOnReportingQueueToPoint__s_unitExponent;
      objc_super v21 = objc_opt_class();
      v22 = objc_msgSend(v21, "_hidReportWithPoint:reportID:timestamp:version:", 1, mach_absolute_time(), 0, v19, v20);
      v23 = [(AXSSMotionTrackingVirtualEyeTracker *)self _hidUserDevice];
      id v27 = 0;
      char v24 = [v23 handleReport:v22 error:&v27];
      id v25 = v27;

      if ((v24 & 1) == 0)
      {
        v26 = AXSSLogForCategory(2);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[AXSSMotionTrackingVirtualEyeTracker _moveOnReportingQueueToPoint:]();
        }
      }
    }
  }
}

void __68__AXSSMotionTrackingVirtualEyeTracker__moveOnReportingQueueToPoint___block_invoke()
{
  _moveOnReportingQueueToPoint__s_unitExponent = 0x3EB0C6F7A0B5ED8DLL;
}

+ (id)_hidReportWithPoint:(CGPoint)a3 reportID:(unint64_t)a4 timestamp:(unint64_t)a5 version:(unint64_t)a6
{
  char v6 = a6;
  char v8 = a4;
  double y = a3.y;
  double x = a3.x;
  double v11 = [MEMORY[0x1E4F1CA58] data];
  char v18 = v8;
  char v17 = v6;
  unint64_t v16 = a5;
  int v14 = (int)y;
  int v15 = (int)x;
  [v11 appendBytes:&v18 length:1];
  [v11 appendBytes:&v17 length:1];
  [v11 appendBytes:&v16 length:8];
  [v11 appendBytes:&v15 length:4];
  [v11 appendBytes:&v14 length:4];
  double v12 = (void *)[v11 copy];

  return v12;
}

- (void)_clickOnReportingQueueWithButtonDown:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AXSSMotionTrackingVirtualEyeTracker *)self _reportingQueue];
  dispatch_assert_queue_V2(v5);

  if ([(AXSSMotionTrackingVirtualEyeTracker *)self _activated])
  {
    char v6 = [(AXSSMotionTrackingVirtualEyeTracker *)self _hidUserDevice];

    if (v6)
    {
      uint64_t v7 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        char v8 = @"NO";
        if (v3) {
          char v8 = @"YES";
        }
        *(_DWORD *)buf = 136315394;
        int v15 = "-[AXSSMotionTrackingVirtualEyeTracker _clickOnReportingQueueWithButtonDown:]";
        __int16 v16 = 2112;
        char v17 = v8;
        _os_log_impl(&dword_1B3B9D000, v7, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
      }

      uint64_t v9 = [(id)objc_opt_class() _hidReportWithButtonDown:v3];
      double v10 = [(AXSSMotionTrackingVirtualEyeTracker *)self _hidUserDevice];
      id v13 = 0;
      char v11 = [v10 handleReport:v9 error:&v13];
      id v12 = v13;

      if ((v11 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[AXSSMotionTrackingVirtualEyeTracker _clickOnReportingQueueWithButtonDown:]();
      }
    }
  }
}

+ (id)_hidReportWithButtonDown:(BOOL)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char v10 = 3;
  [v4 appendBytes:&v10 length:1];
  BOOL v9 = a3;
  [v4 appendBytes:&v9 length:1];
  char v8 = 0;
  [v4 appendBytes:&v8 length:1];
  char v7 = 0;
  [v4 appendBytes:&v7 length:1];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (void)_changeStatusOnReportingQueueTo:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AXSSMotionTrackingVirtualEyeTracker *)self _reportingQueue];
  dispatch_assert_queue_V2(v5);

  if ([(AXSSMotionTrackingVirtualEyeTracker *)self _activated])
  {
    char v6 = [(AXSSMotionTrackingVirtualEyeTracker *)self _hidUserDevice];

    if (v6)
    {
      char v7 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        int v14 = "-[AXSSMotionTrackingVirtualEyeTracker _changeStatusOnReportingQueueTo:]";
        __int16 v15 = 2048;
        unint64_t v16 = a3;
        _os_log_impl(&dword_1B3B9D000, v7, OS_LOG_TYPE_INFO, "%s: %lu", buf, 0x16u);
      }

      char v8 = [(id)objc_opt_class() _hidReportWithStatusChange:a3];
      BOOL v9 = [(AXSSMotionTrackingVirtualEyeTracker *)self _hidUserDevice];
      id v12 = 0;
      char v10 = [v9 handleReport:v8 error:&v12];
      id v11 = v12;

      if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[AXSSMotionTrackingVirtualEyeTracker _changeStatusOnReportingQueueTo:]();
      }
    }
  }
}

+ (id)_hidReportWithStatusChange:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char v9 = 2;
  [v4 appendBytes:&v9 length:1];
  char v8 = 0;
  [v4 appendBytes:&v8 length:2];
  char v7 = v3;
  [v4 appendBytes:&v7 length:1];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (void)_deactivateOnReportingQueue
{
  char v3 = [(AXSSMotionTrackingVirtualEyeTracker *)self _reportingQueue];
  dispatch_assert_queue_V2(v3);

  if ([(AXSSMotionTrackingVirtualEyeTracker *)self _activated])
  {
    id v4 = [(AXSSMotionTrackingVirtualEyeTracker *)self _hidUserDevice];

    if (v4)
    {
      uint64_t v5 = [(AXSSMotionTrackingVirtualEyeTracker *)self _hidUserDevice];
      [v5 cancel];

      [(AXSSMotionTrackingVirtualEyeTracker *)self set_hidUserDevice:0];
    }
    [(AXSSMotionTrackingVirtualEyeTracker *)self set_activated:0];
  }
}

- (CGRect)screenBounds
{
  double x = self->_screenBounds.origin.x;
  double y = self->_screenBounds.origin.y;
  double width = self->_screenBounds.size.width;
  double height = self->_screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScreenBounds:(CGRect)a3
{
  self->_screenBounds = a3;
}

- (BOOL)_activated
{
  return self->__activated;
}

- (void)set_activated:(BOOL)a3
{
  self->__activated = a3;
}

- (HIDUserDevice)_hidUserDevice
{
  return self->__hidUserDevice;
}

- (void)set_hidUserDevice:(id)a3
{
}

- (OS_dispatch_queue)_hidUserDeviceQueue
{
  return self->__hidUserDeviceQueue;
}

- (void)set_hidUserDeviceQueue:(id)a3
{
}

- (OS_dispatch_queue)_reportingQueue
{
  return self->__reportingQueue;
}

- (void)set_reportingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reportingQueue, 0);
  objc_storeStrong((id *)&self->__hidUserDeviceQueue, 0);

  objc_storeStrong((id *)&self->__hidUserDevice, 0);
}

- (void)moveToPoint:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)changeStatusTo:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_moveOnReportingQueueToPoint:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1B3B9D000, v0, OS_LOG_TYPE_ERROR, "%s: Couldn't handle report %@: %@!", (uint8_t *)v1, 0x20u);
}

- (void)_clickOnReportingQueueWithButtonDown:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1B3B9D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Couldn't handle button down report %@: %@!", (uint8_t *)v0, 0x20u);
}

- (void)_changeStatusOnReportingQueueTo:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1B3B9D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Couldn't handle status change report %@: %@!", (uint8_t *)v0, 0x20u);
}

@end