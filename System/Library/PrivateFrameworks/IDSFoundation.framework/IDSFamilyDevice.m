@interface IDSFamilyDevice
- (IDSFamilyDevice)initWithDictionary:(id)a3;
- (IDSFamilyDevice)initWithOwnerHandle:(id)a3 deviceName:(id)a4 deviceType:(int64_t)a5 deviceColor:(id)a6 buildVersion:(id)a7 deviceUniqueID:(id)a8;
- (NSString)buildVersion;
- (NSString)deviceColor;
- (NSString)deviceName;
- (NSString)deviceUniqueID;
- (NSString)ownerHandle;
- (id)dictionaryRepresentation;
- (int64_t)deviceType;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setOwnerHandle:(id)a3;
@end

@implementation IDSFamilyDevice

- (id)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = v3;
  ownerHandle = self->_ownerHandle;
  if (ownerHandle) {
    CFDictionarySetValue(v3, @"FamilyDeviceOwnerHandleKey", ownerHandle);
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    CFDictionarySetValue(v6, @"FamilyDeviceNameKey", deviceName);
  }
  v9 = objc_msgSend_numberWithInteger_(NSNumber, v4, self->_deviceType, v5);
  if (v9) {
    CFDictionarySetValue(v6, @"FamilyDeviceTypeKey", v9);
  }

  deviceColor = self->_deviceColor;
  if (deviceColor) {
    CFDictionarySetValue(v6, @"FamilyDeviceColorKey", deviceColor);
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    CFDictionarySetValue(v6, @"FamilyDeviceBuildVersionKey", buildVersion);
  }
  deviceUniqueID = self->_deviceUniqueID;
  if (deviceUniqueID) {
    CFDictionarySetValue(v6, @"FamilyDeviceUniqueIDKey", deviceUniqueID);
  }
  return v6;
}

- (IDSFamilyDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)IDSFamilyDevice;
  v6 = [(IDSFamilyDevice *)&v33 init];
  if (v6)
  {
    uint64_t v8 = objc_msgSend_objectForKey_(v4, v5, @"FamilyDeviceOwnerHandleKey", v7);
    ownerHandle = v6->_ownerHandle;
    v6->_ownerHandle = (NSString *)v8;

    uint64_t v12 = objc_msgSend_objectForKey_(v4, v10, @"FamilyDeviceNameKey", v11);
    deviceName = v6->_deviceName;
    v6->_deviceName = (NSString *)v12;

    v16 = objc_msgSend_objectForKey_(v4, v14, @"FamilyDeviceTypeKey", v15);
    v6->_deviceType = objc_msgSend_integerValue(v16, v17, v18, v19);

    uint64_t v22 = objc_msgSend_objectForKey_(v4, v20, @"FamilyDeviceColorKey", v21);
    deviceColor = v6->_deviceColor;
    v6->_deviceColor = (NSString *)v22;

    uint64_t v26 = objc_msgSend_objectForKey_(v4, v24, @"FamilyDeviceBuildVersionKey", v25);
    buildVersion = v6->_buildVersion;
    v6->_buildVersion = (NSString *)v26;

    uint64_t v30 = objc_msgSend_objectForKey_(v4, v28, @"FamilyDeviceUniqueIDKey", v29);
    deviceUniqueID = v6->_deviceUniqueID;
    v6->_deviceUniqueID = (NSString *)v30;
  }
  return v6;
}

- (IDSFamilyDevice)initWithOwnerHandle:(id)a3 deviceName:(id)a4 deviceType:(int64_t)a5 deviceColor:(id)a6 buildVersion:(id)a7 deviceUniqueID:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)IDSFamilyDevice;
  uint64_t v18 = [(IDSFamilyDevice *)&v23 init];
  double v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_ownerHandle, a3);
    objc_storeStrong((id *)&v19->_deviceName, a4);
    v19->_deviceType = a5;
    objc_storeStrong((id *)&v19->_deviceColor, a6);
    objc_storeStrong((id *)&v19->_buildVersion, a7);
    objc_storeStrong((id *)&v19->_deviceUniqueID, a8);
  }

  return v19;
}

- (NSString)ownerHandle
{
  return self->_ownerHandle;
}

- (void)setOwnerHandle:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_ownerHandle, 0);
}

@end