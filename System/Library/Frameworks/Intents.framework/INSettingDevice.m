@interface INSettingDevice
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSettingDevice)initWithCoder:(id)a3;
- (INSettingDevice)initWithDeviceName:(id)a3 deviceModel:(id)a4 deviceCategory:(int64_t)a5;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)deviceCategory;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSettingDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (int64_t)deviceCategory
{
  return self->_deviceCategory;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (id)_dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"deviceName";
  deviceName = self->_deviceName;
  v4 = deviceName;
  if (!deviceName)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v4;
  v10[1] = @"deviceModel";
  deviceModel = self->_deviceModel;
  v6 = deviceModel;
  if (!deviceModel)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v6;
  v10[2] = @"deviceCategory";
  v7 = [NSNumber numberWithInteger:self->_deviceCategory];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  if (deviceModel)
  {
    if (deviceName) {
      goto LABEL_7;
    }
  }
  else
  {

    if (deviceName) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSettingDevice;
  v6 = [(INSettingDevice *)&v11 description];
  v7 = [(INSettingDevice *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INSettingDevice *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_deviceName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"deviceName");

  v9 = [v6 encodeObject:self->_deviceModel];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"deviceModel");
  unint64_t v10 = self->_deviceCategory - 1;
  if (v10 > 0xD) {
    objc_super v11 = @"unknown";
  }
  else {
    objc_super v11 = off_1E5520408[v10];
  }
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"deviceCategory");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v5 = a3;
  [v5 encodeObject:deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_deviceModel forKey:@"deviceModel"];
  [v5 encodeInteger:self->_deviceCategory forKey:@"deviceCategory"];
}

- (INSettingDevice)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"deviceName"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"deviceModel"];

  uint64_t v13 = [v5 decodeIntegerForKey:@"deviceCategory"];
  v14 = [(INSettingDevice *)self initWithDeviceName:v8 deviceModel:v12 deviceCategory:v13];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INSettingDevice *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      deviceName = self->_deviceName;
      BOOL v8 = (deviceName == v5->_deviceName || -[NSString isEqual:](deviceName, "isEqual:"))
        && ((deviceModel = self->_deviceModel, deviceModel == v5->_deviceModel)
         || -[NSString isEqual:](deviceModel, "isEqual:"))
        && self->_deviceCategory == v5->_deviceCategory;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceName hash];
  NSUInteger v4 = [(NSString *)self->_deviceModel hash] ^ v3;
  id v5 = [NSNumber numberWithInteger:self->_deviceCategory];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (INSettingDevice)initWithDeviceName:(id)a3 deviceModel:(id)a4 deviceCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)INSettingDevice;
  uint64_t v10 = [(INSettingDevice *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    deviceName = v10->_deviceName;
    v10->_deviceName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    deviceModel = v10->_deviceModel;
    v10->_deviceModel = (NSString *)v13;

    v10->_deviceCategory = a5;
  }

  return v10;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"deviceName"];
    id v8 = [v6 objectForKeyedSubscript:@"deviceModel"];
    id v9 = [v6 objectForKeyedSubscript:@"deviceCategory"];
    uint64_t v10 = INDeviceCategoryWithString(v9);

    uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithDeviceName:v7 deviceModel:v8 deviceCategory:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end