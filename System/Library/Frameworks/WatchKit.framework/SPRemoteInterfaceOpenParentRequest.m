@interface SPRemoteInterfaceOpenParentRequest
- (BOOL)waitingForReply;
- (NSData)userInfoData;
- (id)reply;
- (void)setReply:(id)a3;
- (void)setUserInfoData:(id)a3;
- (void)setWaitingForReply:(BOOL)a3;
@end

@implementation SPRemoteInterfaceOpenParentRequest

- (BOOL)waitingForReply
{
  return self->_waitingForReply;
}

- (void)setWaitingForReply:(BOOL)a3
{
  self->_waitingForReply = a3;
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (void)setUserInfoData:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);

  objc_storeStrong((id *)&self->_userInfoData, 0);
}

@end