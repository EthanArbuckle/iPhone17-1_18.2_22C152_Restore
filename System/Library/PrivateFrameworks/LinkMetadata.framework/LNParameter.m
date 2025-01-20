@interface LNParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNParameter)initWithCoder:(id)a3;
- (LNParameter)initWithIdentifier:(id)a3 value:(id)a4;
- (LNParameter)initWithIdentifier:(id)a3 value:(id)a4 configuration:(id)a5;
- (LNParameterConfiguration)configuration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNParameter

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNProperty *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNProperty *)self value];
  [v4 encodeObject:v6 forKey:@"value"];

  id v7 = [(LNParameter *)self configuration];
  [v4 encodeObject:v7 forKey:@"configuration"];
}

- (LNParameterConfiguration)configuration
{
  return self->_configuration;
}

- (LNParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];

  v8 = [(LNParameter *)self initWithIdentifier:v5 value:v6 configuration:v7];
  return v8;
}

- (LNParameter)initWithIdentifier:(id)a3 value:(id)a4 configuration:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)LNParameter;
  v9 = [(LNProperty *)&v14 initWithIdentifier:a3 value:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    configuration = v9->_configuration;
    v9->_configuration = (LNParameterConfiguration *)v10;

    v12 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNParameter *)a3;
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
    id v7 = [(LNProperty *)self identifier];
    id v8 = [(LNProperty *)v6 identifier];
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
    v15 = [(LNProperty *)self value];
    v16 = [(LNProperty *)v6 value];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
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

- (LNParameter)initWithIdentifier:(id)a3 value:(id)a4
{
  return [(LNParameter *)self initWithIdentifier:a3 value:a4 configuration:0];
}

@end