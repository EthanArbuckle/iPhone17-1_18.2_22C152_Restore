@interface MOCategory
+ (BOOL)isValidPersistableRepresentation:(id)a3;
+ (MOCategory)all;
+ (id)initializeWithPersistableValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOCategory)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)persistableValue;
- (unint64_t)hash;
@end

@implementation MOCategory

- (id)persistableValue
{
  v3 = objc_opt_new();
  v4 = [(MOCategory *)self identifier];

  if (v4)
  {
    v5 = [(MOCategory *)self identifier];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  id v3 = a3;
  if (+[MOCategory isValidPersistableRepresentation:v3])
  {
    v4 = [v3 objectForKeyedSubscript:@"identifier"];
    v5 = [[MOCategory alloc] initWithIdentifier:v4];
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
    v4 = [v3 objectForKeyedSubscript:@"identifier"];
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

- (MOCategory)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOCategory;
  v6 = [(MOCategory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

+ (MOCategory)all
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:@"all"];
  return (MOCategory *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOCategory *)a3;
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
      v7 = [(MOCategory *)self identifier];
      if (v7 || ([(MOCategory *)v6 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v8 = [(MOCategory *)self identifier];
        objc_super v9 = [(MOCategory *)v6 identifier];
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
  v2 = [(MOCategory *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(MOCategory *)self identifier];
  v6 = (void *)[v5 copy];
  v7 = (void *)[v4 initWithIdentifier:v6];

  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end