@interface _FTPasswordManagerCachedAuthTokenInfo
- (NSDictionary)alertInfo;
- (NSNumber)status;
- (NSString)profileID;
- (NSString)selfID;
- (NSString)token;
- (void)setAlertInfo:(id)a3;
- (void)setProfileID:(id)a3;
- (void)setSelfID:(id)a3;
- (void)setStatus:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation _FTPasswordManagerCachedAuthTokenInfo

- (NSString)profileID
{
  return self->_profileID;
}

- (void)setProfileID:(id)a3
{
}

- (NSString)selfID
{
  return self->_selfID;
}

- (void)setSelfID:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSDictionary)alertInfo
{
  return self->_alertInfo;
}

- (void)setAlertInfo:(id)a3
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_alertInfo, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_selfID, 0);

  objc_storeStrong((id *)&self->_profileID, 0);
}

@end