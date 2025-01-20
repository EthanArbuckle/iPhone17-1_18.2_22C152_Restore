@interface ASActivitySharingFriendQuery
- (ASActivitySharingFriendQuery)initWithActivitySharingClient:(id)a3 updateHandler:(id)a4;
@end

@implementation ASActivitySharingFriendQuery

- (ASActivitySharingFriendQuery)initWithActivitySharingClient:(id)a3 updateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASActivitySharingFriendQuery;
  v8 = [(ASActivitySharingFriendQuery *)&v14 init];
  if (v8)
  {
    v9 = [_ASActivitySharingFriendQuery alloc];
    v10 = [v6 activitySharingClient];
    uint64_t v11 = [(_ASActivitySharingFriendQuery *)v9 initWithActivitySharingClient:v10 updateHandler:v7];
    activitySharingFriendQuery = v8->_activitySharingFriendQuery;
    v8->_activitySharingFriendQuery = (_ASActivitySharingFriendQuery *)v11;
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end