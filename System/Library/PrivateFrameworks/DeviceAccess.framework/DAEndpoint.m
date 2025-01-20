@interface DAEndpoint
- (BOOL)grouped;
- (BOOL)matchesSelectedEndpoint:(id)a3 allowName:(BOOL)a4;
- (BOOL)missing;
- (BOOL)sameDeviceAsEndpoint:(id)a3;
- (BOOL)selected;
- (DADevice)parentDevice;
- (DADevice)underlyingDADevice;
- (DAEndpoint)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4;
- (NSDictionary)persistentDictionaryRepresentation;
- (NSDictionary)userInfo;
- (NSString)airplayDeviceID;
- (NSString)appBundleID;
- (NSString)bonjourFullName;
- (NSString)bonjourHostname;
- (NSString)bonjourName;
- (NSString)bonjourType;
- (NSString)identifier;
- (NSString)ipv4String;
- (NSString)name;
- (NSString)protocolTypeString;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unint64_t)addTicks;
- (unsigned)bonjourInterfaceIndex;
- (void)mergeMissingInfoFromEndpoint:(id)a3;
- (void)setAddTicks:(unint64_t)a3;
- (void)setAirplayDeviceID:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setBonjourFullName:(id)a3;
- (void)setBonjourHostname:(id)a3;
- (void)setBonjourInterfaceIndex:(unsigned int)a3;
- (void)setBonjourName:(id)a3;
- (void)setBonjourType:(id)a3;
- (void)setGrouped:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIpv4String:(id)a3;
- (void)setName:(id)a3;
- (void)setParentDevice:(id)a3;
- (void)setProtocolTypeString:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUnderlyingDADevice:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)updateWithEndpoint:(id)a3;
@end

@implementation DAEndpoint

- (DAEndpoint)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DAEndpoint;
  v7 = [(DAEndpoint *)&v29 init];
  if (v7)
  {
    CFStringGetTypeID();
    uint64_t v8 = CFDictionaryGetTypedValue();
    airplayDeviceID = v7->_airplayDeviceID;
    v7->_airplayDeviceID = (NSString *)v8;

    CFStringGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue();
    bonjourHostname = v7->_bonjourHostname;
    v7->_bonjourHostname = (NSString *)v10;

    CFStringGetTypeID();
    uint64_t v12 = CFDictionaryGetTypedValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v12;

    CFStringGetTypeID();
    uint64_t v14 = CFDictionaryGetTypedValue();
    ipv4String = v7->_ipv4String;
    v7->_ipv4String = (NSString *)v14;

    CFStringGetTypeID();
    uint64_t v16 = CFDictionaryGetTypedValue();
    name = v7->_name;
    v7->_name = (NSString *)v16;

    CFStringGetTypeID();
    uint64_t v18 = CFDictionaryGetTypedValue();
    protocolTypeString = v7->_protocolTypeString;
    v7->_protocolTypeString = (NSString *)v18;

    v20 = v7;
  }
  else if (a4)
  {
    uint64_t v22 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ super init failed", v23, v24, v25, v26, v27, v28, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSDictionary)persistentDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = v3;
  airplayDeviceID = self->_airplayDeviceID;
  if (airplayDeviceID) {
    [v3 setObject:airplayDeviceID forKeyedSubscript:@"airplayDeviceID"];
  }
  bonjourHostname = self->_bonjourHostname;
  if (bonjourHostname) {
    [v4 setObject:bonjourHostname forKeyedSubscript:@"bonjourHostname"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  ipv4String = self->_ipv4String;
  if (ipv4String) {
    [v4 setObject:ipv4String forKeyedSubscript:@"ipv4String"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKeyedSubscript:@"name"];
  }
  protocolTypeString = self->_protocolTypeString;
  if (protocolTypeString) {
    [v4 setObject:protocolTypeString forKeyedSubscript:@"protocolType"];
  }
  v11 = (void *)[v4 copy];

  return (NSDictionary *)v11;
}

- (id)description
{
  return [(DAEndpoint *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    v32 = identifier;
    CUAppendF();
    id v6 = v4;

    v4 = v6;
  }
  name = self->_name;
  if (name)
  {
    v33 = name;
    CUAppendF();
    uint64_t v8 = v4;

    v4 = v8;
  }
  protocolTypeString = self->_protocolTypeString;
  if (protocolTypeString)
  {
    v34 = protocolTypeString;
    CUAppendF();
    uint64_t v10 = v4;

    v4 = v10;
  }
  if (self->_selected)
  {
    CUAppendF();
    v11 = v4;

    v4 = v11;
  }
  if (self->_missing)
  {
    CUAppendF();
    uint64_t v12 = v4;

    v4 = v12;
  }
  airplayDeviceID = self->_airplayDeviceID;
  if (airplayDeviceID)
  {
    v35 = airplayDeviceID;
    CUAppendF();
    uint64_t v14 = v4;

    v4 = v14;
  }
  bonjourFullName = self->_bonjourFullName;
  if (bonjourFullName)
  {
    v36 = bonjourFullName;
    CUAppendF();
    uint64_t v16 = v4;

    v4 = v16;
  }
  bonjourHostname = self->_bonjourHostname;
  if (bonjourHostname)
  {
    v37 = bonjourHostname;
    CUAppendF();
    uint64_t v18 = v4;

    v4 = v18;
  }
  bonjourName = self->_bonjourName;
  if (bonjourName)
  {
    v38 = bonjourName;
    CUAppendF();
    v20 = v4;

    v4 = v20;
  }
  bonjourType = self->_bonjourType;
  if (bonjourType)
  {
    v39 = bonjourType;
    CUAppendF();
    uint64_t v22 = v4;

    v4 = v22;
  }
  if (self->_bonjourInterfaceIndex)
  {
    CUAppendF();
    uint64_t v23 = v4;

    v4 = v23;
  }
  ipv4String = self->_ipv4String;
  if (ipv4String)
  {
    uint64_t v25 = ipv4String;
    v40 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v26 = v4;

    v4 = v26;
  }
  underlyingDADevice = self->_underlyingDADevice;
  if (underlyingDADevice)
  {
    v41 = underlyingDADevice;
    CUAppendF();
    uint64_t v28 = v4;

    v4 = v28;
  }
  objc_super v29 = &stru_26D120818;
  if (v4) {
    objc_super v29 = v4;
  }
  v30 = v29;

  return v30;
}

- (BOOL)matchesSelectedEndpoint:(id)a3 allowName:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  protocolTypeString = self->_protocolTypeString;
  v7 = [v6 protocolTypeString];
  LODWORD(protocolTypeString) = [(NSString *)protocolTypeString isEqual:v7];

  if (protocolTypeString)
  {
    airplayDeviceID = self->_airplayDeviceID;
    uint64_t v10 = [v6 airplayDeviceID];
    LOBYTE(airplayDeviceID) = [(NSString *)airplayDeviceID isEqual:v10];

    if ((airplayDeviceID & 1) != 0
      || (bonjourHostname = self->_bonjourHostname,
          [v6 bonjourHostname],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(bonjourHostname) = [(NSString *)bonjourHostname isEqual:v12],
          v12,
          (bonjourHostname & 1) != 0))
    {
      LOBYTE(protocolTypeString) = 1;
    }
    else
    {
      protocolTypeString = self->_ipv4String;
      uint64_t v14 = [v6 ipv4String];
      LOBYTE(protocolTypeString) = [(NSString *)protocolTypeString isEqual:v14];

      if ((protocolTypeString & 1) == 0 && v4)
      {
        name = self->_name;
        uint64_t v16 = [v6 name];
        LOBYTE(protocolTypeString) = [(NSString *)name isEqual:v16];
      }
    }
  }

  return (char)protocolTypeString;
}

- (void)mergeMissingInfoFromEndpoint:(id)a3
{
  BOOL v4 = [a3 airplayDeviceID];
  v5 = v4;
  if (v4)
  {
    airplayDeviceID = self->_airplayDeviceID;
    p_airplayDeviceID = &self->_airplayDeviceID;
    if (!airplayDeviceID)
    {
      uint64_t v8 = v4;
      objc_storeStrong((id *)p_airplayDeviceID, v4);
      v5 = v8;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (BOOL)sameDeviceAsEndpoint:(id)a3
{
  id v4 = a3;
  airplayDeviceID = self->_airplayDeviceID;
  id v6 = [v4 airplayDeviceID];
  LOBYTE(airplayDeviceID) = [(NSString *)airplayDeviceID isEqual:v6];

  if (airplayDeviceID)
  {
    BOOL v7 = 1;
  }
  else if (self->_protocolTypeString {
         && ([v4 protocolTypeString],
  }
             uint64_t v8 = objc_claimAutoreleasedReturnValue(),
             v8,
             v8)
         && ([v4 protocolTypeString],
             v9 = objc_claimAutoreleasedReturnValue(),
             BOOL v10 = [(NSString *)self->_protocolTypeString isEqualToString:v9],
             v9,
             v10))
  {
    BOOL v7 = 0;
  }
  else
  {
    v11 = self->_bonjourHostname;
    uint64_t v12 = [v4 bonjourHostname];
    v13 = (void *)v12;
    if (v11 && v12 && [(NSString *)v11 caseInsensitiveCompare:v12] == NSOrderedSame)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v14 = self->_ipv4String;
      uint64_t v15 = [v4 ipv4String];
      uint64_t v16 = (void *)v15;
      BOOL v7 = v14 && v15 && [(NSString *)v14 caseInsensitiveCompare:v15] == NSOrderedSame;
    }
  }

  return v7;
}

- (void)updateWithEndpoint:(id)a3
{
  id v49 = a3;
  id v4 = [v49 airplayDeviceID];
  v5 = v4;
  if (v4)
  {
    id v6 = (NSString *)[v4 copy];
    airplayDeviceID = self->_airplayDeviceID;
    self->_airplayDeviceID = v6;
  }
  uint64_t v8 = [v49 bonjourFullName];
  v9 = v8;
  if (v8)
  {
    BOOL v10 = (NSString *)[v8 copy];
    bonjourFullName = self->_bonjourFullName;
    self->_bonjourFullName = v10;
  }
  uint64_t v12 = [v49 bonjourHostname];
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = (NSString *)[v12 copy];
    bonjourHostname = self->_bonjourHostname;
    self->_bonjourHostname = v14;
  }
  uint64_t v16 = [v49 bonjourName];
  v17 = v16;
  if (v16)
  {
    uint64_t v18 = (NSString *)[v16 copy];
    bonjourName = self->_bonjourName;
    self->_bonjourName = v18;
  }
  v20 = [v49 bonjourType];
  v21 = v20;
  if (v20)
  {
    uint64_t v22 = (NSString *)[v20 copy];
    bonjourType = self->_bonjourType;
    self->_bonjourType = v22;
  }
  self->_bonjourInterfaceIndex = [v49 bonjourInterfaceIndex];
  uint64_t v24 = [v49 identifier];
  uint64_t v25 = v24;
  if (v24)
  {
    uint64_t v26 = (NSString *)[v24 copy];
    identifier = self->_identifier;
    self->_identifier = v26;
  }
  uint64_t v28 = [v49 ipv4String];
  objc_super v29 = v28;
  if (v28)
  {
    v30 = (NSString *)[v28 copy];
    ipv4String = self->_ipv4String;
    self->_ipv4String = v30;
  }
  v47 = v17;
  v32 = [v49 name];
  v33 = v32;
  if (v32)
  {
    v34 = (NSString *)[v32 copy];
    name = self->_name;
    self->_name = v34;
  }
  v36 = v13;
  v48 = v5;
  v37 = [v49 protocolTypeString];
  v38 = v37;
  if (v37)
  {
    v39 = (NSString *)[v37 copy];
    protocolTypeString = self->_protocolTypeString;
    self->_protocolTypeString = v39;
  }
  v41 = v9;
  v42 = [v49 underlyingDADevice];
  if (v42) {
    objc_storeStrong((id *)&self->_underlyingDADevice, v42);
  }
  v43 = [v49 userInfo];
  v44 = v43;
  if (v43)
  {
    v45 = (NSDictionary *)[v43 copy];
    userInfo = self->_userInfo;
    self->_userInfo = v45;
  }
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSString)airplayDeviceID
{
  return self->_airplayDeviceID;
}

- (void)setAirplayDeviceID:(id)a3
{
}

- (NSString)bonjourFullName
{
  return self->_bonjourFullName;
}

- (void)setBonjourFullName:(id)a3
{
}

- (NSString)bonjourHostname
{
  return self->_bonjourHostname;
}

- (void)setBonjourHostname:(id)a3
{
}

- (NSString)bonjourName
{
  return self->_bonjourName;
}

- (void)setBonjourName:(id)a3
{
}

- (NSString)bonjourType
{
  return self->_bonjourType;
}

- (void)setBonjourType:(id)a3
{
}

- (unsigned)bonjourInterfaceIndex
{
  return self->_bonjourInterfaceIndex;
}

- (void)setBonjourInterfaceIndex:(unsigned int)a3
{
  self->_bonjourInterfaceIndex = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)ipv4String
{
  return self->_ipv4String;
}

- (void)setIpv4String:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)missing
{
  return self->_missing;
}

- (NSString)protocolTypeString
{
  return self->_protocolTypeString;
}

- (void)setProtocolTypeString:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (DADevice)underlyingDADevice
{
  return self->_underlyingDADevice;
}

- (void)setUnderlyingDADevice:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (unint64_t)addTicks
{
  return self->_addTicks;
}

- (void)setAddTicks:(unint64_t)a3
{
  self->_addTicks = a3;
}

- (BOOL)grouped
{
  return self->_grouped;
}

- (void)setGrouped:(BOOL)a3
{
  self->_grouped = a3;
}

- (DADevice)parentDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDevice);

  return (DADevice *)WeakRetained;
}

- (void)setParentDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentDevice);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_underlyingDADevice, 0);
  objc_storeStrong((id *)&self->_protocolTypeString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ipv4String, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bonjourType, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);
  objc_storeStrong((id *)&self->_bonjourHostname, 0);
  objc_storeStrong((id *)&self->_bonjourFullName, 0);
  objc_storeStrong((id *)&self->_airplayDeviceID, 0);

  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end