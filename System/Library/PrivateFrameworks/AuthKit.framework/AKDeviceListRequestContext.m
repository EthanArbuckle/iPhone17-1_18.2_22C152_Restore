@interface AKDeviceListRequestContext
+ (BOOL)supportsSecureCoding;
- (AKDeviceListRequestContext)init;
- (AKDeviceListRequestContext)initWithCoder:(id)a3;
- (BOOL)fetchDeviceSafetyState;
- (BOOL)includeFamilyDevices;
- (BOOL)includeUntrustedDevices;
- (BOOL)isForceFetch;
- (NSArray)operatingSystems;
- (NSArray)serialNumbers;
- (NSArray)services;
- (NSString)altDSID;
- (NSString)description;
- (NSUUID)_identifier;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setFetchDeviceSafetyState:(BOOL)a3;
- (void)setForceFetch:(BOOL)a3;
- (void)setIncludeFamilyDevices:(BOOL)a3;
- (void)setIncludeUntrustedDevices:(BOOL)a3;
- (void)setOperatingSystems:(id)a3;
- (void)setSerialNumbers:(id)a3;
- (void)setServices:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation AKDeviceListRequestContext

- (AKDeviceListRequestContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKDeviceListRequestContext;
  v2 = [(AKDeviceListRequestContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v2->_forceFetch = 0;
    v2->_type = 1;
  }
  return v2;
}

- (AKDeviceListRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKDeviceListRequestContext;
  v5 = [(AKDeviceListRequestContext *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_services"];
    services = v5->_services;
    v5->_services = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_operatingSystems"];
    operatingSystems = v5->_operatingSystems;
    v5->_operatingSystems = (NSArray *)v18;

    v5->_includeUntrustedDevices = [v4 decodeBoolForKey:@"_includeUntrustedDevices"];
    v5->_includeFamilyDevices = [v4 decodeBoolForKey:@"_includeFamilyDevices"];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"_serialNumbers"];
    serialNumbers = v5->_serialNumbers;
    v5->_serialNumbers = (NSArray *)v23;

    v5->_forceFetch = [v4 decodeBoolForKey:@"_forceFetch"];
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_fetchDeviceSafetyState = [v4 decodeBoolForKey:@"_fetchDeviceSafetyState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_services forKey:@"_services"];
  [v5 encodeObject:self->_operatingSystems forKey:@"_operatingSystems"];
  [v5 encodeBool:self->_includeUntrustedDevices forKey:@"_includeUntrustedDevices"];
  [v5 encodeBool:self->_includeFamilyDevices forKey:@"_includeFamilyDevices"];
  [v5 encodeObject:self->_serialNumbers forKey:@"_serialNumbers"];
  [v5 encodeBool:self->_forceFetch forKey:@"_forceFetch"];
  [v5 encodeInteger:self->_type forKey:@"_type"];
  [v5 encodeBool:self->_fetchDeviceSafetyState forKey:@"_fetchDeviceSafetyState"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t type = self->_type;
  uint64_t v6 = [(NSUUID *)self->_identifier UUIDString];
  v7 = [v3 stringWithFormat:@"{<%@:%p>: type: %ld, identifier: %@,altDSID: %@, forceFetch: %d, fetchDeviceSafetyState: %d, os: %@, services: %@, untrusted: %d, family: %d, serialNumbers: %@, }", v4, self, type, v6, self->_altDSID, self->_forceFetch, self->_fetchDeviceSafetyState, self->_operatingSystems, self->_services, self->_includeUntrustedDevices, self->_includeFamilyDevices, self->_serialNumbers];

  return (NSString *)v7;
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (BOOL)fetchDeviceSafetyState
{
  return self->_fetchDeviceSafetyState;
}

- (void)setFetchDeviceSafetyState:(BOOL)a3
{
  self->_fetchDeviceSafetyState = a3;
}

- (BOOL)includeUntrustedDevices
{
  return self->_includeUntrustedDevices;
}

- (void)setIncludeUntrustedDevices:(BOOL)a3
{
  self->_includeUntrustedDevices = a3;
}

- (BOOL)includeFamilyDevices
{
  return self->_includeFamilyDevices;
}

- (void)setIncludeFamilyDevices:(BOOL)a3
{
  self->_includeFamilyDevices = a3;
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSArray)operatingSystems
{
  return self->_operatingSystems;
}

- (void)setOperatingSystems:(id)a3
{
}

- (NSArray)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
}

- (BOOL)isForceFetch
{
  return self->_forceFetch;
}

- (void)setForceFetch:(BOOL)a3
{
  self->_forceFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_operatingSystems, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end