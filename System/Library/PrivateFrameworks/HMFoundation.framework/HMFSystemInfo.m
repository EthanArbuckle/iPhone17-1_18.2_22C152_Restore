@interface HMFSystemInfo
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)systemInfo;
- (BOOL)isMigrating;
- (BOOL)supportsBLE;
- (HMFMACAddress)WiFiInterfaceMACAddress;
- (HMFSoftwareVersion)softwareVersion;
- (HMFSystemInfoBluetoothLEDataSource)bluetoothLEDataSource;
- (HMFSystemInfoMarketingInformationDataSource)marketingDataSource;
- (HMFSystemInfoMigrationDataSource)migrationDataSource;
- (HMFSystemInfoNameDataSource)nameDataSource;
- (HMFSystemInfoProductColorDataSource)productColorDataSource;
- (HMFSystemInfoProductInfoDataSource)productInfoDataSource;
- (HMFSystemInfoSerialNumberDataSource)serialNumberDataSource;
- (HMFSystemInfoSoftwareVersionDataSource)softwareVersionDataSource;
- (HMFSystemInfoWiFiDataSource)WiFiDataSource;
- (NSString)model;
- (NSString)modelIdentifier;
- (NSString)name;
- (NSString)regionInfo;
- (NSString)serialNumber;
- (int64_t)productClass;
- (int64_t)productColor;
- (int64_t)productPlatform;
- (int64_t)productVariant;
- (void)dataSource:(id)a3 didUpdateMigrating:(BOOL)a4;
- (void)dataSource:(id)a3 didUpdateName:(id)a4;
@end

@implementation HMFSystemInfo

+ (id)systemInfo
{
  if (_MergedGlobals_64 != -1) {
    dispatch_once(&_MergedGlobals_64, &__block_literal_global_32);
  }
  v2 = (void *)qword_1EB4EED50;
  return v2;
}

- (int64_t)productVariant
{
  v2 = [(HMFSystemInfo *)self productInfoDataSource];
  int64_t v3 = [v2 productVariant];

  return v3;
}

- (HMFSystemInfoProductInfoDataSource)productInfoDataSource
{
  return self->_productInfoDataSource;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[HMFSystemInfo allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___HMFSystemInfo;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (int64_t)productColor
{
  v2 = [(HMFSystemInfo *)self productColorDataSource];
  int64_t v3 = [v2 productColor];

  return v3;
}

- (NSString)modelIdentifier
{
  v2 = [(HMFSystemInfo *)self productInfoDataSource];
  int64_t v3 = [v2 modelIdentifier];

  return (NSString *)v3;
}

- (HMFSoftwareVersion)softwareVersion
{
  v2 = [(HMFSystemInfo *)self softwareVersionDataSource];
  int64_t v3 = [v2 softwareVersion];

  return (HMFSoftwareVersion *)v3;
}

- (HMFSystemInfoSoftwareVersionDataSource)softwareVersionDataSource
{
  return self->_softwareVersionDataSource;
}

- (int64_t)productPlatform
{
  v2 = [(HMFSystemInfo *)self productInfoDataSource];
  int64_t v3 = [v2 productPlatform];

  return v3;
}

- (HMFSystemInfoProductColorDataSource)productColorDataSource
{
  return self->_productColorDataSource;
}

- (int64_t)productClass
{
  v2 = [(HMFSystemInfo *)self productInfoDataSource];
  int64_t v3 = [v2 productClass];

  return v3;
}

uint64_t __27__HMFSystemInfo_systemInfo__block_invoke()
{
  qword_1EB4EED50 = objc_alloc_init(HMFSystemInfo);
  return MEMORY[0x1F41817F8]();
}

- (NSString)name
{
  v2 = [(HMFSystemInfo *)self nameDataSource];
  int64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (void)dataSource:(id)a3 didUpdateName:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A87A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier(v9);
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Updated system name to '%@'", buf, 0x16u);
  }
  v12 = +[HMFNotificationCenter defaultCenter];
  v14 = @"HMFSystemInfoNameNotificationKey";
  id v15 = v7;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v12 postNotificationName:@"HMFSystemInfoNameUpdatedNotification" object:v9 userInfo:v13];
}

- (NSString)model
{
  v2 = [(HMFSystemInfo *)self marketingDataSource];
  int64_t v3 = [v2 model];

  return (NSString *)v3;
}

- (NSString)regionInfo
{
  v2 = [(HMFSystemInfo *)self marketingDataSource];
  int64_t v3 = [v2 regionInfo];

  return (NSString *)v3;
}

- (NSString)serialNumber
{
  v2 = [(HMFSystemInfo *)self serialNumberDataSource];
  int64_t v3 = [v2 serialNumber];

  return (NSString *)v3;
}

- (BOOL)isMigrating
{
  v2 = [(HMFSystemInfo *)self migrationDataSource];
  char v3 = [v2 isMigrating];

  return v3;
}

- (void)dataSource:(id)a3 didUpdateMigrating:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A87A0]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier(v8);
    v11 = HMFBooleanToString(v4);
    int v13 = 138543618;
    v14 = v10;
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_INFO, "%{public}@Updated migration status to '%@'", (uint8_t *)&v13, 0x16u);
  }
  v12 = +[HMFNotificationCenter defaultCenter];
  [v12 postNotificationName:@"HMFSystemInfoMigratingUpdatedNotification" object:v8 userInfo:0];
}

- (HMFMACAddress)WiFiInterfaceMACAddress
{
  v2 = [(HMFSystemInfo *)self WiFiDataSource];
  char v3 = [v2 WiFiInterfaceMACAddress];

  return (HMFMACAddress *)v3;
}

- (BOOL)supportsBLE
{
  v2 = [(HMFSystemInfo *)self bluetoothLEDataSource];
  char v3 = [v2 supportsBLE];

  return v3;
}

- (HMFSystemInfoNameDataSource)nameDataSource
{
  return self->_nameDataSource;
}

- (HMFSystemInfoMarketingInformationDataSource)marketingDataSource
{
  return self->_marketingDataSource;
}

- (HMFSystemInfoSerialNumberDataSource)serialNumberDataSource
{
  return self->_serialNumberDataSource;
}

- (HMFSystemInfoMigrationDataSource)migrationDataSource
{
  return self->_migrationDataSource;
}

- (HMFSystemInfoWiFiDataSource)WiFiDataSource
{
  return self->_WiFiDataSource;
}

- (HMFSystemInfoBluetoothLEDataSource)bluetoothLEDataSource
{
  return self->_bluetoothLEDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productColorDataSource, 0);
  objc_storeStrong((id *)&self->_bluetoothLEDataSource, 0);
  objc_storeStrong((id *)&self->_WiFiDataSource, 0);
  objc_storeStrong((id *)&self->_migrationDataSource, 0);
  objc_storeStrong((id *)&self->_softwareVersionDataSource, 0);
  objc_storeStrong((id *)&self->_productInfoDataSource, 0);
  objc_storeStrong((id *)&self->_serialNumberDataSource, 0);
  objc_storeStrong((id *)&self->_marketingDataSource, 0);
  objc_storeStrong((id *)&self->_nameDataSource, 0);
}

@end