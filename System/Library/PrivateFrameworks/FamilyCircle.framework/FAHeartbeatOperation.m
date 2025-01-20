@interface FAHeartbeatOperation
+ (id)urlEndpoint;
- (BOOL)shouldForcePush;
- (FAHeartbeatOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5;
- (id)_followupIdentifiers;
- (id)fetchHeartbeatData;
- (void)setForcePush:(BOOL)a3;
@end

@implementation FAHeartbeatOperation

- (FAHeartbeatOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FAHeartbeatOperation;
  v11 = [(FANetworkClient *)&v14 initWithNetworkService:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_grandSlamSigner, a4);
    objc_storeStrong((id *)&v12->_familyGrandSlamSigner, a5);
  }

  return v12;
}

+ (id)urlEndpoint
{
  return @"familyHeartbeat";
}

- (id)fetchHeartbeatData
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(FAHeartbeatOperation *)self _followupIdentifiers];
  [v3 setObject:v4 forKeyedSubscript:@"notificationIDs"];

  v19 = [(FANetworkClient *)self networkService];
  v18 = [v19 ensureDeviceUnlockedSinceBoot];
  v5 = [v18 then];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000146EC;
  v24[3] = &unk_10004D0F8;
  v24[4] = self;
  v6 = ((void (**)(void, void *))v5)[2](v5, v24);
  v7 = [v6 then];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001473C;
  v22[3] = &unk_10004DCF8;
  v22[4] = self;
  id v23 = v3;
  v8 = (void (*)(void *, void *))v7[2];
  id v17 = v3;
  id v9 = v8(v7, v22);
  id v10 = [v9 then];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000147FC;
  v21[3] = &unk_10004D958;
  v21[4] = self;
  v11 = ((void (**)(void, void *))v10)[2](v10, v21);
  v12 = [v11 then];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001487C;
  v20[3] = &unk_10004D5B0;
  v20[4] = self;
  v13 = ((void (**)(void, void *))v12)[2](v12, v20);
  objc_super v14 = [v13 then];
  v15 = ((void (**)(void, Block_layout *))v14)[2](v14, &stru_10004DD38);

  return v15;
}

- (id)_followupIdentifiers
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = objc_alloc((Class)FLFollowUpController);
  id v4 = [v3 initWithClientIdentifier:FAFollowUpClientIdentifier];
  v5 = [v4 pendingFollowUpItems:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000149F0;
  v8[3] = &unk_10004DD60;
  id v6 = v2;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (BOOL)shouldForcePush
{
  return self->_forcePush;
}

- (void)setForcePush:(BOOL)a3
{
  self->_forcePush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
}

@end