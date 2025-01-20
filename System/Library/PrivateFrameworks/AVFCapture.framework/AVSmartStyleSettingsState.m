@interface AVSmartStyleSettingsState
+ (id)_smartStyleSettingsQueue;
+ (id)smartStyleSettingsStateForBundleID:(id)a3;
- (BOOL)systemStyleEnabled;
- (id)initForBundleID:(id)a3;
- (id)systemStyle;
- (void)_proprietaryDefaultChanged:(id)a3 keyPath:(id)a4;
- (void)dealloc;
- (void)installProprietaryDefaultListeners;
- (void)setSystemStyle:(id)a3;
- (void)setSystemStyleEnabled:(BOOL)a3;
@end

@implementation AVSmartStyleSettingsState

+ (id)smartStyleSettingsStateForBundleID:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initForBundleID:a3];

  return v3;
}

+ (id)_smartStyleSettingsQueue
{
  if (_smartStyleSettingsQueue_onceToken != -1) {
    dispatch_once(&_smartStyleSettingsQueue_onceToken, &__block_literal_global);
  }
  return (id)_smartStyleSettingsQueue_sSmartStyleSettingsQueue;
}

dispatch_queue_t __53__AVSmartStyleSettingsState__smartStyleSettingsQueue__block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.cameracapture.smartstylesettings", 0);
  _smartStyleSettingsQueue_sSmartStyleSettingsQueue = (uint64_t)result;
  return result;
}

- (id)initForBundleID:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)AVSmartStyleSettingsState;
  v4 = [(AVSmartStyleSettingsState *)&v21 init];
  if (v4)
  {
    v4->_bundleID = (NSString *)a3;
    v4->_queue = (OS_dispatch_queue *)+[AVSmartStyleSettingsState _smartStyleSettingsQueue];
    v5 = AVSmartStyleSettingsSystemStyle;
    if (([a3 isEqualToString:AVSmartStyleSettingsSystemStyle] & 1) == 0) {
      v5 = (__CFString *)AVControlCenterPreferencesDomainForPreferencesDomain(a3);
    }
    v4->_systemStyleKey = (NSString *)(id)AVSmartStyleSettingsSystemStylePreferenceKey(v5);
    v4->_systemStyleTimestampKey = (NSString *)(id)AVSmartStyleSettingsSystemStyleTimestampPreferenceKey(v5);
    v4->_systemStyleEnabledKey = (NSString *)(id)AVSmartStyleSettingsSystemStyleEnabledPreferenceKey();
    v6 = (AVCaptureSmartStyle *)+[AVCaptureProprietaryDefaultsSingleton objectForKey:v4->_systemStyleKey];
    if (v6)
    {
      v7 = v6;
      uint64_t v8 = [(AVCaptureSmartStyle *)v6 objectForKeyedSubscript:AVSmartStyleSettingsCastTypeKey];
      objc_msgSend((id)-[AVCaptureSmartStyle objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", AVSmartStyleSettingsCastIntensityKey), "floatValue");
      int v10 = v9;
      objc_msgSend((id)-[AVCaptureSmartStyle objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", AVSmartStyleSettingsToneBiasKey), "floatValue");
      int v12 = v11;
      objc_msgSend((id)-[AVCaptureSmartStyle objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", AVSmartStyleSettingsColorBiasKey), "floatValue");
      LODWORD(v14) = v13;
      LODWORD(v15) = v10;
      LODWORD(v16) = v12;
      v6 = +[AVCaptureSmartStyle styleWithCast:v8 intensity:v15 toneBias:v16 colorBias:v14];
    }
    v4->_systemStyle = v6;
    id v17 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:v4->_systemStyleEnabledKey];
    if (v17 && (v18 = v17, [v17 objectForKeyedSubscript:v4->_bundleID])) {
      char v19 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v4->_bundleID), "BOOLValue");
    }
    else {
      char v19 = [(id)sDisallowedFirstPartyAppsInSystemStyleEnabledList containsObject:v4->_bundleID] ^ 1;
    }
    v4->_systemStyleEnabled = v19;
  }
  return v4;
}

- (void)installProprietaryDefaultListeners
{
  systemStyleKey = self->_systemStyleKey;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__AVSmartStyleSettingsState_installProprietaryDefaultListeners__block_invoke;
  v6[3] = &unk_1E5A72DB8;
  v6[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:systemStyleKey callHandlerForInitialValue:0 defaultChangedHandler:v6];
  if (![(NSString *)self->_bundleID isEqualToString:AVSmartStyleSettingsSystemStyle])
  {
    systemStyleEnabledKey = self->_systemStyleEnabledKey;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__AVSmartStyleSettingsState_installProprietaryDefaultListeners__block_invoke_2;
    v5[3] = &unk_1E5A72DB8;
    v5[4] = self;
    +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:systemStyleEnabledKey callHandlerForInitialValue:0 defaultChangedHandler:v5];
  }
}

uint64_t __63__AVSmartStyleSettingsState_installProprietaryDefaultListeners__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 24)];
}

uint64_t __63__AVSmartStyleSettingsState_installProprietaryDefaultListeners__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 40)];
}

- (void)dealloc
{
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_systemStyleKey];

  self->_systemStyleKey = 0;
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_systemStyleEnabledKey];

  self->_systemStyleEnabledKey = 0;
  self->_systemStyleTimestampKey = 0;

  self->_bundleID = 0;
  self->_systemStyle = 0;

  self->_queue = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVSmartStyleSettingsState;
  [(AVSmartStyleSettingsState *)&v3 dealloc];
}

- (void)_proprietaryDefaultChanged:(id)a3 keyPath:(id)a4
{
  v32[2] = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:self->_systemStyleKey])
  {
    if (a3)
    {
      uint64_t v7 = [a3 objectForKeyedSubscript:AVSmartStyleSettingsCastTypeKey];
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", AVSmartStyleSettingsCastIntensityKey), "floatValue");
      int v9 = v8;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", AVSmartStyleSettingsToneBiasKey), "floatValue");
      int v11 = v10;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", AVSmartStyleSettingsColorBiasKey), "floatValue");
      LODWORD(v13) = v12;
      LODWORD(v14) = v9;
      LODWORD(v15) = v11;
      double v16 = +[AVCaptureSmartStyle styleWithCast:v7 intensity:v14 toneBias:v15 colorBias:v13];
      if ([(AVCaptureSmartStyle *)v16 isEqual:self->_systemStyle]) {
        return;
      }
      uint64_t v17 = AVSmartStyleSettingsSystemStyleDidChangedNotification;
      bundleID = self->_bundleID;
      v29[0] = AVSmartStyleSettingsBundleIDKey;
      v29[1] = AVSmartStyleSettingsSmartStyleKey;
      v30[0] = bundleID;
      v30[1] = v16;
      char v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = v30;
      objc_super v21 = v29;
      goto LABEL_18;
    }
    if ([(NSString *)self->_bundleID isEqualToString:AVSmartStyleSettingsSystemStyle]) {
      v23 = +[AVCaptureSmartStyle identityStyle];
    }
    else {
      v23 = (AVCaptureSmartStyle *)[MEMORY[0x1E4F1CA98] null];
    }
    double v16 = v23;
    if (![(AVCaptureSmartStyle *)v23 isEqual:self->_systemStyle])
    {
      uint64_t v17 = AVSmartStyleSettingsSystemStyleDidChangedNotification;
      v26 = self->_bundleID;
      v31[0] = AVSmartStyleSettingsBundleIDKey;
      v31[1] = AVSmartStyleSettingsSmartStyleKey;
      v32[0] = v26;
      v32[1] = v16;
      char v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = v32;
      objc_super v21 = v31;
LABEL_18:
      uint64_t v25 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:2];

      self->_systemStyle = v16;
LABEL_19:
      if (v17)
      {
        if (v25) {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", v17, 0, v25);
        }
      }
    }
  }
  else if ([a4 isEqualToString:self->_systemStyleEnabledKey])
  {
    uint64_t v22 = a3 && [a3 objectForKeyedSubscript:self->_bundleID]
        ? objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", self->_bundleID), "BOOLValue")
        : 1;
    if ([a3 objectForKeyedSubscript:self->_bundleID] && self->_systemStyleEnabled != v22)
    {
      uint64_t v17 = AVSmartStyleSettingsSystemStyleEnabledDidChangedNotification;
      v24 = self->_bundleID;
      v27[0] = AVSmartStyleSettingsBundleIDKey;
      v27[1] = AVSmartStyleSettingsEnabledKey;
      v28[0] = v24;
      v28[1] = [NSNumber numberWithBool:v22];
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
      self->_systemStyleEnabled = v22;
      goto LABEL_19;
    }
  }
}

- (id)systemStyle
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3052000000;
  int v12 = __Block_byref_object_copy_;
  double v13 = __Block_byref_object_dispose_;
  uint64_t v14 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AVSmartStyleSettingsState_systemStyle__block_invoke;
  block[3] = &unk_1E5A72DE0;
  objc_copyWeak(&v7, &location);
  block[4] = &v9;
  dispatch_sync(queue, block);
  v4 = (void *)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);
  return v4;
}

void __40__AVSmartStyleSettingsState_systemStyle__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = WeakRetained[6];
  }
}

- (void)setSystemStyle:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVSmartStyleSettingsState_setSystemStyle___block_invoke;
  v6[3] = &unk_1E5A72E08;
  objc_copyWeak(&v7, &location);
  v6[4] = a3;
  void v6[5] = self;
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __44__AVSmartStyleSettingsState_setSystemStyle___block_invoke(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if (*(__CFString **)(*(void *)(a1 + 40) + 8) == AVSmartStyleSettingsSystemStyle)
      {
        uint64_t v7 = 0;
      }
      else
      {
        v5 = (void *)[MEMORY[0x1E4F1C9C8] date];
        v6 = NSNumber;
        [v5 timeIntervalSince1970];
        uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
        v4 = *(void **)(a1 + 32);
      }
      v12[0] = AVSmartStyleSettingsCastTypeKey;
      v13[0] = [v4 cast];
      v12[1] = AVSmartStyleSettingsCastIntensityKey;
      uint64_t v9 = NSNumber;
      [*(id *)(a1 + 32) intensity];
      v13[1] = objc_msgSend(v9, "numberWithFloat:");
      v12[2] = AVSmartStyleSettingsToneBiasKey;
      int v10 = NSNumber;
      [*(id *)(a1 + 32) toneBias];
      v13[2] = objc_msgSend(v10, "numberWithFloat:");
      v12[3] = AVSmartStyleSettingsColorBiasKey;
      uint64_t v11 = NSNumber;
      [*(id *)(a1 + 32) colorBias];
      v13[3] = objc_msgSend(v11, "numberWithFloat:");
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v7 = 0;
    }
    +[AVCaptureProprietaryDefaultsSingleton setObject:v7 forKey:v3[4]];
    +[AVCaptureProprietaryDefaultsSingleton setObject:v8 forKey:v3[3]];
  }
}

- (BOOL)systemStyleEnabled
{
  if ([(NSString *)self->_bundleID isEqualToString:AVSmartStyleSettingsSystemStyle])
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
    return 1;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__AVSmartStyleSettingsState_systemStyleEnabled__block_invoke;
    block[3] = &unk_1E5A72DE0;
    objc_copyWeak(&v8, &location);
    block[4] = &v10;
    dispatch_sync(queue, block);
    BOOL v4 = *((unsigned char *)v11 + 24) != 0;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v10, 8);
  }
  return v4;
}

void __47__AVSmartStyleSettingsState_systemStyleEnabled__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[56];
  }
}

- (void)setSystemStyleEnabled:(BOOL)a3
{
  if ([(NSString *)self->_bundleID isEqualToString:AVSmartStyleSettingsSystemStyle])
  {
    v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else if (![(NSString *)self->_bundleID containsString:@"com.apple."] {
         || [(id)sAllowedFirstPartyAppsInSystemStyleEnabledList containsObject:self->_bundleID])
  }
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__AVSmartStyleSettingsState_setSystemStyleEnabled___block_invoke;
    block[3] = &unk_1E5A72E30;
    objc_copyWeak(&v8, &location);
    BOOL v9 = a3;
    dispatch_async(queue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __51__AVSmartStyleSettingsState_setSystemStyleEnabled___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v3 = (id)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", WeakRetained[5]), "mutableCopy");
    if (!v3) {
      id v3 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), v4[1]);
    +[AVCaptureProprietaryDefaultsSingleton setObject:v3 forKey:v4[5]];
  }
}

@end