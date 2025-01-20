@interface BWAmbientLightSensor
+ (void)initialize;
- (BWAmbientLightSensor)init;
- (float)rearLuxLevel;
- (int)luxLevel;
- (void)_updateRearLuxLevel:(os_unfair_lock_s *)a1;
- (void)dealloc;
- (void)forceUpdateRearLuxLevel;
@end

@implementation BWAmbientLightSensor

- (BWAmbientLightSensor)init
{
  v6.receiver = self;
  v6.super_class = (Class)BWAmbientLightSensor;
  v2 = [(BWAmbientLightSensor *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.cameracapture.alsQueue", 0);
    v2->_alsQueue = (OS_dispatch_queue *)v3;
    if (v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__BWAmbientLightSensor_init__block_invoke;
      block[3] = &unk_1E5C24430;
      block[4] = v2;
      dispatch_async(v3, block);
      *(void *)&v2->_luxLevel = 0x7F7FFFFF7FFFFFFFLL;
    }
    else
    {
      [(BWAmbientLightSensor *)v2 dealloc];
      return 0;
    }
  }
  return v2;
}

void __28__BWAmbientLightSensor_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if ([a2 isEqualToString:@"RLuxOutput"])
  {
    v5 = (os_unfair_lock_s *)[*(id *)(a1 + 32) referencedObject];
    -[BWAmbientLightSensor _updateRearLuxLevel:](v5, a3);
  }
}

id __28__BWAmbientLightSensor_init__block_invoke(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id result = +[FigWeakReference weakReferenceToObject:*(void *)(a1 + 32)];
  if (result)
  {
    v3 = result;
    id result = (id)IOHIDEventSystemClientCreateWithType();
    if (result)
    {
      id v4 = result;
      id v5 = v3;
      v20[0] = @"PrimaryUsagePage";
      v20[1] = @"PrimaryUsage";
      v21[0] = &unk_1EFB010D0;
      v21[1] = &unk_1EFB010E8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      IOHIDEventSystemClientSetMatching();
      IOHIDEventSystemClientRegisterEventCallback();
      v12[5] = MEMORY[0x1E4F143A8];
      v12[6] = 3221225472;
      v12[7] = __28__BWAmbientLightSensor_init__block_invoke_10;
      v12[8] = &unk_1E5C24F10;
      v12[9] = v3;
      v12[10] = v4;
      IOHIDEventSystemClientSetCancelHandler();
      uint64_t v6 = a1 + 32;
      IOHIDEventSystemClientSetDispatchQueue();
      IOHIDEventSystemClientActivate();
      *(void *)(*(void *)v6 + 8) = v4;
      *(_DWORD *)(*(void *)v6 + 40) = 0;
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x3052000000;
      v17 = __Block_byref_object_copy__32;
      v18 = __Block_byref_object_dispose__32;
      v7 = (objc_class *)getBrightnessSystemClientClass_softClass;
      uint64_t v19 = getBrightnessSystemClientClass_softClass;
      if (!getBrightnessSystemClientClass_softClass)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __getBrightnessSystemClientClass_block_invoke;
        v13[3] = &unk_1E5C24978;
        v13[4] = &v14;
        __getBrightnessSystemClientClass_block_invoke((uint64_t)v13);
        v7 = (objc_class *)v15[5];
      }
      _Block_object_dispose(&v14, 8);
      uint64_t v8 = [[v7 alloc] init];
      uint64_t v10 = *(void *)(a1 + 32);
      v9 = (id *)(a1 + 32);
      *(void *)(v10 + 32) = v8;
      v11 = (void *)*((void *)*v9 + 4);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __28__BWAmbientLightSensor_init__block_invoke_2;
      v12[3] = &unk_1E5C2AE28;
      v12[4] = v3;
      [v11 registerNotificationBlock:v12 forProperties:&unk_1EFB041C0];
      return (id)[*v9 forceUpdateRearLuxLevel];
    }
  }
  return result;
}

- (void)forceUpdateRearLuxLevel
{
}

- (void)_updateRearLuxLevel:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_unfair_lock_lock(a1 + 10);
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"lux"), "floatValue");
      a1[7]._os_unfair_lock_opaque = v4;
      os_unfair_lock_unlock(a1 + 10);
    }
  }
}

+ (void)initialize
{
}

void __28__BWAmbientLightSensor_init__block_invoke_10(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)dealloc
{
  if (self->_hidSystemClient) {
    IOHIDEventSystemClientCancel();
  }
  alsQueue = self->_alsQueue;
  if (alsQueue) {
    dispatch_release(alsQueue);
  }
  brightnessSystemClient = self->_brightnessSystemClient;
  if (brightnessSystemClient)
  {
    [(BrightnessSystemClient *)brightnessSystemClient registerNotificationBlock:0];
    [(BrightnessSystemClient *)self->_brightnessSystemClient unregisterNotificationForKey:@"RLuxOutput"];
  }
  v5.receiver = self;
  v5.super_class = (Class)BWAmbientLightSensor;
  [(BWAmbientLightSensor *)&v5 dealloc];
}

- (int)luxLevel
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  alsQueue = self->_alsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__BWAmbientLightSensor_luxLevel__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(alsQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__BWAmbientLightSensor_luxLevel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 24);
  return result;
}

- (float)rearLuxLevel
{
  if (!self->_brightnessSystemClient) {
    return 3.4028e38;
  }
  [(BWAmbientLightSensor *)self forceUpdateRearLuxLevel];
  os_unfair_lock_lock(&self->_lock);
  float rearLuxLevel = self->_rearLuxLevel;
  os_unfair_lock_unlock(&self->_lock);
  return rearLuxLevel;
}

@end