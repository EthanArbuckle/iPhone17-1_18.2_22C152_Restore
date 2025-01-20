@interface TKHostTokenConnection
- (NSString)slotName;
- (NSXPCListenerEndpoint)endpoint;
- (TKHostToken)token;
- (TKHostTokenConnection)initWithDriver:(id)a3 slot:(id)a4 AID:(id)a5 registry:(id)a6 error:(id *)a7;
- (TKHostTokenConnection)initWithToken:(id)a3;
- (void)dealloc;
@end

@implementation TKHostTokenConnection

- (TKHostTokenConnection)initWithToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKHostTokenConnection;
  v6 = [(TKHostTokenConnection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, a3);
    objc_msgSend(v5, "setConnectionCount:", (char *)objc_msgSend(v5, "connectionCount") + 1);
  }

  return v7;
}

- (TKHostTokenConnection)initWithDriver:(id)a3 slot:(id)a4 AID:(id)a5 registry:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v29 = 0;
  v16 = [v12 acquireTokenWithSlot:v13 AID:v14 tokenID:&v29 error:a7];
  id v17 = v29;
  v28 = v15;
  if (v16)
  {
    id v18 = [v15 createTokenWithTokenID:v17 persistent:0];
    objc_sync_enter(v18);
    v27 = [(TKHostTokenConnection *)self initWithToken:v18];
    if (v27)
    {
      [v18 setEndpoint:v16];
      id v19 = [objc_alloc((Class)TKSmartCardSlot) initWithEndpoint:v13 error:a7];
      v20 = [v19 name];
      [v18 setSlotName:v20];

      [v18 setDriver:v12];
      v21 = [v18 registry];
      v22 = [v21 delegate];
      v23 = [v18 registry];
      v24 = [v18 tokenID];
      [v22 hostTokenRegistry:v23 addedToken:v24];
    }
    objc_sync_exit(v18);

    self = v27;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (NSXPCListenerEndpoint)endpoint
{
  v2 = [(TKHostTokenConnection *)self token];
  v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (NSString)slotName
{
  v2 = [(TKHostTokenConnection *)self token];
  v3 = [v2 slotName];

  return (NSString *)v3;
}

- (void)dealloc
{
  id v3 = [(TKHostTokenConnection *)self token];
  objc_sync_enter(v3);
  v4 = (char *)[v3 connectionCount] - 1;
  [v3 setConnectionCount:v4];
  if (!v4)
  {
    [v3 setEndpoint:0];
    id v5 = [v3 registry];

    if (v5)
    {
      v6 = [v3 driver];
      v7 = [v3 tokenID];
      [v6 releaseTokenWithTokenID:v7];
    }
    [v3 setDriver:0];
  }
  objc_sync_exit(v3);

  v8.receiver = self;
  v8.super_class = (Class)TKHostTokenConnection;
  [(TKHostTokenConnection *)&v8 dealloc];
}

- (TKHostToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
}

@end