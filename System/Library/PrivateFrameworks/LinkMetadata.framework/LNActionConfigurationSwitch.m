@interface LNActionConfigurationSwitch
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionConfigurationSwitch)initWithCoder:(id)a3;
- (LNActionConfigurationSwitch)initWithParameterIdentifier:(id)a3 cases:(id)a4;
- (LNActionConfigurationSwitch)initWithWidgetFamilyCases:(id)a3;
- (NSArray)cases;
- (NSString)parameterIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionConfigurationSwitch

- (LNActionConfigurationSwitch)initWithParameterIdentifier:(id)a3 cases:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNActionConfigurationSwitch.m", 21, @"Invalid parameter not satisfying: %@", @"parameterIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNActionConfigurationSwitch.m", 22, @"Invalid parameter not satisfying: %@", @"cases" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNActionConfigurationSwitch;
  v10 = [(LNActionConfigurationSwitch *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    parameterIdentifier = v10->_parameterIdentifier;
    v10->_parameterIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    cases = v10->_cases;
    v10->_cases = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (NSArray)cases
{
  return self->_cases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cases, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

- (LNActionConfigurationSwitch)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterIdentifier"];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"cases"];

    if (v9)
    {
      self = [(LNActionConfigurationSwitch *)self initWithParameterIdentifier:v5 cases:v9];
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionConfigurationSwitch *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v7 = [(LNActionConfigurationSwitch *)self parameterIdentifier];
    id v8 = [(LNActionConfigurationSwitch *)v6 parameterIdentifier];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNActionConfigurationSwitch *)self cases];
    v16 = [(LNActionConfigurationSwitch *)v6 cases];
    id v14 = v15;
    id v17 = v16;
    uint64_t v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNActionConfigurationSwitch *)self parameterIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNActionConfigurationSwitch *)self cases];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionConfigurationSwitch *)self parameterIdentifier];
  [v4 encodeObject:v5 forKey:@"parameterIdentifier"];

  id v6 = [(LNActionConfigurationSwitch *)self cases];
  [v4 encodeObject:v6 forKey:@"cases"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(LNActionConfigurationSwitch *)self parameterIdentifier];
  uint64_t v7 = [(LNActionConfigurationSwitch *)self cases];
  id v8 = [v3 stringWithFormat:@"<%@: %p, parameterIdentifier: %@, cases: %@>", v5, self, v6, v7];

  return v8;
}

- (LNActionConfigurationSwitch)initWithWidgetFamilyCases:(id)a3
{
  return [(LNActionConfigurationSwitch *)self initWithParameterIdentifier:@"system.widgetFamily" cases:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end