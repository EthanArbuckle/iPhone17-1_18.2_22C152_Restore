@interface FASettingsPresetSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FASettingsPresetConfiguration)configuration;
- (FASettingsPresetSource)initWithCoder:(id)a3;
- (FASettingsPresetSource)initWithDictionary:(id)a3;
- (FASettingsPresetSource)initWithIdentifier:(id)a3 configuration:(id)a4;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FASettingsPresetSource

- (FASettingsPresetSource)initWithIdentifier:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FASettingsPresetSource;
  v8 = [(FASettingsPresetSource *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_configuration, a4);
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    identifier = self->_identifier;
    id v7 = [v5 identifier];
    if ([(NSString *)identifier isEqualToString:v7])
    {
      configuration = self->_configuration;
      uint64_t v9 = [v5 configuration];
      BOOL v10 = [(FASettingsPresetConfiguration *)configuration isEqual:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_configuration forKey:@"values"];
}

- (FASettingsPresetSource)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"values"];

  id v7 = [(FASettingsPresetSource *)self initWithIdentifier:v5 configuration:v6];
  return v7;
}

- (FASettingsPresetSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FASettingsPresetConfiguration initWithDictionary:]();
    }
  }
  id v6 = [v4 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _FALogSystem();
    id v7 = (FASettingsPresetConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      -[FASettingsPresetConfiguration initWithDictionary:]();
    }
    goto LABEL_13;
  }
  id v7 = [[FASettingsPresetConfiguration alloc] initWithDictionary:v4];
  if (!v7)
  {
    uint64_t v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FASettingsPresetConfiguration initWithDictionary:]();
    }

LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  self = [(FASettingsPresetSource *)self initWithIdentifier:v6 configuration:v7];
  v8 = self;
LABEL_14:

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FASettingsPresetSource *)self identifier];
  id v6 = [(FASettingsPresetSource *)self configuration];
  id v7 = [v3 stringWithFormat:@"<%@: %p> ({\n identifier: %@\n configuration: %@\n)}", v4, self, v5, v6];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (FASettingsPresetConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end