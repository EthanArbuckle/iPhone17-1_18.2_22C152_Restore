@interface HDMCAccountDevicesInfo
- (BOOL)hasHealthAppDevicesWithHigherAlgorithmVersions;
- (BOOL)isEqual:(id)a3;
- (BOOL)localDeviceIsOnlyDeviceWithNotifications;
- (BOOL)shouldFireNotifications;
- (HDMCAccountDevicesInfo)initWithHealthAppDevicesInfo:(id)a3 localDeviceInfo:(id)a4;
- (unint64_t)hash;
@end

@implementation HDMCAccountDevicesInfo

- (BOOL)hasHealthAppDevicesWithHigherAlgorithmVersions
{
  healthAppDevicesInfo = self->_healthAppDevicesInfo;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__HDMCAccountDevicesInfo_hasHealthAppDevicesWithHigherAlgorithmVersions__block_invoke;
  v4[3] = &unk_264751010;
  v4[4] = self;
  return [(NSArray *)healthAppDevicesInfo hk_containsObjectPassingTest:v4];
}

BOOL __72__HDMCAccountDevicesInfo_hasHealthAppDevicesWithHigherAlgorithmVersions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dayStreamProcessorAlgorithmVersion];
  return v3 > [*(id *)(*(void *)(a1 + 32) + 16) dayStreamProcessorAlgorithmVersion];
}

- (BOOL)localDeviceIsOnlyDeviceWithNotifications
{
  uint64_t v3 = [(NSArray *)self->_healthAppDevicesInfo hk_filter:&__block_literal_global_376];
  unint64_t v4 = [v3 count];

  BOOL result = [(HDMCDeviceInfo *)self->_localDeviceInfo someNotificationsEnabled];
  if (v4 >= 2) {
    return 0;
  }
  return result;
}

uint64_t __66__HDMCAccountDevicesInfo_localDeviceIsOnlyDeviceWithNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 someNotificationsEnabled];
}

- (BOOL)shouldFireNotifications
{
  if ([(HDMCAccountDevicesInfo *)self localDeviceIsOnlyDeviceWithNotifications])
  {
    return 1;
  }
  else
  {
    return ![(HDMCAccountDevicesInfo *)self hasHealthAppDevicesWithHigherAlgorithmVersions];
  }
}

- (HDMCAccountDevicesInfo)initWithHealthAppDevicesInfo:(id)a3 localDeviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMCAccountDevicesInfo;
  v8 = [(HDMCAccountDevicesInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    healthAppDevicesInfo = v8->_healthAppDevicesInfo;
    v8->_healthAppDevicesInfo = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    localDeviceInfo = v8->_localDeviceInfo;
    v8->_localDeviceInfo = (HDMCDeviceInfo *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HDMCAccountDevicesInfo *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      localDeviceInfo = self->_localDeviceInfo;
      id v7 = v5->_localDeviceInfo;
      if (localDeviceInfo != v7 && (!v7 || !-[HDMCDeviceInfo isEqual:](localDeviceInfo, "isEqual:"))) {
        goto LABEL_11;
      }
      healthAppDevicesInfo = self->_healthAppDevicesInfo;
      uint64_t v9 = v5->_healthAppDevicesInfo;
      if (healthAppDevicesInfo == v9)
      {
        char v10 = 1;
        goto LABEL_13;
      }
      if (v9) {
        char v10 = -[NSArray isEqualToArray:](healthAppDevicesInfo, "isEqualToArray:");
      }
      else {
LABEL_11:
      }
        char v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDMCDeviceInfo *)self->_localDeviceInfo hash];
  return [(NSArray *)self->_healthAppDevicesInfo hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_healthAppDevicesInfo, 0);
}

@end