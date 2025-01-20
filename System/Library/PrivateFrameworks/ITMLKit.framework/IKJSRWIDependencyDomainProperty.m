@interface IKJSRWIDependencyDomainProperty
+ (id)propertyNameMapping;
+ (id)typeMapping;
- (BOOL)isRequired;
- (IKJSRWIDependencyDomain)domain;
- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3;
- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3 forDomain:(id)a4;
- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3 forType:(id)a4;
- (IKJSRWIDependencyDomainType)domainType;
- (NSString)name;
- (NSString)propertyType;
- (NSString)purpose;
- (id)methodParameterString;
- (id)propertyDefinitionString;
@end

@implementation IKJSRWIDependencyDomainProperty

+ (id)typeMapping
{
  return &unk_1F3E3E050;
}

+ (id)propertyNameMapping
{
  return &unk_1F3E3E078;
}

- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3 forType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 domain];
  v9 = [(IKJSRWIDependencyDomainProperty *)self initWithPropertyDictionary:v7 forDomain:v8];

  if (v9) {
    objc_storeWeak((id *)&v9->_domainType, v6);
  }

  return v9;
}

- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3 forDomain:(id)a4
{
  id v6 = a4;
  id v7 = [(IKJSRWIDependencyDomainProperty *)self initWithPropertyDictionary:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_domain, v6);
  }

  return v8;
}

- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IKJSRWIDependencyDomainProperty;
  v5 = [(IKJSRWIDependencyDomainProperty *)&v24 init];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() propertyNameMapping];
    id v7 = [v4 objectForKey:@"name"];
    v8 = [v6 objectForKey:v7];
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v10 = [v4 objectForKey:@"name"];
    }
    name = v5->_name;
    v5->_name = v10;

    uint64_t v12 = [v4 objectForKey:@"description"];
    purpose = v5->_purpose;
    v5->_purpose = (NSString *)v12;

    v14 = [v4 objectForKey:@"optional"];
    if (v14)
    {
      v15 = [v4 objectForKey:@"optional"];
      v5->_required = [v15 BOOLValue] ^ 1;
    }
    else
    {
      v5->_required = 1;
    }

    v16 = @"$ref";
    uint64_t v17 = [v4 objectForKey:@"$ref"];
    reference = v5->_reference;
    v5->_reference = (NSString *)v17;

    uint64_t v19 = [v4 objectForKey:@"enum"];
    enumOptions = v5->_enumOptions;
    v5->_enumOptions = (NSArray *)v19;

    if (!v5->_reference)
    {
      if (!v5->_enumOptions)
      {
        uint64_t v23 = [v4 objectForKey:@"type"];
        propertyType = v5->_propertyType;
        v5->_propertyType = (NSString *)v23;
        goto LABEL_12;
      }
      v16 = @"enum";
    }
    propertyType = v5->_propertyType;
    v5->_propertyType = &v16->isa;
LABEL_12:
  }
  return v5;
}

- (id)propertyDefinitionString
{
  return 0;
}

- (id)methodParameterString
{
  v3 = [(IKJSRWIDependencyDomainProperty *)self propertyType];
  int v4 = [v3 isEqualToString:@"enum"];

  if (v4)
  {
    v5 = [(IKJSRWIDependencyDomainProperty *)self domainType];
    id v6 = [v5 name];
    id v7 = [(IKJSRWIDependencyDomainProperty *)self name];
    v8 = objc_msgSend(v7, "ikrwi_camelCase");
    uint64_t v9 = [v6 stringByAppendingString:v8];
LABEL_3:
    v10 = (void *)v9;

LABEL_4:
    goto LABEL_18;
  }
  v11 = [(IKJSRWIDependencyDomainProperty *)self propertyType];
  int v12 = [v11 isEqualToString:@"$ref"];

  if (!v12)
  {
    v5 = [(id)objc_opt_class() typeMapping];
    id v6 = [(IKJSRWIDependencyDomainProperty *)self propertyType];
    uint64_t v16 = [v5 objectForKey:v6];
    goto LABEL_17;
  }
  id v6 = [(NSString *)self->_reference componentsSeparatedByString:@"."];
  if ([v6 count] == 1)
  {
    v13 = [(IKJSRWIDependencyDomainProperty *)self domain];
    v14 = [v13 types];
    uint64_t v15 = [v6 firstObject];
  }
  else
  {
    if ([v6 count] != 2)
    {
      v5 = 0;
      goto LABEL_13;
    }
    uint64_t v17 = +[IKJSRWIDependencyDomain allDomains];
    v18 = [v6 objectAtIndex:0];
    v13 = [v17 objectForKey:v18];

    v14 = [v13 types];
    uint64_t v15 = [v6 objectAtIndex:1];
  }
  uint64_t v19 = (void *)v15;
  v5 = [v14 objectForKey:v15];

LABEL_13:
  v20 = [v5 domainType];
  int v21 = [v20 isEqualToString:@"object"];

  if (v21)
  {
    id v7 = [v5 name];
    v10 = [v7 stringByAppendingString:@" *"];
    goto LABEL_4;
  }
  v22 = [v5 domainType];
  int v23 = [v22 isEqualToString:@"enum"];

  if (!v23)
  {
    id v7 = [(id)objc_opt_class() typeMapping];
    v8 = [v5 domainType];
    uint64_t v9 = [v7 objectForKey:v8];
    goto LABEL_3;
  }
  uint64_t v16 = [v5 name];
LABEL_17:
  v10 = (void *)v16;
LABEL_18:

  if (v10)
  {
    if (![(IKJSRWIDependencyDomainProperty *)self isRequired])
    {
      uint64_t v24 = [NSString stringWithFormat:@"%@*", v10];

      v10 = (void *)v24;
    }
    v25 = NSString;
    v26 = [(IKJSRWIDependencyDomainProperty *)self name];
    v27 = [v25 stringWithFormat:@"(%@)%@", v10, v26];
  }
  else
  {
    v27 = 0;
  }
  return v27;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (NSString)propertyType
{
  return self->_propertyType;
}

- (IKJSRWIDependencyDomainType)domainType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainType);
  return (IKJSRWIDependencyDomainType *)WeakRetained;
}

- (IKJSRWIDependencyDomain)domain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  return (IKJSRWIDependencyDomain *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_domain);
  objc_destroyWeak((id *)&self->_domainType);
  objc_storeStrong((id *)&self->_propertyType, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_enumOptions, 0);
  objc_storeStrong((id *)&self->_reference, 0);
}

@end