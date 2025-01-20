@interface FASettingsPreset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FASettingsPreset)initWithCoder:(id)a3;
- (FASettingsPreset)initWithDictionary:(id)a3;
- (FASettingsPreset)initWithIdentifier:(id)a3 minAge:(int64_t)a4 maxAge:(int64_t)a5 sources:(id)a6;
- (NSArray)sources;
- (NSString)displayName;
- (NSString)identifier;
- (id)description;
- (id)sourceWithIdentifier:(id)a3;
- (int64_t)maxAge;
- (int64_t)minAge;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FASettingsPreset

- (FASettingsPreset)initWithIdentifier:(id)a3 minAge:(int64_t)a4 maxAge:(int64_t)a5 sources:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FASettingsPreset;
  v12 = [(FASettingsPreset *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v12->_minAge = a4;
    v12->_maxAge = a5;
    uint64_t v15 = [v11 copy];
    v16 = (void *)v15;
    if (v15) {
      v17 = (void *)v15;
    }
    else {
      v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v12->_sources, v17);
  }
  return v12;
}

- (NSString)displayName
{
  v3 = NSString;
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"SETTINGS_PRESETS_AGE" value:&stru_1F29387B0 table:@"Localizable"];
  v6 = objc_msgSend(v3, "stringWithFormat:", v5, self->_minAge, self->_maxAge);

  return (NSString *)v6;
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
    v7 = [v5 identifier];
    if ([(NSString *)identifier isEqualToString:v7]
      && (int64_t minAge = self->_minAge, minAge == [v5 minAge])
      && (int64_t maxAge = self->_maxAge, maxAge == [v5 maxAge]))
    {
      sources = self->_sources;
      id v11 = [v5 sources];
      BOOL v12 = [(NSArray *)sources isEqualToArray:v11];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
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
  [v5 encodeInteger:self->_minAge forKey:@"minAge"];
  [v5 encodeInteger:self->_maxAge forKey:@"maxAge"];
  [v5 encodeObject:self->_sources forKey:@"sources"];
}

- (FASettingsPreset)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"minAge"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"maxAge"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"sources"];

  BOOL v12 = [(FASettingsPreset *)self initWithIdentifier:v5 minAge:v6 maxAge:v7 sources:v11];
  return v12;
}

- (FASettingsPreset)initWithDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FASettingsPreset initWithDictionary:]();
    }
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"identifier"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"sources"];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C978] array];
  }
  id v10 = v9;

  id v11 = [v4 objectForKeyedSubscript:@"minAge"];
  BOOL v12 = [v4 objectForKeyedSubscript:@"maxAge"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = _FALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = _FALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = _FALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = _FALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
LABEL_29:
      }
        -[FASettingsPreset initWithDictionary:]();
LABEL_30:
      v18 = 0;
      goto LABEL_31;
    }
  }
  uint64_t v13 = objc_msgSend(v10, "fa_map:", &__block_literal_global_12);
  uint64_t v14 = [v13 count];
  if (v14 != [v10 count])
  {
    objc_super v19 = _FALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FASettingsPreset initWithDictionary:]();
    }

    goto LABEL_30;
  }
  uint64_t v15 = [v11 integerValue];
  uint64_t v16 = [v12 integerValue];
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self = [(FASettingsPreset *)self initWithIdentifier:v6 minAge:v15 maxAge:v17 sources:v13];
  v18 = self;
LABEL_31:

  return v18;
}

FASettingsPresetSource *__39__FASettingsPreset_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FASettingsPresetSource alloc] initWithDictionary:v2];

  return v3;
}

- (id)sourceWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_sources;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FASettingsPreset *)self identifier];
  id v6 = [(FASettingsPreset *)self displayName];
  int64_t v7 = [(FASettingsPreset *)self minAge];
  int64_t v8 = [(FASettingsPreset *)self maxAge];
  id v9 = [(FASettingsPreset *)self sources];
  id v10 = [v3 stringWithFormat:@"<%@: %p> ({\n identifier: %@\n displayName: %@\n age: %ld - %ld\n sources: %@\n)}", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)minAge
{
  return self->_minAge;
}

- (int64_t)maxAge
{
  return self->_maxAge;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithDictionary:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D252C000, v0, v1, "Error decoding %@", v2, v3, v4, v5, v6);
}

@end