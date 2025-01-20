@interface HDMockIDSDevice
- (BOOL)hd_isEquivalentToDevice:(id)a3;
- (BOOL)isActive;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isLocallyPaired;
- (BOOL)supportsCinnamonAntimonyGloryF;
- (BOOL)supportsCinnamonHW;
- (NSArray)identities;
- (NSString)backgroundAtrialFibrillationVersion;
- (NSString)buildType;
- (NSString)electrocardiogramVersion;
- (NSString)modelNumber;
- (NSString)name;
- (NSString)productBuildVersion;
- (NSString)productType;
- (NSString)regionCode;
- (NSString)service;
- (NSString)systemVersion;
- (NSString)uniqueID;
- (NSString)uniqueIDOverride;
- (NSUUID)nanoRegistryPairingID;
- (NSUUID)nsuuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hd_destinationIdentifier;
- (int64_t)deviceType;
- (int64_t)relationship;
- (void)setBackgroundAtrialFibrillationVersion:(id)a3;
- (void)setBuildType:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setElectrocardiogramVersion:(id)a3;
- (void)setIdentities:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setModelNumber:(id)a3;
- (void)setName:(id)a3;
- (void)setNanoRegistryPairingID:(id)a3;
- (void)setNsuuid:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)setService:(id)a3;
- (void)setSupportsCinnamonAntimonyGloryF:(BOOL)a3;
- (void)setSupportsCinnamonHW:(BOOL)a3;
- (void)setSystemVersion:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUniqueIDOverride:(id)a3;
@end

@implementation HDMockIDSDevice

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HDMockIDSDevice);
  [(HDMockIDSDevice *)v4 setUniqueID:self->_uniqueID];
  [(HDMockIDSDevice *)v4 setUniqueIDOverride:self->_uniqueIDOverride];
  [(HDMockIDSDevice *)v4 setNsuuid:self->_nsuuid];
  [(HDMockIDSDevice *)v4 setService:self->_service];
  [(HDMockIDSDevice *)v4 setName:self->_name];
  [(HDMockIDSDevice *)v4 setProductBuildVersion:self->_productBuildVersion];
  [(HDMockIDSDevice *)v4 setBuildType:self->_buildType];
  [(HDMockIDSDevice *)v4 setDeviceType:self->_deviceType];
  [(HDMockIDSDevice *)v4 setProductType:self->_productType];
  [(HDMockIDSDevice *)v4 setModelNumber:self->_modelNumber];
  [(HDMockIDSDevice *)v4 setSystemVersion:self->_systemVersion];
  [(HDMockIDSDevice *)v4 setRegionCode:self->_regionCode];
  [(HDMockIDSDevice *)v4 setElectrocardiogramVersion:self->_electrocardiogramVersion];
  [(HDMockIDSDevice *)v4 setBackgroundAtrialFibrillationVersion:self->_backgroundAtrialFibrillationVersion];
  [(HDMockIDSDevice *)v4 setIsActive:self->_isActive];
  [(HDMockIDSDevice *)v4 setSupportsCinnamonHW:self->_supportsCinnamonHW];
  [(HDMockIDSDevice *)v4 setIdentities:self->_identities];
  [(HDMockIDSDevice *)v4 setSupportsCinnamonAntimonyGloryF:self->_supportsCinnamonAntimonyGloryF];
  return v4;
}

- (int64_t)relationship
{
  return 1;
}

- (BOOL)isLocallyPaired
{
  return 1;
}

- (BOOL)isDefaultPairedDevice
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (id)hd_destinationIdentifier
{
  v2 = (void *)IDSCopyIDForDevice();

  return v2;
}

- (BOOL)hd_isEquivalentToDevice:(id)a3
{
  id v4 = a3;
  v5 = [(HDMockIDSDevice *)self hd_deviceIdentifier];
  v6 = objc_msgSend(v4, "hd_deviceIdentifier");
  if (v5 == v6)
  {
    char v10 = 1;
  }
  else
  {
    v7 = objc_msgSend(v4, "hd_deviceIdentifier");
    if (v7)
    {
      v8 = [(HDMockIDSDevice *)self hd_deviceIdentifier];
      v9 = objc_msgSend(v4, "hd_deviceIdentifier");
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (NSUUID)nanoRegistryPairingID
{
  return self->_nanoRegistryPairingID;
}

- (void)setNanoRegistryPairingID:(id)a3
{
}

- (NSUUID)nsuuid
{
  return self->_nsuuid;
}

- (void)setNsuuid:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSString)uniqueIDOverride
{
  return self->_uniqueIDOverride;
}

- (void)setUniqueIDOverride:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)buildType
{
  return self->_buildType;
}

- (void)setBuildType:(id)a3
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

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (NSArray)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
}

- (NSString)electrocardiogramVersion
{
  return self->_electrocardiogramVersion;
}

- (void)setElectrocardiogramVersion:(id)a3
{
}

- (NSString)backgroundAtrialFibrillationVersion
{
  return self->_backgroundAtrialFibrillationVersion;
}

- (void)setBackgroundAtrialFibrillationVersion:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)supportsCinnamonHW
{
  return self->_supportsCinnamonHW;
}

- (void)setSupportsCinnamonHW:(BOOL)a3
{
  self->_supportsCinnamonHW = a3;
}

- (BOOL)supportsCinnamonAntimonyGloryF
{
  return self->_supportsCinnamonAntimonyGloryF;
}

- (void)setSupportsCinnamonAntimonyGloryF:(BOOL)a3
{
  self->_supportsCinnamonAntimonyGloryF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAtrialFibrillationVersion, 0);
  objc_storeStrong((id *)&self->_electrocardiogramVersion, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_buildType, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_uniqueIDOverride, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_nsuuid, 0);

  objc_storeStrong((id *)&self->_nanoRegistryPairingID, 0);
}

@end