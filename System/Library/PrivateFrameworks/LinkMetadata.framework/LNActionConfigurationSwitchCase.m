@interface LNActionConfigurationSwitchCase
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefaultCase;
- (BOOL)isEqual:(id)a3;
- (LNActionConfiguration)configuration;
- (LNActionConfigurationSwitchCase)initWithCoder:(id)a3;
- (LNActionConfigurationSwitchCase)initWithDefaultConfiguration:(id)a3;
- (LNActionConfigurationSwitchCase)initWithValue:(id)a3 configuration:(id)a4;
- (LNActionConfigurationSwitchCase)initWithWidgetFamilies:(id)a3 configuration:(id)a4;
- (LNActionConfigurationSwitchCase)initWithWidgetFamily:(id)a3 configuration:(id)a4;
- (LNValue)value;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionConfigurationSwitchCase

- (BOOL)isDefaultCase
{
  return self->_defaultCase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (LNValue)value
{
  return self->_value;
}

- (LNActionConfiguration)configuration
{
  return self->_configuration;
}

- (LNActionConfigurationSwitchCase)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  if (v5)
  {
    if ([v4 decodeBoolForKey:@"defaultCase"])
    {
      self = [(LNActionConfigurationSwitchCase *)self initWithDefaultConfiguration:v5];
    }
    else
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
      self = [(LNActionConfigurationSwitchCase *)self initWithValue:v7 configuration:v5];
    }
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (LNActionConfigurationSwitchCase)initWithDefaultConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNActionConfigurationSwitchCase.m", 48, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNActionConfigurationSwitchCase;
  v6 = [(LNActionConfigurationSwitchCase *)&v14 init];
  v7 = v6;
  if (v6)
  {
    value = v6->_value;
    v6->_value = 0;

    v7->_defaultCase = 1;
    uint64_t v9 = [v5 copy];
    configuration = v7->_configuration;
    v7->_configuration = (LNActionConfiguration *)v9;

    v11 = v7;
  }

  return v7;
}

- (LNActionConfigurationSwitchCase)initWithValue:(id)a3 configuration:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNActionConfigurationSwitchCase.m", 18, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNActionConfigurationSwitchCase;
  v10 = [(LNActionConfigurationSwitchCase *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_value, a3);
    v11->_defaultCase = 0;
    uint64_t v12 = [v9 copy];
    configuration = v11->_configuration;
    v11->_configuration = (LNActionConfiguration *)v12;

    objc_super v14 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionConfigurationSwitchCase *)a3;
  id v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_22:

      goto LABEL_23;
    }
    v7 = [(LNActionConfigurationSwitchCase *)self value];
    id v8 = [(LNActionConfigurationSwitchCase *)v6 value];
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
        goto LABEL_20;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    v16 = [(LNActionConfigurationSwitchCase *)self configuration];
    objc_super v17 = [(LNActionConfigurationSwitchCase *)v6 configuration];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      if (!v14 || !v18)
      {

        LOBYTE(v12) = 0;
        goto LABEL_20;
      }
      int v12 = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_20;
      }
    }
    BOOL v19 = [(LNActionConfigurationSwitchCase *)self isDefaultCase];
    int v12 = v19 ^ [(LNActionConfigurationSwitchCase *)v6 isDefaultCase] ^ 1;
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v12) = 1;
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNActionConfigurationSwitchCase *)self value];
  uint64_t v4 = [v3 hash];
  id v5 = [(LNActionConfigurationSwitchCase *)self configuration];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(LNActionConfigurationSwitchCase *)self value];
  [v6 encodeObject:v4 forKey:@"value"];

  id v5 = [(LNActionConfigurationSwitchCase *)self configuration];
  [v6 encodeObject:v5 forKey:@"configuration"];

  objc_msgSend(v6, "encodeBool:forKey:", -[LNActionConfigurationSwitchCase isDefaultCase](self, "isDefaultCase"), @"defaultCase");
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(LNActionConfigurationSwitchCase *)self value];
  v7 = [(LNActionConfigurationSwitchCase *)self configuration];
  BOOL v8 = [(LNActionConfigurationSwitchCase *)self isDefaultCase];
  id v9 = @"NO";
  if (v8) {
    id v9 = @"YES";
  }
  id v10 = [v3 stringWithFormat:@"<%@: %p, value: %@, configuration: %@, default: %@>", v5, self, v6, v7, v9];

  return v10;
}

- (LNActionConfigurationSwitchCase)initWithWidgetFamilies:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a3, "if_map:", &__block_literal_global_4938);
  BOOL v8 = [LNValue alloc];
  id v9 = +[LNPrimitiveValueType stringValueType];
  id v10 = [(LNValue *)v8 initWithValues:v7 memberValueType:v9];
  v11 = [(LNActionConfigurationSwitchCase *)self initWithValue:v10 configuration:v6];

  return v11;
}

LNValue *__72__LNActionConfigurationSwitchCase_initWithWidgetFamilies_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [LNValue alloc];
  uint64_t v4 = +[LNPrimitiveValueType stringValueType];
  id v5 = [(LNValue *)v3 initWithValue:v2 valueType:v4];

  return v5;
}

- (LNActionConfigurationSwitchCase)initWithWidgetFamily:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [LNValue alloc];
  id v9 = +[LNPrimitiveValueType stringValueType];
  id v10 = [(LNValue *)v8 initWithValue:v7 valueType:v9];

  v11 = [(LNActionConfigurationSwitchCase *)self initWithValue:v10 configuration:v6];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end