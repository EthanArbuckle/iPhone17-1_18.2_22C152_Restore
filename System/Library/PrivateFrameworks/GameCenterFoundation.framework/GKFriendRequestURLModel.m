@interface GKFriendRequestURLModel
- (GKPlayer)initiator;
- (NSString)friendCode;
- (NSString)friendRequestState;
- (NSString)friendRequestVersion;
- (NSString)friendSupportPageURL;
- (id)description;
- (void)setFriendCode:(id)a3;
- (void)setFriendRequestState:(id)a3;
- (void)setFriendRequestVersion:(id)a3;
- (void)setFriendSupportPageURL:(id)a3;
- (void)setInitiator:(id)a3;
@end

@implementation GKFriendRequestURLModel

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(GKFriendRequestURLModel *)self friendSupportPageURL];
  v6 = [(GKFriendRequestURLModel *)self friendCode];
  v7 = [(GKFriendRequestURLModel *)self friendRequestState];
  v8 = [(GKFriendRequestURLModel *)self initiator];
  v9 = [(GKFriendRequestURLModel *)self friendRequestVersion];
  v10 = [v3 stringWithFormat:@"             \n\t <%@: %p>             \n\t friendSupportPageURL: %@             \n\t friendCode: %@             \n\t friendRequestState: %@             \n\t initiator: %@             \n\t friendRequestVersion: %@             \n             ", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)friendSupportPageURL
{
  return self->_friendSupportPageURL;
}

- (void)setFriendSupportPageURL:(id)a3
{
}

- (NSString)friendCode
{
  return self->_friendCode;
}

- (void)setFriendCode:(id)a3
{
}

- (NSString)friendRequestState
{
  return self->_friendRequestState;
}

- (void)setFriendRequestState:(id)a3
{
}

- (GKPlayer)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (NSString)friendRequestVersion
{
  return self->_friendRequestVersion;
}

- (void)setFriendRequestVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendRequestVersion, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_friendRequestState, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);

  objc_storeStrong((id *)&self->_friendSupportPageURL, 0);
}

@end