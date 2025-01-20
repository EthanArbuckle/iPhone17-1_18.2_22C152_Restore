@interface WFDisplay
+ (BOOL)supportsSecureCoding;
- (NSString)UUID;
- (NSString)deviceName;
- (NSString)name;
- (NSString)serializationUUID;
- (WFDisplay)initWithCoder:(id)a3;
- (WFDisplay)initWithDisplayUUID:(id)a3 deviceName:(id)a4 name:(id)a5;
- (WFDisplay)initWithDisplayUUID:(id)a3 name:(id)a4;
- (WFDisplay)initWithDisplayUUID:(id)a3 serializationUUID:(id)a4 localizedName:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFDisplay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_serializationUUID, 0);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)serializationUUID
{
  return self->_serializationUUID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFDisplay *)self serializationUUID];
  [v4 encodeObject:v5 forKey:@"serializationUUID"];

  v6 = [(WFDisplay *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  id v7 = [(WFDisplay *)self deviceName];
  [v4 encodeObject:v7 forKey:@"deviceName"];
}

- (WFDisplay)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializationUUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];

  if (v7) {
    v8 = [(WFDisplay *)self initWithDisplayUUID:v5 deviceName:v7 name:v6];
  }
  else {
    v8 = [(WFDisplay *)self initWithDisplayUUID:v5 name:v6];
  }
  v9 = v8;

  return v9;
}

- (WFDisplay)initWithDisplayUUID:(id)a3 serializationUUID:(id)a4 localizedName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFDisplay;
  v11 = [(WFDisplay *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    UUID = v11->_UUID;
    v11->_UUID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    serializationUUID = v11->_serializationUUID;
    v11->_serializationUUID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    name = v11->_name;
    v11->_name = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (WFDisplay)initWithDisplayUUID:(id)a3 deviceName:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFDisplay;
  v11 = [(WFDisplay *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    UUID = v11->_UUID;
    v11->_UUID = (NSString *)v12;

    uint64_t v14 = [v8 copy];
    serializationUUID = v11->_serializationUUID;
    v11->_serializationUUID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    name = v11->_name;
    v11->_name = (NSString *)v16;

    uint64_t v18 = [v9 copy];
    deviceName = v11->_deviceName;
    v11->_deviceName = (NSString *)v18;

    objc_super v20 = v11;
  }

  return v11;
}

- (WFDisplay)initWithDisplayUUID:(id)a3 name:(id)a4
{
  return [(WFDisplay *)self initWithDisplayUUID:a3 serializationUUID:a3 localizedName:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end