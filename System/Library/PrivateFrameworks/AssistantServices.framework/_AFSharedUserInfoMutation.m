@interface _AFSharedUserInfoMutation
- (BOOL)getCompanionLinkReady;
- (BOOL)getPersonalRequestsEnabled;
- (BOOL)isDirty;
- (_AFSharedUserInfoMutation)initWithBase:(id)a3;
- (id)getCompanionDeviceInfo;
- (id)getHomeUserId;
- (id)getICloudAltDSID;
- (id)getLoggableSharedUserId;
- (id)getSharedUserId;
- (void)setCompanionDeviceInfo:(id)a3;
- (void)setCompanionLinkReady:(BOOL)a3;
- (void)setHomeUserId:(id)a3;
- (void)setICloudAltDSID:(id)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setPersonalRequestsEnabled:(BOOL)a3;
- (void)setSharedUserId:(id)a3;
@end

@implementation _AFSharedUserInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_homeUserId, 0);
  objc_storeStrong((id *)&self->_companionDeviceInfo, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setICloudAltDSID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x81u;
}

- (id)getICloudAltDSID
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x80000000) != 0)
  {
    v2 = self->_iCloudAltDSID;
  }
  else
  {
    v2 = [(AFSharedUserInfo *)self->_base iCloudAltDSID];
  }
  return v2;
}

- (void)setHomeUserId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (id)getHomeUserId
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_homeUserId;
  }
  else
  {
    v2 = [(AFSharedUserInfo *)self->_base homeUserId];
  }
  return v2;
}

- (void)setCompanionLinkReady:(BOOL)a3
{
  self->_companionLinkReady = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (BOOL)getCompanionLinkReady
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_companionLinkReady;
  }
  else {
    return [(AFSharedUserInfo *)self->_base companionLinkReady];
  }
}

- (void)setPersonalRequestsEnabled:(BOOL)a3
{
  self->_personalRequestsEnabled = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (BOOL)getPersonalRequestsEnabled
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_personalRequestsEnabled;
  }
  else {
    return [(AFSharedUserInfo *)self->_base personalRequestsEnabled];
  }
}

- (void)setCompanionDeviceInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getCompanionDeviceInfo
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_companionDeviceInfo;
  }
  else
  {
    v2 = [(AFSharedUserInfo *)self->_base companionDeviceInfo];
  }
  return v2;
}

- (void)setLoggableSharedUserId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getLoggableSharedUserId
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_loggableSharedUserId;
  }
  else
  {
    v2 = [(AFSharedUserInfo *)self->_base loggableSharedUserId];
  }
  return v2;
}

- (void)setSharedUserId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getSharedUserId
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_sharedUserId;
  }
  else
  {
    v2 = [(AFSharedUserInfo *)self->_base sharedUserId];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSharedUserInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSharedUserInfoMutation;
  v6 = [(_AFSharedUserInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end