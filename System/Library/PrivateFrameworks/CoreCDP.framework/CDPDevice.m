@interface CDPDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)hasNumericSecret;
- (BOOL)hasRandomSecret;
- (BOOL)isCurrentDevice;
- (BOOL)isUsingMultipleiCSC;
- (BOOL)isVirtualMachine;
- (CDPDevice)initWithCoder:(id)a3;
- (NSData)simplePublicKey;
- (NSDate)recordDate;
- (NSDictionary)recordInfo;
- (NSNumber)coolOffPeriod;
- (NSNumber)numericSecretLength;
- (NSString)description;
- (NSString)deviceColor;
- (NSString)enclosureColor;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (NSString)machineID;
- (NSString)model;
- (NSString)modelClass;
- (NSString)modelVersion;
- (NSString)recordID;
- (NSString)serialNumber;
- (OTEscrowRecord)record;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)localSecretType;
- (unint64_t)platform;
- (unint64_t)recoveryStatus;
- (unint64_t)remainingAttempts;
- (void)encodeWithCoder:(id)a3;
- (void)setCoolOffPeriod:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setEnclosureColor:(id)a3;
- (void)setHasNumericSecret:(BOOL)a3;
- (void)setHasRandomSecret:(BOOL)a3;
- (void)setIsCurrentDevice:(BOOL)a3;
- (void)setIsUsingMultipleiCSC:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMachineID:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelClass:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setNumericSecretLength:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setRecord:(id)a3;
- (void)setRecordDate:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordInfo:(id)a3;
- (void)setRecoveryStatus:(unint64_t)a3;
- (void)setRemainingAttempts:(unint64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSimplePublicKey:(id)a3;
@end

@implementation CDPDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CDPDevice);
  uint64_t v5 = [(NSString *)self->_localizedName copy];
  localizedName = v4->_localizedName;
  v4->_localizedName = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_model copy];
  model = v4->_model;
  v4->_model = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_modelVersion copy];
  modelVersion = v4->_modelVersion;
  v4->_modelVersion = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_modelClass copy];
  modelClass = v4->_modelClass;
  v4->_modelClass = (NSString *)v11;

  v4->_platform = self->_platform;
  uint64_t v13 = [(NSString *)self->_recordID copy];
  recordID = v4->_recordID;
  v4->_recordID = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_machineID copy];
  machineID = v4->_machineID;
  v4->_machineID = (NSString *)v15;

  uint64_t v17 = [(NSData *)self->_simplePublicKey copy];
  simplePublicKey = v4->_simplePublicKey;
  v4->_simplePublicKey = (NSData *)v17;

  uint64_t v19 = [(NSDictionary *)self->_recordInfo copy];
  recordInfo = v4->_recordInfo;
  v4->_recordInfo = (NSDictionary *)v19;

  uint64_t v21 = [(OTEscrowRecord *)self->_record copy];
  record = v4->_record;
  v4->_record = (OTEscrowRecord *)v21;

  uint64_t v23 = [(NSDate *)self->_recordDate copy];
  recordDate = v4->_recordDate;
  v4->_recordDate = (NSDate *)v23;

  v4->_hasRandomSecret = self->_hasRandomSecret;
  v4->_hasNumericSecret = self->_hasNumericSecret;
  uint64_t v25 = [(NSNumber *)self->_numericSecretLength copy];
  numericSecretLength = v4->_numericSecretLength;
  v4->_numericSecretLength = (NSNumber *)v25;

  v4->_isUsingMultipleiCSC = self->_isUsingMultipleiCSC;
  v4->_remainingAttempts = self->_remainingAttempts;
  uint64_t v27 = [(NSString *)self->_serialNumber copy];
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v27;

  v4->_isCurrentDevice = self->_isCurrentDevice;
  objc_storeStrong((id *)&v4->_deviceColor, self->_deviceColor);
  objc_storeStrong((id *)&v4->_enclosureColor, self->_enclosureColor);
  return v4;
}

- (NSString)description
{
  unint64_t platform = self->_platform;
  v4 = @"Unknown";
  if (platform == 2) {
    v4 = @"OSX";
  }
  if (platform == 1) {
    uint64_t v5 = @"iOS";
  }
  else {
    uint64_t v5 = v4;
  }
  v18 = v5;
  uint64_t v19 = NSString;
  v6 = [(id)objc_opt_class() description];
  uint64_t v7 = [NSNumber numberWithInt:self->_machineID != 0];
  v8 = [NSNumber numberWithInt:self->_simplePublicKey != 0];
  recordID = self->_recordID;
  localizedName = self->_localizedName;
  model = self->_model;
  v12 = NSNumber;
  recordDate = self->_recordDate;
  v14 = [(NSDictionary *)self->_recordInfo objectForKeyedSubscript:@"encodedMetadata"];
  uint64_t v15 = [v12 numberWithInt:v14 != 0];
  v16 = [v19 stringWithFormat:@"<%@: %p - hasMID=%@ isBottled=%@ recordID=%@ name=%@ model=%@ platform=%@ date=%@ encodedMetadata=%@>", v6, self, v7, v8, recordID, localizedName, model, v18, recordDate, v15];

  return (NSString *)v16;
}

- (CDPDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDPDevice *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizedName"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_model"];
    model = v5->_model;
    v5->_model = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modelVersion"];
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modelClass"];
    modelClass = v5->_modelClass;
    v5->_modelClass = (NSString *)v12;

    v5->_unint64_t platform = [v4 decodeIntegerForKey:@"_platform"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordID"];
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_machineID"];
    machineID = v5->_machineID;
    v5->_machineID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordDate"];
    recordDate = v5->_recordDate;
    v5->_recordDate = (NSDate *)v18;

    v5->_hasRandomSecret = [v4 decodeBoolForKey:@"_hasRandomSecret"];
    v5->_hasNumericSecret = [v4 decodeBoolForKey:@"_hasNumericSecret"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_numericSecretLength"];
    numericSecretLength = v5->_numericSecretLength;
    v5->_numericSecretLength = (NSNumber *)v20;

    v5->_isUsingMultipleiCSC = [v4 decodeBoolForKey:@"_isUsingMultipleiCSC"];
    v5->_remainingAttempts = [v4 decodeIntegerForKey:@"_remainingAttempts"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v22;

    v5->_isCurrentDevice = [v4 decodeBoolForKey:@"_isCurrentDevice"];
    v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"recordInfo"];
    recordInfo = v5->_recordInfo;
    v5->_recordInfo = (NSDictionary *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceColor"];
    deviceColor = v5->_deviceColor;
    v5->_deviceColor = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_enclosureColor"];
    enclosureColor = v5->_enclosureColor;
    v5->_enclosureColor = (NSString *)v35;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localizedName = self->_localizedName;
  id v5 = a3;
  [v5 encodeObject:localizedName forKey:@"_localizedName"];
  [v5 encodeObject:self->_model forKey:@"_model"];
  [v5 encodeObject:self->_modelVersion forKey:@"_modelVersion"];
  [v5 encodeObject:self->_modelClass forKey:@"_modelClass"];
  [v5 encodeInteger:self->_platform forKey:@"_platform"];
  [v5 encodeObject:self->_recordID forKey:@"_recordID"];
  [v5 encodeObject:self->_machineID forKey:@"_machineID"];
  [v5 encodeObject:self->_recordDate forKey:@"_recordDate"];
  [v5 encodeBool:self->_hasRandomSecret forKey:@"_hasRandomSecret"];
  [v5 encodeBool:self->_hasNumericSecret forKey:@"_hasNumericSecret"];
  [v5 encodeObject:self->_numericSecretLength forKey:@"_numericSecretLength"];
  [v5 encodeBool:self->_isUsingMultipleiCSC forKey:@"_isUsingMultipleiCSC"];
  [v5 encodeInteger:self->_remainingAttempts forKey:@"_remainingAttempts"];
  [v5 encodeObject:self->_serialNumber forKey:@"_serialNumber"];
  [v5 encodeBool:self->_isCurrentDevice forKey:@"_isCurrentDevice"];
  [v5 encodeObject:self->_recordInfo forKey:@"recordInfo"];
  [v5 encodeObject:self->_deviceColor forKey:@"_deviceColor"];
  [v5 encodeObject:self->_enclosureColor forKey:@"_enclosureColor"];
}

- (unint64_t)localSecretType
{
  unint64_t platform = self->_platform;
  if (platform == 1) {
    return 1;
  }
  else {
    return 2 * (platform == 2);
  }
}

- (BOOL)isVirtualMachine
{
  return +[CDPUtilities isVirtualMachine];
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelClass
{
  return self->_modelClass;
}

- (void)setModelClass:(id)a3
{
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_unint64_t platform = a3;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)machineID
{
  return self->_machineID;
}

- (void)setMachineID:(id)a3
{
}

- (NSDate)recordDate
{
  return self->_recordDate;
}

- (void)setRecordDate:(id)a3
{
}

- (BOOL)hasRandomSecret
{
  return self->_hasRandomSecret;
}

- (void)setHasRandomSecret:(BOOL)a3
{
  self->_hasRandomSecret = a3;
}

- (BOOL)hasNumericSecret
{
  return self->_hasNumericSecret;
}

- (void)setHasNumericSecret:(BOOL)a3
{
  self->_hasNumericSecret = a3;
}

- (NSNumber)numericSecretLength
{
  return self->_numericSecretLength;
}

- (void)setNumericSecretLength:(id)a3
{
}

- (BOOL)isUsingMultipleiCSC
{
  return self->_isUsingMultipleiCSC;
}

- (void)setIsUsingMultipleiCSC:(BOOL)a3
{
  self->_isUsingMultipleiCSC = a3;
}

- (unint64_t)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(unint64_t)a3
{
  self->_remainingAttempts = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (BOOL)isCurrentDevice
{
  return self->_isCurrentDevice;
}

- (void)setIsCurrentDevice:(BOOL)a3
{
  self->_isCurrentDevice = a3;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)enclosureColor
{
  return self->_enclosureColor;
}

- (void)setEnclosureColor:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (unint64_t)recoveryStatus
{
  return self->_recoveryStatus;
}

- (void)setRecoveryStatus:(unint64_t)a3
{
  self->_recoveryStatus = a3;
}

- (NSNumber)coolOffPeriod
{
  return self->_coolOffPeriod;
}

- (void)setCoolOffPeriod:(id)a3
{
}

- (NSDictionary)recordInfo
{
  return self->_recordInfo;
}

- (void)setRecordInfo:(id)a3
{
}

- (OTEscrowRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (NSData)simplePublicKey
{
  return self->_simplePublicKey;
}

- (void)setSimplePublicKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coolOffPeriod, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_numericSecretLength, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordInfo, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
  objc_storeStrong((id *)&self->_simplePublicKey, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end