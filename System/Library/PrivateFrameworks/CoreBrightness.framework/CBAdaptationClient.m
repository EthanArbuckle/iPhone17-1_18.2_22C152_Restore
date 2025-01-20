@interface CBAdaptationClient
+ (BOOL)supportsAdaptation;
- (BOOL)animateFromWeakestAdaptationModeInArray:(int *)a3 withLength:(int)a4 toWeakestInArray:(int *)a5 withLength:(int)a6 withProgress:(float)a7 andPeriod:(float)a8;
- (BOOL)available;
- (BOOL)getEnabled;
- (BOOL)getStrengths:(float *)a3 nStrengths:(int)a4;
- (BOOL)overrideStrengths:(float *)a3 forModes:(int *)a4 nModes:(int)a5;
- (BOOL)registerNotificationCallbackBlock:(id)a3 withQueue:(id)a4;
- (BOOL)registerNotificationForType:(unint64_t)a3;
- (BOOL)setAdaptationMode:(int)a3 withPeriod:(float)a4;
- (BOOL)setEnabled:(BOOL)a3;
- (BOOL)setWeakestAdaptationModeFromArray:(int *)a3 withLength:(int)a4 andPeriod:(float)a5;
- (BOOL)supported;
- (CBAdaptationClient)init;
- (CBAdaptationClient)initWithClientObj:(id)a3;
- (int)getAdaptationMode;
- (void)dealloc;
- (void)handleBrightnessSystemNotificationForKey:(id)a3 withValue:(id)a4;
- (void)setSupported:(BOOL)a3;
- (void)unregisterNotificationCallbackBlock;
- (void)unregisterNotificationForType:(unint64_t)a3;
@end

@implementation CBAdaptationClient

- (BOOL)animateFromWeakestAdaptationModeInArray:(int *)a3 withLength:(int)a4 toWeakestInArray:(int *)a5 withLength:(int)a6 withProgress:(float)a7 andPeriod:(float)a8
{
  v48 = self;
  SEL v47 = a2;
  v46 = a3;
  int v45 = a4;
  v44 = a5;
  int v43 = a6;
  float v42 = a7;
  float v41 = a8;
  BOOL v40 = 0;
  v30 = self;
  objc_sync_enter(self);
  if (v48->bsc && v44 && v43 > 0 && (!v45 || v46))
  {
    id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v28 = (void *)[v29 initWithCapacity:v43];
    id v39 = v28;
    if (v28)
    {
      for (int i = 0; i < v43; ++i)
      {
        id v37 = 0;
        id v27 = objc_alloc(NSNumber);
        v26 = (void *)[v27 initWithInt:v44[i]];
        id v37 = v26;
        if (v26)
        {
          [v39 setObject:v37 atIndexedSubscript:i];
        }
      }
      id v25 = objc_alloc(NSNumber);
      *(float *)&double v8 = v41;
      v24 = (void *)[v25 initWithFloat:v8];
      id v36 = v24;
      if (v24)
      {
        id v23 = objc_alloc(NSNumber);
        *(float *)&double v9 = v42;
        v22 = (void *)[v23 initWithFloat:v9];
        id v35 = v22;
        if (v22)
        {
          id v34 = 0;
          if (v45 > 0)
          {
            if (v46)
            {
              id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
              v20 = (void *)[v21 initWithCapacity:v45];
              id v34 = v20;
              if (v20)
              {
                for (int j = 0; j < v45; ++j)
                {
                  id v32 = 0;
                  id v19 = objc_alloc(NSNumber);
                  v18 = (void *)[v19 initWithInt:v46[j]];
                  id v32 = v18;
                  if (v18)
                  {
                    [v34 setObject:v32 atIndexedSubscript:j];
                  }
                }
              }
            }
          }
          id v31 = 0;
          if (v34)
          {
            id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
            v15 = &v11;
            v16 = objc_msgSend(v17, "initWithObjectsAndKeys:", v34, @"ColorAdaptationModesInitialSub", v35, @"ProgressRatio", v39, @"ColorAdaptationModesTargetSub", v36, @"ColorAdaptationStrengthPeriod", 0);
            id v31 = v16;
          }
          else
          {
            id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
            v13 = objc_msgSend(v14, "initWithObjectsAndKeys:", v35, @"ProgressRatio", v39, @"ColorAdaptationModesTargetSub", v36, @"ColorAdaptationStrengthPeriod", 0);
            id v31 = v13;
          }
          if (v31)
          {
            BOOL v12 = [(BrightnessSystemClient *)v48->bsc setProperty:v31 forKey:@"WeakestColorAdaptationModeAnimated"];
            BOOL v40 = v12;
            v48->_modeSet = 0;
          }
          if (v34) {
        }
          }
      }
    }
  }
  objc_sync_exit(v30);
  return v40;
}

+ (BOOL)supportsAdaptation
{
  BOOL v5 = 0;
  v4 = objc_alloc_init(BrightnessSystemClient);
  if (v4)
  {
    id v3 = [(BrightnessSystemClient *)v4 copyPropertyForKey:@"SupportedColorFX"];
    if (v3)
    {
      BOOL v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", @"SupportsAmbientColorAdaptation"), "BOOLValue") & 1;
    }
  }
  return v5;
}

- (BOOL)setAdaptationMode:(int)a3 withPeriod:(float)a4
{
  uint64_t v11 = self;
  SEL v10 = a2;
  int v9 = a3;
  objc_sync_enter(self);
  *(float *)&double v4 = a4;
  char v7 = [(CBAdaptationClient *)v11 setWeakestAdaptationModeFromArray:&v9 withLength:1 andPeriod:v4];
  if (v7)
  {
    v11->_mode = v9;
    v11->_modeSet = 1;
  }
  objc_sync_exit(self);
  return v7 & 1;
}

- (BOOL)setWeakestAdaptationModeFromArray:(int *)a3 withLength:(int)a4 andPeriod:(float)a5
{
  id v27 = self;
  SEL v26 = a2;
  id v25 = a3;
  int v24 = a4;
  float v23 = a5;
  BOOL v22 = 0;
  v16 = self;
  objc_sync_enter(self);
  if (v27->bsc)
  {
    if (v25)
    {
      if (v24 > 0)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
        id v14 = (void *)[v15 initWithCapacity:v24];
        id v21 = v14;
        if (v14)
        {
          for (int i = 0; i < v24; ++i)
          {
            id v19 = 0;
            id v13 = objc_alloc(NSNumber);
            BOOL v12 = (void *)[v13 initWithInt:v25[i]];
            id v19 = v12;
            if (v12)
            {
              [v21 setObject:v19 atIndexedSubscript:i];
            }
          }
          id v11 = objc_alloc(NSNumber);
          *(float *)&double v5 = v23;
          SEL v10 = (void *)[v11 initWithFloat:v5];
          id v18 = v10;
          if (v10)
          {
            id v17 = 0;
            id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
            double v8 = objc_msgSend(v9, "initWithObjectsAndKeys:", v21, @"ColorAdaptationModesTargetSub", v18, @"ColorAdaptationStrengthPeriod", 0);
            id v17 = v8;
            if (v8)
            {
              BOOL v7 = [(BrightnessSystemClient *)v27->bsc setProperty:v17 forKey:@"WeakestColorAdaptationMode"];
              BOOL v22 = v7;
              v27->_modeSet = 0;
            }
          }
        }
      }
    }
  }
  objc_sync_exit(v16);
  return v22;
}

- (CBAdaptationClient)initWithClientObj:(id)a3
{
  id v21 = self;
  SEL v20 = a2;
  id v19 = (BrightnessSystemClient *)a3;
  if (!a3) {
    return 0;
  }
  v18.receiver = v21;
  v18.super_class = (Class)CBAdaptationClient;
  id v21 = [(CBAdaptationClient *)&v18 init];
  if (v21)
  {
    v21->bsc = v19;
    id v3 = v21->bsc;
    v21->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.Client.Adaptation", "default");
    if (!v21->_logHandle)
    {
      id v17 = 0;
      BOOL v7 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      id v17 = v7;
      char v16 = 16;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        log = v17;
        os_log_type_t type = v16;
        __os_log_helper_16_0_0(v15);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v15, 2u);
      }
    }
    id v14 = 0;
    id v14 = [(BrightnessSystemClient *)v21->bsc copyPropertyForKey:@"SupportedColorFX"];
    if (v14)
    {
      v21->_supported = objc_msgSend((id)objc_msgSend(v14, "objectForKey:", @"SupportsAmbientColorAdaptation"), "BOOLValue") & 1;
    }
    v21->ownsClient = 0;
    v8[0] = 0;
    v8[1] = v8;
    int v9 = 1375731712;
    int v10 = 48;
    id v11 = __Block_byref_object_copy__9;
    BOOL v12 = __Block_byref_object_dispose__9;
    id v13 = v21;
    -[BrightnessSystemClient registerNotificationBlock:](v21->bsc, "registerNotificationBlock:");
    _Block_object_dispose(v8, 8);
  }
  return v21;
}

uint64_t __40__CBAdaptationClient_initWithClientObj___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "handleBrightnessSystemNotificationForKey:withValue:", a2, a3, a1, a3, a2, a1);
}

- (CBAdaptationClient)init
{
  objc_super v18 = self;
  SEL v17 = a2;
  v16.receiver = self;
  v16.super_class = (Class)CBAdaptationClient;
  objc_super v18 = [(CBAdaptationClient *)&v16 init];
  if (!v18) {
    return v18;
  }
  v18->bsc = objc_alloc_init(BrightnessSystemClient);
  if (v18->bsc)
  {
    v18->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.Client.Adaptation", "default");
    if (!v18->_logHandle)
    {
      id v15 = 0;
      double v5 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      id v15 = v5;
      char v14 = 16;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        log = v15;
        os_log_type_t type = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v13, 2u);
      }
    }
    id v12 = 0;
    id v12 = [(BrightnessSystemClient *)v18->bsc copyPropertyForKey:@"SupportedColorFX"];
    if (v12)
    {
      v18->_supported = objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"SupportsAmbientColorAdaptation"), "BOOLValue") & 1;
    }
    v18->ownsClient = 1;
    v6[0] = 0;
    v6[1] = v6;
    int v7 = 1375731712;
    int v8 = 48;
    int v9 = __Block_byref_object_copy__9;
    int v10 = __Block_byref_object_dispose__9;
    id v11 = v18;
    -[BrightnessSystemClient registerNotificationBlock:](v18->bsc, "registerNotificationBlock:");
    _Block_object_dispose(v6, 8);
    return v18;
  }
  return 0;
}

uint64_t __26__CBAdaptationClient_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "handleBrightnessSystemNotificationForKey:withValue:", a2, a3, a1, a3, a2, a1);
}

- (void)dealloc
{
  double v5 = self;
  SEL v4 = a2;
  objc_sync_enter(self);
  if (v5->_logHandle)
  {

    v5->_logHandle = 0;
  }
  if (v5->bsc)
  {
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](v5->bsc, "registerNotificationBlock:forProperties:", 0);
  }
  objc_sync_exit(self);
  v3.receiver = v5;
  v3.super_class = (Class)CBAdaptationClient;
  [(CBAdaptationClient *)&v3 dealloc];
}

- (BOOL)setEnabled:(BOOL)a3
{
  BOOL v6 = a3;
  char v5 = 0;
  if (!self->bsc) {
    return 0;
  }
  objc_sync_enter(self);
  SEL v4 = (void *)[objc_alloc(NSNumber) initWithInt:v6];
  if (v4)
  {
    char v5 = [(BrightnessSystemClient *)self->bsc setProperty:v4 forKey:@"ColorAdaptationEnabled"];
  }
  objc_sync_exit(self);
  return v5 & 1;
}

- (BOOL)getEnabled
{
  BOOL v7 = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    id v5 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"ColorAdaptationEnabled"];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v3 = 0;
        if ([v5 BOOLValue]) {
          BOOL v3 = [(CBAdaptationClient *)self available];
        }
        BOOL v7 = v3;
      }
    }
    int v6 = 0;
  }
  else
  {
    BOOL v9 = 0;
    int v6 = 1;
  }
  objc_sync_exit(self);
  if (!v6) {
    return v7;
  }
  return v9;
}

- (BOOL)available
{
  char v6 = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    id v4 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"ColorAdaptationAvailable"];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v6 = [v4 BOOLValue] & 1;
      }
    }
    int v5 = 0;
  }
  else
  {
    char v8 = 0;
    int v5 = 1;
  }
  objc_sync_exit(self);
  if (!v5) {
    char v8 = v6;
  }
  return v8 & 1;
}

- (int)getAdaptationMode
{
  int mode = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    if (self->_modeSet)
    {
      int mode = self->_mode;
    }
    else
    {
      id v4 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"ColorAdaptationMode"];
      if (v4)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int mode = [v4 intValue];
        }

        self->_int mode = mode;
        self->_modeSet = 1;
      }
    }
    int v5 = 0;
  }
  else
  {
    int v8 = 0;
    int v5 = 1;
  }
  objc_sync_exit(self);
  if (!v5) {
    return mode;
  }
  return v8;
}

- (BOOL)overrideStrengths:(float *)a3 forModes:(int *)a4 nModes:(int)a5
{
  char v13 = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    if (a3)
    {
      if (a4)
      {
        if (a5 > 0 && a5 <= 6)
        {
          id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a5];
          if (v12)
          {
            for (int i = 0; i < a5; ++i)
            {
              int v10 = (void *)[objc_alloc(NSNumber) initWithInt:a4[i]];
              if (v10)
              {
                id v7 = objc_alloc(NSNumber);
                *(float *)&double v5 = a3[i];
                id v9 = (id)[v7 initWithFloat:v5];
                if (v9)
                {
                  [v12 setObject:v9 forKey:v10];
                }
              }
            }
            char v13 = [(BrightnessSystemClient *)self->bsc setProperty:v12 forKey:@"ColorAdaptationModeMapping"];
          }
        }
      }
    }
  }
  objc_sync_exit(self);
  return v13 & 1;
}

- (BOOL)getStrengths:(float *)a3 nStrengths:(int)a4
{
  char v14 = 0;
  objc_sync_enter(self);
  if (self->bsc && a3 && a4)
  {
    __memset_chk();
    id v12 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"ColorAdaptationModeMapping"];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v6 = a4 <= 6 ? a4 : 6;
        int v11 = 0;
        for (int i = 0; i < v6; ++i)
        {
          id v9 = (id)[objc_alloc(NSNumber) initWithInt:i];
          if (v9)
          {
            int v8 = (void *)[v12 objectForKey:v9];

            [v8 floatValue];
            a3[i] = v4;
            ++v11;
          }
        }
        if (v11 == v6) {
          char v14 = 1;
        }
      }
    }
    if (v12) {

    }
    int v13 = 0;
  }
  else
  {
    char v18 = 0;
    int v13 = 1;
  }
  objc_sync_exit(self);
  if (!v13) {
    char v18 = v14;
  }
  return v18 & 1;
}

- (void)handleBrightnessSystemNotificationForKey:(id)a3 withValue:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v35 = self;
  SEL v34 = a2;
  id v33 = a3;
  id v32 = a4;
  uint64_t v31 = 0;
  id v30 = 0;
  if ([a3 isEqualToString:@"ColorAdaptationAvailable"])
  {
    uint64_t v31 = 1;
    id v30 = v32;
  }
  else if ([v33 isEqualToString:@"ColorAdaptationEnabled"])
  {
    uint64_t v31 = 2;
    id v30 = v32;
  }
  else if ([v33 isEqualToString:@"SupportedColorFX"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = (id)[v32 objectForKey:@"SupportsAmbientColorAdaptation"];
      uint64_t v31 = 3;
    }
  }
  else if ([v33 isEqualToString:@"ColorAdaptationIntegratedSupport "])
  {
    uint64_t v31 = 4;
    id v30 = v32;
  }
  else
  {
    os_log_t v29 = 0;
    if (v35->_logHandle)
    {
      logHandle = v35->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    os_log_t v29 = logHandle;
    os_log_type_t v28 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v33);
      _os_log_error_impl(&dword_1BA438000, v29, v28, "error: unknown notification type (%@)", v37, 0xCu);
    }
  }
  os_log_t v27 = 0;
  if (v35->_logHandle)
  {
    int v11 = v35->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v10 = init_default_corebrightness_log();
    }
    int v11 = v10;
  }
  os_log_t v27 = v11;
  os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_5_8_64_8_0_8_64_8_0_8_0((uint64_t)v36, (uint64_t)v33, v31, (uint64_t)v30, (uint64_t)v35->_notificationBlock, (uint64_t)v35->_notificationQueue);
    _os_log_debug_impl(&dword_1BA438000, v27, v26, "key=%@ (type=%tu) value=%@  block=%p queue=%p", v36, 0x34u);
  }
  obint j = v35;
  objc_sync_enter(v35);
  if (v35->_notificationBlock && v35->_notificationQueue)
  {
    id v25 = 0;
    id v25 = _Block_copy(v35->_notificationBlock);
    notificationQueue = v35->_notificationQueue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v18 = -1073741824;
    int v19 = 0;
    SEL v20 = __73__CBAdaptationClient_handleBrightnessSystemNotificationForKey_withValue___block_invoke;
    id v21 = &unk_1E6219950;
    float v23 = v25;
    uint64_t v24 = v31;
    id v22 = v30;
    dispatch_async(notificationQueue, &block);
  }
  else
  {
    os_log_t oslog = 0;
    if (v35->_logHandle)
    {
      int v8 = v35->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      int v8 = v7;
    }
    os_log_t oslog = v8;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = oslog;
      os_log_type_t v6 = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_1BA438000, v5, v6, "no callback or queue available - ignoring notification", v14, 2u);
    }
  }
  objc_sync_exit(obj);
}

void __73__CBAdaptationClient_handleBrightnessSystemNotificationForKey_withValue___block_invoke(uint64_t a1)
{
}

- (BOOL)registerNotificationCallbackBlock:(id)a3 withQueue:(id)a4
{
  objc_super v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  int v13 = (OS_dispatch_queue *)a4;
  if (a3 && v13)
  {
    [(CBAdaptationClient *)v16 unregisterNotificationCallbackBlock];
    obint j = v16;
    objc_sync_enter(v16);
    v16->_notificationQueue = v13;
    dispatch_retain((dispatch_object_t)v13);
    v16->_notificationBlock = _Block_copy(v14);
    objc_sync_exit(obj);
    return 1;
  }
  else
  {
    id v12 = 0;
    if (v16->_logHandle)
    {
      logHandle = v16->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    id v12 = logHandle;
    char v11 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v12;
      os_log_type_t type = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1BA438000, log, type, "error: invalid parameter(s)", v10, 2u);
    }
    return 0;
  }
}

- (void)unregisterNotificationCallbackBlock
{
  if (self->_notificationQueue)
  {
    dispatch_release((dispatch_object_t)self->_notificationQueue);
    self->_notificationQueue = 0;
  }
  if (self->_notificationBlock)
  {
    _Block_release(self->_notificationBlock);
    self->_notificationBlock = 0;
  }
  objc_sync_exit(self);
}

- (BOOL)registerNotificationForType:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  os_log_type_t v6 = 0;
  switch(a3)
  {
    case 1uLL:
      os_log_type_t v6 = @"ColorAdaptationAvailable";
      break;
    case 2uLL:
      os_log_type_t v6 = @"ColorAdaptationEnabled";
      break;
    case 3uLL:
      os_log_type_t v6 = @"SupportedColorFX";
      break;
    case 4uLL:
      os_log_type_t v6 = @"ColorAdaptationIntegratedSupport ";
      break;
    default:
      if (self->_logHandle)
      {
        logHandle = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v10, a3);
        _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "error: unknown notification type (%tu)", v10, 0xCu);
      }
      break;
  }
  if (v6)
  {
    [(BrightnessSystemClient *)self->bsc registerNotificationForKey:v6];

    char v7 = 1;
  }
  return v7 & 1;
}

- (void)unregisterNotificationForType:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v5 = 0;
  switch(a3)
  {
    case 1uLL:
      double v5 = @"ColorAdaptationAvailable";
      break;
    case 2uLL:
      double v5 = @"ColorAdaptationEnabled";
      break;
    case 3uLL:
      double v5 = @"SupportedColorFX";
      break;
    case 4uLL:
      double v5 = @"ColorAdaptationIntegratedSupport ";
      break;
    default:
      if (self->_logHandle)
      {
        logHandle = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v8, a3);
        _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "error: unknown notification type (%tu)", v8, 0xCu);
      }
      break;
  }
  if (v5)
  {
    [(BrightnessSystemClient *)self->bsc unregisterNotificationForKey:v5];
  }
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

@end