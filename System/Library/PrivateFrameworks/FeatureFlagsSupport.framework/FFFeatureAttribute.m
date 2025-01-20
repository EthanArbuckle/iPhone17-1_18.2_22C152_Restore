@interface FFFeatureAttribute
- (BOOL)matchesAgainst:(id)a3;
- (FFFeatureAttribute)initWithName:(id)a3 value:(id)a4;
- (NSString)name;
- (NSString)value;
- (id)description;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation FFFeatureAttribute

- (FFFeatureAttribute)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)FFFeatureAttribute;
  v8 = [(FFFeatureAttribute *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(FFFeatureAttribute *)v8 setName:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = v9;
      v11 = v7;
LABEL_9:
      [(FFFeatureAttribute *)v10 setValue:v11];
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(__CFString *)v7 BOOLValue]) {
        v11 = @"true";
      }
      else {
        v11 = @"false";
      }
      v10 = v9;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v9;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(FFFeatureAttribute *)self name];
  v5 = [(FFFeatureAttribute *)self value];
  id v6 = (void *)[v3 initWithFormat:@"Attribute %@=%@", v4, v5];

  return v6;
}

- (BOOL)matchesAgainst:(id)a3
{
  id v4 = a3;
  v5 = [v4 value];
  id v6 = [(FFFeatureAttribute *)self value];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v9 = [(FFFeatureAttribute *)self value];
    v10 = [v9 lowercaseString];

    if (isBooleanYes(v10))
    {
      v11 = [v4 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      objc_super v13 = [v4 value];
      v14 = v13;
      if ((isKindOfClass & 1) == 0)
      {
        LOBYTE(v8) = [v13 BOOLValue];
        goto LABEL_15;
      }
      v15 = [v13 lowercaseString];

      char v16 = isBooleanYes(v15);
    }
    else
    {
      if (!isBooleanNo(v10))
      {
        LOBYTE(v8) = 0;
LABEL_16:

        goto LABEL_17;
      }
      v17 = [v4 value];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      v19 = [v4 value];
      v14 = v19;
      if ((v18 & 1) == 0)
      {
        if (v19)
        {
          v20 = [v4 value];
          int v8 = [v20 BOOLValue] ^ 1;
        }
        else
        {
          LOBYTE(v8) = 0;
        }
        goto LABEL_15;
      }
      v15 = [v19 lowercaseString];

      char v16 = isBooleanNo(v15);
    }
    LOBYTE(v8) = v16;
    v14 = v15;
LABEL_15:

    goto LABEL_16;
  }
  LOBYTE(v8) = 1;
LABEL_17:

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end