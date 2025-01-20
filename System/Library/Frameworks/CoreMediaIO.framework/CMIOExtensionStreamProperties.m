@interface CMIOExtensionStreamProperties
+ (CMIOExtensionStreamProperties)streamPropertiesWithDictionary:(NSDictionary *)propertiesDictionary;
- (CMIOExtensionStreamProperties)initWithDictionary:(NSDictionary *)propertiesDictionary;
- (CMIOExtensionStreamProperties)initWithPropertyValues:(id)a3 client:(id)a4;
- (NSDictionary)frameDuration;
- (NSDictionary)maxFrameDuration;
- (NSDictionary)propertiesDictionary;
- (NSNumber)activeFormatIndex;
- (NSNumber)sinkBufferQueueSize;
- (NSNumber)sinkBufferUnderrunCount;
- (NSNumber)sinkBuffersRequiredForStartup;
- (NSNumber)sinkEndOfData;
- (id)client;
- (void)activeFormatIndex;
- (void)dealloc;
- (void)frameDuration;
- (void)maxFrameDuration;
- (void)setActiveFormatIndex:(NSNumber *)activeFormatIndex;
- (void)setFrameDuration:(NSDictionary *)frameDuration;
- (void)setMaxFrameDuration:(NSDictionary *)maxFrameDuration;
- (void)setPropertiesDictionary:(NSDictionary *)propertiesDictionary;
- (void)setPropertyState:(CMIOExtensionPropertyState *)propertyState forProperty:(CMIOExtensionProperty)property;
- (void)setSinkBufferQueueSize:(NSNumber *)sinkBufferQueueSize;
- (void)setSinkBufferUnderrunCount:(NSNumber *)sinkBufferUnderrunCount;
- (void)setSinkBuffersRequiredForStartup:(NSNumber *)sinkBuffersRequiredForStartup;
- (void)setSinkEndOfData:(NSNumber *)sinkEndOfData;
- (void)sinkBufferQueueSize;
- (void)sinkBufferUnderrunCount;
- (void)sinkBuffersRequiredForStartup;
- (void)sinkEndOfData;
@end

@implementation CMIOExtensionStreamProperties

+ (CMIOExtensionStreamProperties)streamPropertiesWithDictionary:(NSDictionary *)propertiesDictionary
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:propertiesDictionary];

  return (CMIOExtensionStreamProperties *)v3;
}

- (CMIOExtensionStreamProperties)initWithDictionary:(NSDictionary *)propertiesDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)CMIOExtensionStreamProperties;
  v4 = [(CMIOExtensionStreamProperties *)&v7 init];
  v5 = v4;
  if (propertiesDictionary && v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_propertiesDictionary = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:propertiesDictionary];
  }
  return v5;
}

- (CMIOExtensionStreamProperties)initWithPropertyValues:(id)a3 client:(id)a4
{
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__CMIOExtensionStreamProperties_initWithPropertyValues_client___block_invoke;
  v10[3] = &unk_26517BE90;
  v10[4] = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  v8 = [(CMIOExtensionStreamProperties *)self initWithDictionary:v7];
  if (v8) {
    v8->_client = (CMIOExtensionClient *)[a4 copy];
  }
  return v8;
}

uint64_t __63__CMIOExtensionStreamProperties_initWithPropertyValues_client___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:");
  v5 = *(void **)(a1 + 32);

  return [v5 setObject:v4 forKeyedSubscript:a2];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionStreamProperties;
  [(CMIOExtensionStreamProperties *)&v3 dealloc];
}

- (NSNumber)activeFormatIndex
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyStreamActiveFormatIndex"];
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionStreamProperties activeFormatIndex]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setActiveFormatIndex:(NSNumber *)activeFormatIndex
{
  if (!activeFormatIndex)
  {
LABEL_4:
    [(CMIOExtensionStreamProperties *)self setPropertyState:activeFormatIndex forProperty:@"CMIOExtensionPropertyStreamActiveFormatIndex"];
    return;
  }
  id v4 = activeFormatIndex;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    activeFormatIndex = +[CMIOExtensionPropertyState propertyStateWithValue:v4];
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionStreamProperties setActiveFormatIndex:]();
  }
}

- (NSDictionary)frameDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyStreamFrameDuration"];
  os_unfair_lock_unlock(p_lock);
  v5 = (NSDictionary *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSDictionary *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionStreamProperties frameDuration]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setFrameDuration:(NSDictionary *)frameDuration
{
  if (!frameDuration)
  {
LABEL_4:
    [(CMIOExtensionStreamProperties *)self setPropertyState:frameDuration forProperty:@"CMIOExtensionPropertyStreamFrameDuration"];
    return;
  }
  id v4 = frameDuration;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    frameDuration = +[CMIOExtensionPropertyState propertyStateWithValue:v4];
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionStreamProperties setFrameDuration:]();
  }
}

- (NSDictionary)maxFrameDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyStreamMaxFrameDuration"];
  os_unfair_lock_unlock(p_lock);
  v5 = (NSDictionary *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSDictionary *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionStreamProperties maxFrameDuration]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setMaxFrameDuration:(NSDictionary *)maxFrameDuration
{
  if (!maxFrameDuration)
  {
LABEL_4:
    [(CMIOExtensionStreamProperties *)self setPropertyState:maxFrameDuration forProperty:@"CMIOExtensionPropertyStreamMaxFrameDuration"];
    return;
  }
  id v4 = maxFrameDuration;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    maxFrameDuration = +[CMIOExtensionPropertyState propertyStateWithValue:v4];
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionStreamProperties setMaxFrameDuration:]();
  }
}

- (NSNumber)sinkBufferQueueSize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyStreamSinkBufferQueueSize"];
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionStreamProperties sinkBufferQueueSize]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSinkBufferQueueSize:(NSNumber *)sinkBufferQueueSize
{
  if (!sinkBufferQueueSize)
  {
LABEL_4:
    [(CMIOExtensionStreamProperties *)self setPropertyState:sinkBufferQueueSize forProperty:@"CMIOExtensionPropertyStreamSinkBufferQueueSize"];
    return;
  }
  id v4 = sinkBufferQueueSize;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sinkBufferQueueSize = +[CMIOExtensionPropertyState propertyStateWithValue:v4];
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionStreamProperties setSinkBufferQueueSize:]();
  }
}

- (NSNumber)sinkBuffersRequiredForStartup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyStreamSinkBuffersRequiredForStartup"];
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionStreamProperties sinkBuffersRequiredForStartup]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSinkBuffersRequiredForStartup:(NSNumber *)sinkBuffersRequiredForStartup
{
  if (!sinkBuffersRequiredForStartup)
  {
LABEL_4:
    [(CMIOExtensionStreamProperties *)self setPropertyState:sinkBuffersRequiredForStartup forProperty:@"CMIOExtensionPropertyStreamSinkBuffersRequiredForStartup"];
    return;
  }
  id v4 = sinkBuffersRequiredForStartup;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sinkBuffersRequiredForStartup = +[CMIOExtensionPropertyState propertyStateWithValue:v4];
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionStreamProperties setSinkBuffersRequiredForStartup:]();
  }
}

- (NSNumber)sinkBufferUnderrunCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyStreamSinkBufferUnderrunCount"];
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionStreamProperties sinkBufferUnderrunCount]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSinkBufferUnderrunCount:(NSNumber *)sinkBufferUnderrunCount
{
  if (!sinkBufferUnderrunCount)
  {
LABEL_4:
    [(CMIOExtensionStreamProperties *)self setPropertyState:sinkBufferUnderrunCount forProperty:@"CMIOExtensionPropertyStreamSinkBufferUnderrunCount"];
    return;
  }
  id v4 = sinkBufferUnderrunCount;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sinkBufferUnderrunCount = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]);
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionStreamProperties setSinkBufferUnderrunCount:]();
  }
}

- (NSNumber)sinkEndOfData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyStreamSinkEndOfData"];
  os_unfair_lock_unlock(p_lock);
  v5 = (NSNumber *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionStreamProperties sinkEndOfData]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSinkEndOfData:(NSNumber *)sinkEndOfData
{
  if (!sinkEndOfData)
  {
LABEL_4:
    [(CMIOExtensionStreamProperties *)self setPropertyState:sinkEndOfData forProperty:@"CMIOExtensionPropertyStreamSinkEndOfData"];
    return;
  }
  id v4 = sinkEndOfData;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sinkEndOfData = +[CMIOExtensionPropertyState propertyStateWithValue:v4];
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionStreamProperties setSinkEndOfData:]();
  }
}

- (void)setPropertyState:(CMIOExtensionPropertyState *)propertyState forProperty:(CMIOExtensionProperty)property
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  propertiesDictionary = self->_propertiesDictionary;
  if (propertyState) {
    [(NSMutableDictionary *)propertiesDictionary setObject:propertyState forKey:property];
  }
  else {
    [(NSMutableDictionary *)propertiesDictionary removeObjectForKey:property];
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)propertiesDictionary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_propertiesDictionary copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (void)setPropertiesDictionary:(NSDictionary *)propertiesDictionary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_propertiesDictionary;
  self->_propertiesDictionary = (NSMutableDictionary *)[(NSDictionary *)propertiesDictionary mutableCopy];
  os_unfair_lock_unlock(p_lock);
}

- (id)client
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(CMIOExtensionClient *)self->_client copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)activeFormatIndex
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s activeFormatIndex is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)setActiveFormatIndex:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s activeFormatIndex is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)frameDuration
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s frameDuration is not from NSDictionary type", v2, v3, v4, v5, v6);
}

- (void)setFrameDuration:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s frameDuration is not from NSDictionary type", v2, v3, v4, v5, v6);
}

- (void)maxFrameDuration
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s maxFrameDuration is not from NSDictionary type", v2, v3, v4, v5, v6);
}

- (void)setMaxFrameDuration:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s maxFrameDuration is not from NSDictionary type", v2, v3, v4, v5, v6);
}

- (void)sinkBufferQueueSize
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s sinkBufferQueueSize is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)setSinkBufferQueueSize:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s sinkBufferQueueSize is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)sinkBuffersRequiredForStartup
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s sinkBuffersRequiredForStartup is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)setSinkBuffersRequiredForStartup:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s sinkBuffersRequiredForStartup is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)sinkBufferUnderrunCount
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s sinkBufferUnderrunCount is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)setSinkBufferUnderrunCount:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s sinkBufferUnderrunCount is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)sinkEndOfData
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s sinkEndOfData is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)setSinkEndOfData:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s sinkEndOfData is not from NSNumber type", v2, v3, v4, v5, v6);
}

@end