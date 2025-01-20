@interface CMIOExtensionDeviceProperties
+ (CMIOExtensionDeviceProperties)devicePropertiesWithDictionary:(NSDictionary *)propertiesDictionary;
- (CMIOExtensionDeviceProperties)initWithDictionary:(NSDictionary *)propertiesDictionary;
- (CMIOExtensionDeviceProperties)initWithPropertyValues:(id)a3;
- (NSDictionary)propertiesDictionary;
- (NSNumber)suspended;
- (NSNumber)transportType;
- (NSString)linkedCoreAudioDeviceUID;
- (NSString)model;
- (void)dealloc;
- (void)linkedCoreAudioDeviceUID;
- (void)model;
- (void)setLinkedCoreAudioDeviceUID:(NSString *)linkedCoreAudioDeviceUID;
- (void)setModel:(NSString *)model;
- (void)setPropertiesDictionary:(NSDictionary *)propertiesDictionary;
- (void)setPropertyState:(CMIOExtensionPropertyState *)propertyState forProperty:(CMIOExtensionProperty)property;
- (void)setSuspended:(NSNumber *)suspended;
- (void)setTransportType:(NSNumber *)transportType;
- (void)suspended;
- (void)transportType;
@end

@implementation CMIOExtensionDeviceProperties

+ (CMIOExtensionDeviceProperties)devicePropertiesWithDictionary:(NSDictionary *)propertiesDictionary
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:propertiesDictionary];

  return (CMIOExtensionDeviceProperties *)v3;
}

- (CMIOExtensionDeviceProperties)initWithDictionary:(NSDictionary *)propertiesDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)CMIOExtensionDeviceProperties;
  v4 = [(CMIOExtensionDeviceProperties *)&v7 init];
  v5 = v4;
  if (propertiesDictionary && v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_propertiesDictionary = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:propertiesDictionary];
  }
  return v5;
}

- (CMIOExtensionDeviceProperties)initWithPropertyValues:(id)a3
{
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__CMIOExtensionDeviceProperties_initWithPropertyValues___block_invoke;
  v7[3] = &unk_26517BE90;
  v7[4] = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
  return [(CMIOExtensionDeviceProperties *)self initWithDictionary:v5];
}

uint64_t __56__CMIOExtensionDeviceProperties_initWithPropertyValues___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:");
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 setObject:v4 forKeyedSubscript:a2];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionDeviceProperties;
  [(CMIOExtensionDeviceProperties *)&v3 dealloc];
}

- (NSString)model
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyDeviceModel"];
  os_unfair_lock_unlock(p_lock);
  p_isa = (NSString *)[v4 value];
  if (p_isa)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      p_isa = (NSString *)&v6->isa;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionDeviceProperties model]();
        }
        return 0;
      }
    }
  }
  return p_isa;
}

- (void)setModel:(NSString *)model
{
  if (!model)
  {
LABEL_4:
    [(CMIOExtensionDeviceProperties *)self setPropertyState:model forProperty:@"CMIOExtensionPropertyDeviceModel"];
    return;
  }
  id v4 = model;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    model = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]);
    goto LABEL_4;
  }
  uint64_t v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionDeviceProperties setModel:]();
  }
}

- (NSNumber)suspended
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyDeviceIsSuspended"];
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = (NSNumber *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      uint64_t v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionDeviceProperties suspended]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setSuspended:(NSNumber *)suspended
{
  if (!suspended)
  {
LABEL_4:
    [(CMIOExtensionDeviceProperties *)self setPropertyState:suspended forProperty:@"CMIOExtensionPropertyDeviceIsSuspended"];
    return;
  }
  id v4 = suspended;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    suspended = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]);
    goto LABEL_4;
  }
  uint64_t v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionDeviceProperties setSuspended:]();
  }
}

- (NSNumber)transportType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyDeviceTransportType"];
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = (NSNumber *)[v4 value];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      uint64_t v5 = (NSNumber *)v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionDeviceProperties transportType]();
        }
        return 0;
      }
    }
  }
  return v5;
}

- (void)setTransportType:(NSNumber *)transportType
{
  if (!transportType)
  {
LABEL_4:
    [(CMIOExtensionDeviceProperties *)self setPropertyState:transportType forProperty:@"CMIOExtensionPropertyDeviceTransportType"];
    return;
  }
  id v4 = transportType;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    transportType = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]);
    goto LABEL_4;
  }
  uint64_t v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionDeviceProperties setTransportType:]();
  }
}

- (NSString)linkedCoreAudioDeviceUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyDeviceLinkedCoreAudioDeviceUID"];
  os_unfair_lock_unlock(p_lock);
  p_isa = (NSString *)[v4 value];
  if (p_isa)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CMIOLog();
      p_isa = (NSString *)&v6->isa;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionDeviceProperties linkedCoreAudioDeviceUID]();
        }
        return 0;
      }
    }
  }
  return p_isa;
}

- (void)setLinkedCoreAudioDeviceUID:(NSString *)linkedCoreAudioDeviceUID
{
  if (!linkedCoreAudioDeviceUID)
  {
LABEL_4:
    [(CMIOExtensionDeviceProperties *)self setPropertyState:linkedCoreAudioDeviceUID forProperty:@"CMIOExtensionPropertyDeviceLinkedCoreAudioDeviceUID"];
    return;
  }
  id v4 = linkedCoreAudioDeviceUID;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    linkedCoreAudioDeviceUID = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]);
    goto LABEL_4;
  }
  uint64_t v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionDeviceProperties setLinkedCoreAudioDeviceUID:]();
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

- (void)model
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s model is not from NSString type", v2, v3, v4, v5, v6);
}

- (void)setModel:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s model is not from NSString type", v2, v3, v4, v5, v6);
}

- (void)suspended
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s suspended is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)setSuspended:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s suspended is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)transportType
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s transportType is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)setTransportType:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s transportType is not from NSNumber type", v2, v3, v4, v5, v6);
}

- (void)linkedCoreAudioDeviceUID
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s linkedCoreAudioDeviceUID is not from NSString type", v2, v3, v4, v5, v6);
}

- (void)setLinkedCoreAudioDeviceUID:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s linkedCoreAudioDeviceUID is not from NSString type", v2, v3, v4, v5, v6);
}

@end