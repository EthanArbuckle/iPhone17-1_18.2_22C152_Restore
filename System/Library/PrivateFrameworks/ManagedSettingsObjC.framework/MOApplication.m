@interface MOApplication
+ (BOOL)isValidPersistableRepresentation:(id)a3;
+ (id)initializeWithPersistableValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOApplication)initWithBundleIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)persistableValue;
- (unint64_t)hash;
@end

@implementation MOApplication

- (id)persistableValue
{
  v3 = objc_opt_new();
  v4 = [(MOApplication *)self bundleIdentifier];

  if (v4)
  {
    v5 = [(MOApplication *)self bundleIdentifier];
    [v3 setObject:v5 forKeyedSubscript:@"bundleIdentifier"];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  id v3 = a3;
  if (+[MOApplication isValidPersistableRepresentation:v3])
  {
    v4 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
    v5 = [[MOApplication alloc] initWithBundleIdentifier:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
    BOOL v5 = 1;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        BOOL v5 = 0;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (MOApplication)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOApplication;
  v6 = [(MOApplication *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOApplication *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(MOApplication *)self bundleIdentifier];
      if (v7
        || ([(MOApplication *)v6 bundleIdentifier],
            (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v8 = [(MOApplication *)self bundleIdentifier];
        objc_super v9 = [(MOApplication *)v6 bundleIdentifier];
        char v10 = [v8 isEqualToString:v9];

        if (v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        char v10 = 1;
      }

      goto LABEL_11;
    }
    char v10 = 0;
  }
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  v2 = [(MOApplication *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = (void *)[(NSString *)self->_bundleIdentifier copy];
  v6 = (void *)[v4 initWithBundleIdentifier:v5];

  return v6;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end