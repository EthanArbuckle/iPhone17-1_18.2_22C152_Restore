@interface _AFPeerInfoMutation
- (BOOL)getIsCommunalDevice;
- (BOOL)getIsDeviceOwnedByCurrentUser;
- (BOOL)getIsLocationSharingDevice;
- (BOOL)getIsSiriCloudSyncEnabled;
- (BOOL)isDirty;
- (_AFPeerInfoMutation)initWithBase:(id)a3;
- (id)getAceVersion;
- (id)getAssistantIdentifier;
- (id)getBuildVersion;
- (id)getHomeKitAccessoryIdentifier;
- (id)getIdsDeviceUniqueIdentifier;
- (id)getIdsIdentifier;
- (id)getMediaRouteIdentifier;
- (id)getMediaSystemIdentifier;
- (id)getMyriadTrialTreatment;
- (id)getName;
- (id)getProductType;
- (id)getRapportEffectiveIdentifier;
- (id)getRoomName;
- (id)getSharedUserIdentifier;
- (id)getUserInterfaceIdiom;
- (void)setAceVersion:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setHomeKitAccessoryIdentifier:(id)a3;
- (void)setIdsDeviceUniqueIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIsCommunalDevice:(BOOL)a3;
- (void)setIsDeviceOwnedByCurrentUser:(BOOL)a3;
- (void)setIsLocationSharingDevice:(BOOL)a3;
- (void)setIsSiriCloudSyncEnabled:(BOOL)a3;
- (void)setMediaRouteIdentifier:(id)a3;
- (void)setMediaSystemIdentifier:(id)a3;
- (void)setMyriadTrialTreatment:(id)a3;
- (void)setName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRapportEffectiveIdentifier:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setSharedUserIdentifier:(id)a3;
- (void)setUserInterfaceIdiom:(id)a3;
@end

@implementation _AFPeerInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadTrialTreatment, 0);
  objc_storeStrong((id *)&self->_aceVersion, 0);
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDeviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setMyriadTrialTreatment:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x80001u;
}

- (id)getMyriadTrialTreatment
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 8) != 0)
  {
    v2 = self->_myriadTrialTreatment;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base myriadTrialTreatment];
  }
  return v2;
}

- (void)setIsSiriCloudSyncEnabled:(BOOL)a3
{
  self->_isSiriCloudSyncEnabled = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x40001u;
}

- (BOOL)getIsSiriCloudSyncEnabled
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 4) != 0) {
    return self->_isSiriCloudSyncEnabled;
  }
  else {
    return [(AFPeerInfo *)self->_base isSiriCloudSyncEnabled];
  }
}

- (void)setIsLocationSharingDevice:(BOOL)a3
{
  self->_isLocationSharingDevice = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x20001u;
}

- (BOOL)getIsLocationSharingDevice
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 2) != 0) {
    return self->_isLocationSharingDevice;
  }
  else {
    return [(AFPeerInfo *)self->_base isLocationSharingDevice];
  }
}

- (void)setAceVersion:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x10001u;
}

- (id)getAceVersion
{
  if (*((unsigned char *)&self->_mutationFlags + 2))
  {
    v2 = self->_aceVersion;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base aceVersion];
  }
  return v2;
}

- (void)setUserInterfaceIdiom:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x8001u;
}

- (id)getUserInterfaceIdiom
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x80) != 0)
  {
    v2 = self->_userInterfaceIdiom;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base userInterfaceIdiom];
  }
  return v2;
}

- (void)setBuildVersion:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x4001u;
}

- (id)getBuildVersion
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x40) != 0)
  {
    v2 = self->_buildVersion;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base buildVersion];
  }
  return v2;
}

- (void)setProductType:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x2001u;
}

- (id)getProductType
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x20) != 0)
  {
    v2 = self->_productType;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base productType];
  }
  return v2;
}

- (void)setName:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x1001u;
}

- (id)getName
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x10) != 0)
  {
    v2 = self->_name;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base name];
  }
  return v2;
}

- (void)setRoomName:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getRoomName
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 8) != 0)
  {
    v2 = self->_roomName;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base roomName];
  }
  return v2;
}

- (void)setIsCommunalDevice:(BOOL)a3
{
  self->_isCommunalDevice = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getIsCommunalDevice
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 4) != 0) {
    return self->_isCommunalDevice;
  }
  else {
    return [(AFPeerInfo *)self->_base isCommunalDevice];
  }
}

- (void)setMediaRouteIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getMediaRouteIdentifier
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 2) != 0)
  {
    v2 = self->_mediaRouteIdentifier;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base mediaRouteIdentifier];
  }
  return v2;
}

- (void)setMediaSystemIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getMediaSystemIdentifier
{
  if (*((unsigned char *)&self->_mutationFlags + 1))
  {
    v2 = self->_mediaSystemIdentifier;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base mediaSystemIdentifier];
  }
  return v2;
}

- (void)setHomeKitAccessoryIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getHomeKitAccessoryIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_homeKitAccessoryIdentifier;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base homeKitAccessoryIdentifier];
  }
  return v2;
}

- (void)setRapportEffectiveIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getRapportEffectiveIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_rapportEffectiveIdentifier;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base rapportEffectiveIdentifier];
  }
  return v2;
}

- (void)setIdsDeviceUniqueIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getIdsDeviceUniqueIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_idsDeviceUniqueIdentifier;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base idsDeviceUniqueIdentifier];
  }
  return v2;
}

- (void)setIdsIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getIdsIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_idsIdentifier;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base idsIdentifier];
  }
  return v2;
}

- (void)setSharedUserIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 9u;
}

- (id)getSharedUserIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_sharedUserIdentifier;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base sharedUserIdentifier];
  }
  return v2;
}

- (void)setAssistantIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 5u;
}

- (id)getAssistantIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_assistantIdentifier;
  }
  else
  {
    v2 = [(AFPeerInfo *)self->_base assistantIdentifier];
  }
  return v2;
}

- (void)setIsDeviceOwnedByCurrentUser:(BOOL)a3
{
  self->_isDeviceOwnedByCurrentUser = a3;
  *(_DWORD *)&self->_mutationFlags |= 3u;
}

- (BOOL)getIsDeviceOwnedByCurrentUser
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_isDeviceOwnedByCurrentUser;
  }
  else {
    return [(AFPeerInfo *)self->_base isDeviceOwnedByCurrentUser];
  }
}

- (BOOL)isDirty
{
  return *(_DWORD *)&self->_mutationFlags & 1;
}

- (_AFPeerInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFPeerInfoMutation;
  v6 = [(_AFPeerInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end