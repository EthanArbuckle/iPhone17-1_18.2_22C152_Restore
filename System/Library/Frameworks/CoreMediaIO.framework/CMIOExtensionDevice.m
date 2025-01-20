@interface CMIOExtensionDevice
+ (CMIOExtensionDevice)deviceWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID legacyDeviceID:(NSString *)legacyDeviceID source:(id)source;
+ (CMIOExtensionDevice)deviceWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID source:(id)source;
+ (id)internalProperties;
+ (id)internalWritableProperties;
- (BOOL)addStream:(CMIOExtensionStream *)stream error:(NSError *)outError;
- (BOOL)didRegister:(id *)a3;
- (BOOL)isRegistered;
- (BOOL)isRunningSomewhere;
- (BOOL)removeStream:(CMIOExtensionStream *)stream error:(NSError *)outError;
- (CMIOExtensionDevice)initWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID legacyDeviceID:(NSString *)legacyDeviceID source:(id)source;
- (CMIOExtensionDevice)initWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID source:(id)source;
- (CMIOExtensionProvider)parent;
- (NSArray)streams;
- (NSString)legacyDeviceID;
- (NSString)localizedName;
- (NSUUID)deviceID;
- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3;
- (id)_clientQueue_setAndRemoveInternalPropertyValuesForClient:(id)a3 propertyValues:(id)a4 error:(id *)a5;
- (id)description;
- (id)source;
- (int)deviceControlPID;
- (void)dealloc;
- (void)didUnregister;
- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates;
- (void)setDeviceControlPID:(int)a3;
- (void)setIsRegistered:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setRunningSomewhere:(BOOL)a3;
@end

@implementation CMIOExtensionDevice

+ (id)internalProperties
{
  if (internalProperties_onceToken_245 != -1) {
    dispatch_once(&internalProperties_onceToken_245, &__block_literal_global_247);
  }
  return (id)internalProperties_gInternalDeviceProperties;
}

uint64_t __41__CMIOExtensionDevice_internalProperties__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", 0x26F89C450, 0x26F89C470, 0x26F89C490, 0x26F89C4B0, 0x26F89C4D0, 0x26F89C510, 0);
  internalProperties_gInternalDeviceProperties = result;
  return result;
}

+ (id)internalWritableProperties
{
  if (internalWritableProperties_onceToken != -1) {
    dispatch_once(&internalWritableProperties_onceToken, &__block_literal_global_249);
  }
  return (id)internalWritableProperties_gInternalDeviceProperties;
}

uint64_t __49__CMIOExtensionDevice_internalWritableProperties__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", 0x26F89C510, 0);
  internalWritableProperties_gInternalDeviceProperties = result;
  return result;
}

+ (CMIOExtensionDevice)deviceWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID legacyDeviceID:(NSString *)legacyDeviceID source:(id)source
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocalizedName:localizedName deviceID:deviceID legacyDeviceID:legacyDeviceID source:source];

  return (CMIOExtensionDevice *)v6;
}

+ (CMIOExtensionDevice)deviceWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID source:(id)source
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocalizedName:localizedName deviceID:deviceID source:source];

  return (CMIOExtensionDevice *)v5;
}

- (CMIOExtensionDevice)initWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID legacyDeviceID:(NSString *)legacyDeviceID source:(id)source
{
  v12.receiver = self;
  v12.super_class = (Class)CMIOExtensionDevice;
  v10 = [(CMIOExtensionDevice *)&v12 init];
  if (v10)
  {
    v10->_localizedName = (NSString *)[(NSString *)localizedName copy];
    v10->_deviceID = (NSUUID *)[(NSUUID *)deviceID copy];
    v10->_legacyDeviceID = (NSString *)[(NSString *)legacyDeviceID copy];
    objc_storeWeak((id *)&v10->_source, source);
    v10->_streamsLock._os_unfair_lock_opaque = 0;
    v10->_streams = (NSMutableArray *)objc_opt_new();
    v10->_changedPropertiesLock._os_unfair_lock_opaque = 0;
    v10->_changedProperties = (NSMutableDictionary *)objc_opt_new();
    v10->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionDevice: name %@, ID %@>", v10->_localizedName, v10->_deviceID];
  }
  return v10;
}

- (CMIOExtensionDevice)initWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID source:(id)source
{
  uint64_t v9 = cmio_VDCAssistantDeviceUIDForUSBAssistantNSUUID(deviceID);

  return [(CMIOExtensionDevice *)self initWithLocalizedName:localizedName deviceID:deviceID legacyDeviceID:v9 source:source];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionDevice;
  [(CMIOExtensionDevice *)&v3 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  unint64_t v6 = 0x263F08000;
  if (a3)
  {
    if ([a3 containsObject:0x26F89C450])
    {
      v7 = [[CMIOExtensionPropertyState alloc] initWithValue:self->_localizedName attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
      [v5 setObject:v7 forKey:0x26F89C450];
    }
    if (([a3 containsObject:0x26F89C470] & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    v8 = [[CMIOExtensionPropertyState alloc] initWithValue:self->_localizedName attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
    [v5 setObject:v8 forKey:0x26F89C450];
  }
  uint64_t v9 = [[CMIOExtensionPropertyState alloc] initWithValue:[(NSUUID *)self->_deviceID UUIDString] attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
  [v5 setObject:v9 forKey:0x26F89C470];

  if (!a3)
  {
    v11 = [[CMIOExtensionPropertyState alloc] initWithValue:self->_legacyDeviceID attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
    [v5 setObject:v11 forKey:0x26F89C490];

    goto LABEL_13;
  }
LABEL_8:
  if ([a3 containsObject:0x26F89C490])
  {
    v10 = [[CMIOExtensionPropertyState alloc] initWithValue:self->_legacyDeviceID attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];
    [v5 setObject:v10 forKey:0x26F89C490];
  }
  if ([a3 containsObject:0x26F89C4B0])
  {
LABEL_13:
    objc_super v12 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v13 = [(CMIOExtensionDevice *)self streams];
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v17++), "streamID"), "UUIDString"));
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }
    v18 = [[CMIOExtensionPropertyState alloc] initWithValue:v12 attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];

    [v5 setObject:v18 forKey:0x26F89C4B0];
    unint64_t v6 = 0x263F08000uLL;
    if (!a3) {
      goto LABEL_22;
    }
  }
  if (![a3 containsObject:0x26F89C4D0]) {
    goto LABEL_23;
  }
LABEL_22:
  v19 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", [*(id *)(v6 + 2584) numberWithBool:self->_runningSomewhere], +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
  [v5 setObject:v19 forKey:0x26F89C4D0];

  if (a3)
  {
LABEL_23:
    if (![a3 containsObject:0x26F89C510]) {
      goto LABEL_25;
    }
  }
  v20 = -[CMIOExtensionPropertyState initWithValue:]([CMIOExtensionPropertyState alloc], "initWithValue:", [*(id *)(v6 + 2584) numberWithUnsignedInt:self->_deviceControlPID]);
  [v5 setObject:v20 forKey:0x26F89C510];

LABEL_25:
  if ([v5 count]) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)_clientQueue_setAndRemoveInternalPropertyValuesForClient:(id)a3 propertyValues:(id)a4 error:(id *)a5
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  id v8 = +[CMIOExtensionDevice internalWritableProperties];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __101__CMIOExtensionDevice__clientQueue_setAndRemoveInternalPropertyValuesForClient_propertyValues_error___block_invoke;
  v16[3] = &unk_26517BF00;
  v16[4] = v8;
  v16[5] = &v17;
  [a4 enumerateKeysAndObjectsUsingBlock:v16];
  if (*((unsigned char *)v18 + 24))
  {
    id v9 = a4;
  }
  else
  {
    id v9 = (id)[a4 mutableCopy];
    v10 = objc_opt_new();
    v11 = (void *)[a4 objectForKey:0x26F89C510];
    objc_super v12 = v11;
    if (v11)
    {
      if ((int)[v11 intValue] < 1) {
        int v13 = -1;
      }
      else {
        int v13 = [a3 pid];
      }
      self->_deviceControlPID = v13;
      [v9 removeObjectForKey:0x26F89C510];
      uint64_t v14 = [[CMIOExtensionPropertyState alloc] initWithValue:v12];
      [v10 setObject:v14 forKey:0x26F89C510];
    }
    [(CMIOExtensionDevice *)self notifyPropertiesChanged:v10];
  }
  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __101__CMIOExtensionDevice__clientQueue_setAndRemoveInternalPropertyValuesForClient_propertyValues_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)didRegister:(id *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  p_streamsLock = &self->_streamsLock;
  os_unfair_lock_lock(&self->_streamsLock);
  unint64_t v6 = (void *)[(NSMutableArray *)self->_streams copy];
  os_unfair_lock_unlock(p_streamsLock);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * v11);
      v32 = 0;
      if ((objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "registerStream:withDeviceID:error:", v12, self->_deviceID, &v32) & 1) == 0)break; {
      [v7 addObject:v12];
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v18 = CMIOLog();
    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice didRegister:]();
      if (!a3) {
        goto LABEL_21;
      }
    }
    else if (!a3)
    {
LABEL_21:
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v19 = [v7 countByEnumeratingWithState:&v24 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "unregisterStream:withDeviceID:notify:error:", *(void *)(*((void *)&v24 + 1) + 8 * i), self->_deviceID, 0, 0);
          }
          uint64_t v20 = [v7 countByEnumeratingWithState:&v24 objects:v37 count:16];
        }
        while (v20);
      }
      BOOL v13 = 0;
      goto LABEL_29;
    }
    *a3 = v32;
    goto LABEL_21;
  }
LABEL_9:
  BOOL v13 = 1;
  self->_isRegistered = 1;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v14 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * j) setParent:self];
      }
      uint64_t v15 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v15);
    BOOL v13 = 1;
  }
LABEL_29:

  return v13;
}

- (void)didUnregister
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  p_streamsLock = &self->_streamsLock;
  os_unfair_lock_lock(&self->_streamsLock);
  v4 = (void *)[(NSMutableArray *)self->_streams copy];
  os_unfair_lock_unlock(p_streamsLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 136315906;
    long long v14 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v15 = 0;
        if ((objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider", v14), "unregisterStream:withDeviceID:notify:error:", v10, self->_deviceID, 0, &v15) & 1) == 0)
        {
          uint64_t v11 = CMIOLog();
          if (v11)
          {
            uint64_t v12 = v11;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              BOOL v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              *(_DWORD *)buf = v14;
              uint64_t v21 = v13;
              __int16 v22 = 1024;
              int v23 = 1532;
              __int16 v24 = 2080;
              long long v25 = "-[CMIOExtensionDevice didUnregister]";
              __int16 v26 = 2114;
              uint64_t v27 = v15;
              _os_log_error_impl(&dword_2432B6000, v12, OS_LOG_TYPE_ERROR, "%s:%d:%s unregisterStream error %{public}@", buf, 0x26u);
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v28 count:16];
    }
    while (v7);
  }

  self->_isRegistered = 0;
}

- (NSArray)streams
{
  p_streamsLock = &self->_streamsLock;
  os_unfair_lock_lock(&self->_streamsLock);
  v4 = (void *)[(NSMutableArray *)self->_streams copy];
  os_unfair_lock_unlock(p_streamsLock);

  return (NSArray *)v4;
}

- (BOOL)addStream:(CMIOExtensionStream *)stream error:(NSError *)outError
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v26 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v27 = 1024;
      int v28 = 1553;
      __int16 v29 = 2080;
      long long v30 = "-[CMIOExtensionDevice addStream:error:]";
      __int16 v31 = 2112;
      v32 = self;
      __int16 v33 = 2112;
      long long v34 = stream;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  if (!stream || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice addStream:error:]();
      if (!outError) {
        return 0;
      }
    }
    else if (!outError)
    {
      return 0;
    }
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08410];
    uint64_t v23 = *MEMORY[0x263F08320];
    __int16 v24 = @"Invalid stream";
    uint64_t v12 = NSDictionary;
    BOOL v13 = &v24;
    long long v14 = &v23;
    goto LABEL_15;
  }
  os_unfair_lock_lock(&self->_streamsLock);
  if ([(NSMutableArray *)self->_streams containsObject:stream])
  {
    os_unfair_lock_unlock(&self->_streamsLock);
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice addStream:error:]();
      if (outError) {
        goto LABEL_10;
      }
    }
    else if (outError)
    {
LABEL_10:
      uint64_t v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F08410];
      uint64_t v21 = *MEMORY[0x263F08320];
      __int16 v22 = @"Stream already included";
      uint64_t v12 = NSDictionary;
      BOOL v13 = &v22;
      long long v14 = &v21;
LABEL_15:
      long long v16 = (NSError *)objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, -50, objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1, v21, v22, v23, v24));
      BOOL result = 0;
      *outError = v16;
      return result;
    }
    return 0;
  }
  [(NSMutableArray *)self->_streams addObject:stream];
  os_unfair_lock_unlock(&self->_streamsLock);
  long long v18 = CMIOLog();
  if (v18)
  {
    long long v19 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136316162;
      __int16 v26 = v20;
      __int16 v27 = 1024;
      int v28 = 1581;
      __int16 v29 = 2080;
      long long v30 = "-[CMIOExtensionDevice addStream:error:]";
      __int16 v31 = 2114;
      v32 = self;
      __int16 v33 = 2114;
      long long v34 = stream;
      _os_log_impl(&dword_2432B6000, v19, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@", buf, 0x30u);
    }
  }
  if (!self->_isRegistered) {
    return 1;
  }
  if (objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "registerStream:withDeviceID:error:", stream, self->_deviceID, outError))
  {
    [(CMIOExtensionStream *)stream setParent:self];
    return 1;
  }
  os_unfair_lock_lock(&self->_streamsLock);
  [(NSMutableArray *)self->_streams removeObject:stream];
  os_unfair_lock_unlock(&self->_streamsLock);
  return 0;
}

- (BOOL)removeStream:(CMIOExtensionStream *)stream error:(NSError *)outError
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v30 = 1024;
      int v31 = 1599;
      __int16 v32 = 2080;
      __int16 v33 = "-[CMIOExtensionDevice removeStream:error:]";
      __int16 v34 = 2112;
      uint64_t v35 = self;
      __int16 v36 = 2112;
      v37 = stream;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  if (!stream || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice removeStream:error:]();
      if (!outError) {
        return 0;
      }
    }
    else if (!outError)
    {
      return 0;
    }
    long long v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v26 = *MEMORY[0x263F08320];
    __int16 v27 = @"Invalid stream";
    long long v18 = NSDictionary;
    long long v19 = &v27;
    uint64_t v20 = &v26;
LABEL_16:
    uint64_t v21 = (NSError *)objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -50, objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1, v24, v25, v26, v27));
    BOOL v14 = 0;
    *outError = v21;
    return v14;
  }
  os_unfair_lock_lock(&self->_streamsLock);
  if (![(NSMutableArray *)self->_streams containsObject:stream])
  {
    os_unfair_lock_unlock(&self->_streamsLock);
    __int16 v22 = CMIOLog();
    if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice removeStream:error:]();
      if (outError) {
        goto LABEL_20;
      }
    }
    else if (outError)
    {
LABEL_20:
      long long v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08410];
      uint64_t v24 = *MEMORY[0x263F08320];
      long long v25 = @"Stream not present";
      long long v18 = NSDictionary;
      long long v19 = &v25;
      uint64_t v20 = &v24;
      goto LABEL_16;
    }
    return 0;
  }
  [(NSMutableArray *)self->_streams removeObject:stream];
  os_unfair_lock_unlock(&self->_streamsLock);
  uint64_t v9 = CMIOLog();
  if (v9)
  {
    uint64_t v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136316162;
      __int16 v29 = v11;
      __int16 v30 = 1024;
      int v31 = 1627;
      __int16 v32 = 2080;
      __int16 v33 = "-[CMIOExtensionDevice removeStream:error:]";
      __int16 v34 = 2114;
      uint64_t v35 = self;
      __int16 v36 = 2114;
      v37 = stream;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@", buf, 0x30u);
    }
  }
  if (!self->_isRegistered) {
    return 1;
  }
  id v12 = +[CMIOExtensionProvider sharedProvider];
  deviceID = self->_deviceID;
  BOOL v14 = 1;
  [v12 unregisterStream:stream withDeviceID:deviceID notify:1 error:outError];
  return v14;
}

- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates
{
  p_changedPropertiesLock = &self->_changedPropertiesLock;
  os_unfair_lock_lock(&self->_changedPropertiesLock);
  [(NSMutableDictionary *)self->_changedProperties addEntriesFromDictionary:propertyStates];
  os_unfair_lock_unlock(p_changedPropertiesLock);
  long long v6 = objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "clientQueue");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CMIOExtensionDevice_notifyPropertiesChanged___block_invoke;
  block[3] = &unk_26517BF28;
  block[4] = self;
  dispatch_async(v6, block);
}

void __47__CMIOExtensionDevice_notifyPropertiesChanged___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if ([v2 count]) {
    objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "_clientQueue_notifyDevicePropertiesChangedWithDeviceID:propertyStates:", *(void *)(*(void *)(a1 + 32) + 80), v2);
  }
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)deviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)legacyDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (id)source
{
  return objc_loadWeak((id *)&self->_source);
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (CMIOExtensionProvider)parent
{
  return (CMIOExtensionProvider *)objc_loadWeak((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);

  objc_destroyWeak((id *)&self->_parent);
}

- (void)didRegister:.cold.1()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_2432B6000, v0, v1, "%s:%d:%s registerStream error %{public}@ for stream %{public}@", v2, v3, v4, v5, v6);
}

- (void)addStream:error:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid stream", v2, v3, v4, v5, v6);
}

- (void)addStream:error:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Stream already included", v2, v3, v4, v5, v6);
}

- (void)removeStream:error:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid stream", v2, v3, v4, v5, v6);
}

- (void)removeStream:error:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Stream not present", v2, v3, v4, v5, v6);
}

@end