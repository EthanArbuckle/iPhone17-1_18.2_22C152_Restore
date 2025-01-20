@interface HKClinicalGatewayFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalGatewayFeature)init;
- (HKClinicalGatewayFeature)initWithCoder:(id)a3;
- (HKClinicalGatewayFeature)initWithName:(id)a3 minCompatibleAPIVersion:(int64_t)a4 status:(int64_t)a5 interactions:(id)a6;
- (NSArray)interactions;
- (NSString)name;
- (int64_t)minCompatibleAPIVersion;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalGatewayFeature

- (HKClinicalGatewayFeature)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalGatewayFeature)initWithName:(id)a3 minCompatibleAPIVersion:(int64_t)a4 status:(int64_t)a5 interactions:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKClinicalGatewayFeature;
  v12 = [(HKClinicalGatewayFeature *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_minCompatibleAPIVersion = a4;
    v12->_status = a5;
    uint64_t v15 = [v11 copy];
    interactions = v12->_interactions;
    v12->_interactions = (NSArray *)v15;
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKClinicalGatewayFeature *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    name = self->_name;
    id v10 = [(HKClinicalGatewayFeature *)v8 name];
    if (name != v10)
    {
      uint64_t v11 = [(HKClinicalGatewayFeature *)v8 name];
      if (!v11)
      {
        char v13 = 0;
        goto LABEL_20;
      }
      v3 = (void *)v11;
      v12 = self->_name;
      uint64_t v4 = [(HKClinicalGatewayFeature *)v8 name];
      if (![(NSString *)v12 isEqualToString:v4])
      {
        char v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    int64_t minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
    if (minCompatibleAPIVersion == [(HKClinicalGatewayFeature *)v8 minCompatibleAPIVersion])
    {
      int64_t status = self->_status;
      if (status == [(HKClinicalGatewayFeature *)v8 status])
      {
        interactions = self->_interactions;
        uint64_t v17 = [(HKClinicalGatewayFeature *)v8 interactions];
        if (interactions == (NSArray *)v17)
        {

          char v13 = 1;
          goto LABEL_18;
        }
        objc_super v18 = (void *)v17;
        uint64_t v19 = [(HKClinicalGatewayFeature *)v8 interactions];
        if (v19)
        {
          v20 = (void *)v19;
          v21 = self->_interactions;
          v22 = [(HKClinicalGatewayFeature *)v8 interactions];
          char v13 = [(NSArray *)v21 isEqualToArray:v22];

          goto LABEL_18;
        }
      }
    }
    char v13 = 0;
LABEL_18:
    if (name != v10) {
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  char v13 = 1;
LABEL_22:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = self->_minCompatibleAPIVersion ^ self->_status ^ [(NSString *)self->_name hash];
  return v3 ^ [(NSArray *)self->_interactions hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInteger:self->_minCompatibleAPIVersion forKey:@"minCompatibleAPIVersion"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeObject:self->_interactions forKey:@"interactions"];
}

- (HKClinicalGatewayFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (v5
    && [v4 containsValueForKey:@"minCompatibleAPIVersion"]
    && ([v4 containsValueForKey:@"status"] & 1) != 0)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"minCompatibleAPIVersion"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"status"];
    v8 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"interactions"];
    if (v9)
    {
      self = [(HKClinicalGatewayFeature *)self initWithName:v5 minCompatibleAPIVersion:v6 status:v7 interactions:v9];
      id v10 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      id v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v10 = 0;
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end