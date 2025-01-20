@interface CNFMLFindMyLocateSession
- (CNFMLFindMyLocateSession)init;
- (_TtC10ContactsUI19FindMyLocateSession)session;
- (void)sendFriendshipOfferTo:(id)a3 end:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6;
- (void)setSession:(id)a3;
@end

@implementation CNFMLFindMyLocateSession

- (void).cxx_destruct
{
}

- (void)setSession:(id)a3
{
}

- (_TtC10ContactsUI19FindMyLocateSession)session
{
  return self->_session;
}

- (void)sendFriendshipOfferTo:(id)a3 end:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(CNFMLFindMyLocateSession *)self session];
  [v12 sendFriendshipOfferTo:v11 end:a4 isFromGroup:v6 completion:v10];
}

- (CNFMLFindMyLocateSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNFMLFindMyLocateSession;
  v2 = [(CNFMLFindMyLocateSession *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10ContactsUI19FindMyLocateSession);
    session = v2->_session;
    v2->_session = v3;
  }
  return v2;
}

@end