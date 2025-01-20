@interface HDIDSDevice
- (BOOL)isEqual:(id)a3;
- (HDIDSDevice)initWithIDSDevice:(id)a3;
- (HDIDSDevice)initWithIdentifier:(id)a3 name:(id)a4 destinationID:(id)a5 deviceType:(int64_t)a6 buildVersion:(id)a7;
- (NSString)buildVersion;
- (NSString)destinationID;
- (NSString)identifier;
- (NSString)name;
- (int64_t)deviceType;
- (unint64_t)hash;
@end

@implementation HDIDSDevice

- (HDIDSDevice)initWithIdentifier:(id)a3 name:(id)a4 destinationID:(id)a5 deviceType:(int64_t)a6 buildVersion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HDIDSDevice;
  v16 = [(HDIDSDevice *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    name = v16->_name;
    v16->_name = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    destinationID = v16->_destinationID;
    v16->_destinationID = (NSString *)v21;

    v16->_deviceType = a6;
    uint64_t v23 = [v15 copy];
    buildVersion = v16->_buildVersion;
    v16->_buildVersion = (NSString *)v23;
  }
  return v16;
}

- (HDIDSDevice)initWithIDSDevice:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 uniqueID];
    v6 = [v4 name];
    v7 = (void *)IDSCopyIDForDevice();
    uint64_t v8 = [v4 deviceType];
    v9 = [v4 productBuildVersion];

    self = [(HDIDSDevice *)self initWithIdentifier:v5 name:v6 destinationID:v7 deviceType:v8 buildVersion:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDIDSDevice *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier != v7 && (!v7 || !-[NSString isEqualToString:](identifier, "isEqualToString:"))) {
        goto LABEL_18;
      }
      name = self->_name;
      v9 = v5->_name;
      if (name != v9 && (!v9 || !-[NSString isEqualToString:](name, "isEqualToString:"))) {
        goto LABEL_18;
      }
      destinationID = self->_destinationID;
      v11 = v5->_destinationID;
      if (destinationID != v11 && (!v11 || !-[NSString isEqualToString:](destinationID, "isEqualToString:"))) {
        goto LABEL_18;
      }
      if (self->_deviceType != v5->_deviceType) {
        goto LABEL_18;
      }
      buildVersion = self->_buildVersion;
      id v13 = v5->_buildVersion;
      if (buildVersion == v13)
      {
        char v14 = 1;
        goto LABEL_19;
      }
      if (v13) {
        char v14 = -[NSString isEqualToString:](buildVersion, "isEqualToString:");
      }
      else {
LABEL_18:
      }
        char v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    char v14 = 0;
  }
LABEL_20:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_destinationID hash];
  buildVersion = self->_buildVersion;
  int64_t v7 = v4 ^ v5 ^ self->_deviceType;
  return v7 ^ [(NSString *)buildVersion hash];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end