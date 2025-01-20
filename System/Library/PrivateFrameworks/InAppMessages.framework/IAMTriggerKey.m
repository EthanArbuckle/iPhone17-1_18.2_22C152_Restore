@interface IAMTriggerKey
+ (id)nameSpacedKeyNameForName:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (IAMTriggerKey)initWithName:(id)a3 bundleIdentifier:(id)a4;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)nameSpacedKeyName;
- (id)description;
- (unint64_t)hash;
@end

@implementation IAMTriggerKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (IAMTriggerKey)initWithName:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMTriggerKey;
  v8 = [(IAMTriggerKey *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v11;
  }
  return v8;
}

- (NSString)nameSpacedKeyName
{
  return (NSString *)+[IAMTriggerKey nameSpacedKeyNameForName:self->_name bundleIdentifier:self->_bundleIdentifier];
}

+ (id)nameSpacedKeyNameForName:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 copy];
  if (v5)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@::%@", v5, v6];

    id v6 = (void *)v7;
  }

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(IAMTriggerKey *)self nameSpacedKeyName];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@: %p %@>", v5, self, v6];

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_bundleIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IAMTriggerKey *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      name = self->_name;
      uint64_t v7 = [(IAMTriggerKey *)v5 name];
      uint64_t v8 = [(NSString *)name isEqualToString:v7];

      if (v8)
      {
        bundleIdentifier = self->_bundleIdentifier;
        v10 = bundleIdentifier;
        if (!bundleIdentifier)
        {
          uint64_t v8 = [(IAMTriggerKey *)v5 bundleIdentifier];
          if (!v8)
          {
            char v12 = 1;
LABEL_13:

            goto LABEL_14;
          }
          v10 = self->_bundleIdentifier;
        }
        uint64_t v11 = [(IAMTriggerKey *)v5 bundleIdentifier];
        char v12 = [(NSString *)v10 isEqual:v11];

        if (!bundleIdentifier) {
          goto LABEL_13;
        }
      }
      else
      {
        char v12 = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    char v12 = 0;
  }
LABEL_15:

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

@end