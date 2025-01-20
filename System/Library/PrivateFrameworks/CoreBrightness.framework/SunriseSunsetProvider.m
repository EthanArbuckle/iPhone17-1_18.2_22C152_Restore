@interface SunriseSunsetProvider
- (SunriseSunsetProvider)initWithCallback:(id)a3;
- (id)copySunriseSunsetInfo:(int)a3;
- (id)copySunsetSunriseInfoFromContext;
- (int)logLevel;
- (void)cancel;
- (void)dealloc;
- (void)registerBlock:(id)a3;
- (void)setLogLevel:(int)a3;
- (void)unregisterBlock;
- (void)unregisterNotification;
- (void)updateSunriseSunsetInfo;
@end

@implementation SunriseSunsetProvider

- (id)copySunsetSunriseInfoFromContext
{
  v33 = self;
  SEL v32 = a2;
  id v31 = 0;
  id v30 = 0;
  if (self->_duetContextStore)
  {
    if (v33->_duetKeyPath)
    {
      id v31 = (id)[(_CDClientContext *)v33->_duetContextStore objectForKeyedSubscript:v33->_duetKeyPath];
      if (v31)
      {
        unint64_t v17 = 0x1E4F1C000uLL;
        id v30 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        NSLog(&cfstr_Datadictionary.isa, objc_msgSend((id)objc_msgSend(v31, "description"), "UTF8String"));
        Class v29 = 0;
        Class v29 = NSClassFromString(&cfstr_Cdcontextqueri.isa);
        uint64_t v28 = 0;
        uint64_t v28 = [(objc_class *)v29 sunriseSunsetAvailabilityStatusKey];
        uint64_t v27 = 0;
        uint64_t v27 = [v31 objectForKeyedSubscript:v28];
        [v30 setValue:v27 forKey:@"status"];
        uint64_t v28 = [(objc_class *)v29 currentSunriseKey];
        uint64_t v26 = 0;
        uint64_t v26 = [v31 objectForKeyedSubscript:v28];
        uint64_t v25 = 0;
        id v11 = v31;
        uint64_t v2 = [(objc_class *)v29 currentSunsetKey];
        uint64_t v25 = [v11 objectForKeyedSubscript:v2];
        uint64_t v24 = 0;
        id v12 = v31;
        uint64_t v3 = [(objc_class *)v29 nextSunriseKey];
        uint64_t v24 = [v12 objectForKeyedSubscript:v3];
        uint64_t v23 = 0;
        id v13 = v31;
        uint64_t v4 = [(objc_class *)v29 nextSunsetKey];
        uint64_t v23 = [v13 objectForKeyedSubscript:v4];
        uint64_t v22 = 0;
        id v14 = v31;
        uint64_t v5 = [(objc_class *)v29 previousSunriseKey];
        uint64_t v22 = [v14 objectForKeyedSubscript:v5];
        uint64_t v21 = 0;
        id v15 = v31;
        uint64_t v6 = [(objc_class *)v29 previousSunsetKey];
        uint64_t v21 = [v15 objectForKeyedSubscript:v6];
        uint64_t v20 = 0;
        id v16 = v31;
        uint64_t v7 = [(objc_class *)v29 isDaylightKey];
        uint64_t v20 = [v16 objectForKeyedSubscript:v7];
        id v19 = 0;
        id v8 = objc_alloc(*(Class *)(v17 + 2656));
        v18 = &v10;
        id v19 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", v26, @"sunrise", v25, @"sunset", v22, @"previousSunrise", v21, @"previousSunset", v24, @"nextSunrise", v23, @"nextSunset", v20, @"isDaylight", 0);
        [v30 setObject:v19 forKey:@"sunSchedule"];
      }
    }
  }
  return v30;
}

- (SunriseSunsetProvider)initWithCallback:(id)a3
{
  uint64_t v21 = self;
  SEL v20 = a2;
  id v19 = a3;
  NSLog(&cfstr_SSunrisesunset.isa, "-[SunriseSunsetProvider initWithCallback:]");
  v18.receiver = v21;
  v18.super_class = (Class)SunriseSunsetProvider;
  uint64_t v21 = [(SunriseSunsetProvider *)&v18 init];
  if (v21)
  {
    if (dlopen("/System/Library/PrivateFrameworks/CoreDuetContext.framework/CoreDuetContext", 1))
    {
      NSLog(&cfstr_SCoreduetLoade.isa, "-[SunriseSunsetProvider initWithCallback:]");
      uint64_t v3 = [NSClassFromString(&cfstr_Cdclientcontex.isa) userContext];
      v21->_duetContextStore = (_CDClientContext *)v3;
      if (v21->_duetContextStore)
      {
        v21->_duetDispatchSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
        if (v19)
        {
          uint64_t v4 = _Block_copy(v19);
          v21->_callbackBlock = v4;
        }
        uint64_t v5 = [NSClassFromString(&cfstr_Cdcontextqueri.isa) keyPathForSunriseSunsetDataDictionary];
        v21->_duetKeyPath = (_CDContextualKeyPath *)v5;
        Class v6 = NSClassFromString(&cfstr_Cdcontextualpr.isa);
        uint64_t v7 = [(objc_class *)v6 predicateForChangeAtKeyPath:v21->_duetKeyPath];
        v21->_predicate = (_CDContextualPredicate *)v7;
        uint64_t v11 = MEMORY[0x1E4F143A8];
        int v12 = -1073741824;
        int v13 = 0;
        id v14 = __42__SunriseSunsetProvider_initWithCallback___block_invoke;
        id v15 = &unk_1E621AD38;
        id v16 = v21;
        v21->_duetCallback = &v11;
        Class v8 = NSClassFromString(&cfstr_Cdcontextualch.isa);
        uint64_t v9 = [(objc_class *)v8 registrationWithIdentifier:@"com.apple.CoreBrightness.registrationForSunsetSunrise" contextualPredicate:v21->_predicate dismissalPolicy:0 deviceSet:0 mustWake:0 callback:v21->_duetCallback];
        v21->_duetRegistration = (_CDContextualChangeRegistration *)v9;
        if (v21->_duetRegistration)
        {
          [(_CDClientContext *)v21->_duetContextStore registerCallback:v21->_duetRegistration];
          v21->_sunriseSunsetNotificationEnabled = 1;
        }
      }
      else
      {
        NSLog(&cfstr_SDuetContextSt.isa, "-[SunriseSunsetProvider initWithCallback:]");

        return 0;
      }
    }
    else
    {
      NSLog(&cfstr_SCoreduetFrame.isa, "-[SunriseSunsetProvider initWithCallback:]");

      return 0;
    }
  }
  else
  {
    NSLog(&cfstr_SErrorOnInitia.isa, "-[SunriseSunsetProvider initWithCallback:]");

    return 0;
  }
  return v21;
}

uint64_t __42__SunriseSunsetProvider_initWithCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)registerBlock:(id)a3
{
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SRegisterAsync.isa, "-[SunriseSunsetProvider registerBlock:]");
  }
  objc_sync_enter(self);
  if (self->_callbackBlock)
  {
    _Block_release(self->_callbackBlock);
    self->_callbackBlock = 0;
  }
  if (a3) {
    self->_callbackBlock = _Block_copy(a3);
  }
  objc_sync_exit(self);
}

- (void)unregisterBlock
{
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SUnregistering.isa, "-[SunriseSunsetProvider unregisterBlock]");
  }
  objc_sync_enter(self);
  if (self->_callbackBlock)
  {
    _Block_release(self->_callbackBlock);
    self->_callbackBlock = 0;
  }
  objc_sync_exit(self);
}

- (void)unregisterNotification
{
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SUnregistering_0.isa, "-[SunriseSunsetProvider unregisterNotification]");
  }
  objc_sync_enter(self);
  if (self->_duetRegistration)
  {
    [(_CDClientContext *)self->_duetContextStore deregisterCallback:self->_duetRegistration];
  }
  self->_sunriseSunsetNotificationEnabled = 0;
  objc_sync_exit(self);
}

- (void)cancel
{
}

- (void)dealloc
{
  uint64_t v5 = self;
  SEL v4 = a2;
  objc_sync_enter(self);
  if (v5->_duetDispatchSemaphore)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)v5->_duetDispatchSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release((dispatch_object_t)v5->_duetDispatchSemaphore);
    v5->_duetDispatchSemaphore = 0;
  }

  v5->_duetKeyPath = 0;
  v5->_duetContextStore = 0;

  v5->_predicate = 0;
  objc_sync_exit(self);
  v3.receiver = v5;
  v3.super_class = (Class)SunriseSunsetProvider;
  [(SunriseSunsetProvider *)&v3 dealloc];
}

- (id)copySunriseSunsetInfo:(int)a3
{
  SEL v32 = self;
  SEL v31 = a2;
  int v30 = a3;
  Class v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  int v24 = 1375731712;
  int v25 = 48;
  uint64_t v26 = __Block_byref_object_copy__19;
  uint64_t v27 = __Block_byref_object_dispose__19;
  uint64_t v28 = 0;
  uint64_t v17 = 0;
  objc_super v18 = &v17;
  int v19 = 0x20000000;
  int v20 = 32;
  char v21 = 0;
  objc_sync_enter(self);
  if (!v32->_duetDispatchSemaphore || dispatch_semaphore_wait((dispatch_semaphore_t)v32->_duetDispatchSemaphore, 0))
  {
    if (v32->_logLevel >= 7) {
      NSLog(&cfstr_SAlreadyStuckI.isa, "-[SunriseSunsetProvider copySunriseSunsetInfo:]");
    }
  }
  else
  {
    global_queue = dispatch_get_global_queue(2, 0);
    uint64_t block = MEMORY[0x1E4F143A8];
    int v10 = -1073741824;
    int v11 = 0;
    int v12 = __47__SunriseSunsetProvider_copySunriseSunsetInfo___block_invoke;
    int v13 = &unk_1E621AD60;
    id v15 = &v22;
    id v14 = v32;
    id v16 = &v17;
    dispatch_async(global_queue, &block);
    dsema = v32->_duetDispatchSemaphore;
    dispatch_time_t v4 = dispatch_time(0, 1000000 * v30);
    if (dispatch_semaphore_wait(dsema, v4))
    {
      if (v32->_logLevel >= 7) {
        NSLog(&cfstr_SSunriseSunset_4.isa, "-[SunriseSunsetProvider copySunriseSunsetInfo:]");
      }
      *((unsigned char *)v18 + 24) = 1;
    }
    else
    {
      if (v32->_logLevel >= 7) {
        NSLog(&cfstr_SSunriseSunset_3.isa, "-[SunriseSunsetProvider copySunriseSunsetInfo:]");
      }
      dispatch_semaphore_signal((dispatch_semaphore_t)v32->_duetDispatchSemaphore);
      Class v29 = (void *)v23[5];
    }
  }
  objc_sync_exit(self);
  Class v6 = v29;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v22, 8);
  return v6;
}

uint64_t __47__SunriseSunsetProvider_copySunriseSunsetInfo___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) copySunsetSunriseInfoFromContext];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(int *)(*(void *)(a1 + 32) + 80) >= 7) {
      NSLog(&cfstr_STimeoutDetect.isa, "-[SunriseSunsetProvider copySunriseSunsetInfo:]_block_invoke");
    }
    if (*(void *)(*(void *)(a1 + 32) + 56)) {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
    }
  }
  return objc_sync_exit(obj);
}

- (void)updateSunriseSunsetInfo
{
  int v11 = self;
  SEL v10 = a2;
  objc_sync_enter(self);
  if (v11->_sunriseSunsetNotificationEnabled
    && v11->_duetDispatchSemaphore
    && !dispatch_semaphore_wait((dispatch_semaphore_t)v11->_duetDispatchSemaphore, 0))
  {
    global_queue = dispatch_get_global_queue(2, 0);
    uint64_t block = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    uint64_t v7 = __48__SunriseSunsetProvider_updateSunriseSunsetInfo__block_invoke;
    Class v8 = &unk_1E6218FE0;
    uint64_t v9 = v11;
    dispatch_async(global_queue, &block);
  }
  else if (v11->_logLevel >= 7)
  {
    NSLog(&cfstr_SAlreadyStuckI.isa, "-[SunriseSunsetProvider updateSunriseSunsetInfo]");
  }
  objc_sync_exit(self);
}

uint64_t __48__SunriseSunsetProvider_updateSunriseSunsetInfo__block_invoke(uint64_t a1)
{
  dispatch_time_t v4 = (void *)[*(id *)(a1 + 32) copySunsetSunriseInfoFromContext];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(int *)(*(void *)(a1 + 32) + 80) >= 7) {
    NSLog(&cfstr_SCallingBackWi.isa, "-[SunriseSunsetProvider updateSunriseSunsetInfo]_block_invoke");
  }
  if (*(void *)(*(void *)(a1 + 32) + 56)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
  }

  return objc_sync_exit(obj);
}

- (int)logLevel
{
  return self->_logLevel;
}

- (void)setLogLevel:(int)a3
{
  self->_logLevel = a3;
}

@end