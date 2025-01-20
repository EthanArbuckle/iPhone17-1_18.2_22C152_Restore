@interface MOWebDomain
+ (BOOL)compareDomain:(id)a3 withDomainPattern:(id)a4 outExactMatch:(BOOL *)a5;
+ (BOOL)isValidPersistableRepresentation:(id)a3;
+ (id)initializeWithPersistableValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOWebDomain)initWithDomain:(id)a3;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)persistableValue;
- (unint64_t)hash;
@end

@implementation MOWebDomain

- (id)persistableValue
{
  v3 = objc_opt_new();
  v4 = [(MOWebDomain *)self domain];

  if (v4)
  {
    v5 = [(MOWebDomain *)self domain];
    [v3 setObject:v5 forKeyedSubscript:@"domain"];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  id v3 = a3;
  if (+[MOWebDomain isValidPersistableRepresentation:v3])
  {
    v4 = [v3 objectForKeyedSubscript:@"domain"];
    v5 = [[MOWebDomain alloc] initWithDomain:v4];
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
    v4 = [v3 objectForKeyedSubscript:@"domain"];
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

- (MOWebDomain)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOWebDomain;
  v6 = [(MOWebDomain *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_domain, a3);
  }

  return v7;
}

+ (BOOL)compareDomain:(id)a3 withDomainPattern:(id)a4 outExactMatch:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 caseInsensitiveCompare:v8])
  {
    BOOL v12 = 1;
    BOOL v13 = 1;
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v9 = v7;
  [v9 rangeOfString:@"www." options:9];
  if (v10)
  {
    v11 = [v9 substringFromIndex:4];

    if (![v11 caseInsensitiveCompare:v8])
    {
      BOOL v12 = 1;
      BOOL v13 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    v11 = v9;
  }
  if ([v8 hasPrefix:@"*."])
  {
    v14 = [v8 substringFromIndex:2];
    if ([v11 caseInsensitiveCompare:v14])
    {
      uint64_t v15 = [v8 substringFromIndex:1];

      [v11 rangeOfString:v15 options:13];
      BOOL v13 = v16 != 0;
      v14 = (void *)v15;
    }
    else
    {
      BOOL v13 = 1;
    }

    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }
LABEL_14:

  if (a5) {
LABEL_15:
  }
    *a5 = v12;
LABEL_16:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOWebDomain *)a3;
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
      id v7 = [(MOWebDomain *)self domain];
      if (v7 || ([(MOWebDomain *)v6 domain], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v8 = [(MOWebDomain *)self domain];
        id v9 = [(MOWebDomain *)v6 domain];
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
  v2 = [(MOWebDomain *)self domain];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(MOWebDomain *)self domain];
  v6 = (void *)[v5 copy];
  id v7 = (void *)[v4 initWithDomain:v6];

  return v7;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end