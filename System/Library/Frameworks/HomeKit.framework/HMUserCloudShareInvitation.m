@interface HMUserCloudShareInvitation
- (CKDeviceToDeviceShareInvitationToken)shareToken;
- (HMHome)home;
- (HMUser)fromUser;
- (HMUser)user;
- (HMUserCloudShareInvitation)initWithUser:(id)a3 URL:(id)a4 shareToken:(id)a5 containerID:(id)a6 forHome:(id)a7 fromUser:(id)a8;
- (NSString)containerID;
- (NSURL)shareURL;
@end

@implementation HMUserCloudShareInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromUser, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_shareToken, 0);

  objc_storeStrong((id *)&self->_shareURL, 0);
}

- (HMUser)fromUser
{
  return (HMUser *)objc_getProperty(self, a2, 48, 1);
}

- (HMUser)user
{
  return (HMUser *)objc_getProperty(self, a2, 40, 1);
}

- (HMHome)home
{
  return (HMHome *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (CKDeviceToDeviceShareInvitationToken)shareToken
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)shareURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (HMUserCloudShareInvitation)initWithUser:(id)a3 URL:(id)a4 shareToken:(id)a5 containerID:(id)a6 forHome:(id)a7 fromUser:(id)a8
{
  id v27 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HMUserCloudShareInvitation;
  v20 = [(HMUserCloudShareInvitation *)&v28 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_user, a3);
    uint64_t v22 = [v15 copy];
    shareURL = v21->_shareURL;
    v21->_shareURL = (NSURL *)v22;

    objc_storeStrong((id *)&v21->_shareToken, a5);
    objc_storeStrong((id *)&v21->_fromUser, a8);
    objc_storeStrong((id *)&v21->_home, a7);
    uint64_t v24 = [v17 copy];
    containerID = v21->_containerID;
    v21->_containerID = (NSString *)v24;
  }
  return v21;
}

@end