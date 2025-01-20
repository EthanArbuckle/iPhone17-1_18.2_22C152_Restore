@interface AKRemoteDevice
+ (BOOL)supportsSecureCoding;
- (AKDeviceSafetyRestrictionState)deviceRestrictionState;
- (AKRemoteDevice)initWithCoder:(id)a3;
- (AKRemoteDevice)initWithInfo:(id)a3;
- (BOOL)inCircle;
- (BOOL)trusted;
- (NSDate)deletedDate;
- (NSDate)lastCacheUpdatedDate;
- (NSDate)lastUpdatedDate;
- (NSDictionary)additionalInfo;
- (NSString)backingColorCode;
- (NSString)buildNumber;
- (NSString)colorCode;
- (NSString)coverGlassColorCode;
- (NSString)enclosureColorCode;
- (NSString)housingColorCode;
- (NSString)machineId;
- (NSString)model;
- (NSString)name;
- (NSString)operatingSystemName;
- (NSString)operatingSystemVersion;
- (NSString)pushToken;
- (NSString)serialNumber;
- (NSString)services;
- (id)description;
- (int64_t)removalReason;
- (void)_initWithInfo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setBackingColorCode:(id)a3;
- (void)setBuildNumber:(id)a3;
- (void)setColorCode:(id)a3;
- (void)setCoverGlassColorCode:(id)a3;
- (void)setDeletedDate:(id)a3;
- (void)setDeviceRestrictionState:(id)a3;
- (void)setEnclosureColorCode:(id)a3;
- (void)setHousingColorCode:(id)a3;
- (void)setInCircle:(BOOL)a3;
- (void)setLastCacheUpdatedDate:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setMachineId:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setOperatingSystemName:(id)a3;
- (void)setOperatingSystemVersion:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRemovalReason:(int64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setServices:(id)a3;
- (void)setTrusted:(BOOL)a3;
@end

@implementation AKRemoteDevice

- (AKRemoteDevice)initWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [(AKRemoteDevice *)self init];
  v6 = v5;
  if (v5) {
    [(AKRemoteDevice *)v5 _initWithInfo:v4];
  }

  return v6;
}

- (void)_initWithInfo:(id)a3
{
  id v74 = a3;
  objc_opt_class();
  id v4 = [v74 objectForKeyedSubscript:@"name"];
  if (objc_opt_isKindOfClass()) {
    v5 = (NSString *)v4;
  }
  else {
    v5 = 0;
  }

  name = self->_name;
  self->_name = v5;

  objc_opt_class();
  id v7 = [v74 objectForKeyedSubscript:@"serialNumber"];
  if (objc_opt_isKindOfClass()) {
    v8 = (NSString *)v7;
  }
  else {
    v8 = 0;
  }

  serialNumber = self->_serialNumber;
  self->_serialNumber = v8;

  objc_opt_class();
  id v10 = [v74 objectForKeyedSubscript:@"buildNumber"];
  if (objc_opt_isKindOfClass()) {
    v11 = (NSString *)v10;
  }
  else {
    v11 = 0;
  }

  buildNumber = self->_buildNumber;
  self->_buildNumber = v11;

  objc_opt_class();
  id v13 = [v74 objectForKeyedSubscript:@"os"];
  if (objc_opt_isKindOfClass()) {
    v14 = (NSString *)v13;
  }
  else {
    v14 = 0;
  }

  operatingSystemName = self->_operatingSystemName;
  self->_operatingSystemName = v14;

  objc_opt_class();
  id v16 = [v74 objectForKeyedSubscript:@"osVersion"];
  if (objc_opt_isKindOfClass()) {
    v17 = (NSString *)v16;
  }
  else {
    v17 = 0;
  }

  operatingSystemVersion = self->_operatingSystemVersion;
  self->_operatingSystemVersion = v17;

  objc_opt_class();
  id v19 = [v74 objectForKeyedSubscript:@"model"];
  if (objc_opt_isKindOfClass()) {
    v20 = (NSString *)v19;
  }
  else {
    v20 = 0;
  }

  model = self->_model;
  self->_model = v20;

  objc_opt_class();
  id v22 = [v74 objectForKeyedSubscript:@"mid"];
  if (objc_opt_isKindOfClass()) {
    v23 = (NSString *)v22;
  }
  else {
    v23 = 0;
  }

  machineId = self->_machineId;
  self->_machineId = v23;

  objc_opt_class();
  id v25 = [v74 objectForKeyedSubscript:@"ptkn"];
  if (objc_opt_isKindOfClass()) {
    v26 = (NSString *)v25;
  }
  else {
    v26 = 0;
  }

  pushToken = self->_pushToken;
  self->_pushToken = v26;

  v28 = (void *)MEMORY[0x1E4F1C9C8];
  objc_opt_class();
  id v29 = [v74 objectForKeyedSubscript:@"lastUpdatedDate"];
  if (objc_opt_isKindOfClass()) {
    id v30 = v29;
  }
  else {
    id v30 = 0;
  }

  [v30 doubleValue];
  v32 = [v28 dateWithTimeIntervalSince1970:v31 / 1000.0];
  lastUpdatedDate = self->_lastUpdatedDate;
  self->_lastUpdatedDate = v32;

  objc_opt_class();
  id v34 = [v74 objectForKeyedSubscript:@"trusted"];
  if (objc_opt_isKindOfClass()) {
    id v35 = v34;
  }
  else {
    id v35 = 0;
  }

  self->_trusted = [v35 BOOLValue];
  objc_opt_class();
  id v36 = [v74 objectForKeyedSubscript:@"circleStatus"];
  if (objc_opt_isKindOfClass()) {
    id v37 = v36;
  }
  else {
    id v37 = 0;
  }

  self->_inCircle = [v37 BOOLValue];
  objc_opt_class();
  id v38 = [v74 objectForKeyedSubscript:@"dc"];
  if (objc_opt_isKindOfClass()) {
    v39 = (NSString *)v38;
  }
  else {
    v39 = 0;
  }

  colorCode = self->_colorCode;
  self->_colorCode = v39;

  objc_opt_class();
  id v41 = [v74 objectForKeyedSubscript:@"dec"];
  if (objc_opt_isKindOfClass()) {
    v42 = (NSString *)v41;
  }
  else {
    v42 = 0;
  }

  enclosureColorCode = self->_enclosureColorCode;
  self->_enclosureColorCode = v42;

  objc_opt_class();
  id v44 = [v74 objectForKeyedSubscript:@"clcg"];
  if (objc_opt_isKindOfClass()) {
    v45 = (NSString *)v44;
  }
  else {
    v45 = 0;
  }

  coverGlassColorCode = self->_coverGlassColorCode;
  self->_coverGlassColorCode = v45;

  objc_opt_class();
  id v47 = [v74 objectForKeyedSubscript:@"clhs"];
  if (objc_opt_isKindOfClass()) {
    v48 = (NSString *)v47;
  }
  else {
    v48 = 0;
  }

  housingColorCode = self->_housingColorCode;
  self->_housingColorCode = v48;

  objc_opt_class();
  id v50 = [v74 objectForKeyedSubscript:@"clbg"];
  if (objc_opt_isKindOfClass()) {
    v51 = (NSString *)v50;
  }
  else {
    v51 = 0;
  }

  backingColorCode = self->_backingColorCode;
  self->_backingColorCode = v51;

  objc_opt_class();
  id v53 = [v74 objectForKeyedSubscript:@"additionalInfo"];
  if (objc_opt_isKindOfClass()) {
    v54 = (NSDictionary *)v53;
  }
  else {
    v54 = 0;
  }

  additionalInfo = self->_additionalInfo;
  self->_additionalInfo = v54;

  objc_opt_class();
  id v56 = [v74 objectForKeyedSubscript:@"lastCacheUpdatedDate"];
  if (objc_opt_isKindOfClass()) {
    id v57 = v56;
  }
  else {
    id v57 = 0;
  }

  if (v57)
  {
    v58 = (void *)MEMORY[0x1E4F1C9C8];
    [v57 doubleValue];
    v60 = [v58 dateWithTimeIntervalSince1970:v59 / 1000.0];
    lastCacheUpdatedDate = self->_lastCacheUpdatedDate;
    self->_lastCacheUpdatedDate = v60;
  }
  objc_opt_class();
  id v62 = [v74 objectForKeyedSubscript:@"services"];
  if (objc_opt_isKindOfClass()) {
    id v63 = v62;
  }
  else {
    id v63 = 0;
  }

  v64 = [v63 stringByReplacingOccurrencesOfString:@"|" withString:@","];
  services = self->_services;
  self->_services = v64;

  objc_opt_class();
  id v66 = [v74 objectForKeyedSubscript:@"deletedDate"];
  if (objc_opt_isKindOfClass()) {
    id v67 = v66;
  }
  else {
    id v67 = 0;
  }

  if (v67)
  {
    v68 = (void *)MEMORY[0x1E4F1C9C8];
    [v67 doubleValue];
    v70 = [v68 dateWithTimeIntervalSince1970:v69 / 1000.0];
    deletedDate = self->_deletedDate;
    self->_deletedDate = v70;
  }
  objc_opt_class();
  id v72 = [v74 objectForKeyedSubscript:@"reason"];
  if (objc_opt_isKindOfClass()) {
    id v73 = v72;
  }
  else {
    id v73 = 0;
  }

  self->_removalReason = [v73 integerValue];
}

- (void)setDeviceRestrictionState:(id)a3
{
  id v4 = a3;
  v5 = [AKDeviceSafetyRestrictionState alloc];
  id v10 = [(AKRemoteDevice *)self machineId];
  v6 = [(AKRemoteDevice *)self serialNumber];
  uint64_t v7 = [v4 reason];

  v8 = [(AKDeviceSafetyRestrictionState *)v5 initWithDeviceMID:v10 serialNumber:v6 restrictionReason:v7];
  deviceRestrictionState = self->_deviceRestrictionState;
  self->_deviceRestrictionState = v8;
}

- (AKRemoteDevice)initWithCoder:(id)a3
{
  v49[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)AKRemoteDevice;
  v5 = [(AKRemoteDevice *)&v48 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_buildNumber"];
    buildNumber = v5->_buildNumber;
    v5->_buildNumber = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_operatingSystemName"];
    operatingSystemName = v5->_operatingSystemName;
    v5->_operatingSystemName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_operatingSystemVersion"];
    operatingSystemVersion = v5->_operatingSystemVersion;
    v5->_operatingSystemVersion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_model"];
    model = v5->_model;
    v5->_model = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_machineId"];
    machineId = v5->_machineId;
    v5->_machineId = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pushToken"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v22;

    v5->_trusted = [v4 decodeBoolForKey:@"_trusted"];
    v5->_inCircle = [v4 decodeBoolForKey:@"_inCircle"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_colorCode"];
    colorCode = v5->_colorCode;
    v5->_colorCode = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_enclosureColorCode"];
    enclosureColorCode = v5->_enclosureColorCode;
    v5->_enclosureColorCode = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_coverGlassColorCode"];
    coverGlassColorCode = v5->_coverGlassColorCode;
    v5->_coverGlassColorCode = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_housingColorCode"];
    housingColorCode = v5->_housingColorCode;
    v5->_housingColorCode = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingColorCode"];
    backingColorCode = v5->_backingColorCode;
    v5->_backingColorCode = (NSString *)v32;

    id v34 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v49[2] = objc_opt_class();
    v49[3] = objc_opt_class();
    id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
    id v36 = [v34 setWithArray:v35];
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"_additionalInfo"];
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_services"];
    services = v5->_services;
    v5->_services = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastCacheUpdatedDate"];
    lastCacheUpdatedDate = v5->_lastCacheUpdatedDate;
    v5->_lastCacheUpdatedDate = (NSDate *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deletedDate"];
    deletedDate = v5->_deletedDate;
    v5->_deletedDate = (NSDate *)v43;

    v5->_removalReason = [v4 decodeIntegerForKey:@"_removalReason"];
    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceRestrictionState"];
    deviceRestrictionState = v5->_deviceRestrictionState;
    v5->_deviceRestrictionState = (AKDeviceSafetyRestrictionState *)v45;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"_name"];
  [v5 encodeObject:self->_serialNumber forKey:@"_serialNumber"];
  [v5 encodeObject:self->_buildNumber forKey:@"_buildNumber"];
  [v5 encodeObject:self->_operatingSystemName forKey:@"_operatingSystemName"];
  [v5 encodeObject:self->_operatingSystemVersion forKey:@"_operatingSystemVersion"];
  [v5 encodeObject:self->_model forKey:@"_model"];
  [v5 encodeObject:self->_machineId forKey:@"_machineId"];
  [v5 encodeObject:self->_pushToken forKey:@"_pushToken"];
  [v5 encodeObject:self->_lastUpdatedDate forKey:@"_lastUpdatedDate"];
  [v5 encodeBool:self->_trusted forKey:@"_trusted"];
  [v5 encodeBool:self->_inCircle forKey:@"_inCircle"];
  [v5 encodeObject:self->_colorCode forKey:@"_colorCode"];
  [v5 encodeObject:self->_enclosureColorCode forKey:@"_enclosureColorCode"];
  [v5 encodeObject:self->_coverGlassColorCode forKey:@"_coverGlassColorCode"];
  [v5 encodeObject:self->_housingColorCode forKey:@"_housingColorCode"];
  [v5 encodeObject:self->_backingColorCode forKey:@"_backingColorCode"];
  [v5 encodeObject:self->_additionalInfo forKey:@"_additionalInfo"];
  [v5 encodeObject:self->_services forKey:@"_services"];
  [v5 encodeObject:self->_lastCacheUpdatedDate forKey:@"_lastCacheUpdatedDate"];
  [v5 encodeObject:self->_deletedDate forKey:@"_deletedDate"];
  [v5 encodeInteger:self->_removalReason forKey:@"_removalReason"];
  [v5 encodeObject:self->_deviceRestrictionState forKey:@"_deviceRestrictionState"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@:%p> Name: %@, SN: %@, Build: %@, OS: %@, Version: %@, Model: %@, Timestamp: %@, Trusted: %d, Safety State' %@, Circle Status: %d, Color Code: %@, Additional Info %@, services: %@, lastCacheUpdatedDate: %@, deletedDate: %@, removalReason: %ld ", objc_opt_class(), self, self->_name, self->_serialNumber, self->_buildNumber, self->_operatingSystemName, self->_operatingSystemVersion, self->_model, self->_lastUpdatedDate, self->_trusted, self->_deviceRestrictionState, self->_inCircle, self->_colorCode, self->_additionalInfo, self->_services, self->_lastCacheUpdatedDate,
               self->_deletedDate,
               self->_removalReason);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (void)setBuildNumber:(id)a3
{
}

- (NSString)operatingSystemName
{
  return self->_operatingSystemName;
}

- (void)setOperatingSystemName:(id)a3
{
}

- (NSString)operatingSystemVersion
{
  return self->_operatingSystemVersion;
}

- (void)setOperatingSystemVersion:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSString)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(id)a3
{
}

- (NSString)enclosureColorCode
{
  return self->_enclosureColorCode;
}

- (void)setEnclosureColorCode:(id)a3
{
}

- (NSString)coverGlassColorCode
{
  return self->_coverGlassColorCode;
}

- (void)setCoverGlassColorCode:(id)a3
{
}

- (NSString)housingColorCode
{
  return self->_housingColorCode;
}

- (void)setHousingColorCode:(id)a3
{
}

- (NSString)backingColorCode
{
  return self->_backingColorCode;
}

- (void)setBackingColorCode:(id)a3
{
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (BOOL)inCircle
{
  return self->_inCircle;
}

- (void)setInCircle:(BOOL)a3
{
  self->_inCircle = a3;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (NSString)machineId
{
  return self->_machineId;
}

- (void)setMachineId:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (NSDate)deletedDate
{
  return self->_deletedDate;
}

- (void)setDeletedDate:(id)a3
{
}

- (int64_t)removalReason
{
  return self->_removalReason;
}

- (void)setRemovalReason:(int64_t)a3
{
  self->_removalReason = a3;
}

- (AKDeviceSafetyRestrictionState)deviceRestrictionState
{
  return self->_deviceRestrictionState;
}

- (NSDate)lastCacheUpdatedDate
{
  return self->_lastCacheUpdatedDate;
}

- (void)setLastCacheUpdatedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCacheUpdatedDate, 0);
  objc_storeStrong((id *)&self->_deviceRestrictionState, 0);
  objc_storeStrong((id *)&self->_deletedDate, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_machineId, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_backingColorCode, 0);
  objc_storeStrong((id *)&self->_housingColorCode, 0);
  objc_storeStrong((id *)&self->_coverGlassColorCode, 0);
  objc_storeStrong((id *)&self->_enclosureColorCode, 0);
  objc_storeStrong((id *)&self->_colorCode, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_operatingSystemVersion, 0);
  objc_storeStrong((id *)&self->_operatingSystemName, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end