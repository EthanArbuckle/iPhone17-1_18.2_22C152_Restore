@interface INAppIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAppIdentifier)initWithBundleIdentifier:(id)a3 bundleVersion:(id)a4 appName:(id)a5;
- (INAppIdentifier)initWithCoder:(id)a3;
- (NSString)appName;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAppIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"bundleIdentifier";
  bundleIdentifier = self->_bundleIdentifier;
  v4 = bundleIdentifier;
  if (!bundleIdentifier)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"bundleVersion";
  bundleVersion = self->_bundleVersion;
  v6 = bundleVersion;
  if (!bundleVersion)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"appName";
  appName = self->_appName;
  v8 = appName;
  if (!appName)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (appName)
  {
    if (bundleVersion) {
      goto LABEL_9;
    }
LABEL_14:

    if (bundleIdentifier) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!bundleVersion) {
    goto LABEL_14;
  }
LABEL_9:
  if (bundleIdentifier) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INAppIdentifier;
  v6 = [(INAppIdentifier *)&v11 description];
  v7 = [(INAppIdentifier *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INAppIdentifier *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_bundleIdentifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"bundleIdentifier");

  v9 = [v6 encodeObject:self->_bundleVersion];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"bundleVersion");

  v10 = [v6 encodeObject:self->_appName];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"appName");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_bundleVersion forKey:@"bundleVersion"];
  [v5 encodeObject:self->_appName forKey:@"appName"];
}

- (INAppIdentifier)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"bundleIdentifier"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"bundleVersion"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"appName"];

  v17 = [(INAppIdentifier *)self initWithBundleIdentifier:v8 bundleVersion:v12 appName:v16];
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INAppIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      bundleIdentifier = self->_bundleIdentifier;
      BOOL v9 = 0;
      if (bundleIdentifier == v5->_bundleIdentifier || -[NSString isEqual:](bundleIdentifier, "isEqual:"))
      {
        bundleVersion = self->_bundleVersion;
        if (bundleVersion == v5->_bundleVersion || -[NSString isEqual:](bundleVersion, "isEqual:"))
        {
          appName = self->_appName;
          if (appName == v5->_appName || -[NSString isEqual:](appName, "isEqual:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_bundleVersion hash] ^ v3;
  return v4 ^ [(NSString *)self->_appName hash];
}

- (INAppIdentifier)initWithBundleIdentifier:(id)a3 bundleVersion:(id)a4 appName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INAppIdentifier;
  objc_super v11 = [(INAppIdentifier *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    bundleVersion = v11->_bundleVersion;
    v11->_bundleVersion = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    appName = v11->_appName;
    v11->_appName = (NSString *)v16;
  }
  return v11;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    id v8 = [v6 objectForKeyedSubscript:@"bundleVersion"];
    id v9 = [v6 objectForKeyedSubscript:@"appName"];
    id v10 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifier:v7 bundleVersion:v8 appName:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end