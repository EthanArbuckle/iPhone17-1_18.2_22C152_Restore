@interface CBSpatialInteractionPeerInfoClient
- (NSData)tokenData;
- (NSDictionary)userInfo;
- (unsigned)peerID;
- (unsigned)uwbTokenFlags;
- (void)setPeerID:(unsigned int)a3;
- (void)setTokenData:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUwbTokenFlags:(unsigned int)a3;
@end

@implementation CBSpatialInteractionPeerInfoClient

- (unsigned)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(unsigned int)a3
{
  self->_peerID = a3;
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setTokenData:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (unsigned)uwbTokenFlags
{
  return self->_uwbTokenFlags;
}

- (void)setUwbTokenFlags:(unsigned int)a3
{
  self->_uwbTokenFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_tokenData, 0);
}

@end