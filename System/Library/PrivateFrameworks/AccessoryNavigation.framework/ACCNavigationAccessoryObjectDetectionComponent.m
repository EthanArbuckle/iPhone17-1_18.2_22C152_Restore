@interface ACCNavigationAccessoryObjectDetectionComponent
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSArray)supportedTypes;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSupportedTypes:(id)a3;
@end

@implementation ACCNavigationAccessoryObjectDetectionComponent

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    unint64_t identifier = self->_identifier;
    if (identifier == [v5 identifier])
    {
      name = self->_name;
      v8 = [v5 name];
      if ([(NSString *)name isEqualToString:v8]
        && (int isEnabled = self->_isEnabled, isEnabled == [v5 isEnabled]))
      {
        supportedTypes = self->_supportedTypes;
        v11 = [v5 supportedTypes];
        char v12 = [(NSArray *)supportedTypes isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_supportedTypes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@ ", *(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v9 = [NSString stringWithFormat:@"<ACCNavigationAccessoryObjectDetectionComponent - name: %@, identifier: %d, isEnabled: %d>, supportedTypes: %@>", self->_name, self->_identifier, self->_isEnabled, v3, (void)v11];

  return v9;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_int isEnabled = a3;
}

- (NSArray)supportedTypes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSupportedTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end