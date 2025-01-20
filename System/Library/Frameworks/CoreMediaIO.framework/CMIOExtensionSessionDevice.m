@interface CMIOExtensionSessionDevice
+ (id)sessionDeviceWithPropertyStates:(id)a3 streamsStates:(id)a4 provider:(id)a5;
- (BOOL)isInvalidated;
- (BOOL)isRunningSomewhere;
- (CMIOExtensionSessionDevice)initWithPropertyStates:(id)a3 streamsStates:(id)a4 provider:(id)a5;
- (CMIOExtensionSessionDeviceDelegate)delegate;
- (CMIOExtensionSessionProvider)provider;
- (NSArray)streams;
- (NSSet)availableProperties;
- (NSString)legacyDeviceID;
- (NSString)localizedName;
- (NSString)manufacturer;
- (NSString)modelID;
- (NSUUID)deviceID;
- (id)cachedPropertyStateForProperty:(id)a3;
- (id)cachedPropertyStatesForProperties:(id)a3;
- (id)description;
- (int)deviceControlPID;
- (void)completeTransaction;
- (void)dealloc;
- (void)propertyStatesForProperties:(id)availableProperties reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceControlPID:(int)a3;
- (void)setDeviceControlPID:(int)a3 reply:(id)a4;
- (void)setInvalidated:(BOOL)a3;
- (void)setPropertyValues:(id)a3 reply:(id)a4;
- (void)setRunningSomewhere:(BOOL)a3;
- (void)unregister;
- (void)updatePropertyStates:(id)a3;
- (void)updateStreamIDs:(id)a3;
@end

@implementation CMIOExtensionSessionDevice

+ (id)sessionDeviceWithPropertyStates:(id)a3 streamsStates:(id)a4 provider:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPropertyStates:a3 streamsStates:a4 provider:a5];

  return v5;
}

- (CMIOExtensionSessionDevice)initWithPropertyStates:(id)a3 streamsStates:(id)a4 provider:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if (!a3 || !a4 || !a5)
  {

    goto LABEL_9;
  }
  v54.receiver = self;
  v54.super_class = (Class)CMIOExtensionSessionDevice;
  v8 = [(CMIOExtensionSessionDevice *)&v54 init];
  if (!v8) {
    return 0;
  }
  v9 = v8;
  v8->_lock._os_unfair_lock_opaque = 0;
  lock = &v8->_lock;
  id v10 = +[CMIOExtensionDevice internalProperties];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __76__CMIOExtensionSessionDevice_initWithPropertyStates_streamsStates_provider___block_invoke;
  v53[3] = &unk_26517C610;
  v53[4] = v10;
  v9->_availableProperties = (NSSet *)(id)[a3 keysOfEntriesPassingTest:v53];
  v9->_localizedName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C450), "value");
  v11 = (void *)[a3 objectForKeyedSubscript:0x26F89C470];
  v9->_deviceID = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDString:", objc_msgSend(v11, "value"));
  v9->_legacyDeviceID = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C490), "value");
  v9->_manufacturer = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"4cc_lmak_glob_0000"), "value");
  v9->_modelID = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"CMIOExtensionPropertyDeviceModel"), "value");
  v9->_runningSomewhere = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C4D0), "value"), "BOOLValue");
  v9->_streamIDs = (NSArray *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C4B0), "value");
  p_streamIDs = (id *)&v9->_streamIDs;
  v9->_deviceControlPID = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C510), "value"), "intValue");
  v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"4cc_cfds_glob_0000"), "value");
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LODWORD(v13) = [v13 BOOLValue];
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v13 length] == 1)
      {
        buf[0] = 0;
        [v13 getBytes:buf length:1];
        int v16 = buf[0];
LABEL_17:
        LODWORD(v13) = v16 != 0;
        goto LABEL_19;
      }
      if ([v13 length] == 4)
      {
        *(_DWORD *)buf = 0;
        [v13 getBytes:buf length:4];
        int v16 = *(_DWORD *)buf;
        goto LABEL_17;
      }
    }
    LODWORD(v13) = 0;
  }
LABEL_19:
  objc_storeWeak((id *)&v9->_provider, a5);
  v9->_propertyStates = (NSMutableDictionary *)[a3 mutableCopy];
  v9->_streams = (NSMutableArray *)objc_opt_new();
  v9->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionSessionDevice: ID %@, legacy: %@>", v9->_deviceID, v9->_legacyDeviceID];
  if (v13)
  {
    if ([*p_streamIDs count] != 2)
    {
      v45 = CMIOLog();
      if (v45 && os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]();
      }
      goto LABEL_71;
    }
    uint64_t v17 = 0;
    v18 = 0;
    v19 = 0;
    char v20 = 1;
    while (1)
    {
      char v21 = v20;
      v22 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(*p_streamIDs, "objectAtIndexedSubscript:", v17));
      if (!v22)
      {
        v26 = CMIOLog();
        if (v26)
        {
          v27 = v26;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v47 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
            uint64_t v28 = [*p_streamIDs objectAtIndexedSubscript:v17];
            *(_DWORD *)buf = 136315906;
            v57 = v47;
            __int16 v58 = 1024;
            int v59 = 830;
            __int16 v60 = 2080;
            v61 = "-[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]";
            __int16 v62 = 2114;
            uint64_t v63 = v28;
            _os_log_error_impl(&dword_2432B6000, v27, OS_LOG_TYPE_ERROR, "%s:%d:%s missing stream properties for %{public}@", buf, 0x26u);
          }
        }
        goto LABEL_40;
      }
      v23 = v22;
      uint64_t v24 = objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"4cc_cfac_glob_0000"), "value");
      if (v24)
      {
        v25 = (void *)v24;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v25 BOOLValue]) {
            goto LABEL_36;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v25 length] == 1)
            {
              buf[0] = 0;
              [v25 getBytes:buf length:1];
              if (buf[0]) {
                goto LABEL_36;
              }
            }
            else if ([v25 length] == 4)
            {
              *(_DWORD *)buf = 0;
              [v25 getBytes:buf length:4];
              if (*(_DWORD *)buf)
              {
LABEL_36:
                if (!v19) {
                  v19 = +[CMIOExtensionSessionStream sessionStreamWithPropertyStates:v23 provider:a5];
                }
                goto LABEL_40;
              }
            }
          }
        }
        if (!v18) {
          v18 = +[CMIOExtensionSessionStream sessionStreamWithPropertyStates:v23 provider:a5];
        }
      }
LABEL_40:
      char v20 = 0;
      uint64_t v17 = 1;
      if ((v21 & 1) == 0)
      {
        if (v19 && v18)
        {
          v29 = v19;
          v14 = v9;
          v30 = +[CMIOExtensionSessionDualStream sessionDualStreamWithPrimaryStream:v18 secondaryStream:v29];
          if (objc_msgSend(a5, "registerStream:streamID:", v30, -[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](v18, "streamID"), "UUIDString"))&& objc_msgSend(a5, "registerStream:streamID:", v30, -[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](v29, "streamID"), "UUIDString")))
          {
            os_unfair_lock_lock(lock);
            [(NSMutableArray *)v9->_streams addObject:v30];
            os_unfair_lock_unlock(lock);
          }
          goto LABEL_59;
        }
        v46 = CMIOLog();
        if (v46 && os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]();
        }
LABEL_71:

LABEL_9:
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid argument"];
        return 0;
      }
    }
  }
  v14 = v9;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v31 = *p_streamIDs;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v37 = [a4 objectForKeyedSubscript:v36];
        if (v37)
        {
          v38 = +[CMIOExtensionSessionStream sessionStreamWithPropertyStates:v37 provider:a5];
          if ([a5 registerStream:v38 streamID:v36])
          {
            os_unfair_lock_lock(lock);
            [(NSMutableArray *)v14->_streams addObject:v38];
            os_unfair_lock_unlock(lock);
          }
        }
        else
        {
          v39 = CMIOLog();
          if (v39)
          {
            v40 = v39;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v41 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
              *(_DWORD *)buf = 136315906;
              v57 = v41;
              __int16 v58 = 1024;
              int v59 = 892;
              __int16 v60 = 2080;
              v61 = "-[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]";
              __int16 v62 = 2114;
              uint64_t v63 = v36;
              _os_log_error_impl(&dword_2432B6000, v40, OS_LOG_TYPE_ERROR, "%s:%d:%s missing stream properties for %{public}@", buf, 0x26u);
            }
          }
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v33);
  }
LABEL_59:
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v42 = CMIOLog();
    if (v42)
    {
      v43 = v42;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v44 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        *(_DWORD *)buf = 136315906;
        v57 = v44;
        __int16 v58 = 1024;
        int v59 = 908;
        __int16 v60 = 2080;
        v61 = "-[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]";
        __int16 v62 = 2112;
        uint64_t v63 = (uint64_t)v14;
        _os_log_impl(&dword_2432B6000, v43, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  return v14;
}

uint64_t __76__CMIOExtensionSessionDevice_initWithPropertyStates_streamsStates_provider___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v8 = 1024;
        int v9 = 915;
        __int16 v10 = 2080;
        v11 = "-[CMIOExtensionSessionDevice dealloc]";
        __int16 v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionSessionDevice;
  [(CMIOExtensionSessionDevice *)&v5 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (void)updatePropertyStates:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    objc_super v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        __int16 v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v13 = 1024;
        int v14 = 938;
        __int16 v15 = 2080;
        int v16 = "-[CMIOExtensionSessionDevice updatePropertyStates:]";
        __int16 v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  if ([a3 count])
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_propertyStates addEntriesFromDictionary:a3];
    os_unfair_lock_unlock(&self->_lock);
    v7 = (void *)[a3 objectForKeyedSubscript:0x26F89C4D0];
    if (v7)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "value"), "BOOLValue");
      [(CMIOExtensionSessionDevice *)self setRunningSomewhere:v8];
      [objc_loadWeak((id *)&self->_delegate) device:self runningSomewhereChanged:v8];
    }
    int v9 = (void *)[a3 objectForKeyedSubscript:0x26F89C510];
    if (v9)
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "value"), "intValue");
      [(CMIOExtensionSessionDevice *)self setDeviceControlPID:v10];
      [objc_loadWeak((id *)&self->_delegate) device:self deviceControlPIDChanged:v10];
    }
    [objc_loadWeak((id *)&self->_delegate) device:self propertiesChanged:a3];
  }
}

- (void)updateStreamIDs:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    objc_super v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v44 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v45 = 1024;
        int v46 = 971;
        __int16 v47 = 2080;
        v48 = "-[CMIOExtensionSessionDevice updateStreamIDs:]";
        __int16 v49 = 2112;
        long long v50 = self;
        __int16 v51 = 2112;
        id v52 = a3;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, streamIDs %@", buf, 0x30u);
      }
    }
  }
  if (a3)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:a3];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:self->_streamIDs];
    streamIDs = self->_streamIDs;
    self->_streamIDs = (NSArray *)a3;

    v30 = v8;
    uint64_t v10 = (void *)[v8 mutableCopy];
    id v31 = v7;
    [v10 minusSet:v7];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    long long v37 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = [objc_loadWeak((id *)&self->_provider) unregisterStreamID:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          if (v16)
          {
            __int16 v17 = (void *)v16;
            os_unfair_lock_lock(&self->_lock);
            [(NSMutableArray *)self->_streams removeObject:v17];
            os_unfair_lock_unlock(&self->_lock);
            v18 = (void *)[v17 delegate];
            char v13 = 1;
            [v17 setInvalidated:1];
            [v18 streamHasBeenInvalidated:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v12);
      if (v13)
      {
        os_unfair_lock_lock(&self->_lock);
        uint64_t v19 = (void *)[(NSMutableArray *)self->_streams copy];
        os_unfair_lock_unlock(&self->_lock);
        [objc_loadWeak((id *)&self->_delegate) device:self availableStreamsChanged:v19];
      }
    }
    char v20 = objc_msgSend(v7, "mutableCopy", v10);
    [v20 minusSet:v30];
    id Weak = objc_loadWeak((id *)&self->_provider);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          v27 = (void *)[Weak hostContext];
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __46__CMIOExtensionSessionDevice_updateStreamIDs___block_invoke;
          v32[3] = &unk_26517C720;
          v32[4] = Weak;
          v32[5] = v26;
          v32[6] = self;
          [v27 streamPropertyStatesWithStreamID:v26 properties:0 reply:v32];
        }
        uint64_t v23 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v23);
    }
  }
  else
  {
    uint64_t v28 = CMIOLog();
    if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionSessionDevice updateStreamIDs:]();
    }
  }
}

void __46__CMIOExtensionSessionDevice_updateStreamIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v3 = CMIOLog();
    if (v3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __46__CMIOExtensionSessionDevice_updateStreamIDs___block_invoke_cold_1();
      }
    }
  }
  else
  {
    objc_super v5 = +[CMIOExtensionSessionStream sessionStreamWithPropertyStates:a2 provider:*(void *)(a1 + 32)];
    if ([*(id *)(a1 + 32) registerStream:v5 streamID:*(void *)(a1 + 40)])
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 8));
      [*(id *)(*(void *)(a1 + 48) + 40) addObject:v5];
      id v6 = (id)[*(id *)(*(void *)(a1 + 48) + 40) copy];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 8));
      if (v6)
      {
        [objc_loadWeak((id *)(*(void *)(a1 + 48) + 16)) device:*(void *)(a1 + 48) availableStreamsChanged:v6];
      }
    }
  }
}

- (void)unregister
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(CMIOExtensionSessionDevice *)self streams];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    p_provider = &self->_provider;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(objc_loadWeak((id *)p_provider), "unregisterStreamID:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "streamID"), "UUIDString"));
      }
      while (v5 != v8);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (CMIOExtensionSessionDeviceDelegate)delegate
{
  return (CMIOExtensionSessionDeviceDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)streams
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_streams copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (NSSet)availableProperties
{
  v2 = self->_availableProperties;

  return v2;
}

- (id)cachedPropertyStateForProperty:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (id)[(NSMutableDictionary *)self->_propertyStates objectForKey:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)cachedPropertyStatesForProperties:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v5 = CMIOLog();
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v24 = 1024;
        int v25 = 1109;
        __int16 v26 = 2080;
        v27 = "-[CMIOExtensionSessionDevice cachedPropertyStatesForProperties:]";
        __int16 v28 = 2112;
        v29 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (a3)
  {
    v7 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          os_unfair_lock_lock(&self->_lock);
          id v13 = (id)[(NSMutableDictionary *)self->_propertyStates objectForKey:v12];
          os_unfair_lock_unlock(&self->_lock);
          if (v13) {
            [v7 setObject:v13 forKey:v12];
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    uint64_t v14 = (void *)[NSDictionary dictionaryWithDictionary:v7];
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v14 = (void *)[NSDictionary dictionaryWithDictionary:self->_propertyStates];
    os_unfair_lock_unlock(p_lock);
  }
  return v14;
}

- (void)propertyStatesForProperties:(id)availableProperties reply:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        long long v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v18 = 1024;
        int v19 = 1141;
        __int16 v20 = 2080;
        char v21 = "-[CMIOExtensionSessionDevice propertyStatesForProperties:reply:]";
        __int16 v22 = 2112;
        uint64_t v23 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  uint64_t v9 = [objc_loadWeak((id *)&self->_provider) hostContext];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    if (!availableProperties) {
      availableProperties = self->_availableProperties;
    }
    long long v11 = [(NSUUID *)self->_deviceID UUIDString];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__CMIOExtensionSessionDevice_propertyStatesForProperties_reply___block_invoke;
    v13[3] = &unk_26517C638;
    v13[4] = self;
    v13[5] = a4;
    [v10 devicePropertyStatesWithDeviceID:v11 properties:availableProperties reply:v13];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263F08410];
    uint64_t v14 = *MEMORY[0x263F08320];
    __int16 v15 = @"Invalid session";
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

uint64_t __64__CMIOExtensionSessionDevice_propertyStatesForProperties_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(*(void *)(a1 + 32) + 24) addEntriesFromDictionary:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)setPropertyValues:(id)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        long long v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v18 = 1024;
        int v19 = 1163;
        __int16 v20 = 2080;
        char v21 = "-[CMIOExtensionSessionDevice setPropertyValues:reply:]";
        __int16 v22 = 2112;
        uint64_t v23 = self;
        __int16 v24 = 2112;
        id v25 = a3;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyValues %@", buf, 0x30u);
      }
    }
  }
  uint64_t v9 = [objc_loadWeak((id *)&self->_provider) hostContext];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    long long v11 = [(NSUUID *)self->_deviceID UUIDString];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__CMIOExtensionSessionDevice_setPropertyValues_reply___block_invoke;
    v13[3] = &unk_26517C660;
    v13[4] = a4;
    [v10 setDevicePropertyValuesWithDeviceID:v11 propertyValues:a3 reply:v13];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263F08410];
    uint64_t v14 = *MEMORY[0x263F08320];
    __int16 v15 = @"Invalid session";
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

uint64_t __54__CMIOExtensionSessionDevice_setPropertyValues_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDeviceControlPID:(int)a3 reply:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316163;
        __int16 v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v19 = 1024;
        int v20 = 1177;
        __int16 v21 = 2080;
        __int16 v22 = "-[CMIOExtensionSessionDevice setDeviceControlPID:reply:]";
        __int16 v23 = 2112;
        __int16 v24 = self;
        __int16 v25 = 1025;
        int v26 = v5;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %{private}d", buf, 0x2Cu);
      }
    }
  }
  uint64_t v9 = [objc_loadWeak((id *)&self->_provider) hostContext];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v5), 0x26F89C510);
    uint64_t v12 = [(NSUUID *)self->_deviceID UUIDString];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__CMIOExtensionSessionDevice_setDeviceControlPID_reply___block_invoke;
    v14[3] = &unk_26517C660;
    v14[4] = a4;
    [v10 setDevicePropertyValuesWithDeviceID:v12 propertyValues:v11 reply:v14];
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v15 = *MEMORY[0x263F08320];
    uint64_t v16 = @"Invalid session";
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v13, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
  }
}

uint64_t __56__CMIOExtensionSessionDevice_setDeviceControlPID_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = CMIOLog();
    if (v3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __56__CMIOExtensionSessionDevice_setDeviceControlPID_reply___block_invoke_cold_1();
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)completeTransaction
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid session", v2, v3, v4, v5, v6);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (NSString)legacyDeviceID
{
  return self->_legacyDeviceID;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isRunningSomewhere
{
  return self->_runningSomewhere;
}

- (void)setRunningSomewhere:(BOOL)a3
{
  self->_runningSomewhere = a3;
}

- (int)deviceControlPID
{
  return self->_deviceControlPID;
}

- (void)setDeviceControlPID:(int)a3
{
  self->_deviceControlPID = a3;
}

- (CMIOExtensionSessionProvider)provider
{
  return (CMIOExtensionSessionProvider *)objc_loadWeak((id *)&self->_provider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithPropertyStates:streamsStates:provider:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s dual stream expecting 2 streams with different center stage", v2, v3, v4, v5, v6);
}

- (void)initWithPropertyStates:streamsStates:provider:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s dual stream expecting 2 streams %@", v2, v3, v4, v5, 2u);
}

- (void)updateStreamIDs:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s nil streamIDs", v2, v3, v4, v5, v6);
}

void __46__CMIOExtensionSessionDevice_updateStreamIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s error %{public}@", v2, v3, v4, v5, v6);
}

void __56__CMIOExtensionSessionDevice_setDeviceControlPID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s setting deviceControlPID error %{public}@", v2, v3, v4, v5, v6);
}

@end