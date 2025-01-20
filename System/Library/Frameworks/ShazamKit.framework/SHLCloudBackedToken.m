@interface SHLCloudBackedToken
- (CKServerChangeToken)serverChangeToken;
- (SHLCloudBackedToken)initWithToken:(id)a3;
@end

@implementation SHLCloudBackedToken

- (SHLCloudBackedToken)initWithToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLCloudBackedToken;
  v6 = [(SHLCloudBackedToken *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverChangeToken, a3);
  }

  return v7;
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void).cxx_destruct
{
}

@end