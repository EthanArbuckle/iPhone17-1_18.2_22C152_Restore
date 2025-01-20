@interface DMTMobileGestaltBackedDeviceInformationPrimitives
- (NSString)deviceClass;
- (NSString)deviceUDID;
- (NSString)marketingModelName;
- (NSString)modelIdentifier;
- (NSString)serialNumber;
@end

@implementation DMTMobileGestaltBackedDeviceInformationPrimitives

- (NSString)serialNumber
{
  serialNumber = self->_serialNumber;
  if (!serialNumber)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_serialNumber;
    self->_serialNumber = v4;

    serialNumber = self->_serialNumber;
  }
  v6 = (void *)[(NSString *)serialNumber copy];
  return (NSString *)v6;
}

- (NSString)deviceUDID
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  deviceUDID = self->_deviceUDID;
  if (!deviceUDID)
  {
    v4 = (void *)MGCopyAnswer();
    v5 = (void *)MGCopyAnswer();
    v6 = (void *)MGCopyAnswer();
    v7 = (void *)MGCopyAnswer();
    v8 = (void *)MGCopyAnswer();
    if (_DMTLogGeneral_onceToken_2 != -1) {
      dispatch_once(&_DMTLogGeneral_onceToken_2, &__block_literal_global_3);
    }
    v9 = _DMTLogGeneral_logObj_2;
    if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_2, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138544386;
      v15 = v4;
      __int16 v16 = 2114;
      v17 = v5;
      __int16 v18 = 2114;
      v19 = v6;
      __int16 v20 = 2114;
      v21 = v7;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_debug_impl(&dword_22D3D6000, v9, OS_LOG_TYPE_DEBUG, "arrowUniqueID: %{public}@,\n provisioningUniqueID: %{public}@,\n unqiueChipID: %{public}@,\n uniqueDeviceID: %{public}@,\n attestationUniqueDeviceID: %{public}@", (uint8_t *)&v14, 0x34u);
    }
    v10 = (NSString *)MGCopyAnswer();
    v11 = self->_deviceUDID;
    self->_deviceUDID = v10;

    deviceUDID = self->_deviceUDID;
  }
  v12 = (void *)[(NSString *)deviceUDID copy];
  return (NSString *)v12;
}

- (NSString)modelIdentifier
{
  modelIdentifier = self->_modelIdentifier;
  if (!modelIdentifier)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_modelIdentifier;
    self->_modelIdentifier = v4;

    modelIdentifier = self->_modelIdentifier;
  }
  v6 = (void *)[(NSString *)modelIdentifier copy];
  return (NSString *)v6;
}

- (NSString)marketingModelName
{
  marketingModelName = self->_marketingModelName;
  if (!marketingModelName)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_marketingModelName;
    self->_marketingModelName = v4;

    marketingModelName = self->_marketingModelName;
  }
  v6 = (void *)[(NSString *)marketingModelName copy];
  return (NSString *)v6;
}

- (NSString)deviceClass
{
  deviceClass = self->_deviceClass;
  if (!deviceClass)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_deviceClass;
    self->_deviceClass = v4;

    deviceClass = self->_deviceClass;
  }
  return deviceClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_marketingModelName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end