@interface HMHomeCloudShareResponse
- (CKShareParticipant)participant;
- (HMHomeCloudShareResponse)initWithOwnerUser:(id)a3 pariticipant:(id)a4 clientInfo:(id)a5;
- (HMUser)ownerUser;
- (HMUserCloudShareClientInfo)clientInfo;
@end

@implementation HMHomeCloudShareResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_ownerUser, 0);

  objc_storeStrong((id *)&self->_participant, 0);
}

- (HMUserCloudShareClientInfo)clientInfo
{
  return (HMUserCloudShareClientInfo *)objc_getProperty(self, a2, 24, 1);
}

- (HMUser)ownerUser
{
  return (HMUser *)objc_getProperty(self, a2, 16, 1);
}

- (CKShareParticipant)participant
{
  return (CKShareParticipant *)objc_getProperty(self, a2, 8, 1);
}

- (HMHomeCloudShareResponse)initWithOwnerUser:(id)a3 pariticipant:(id)a4 clientInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMHomeCloudShareResponse;
  v12 = [(HMHomeCloudShareResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ownerUser, a3);
    objc_storeStrong((id *)&v13->_participant, a4);
    objc_storeStrong((id *)&v13->_clientInfo, a5);
  }

  return v13;
}

@end