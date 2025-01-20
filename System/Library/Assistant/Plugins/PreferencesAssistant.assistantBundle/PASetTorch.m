@interface PASetTorch
- (PASetTorch)initWithDictionary:(id)a3;
- (void)_performQueuedRequests;
- (void)_performWithCompletion:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performWithCompletion:(id)a3;
@end

@implementation PASetTorch

- (PASetTorch)initWithDictionary:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PASetTorch;
  v3 = [(PASetTorch *)&v10 initWithDictionary:a3];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("PASetTorch", v4);
    flashlightQueue = v3->_flashlightQueue;
    v3->_flashlightQueue = (OS_dispatch_queue *)v5;

    if (+[AVFlashlight hasFlashlight])
    {
      v7 = (AVFlashlight *)objc_alloc_init((Class)AVFlashlight);
      flashlight = v3->_flashlight;
      v3->_flashlight = v7;

      [(AVFlashlight *)v3->_flashlight addObserver:v3 forKeyPath:@"flashlightLevel" options:0 context:0];
      [(AVFlashlight *)v3->_flashlight addObserver:v3 forKeyPath:@"overheated" options:0 context:0];
      [(AVFlashlight *)v3->_flashlight addObserver:v3 forKeyPath:@"available" options:0 context:0];
    }
    else
    {
      v3->_flashlightStatusHasBeenUpdated = 1;
    }
  }
  return v3;
}

- (void)dealloc
{
  [(AVFlashlight *)self->_flashlight removeObserver:self forKeyPath:@"flashlightLevel" context:0];
  [(AVFlashlight *)self->_flashlight removeObserver:self forKeyPath:@"overheated" context:0];
  [(AVFlashlight *)self->_flashlight removeObserver:self forKeyPath:@"available" context:0];
  v3.receiver = self;
  v3.super_class = (Class)PASetTorch;
  [(PASetTorch *)&v3 dealloc];
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  flashlightQueue = self->_flashlightQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5468;
  v7[3] = &unk_105E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(flashlightQueue, v7);
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  unsigned int v5 = [(PASetTorch *)self dryRun];
  id v6 = AFGetFlashlightLevel();
  v7 = v6;
  if (v6)
  {
    [v6 floatValue];
    float v9 = v8;
  }
  else
  {
    float v9 = 1.0;
  }
  if ((+[AVFlashlight hasFlashlight] & 1) == 0)
  {
    unint64_t v10 = (unint64_t)objc_alloc_init((Class)SACommandFailed);
    [(id)v10 setReason:@"Device does not support Flashlight"];
    v11 = &SASettingPropertyUnsupportedByDeviceErrorCode;
    goto LABEL_14;
  }
  if ([(AVFlashlight *)self->_flashlight isOverheated])
  {
    unint64_t v10 = (unint64_t)objc_alloc_init((Class)SACommandFailed);
    [(id)v10 setReason:@"Flashlight is overheated"];
    v11 = &SASettingTorchOverHeatErrorCode;
LABEL_14:
    [(id)v10 setErrorCode:*v11];
    id v17 = (id)v10;
    LODWORD(v10) = 0;
    CFStringRef v18 = @"OFF";
    id v19 = v17;
    goto LABEL_15;
  }
  if (([(AVFlashlight *)self->_flashlight isAvailable] & 1) == 0)
  {
    unint64_t v10 = (unint64_t)objc_alloc_init((Class)SACommandFailed);
    [(id)v10 setReason:@"Flashlight is temporarily unavailable"];
    v11 = &SASettingTorchUnavailableErrorCode;
    goto LABEL_14;
  }
  [(AVFlashlight *)self->_flashlight flashlightLevel];
  float v13 = v12;
  if ([(PASetTorch *)self toggle])
  {
    unint64_t v10 = v13 == 0.0;
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_25:
    id v16 = 0;
    if ((((v13 != 0.0) ^ v10) & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  unint64_t v10 = (unint64_t)[(PASetTorch *)self value];
  if (v5) {
    goto LABEL_25;
  }
LABEL_11:
  flashlight = self->_flashlight;
  if (v10)
  {
    id v32 = 0;
    *(float *)&double v14 = v9;
    [(AVFlashlight *)flashlight setFlashlightLevel:&v32 withError:v14];
    id v16 = v32;
  }
  else
  {
    id v31 = 0;
    [(AVFlashlight *)flashlight setFlashlightLevel:&v31 withError:0.0];
    id v16 = v31;
    if (!v16) {
      [(AVFlashlight *)self->_flashlight turnPowerOff];
    }
  }
  [(AVFlashlight *)self->_flashlight flashlightLevel];
  unint64_t v10 = v25 > 0.0;
  if ((v13 != 0.0) == v25 > 0.0)
  {
    if (!v16) {
      goto LABEL_37;
    }
    if ([(AVFlashlight *)self->_flashlight isOverheated])
    {
      id v26 = objc_alloc_init((Class)SACommandFailed);
      [v26 setReason:@"Flashlight is overheated"];
      v27 = &SASettingTorchOverHeatErrorCode;
    }
    else
    {
      if ([(AVFlashlight *)self->_flashlight isAvailable]) {
        goto LABEL_37;
      }
      id v26 = objc_alloc_init((Class)SACommandFailed);
      [v26 setReason:@"Flashlight is temporarily unavailable"];
      v27 = &SASettingTorchUnavailableErrorCode;
    }
    [v26 setErrorCode:*v27];
    if (v26)
    {
      id v17 = v26;
      id v19 = v17;
      goto LABEL_39;
    }
LABEL_37:
    id v28 = objc_alloc_init((Class)SACommandFailed);
    [v28 setReason:@"Value unchanged, No change was made"];
    [v28 setErrorCode:SASettingValueUnchangedErrorCode];
    id v17 = v28;
    id v19 = v17;
    if (v17) {
      goto LABEL_39;
    }
  }
LABEL_38:
  id v29 = objc_alloc_init((Class)SASettingBooleanEntity);
  [v29 setValue:v10];
  v30 = +[NSNumber numberWithBool:v13 != 0.0];
  [v29 setPreviousValue:v30];

  id v19 = objc_alloc_init((Class)SASettingSetBoolResponse);
  [v19 setSetting:v29];

  id v17 = 0;
LABEL_39:

  if (v13 == 0.0) {
    CFStringRef v18 = @"OFF";
  }
  else {
    CFStringRef v18 = @"ON";
  }
LABEL_15:
  v20 = PALogForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    CFStringRef v21 = @"Set";
    if (v5) {
      CFStringRef v21 = @"Dry Run";
    }
    CFStringRef v22 = @"ON";
    if (!v10) {
      CFStringRef v22 = @"OFF";
    }
    CFStringRef v34 = v21;
    __int16 v35 = 2112;
    CFStringRef v36 = v18;
    __int16 v37 = 2112;
    CFStringRef v38 = v22;
    double v23 = v9;
    __int16 v39 = 2048;
    if (!v10) {
      double v23 = 0.0;
    }
    double v40 = v23;
    __int16 v41 = 2112;
    id v42 = v17;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "########## PSSetTorch (%@ / prev: %@ / value: %@ / level: %f / %@)", buf, 0x34u);
  }

  v24 = [v19 dictionary];
  v4[2](v4, v24);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"flashlightLevel"] & 1) != 0
    || ([v10 isEqualToString:@"available"] & 1) != 0
    || [v10 isEqualToString:@"overheated"])
  {
    flashlightQueue = self->_flashlightQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5C34;
    block[3] = &unk_105B8;
    block[4] = self;
    dispatch_async(flashlightQueue, block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PASetTorch;
    [(PASetTorch *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_performQueuedRequests
{
  pendingPerformRequests = self->_pendingPerformRequests;
  if (pendingPerformRequests)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = pendingPerformRequests;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        float v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8));
          float v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    float v9 = self->_pendingPerformRequests;
    self->_pendingPerformRequests = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPerformRequests, 0);
  objc_storeStrong((id *)&self->_flashlightQueue, 0);

  objc_storeStrong((id *)&self->_flashlight, 0);
}

@end