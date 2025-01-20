@interface _ACCExternalAccessoryInfo
- (BOOL)isEqual:(id)a3;
- (NSDictionary)fullAccessoryInfo;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)firmwareRevisionActive;
- (NSString)firmwareRevisionPending;
- (NSString)hardwareRevision;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)ppid;
- (NSString)primaryUUID;
- (NSString)serial;
- (_ACCExternalAccessoryInfo)initWithAccessoryInfoDictionary:(id)a3;
- (id)copyAccessoryInfo;
- (id)description;
- (unint64_t)destinationSharingOptions;
- (unint64_t)hash;
- (void)setDestinationSharingOptions:(unint64_t)a3;
- (void)setFirmwareRevisionActive:(id)a3;
- (void)setFirmwareRevisionPending:(id)a3;
- (void)setFullAccessoryInfo:(id)a3;
- (void)setHardwareRevision:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPpid:(id)a3;
- (void)setPrimaryUUID:(id)a3;
- (void)setProductID:(id)a3;
- (void)setSerial:(id)a3;
- (void)setVendorID:(id)a3;
@end

@implementation _ACCExternalAccessoryInfo

- (_ACCExternalAccessoryInfo)initWithAccessoryInfoDictionary:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_ACCExternalAccessoryInfo;
  v6 = [(_ACCExternalAccessoryInfo *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fullAccessoryInfo, a3);
    uint64_t v8 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"ACCExternalAccessoryPrimaryUUID"];
    primaryUUID = v7->_primaryUUID;
    v7->_primaryUUID = (NSString *)v8;

    uint64_t v10 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"IAPAppAccessoryNameKey"];
    name = v7->_name;
    v7->_name = (NSString *)v10;

    uint64_t v12 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"IAPAppAccessoryManufacturerKey"];
    manufacturer = v7->_manufacturer;
    v7->_manufacturer = (NSString *)v12;

    uint64_t v14 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"IAPAppAccessoryModelNumberKey"];
    model = v7->_model;
    v7->_model = (NSString *)v14;

    uint64_t v16 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"IAPAppAccessorySerialNumberKey"];
    serial = v7->_serial;
    v7->_serial = (NSString *)v16;

    uint64_t v18 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"IAPAppAccessoryFirmwareRevisionKey"];
    firmwareRevisionActive = v7->_firmwareRevisionActive;
    v7->_firmwareRevisionActive = (NSString *)v18;

    uint64_t v20 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"IAPAppAccessoryFirmwareRevisionPendingKey"];
    firmwareRevisionPending = v7->_firmwareRevisionPending;
    v7->_firmwareRevisionPending = (NSString *)v20;

    uint64_t v22 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"IAPAppAccessoryHardwareRevisionKey"];
    hardwareRevision = v7->_hardwareRevision;
    v7->_hardwareRevision = (NSString *)v22;

    uint64_t v24 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"ACCExternalAccessoryPPIDKey"];
    ppid = v7->_ppid;
    v7->_ppid = (NSString *)v24;

    uint64_t v26 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"ACCExternalAccessoryPPIDKey"];
    vendorID = v7->_vendorID;
    v7->_vendorID = (NSNumber *)v26;

    uint64_t v28 = [(NSDictionary *)v7->_fullAccessoryInfo objectForKey:@"ACCExternalAccessoryPPIDKey"];
    productID = v7->_productID;
    v7->_productID = (NSNumber *)v28;

    v7->_destinationSharingOptions = 0;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_ACCExternalAccessoryInfo>[%@ name='%@' manu='%@' model='%@' serial='%@' fw(active)='%@', fw(pending)='%@', hw='%@' ppid='%@']", self->_primaryUUID, self->_name, self->_manufacturer, self->_model, self->_serial, self->_firmwareRevisionActive, self->_firmwareRevisionPending, self->_hardwareRevision, self->_ppid];
}

- (id)copyAccessoryInfo
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_fullAccessoryInfo];
  v4 = [v3 objectForKey:@"IAPAppAccessoryCertDataKey"];

  if (v4) {
    [v3 removeObjectForKey:@"IAPAppAccessoryCertDataKey"];
  }
  id v5 = [v3 objectForKey:@"IAPAppAccessoryCertSerialNumberKey"];

  if (v5) {
    [v3 removeObjectForKey:@"IAPAppAccessoryCertSerialNumberKey"];
  }
  if (self->_destinationSharingOptions)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v3 setObject:v6 forKey:kACCDestinationSharingOptionsKey];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    primaryUUID = self->_primaryUUID;
    v6 = [v4 primaryUUID];
    BOOL v7 = [(NSString *)primaryUUID isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_primaryUUID hash];
}

- (NSDictionary)fullAccessoryInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFullAccessoryInfo:(id)a3
{
}

- (NSString)primaryUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimaryUUID:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)serial
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSerial:(id)a3
{
}

- (NSString)firmwareRevisionActive
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFirmwareRevisionActive:(id)a3
{
}

- (NSString)firmwareRevisionPending
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFirmwareRevisionPending:(id)a3
{
}

- (NSString)hardwareRevision
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHardwareRevision:(id)a3
{
}

- (NSString)ppid
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPpid:(id)a3
{
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setProductID:(id)a3
{
}

- (unint64_t)destinationSharingOptions
{
  return self->_destinationSharingOptions;
}

- (void)setDestinationSharingOptions:(unint64_t)a3
{
  self->_destinationSharingOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_hardwareRevision, 0);
  objc_storeStrong((id *)&self->_firmwareRevisionPending, 0);
  objc_storeStrong((id *)&self->_firmwareRevisionActive, 0);
  objc_storeStrong((id *)&self->_serial, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_primaryUUID, 0);

  objc_storeStrong((id *)&self->_fullAccessoryInfo, 0);
}

@end