@interface BRButtonResolverController
+ (id)sharedInstance;
+ (void)sharedInstance;
- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5;
- (BOOL)enableStates:(id)a3 error:(id *)a4;
- (BOOL)isReady;
- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5;
- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6;
- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4;
- (BRButtonResolverController)init;
- (id)description;
- (id)propertyList;
- (unint64_t)maxAssetSlots;
- (unint64_t)unusedAssetSlots;
- (void)dealloc;
- (void)init;
- (void)propertyList;
- (void)scheduleReadyNotificationOnDispatchQueue:(id)a3 withBlock:(id)a4;
@end

@implementation BRButtonResolverController

+ (id)sharedInstance
{
  v3 = _BRLog_log;
  if (!_BRLog_log)
  {
    v3 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v3;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[BRButtonResolverController sharedInstance];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__BRButtonResolverController_sharedInstance__block_invoke;
  block[3] = &unk_2645C7E98;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  return (id)sharedInstance_inst;
}

id __44__BRButtonResolverController_sharedInstance__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedInstance_inst = (uint64_t)result;
  return result;
}

- (BRButtonResolverController)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRButtonResolverController;
  v2 = [(BRButtonResolverController *)&v7 init];
  if (v2)
  {
    v3 = +[BRInterface interfaces];
    v2->_interfaces = v3;
    if (v3)
    {
      uint64_t v4 = v3;
    }
    else
    {
      uint64_t v6 = _BRLog_log;
      if (!_BRLog_log)
      {
        uint64_t v6 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log = (uint64_t)v6;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BRButtonResolverController init](v6);
      }

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BRButtonResolverController;
  [(BRButtonResolverController *)&v3 dealloc];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)BRButtonResolverController;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[BRButtonResolverController description](&v5, sel_description));
  [v3 appendFormat:@"Interfaces: %@;\n", self->_interfaces];
  return v3;
}

- (id)propertyList
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  interfaces = self->_interfaces;
  uint64_t v5 = [(NSSet *)interfaces countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(interfaces);
        }
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "propertyList"), objc_msgSend((id)objc_opt_class(), "description"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)interfaces countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  uint64_t v9 = _BRLog_log;
  if (!_BRLog_log)
  {
    uint64_t v9 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(BRButtonResolverController *)(uint64_t)v3 propertyList];
  }
  return v3;
}

- (BOOL)isReady
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  interfaces = self->_interfaces;
  uint64_t v3 = [(NSSet *)interfaces countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(interfaces);
      }
      int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) isReady];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSSet *)interfaces countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (unint64_t)maxAssetSlots
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  interfaces = self->_interfaces;
  uint64_t v3 = [(NSSet *)interfaces countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return -1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v11;
  unint64_t v6 = -1;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(interfaces);
      }
      uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if ([v8 maxAssetSlots] < v6) {
        unint64_t v6 = [v8 maxAssetSlots];
      }
    }
    uint64_t v4 = [(NSSet *)interfaces countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v6;
}

- (unint64_t)unusedAssetSlots
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  interfaces = self->_interfaces;
  uint64_t v3 = [(NSSet *)interfaces countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return -1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v11;
  unint64_t v6 = -1;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(interfaces);
      }
      uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if ([v8 maxAssetSlots] < v6) {
        unint64_t v6 = [v8 unusedAssetSlots];
      }
    }
    uint64_t v4 = [(NSSet *)interfaces countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v6;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v30 = 0;
  int v7 = _BRLog_log;
  if (!_BRLog_log)
  {
    int v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRButtonResolverController setGlobalConfigs:error:](v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if ([(BRButtonResolverController *)self isReady])
  {
    if (a3)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      interfaces = self->_interfaces;
      uint64_t v16 = [(NSSet *)interfaces countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (!v16)
      {
        v20 = 0;
        return v20 == 0;
      }
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(interfaces);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) setGlobalConfigs:a3 error:&v30];
        }
        uint64_t v17 = [(NSSet *)interfaces countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v17);
      v20 = v30;
      if (!v30) {
        return v20 == 0;
      }
      goto LABEL_15;
    }
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08410];
    uint64_t v25 = -536870206;
  }
  else
  {
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08410];
    uint64_t v25 = -536870184;
  }
  v20 = (void *)[v23 errorWithDomain:v24 code:v25 userInfo:0];
  v30 = v20;
  if (!v20) {
    return v20 == 0;
  }
LABEL_15:
  v21 = _BRLog_log;
  if (!_BRLog_log)
  {
    v21 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v21;
    v20 = v30;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[BRButtonResolverController setGlobalConfigs:error:]";
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_error_impl(&dword_221782000, v21, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    v20 = v30;
    if (!a4) {
      return v20 == 0;
    }
    goto LABEL_19;
  }
  if (a4) {
LABEL_19:
  }
    *a4 = v20;
  return v20 == 0;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v36 = 0;
  uint64_t v11 = _BRLog_log;
  if (!_BRLog_log)
  {
    uint64_t v11 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BRButtonResolverController setConfigs:withAssets:forStates:error:](v11, v12, v13, v14, v15, v16, v17, v18);
  }
  if ([(BRButtonResolverController *)self isReady])
  {
    if (a5)
    {
      if ([a5 count])
      {
        if (!a3 || (uint64_t v19 = [a3 count], v19 == objc_msgSend(a5, "count")))
        {
          if (!a4 || (uint64_t v20 = [a4 count], v20 == objc_msgSend(a5, "count")))
          {
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            interfaces = self->_interfaces;
            uint64_t v22 = [(NSSet *)interfaces countByEnumeratingWithState:&v32 objects:v41 count:16];
            if (!v22)
            {
              long long v26 = 0;
              return v26 == 0;
            }
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v33 != v24) {
                  objc_enumerationMutation(interfaces);
                }
                [*(id *)(*((void *)&v32 + 1) + 8 * i) setConfigs:a3 withAssets:a4 forStates:a5 error:&v36];
              }
              uint64_t v23 = [(NSSet *)interfaces countByEnumeratingWithState:&v32 objects:v41 count:16];
            }
            while (v23);
            long long v26 = v36;
            if (!v36) {
              return v26 == 0;
            }
            goto LABEL_20;
          }
        }
      }
    }
    long long v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08410];
    uint64_t v31 = -536870206;
  }
  else
  {
    long long v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08410];
    uint64_t v31 = -536870184;
  }
  long long v26 = (void *)[v29 errorWithDomain:v30 code:v31 userInfo:0];
  uint64_t v36 = v26;
  if (!v26) {
    return v26 == 0;
  }
LABEL_20:
  long long v27 = _BRLog_log;
  if (!_BRLog_log)
  {
    long long v27 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v27;
    long long v26 = v36;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[BRButtonResolverController setConfigs:withAssets:forStates:error:]";
    __int16 v39 = 2112;
    v40 = v26;
    _os_log_error_impl(&dword_221782000, v27, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    long long v26 = v36;
    if (!a6) {
      return v26 == 0;
    }
    goto LABEL_24;
  }
  if (a6) {
LABEL_24:
  }
    *a6 = v26;
  return v26 == 0;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v27 = 0;
  int v7 = _BRLog_log;
  if (!_BRLog_log)
  {
    int v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRButtonResolverController enableStates:error:](v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if ([(BRButtonResolverController *)self isReady])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    interfaces = self->_interfaces;
    uint64_t v16 = [(NSSet *)interfaces countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (!v16)
    {
      uint64_t v20 = 0;
      return v20 == 0;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(interfaces);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) enableStates:a3 error:&v27];
      }
      uint64_t v17 = [(NSSet *)interfaces countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v17);
    uint64_t v20 = v27;
    if (!v27) {
      return v20 == 0;
    }
  }
  else
  {
    uint64_t v20 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870184 userInfo:0];
    long long v27 = v20;
    if (!v20) {
      return v20 == 0;
    }
  }
  v21 = _BRLog_log;
  if (!_BRLog_log)
  {
    v21 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v21;
    uint64_t v20 = v27;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v29 = "-[BRButtonResolverController enableStates:error:]";
    __int16 v30 = 2112;
    uint64_t v31 = v20;
    _os_log_error_impl(&dword_221782000, v21, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    uint64_t v20 = v27;
    if (!a4) {
      return v20 == 0;
    }
    goto LABEL_18;
  }
  if (a4) {
LABEL_18:
  }
    *a4 = v20;
  return v20 == 0;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v29 = 0;
  uint64_t v9 = _BRLog_log;
  if (!_BRLog_log)
  {
    uint64_t v9 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRButtonResolverController disableStates:clearAsset:error:](v9, v10, v11, v12, v13, v14, v15, v16);
  }
  if ([(BRButtonResolverController *)self isReady])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    interfaces = self->_interfaces;
    uint64_t v18 = [(NSSet *)interfaces countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (!v18)
    {
      uint64_t v22 = 0;
      return v22 == 0;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(interfaces);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) disableStates:a3 clearAsset:v6 error:&v29];
      }
      uint64_t v19 = [(NSSet *)interfaces countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v19);
    uint64_t v22 = v29;
    if (!v29) {
      return v22 == 0;
    }
  }
  else
  {
    uint64_t v22 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870184 userInfo:0];
    long long v29 = v22;
    if (!v22) {
      return v22 == 0;
    }
  }
  long long v23 = _BRLog_log;
  if (!_BRLog_log)
  {
    long long v23 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v23;
    uint64_t v22 = v29;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[BRButtonResolverController disableStates:clearAsset:error:]";
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    _os_log_error_impl(&dword_221782000, v23, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    uint64_t v22 = v29;
    if (!a5) {
      return v22 == 0;
    }
    goto LABEL_18;
  }
  if (a5) {
LABEL_18:
  }
    *a5 = v22;
  return v22 == 0;
}

- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v29 = 0;
  uint64_t v9 = _BRLog_log;
  if (!_BRLog_log)
  {
    uint64_t v9 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRButtonResolverController playState:forSpeed:error:](v9, v10, v11, v12, v13, v14, v15, v16);
  }
  if ([(BRButtonResolverController *)self isReady])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    interfaces = self->_interfaces;
    uint64_t v18 = [(NSSet *)interfaces countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (!v18)
    {
      uint64_t v22 = 0;
      return v22 == 0;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(interfaces);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) playState:a3 forSpeed:a4 error:&v29];
      }
      uint64_t v19 = [(NSSet *)interfaces countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v19);
    uint64_t v22 = v29;
    if (!v29) {
      return v22 == 0;
    }
  }
  else
  {
    uint64_t v22 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870184 userInfo:0];
    long long v29 = v22;
    if (!v22) {
      return v22 == 0;
    }
  }
  long long v23 = _BRLog_log;
  if (!_BRLog_log)
  {
    long long v23 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v23;
    uint64_t v22 = v29;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[BRButtonResolverController playState:forSpeed:error:]";
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    _os_log_error_impl(&dword_221782000, v23, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    uint64_t v22 = v29;
    if (!a5) {
      return v22 == 0;
    }
    goto LABEL_18;
  }
  if (a5) {
LABEL_18:
  }
    *a5 = v22;
  return v22 == 0;
}

- (void)scheduleReadyNotificationOnDispatchQueue:(id)a3 withBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  NSUInteger v19 = 0;
  NSUInteger v19 = [(NSSet *)self->_interfaces count];
  int v7 = _BRLog_log;
  if (!_BRLog_log)
  {
    int v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRButtonResolverController scheduleReadyNotificationOnDispatchQueue:withBlock:](buf, [(NSSet *)self->_interfaces count], v7);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  interfaces = self->_interfaces;
  uint64_t v9 = [(NSSet *)interfaces countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(interfaces);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __81__BRButtonResolverController_scheduleReadyNotificationOnDispatchQueue_withBlock___block_invoke;
        v13[3] = &unk_2645C7EC0;
        v13[6] = a4;
        v13[7] = v18;
        v13[4] = a3;
        v13[5] = v12;
        [v12 scheduleReadyNotificationWithBlock:v13];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSSet *)interfaces countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v9);
  }
  _Block_object_dispose(v18, 8);
}

void __81__BRButtonResolverController_scheduleReadyNotificationOnDispatchQueue_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 24) - 1;
  *(void *)(v3 + 24) = v4;
  if (!v4) {
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 48));
  }
  uint64_t v5 = _BRLog_log;
  if (!_BRLog_log)
  {
    uint64_t v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __81__BRButtonResolverController_scheduleReadyNotificationOnDispatchQueue_withBlock___block_invoke_cold_1(a1, v2, v5);
  }
}

+ (void)sharedInstance
{
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[BRButtonResolverController init]";
  _os_log_error_impl(&dword_221782000, log, OS_LOG_TYPE_ERROR, "%s failed!", (uint8_t *)&v1, 0xCu);
}

- (void)propertyList
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[BRButtonResolverController propertyList]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_221782000, a2, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v2, 0x16u);
}

- (void)setGlobalConfigs:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setConfigs:(uint64_t)a3 withAssets:(uint64_t)a4 forStates:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enableStates:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)disableStates:(uint64_t)a3 clearAsset:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)playState:(uint64_t)a3 forSpeed:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)scheduleReadyNotificationOnDispatchQueue:(os_log_t)log withBlock:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "-[BRButtonResolverController scheduleReadyNotificationOnDispatchQueue:withBlock:]";
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_221782000, log, OS_LOG_TYPE_DEBUG, "%s interface count: %lu", buf, 0x16u);
}

void __81__BRButtonResolverController_scheduleReadyNotificationOnDispatchQueue_withBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *(void *)(*(void *)(*(void *)a2 + 8) + 24);
  int v7 = 136315650;
  uint64_t v8 = "-[BRButtonResolverController scheduleReadyNotificationOnDispatchQueue:withBlock:]_block_invoke";
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_221782000, a3, OS_LOG_TYPE_DEBUG, "%s interface is ready: %@, unready interfaces: %lu", (uint8_t *)&v7, 0x20u);
}

@end