@interface CMIOExtensionSessionDualStream
+ (id)sessionDualStreamWithPrimaryStream:(id)a3 secondaryStream:(id)a4;
- (CMIOExtensionSessionDualStream)initWithPrimaryStream:(id)a3 secondaryStream:(id)a4;
- (CMIOExtensionSessionStream)activeStream;
- (CMIOExtensionSessionStream)primaryStream;
- (CMIOExtensionSessionStream)secondaryStream;
- (id)cachedPropertyStateForProperty:(id)a3;
- (id)cachedPropertyStatesForProperties:(id)a3;
- (id)copySample:(BOOL *)a3 streamID:(id)a4 error:(id *)a5;
- (id)delegate;
- (id)formats;
- (unint64_t)activeFormatIndex;
- (void)completeTransaction;
- (void)dealloc;
- (void)propertyStatesForProperties:(id)a3 reply:(id)a4;
- (void)receivedSample:(id)a3 streamID:(id)a4;
- (void)receivedScheduledOutput:(id)a3 streamID:(id)a4;
- (void)selectStream:(unint64_t)a3;
- (void)setActiveFormatIndex:(unint64_t)a3;
- (void)setActiveFormatIndex:(unint64_t)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPropertyValues:(id)a3 reply:(id)a4;
- (void)startStream:(id)a3;
- (void)stopStream:(id)a3;
- (void)updatePropertyStates:(id)a3 streamID:(id)a4;
@end

@implementation CMIOExtensionSessionDualStream

+ (id)sessionDualStreamWithPrimaryStream:(id)a3 secondaryStream:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPrimaryStream:a3 secondaryStream:a4];

  return v4;
}

- (CMIOExtensionSessionDualStream)initWithPrimaryStream:(id)a3 secondaryStream:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    uint64_t v6 = *((void *)a3 + 3);
    v15.receiver = self;
    v15.super_class = (Class)CMIOExtensionSessionDualStream;
    v7 = -[CMIOExtensionSessionStream initWithPropertyStates:provider:](&v15, sel_initWithPropertyStates_provider_, v6, [a3 provider]);
    if (v7)
    {
      v7->_primaryStream = (CMIOExtensionSessionStream *)a3;
      v7->_secondaryStream = (CMIOExtensionSessionStream *)a4;
      v7->_activeStream = v7->_primaryStream;
      v8 = [CMIOExtensionPropertyState alloc];
      uint64_t v9 = -[CMIOExtensionPropertyState initWithValue:](v8, "initWithValue:", [NSNumber numberWithInt:0]);
      v7->_cinematicFramingEnabled = (CMIOExtensionPropertyState *)v9;
      [(NSMutableDictionary *)v7->_primaryStream->_propertyStates setObject:v9 forKey:0x26F89C5F0];
      [(NSMutableDictionary *)v7->_secondaryStream->_propertyStates setObject:v7->_cinematicFramingEnabled forKey:0x26F89C5F0];
      v10 = (void *)[(NSSet *)v7->super._availableProperties mutableCopy];
      [v10 addObject:0x26F89C5F0];

      v7->super._availableProperties = (NSSet *)[v10 copy];
      v7->super._streamID = (NSUUID *)(id)[MEMORY[0x263F08C38] UUID];

      v7->super._description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionSessionDualStream: ID %@>", v7->super._streamID];
      if (CMIOModuleLogLevel_once != -1) {
        dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
      }
      if (CMIOModuleLogLevel_cmioLevel >= 1)
      {
        v11 = CMIOLog();
        if (v11)
        {
          v12 = v11;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
            *(_DWORD *)buf = 136315906;
            v17 = v13;
            __int16 v18 = 1024;
            int v19 = 484;
            __int16 v20 = 2080;
            v21 = "-[CMIOExtensionSessionDualStream initWithPrimaryStream:secondaryStream:]";
            __int16 v22 = 2112;
            v23 = v7;
            _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionSessionDualStream;
  [(CMIOExtensionSessionStream *)&v3 dealloc];
}

- (CMIOExtensionSessionStream)primaryStream
{
  return self->_primaryStream;
}

- (CMIOExtensionSessionStream)secondaryStream
{
  return self->_secondaryStream;
}

- (CMIOExtensionSessionStream)activeStream
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_activeStream;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)selectStream:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  uint64_t v6 = [(CMIOExtensionSessionStream *)self->_activeStream delegate];
  activeStream = self->_activeStream;
  BOOL streaming = activeStream->_streaming;
  if (a3 && activeStream == self->_primaryStream)
  {
    uint64_t v9 = activeStream;
    [(CMIOExtensionSessionStream *)v9 setDelegate:0];
    v10 = self->_secondaryStream;
    self->_activeStream = v10;
    [(CMIOExtensionSessionStream *)v10 setDelegate:v6];
    v11 = self->_activeStream;
    v12 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11->_propertyStates];

    v13 = [CMIOExtensionPropertyState alloc];
    v14 = NSNumber;
    uint64_t v15 = 1;
LABEL_7:
    v17 = -[CMIOExtensionPropertyState initWithValue:](v13, "initWithValue:", [v14 numberWithInt:v15]);
    self->_cinematicFramingEnabled = v17;
    [v12 setObject:v17 forKey:0x26F89C5F0];
    os_unfair_lock_unlock(p_lock);
    if (v9)
    {
      [(CMIOExtensionSessionStream *)v11 updatePropertyStates:v12 streamID:[(NSUUID *)[(CMIOExtensionSessionStream *)v11 streamID] UUIDString]];
      if (streaming)
      {
        [(CMIOExtensionSessionStream *)v11 startStream:&__block_literal_global_1];
        [(CMIOExtensionSessionStream *)v9 stopStream:&__block_literal_global_136_0];
      }
    }
    return;
  }
  if (!a3 && activeStream == self->_secondaryStream)
  {
    uint64_t v9 = activeStream;
    [(CMIOExtensionSessionStream *)v9 setDelegate:0];
    v16 = self->_primaryStream;
    self->_activeStream = v16;
    [(CMIOExtensionSessionStream *)v16 setDelegate:v6];
    v11 = self->_activeStream;
    v12 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11->_propertyStates];

    v13 = [CMIOExtensionPropertyState alloc];
    v14 = NSNumber;
    uint64_t v15 = 0;
    goto LABEL_7;
  }

  os_unfair_lock_unlock(p_lock);
}

void __47__CMIOExtensionSessionDualStream_selectStream___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = CMIOLog();
    if (v2)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_cold_1();
      }
    }
  }
}

void __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_134(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = CMIOLog();
    if (v2)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_134_cold_1();
      }
    }
  }
}

- (void)updatePropertyStates:(id)a3 streamID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v12 = 1024;
        int v13 = 578;
        __int16 v14 = 2080;
        uint64_t v15 = "-[CMIOExtensionSessionDualStream updatePropertyStates:streamID:]";
        __int16 v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  p_primaryStream = &self->_primaryStream;
  if (([(NSString *)[(NSUUID *)[(CMIOExtensionSessionStream *)self->_primaryStream streamID] UUIDString] isEqual:a4] & 1) != 0|| (p_primaryStream = &self->_secondaryStream, [(NSString *)[(NSUUID *)[(CMIOExtensionSessionStream *)self->_secondaryStream streamID] UUIDString] isEqual:a4]))
  {
    [(CMIOExtensionSessionStream *)*p_primaryStream updatePropertyStates:a3 streamID:a4];
  }
}

- (void)receivedSample:(id)a3 streamID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v12 = 1024;
        int v13 = 590;
        __int16 v14 = 2080;
        uint64_t v15 = "-[CMIOExtensionSessionDualStream receivedSample:streamID:]";
        __int16 v16 = 2112;
        v17 = self;
        __int16 v18 = 2112;
        id v19 = a3;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, sample %@", (uint8_t *)&v10, 0x30u);
      }
    }
  }
  p_primaryStream = &self->_primaryStream;
  if (([(NSString *)[(NSUUID *)[(CMIOExtensionSessionStream *)self->_primaryStream streamID] UUIDString] isEqual:a4] & 1) != 0|| (p_primaryStream = &self->_secondaryStream, [(NSString *)[(NSUUID *)[(CMIOExtensionSessionStream *)self->_secondaryStream streamID] UUIDString] isEqual:a4]))
  {
    [(CMIOExtensionSessionStream *)*p_primaryStream receivedSample:a3 streamID:a4];
  }
}

- (id)copySample:(BOOL *)a3 streamID:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    uint64_t v9 = CMIOLog();
    if (v9)
    {
      int v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        __int16 v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v15 = 1024;
        int v16 = 602;
        __int16 v17 = 2080;
        __int16 v18 = "-[CMIOExtensionSessionDualStream copySample:streamID:error:]";
        __int16 v19 = 2112;
        uint64_t v20 = self;
        _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v13, 0x26u);
      }
    }
  }
  *a3 = 0;
  *a5 = 0;
  p_primaryStream = &self->_primaryStream;
  if ([(NSString *)[(NSUUID *)[(CMIOExtensionSessionStream *)self->_primaryStream streamID] UUIDString] isEqual:a4])return [(CMIOExtensionSessionStream *)*p_primaryStream copySample:a3 streamID:a4 error:a5]; {
  p_primaryStream = &self->_secondaryStream;
  }
  if ([(NSString *)[(NSUUID *)[(CMIOExtensionSessionStream *)self->_secondaryStream streamID] UUIDString] isEqual:a4])return [(CMIOExtensionSessionStream *)*p_primaryStream copySample:a3 streamID:a4 error:a5]; {
  else
  }
    return 0;
}

- (void)receivedScheduledOutput:(id)a3 streamID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v12 = 1024;
        int v13 = 618;
        __int16 v14 = 2080;
        __int16 v15 = "-[CMIOExtensionSessionDualStream receivedScheduledOutput:streamID:]";
        __int16 v16 = 2112;
        __int16 v17 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  p_primaryStream = &self->_primaryStream;
  if (([(NSString *)[(NSUUID *)[(CMIOExtensionSessionStream *)self->_primaryStream streamID] UUIDString] isEqual:a4] & 1) != 0|| (p_primaryStream = &self->_secondaryStream, [(NSString *)[(NSUUID *)[(CMIOExtensionSessionStream *)self->_secondaryStream streamID] UUIDString] isEqual:a4]))
  {
    [(CMIOExtensionSessionStream *)*p_primaryStream receivedScheduledOutput:a3 streamID:a4];
  }
}

- (id)delegate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = [(CMIOExtensionSessionStream *)self->_activeStream delegate];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  [(CMIOExtensionSessionStream *)self->_activeStream setDelegate:a3];

  os_unfair_lock_unlock(p_lock);
}

- (id)cachedPropertyStateForProperty:(id)a3
{
  v4 = [(CMIOExtensionSessionDualStream *)self activeStream];

  return [(CMIOExtensionSessionStream *)v4 cachedPropertyStateForProperty:a3];
}

- (id)cachedPropertyStatesForProperties:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      uint64_t v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315906;
        uint64_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v10 = 1024;
        int v11 = 655;
        __int16 v12 = 2080;
        int v13 = "-[CMIOExtensionSessionDualStream cachedPropertyStatesForProperties:]";
        __int16 v14 = 2112;
        __int16 v15 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v8, 0x26u);
      }
    }
  }
  return [(CMIOExtensionSessionStream *)[(CMIOExtensionSessionDualStream *)self activeStream] cachedPropertyStatesForProperties:a3];
}

- (void)propertyStatesForProperties:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      int v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        __int16 v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v11 = 1024;
        int v12 = 662;
        __int16 v13 = 2080;
        __int16 v14 = "-[CMIOExtensionSessionDualStream propertyStatesForProperties:reply:]";
        __int16 v15 = 2112;
        uint64_t v16 = self;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v9, 0x26u);
      }
    }
  }
  [(CMIOExtensionSessionStream *)[(CMIOExtensionSessionDualStream *)self activeStream] propertyStatesForProperties:a3 reply:a4];
}

- (void)setPropertyValues:(id)a3 reply:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      int v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = 136316162;
        __int16 v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v15 = 1024;
        int v16 = 669;
        __int16 v17 = 2080;
        uint64_t v18 = "-[CMIOExtensionSessionDualStream setPropertyValues:reply:]";
        __int16 v19 = 2112;
        uint64_t v20 = self;
        __int16 v21 = 2112;
        id v22 = a3;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyValues %@", (uint8_t *)&v13, 0x30u);
      }
    }
  }
  int v9 = [(CMIOExtensionSessionDualStream *)self activeStream];
  uint64_t v10 = [a3 objectForKeyedSubscript:0x26F89C5F0];
  if (v10)
  {
    __int16 v11 = (void *)v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v11 unsignedIntegerValue];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    if ([v11 length] == 1)
    {
      LOBYTE(v13) = 0;
      [v11 getBytes:&v13 length:1];
      uint64_t v12 = v13;
      goto LABEL_16;
    }
    if ([v11 length] == 4)
    {
      unsigned int v13 = 0;
      [v11 getBytes:&v13 length:4];
      uint64_t v12 = v13;
    }
    else
    {
LABEL_15:
      uint64_t v12 = 0;
    }
LABEL_16:
    [(CMIOExtensionSessionDualStream *)self selectStream:v12];
    if ((unint64_t)[a3 count] >= 2)
    {
      a3 = (id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
      [a3 removeObjectForKey:0x26F89C5F0];
    }
  }
  [(CMIOExtensionSessionStream *)v9 setPropertyValues:a3 reply:a4];
}

- (id)formats
{
  v2 = [(CMIOExtensionSessionDualStream *)self activeStream];

  return [(CMIOExtensionSessionStream *)v2 formats];
}

- (unint64_t)activeFormatIndex
{
  v2 = [(CMIOExtensionSessionDualStream *)self activeStream];

  return [(CMIOExtensionSessionStream *)v2 activeFormatIndex];
}

- (void)setActiveFormatIndex:(unint64_t)a3
{
  v4 = [(CMIOExtensionSessionDualStream *)self activeStream];

  [(CMIOExtensionSessionStream *)v4 setActiveFormatIndex:a3];
}

- (void)setActiveFormatIndex:(unint64_t)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      int v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136316162;
        uint64_t v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v11 = 1024;
        int v12 = 721;
        __int16 v13 = 2080;
        __int16 v14 = "-[CMIOExtensionSessionDualStream setActiveFormatIndex:reply:]";
        __int16 v15 = 2112;
        int v16 = self;
        __int16 v17 = 1024;
        int v18 = a3;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %d", (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  [(CMIOExtensionSessionStream *)[(CMIOExtensionSessionDualStream *)self activeStream] setActiveFormatIndex:a3 reply:a4];
}

- (void)startStream:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      uint64_t v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        int v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v9 = 1024;
        int v10 = 728;
        __int16 v11 = 2080;
        int v12 = "-[CMIOExtensionSessionDualStream startStream:]";
        __int16 v13 = 2112;
        __int16 v14 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  [(CMIOExtensionSessionStream *)[(CMIOExtensionSessionDualStream *)self activeStream] startStream:a3];
}

- (void)stopStream:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once != -1) {
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_379);
  }
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      uint64_t v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        int v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        __int16 v9 = 1024;
        int v10 = 735;
        __int16 v11 = 2080;
        int v12 = "-[CMIOExtensionSessionDualStream stopStream:]";
        __int16 v13 = 2112;
        __int16 v14 = self;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  [(CMIOExtensionSessionStream *)[(CMIOExtensionSessionDualStream *)self activeStream] stopStream:a3];
}

- (void)completeTransaction
{
  v2 = [(CMIOExtensionSessionDualStream *)self activeStream];

  [(CMIOExtensionSessionStream *)v2 completeTransaction];
}

void __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s start stream index error %{public}@", v2, v3, v4, v5, v6);
}

void __47__CMIOExtensionSessionDualStream_selectStream___block_invoke_134_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s stop stream index error %{public}@", v2, v3, v4, v5, v6);
}

@end