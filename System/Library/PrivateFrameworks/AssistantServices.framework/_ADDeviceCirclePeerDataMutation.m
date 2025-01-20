@interface _ADDeviceCirclePeerDataMutation
- (BOOL)isDirty;
- (_ADDeviceCirclePeerDataMutation)initWithBase:(id)a3;
- (id)getAceVersion;
- (id)getAssistantIdentifier;
- (id)getBuildVersion;
- (id)getHomeAccessoryInfo;
- (id)getIsLocationSharingDevice;
- (id)getIsSiriCloudSyncEnabled;
- (id)getMyriadTrialTreatment;
- (id)getProductType;
- (id)getSharedUserIdentifier;
- (id)getUserAssignedDeviceName;
- (id)getUserInterfaceIdiom;
- (void)setAceVersion:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setHomeAccessoryInfo:(id)a3;
- (void)setIsLocationSharingDevice:(id)a3;
- (void)setIsSiriCloudSyncEnabled:(id)a3;
- (void)setMyriadTrialTreatment:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSharedUserIdentifier:(id)a3;
- (void)setUserAssignedDeviceName:(id)a3;
- (void)setUserInterfaceIdiom:(id)a3;
@end

@implementation _ADDeviceCirclePeerDataMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadTrialTreatment, 0);
  objc_storeStrong((id *)&self->_isSiriCloudSyncEnabled, 0);
  objc_storeStrong((id *)&self->_homeAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_isLocationSharingDevice, 0);
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_userAssignedDeviceName, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_aceVersion, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setMyriadTrialTreatment:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getMyriadTrialTreatment
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_myriadTrialTreatment;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base myriadTrialTreatment];
  }
  return v2;
}

- (void)setIsSiriCloudSyncEnabled:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getIsSiriCloudSyncEnabled
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_isSiriCloudSyncEnabled;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base isSiriCloudSyncEnabled];
  }
  return v2;
}

- (void)setHomeAccessoryInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getHomeAccessoryInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_homeAccessoryInfo;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base homeAccessoryInfo];
  }
  return v2;
}

- (void)setIsLocationSharingDevice:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getIsLocationSharingDevice
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_isLocationSharingDevice;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base isLocationSharingDevice];
  }
  return v2;
}

- (void)setUserInterfaceIdiom:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getUserInterfaceIdiom
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_userInterfaceIdiom;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base userInterfaceIdiom];
  }
  return v2;
}

- (void)setUserAssignedDeviceName:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getUserAssignedDeviceName
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_userAssignedDeviceName;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base userAssignedDeviceName];
  }
  return v2;
}

- (void)setSharedUserIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getSharedUserIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_sharedUserIdentifier;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base sharedUserIdentifier];
  }
  return v2;
}

- (void)setProductType:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getProductType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_productType;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base productType];
  }
  return v2;
}

- (void)setBuildVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getBuildVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_buildVersion;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base buildVersion];
  }
  return v2;
}

- (void)setAssistantIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getAssistantIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_assistantIdentifier;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base assistantIdentifier];
  }
  return v2;
}

- (void)setAceVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAceVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_aceVersion;
  }
  else
  {
    v2 = [(ADDeviceCirclePeerData *)self->_base aceVersion];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_ADDeviceCirclePeerDataMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceCirclePeerDataMutation;
  v6 = [(_ADDeviceCirclePeerDataMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end