@interface DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject
+ (BOOL)supportsSecureCoding;
- (DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject)initWithCoder:(id)a3;
- (NSString)deviceUDID;
- (NSString)modelIdentifier;
- (NSString)modelName;
- (NSString)serialNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setModelIdentifier:(id)a3;
- (void)setModelName:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject;
  v5 = [(CATTaskResultObject *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"deviceUDID"];
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"modelIdentifier"];
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"modelName"];
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v9 encodeWithCoder:v4];
  v5 = [(DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject *)self serialNumber];
  [v4 encodeObject:v5 forKey:@"serialNumber"];

  v6 = [(DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject *)self deviceUDID];
  [v4 encodeObject:v6 forKey:@"deviceUDID"];

  uint64_t v7 = [(DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject *)self modelIdentifier];
  [v4 encodeObject:v7 forKey:@"modelIdentifier"];

  v8 = [(DMTFetchAutomatedDeviceEnrollmentPrerequisitesResultObject *)self modelName];
  [v4 encodeObject:v8 forKey:@"modelName"];
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setModelIdentifier:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end