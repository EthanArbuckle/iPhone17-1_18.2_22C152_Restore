@interface DEDRequestAdvertiser
+ (id)sharedInstance;
- (MCNearbyServiceAdvertiser)advertiser;
- (MCPeerID)peerID;
- (MCSession)session;
- (NSString)hostIdentifier;
- (id)displayName;
- (id)encodeRequestRecordAsJSON:(id)a3;
- (id)onPeerJoin;
- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6;
- (void)broadcastRecord:(id)a3;
- (void)sendRecord:(id)a3 toPeer:(id)a4;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5;
- (void)setAdvertiser:(id)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setOnPeerJoin:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSession:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation DEDRequestAdvertiser

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_23);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

uint64_t __38__DEDRequestAdvertiser_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_alloc_init(DEDRequestAdvertiser);
  return MEMORY[0x270F9A758]();
}

- (id)displayName
{
  uint64_t v3 = [(DEDRequestAdvertiser *)self hostIdentifier];
  if (v3
    && (v4 = (void *)v3,
        [(DEDRequestAdvertiser *)self hostIdentifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    v7 = NSString;
    v8 = [(DEDRequestAdvertiser *)self hostIdentifier];
    v9 = +[DEDUtils deviceName];
    v10 = [v7 stringWithFormat:@"%@ @ %@", v8, v9];
  }
  else
  {
    v10 = +[DEDUtils deviceName];
  }
  return v10;
}

- (void)start
{
  if (+[DEDUtils isDebugRequestsEnabled] && !self->_session)
  {
    id v3 = objc_alloc(MEMORY[0x263F136B8]);
    v4 = [(DEDRequestAdvertiser *)self displayName];
    v5 = (MCPeerID *)[v3 initWithDisplayName:v4];
    peerID = self->_peerID;
    self->_peerID = v5;

    id v7 = objc_alloc(MEMORY[0x263F136B0]);
    v8 = [(DEDRequestAdvertiser *)self peerID];
    v9 = (MCNearbyServiceAdvertiser *)[v7 initWithPeer:v8 discoveryInfo:0 serviceType:@"apple-frdb"];
    advertiser = self->_advertiser;
    self->_advertiser = v9;

    [(MCNearbyServiceAdvertiser *)self->_advertiser setDelegate:self];
    id v11 = objc_alloc(MEMORY[0x263F136C0]);
    v12 = [(DEDRequestAdvertiser *)self peerID];
    v13 = (MCSession *)[v11 initWithPeer:v12 securityIdentity:0 encryptionPreference:0];
    session = self->_session;
    self->_session = v13;

    [(MCSession *)self->_session setDelegate:self];
    v15 = [(DEDRequestAdvertiser *)self advertiser];
    [v15 startAdvertisingPeer];

    v16 = Log_3();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21FE04000, v16, OS_LOG_TYPE_INFO, "Request advertiser started", v17, 2u);
    }
  }
}

- (void)stop
{
  peerID = self->_peerID;
  self->_peerID = 0;

  v4 = [(DEDRequestAdvertiser *)self advertiser];
  [v4 stopAdvertisingPeer];

  v5 = [(DEDRequestAdvertiser *)self session];
  [v5 disconnect];

  advertiser = self->_advertiser;
  self->_advertiser = 0;

  session = self->_session;
  self->_session = 0;

  v8 = Log_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "Request advertiser stopped", v9, 2u);
  }
}

- (void)broadcastRecord:(id)a3
{
  id v4 = a3;
  if (+[DEDUtils isDebugRequestsEnabled])
  {
    v5 = [(DEDRequestAdvertiser *)self encodeRequestRecordAsJSON:v4];
    if (v5)
    {
      uint64_t v6 = [(DEDRequestAdvertiser *)self session];
      id v7 = [(DEDRequestAdvertiser *)self session];
      v8 = [v7 connectedPeers];
      id v11 = 0;
      [v6 sendData:v5 toPeers:v8 withMode:0 error:&v11];
      v9 = v11;

      if (v9)
      {
        v10 = Log_3();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[DEDRequestAdvertiser broadcastRecord:](v4);
        }
      }
    }
    else
    {
      v9 = Log_3();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[DEDRequestAdvertiser broadcastRecord:](v4);
      }
    }
  }
}

- (void)sendRecord:(id)a3 toPeer:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (+[DEDUtils isDebugRequestsEnabled])
  {
    v8 = [(DEDRequestAdvertiser *)self encodeRequestRecordAsJSON:v6];
    if (v8)
    {
      v9 = [(DEDRequestAdvertiser *)self session];
      v14[0] = v7;
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      id v13 = 0;
      [v9 sendData:v8 toPeers:v10 withMode:0 error:&v13];
      id v11 = v13;

      if (v11)
      {
        v12 = Log_3();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[DEDRequestAdvertiser sendRecord:toPeer:](v6, v7);
        }
      }
    }
    else
    {
      id v11 = Log_3();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DEDRequestAdvertiser sendRecord:toPeer:](v6);
      }
    }
  }
}

- (id)encodeRequestRecordAsJSON:(id)a3
{
  v29[8] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (encodeRequestRecordAsJSON__onceToken != -1) {
    dispatch_once(&encodeRequestRecordAsJSON__onceToken, &__block_literal_global_12);
  }
  v28[0] = @"URL";
  v26 = [v3 URL];
  v29[0] = v26;
  v28[1] = @"date";
  id v4 = (void *)encodeRequestRecordAsJSON__dateFormatter;
  v5 = [v3 date];
  id v6 = [v4 stringFromDate:v5];
  v29[1] = v6;
  v28[2] = @"method";
  id v7 = [v3 method];
  v29[2] = v7;
  v28[3] = @"isFailure";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isFailure"));
  v29[3] = v8;
  v28[4] = @"requestHeader";
  uint64_t v9 = [v3 requestHeader];
  v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = &stru_26D197018;
  }
  v29[4] = v11;
  v28[5] = @"requestBody";
  uint64_t v12 = [v3 requestBody];
  id v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_26D197018;
  }
  v29[5] = v14;
  v28[6] = @"responseHeader";
  uint64_t v15 = [v3 responseHeader];
  v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = &stru_26D197018;
  }
  v29[6] = v17;
  v28[7] = @"responseBody";
  uint64_t v18 = [v3 responseBody];
  v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = &stru_26D197018;
  }
  v29[7] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:8];

  id v27 = 0;
  v22 = [MEMORY[0x263F08900] dataWithJSONObject:v21 options:0 error:&v27];
  id v23 = v27;
  if (v23)
  {
    v24 = Log_3();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[DEDRequestAdvertiser encodeRequestRecordAsJSON:](v3, v23);
    }
  }
  return v22;
}

uint64_t __50__DEDRequestAdvertiser_encodeRequestRecordAsJSON___block_invoke()
{
  encodeRequestRecordAsJSON__dateFormatter = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5
{
  id v7 = a4;
  if (a5 == 2)
  {
    id v10 = v7;
    v8 = [(DEDRequestAdvertiser *)self onPeerJoin];

    id v7 = v10;
    if (v8)
    {
      uint64_t v9 = [(DEDRequestAdvertiser *)self onPeerJoin];
      ((void (**)(void, id))v9)[2](v9, v10);

      id v7 = v10;
    }
  }
}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, uint64_t))a6;
  BOOL v10 = +[DEDUtils isDebugRequestsEnabled];
  id v11 = Log_3();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = [v8 displayName];
      int v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Connecting to Request Debugger: [%@]", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v14 = [(DEDRequestAdvertiser *)self session];
    v9[2](v9, 1, v14);

    uint64_t v9 = (void (**)(id, uint64_t, uint64_t))v14;
  }
  else
  {
    if (v12)
    {
      uint64_t v15 = [v8 displayName];
      int v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Debug requests are disabled, but we got an invitation from [%@]", (uint8_t *)&v16, 0xCu);
    }
    v9[2](v9, 0, 0);
  }
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
}

- (id)onPeerJoin
{
  return self->_onPeerJoin;
}

- (void)setOnPeerJoin:(id)a3
{
}

- (MCSession)session
{
  return (MCSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSession:(id)a3
{
}

- (MCPeerID)peerID
{
  return (MCPeerID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPeerID:(id)a3
{
}

- (MCNearbyServiceAdvertiser)advertiser
{
  return (MCNearbyServiceAdvertiser *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAdvertiser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_onPeerJoin, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

- (void)broadcastRecord:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 URL];
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "Error encoding request record to send for [%@].", v4, v5, v6, v7, 2u);
}

- (void)broadcastRecord:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 URL];
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "Error sending request record for [%@].", v4, v5, v6, v7, 2u);
}

- (void)sendRecord:(void *)a1 toPeer:.cold.1(void *a1)
{
  v1 = [a1 URL];
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "Error encoding request record to send for [%@]", v4, v5, v6, v7, 2u);
}

- (void)sendRecord:(void *)a1 toPeer:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v3 = [a1 URL];
  uint64_t v4 = [a2 displayName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v5, v6, "Error sending request record for [%@] to [%@]", v7, v8, v9, v10, v11);
}

- (void)encodeRequestRecordAsJSON:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 URL];
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v5, v6, "Error encoding request record for [%@]: [%@]", v7, v8, v9, v10, v11);
}

@end