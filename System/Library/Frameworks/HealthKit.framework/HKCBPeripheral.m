@interface HKCBPeripheral
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKCBPeripheral)initWithCBPeripheral:(id)a3;
- (HKCBPeripheral)initWithCoder:(id)a3;
- (NSDictionary)properties;
- (NSString)name;
- (NSUUID)identifier;
- (id)_initWithIdentifer:(id)a3 name:(id)a4 properties:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCBPeripheral

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HKCBPeripheral *)self identifier];
  v7 = [(HKCBPeripheral *)self name];
  v8 = [(HKCBPeripheral *)self properties];
  v9 = (void *)[v5 _initWithIdentifer:v6 name:v7 properties:v8];

  if (v9)
  {
    v10 = [(HKCBPeripheral *)self name];
    uint64_t v11 = [v10 copyWithZone:a3];
    v12 = (void *)v9[1];
    v9[1] = v11;

    v13 = [(HKCBPeripheral *)self identifier];
    uint64_t v14 = [v13 copyWithZone:a3];
    v15 = (void *)v9[2];
    v9[2] = v14;

    v16 = [(HKCBPeripheral *)self properties];
    uint64_t v17 = [v16 copyWithZone:a3];
    v18 = (void *)v9[3];
    v9[3] = v17;
  }
  return v9;
}

- (id)_initWithIdentifer:(id)a3 name:(id)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKCBPeripheral;
  uint64_t v11 = [(HKCBPeripheral *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    properties = v11->_properties;
    v11->_properties = (NSDictionary *)v16;
  }
  return v11;
}

- (HKCBPeripheral)initWithCBPeripheral:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = objc_msgSend(v4, "customPropertyNames", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v4 customProperty:v11];
        [v5 setObject:v12 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v13 = [v4 identifier];
  uint64_t v14 = [v4 name];
  v15 = [(HKCBPeripheral *)self _initWithIdentifer:v13 name:v14 properties:v5];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKCBPeripheral *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      uint64_t v7 = v4;
      LODWORD(identifier) = [(NSUUID *)identifier isEqual:v6];
      name = self->_name;
      uint64_t v9 = v7->_name;

      int v10 = identifier & [(NSString *)name isEqual:v9];
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (HKCBPeripheral)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKCBPeripheral;
  id v5 = [(HKCBPeripheral *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HealthPeripheralName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HealthPeripheralIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HealthPeripheralIProperties"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"HealthPeripheralName"];
  [v5 encodeObject:self->_identifier forKey:@"HealthPeripheralIdentifier"];
  [v5 encodeObject:self->_properties forKey:@"HealthPeripheralIProperties"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  name = self->_name;
  uint64_t v7 = [(NSUUID *)self->_identifier UUIDString];
  uint64_t v8 = [v3 stringWithFormat:@"%@ (%@) %@ %@", v5, name, v7, self->_properties];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end