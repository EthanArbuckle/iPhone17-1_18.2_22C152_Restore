@interface INDeviceDetail
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INDeviceDetail)initWithCoder:(id)a3;
- (INDeviceDetail)initWithIdentifier:(id)a3 deviceName:(id)a4 deviceClass:(int64_t)a5 productName:(id)a6 category:(id)a7 deviceOwner:(id)a8;
- (INPerson)deviceOwner;
- (INSpeakableString)category;
- (INSpeakableString)deviceName;
- (INSpeakableString)productName;
- (NSString)description;
- (NSString)identifier;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)deviceClass;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INDeviceDetail

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4 = a3;
  id v5 = [(INDeviceDetail *)self deviceOwner];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INDeviceDetail *)self deviceOwner];
  id v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  if ([v3 count]) {
    v6 = v3;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOwner, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (INPerson)deviceOwner
{
  return self->_deviceOwner;
}

- (INSpeakableString)category
{
  return self->_category;
}

- (INSpeakableString)productName
{
  return self->_productName;
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (INSpeakableString)deviceName
{
  return self->_deviceName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_dictionaryRepresentation
{
  v19[6] = *MEMORY[0x1E4F143B8];
  v18[0] = @"identifier";
  identifier = self->_identifier;
  uint64_t v4 = (uint64_t)identifier;
  if (!identifier)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)v4;
  v19[0] = v4;
  v18[1] = @"deviceName";
  deviceName = self->_deviceName;
  uint64_t v6 = (uint64_t)deviceName;
  if (!deviceName)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v16 = (void *)v6;
  v19[1] = v6;
  v18[2] = @"deviceClass";
  id v7 = [NSNumber numberWithInteger:self->_deviceClass];
  v19[2] = v7;
  v18[3] = @"productName";
  productName = self->_productName;
  v9 = productName;
  if (!productName)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[3] = v9;
  v18[4] = @"category";
  category = self->_category;
  v11 = category;
  if (!category)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[4] = v11;
  v18[5] = @"deviceOwner";
  deviceOwner = self->_deviceOwner;
  v13 = deviceOwner;
  if (!deviceOwner)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[5] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  if (deviceOwner)
  {
    if (category) {
      goto LABEL_13;
    }
LABEL_20:

    if (productName) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }

  if (!category) {
    goto LABEL_20;
  }
LABEL_13:
  if (productName) {
    goto LABEL_14;
  }
LABEL_21:

LABEL_14:
  if (deviceName)
  {
    if (identifier) {
      goto LABEL_16;
    }
  }
  else
  {

    if (identifier) {
      goto LABEL_16;
    }
  }

LABEL_16:

  return v14;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INDeviceDetail;
  uint64_t v6 = [(INDeviceDetail *)&v11 description];
  id v7 = [(INDeviceDetail *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INDeviceDetail *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"identifier");

  v9 = [v6 encodeObject:self->_deviceName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"deviceName");

  unint64_t v10 = self->_deviceClass - 1;
  if (v10 > 8) {
    objc_super v11 = @"unknown";
  }
  else {
    objc_super v11 = *(&off_1E551FCC8 + v10);
  }
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"deviceClass");

  v13 = [v6 encodeObject:self->_productName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"productName");

  v14 = [v6 encodeObject:self->_category];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"category");

  v15 = [v6 encodeObject:self->_deviceOwner];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"deviceOwner");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_deviceName forKey:@"deviceName"];
  [v5 encodeInteger:self->_deviceClass forKey:@"deviceClass"];
  [v5 encodeObject:self->_productName forKey:@"productName"];
  [v5 encodeObject:self->_category forKey:@"category"];
  [v5 encodeObject:self->_deviceOwner forKey:@"deviceOwner"];
}

- (INDeviceDetail)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"identifier"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
  uint64_t v10 = [v5 decodeIntegerForKey:@"deviceClass"];
  objc_super v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"productName"];
  v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
  v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"deviceOwner"];

  v14 = [(INDeviceDetail *)self initWithIdentifier:v8 deviceName:v9 deviceClass:v10 productName:v11 category:v12 deviceOwner:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (INDeviceDetail *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = self->_identifier;
      BOOL v11 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        deviceName = self->_deviceName;
        if ((deviceName == v5->_deviceName || -[INSpeakableString isEqual:](deviceName, "isEqual:"))
          && self->_deviceClass == v5->_deviceClass)
        {
          productName = self->_productName;
          if (productName == v5->_productName || -[INSpeakableString isEqual:](productName, "isEqual:"))
          {
            category = self->_category;
            if (category == v5->_category || -[INSpeakableString isEqual:](category, "isEqual:"))
            {
              deviceOwner = self->_deviceOwner;
              if (deviceOwner == v5->_deviceOwner || -[INPerson isEqual:](deviceOwner, "isEqual:")) {
                BOOL v11 = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(INSpeakableString *)self->_deviceName hash] ^ v3;
  id v5 = [NSNumber numberWithInteger:self->_deviceClass];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = v4 ^ [(INSpeakableString *)self->_productName hash] ^ v6;
  unint64_t v8 = [(INSpeakableString *)self->_category hash];
  unint64_t v9 = v7 ^ v8 ^ [(INPerson *)self->_deviceOwner hash];

  return v9;
}

- (INDeviceDetail)initWithIdentifier:(id)a3 deviceName:(id)a4 deviceClass:(int64_t)a5 productName:(id)a6 category:(id)a7 deviceOwner:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)INDeviceDetail;
  v19 = [(INDeviceDetail *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    deviceName = v19->_deviceName;
    v19->_deviceName = (INSpeakableString *)v22;

    v19->_deviceClass = a5;
    uint64_t v24 = [v16 copy];
    productName = v19->_productName;
    v19->_productName = (INSpeakableString *)v24;

    uint64_t v26 = [v17 copy];
    category = v19->_category;
    v19->_category = (INSpeakableString *)v26;

    uint64_t v28 = [v18 copy];
    deviceOwner = v19->_deviceOwner;
    v19->_deviceOwner = (INPerson *)v28;
  }
  return v19;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [v8 objectForKeyedSubscript:@"identifier"];
    uint64_t v10 = objc_opt_class();
    BOOL v11 = [v8 objectForKeyedSubscript:@"deviceName"];
    v12 = [v7 decodeObjectOfClass:v10 from:v11];

    v13 = [v8 objectForKeyedSubscript:@"deviceClass"];
    uint64_t v14 = INDeviceClassWithString(v13);

    uint64_t v15 = objc_opt_class();
    id v16 = [v8 objectForKeyedSubscript:@"productName"];
    id v17 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v18 = objc_opt_class();
    v19 = [v8 objectForKeyedSubscript:@"category"];
    uint64_t v20 = [v7 decodeObjectOfClass:v18 from:v19];

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [v8 objectForKeyedSubscript:@"deviceOwner"];
    v23 = [v7 decodeObjectOfClass:v21 from:v22];

    uint64_t v24 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v9 deviceName:v12 deviceClass:v14 productName:v17 category:v20 deviceOwner:v23];
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end