@interface CMIOExtensionSessionProvider
+ (CMIOExtensionSessionProvider)sessionProviderWithEndpoint:(id)a3 delegate:(id)a4;
- (BOOL)isInvalidated;
- (BOOL)registerStream:(id)a3 streamID:(id)a4;
- (CMIOExtensionProviderHostContext)hostContext;
- (CMIOExtensionSessionProvider)initWithEndpoint:(id)a3 delegate:(id)a4;
- (CMIOExtensionSessionProviderDelegate)delegate;
- (NSArray)devices;
- (NSSet)availableProperties;
- (NSString)bundleID;
- (NSString)description;
- (id)cachedPropertyStateForProperty:(id)a3;
- (id)cachedPropertyStatesForProperties:(id)a3;
- (id)unregisterStreamID:(id)a3;
- (void)completeTransaction;
- (void)dealloc;
- (void)extension:(id)a3 availableDevicesChanged:(id)a4;
- (void)extension:(id)a3 availableStreamsChangedWithDeviceID:(id)a4 streamIDs:(id)a5;
- (void)extension:(id)a3 devicePropertiesChangedWithDeviceID:(id)a4 propertyStates:(id)a5;
- (void)extension:(id)a3 didFailWithError:(id)a4;
- (void)extension:(id)a3 pluginPropertiesChanged:(id)a4;
- (void)extension:(id)a3 pullSampleWithStreamID:(id)a4 reply:(id)a5;
- (void)extension:(id)a3 receivedSampleWithStreamID:(id)a4 sample:(id)a5;
- (void)extension:(id)a3 streamPropertiesChangedWithStreamID:(id)a4 propertyStates:(id)a5;
- (void)extension:(id)a3 streamScheduledOutputChangedWithStreamID:(id)a4 scheduledOutput:(id)a5;
- (void)extensionHasBeenInvalidated:(id)a3;
- (void)propertyStatesForProperties:(id)availableProperties reply:(id)a4;
- (void)refreshExtensionConnection;
- (void)setBundleID:(id)a3;
- (void)setPropertyValues:(id)a3 reply:(id)a4;
@end

@implementation CMIOExtensionSessionProvider

+ (CMIOExtensionSessionProvider)sessionProviderWithEndpoint:(id)a3 delegate:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEndpoint:a3 delegate:a4];

  return (CMIOExtensionSessionProvider *)v4;
}

- (CMIOExtensionSessionProvider)initWithEndpoint:(id)a3 delegate:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!a3 || MEMORY[0x245679950](a3, a2) != MEMORY[0x263EF8718])
  {

    v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    v9 = @"Invalid argument - endpoint";
LABEL_4:
    [v7 raise:v8 format:v9];
    return 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)CMIOExtensionSessionProvider;
  v12 = [(CMIOExtensionSessionProvider *)&v20 init];
  v10 = v12;
  if (!v12) {
    return v10;
  }
  v12->_lock._os_unfair_lock_opaque = 0;
  xpc_connection_t v13 = xpc_connection_create_from_endpoint((xpc_endpoint_t)a3);
  if (!v13)
  {

    v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    v9 = @"Invalid connection";
    goto LABEL_4;
  }
  xpc_connection_t v14 = v13;
  v10->_hostContext = [[CMIOExtensionProviderHostContext alloc] initWithConnection:v13 delegate:v10];
  xpc_release(v14);
  objc_storeWeak((id *)&v10->_delegate, a4);
  v10->_deviceIDs = (NSArray *)objc_opt_new();
  v10->_devicesMap = (NSMutableDictionary *)objc_opt_new();
  v10->_streamsMap = (NSMutableDictionary *)objc_opt_new();
  v10->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionSessionProvider> provider bundleID %@ endpoint %p", (id)objc_msgSend(a4, "copyProviderBundleID"), a3];
  hostContext = v10->_hostContext;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke;
  v19[3] = &unk_26517C748;
  v19[4] = v10;
  [(CMIOExtensionProviderHostContext *)hostContext pluginStates:v19];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v16 = CMIOLog();
    if (v16)
    {
      v17 = v16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        *(_DWORD *)buf = 136315906;
        v22 = v18;
        __int16 v23 = 1024;
        int v24 = 1312;
        __int16 v25 = 2080;
        v26 = "-[CMIOExtensionSessionProvider initWithEndpoint:delegate:]";
        __int16 v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_2432B6000, v17, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  return v10;
}

void __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (a5)
  {
    v6 = CMIOLog();
    if (v6)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke_cold_1();
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  }
  else
  {
    id v10 = +[CMIOExtensionProvider internalProperties];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke_2;
    v45[3] = &unk_26517C610;
    v45[4] = v10;
    *(void *)(*(void *)(a1 + 32) + 40) = (id)[a2 keysOfEntriesPassingTest:v45];
    v39 = a2;
    v11 = (void *)[a2 objectForKeyedSubscript:0x26F89C430];
    v12 = *(void **)(*(void *)(a1 + 32) + 48);
    *(void *)(*(void *)(a1 + 32) + 48) = (id)[v11 value];

    id v13 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    xpc_connection_t v14 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      uint64_t v40 = a1;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(CMIOExtensionSessionDevice **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v20 = [a3 objectForKeyedSubscript:v19];
          if (v20)
          {
            v21 = [[CMIOExtensionSessionDevice alloc] initWithPropertyStates:v20 streamsStates:a4 provider:*(void *)(a1 + 32)];
            os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
            uint64_t v22 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectForKey:", -[NSUUID UUIDString](-[CMIOExtensionSessionDevice deviceID](v21, "deviceID"), "UUIDString"));
            if (!v22)
            {
              uint64_t v23 = *(void *)(a1 + 32);
              uint64_t v24 = v16;
              id v25 = v13;
              uint64_t v26 = v17;
              __int16 v27 = a3;
              v28 = v14;
              uint64_t v29 = a4;
              v30 = *(void **)(v23 + 56);
              uint64_t v31 = [(NSUUID *)[(CMIOExtensionSessionDevice *)v21 deviceID] UUIDString];
              v32 = v30;
              a4 = v29;
              xpc_connection_t v14 = v28;
              a3 = v27;
              uint64_t v17 = v26;
              id v13 = v25;
              uint64_t v16 = v24;
              a1 = v40;
              [v32 setObject:v21 forKey:v31];
            }

            id v13 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "allValues"), "copy");
            os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
            if (v22)
            {
              v33 = CMIOLog();
              if (v33)
              {
                v34 = v33;
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  v37 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
                  *(_DWORD *)buf = 136315906;
                  v47 = v37;
                  __int16 v48 = 1024;
                  int v49 = 1289;
                  __int16 v50 = 2080;
                  v51 = "-[CMIOExtensionSessionProvider initWithEndpoint:delegate:]_block_invoke";
                  __int16 v52 = 2114;
                  v53 = v21;
                  _os_log_error_impl(&dword_2432B6000, v34, OS_LOG_TYPE_ERROR, "%s:%d:%s Mapping error for %{public}@", buf, 0x26u);
                }
              }
            }
          }
          else
          {
            v35 = CMIOLog();
            if (v35)
            {
              v36 = v35;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                v38 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
                *(_DWORD *)buf = 136315906;
                v47 = v38;
                __int16 v48 = 1024;
                int v49 = 1271;
                __int16 v50 = 2080;
                v51 = "-[CMIOExtensionSessionProvider initWithEndpoint:delegate:]_block_invoke";
                __int16 v52 = 2114;
                v53 = v19;
                _os_log_error_impl(&dword_2432B6000, v36, OS_LOG_TYPE_ERROR, "%s:%d:%s missing device properties for %{public}@", buf, 0x26u);
              }
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v16);
    }
    *(void *)(*(void *)(a1 + 32) + 32) = [v39 mutableCopy];
    [objc_loadWeak((id *)(*(void *)(a1 + 32) + 16)) provider:*(void *)(a1 + 32) initializeDevices:v13 properties:*(void *)(*(void *)(a1 + 32) + 32)];
    if (v13)
    {
      [objc_loadWeak((id *)(*(void *)(a1 + 32) + 16)) provider:*(void *)(a1 + 32) availableDevicesChanged:v13];
    }
  }
}

uint64_t __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
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
        int v9 = 1319;
        __int16 v10 = 2080;
        v11 = "-[CMIOExtensionSessionProvider dealloc]";
        __int16 v12 = 2112;
        id v13 = self;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionSessionProvider;
  [(CMIOExtensionSessionProvider *)&v5 dealloc];
}

- (NSString)description
{
  v2 = self->_description;

  return v2;
}

- (NSString)bundleID
{
  v2 = self->_bundleID;

  return v2;
}

- (void)setBundleID:(id)a3
{
  bundleID = self->_bundleID;
  self->_bundleID = (NSString *)a3;
}

- (CMIOExtensionSessionProviderDelegate)delegate
{
  return (CMIOExtensionSessionProviderDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)refreshExtensionConnection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
      __int16 v7 = 1024;
      int v8 = 1360;
      __int16 v9 = 2080;
      __int16 v10 = "-[CMIOExtensionSessionProvider refreshExtensionConnection]";
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [(CMIOExtensionProviderHostContext *)self->_hostContext refreshExtensionConnection];
  self->_invalidated = 0;
}

- (NSArray)devices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (NSArray *)[(NSMutableDictionary *)self->_devicesMap allValues];
  os_unfair_lock_unlock(p_lock);
  return v4;
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
    int v5 = CMIOLog();
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v24 = 1024;
        int v25 = 1395;
        __int16 v26 = 2080;
        __int16 v27 = "-[CMIOExtensionSessionProvider cachedPropertyStatesForProperties:]";
        __int16 v28 = 2112;
        uint64_t v29 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (a3)
  {
    __int16 v7 = objc_opt_new();
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
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    __int16 v7 = CMIOLog();
    if (v7)
    {
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v13 = 1024;
        int v14 = 1427;
        __int16 v15 = 2080;
        uint64_t v16 = "-[CMIOExtensionSessionProvider propertyStatesForProperties:reply:]";
        __int16 v17 = 2112;
        long long v18 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (!availableProperties) {
    availableProperties = self->_availableProperties;
  }
  hostContext = self->_hostContext;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__CMIOExtensionSessionProvider_propertyStatesForProperties_reply___block_invoke;
  v10[3] = &unk_26517C638;
  v10[4] = self;
  v10[5] = a4;
  [(CMIOExtensionProviderHostContext *)hostContext pluginPropertyStatesForProperties:availableProperties reply:v10];
}

uint64_t __66__CMIOExtensionSessionProvider_propertyStatesForProperties_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(*(void *)(a1 + 32) + 32) addEntriesFromDictionary:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)setPropertyValues:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    __int16 v7 = CMIOLog();
    if (v7)
    {
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v13 = 1024;
        int v14 = 1444;
        __int16 v15 = 2080;
        uint64_t v16 = "-[CMIOExtensionSessionProvider setPropertyValues:reply:]";
        __int16 v17 = 2112;
        long long v18 = self;
        __int16 v19 = 2112;
        id v20 = a3;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyValues %@", buf, 0x30u);
      }
    }
  }
  hostContext = self->_hostContext;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__CMIOExtensionSessionProvider_setPropertyValues_reply___block_invoke;
  v10[3] = &unk_26517C660;
  v10[4] = a4;
  [(CMIOExtensionProviderHostContext *)hostContext setPluginPropertyValues:a3 reply:v10];
}

uint64_t __56__CMIOExtensionSessionProvider_setPropertyValues_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)completeTransaction
{
}

- (BOOL)registerStream:(id)a3 streamID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    __int16 v7 = CMIOLog();
    if (v7)
    {
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316162;
        __int16 v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v14 = 1024;
        int v15 = 1458;
        __int16 v16 = 2080;
        __int16 v17 = "-[CMIOExtensionSessionProvider registerStream:streamID:]";
        __int16 v18 = 2112;
        __int16 v19 = self;
        __int16 v20 = 2112;
        id v21 = a3;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, stream %@", (uint8_t *)&v12, 0x30u);
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSMutableDictionary *)self->_streamsMap objectForKey:a4];
  if (v9)
  {
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionSessionProvider registerStream:streamID:]();
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_streamsMap setObject:a3 forKey:a4];
    os_unfair_lock_unlock(&self->_lock);
  }
  return v9 == 0;
}

- (id)unregisterStreamID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    int v5 = CMIOLog();
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136316162;
        uint64_t v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v11 = 1024;
        int v12 = 1477;
        __int16 v13 = 2080;
        __int16 v14 = "-[CMIOExtensionSessionProvider unregisterStreamID:]";
        __int16 v15 = 2112;
        __int16 v16 = self;
        __int16 v17 = 2112;
        id v18 = a3;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, stream %@", (uint8_t *)&v9, 0x30u);
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  id v7 = (id)[(NSMutableDictionary *)self->_streamsMap objectForKey:a3];
  [(NSMutableDictionary *)self->_streamsMap removeObjectForKey:a3];
  os_unfair_lock_unlock(&self->_lock);
  return v7;
}

- (void)extension:(id)a3 didFailWithError:(id)a4
{
  id v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionSessionProvider extension:didFailWithError:]();
  }
  [objc_loadWeak((id *)&self->_delegate) provider:self didFailWithError:a4];
}

- (void)extensionHasBeenInvalidated:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v4 = CMIOLog();
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315906;
        id v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v8 = 1024;
        int v9 = 1498;
        __int16 v10 = 2080;
        __int16 v11 = "-[CMIOExtensionSessionProvider extensionHasBeenInvalidated:]";
        __int16 v12 = 2112;
        __int16 v13 = self;
        _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v6, 0x26u);
      }
    }
  }
  self->_invalidated = 1;
  [objc_loadWeak((id *)&self->_delegate) providerHasBeenInvalidated:self];
}

- (void)extension:(id)a3 pluginPropertiesChanged:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    int v6 = CMIOLog();
    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        __int16 v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v11 = 1024;
        int v12 = 1506;
        __int16 v13 = 2080;
        uint64_t v14 = "-[CMIOExtensionSessionProvider extension:pluginPropertiesChanged:]";
        __int16 v15 = 2112;
        __int16 v16 = self;
        _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v9, 0x26u);
      }
    }
  }
  if ([a4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_propertyStates addEntriesFromDictionary:a4];
    os_unfair_lock_unlock(&self->_lock);
    [objc_loadWeak((id *)&self->_delegate) provider:self propertiesChanged:a4];
  }
  else
  {
    __int16 v8 = CMIOLog();
    if (v8)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionSessionProvider extension:pluginPropertiesChanged:]();
      }
    }
  }
}

- (void)extension:(id)a3 availableDevicesChanged:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    int v6 = CMIOLog();
    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        long long v42 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v43 = 1024;
        int v44 = 1525;
        __int16 v45 = 2080;
        v46 = "-[CMIOExtensionSessionProvider extension:availableDevicesChanged:]";
        __int16 v47 = 2112;
        __int16 v48 = self;
        _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (a4)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:a4];
    int v9 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:self->_deviceIDs];
    deviceIDs = self->_deviceIDs;
    self->_deviceIDs = (NSArray *)a4;

    __int16 v11 = (void *)[v9 mutableCopy];
    uint64_t v29 = (void *)v8;
    [v11 minusSet:v8];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      char v14 = 0;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          os_unfair_lock_lock(&self->_lock);
          id v18 = (id)[(NSMutableDictionary *)self->_devicesMap objectForKey:v17];
          [(NSMutableDictionary *)self->_devicesMap removeObjectForKey:v17];
          os_unfair_lock_unlock(&self->_lock);
          if (v18)
          {
            [v18 unregister];
            uint64_t v19 = (void *)[v18 delegate];
            char v14 = 1;
            [v18 setInvalidated:1];
            [v19 deviceHasBeenInvalidated:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v13);
      if (v14)
      {
        os_unfair_lock_lock(&self->_lock);
        uint64_t v20 = [(NSMutableDictionary *)self->_devicesMap allValues];
        os_unfair_lock_unlock(&self->_lock);
        [objc_loadWeak((id *)&self->_delegate) provider:self availableDevicesChanged:v20];
      }
    }
    id v21 = (void *)[v29 mutableCopy];
    [v21 minusSet:v9];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          hostContext = self->_hostContext;
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke;
          v30[3] = &unk_26517C770;
          v30[4] = self;
          [(CMIOExtensionProviderHostContext *)hostContext deviceStatesWithDeviceID:v26 reply:v30];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v23);
    }
  }
  else
  {
    __int16 v28 = CMIOLog();
    if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionSessionProvider extension:availableDevicesChanged:]();
    }
  }
}

void __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    v4 = CMIOLog();
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke_cold_2();
      }
    }
  }
  else
  {
    int v6 = [[CMIOExtensionSessionDevice alloc] initWithPropertyStates:a2 streamsStates:a3 provider:*(void *)(a1 + 32)];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectForKey:", -[NSUUID UUIDString](-[CMIOExtensionSessionDevice deviceID](v6, "deviceID"), "UUIDString"));
    uint64_t v8 = *(void *)(a1 + 32);
    if (v7)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 8));
      int v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke_cold_1();
      }
    }
    else
    {
      objc_msgSend(*(id *)(v8 + 56), "setObject:forKey:", v6, -[NSUUID UUIDString](-[CMIOExtensionSessionDevice deviceID](v6, "deviceID"), "UUIDString"));
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
      [objc_loadWeak((id *)(*(void *)(a1 + 32) + 16)) provider:*(void *)(a1 + 32) availableDevicesChanged:v10];
    }
  }
}

- (void)extension:(id)a3 devicePropertiesChangedWithDeviceID:(id)a4 propertyStates:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v13 = 1024;
        int v14 = 1619;
        __int16 v15 = 2080;
        __int16 v16 = "-[CMIOExtensionSessionProvider extension:devicePropertiesChangedWithDeviceID:propertyStates:]";
        __int16 v17 = 2112;
        id v18 = self;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  id v10 = (id)[(NSMutableDictionary *)self->_devicesMap objectForKey:a4];
  os_unfair_lock_unlock(&self->_lock);
  if (v10) {
    [v10 updatePropertyStates:a5];
  }
}

- (void)extension:(id)a3 availableStreamsChangedWithDeviceID:(id)a4 streamIDs:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v13 = 1024;
        int v14 = 1635;
        __int16 v15 = 2080;
        __int16 v16 = "-[CMIOExtensionSessionProvider extension:availableStreamsChangedWithDeviceID:streamIDs:]";
        __int16 v17 = 2112;
        id v18 = self;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  id v10 = (id)[(NSMutableDictionary *)self->_devicesMap objectForKey:a4];
  os_unfair_lock_unlock(&self->_lock);
  if (v10) {
    [v10 updateStreamIDs:a5];
  }
}

- (void)extension:(id)a3 streamPropertiesChangedWithStreamID:(id)a4 propertyStates:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        __int16 v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v14 = 1024;
        int v15 = 1651;
        __int16 v16 = 2080;
        __int16 v17 = "-[CMIOExtensionSessionProvider extension:streamPropertiesChangedWithStreamID:propertyStates:]";
        __int16 v18 = 2112;
        uint64_t v19 = self;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v12, 0x26u);
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v11 = (id)[(NSMutableDictionary *)self->_streamsMap objectForKey:a4];
  os_unfair_lock_unlock(p_lock);
  if (v11) {
    [v11 updatePropertyStates:a5 streamID:a4];
  }
}

- (void)extension:(id)a3 receivedSampleWithStreamID:(id)a4 sample:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        __int16 v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v14 = 1024;
        int v15 = 1667;
        __int16 v16 = 2080;
        __int16 v17 = "-[CMIOExtensionSessionProvider extension:receivedSampleWithStreamID:sample:]";
        __int16 v18 = 2112;
        uint64_t v19 = self;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v12, 0x26u);
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v11 = (id)[(NSMutableDictionary *)self->_streamsMap objectForKey:a4];
  os_unfair_lock_unlock(p_lock);
  if (v11) {
    [v11 receivedSample:a5 streamID:a4];
  }
}

- (void)extension:(id)a3 pullSampleWithStreamID:(id)a4 reply:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v18 = 1024;
        int v19 = 1683;
        __int16 v20 = 2080;
        id v21 = "-[CMIOExtensionSessionProvider extension:pullSampleWithStreamID:reply:]";
        __int16 v22 = 2112;
        uint64_t v23 = self;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v11 = (id)[(NSMutableDictionary *)self->_streamsMap objectForKey:a4];
  os_unfair_lock_unlock(p_lock);
  if (v11)
  {
    *(void *)buf = 0;
    unsigned __int8 v14 = 0;
    int v12 = (void *)[v11 copySample:&v14 streamID:a4 error:buf];
    (*((void (**)(id, void *, void, void))a5 + 2))(a5, v12, v14, *(void *)buf);
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v15 = *MEMORY[0x263F08320];
    __int16 v16 = @"Invalid stream";
    (*((void (**)(id, void, void, uint64_t))a5 + 2))(a5, 0, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v13, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
  }
}

- (void)extension:(id)a3 streamScheduledOutputChangedWithStreamID:(id)a4 scheduledOutput:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v8 = CMIOLog();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        uint64_t v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v14 = 1024;
        int v15 = 1707;
        __int16 v16 = 2080;
        __int16 v17 = "-[CMIOExtensionSessionProvider extension:streamScheduledOutputChangedWithStreamID:scheduledOutput:]";
        __int16 v18 = 2112;
        int v19 = self;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v12, 0x26u);
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v11 = (id)[(NSMutableDictionary *)self->_streamsMap objectForKey:a4];
  os_unfair_lock_unlock(p_lock);
  if (v11) {
    [v11 receivedScheduledOutput:a5 streamID:a4];
  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (CMIOExtensionProviderHostContext)hostContext
{
  return self->_hostContext;
}

- (void).cxx_destruct
{
}

void __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s failed getting the states of the plugin error %{public}@", v2, v3, v4, v5, v6);
}

- (void)registerStream:streamID:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Mapping error for %{public}@", v2, v3, v4, v5, v6);
}

- (void)extension:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s error %{public}@", v2, v3, v4, v5, v6);
}

- (void)extension:pluginPropertiesChanged:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s empty properties", v2, v3, v4, v5, v6);
}

- (void)extension:availableDevicesChanged:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s nil deviceIDs", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Mapping error for %{public}@", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s error %{public}@", v2, v3, v4, v5, v6);
}

@end