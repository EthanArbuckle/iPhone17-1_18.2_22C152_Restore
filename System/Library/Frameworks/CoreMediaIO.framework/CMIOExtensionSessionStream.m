@interface CMIOExtensionSessionStream
+ (id)sessionStreamWithPropertyStates:(id)a3 provider:(id)a4;
- (BOOL)isInvalidated;
- (CMIOExtensionSessionProvider)provider;
- (CMIOExtensionSessionStream)initWithPropertyStates:(id)a3 provider:(id)a4;
- (CMIOExtensionSessionStreamDelegate)delegate;
- (CMIOExtensionStreamCustomClockConfiguration)customClockConfiguration;
- (NSArray)formats;
- (NSSet)availableProperties;
- (NSString)localizedName;
- (NSUUID)streamID;
- (id)cachedPropertyStateForProperty:(id)a3;
- (id)cachedPropertyStatesForProperties:(id)a3;
- (id)copySample:(BOOL *)a3 streamID:(id)a4 error:(id *)a5;
- (id)description;
- (int64_t)clockType;
- (int64_t)direction;
- (unint64_t)activeFormatIndex;
- (unsigned)activeFormatMediaType;
- (void)captureAsyncStillImage:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)completeTransaction;
- (void)dealloc;
- (void)enqueueReactionEffect:(id)a3 reply:(id)a4;
- (void)propertyStatesForProperties:(id)availableProperties reply:(id)a4;
- (void)receivedSample:(id)a3 streamID:(id)a4;
- (void)receivedScheduledOutput:(id)a3 streamID:(id)a4;
- (void)setActiveFormatIndex:(unint64_t)a3;
- (void)setActiveFormatIndex:(unint64_t)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setPropertyValues:(id)a3 reply:(id)a4;
- (void)startStream:(id)a3;
- (void)stopStream:(id)a3;
- (void)updatePropertyStates:(id)a3 streamID:(id)a4;
@end

@implementation CMIOExtensionSessionStream

+ (id)sessionStreamWithPropertyStates:(id)a3 provider:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPropertyStates:a3 provider:a4];

  return v4;
}

- (CMIOExtensionSessionStream)initWithPropertyStates:(id)a3 provider:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    v17.receiver = self;
    v17.super_class = (Class)CMIOExtensionSessionStream;
    v6 = [(CMIOExtensionSessionStream *)&v17 init];
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      id v8 = +[CMIOExtensionStream internalProperties];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __62__CMIOExtensionSessionStream_initWithPropertyStates_provider___block_invoke;
      v16[3] = &unk_26517C610;
      v16[4] = v8;
      v7->_availableProperties = (NSSet *)(id)[a3 keysOfEntriesPassingTest:v16];
      v7->_localizedName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C530), "value");
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C550), "value");
      v7->_streamID = (NSUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
      v7->_direction = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C570), "value"), "integerValue");
      uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C590), "value"), "integerValue");
      v7->_clockType = v10;
      if (v10 == 2) {
        v7->_customClockConfiguration = (CMIOExtensionStreamCustomClockConfiguration *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C5B0), "value");
      }
      v7->_formats = (NSArray *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26F89C5D0), "attributes"), "validValues");
      uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"CMIOExtensionPropertyStreamActiveFormatIndex"), "value"), "unsignedIntegerValue");
      v7->_activeFormatIndex = v11;
      v7->_activeFormatMediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)objc_msgSend(-[NSArray objectAtIndexedSubscript:](v7->_formats, "objectAtIndexedSubscript:", v11), "formatDescription"));
      v7->_propertyStates = (NSMutableDictionary *)[a3 mutableCopy];
      objc_storeWeak((id *)&v7->_provider, a4);
      v7->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionSessionStream: ID %@>", v7->_streamID];
      if (CMIOModuleLogLevel_once != -1) {
        dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
      }
      if (CMIOModuleLogLevel_cmioLevel >= 1)
      {
        v12 = CMIOLog();
        if (v12)
        {
          v13 = v12;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
            *(_DWORD *)buf = 136315906;
            v19 = v14;
            __int16 v20 = 1024;
            int v21 = 162;
            __int16 v22 = 2080;
            v23 = "-[CMIOExtensionSessionStream initWithPropertyStates:provider:]";
            __int16 v24 = 2112;
            v25 = v7;
            _os_log_impl(&dword_2432B6000, v13, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
          }
        }
      }
    }
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid argument"];
    return 0;
  }
  return v7;
}

uint64_t __62__CMIOExtensionSessionStream_initWithPropertyStates_provider___block_invoke(uint64_t a1, uint64_t a2)
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
        int v9 = 169;
        __int16 v10 = 2080;
        uint64_t v11 = "-[CMIOExtensionSessionStream dealloc]";
        __int16 v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionSessionStream;
  [(CMIOExtensionSessionStream *)&v5 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (void)updatePropertyStates:(id)a3 streamID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v12 = 1024;
        int v13 = 189;
        __int16 v14 = 2080;
        v15 = "-[CMIOExtensionSessionStream updatePropertyStates:streamID:]";
        __int16 v16 = 2112;
        objc_super v17 = self;
        _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  if ([a3 count])
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_propertyStates addEntriesFromDictionary:a3];
    os_unfair_lock_unlock(&self->_lock);
    __int16 v8 = (void *)[a3 objectForKeyedSubscript:@"CMIOExtensionPropertyStreamActiveFormatIndex"];
    if (v8)
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "value"), "unsignedIntegerValue");
      [(CMIOExtensionSessionStream *)self setActiveFormatIndex:v9];
      self->_activeFormatMediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_formats, "objectAtIndexedSubscript:", self->_activeFormatIndex), "formatDescription"));
      [objc_loadWeak((id *)&self->_delegate) stream:self activeFormatIndexChanged:v9];
    }
    [objc_loadWeak((id *)&self->_delegate) stream:self propertiesChanged:a3];
  }
}

- (void)receivedSample:(id)a3 streamID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136316162;
        uint64_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v10 = 1024;
        int v11 = 214;
        __int16 v12 = 2080;
        int v13 = "-[CMIOExtensionSessionStream receivedSample:streamID:]";
        __int16 v14 = 2112;
        v15 = self;
        __int16 v16 = 2112;
        id v17 = a3;
        _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, sample %@", (uint8_t *)&v8, 0x30u);
      }
    }
  }
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "stream:receivedSampleBuffer:", self, objc_msgSend(a3, "sampleBuffer"));
}

- (id)copySample:(BOOL *)a3 streamID:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    int v8 = CMIOLog();
    if (v8)
    {
      uint64_t v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v16 = 1024;
        int v17 = 221;
        __int16 v18 = 2080;
        v19 = "-[CMIOExtensionSessionStream copySample:streamID:error:]";
        __int16 v20 = 2112;
        int v21 = self;
        _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v14, 0x26u);
      }
    }
  }
  *a3 = 0;
  *a5 = 0;
  uint64_t v10 = [objc_loadWeak((id *)&self->_delegate) stream:self copySampleBuffer:a3 error:a5];
  if (!v10) {
    return 0;
  }
  int v11 = (const void *)v10;
  __int16 v12 = [[CMIOExtensionSample alloc] initWithCMSampleBuffer:v10];
  CFRelease(v11);
  return v12;
}

- (void)receivedScheduledOutput:(id)a3 streamID:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315906;
        uint64_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v10 = 1024;
        int v11 = 237;
        __int16 v12 = 2080;
        int v13 = "-[CMIOExtensionSessionStream receivedScheduledOutput:streamID:]";
        __int16 v14 = 2112;
        v15 = self;
        _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v8, 0x26u);
      }
    }
  }
  [objc_loadWeak((id *)&self->_delegate) stream:self scheduledOutputChanged:a3];
}

- (CMIOExtensionSessionStreamDelegate)delegate
{
  return (CMIOExtensionSessionStreamDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
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
    objc_super v5 = CMIOLog();
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v24 = 1024;
        int v25 = 270;
        __int16 v26 = 2080;
        v27 = "-[CMIOExtensionSessionStream cachedPropertyStatesForProperties:]";
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
    __int16 v14 = (void *)[NSDictionary dictionaryWithDictionary:v7];
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int16 v14 = (void *)[NSDictionary dictionaryWithDictionary:self->_propertyStates];
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
        int v19 = 302;
        __int16 v20 = 2080;
        int v21 = "-[CMIOExtensionSessionStream propertyStatesForProperties:reply:]";
        __int16 v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (!availableProperties) {
    availableProperties = self->_availableProperties;
  }
  uint64_t v9 = [objc_loadWeak((id *)&self->_provider) hostContext];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    int v11 = [(NSUUID *)self->_streamID UUIDString];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__CMIOExtensionSessionStream_propertyStatesForProperties_reply___block_invoke;
    v13[3] = &unk_26517C638;
    v13[4] = self;
    v13[5] = a4;
    [v10 streamPropertyStatesWithStreamID:v11 properties:availableProperties reply:v13];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263F08410];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15 = @"Invalid session";
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

uint64_t __64__CMIOExtensionSessionStream_propertyStatesForProperties_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(*(void *)(a1 + 32) + 24) addEntriesFromDictionary:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

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
        int v19 = 324;
        __int16 v20 = 2080;
        int v21 = "-[CMIOExtensionSessionStream setPropertyValues:reply:]";
        __int16 v22 = 2112;
        v23 = self;
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
    int v11 = [(NSUUID *)self->_streamID UUIDString];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__CMIOExtensionSessionStream_setPropertyValues_reply___block_invoke;
    v13[3] = &unk_26517C660;
    v13[4] = a4;
    [v10 setStreamPropertyValuesWithStreamID:v11 propertyValues:a3 reply:v13];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263F08410];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15 = @"Invalid session";
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

uint64_t __54__CMIOExtensionSessionStream_setPropertyValues_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)formats
{
  v2 = self->_formats;

  return v2;
}

- (void)setActiveFormatIndex:(unint64_t)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
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
        id v25 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v26 = 1024;
        int v27 = 343;
        __int16 v28 = 2080;
        v29 = "-[CMIOExtensionSessionStream setActiveFormatIndex:reply:]";
        __int16 v30 = 2112;
        v31 = self;
        __int16 v32 = 1024;
        int v33 = a3;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %d", buf, 0x2Cu);
      }
    }
  }
  if ([(NSArray *)self->_formats count] <= a3)
  {
    id v13 = CMIOLog();
    if (v13)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionSessionStream setActiveFormatIndex:reply:]();
      }
    }
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23 = @"Invalid format value";
    uint64_t v16 = NSDictionary;
    long long v17 = &v23;
    __int16 v18 = &v22;
  }
  else
  {
    uint64_t v9 = [objc_loadWeak((id *)&self->_provider) hostContext];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3), @"CMIOExtensionPropertyStreamActiveFormatIndex");
      uint64_t v12 = [(NSUUID *)self->_streamID UUIDString];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __57__CMIOExtensionSessionStream_setActiveFormatIndex_reply___block_invoke;
      v19[3] = &unk_26517C688;
      v19[5] = a4;
      v19[6] = a3;
      v19[4] = self;
      [v10 setStreamPropertyValuesWithStreamID:v12 propertyValues:v11 reply:v19];
      return;
    }
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v20 = *MEMORY[0x263F08320];
    int v21 = @"Invalid session";
    uint64_t v16 = NSDictionary;
    long long v17 = &v21;
    __int16 v18 = &v20;
  }
  (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, -50, objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1)));
}

uint64_t __57__CMIOExtensionSessionStream_setActiveFormatIndex_reply___block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    v3 = CMIOLog();
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__CMIOExtensionSessionStream_setActiveFormatIndex_reply___block_invoke_cold_1();
    }
  }
  else
  {
    *(void *)(a1[4] + 112) = a1[6];
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)startStream:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    objc_super v5 = CMIOLog();
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v16 = 1024;
        int v17 = 371;
        __int16 v18 = 2080;
        int v19 = "-[CMIOExtensionSessionStream startStream:]";
        __int16 v20 = 2112;
        int v21 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  uint64_t v7 = [objc_loadWeak((id *)&self->_provider) hostContext];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    self->_streaming = 1;
    uint64_t v9 = [(NSUUID *)self->_streamID UUIDString];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__CMIOExtensionSessionStream_startStream___block_invoke;
    v11[3] = &unk_26517C6B0;
    v11[4] = self;
    v11[5] = a3;
    [v8 startStreamWithStreamID:v9 reply:v11];
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v12 = *MEMORY[0x263F08320];
    id v13 = @"Invalid session";
    (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
}

uint64_t __42__CMIOExtensionSessionStream_startStream___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = CMIOLog();
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__CMIOExtensionSessionStream_startStream___block_invoke_cold_1();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopStream:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    objc_super v5 = CMIOLog();
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v16 = 1024;
        int v17 = 390;
        __int16 v18 = 2080;
        int v19 = "-[CMIOExtensionSessionStream stopStream:]";
        __int16 v20 = 2112;
        int v21 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  uint64_t v7 = [objc_loadWeak((id *)&self->_provider) hostContext];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    self->_streaming = 0;
    uint64_t v9 = [(NSUUID *)self->_streamID UUIDString];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__CMIOExtensionSessionStream_stopStream___block_invoke;
    v11[3] = &unk_26517C660;
    v11[4] = a3;
    [v8 stopStreamWithStreamID:v9 reply:v11];
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v12 = *MEMORY[0x263F08320];
    id v13 = @"Invalid session";
    (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
}

uint64_t __41__CMIOExtensionSessionStream_stopStream___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = CMIOLog();
    if (v3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __41__CMIOExtensionSessionStream_stopStream___block_invoke_cold_1();
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)captureAsyncStillImage:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v9 = CMIOLog();
    if (v9)
    {
      uint64_t v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        int v19 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v20 = 1024;
        int v21 = 408;
        __int16 v22 = 2080;
        v23 = "-[CMIOExtensionSessionStream captureAsyncStillImage:options:reply:]";
        __int16 v24 = 2112;
        id v25 = self;
        _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  uint64_t v11 = [objc_loadWeak((id *)&self->_provider) hostContext];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    id v13 = [(NSUUID *)self->_streamID UUIDString];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__CMIOExtensionSessionStream_captureAsyncStillImage_options_reply___block_invoke;
    v15[3] = &unk_26517C6D8;
    v15[4] = a5;
    [v12 captureAsyncStillImageWithStreamID:v13 uniqueID:a3 options:a4 reply:v15];
  }
  else
  {
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v16 = *MEMORY[0x263F08320];
    int v17 = @"Invalid session";
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v14, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1)));
  }
}

uint64_t __67__CMIOExtensionSessionStream_captureAsyncStillImage_options_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = CMIOLog();
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __67__CMIOExtensionSessionStream_captureAsyncStillImage_options_reply___block_invoke_cold_1();
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v6();
  }
}

- (void)enqueueReactionEffect:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v7 = CMIOLog();
    if (v7)
    {
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v15 = 1024;
        int v16 = 428;
        __int16 v17 = 2080;
        __int16 v18 = "-[CMIOExtensionSessionStream enqueueReactionEffect:reply:]";
        __int16 v19 = 2112;
        __int16 v20 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  uint64_t v9 = (void *)[objc_loadWeak((id *)&self->_provider) hostContext];
  if (v9)
  {
    objc_msgSend(v9, "enqueueReactionEffect:reactionType:reply:", -[NSUUID UUIDString](self->_streamID, "UUIDString"), a3, a4);
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Invalid session";
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
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

- (NSUUID)streamID
{
  return self->_streamID;
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)clockType
{
  return self->_clockType;
}

- (CMIOExtensionStreamCustomClockConfiguration)customClockConfiguration
{
  return self->_customClockConfiguration;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (unint64_t)activeFormatIndex
{
  return self->_activeFormatIndex;
}

- (void)setActiveFormatIndex:(unint64_t)a3
{
  self->_activeFormatIndex = a3;
}

- (unsigned)activeFormatMediaType
{
  return self->_activeFormatMediaType;
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

- (void)setActiveFormatIndex:reply:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s ", v2, v3, v4, v5, v6);
}

void __57__CMIOExtensionSessionStream_setActiveFormatIndex_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s active format index error %{public}@", v2, v3, v4, v5, v6);
}

void __42__CMIOExtensionSessionStream_startStream___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s start stream index error %{public}@", v2, v3, v4, v5, v6);
}

void __41__CMIOExtensionSessionStream_stopStream___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s stop stream index error %{public}@", v2, v3, v4, v5, v6);
}

void __67__CMIOExtensionSessionStream_captureAsyncStillImage_options_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s capture still image error %{public}@", v2, v3, v4, v5, v6);
}

@end