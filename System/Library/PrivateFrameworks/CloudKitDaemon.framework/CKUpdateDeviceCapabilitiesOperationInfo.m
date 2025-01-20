@interface CKUpdateDeviceCapabilitiesOperationInfo
- (CKUpdateDeviceCapabilitiesOperationInfo)initWithSupportedCapabilities:(id)a3 lastSentCapabilities:(id)a4 zoneUsages:(id)a5 shareUsages:(id)a6;
- (NSArray)lastSentCapabilities;
- (NSArray)supportedCapabilities;
- (NSDictionary)shareUsages;
- (NSDictionary)zoneUsages;
- (void)setLastSentCapabilities:(id)a3;
- (void)setShareUsages:(id)a3;
- (void)setSupportedCapabilities:(id)a3;
- (void)setZoneUsages:(id)a3;
@end

@implementation CKUpdateDeviceCapabilitiesOperationInfo

- (CKUpdateDeviceCapabilitiesOperationInfo)initWithSupportedCapabilities:(id)a3 lastSentCapabilities:(id)a4 zoneUsages:(id)a5 shareUsages:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CKUpdateDeviceCapabilitiesOperationInfo;
  v16 = [(CKOperationInfo *)&v24 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_copy(v10, v14, v15);
    supportedCapabilities = v16->_supportedCapabilities;
    v16->_supportedCapabilities = (NSArray *)v17;

    uint64_t v21 = objc_msgSend_copy(v11, v19, v20);
    lastSentCapabilities = v16->_lastSentCapabilities;
    v16->_lastSentCapabilities = (NSArray *)v21;

    objc_storeStrong((id *)&v16->_zoneUsages, a5);
    objc_storeStrong((id *)&v16->_shareUsages, a6);
  }

  return v16;
}

- (NSArray)supportedCapabilities
{
  return self->_supportedCapabilities;
}

- (void)setSupportedCapabilities:(id)a3
{
}

- (NSArray)lastSentCapabilities
{
  return self->_lastSentCapabilities;
}

- (void)setLastSentCapabilities:(id)a3
{
}

- (NSDictionary)zoneUsages
{
  return self->_zoneUsages;
}

- (void)setZoneUsages:(id)a3
{
}

- (NSDictionary)shareUsages
{
  return self->_shareUsages;
}

- (void)setShareUsages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareUsages, 0);
  objc_storeStrong((id *)&self->_zoneUsages, 0);
  objc_storeStrong((id *)&self->_lastSentCapabilities, 0);
  objc_storeStrong((id *)&self->_supportedCapabilities, 0);
}

@end