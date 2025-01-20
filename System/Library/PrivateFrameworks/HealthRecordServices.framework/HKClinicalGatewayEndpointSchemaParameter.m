@interface HKClinicalGatewayEndpointSchemaParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalGatewayEndpointSchemaParameter)init;
- (HKClinicalGatewayEndpointSchemaParameter)initWithCoder:(id)a3;
- (HKClinicalGatewayEndpointSchemaParameter)initWithParam:(id)a3 literal:(id)a4 variable:(id)a5 mode:(id)a6;
- (NSArray)mode;
- (NSString)literal;
- (NSString)param;
- (NSString)variable;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalGatewayEndpointSchemaParameter

- (HKClinicalGatewayEndpointSchemaParameter)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalGatewayEndpointSchemaParameter)initWithParam:(id)a3 literal:(id)a4 variable:(id)a5 mode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKClinicalGatewayEndpointSchemaParameter;
  v14 = [(HKClinicalGatewayEndpointSchemaParameter *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    param = v14->_param;
    v14->_param = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    literal = v14->_literal;
    v14->_literal = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    variable = v14->_variable;
    v14->_variable = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    mode = v14->_mode;
    v14->_mode = (NSArray *)v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKClinicalGatewayEndpointSchemaParameter *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    param = self->_param;
    id v10 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 param];
    if (param != v10)
    {
      uint64_t v11 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 param];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      id v12 = self->_param;
      id v13 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 param];
      if (![(NSString *)v12 isEqualToString:v13])
      {
        char v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    literal = self->_literal;
    v16 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 literal];
    if (literal == v16)
    {
      v42 = literal;
    }
    else
    {
      uint64_t v17 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 literal];
      if (!v17)
      {
        char v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = literal;
      uint64_t v19 = self->_literal;
      uint64_t v4 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 literal];
      if (![(NSString *)v19 isEqualToString:v4])
      {

        char v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    variable = self->_variable;
    uint64_t v21 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 variable];
    v41 = v4;
    if (variable == v21)
    {
      v39 = v3;
      v40 = variable;
    }
    else
    {
      uint64_t v22 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 variable];
      if (!v22)
      {
        char v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:
        }
LABEL_36:

LABEL_37:
        id v13 = v43;
        if (param != v10) {
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
      v40 = variable;
      v37 = (void *)v22;
      v23 = self->_variable;
      uint64_t v24 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 variable];
      v25 = v23;
      v26 = (void *)v24;
      if (![(NSString *)v25 isEqualToString:v24])
      {

        char v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    mode = self->_mode;
    uint64_t v28 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 mode];
    char v14 = mode == (NSArray *)v28;
    if (mode == (NSArray *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      uint64_t v30 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 mode];
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_mode;
        v33 = [(HKClinicalGatewayEndpointSchemaParameter *)v8 mode];
        char v14 = [(NSArray *)v32 isEqualToArray:v33];

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }
    }
    if (v40 == v21) {
      goto LABEL_42;
    }

    v3 = v39;
    goto LABEL_33;
  }
  char v14 = 1;
LABEL_41:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_param hash];
  NSUInteger v4 = [(NSString *)self->_literal hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_variable hash];
  return v4 ^ v5 ^ [(NSArray *)self->_mode hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  param = self->_param;
  id v5 = a3;
  [v5 encodeObject:param forKey:@"param"];
  [v5 encodeObject:self->_literal forKey:@"literal"];
  [v5 encodeObject:self->_variable forKey:@"variable"];
  [v5 encodeObject:self->_mode forKey:@"mode"];
}

- (HKClinicalGatewayEndpointSchemaParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"param"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"literal"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"variable"];
    v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"mode"];
    self = [(HKClinicalGatewayEndpointSchemaParameter *)self initWithParam:v5 literal:v6 variable:v7 mode:v8];

    v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (NSString)param
{
  return self->_param;
}

- (NSString)literal
{
  return self->_literal;
}

- (NSString)variable
{
  return self->_variable;
}

- (NSArray)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_literal, 0);

  objc_storeStrong((id *)&self->_param, 0);
}

@end