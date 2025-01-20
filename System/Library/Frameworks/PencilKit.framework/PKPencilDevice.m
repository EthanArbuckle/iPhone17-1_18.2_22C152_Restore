@interface PKPencilDevice
+ (id)activePencil;
+ (id)squeezeThreshold;
- (BOOL)isConnected;
- (BOOL)isRollSupportUnknown;
- (BOOL)isRollSupported;
- (PKPencilDevice)init;
- (double)_timeIntervalSinceUsedForTimestamp:(double)a3;
- (double)baseRollAngle;
- (double)timeIntervalSinceUsed;
- (int64_t)pencilVersion;
- (int64_t)pencilVersionForAnalytics;
- (void)_setLastUsedTimestamp:(double)a3;
- (void)appSceneDidEnterBackground;
- (void)checkIfRollIsSupported:(id)a3;
- (void)dealloc;
- (void)resetRollSupportedState;
- (void)setBaseRollAngle:(double)a3;
- (void)setIsRollSupportUnknown:(BOOL)a3;
- (void)setIsRollSupported:(BOOL)a3;
- (void)tagAsUsed;
@end

@implementation PKPencilDevice

- (void)resetRollSupportedState
{
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilDevice");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Clearing roll support state.", v3, 2u);
    }

    *(_DWORD *)(a1 + 36) = 0;
  }
}

+ (id)activePencil
{
  if (_MergedGlobals_121 != -1) {
    dispatch_once(&_MergedGlobals_121, &__block_literal_global_18);
  }
  v2 = (void *)qword_1EB3C5E98;

  return v2;
}

void __30__PKPencilDevice_activePencil__block_invoke()
{
  v0 = objc_alloc_init(PKPencilDevice);
  v1 = (void *)qword_1EB3C5E98;
  qword_1EB3C5E98 = (uint64_t)v0;
}

- (PKPencilDevice)init
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PKPencilDevice;
  v2 = [(PKPencilDevice *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_rollSupportState = 0;
    IOHIDManagerRef v4 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    v3->_stylusHidManager = v4;
    if (v4)
    {
      IOHIDManagerRef v5 = v4;
      v6 = os_log_create("com.apple.pencilkit", "PencilDevice");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Created stylus HID manager.", buf, 2u);
      }

      v18[0] = @"PrimaryUsagePage";
      v18[1] = @"PrimaryUsage";
      v19[0] = &unk_1F200E2E0;
      v19[1] = &unk_1F200E2F8;
      v18[2] = @"ProductIDArray";
      v19[2] = &unk_1F200EB20;
      CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
      IOHIDManagerSetDeviceMatching(v3->_stylusHidManager, v7);
      stylusHidManager = v3->_stylusHidManager;
      v9 = hidQueue();
      IOHIDManagerSetDispatchQueue(stylusHidManager, v9);

      IOHIDManagerRegisterDeviceMatchingCallback(v3->_stylusHidManager, (IOHIDDeviceCallback)stylusDeviceAddedCallback, v3);
      IOHIDManagerRegisterDeviceRemovalCallback(v3->_stylusHidManager, (IOHIDDeviceCallback)stylusDeviceRemovedCallback, v3);
      v10 = v3->_stylusHidManager;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __22__PKPencilDevice_init__block_invoke;
      handler[3] = &__block_descriptor_40_e5_v8__0l;
      handler[4] = v5;
      IOHIDManagerSetCancelHandler(v10, handler);
      v11 = hidQueue();
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __22__PKPencilDevice_init__block_invoke_2;
      v13[3] = &unk_1E64C61C0;
      v14 = v3;
      dispatch_async(v11, v13);
    }
  }
  return v3;
}

void __22__PKPencilDevice_init__block_invoke(uint64_t a1)
{
}

void __22__PKPencilDevice_init__block_invoke_2(uint64_t a1)
{
}

- (void)dealloc
{
  stylusHidManager = self->_stylusHidManager;
  if (stylusHidManager)
  {
    IOHIDManagerRef v4 = hidQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__PKPencilDevice_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = stylusHidManager;
    dispatch_async(v4, block);
  }
  v5.receiver = self;
  v5.super_class = (Class)PKPencilDevice;
  [(PKPencilDevice *)&v5 dealloc];
}

void __25__PKPencilDevice_dealloc__block_invoke(uint64_t a1)
{
}

- (int64_t)pencilVersionForAnalytics
{
  int64_t v2 = [(PKPencilDevice *)self pencilVersion];
  if ((unint64_t)(v2 - 2) >= 3) {
    return 3;
  }
  else {
    return v2 - 2;
  }
}

- (void)tagAsUsed
{
  double v3 = CACurrentMediaTime();

  [(PKPencilDevice *)self _setLastUsedTimestamp:v3];
}

- (void)_setLastUsedTimestamp:(double)a3
{
  self->_lastUsedIimestamp = a3;
}

- (double)timeIntervalSinceUsed
{
  double v3 = CACurrentMediaTime();

  [(PKPencilDevice *)self _timeIntervalSinceUsedForTimestamp:v3];
  return result;
}

- (double)_timeIntervalSinceUsedForTimestamp:(double)a3
{
  return a3 - self->_lastUsedIimestamp;
}

- (void)appSceneDidEnterBackground
{
  if (self->_rollSupportState) {
    self->_rollSupportState = 0;
  }
}

- (void)checkIfRollIsSupported:(id)a3
{
  id v4 = a3;
  int rollSupportState = self->_rollSupportState;
  if (!rollSupportState)
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilDevice");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Checking if roll is supported.", buf, 2u);
    }

    CFDictionaryRef v7 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PKPencilDevice_checkIfRollIsSupported___block_invoke;
    block[3] = &unk_1E64C6B40;
    block[4] = self;
    id v13 = v4;
    dispatch_async(v7, block);

    v8 = v13;
    goto LABEL_8;
  }
  if (![MEMORY[0x1E4F29060] isMainThread])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__PKPencilDevice_checkIfRollIsSupported___block_invoke_2;
    v9[3] = &unk_1E64C6B68;
    id v10 = v4;
    BOOL v11 = rollSupportState == 1;
    dispatch_async(MEMORY[0x1E4F14428], v9);
    v8 = v10;
LABEL_8:

    goto LABEL_9;
  }
  (*((void (**)(id, BOOL))v4 + 2))(v4, rollSupportState == 1);
LABEL_9:
}

void __41__PKPencilDevice_checkIfRollIsSupported___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (+[PKHoverSettings isHoverActive]
    && +[PKHoverSettings isHoverEnabled])
  {
    int IsRollSupported = PKQueryIsRollSupported();
  }
  else
  {
    int IsRollSupported = 0;
  }
  double v3 = os_log_create("com.apple.pencilkit", "PencilDevice");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = IsRollSupported;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Found roll supported: %d.", buf, 8u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PKPencilDevice_checkIfRollIsSupported___block_invoke_25;
  block[3] = &unk_1E64C6B18;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  char v7 = IsRollSupported;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __41__PKPencilDevice_checkIfRollIsSupported___block_invoke_25(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    int v1 = 1;
  }
  else {
    int v1 = 2;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 36) = v1;
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __41__PKPencilDevice_checkIfRollIsSupported___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isRollSupported
{
  int rollSupportState = self->_rollSupportState;
  if (rollSupportState) {
    return rollSupportState == 1;
  }
  else {
    return PKQueryIsRollSupported();
  }
}

- (BOOL)isRollSupportUnknown
{
  return self->_rollSupportState == 0;
}

- (double)baseRollAngle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double baseRollAngle = self->_baseRollAngle;
  os_unfair_lock_unlock(p_lock);
  return baseRollAngle;
}

- (void)setBaseRollAngle:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_double baseRollAngle = a3;

  os_unfair_lock_unlock(p_lock);
}

+ (id)squeezeThreshold
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IOHIDEventSystemClientCreateWithType();
  if (v2)
  {
    double v3 = (__IOHIDEventSystemClient *)v2;
    v17[0] = @"PrimaryUsagePage";
    v17[1] = @"PrimaryUsage";
    v18[0] = &unk_1F200E370;
    v18[1] = &unk_1F200E388;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    IOHIDEventSystemClientSetMatching();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CFArrayRef v5 = IOHIDEventSystemClientCopyServices(v3);
    uint64_t v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((void *)&v12 + 1) + 8 * v9), @"SqueezeThreshold");
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }

        if (v7 == ++v9)
        {
          uint64_t v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v10 = 0;
    }

    CFRelease(v3);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (int64_t)pencilVersion
{
  return self->_pencilVersion;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsRollSupported:(BOOL)a3
{
  self->_isRollSupported = a3;
}

- (void)setIsRollSupportUnknown:(BOOL)a3
{
  self->_isRollSupportUnknown = a3;
}

@end