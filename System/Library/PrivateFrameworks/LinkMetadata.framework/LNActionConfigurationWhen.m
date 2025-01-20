@interface LNActionConfigurationWhen
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionConfiguration)otherwise;
- (LNActionConfiguration)when;
- (LNActionConfigurationCondition)condition;
- (LNActionConfigurationWhen)initWithCoder:(id)a3;
- (LNActionConfigurationWhen)initWithCondition:(id)a3 when:(id)a4 otherwise:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionConfigurationWhen

- (LNActionConfiguration)when
{
  return self->_when;
}

- (LNActionConfiguration)otherwise
{
  return self->_otherwise;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionConfigurationWhen *)self condition];
  [v4 encodeObject:v5 forKey:@"condition"];

  v6 = [(LNActionConfigurationWhen *)self when];
  [v4 encodeObject:v6 forKey:@"when"];

  id v7 = [(LNActionConfigurationWhen *)self otherwise];
  [v4 encodeObject:v7 forKey:@"otherwise"];
}

- (LNActionConfigurationCondition)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherwise, 0);
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionConfigurationWhen *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v7 = [(LNActionConfigurationWhen *)self condition];
    v8 = [(LNActionConfigurationWhen *)v6 condition];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_25;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v16 = [(LNActionConfigurationWhen *)self when];
    v17 = [(LNActionConfigurationWhen *)v6 when];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(LNActionConfigurationWhen *)self otherwise];
    v22 = [(LNActionConfigurationWhen *)v6 otherwise];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqual:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNActionConfigurationWhen *)self when];
  uint64_t v4 = [v3 hash];
  v5 = [(LNActionConfigurationWhen *)self otherwise];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (LNActionConfigurationWhen)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"condition"];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"when"];
    if (v6)
    {
      id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherwise"];
      self = [(LNActionConfigurationWhen *)self initWithCondition:v5 when:v6 otherwise:v7];

      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNActionConfigurationWhen *)self condition];
  id v7 = [(LNActionConfigurationWhen *)self when];
  v8 = [(LNActionConfigurationWhen *)self otherwise];
  id v9 = [v3 stringWithFormat:@"<%@: %p, condition: %@, when: %@, otherwise: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (LNActionConfigurationWhen)initWithCondition:(id)a3 when:(id)a4 otherwise:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNActionConfigurationWhen.m", 21, @"Invalid parameter not satisfying: %@", @"when" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNActionConfigurationWhen;
  int v12 = [(LNActionConfigurationWhen *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    condition = v12->_condition;
    v12->_condition = (LNActionConfigurationCondition *)v13;

    uint64_t v15 = [v10 copy];
    when = v12->_when;
    v12->_when = (LNActionConfiguration *)v15;

    uint64_t v17 = [v11 copy];
    otherwise = v12->_otherwise;
    v12->_otherwise = (LNActionConfiguration *)v17;

    v19 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end