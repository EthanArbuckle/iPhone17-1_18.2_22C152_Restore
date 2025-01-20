@interface PAGetTorch
- (PAGetTorch)initWithDictionary:(id)a3;
- (void)_performQueuedRequests;
- (void)_performWithCompletion:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performWithCompletion:(id)a3;
@end

@implementation PAGetTorch

- (PAGetTorch)initWithDictionary:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PAGetTorch;
  v3 = [(PAGetTorch *)&v10 initWithDictionary:a3];
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
  v3.super_class = (Class)PAGetTorch;
  [(PAGetTorch *)&v3 dealloc];
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  flashlightQueue = self->_flashlightQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4610;
  v7[3] = &unk_105E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(flashlightQueue, v7);
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (+[AVFlashlight hasFlashlight]
    && [(AVFlashlight *)self->_flashlight isAvailable]
    && ([(AVFlashlight *)self->_flashlight isOverheated] & 1) == 0)
  {
    [(AVFlashlight *)self->_flashlight flashlightLevel];
    BOOL v5 = v11 > 0.0;
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = objc_alloc_init((Class)SASettingBooleanEntity);
  [v6 setValue:v5];
  id v7 = objc_alloc_init((Class)SASettingGetBoolResponse);
  [v7 setSetting:v6];
  id v8 = PALogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"OFF";
    if (v5) {
      CFStringRef v9 = @"ON";
    }
    int v12 = 138412290;
    CFStringRef v13 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "########## PAGetTorch (%@)", (uint8_t *)&v12, 0xCu);
  }

  objc_super v10 = [v7 dictionary];
  v4[2](v4, v10);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"available"] & 1) != 0
    || ([v10 isEqualToString:@"flashlightLevel"] & 1) != 0
    || [v10 isEqualToString:@"overheated"])
  {
    flashlightQueue = self->_flashlightQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4AF4;
    block[3] = &unk_105B8;
    block[4] = self;
    dispatch_async(flashlightQueue, block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PAGetTorch;
    [(PAGetTorch *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
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
        id v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8));
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    CFStringRef v9 = self->_pendingPerformRequests;
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