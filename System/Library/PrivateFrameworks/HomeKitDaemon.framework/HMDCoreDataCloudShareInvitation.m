@interface HMDCoreDataCloudShareInvitation
- (CKDeviceToDeviceShareInvitationToken)token;
- (HMDCoreDataCloudShareInvitation)initWithURL:(id)a3 token:(id)a4;
- (NSDictionary)content;
- (NSURL)url;
@end

@implementation HMDCoreDataCloudShareInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (CKDeviceToDeviceShareInvitationToken)token
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)content
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = [(HMDCoreDataCloudShareInvitation *)self url];
  v7 = v3;
  v4 = [(HMDCoreDataCloudShareInvitation *)self token];
  v8[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

- (HMDCoreDataCloudShareInvitation)initWithURL:(id)a3 token:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCoreDataCloudShareInvitation;
  v9 = [(HMDCoreDataCloudShareInvitation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_token, a4);
  }

  return v10;
}

@end