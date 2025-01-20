@interface ADCloudKitShareAcceptanceParameters
- (ADCloudKitShareAcceptanceParameters)initWithURL:(id)a3 token:(id)a4 container:(id)a5 retryCount:(int64_t)a6;
- (CKDeviceToDeviceShareInvitationToken)token;
- (NSString)containerID;
- (NSURL)url;
- (int64_t)retryCount;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation ADCloudKitShareAcceptanceParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSString)containerID
{
  return self->_containerID;
}

- (CKDeviceToDeviceShareInvitationToken)token
{
  return self->_token;
}

- (NSURL)url
{
  return self->_url;
}

- (ADCloudKitShareAcceptanceParameters)initWithURL:(id)a3 token:(id)a4 container:(id)a5 retryCount:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ADCloudKitShareAcceptanceParameters;
  v14 = [(ADCloudKitShareAcceptanceParameters *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a3);
    objc_storeStrong((id *)&v15->_token, a4);
    objc_storeStrong((id *)&v15->_containerID, a5);
    v15->_retryCount = a6;
  }

  return v15;
}

@end