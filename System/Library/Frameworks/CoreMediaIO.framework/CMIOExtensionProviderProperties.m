@interface CMIOExtensionProviderProperties
+ (CMIOExtensionProviderProperties)providerPropertiesWithDictionary:(NSDictionary *)propertiesDictionary;
- (CMIOExtensionProviderProperties)initWithDictionary:(NSDictionary *)propertiesDictionary;
- (CMIOExtensionProviderProperties)initWithPropertyValues:(id)a3 client:(id)a4;
- (NSDictionary)propertiesDictionary;
- (NSString)manufacturer;
- (NSString)name;
- (id)client;
- (void)dealloc;
- (void)manufacturer;
- (void)name;
- (void)setManufacturer:(NSString *)manufacturer;
- (void)setName:(NSString *)name;
- (void)setPropertiesDictionary:(NSDictionary *)propertiesDictionary;
- (void)setPropertyState:(CMIOExtensionPropertyState *)propertyState forProperty:(CMIOExtensionProperty)property;
@end

@implementation CMIOExtensionProviderProperties

+ (CMIOExtensionProviderProperties)providerPropertiesWithDictionary:(NSDictionary *)propertiesDictionary
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:propertiesDictionary];

  return (CMIOExtensionProviderProperties *)v3;
}

- (CMIOExtensionProviderProperties)initWithDictionary:(NSDictionary *)propertiesDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)CMIOExtensionProviderProperties;
  v4 = [(CMIOExtensionProviderProperties *)&v7 init];
  v5 = v4;
  if (propertiesDictionary && v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_propertiesDictionary = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:propertiesDictionary];
  }
  return v5;
}

- (CMIOExtensionProviderProperties)initWithPropertyValues:(id)a3 client:(id)a4
{
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CMIOExtensionProviderProperties_initWithPropertyValues_client___block_invoke;
  v10[3] = &unk_26517BE90;
  v10[4] = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  v8 = [(CMIOExtensionProviderProperties *)self initWithDictionary:v7];
  if (v8) {
    v8->_client = (CMIOExtensionClient *)[a4 copy];
  }
  return v8;
}

uint64_t __65__CMIOExtensionProviderProperties_initWithPropertyValues_client___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = +[CMIOExtensionPropertyState propertyStateWithValue:](CMIOExtensionPropertyState, "propertyStateWithValue:");
  v5 = *(void **)(a1 + 32);

  return [v5 setObject:v4 forKeyedSubscript:a2];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionProviderProperties;
  [(CMIOExtensionProviderProperties *)&v3 dealloc];
}

- (id)client
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(CMIOExtensionClient *)self->_client copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyProviderName"];
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
          -[CMIOExtensionProviderProperties name]();
        }
        return 0;
      }
    }
  }
  return p_isa;
}

- (void)setName:(NSString *)name
{
  if (!name)
  {
LABEL_4:
    [(CMIOExtensionProviderProperties *)self setPropertyState:name forProperty:@"CMIOExtensionPropertyProviderName"];
    return;
  }
  id v4 = name;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    name = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]);
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderProperties setName:]();
  }
}

- (NSString)manufacturer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_propertiesDictionary objectForKey:@"CMIOExtensionPropertyProviderManufacturer"];
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
          -[CMIOExtensionProviderProperties manufacturer]();
        }
        return 0;
      }
    }
  }
  return p_isa;
}

- (void)setManufacturer:(NSString *)manufacturer
{
  if (!manufacturer)
  {
LABEL_4:
    [(CMIOExtensionProviderProperties *)self setPropertyState:manufacturer forProperty:@"CMIOExtensionPropertyProviderManufacturer"];
    return;
  }
  id v4 = manufacturer;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    manufacturer = +[CMIOExtensionPropertyState propertyStateWithValue:attributes:](CMIOExtensionPropertyState, "propertyStateWithValue:attributes:", v4, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]);
    goto LABEL_4;
  }
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CMIOExtensionProviderProperties setManufacturer:]();
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

- (void)name
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s name is not from NSString type", v2, v3, v4, v5, v6);
}

- (void)setName:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s name is not from NSString type", v2, v3, v4, v5, v6);
}

- (void)manufacturer
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s manufacturer is not from NSString type", v2, v3, v4, v5, v6);
}

- (void)setManufacturer:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s manufacturer is not from NSString type", v2, v3, v4, v5, v6);
}

@end