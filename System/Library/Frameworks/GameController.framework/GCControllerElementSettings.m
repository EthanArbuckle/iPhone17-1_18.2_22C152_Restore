@interface GCControllerElementSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)invertHorizontally;
- (BOOL)invertVertically;
- (BOOL)isCustomized;
- (BOOL)swapAxes;
- (GCControllerElementSettings)initWithCoder:(id)a3;
- (GCControllerElementSettings)initWithElementKey:(id)a3;
- (NSString)mappingKey;
- (id)changedHandler;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setChangedHandler:(id)a3;
- (void)setDefaultValues;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setDictionaryRepresentation:(id)a3 fromCoder:(BOOL)a4;
- (void)setInvertHorizontally:(BOOL)a3;
- (void)setInvertVertically:(BOOL)a3;
- (void)setSwapAxes:(BOOL)a3;
@end

@implementation GCControllerElementSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCControllerElementSettings)initWithElementKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCControllerElementSettings;
  v6 = [(GCControllerElementSettings *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mappingKey, a3);
    [(GCControllerElementSettings *)v7 setDefaultValues];
  }

  return v7;
}

- (BOOL)isCustomized
{
  return self->_invertVertically || self->_invertHorizontally || self->_swapAxes;
}

- (void)setDefaultValues
{
  *(_WORD *)&self->_invertHorizontally = 0;
  self->_swapAxes = 0;
}

- (void)setInvertVertically:(BOOL)a3
{
  if (self->_invertVertically != a3)
  {
    self->_invertVertically = a3;
    changedHandler = (void (**)(id, GCControllerElementSettings *))self->_changedHandler;
    if (changedHandler) {
      changedHandler[2](changedHandler, self);
    }
  }
}

- (void)setInvertHorizontally:(BOOL)a3
{
  if (self->_invertHorizontally != a3)
  {
    self->_invertHorizontally = a3;
    changedHandler = (void (**)(id, GCControllerElementSettings *))self->_changedHandler;
    if (changedHandler) {
      changedHandler[2](changedHandler, self);
    }
  }
}

- (void)setSwapAxes:(BOOL)a3
{
  if (self->_swapAxes != a3)
  {
    self->_swapAxes = a3;
    changedHandler = (void (**)(id, GCControllerElementSettings *))self->_changedHandler;
    if (changedHandler) {
      changedHandler[2](changedHandler, self);
    }
  }
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void)setDictionaryRepresentation:(id)a3 fromCoder:(BOOL)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  if (a4) {
    goto LABEL_9;
  }
  v8 = [v6 objectForKeyedSubscript:@"elementMappingKey"];

  if (!v8)
  {
LABEL_8:
    [(GCControllerElementSettings *)self setDefaultValues];
    goto LABEL_9;
  }
  objc_super v9 = [v7 objectForKeyedSubscript:@"elementMappingKey"];
  char v10 = [v9 isEqualToString:self->_mappingKey];

  if ((v10 & 1) == 0)
  {
    v11 = getGCSettingsLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mappingKey = self->_mappingKey;
      v19 = [v7 objectForKeyedSubscript:@"elementMappingKey"];
      int v20 = 138412546;
      v21 = mappingKey;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_220998000, v11, OS_LOG_TYPE_ERROR, "Attempting to set dictionary representation element settings with key %@ to representation with key %@", (uint8_t *)&v20, 0x16u);
    }
    goto LABEL_15;
  }
LABEL_9:
  v12 = [v7 objectForKeyedSubscript:@"invertHorizontally"];
  int v13 = [v12 BOOLValue];

  if (self->_invertHorizontally != v13)
  {
    [(GCControllerElementSettings *)self willChangeValueForKey:@"invertHorizontally"];
    self->_invertHorizontally = v13;
    [(GCControllerElementSettings *)self didChangeValueForKey:@"invertHorizontally"];
  }
  v14 = [v7 objectForKeyedSubscript:@"invertVertically"];
  int v15 = [v14 BOOLValue];

  if (self->_invertVertically != v15)
  {
    [(GCControllerElementSettings *)self willChangeValueForKey:@"invertVertically"];
    self->_invertVertically = v15;
    [(GCControllerElementSettings *)self didChangeValueForKey:@"invertVertically"];
  }
  v16 = [v7 objectForKeyedSubscript:@"swapAxes"];
  int v17 = [v16 BOOLValue];

  if (self->_swapAxes != v17)
  {
    [(GCControllerElementSettings *)self willChangeValueForKey:@"swapAxes"];
    self->_swapAxes = v17;
    [(GCControllerElementSettings *)self didChangeValueForKey:@"swapAxes"];
  }
LABEL_15:
}

- (id)dictionaryRepresentation
{
  v9[0] = self->_mappingKey;
  v8[0] = @"elementMappingKey";
  v8[1] = @"invertHorizontally";
  v3 = +[NSNumber numberWithBool:self->_invertHorizontally];
  v9[1] = v3;
  v8[2] = @"invertVertically";
  v4 = +[NSNumber numberWithBool:self->_invertVertically];
  v9[2] = v4;
  v8[3] = @"swapAxes";
  id v5 = +[NSNumber numberWithBool:self->_swapAxes];
  v9[3] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GCControllerElementSettings *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"dictionaryRepresentation"];
}

- (GCControllerElementSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCControllerElementSettings;
  id v5 = [(GCControllerElementSettings *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"dictionaryRepresentation"];

    [(GCControllerElementSettings *)v5 setDefaultValues];
    [(GCControllerElementSettings *)v5 setDictionaryRepresentation:v9 fromCoder:1];
  }
  return v5;
}

- (NSString)mappingKey
{
  return self->_mappingKey;
}

- (id)changedHandler
{
  return self->_changedHandler;
}

- (void)setChangedHandler:(id)a3
{
}

- (BOOL)invertHorizontally
{
  return self->_invertHorizontally;
}

- (BOOL)invertVertically
{
  return self->_invertVertically;
}

- (BOOL)swapAxes
{
  return self->_swapAxes;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changedHandler, 0);

  objc_storeStrong((id *)&self->_mappingKey, 0);
}

@end