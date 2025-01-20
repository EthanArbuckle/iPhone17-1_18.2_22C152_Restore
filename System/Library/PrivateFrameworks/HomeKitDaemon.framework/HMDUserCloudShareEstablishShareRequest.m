@interface HMDUserCloudShareEstablishShareRequest
- (HMDUser)fromUser;
- (HMDUser)toUser;
- (HMDUserCloudShareEstablishShareRequest)initWithHome:(id)a3 fromUser:(id)a4 toUser:(id)a5 encodedShareURL:(id)a6 shareToken:(id)a7 containerID:(id)a8 currentDate:(id)a9 completion:(id)a10;
- (NSData)encodedShareURL;
- (NSData)shareToken;
- (id)completion;
- (id)description;
@end

@implementation HMDUserCloudShareEstablishShareRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_shareToken, 0);
  objc_storeStrong((id *)&self->_encodedShareURL, 0);
  objc_destroyWeak((id *)&self->_toUser);
  objc_destroyWeak((id *)&self->_fromUser);
}

- (id)completion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (NSData)shareToken
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (NSData)encodedShareURL
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (HMDUser)toUser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toUser);
  return (HMDUser *)WeakRetained;
}

- (HMDUser)fromUser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fromUser);
  return (HMDUser *)WeakRetained;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDUserCloudShareRequest *)self identifier];
  v5 = [(HMDUserCloudShareRequest *)self containerID];
  v6 = [(HMDUserCloudShareRequest *)self startDate];
  v7 = [v3 stringWithFormat:@"<HMDUserCloudShareEstablishShareRequest id = %@, container = %@, startDate = %@>", v4, v5, v6];

  return v7;
}

- (HMDUserCloudShareEstablishShareRequest)initWithHome:(id)a3 fromUser:(id)a4 toUser:(id)a5 encodedShareURL:(id)a6 shareToken:(id)a7 containerID:(id)a8 currentDate:(id)a9 completion:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v25 = a6;
  id v18 = a7;
  id v19 = a10;
  v26.receiver = self;
  v26.super_class = (Class)HMDUserCloudShareEstablishShareRequest;
  v20 = [(HMDUserCloudShareRequest *)&v26 initWithStartDate:a9 containerID:a8 home:a3];
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_fromUser, v16);
    objc_storeWeak((id *)&v21->_toUser, v17);
    objc_storeStrong((id *)&v21->_encodedShareURL, a6);
    objc_storeStrong((id *)&v21->_shareToken, a7);
    uint64_t v22 = [v19 copy];
    id completion = v21->_completion;
    v21->_id completion = (id)v22;
  }
  return v21;
}

@end