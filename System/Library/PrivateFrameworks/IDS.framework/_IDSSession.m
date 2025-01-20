@interface _IDSSession
- (BOOL)getAudioEnabled;
- (BOOL)getMuted;
- (BOOL)sendData:(id)a3 error:(id *)a4;
- (BOOL)shouldUseSocketForTransport;
- (NSString)uniqueID;
- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6;
- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 delegateContext:(id)a6;
- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 uniqueID:(id)a6 delegateContext:(id)a7;
- (id)_initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6;
- (id)_initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 connectionCountHint:(unint64_t)a6 needsToWaitForPreConnectionData:(BOOL)a7 uniqueID:(id)a8 delegateContext:(id)a9;
- (id)boostContext;
- (id)daemonController;
- (id)daemonListener;
- (id)getPreferences;
- (int)socket;
- (int64_t)inviteTimeout;
- (unint64_t)MTUForAddressFamily:(unint64_t)a3;
- (unint64_t)initialLinkType;
- (unsigned)sessionEndedReason;
- (unsigned)state;
- (void)_broadcastNewSessionToDaemon;
- (void)_callDelegateWithBlock:(id)a3;
- (void)_cleanupSocketPairConnections;
- (void)_setupSocketPairToDaemon;
- (void)_setupUnreliableSocketPairConnection;
- (void)acceptInvitation;
- (void)acceptInvitationWithData:(id)a3;
- (void)allocationDone:(id)a3 sessionInfo:(id)a4;
- (void)cancelInvitation;
- (void)cancelInvitationWithData:(id)a3;
- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)daemonDisconnected;
- (void)dealloc;
- (void)declineInvitation;
- (void)declineInvitationWithData:(id)a3;
- (void)endSession;
- (void)endSessionWithData:(id)a3;
- (void)reconnectSession;
- (void)sendAllocationRequest:(id)a3;
- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4;
- (void)sendInvitationWithOptions:(id)a3;
- (void)sendSessionMessage:(id)a3;
- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4;
- (void)session:(id)a3 audioEnabled:(BOOL)a4;
- (void)session:(id)a3 didReceiveReport:(id)a4;
- (void)session:(id)a3 invitationSentToTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5;
- (void)session:(id)a3 muted:(BOOL)a4;
- (void)sessionAcceptReceived:(id)a3 fromID:(id)a4 withData:(id)a5;
- (void)sessionCancelReceived:(id)a3 fromID:(id)a4 withData:(id)a5;
- (void)sessionDeclineReceived:(id)a3 fromID:(id)a4 withData:(id)a5;
- (void)sessionEndReceived:(id)a3 fromID:(id)a4 withData:(id)a5;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionMessageReceived:(id)a3 fromID:(id)a4 withData:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setBoostContext:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setInviteTimeout:(int64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)xpcObject:(id)a3 objectContext:(id)a4;
@end

@implementation _IDSSession

- (id)daemonListener
{
  v2 = +[IDSDaemonController sharedInstance];
  v3 = [v2 listener];

  return v3;
}

- (id)daemonController
{
  return +[IDSDaemonController sharedInstance];
}

- (id)_initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 connectionCountHint:(unint64_t)a6 needsToWaitForPreConnectionData:(BOOL)a7 uniqueID:(id)a8 delegateContext:(id)a9
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  if (_IDSRunningInDaemon())
  {
    v18 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }

    v19 = 0;
  }
  else
  {
    v20 = +[IDSInternalQueueController sharedInstance];
    int v21 = [v20 assertQueueIsCurrent];

    if (v21)
    {
      v22 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_191A430AC();
      }
    }
    v57.receiver = self;
    v57.super_class = (Class)_IDSSession;
    v23 = [(_IDSSession *)&v57 init];
    if (v23)
    {
      unint64_t v50 = a6;
      if ([v16 length])
      {
        v24 = (NSString *)v16;
      }
      else
      {
        v24 = [NSString stringGUID];
      }
      uniqueID = v23->_uniqueID;
      v23->_uniqueID = v24;
      BOOL v51 = a7;

      v26 = [v14 _internal];
      uint64_t v27 = [v26 uniqueID];
      accountID = v23->_accountID;
      v23->_accountID = (NSString *)v27;

      v29 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v52 = v15;
      id v30 = v15;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v54 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = [*(id *)(*((void *)&v53 + 1) + 8 * i) destinationURIs];
            [(NSSet *)v29 unionSet:v35];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v32);
      }

      destinations = v23->_destinations;
      v23->_destinations = v29;
      v37 = v29;

      uint64_t v38 = [MEMORY[0x1E4F59E30] weakRefWithObject:v17];
      id delegateContext = v23->_delegateContext;
      v23->_id delegateContext = (id)v38;

      queue = v23->_queue;
      v23->_queue = 0;

      delegate = v23->_delegate;
      v23->_delegate = 0;

      v23->_state = 0;
      v23->_transportType = 0;
      v23->_isAudioEnabled = 0;
      v23->_sessionEndedReason = 0;
      v23->_socket = -1;
      v23->_connectionCountHint = v50;
      v23->_needsToWaitForPreConnectionData = v51;
      v42 = [v14 _internal];
      v43 = [v42 serviceName];
      char v44 = [v43 isEqualToIgnoringCase:@"com.apple.private.alloy.screensharing"];

      v23->_isLegacy = v44;
      v45 = [v14 _internal];
      v46 = [v45 serviceName];
      int v47 = [v46 isEqualToIgnoringCase:@"com.apple.private.alloy.phonecontinuity"];

      if (v47) {
        v23->_shouldUseSocketForTransport = 1;
      }
      v48 = [(_IDSSession *)v23 daemonListener];
      [v48 addHandler:v23];

      id v15 = v52;
    }
    self = v23;
    v19 = self;
  }

  return v19;
}

- (id)_initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_IDSRunningInDaemon())
  {
    id v14 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }

    id v15 = 0;
  }
  else
  {
    id v16 = +[IDSInternalQueueController sharedInstance];
    int v17 = [v16 assertQueueIsCurrent];

    if (v17)
    {
      v18 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_191A43144();
      }
    }
    v69.receiver = self;
    v69.super_class = (Class)_IDSSession;
    v19 = [(_IDSSession *)&v69 init];
    if (v19)
    {
      v20 = [v12 objectForKey:*MEMORY[0x1E4F6B398]];
      v62 = v20;
      if ([v20 length])
      {
        int v21 = v20;
      }
      else
      {
        objc_msgSend(NSString, "stringGUID", v20);
        int v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      uniqueID = v19->_uniqueID;
      v19->_uniqueID = v21;

      v23 = [v10 _internal];
      uint64_t v24 = [v23 uniqueID];
      accountID = v19->_accountID;
      v19->_accountID = (NSString *)v24;

      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v64 = v11;
      id v27 = v11;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v70 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v66 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "destinationURIs", v62);
            [v26 unionSet:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v65 objects:v70 count:16];
        }
        while (v29);
      }

      objc_storeStrong((id *)&v19->_destinations, v26);
      uint64_t v33 = [MEMORY[0x1E4F59E30] weakRefWithObject:v13];
      id delegateContext = v19->_delegateContext;
      v19->_id delegateContext = (id)v33;

      queue = v19->_queue;
      v19->_queue = 0;

      delegate = v19->_delegate;
      v19->_delegate = 0;

      v19->_state = 0;
      v19->_isAudioEnabled = 0;
      v19->_sessionEndedReason = 0;
      v19->_socket = -1;
      v37 = [v12 objectForKey:*MEMORY[0x1E4F6B390]];
      v19->_transportType = [v37 integerValue];

      uint64_t v38 = [v12 objectForKey:*MEMORY[0x1E4F6B318]];
      v19->_connectionCountHint = [v38 unsignedIntegerValue];

      v39 = [v12 objectForKey:*MEMORY[0x1E4F6B338]];
      v19->_disallowCellularInterface = [v39 BOOLValue];

      v40 = [v12 objectForKey:*MEMORY[0x1E4F6B340]];
      v19->_disallowWifiInterface = [v40 BOOLValue];

      v41 = [v12 objectForKey:*MEMORY[0x1E4F6B380]];
      v19->_preferredAddressFamily = [v41 unsignedIntegerValue];

      v42 = [v12 objectForKey:*MEMORY[0x1E4F6B378]];
      v19->_preferCellularForCallSetup = [v42 BOOLValue];

      uint64_t v43 = [v12 objectForKey:*MEMORY[0x1E4F6B310]];
      clientUUID = v19->_clientUUID;
      v19->_clientUUID = (NSString *)v43;

      v45 = [v12 objectForKey:*MEMORY[0x1E4F6B330]];
      v19->_disableEncryption = [v45 BOOLValue];

      v46 = [v12 objectForKey:*MEMORY[0x1E4F6B388]];
      v19->_enableSingleChannelDirectMode = [v46 BOOLValue];

      int v47 = [v12 objectForKey:*MEMORY[0x1E4F6B300]];
      v19->_alwaysSkipSelf = [v47 BOOLValue];

      uint64_t v48 = *MEMORY[0x1E4F6B3A0];
      v49 = [v12 objectForKey:*MEMORY[0x1E4F6B3A0]];

      if (v49) {
        uint64_t v50 = v48;
      }
      else {
        uint64_t v50 = *MEMORY[0x1E4F6B368];
      }
      BOOL v51 = objc_msgSend(v12, "objectForKey:", v50, v62);
      v19->_needsToWaitForPreConnectionData = [v51 BOOLValue];

      id v52 = [v10 _internal];
      long long v53 = [v52 serviceName];
      char v54 = [v53 isEqualToIgnoringCase:@"com.apple.private.alloy.screensharing"];

      v19->_isLegacy = v54;
      long long v55 = [v10 _internal];
      long long v56 = [v55 serviceName];
      int v57 = [v56 isEqualToIgnoringCase:@"com.apple.private.alloy.phonecontinuity"];

      if (v57) {
        v19->_shouldUseSocketForTransport = 1;
      }
      v58 = [(_IDSSession *)v19 daemonListener];
      [v58 addHandler:v19];

      uint64_t v59 = [v12 mutableCopy];
      sessionConfig = v19->_sessionConfig;
      v19->_sessionConfig = (NSMutableDictionary *)v59;

      id v11 = v64;
    }
    self = v19;
    id v15 = self;
  }

  return v15;
}

- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 uniqueID:(id)a6 delegateContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (_IDSRunningInDaemon())
  {
    id v16 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }
    int v17 = 0;
  }
  else
  {
    v18 = +[IDSInternalQueueController sharedInstance];
    int v19 = [v18 assertQueueIsCurrent];

    if (v19)
    {
      v20 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_191A431DC();
      }
    }
    int v21 = [MEMORY[0x1E4F1CA60] dictionary];
    id v16 = v21;
    if (v14) {
      CFDictionarySetValue(v21, (const void *)*MEMORY[0x1E4F6B398], v14);
    }
    v22 = [NSNumber numberWithInteger:a5];
    if (v22) {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, (const void *)*MEMORY[0x1E4F6B390], v22);
    }

    CFDictionarySetValue((CFMutableDictionaryRef)v16, (const void *)*MEMORY[0x1E4F6B318], &unk_1EE28B628);
    CFDictionarySetValue((CFMutableDictionaryRef)v16, (const void *)*MEMORY[0x1E4F6B3A0], MEMORY[0x1E4F1CC28]);
    self = (_IDSSession *)[(_IDSSession *)self _initWithAccount:v12 destinations:v13 options:v16 delegateContext:v15];
    int v17 = self;
  }

  return v17;
}

- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 delegateContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (_IDSRunningInDaemon())
  {
    id v13 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }
    id v14 = 0;
  }
  else
  {
    id v15 = +[IDSInternalQueueController sharedInstance];
    int v16 = [v15 assertQueueIsCurrent];

    if (v16)
    {
      int v17 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_191A43274();
      }
    }
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v18 = [NSNumber numberWithInteger:a5];
    if (v18) {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, (const void *)*MEMORY[0x1E4F6B390], v18);
    }

    CFDictionarySetValue((CFMutableDictionaryRef)v13, (const void *)*MEMORY[0x1E4F6B318], &unk_1EE28B628);
    CFDictionarySetValue((CFMutableDictionaryRef)v13, (const void *)*MEMORY[0x1E4F6B3A0], MEMORY[0x1E4F1CC28]);
    self = (_IDSSession *)[(_IDSSession *)self _initWithAccount:v10 destinations:v11 options:v13 delegateContext:v12];
    [(_IDSSession *)self _broadcastNewSessionToDaemon];
    id v14 = self;
  }

  return v14;
}

- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_IDSRunningInDaemon())
  {
    id v14 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }

    id v15 = 0;
  }
  else
  {
    int v16 = +[IDSInternalQueueController sharedInstance];
    int v17 = [v16 assertQueueIsCurrent];

    if (v17)
    {
      v18 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_191A4330C();
      }
    }
    self = (_IDSSession *)[(_IDSSession *)self _initWithAccount:v10 destinations:v11 options:v12 delegateContext:v13];
    [(_IDSSession *)self _broadcastNewSessionToDaemon];
    id v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  v3 = [(_IDSSession *)self daemonController];
  v4 = self->_uniqueID;
  v5 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A1CF90;
  v11[3] = &unk_1E57291B8;
  id v12 = v3;
  v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [v5 performBlock:v11];

  int socket = self->_socket;
  if ((socket & 0x80000000) == 0)
  {
    close(socket);
    self->_int socket = -1;
  }
  [(_IDSSession *)self _cleanupSocketPairConnections];
  v9 = [(_IDSSession *)self daemonListener];
  [v9 removeHandler:self];

  v10.receiver = self;
  v10.super_class = (Class)_IDSSession;
  [(_IDSSession *)&v10 dealloc];
}

- (void)daemonDisconnected
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A433A4();
    }
  }
  if ([(NSString *)self->_uniqueID length])
  {
    v6 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      int v8 = 138412290;
      v9 = uniqueID;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Disconnected from daemon, notifying client of session %@", (uint8_t *)&v8, 0xCu);
    }

    [(_IDSSession *)self sessionEnded:self->_uniqueID withReason:16 error:0];
  }
}

- (void)_broadcastNewSessionToDaemon
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A435A4();
    }
  }
  if (![(NSString *)self->_uniqueID length])
  {
    v6 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A4352C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (![(NSString *)self->_accountID length])
  {
    id v14 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A434B4(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  if (![(NSSet *)self->_destinations count])
  {
    v22 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_191A4343C(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  accountID = self->_accountID;
  if (accountID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B2F8], accountID);
  }
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B398], uniqueID);
  }
  uint64_t v32 = [(NSSet *)self->_destinations allObjects];
  if (v32) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B328], v32);
  }

  uint64_t v33 = [NSNumber numberWithInteger:self->_transportType];
  if (v33) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B390], v33);
  }

  v34 = [(_IDSSession *)self daemonController];
  v35 = [v34 listenerID];

  if (v35) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B308], v35);
  }

  v36 = [NSNumber numberWithUnsignedInteger:self->_connectionCountHint];
  if (v36) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B318], v36);
  }

  v37 = [NSNumber numberWithBool:self->_needsToWaitForPreConnectionData];
  if (v37) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B3A0], v37);
  }

  uint64_t v38 = [NSNumber numberWithBool:self->_disallowCellularInterface];
  if (v38) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B338], v38);
  }

  v39 = [NSNumber numberWithBool:self->_disallowWifiInterface];
  if (v39) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B340], v39);
  }

  v40 = [NSNumber numberWithUnsignedInteger:self->_preferredAddressFamily];
  if (v40) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B380], v40);
  }

  v41 = [NSNumber numberWithBool:self->_preferCellularForCallSetup];
  if (v41) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B378], v41);
  }

  clientUUID = self->_clientUUID;
  if (clientUUID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B310], clientUUID);
  }
  uint64_t v43 = [NSNumber numberWithBool:self->_disableEncryption];
  if (v43) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B330], v43);
  }

  char v44 = [NSNumber numberWithBool:self->_enableSingleChannelDirectMode];
  if (v44) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B388], v44);
  }

  v45 = [NSNumber numberWithBool:self->_alwaysSkipSelf];
  if (v45) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B300], v45);
  }

  v46 = [(_IDSSession *)self daemonController];
  [v46 setupNewSessionWithConfiguration:self->_sessionConfig];

  sessionConfig = self->_sessionConfig;
  self->_sessionConfig = 0;
}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[IDSInternalQueueController sharedInstance];
    int v6 = [v5 assertQueueIsCurrent];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A4363C();
      }
    }
    uint64_t v8 = [(CUTWeakReference *)self->_delegate object];
    uint64_t v9 = (void *)v8;
    queue = self->_queue;
    if (queue && v8)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_191A1D614;
      v11[3] = &unk_1E5729880;
      id v13 = v4;
      id v12 = v9;
      dispatch_async(queue, v11);
    }
  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v6 = (CUTWeakReference *)a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A436D4();
    }
  }
  uint64_t v11 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Setting up session delegate %p", buf, 0xCu);
  }

  if (self->_delegate != v6)
  {
    id v12 = [MEMORY[0x1E4F59E30] weakRefWithObject:v6];
    delegate = self->_delegate;
    self->_delegate = v12;
  }
  objc_storeStrong((id *)&self->_queue, a4);
  if (self->_state == 2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_191A1D800;
    v14[3] = &unk_1E572D798;
    v14[4] = self;
    [(_IDSSession *)self _callDelegateWithBlock:v14];
  }
  else if (self->_isLegacy)
  {
    [(_IDSSession *)self _setupSocketPairToDaemon];
  }
}

- (int)socket
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A4376C();
    }
  }
  if (self->_state == 1) {
    return self->_socket;
  }
  else {
    return -1;
  }
}

- (NSString)uniqueID
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A43804();
    }
  }
  uniqueID = self->_uniqueID;

  return uniqueID;
}

- (void)_setupUnreliableSocketPairConnection
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A43914();
    }
  }
  unreliableSocketPairConnection = self->_unreliableSocketPairConnection;
  id v7 = +[IDSLogging _IDSSession];
  uint64_t v8 = v7;
  if (unreliableSocketPairConnection)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A4389C(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Setting up socket pair to daemon", v21, 2u);
    }

    id v16 = objc_alloc(MEMORY[0x1E4F6B3E0]);
    uint64_t socket = self->_socket;
    uint64_t v8 = +[IDSInternalQueueController sharedInstance];
    uint64_t v18 = [v8 queue];
    uint64_t v19 = (IDSBaseSocketPairConnection *)[v16 initWithSocket:socket queue:v18 delegate:self];
    uint64_t v20 = self->_unreliableSocketPairConnection;
    self->_unreliableSocketPairConnection = v19;
  }
}

- (void)_setupSocketPairToDaemon
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A43FDC();
    }
  }
  *(void *)uint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  if (socketpair(1, 2, 0, v27) < 0)
  {
    __error();
    int v6 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A43F4C();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  int v7 = fcntl(v27[0], 3, 0);
  if (v7 < 0)
  {
    __error();
    uint64_t v8 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A43EBC();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  if (fcntl(v27[0], 4, v7 | 4u) < 0)
  {
    __error();
    uint64_t v9 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A43E2C();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  int v10 = fcntl(v27[1], 3, 0);
  if (v10 < 0)
  {
    __error();
    uint64_t v11 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A43D9C();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  if (fcntl(v27[1], 4, v10 | 4u) < 0)
  {
    __error();
    uint64_t v12 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A43D0C();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  int v26 = 1;
  if (setsockopt(v27[0], 0xFFFF, 4130, &v26, 4u) < 0)
  {
    __error();
    uint64_t v13 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A43C7C();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  if (setsockopt(v27[1], 0xFFFF, 4130, &v26, 4u) < 0)
  {
    __error();
    uint64_t v14 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A43BEC();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  int v25 = 0x40000;
  if (setsockopt(v27[0], 0xFFFF, 4097, &v25, 4u) < 0)
  {
    __error();
    uint64_t v15 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_191A43B5C();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  if (setsockopt(v27[1], 0xFFFF, 4097, &v25, 4u) < 0)
  {
    __error();
    id v16 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A43ACC();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  if (setsockopt(v27[0], 0xFFFF, 4098, &v25, 4u) < 0)
  {
    __error();
    uint64_t v17 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_191A43A3C();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  if (setsockopt(v27[1], 0xFFFF, 4098, &v25, 4u) < 0)
  {
    __error();
    uint64_t v18 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_191A439AC();
    }

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    [(_IDSSession *)self endSession];
  }
  int v19 = v27[1];
  self->_uint64_t socket = v27[0];
  xpc_object_t v20 = xpc_fd_create(v19);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v21 setObject:@"socket" forKey:@"object-type"];
  [v21 setObject:@"session-socket" forKey:@"socket-type"];
  [v21 setObject:self->_uniqueID forKey:@"sessionID"];
  v22 = [(CUTWeakReference *)self->_delegate object];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v23 = [NSNumber numberWithBool:1];
    [v21 setObject:v23 forKey:@"raw-socket"];
  }
  uint64_t v24 = [(_IDSSession *)self daemonController];
  [v24 sendXPCObject:v20 objectContext:v21];

  if (v20) {
  close(v19);
  }
}

- (void)_cleanupSocketPairConnections
{
  [(IDSBaseSocketPairConnection *)self->_unreliableSocketPairConnection endSession];
  unreliableSocketPairConnection = self->_unreliableSocketPairConnection;
  self->_unreliableSocketPairConnection = 0;
}

- (void)sendAllocationRequest:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A4407C();
    }
  }
  uint64_t v8 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Sending allocation request with options %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(_IDSSession *)self daemonController];
  [v9 sendAllocationRequest:self->_uniqueID options:v4];
}

- (void)sendInvitationWithOptions:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A44114();
    }
  }
  uint64_t v8 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation with options %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(_IDSSession *)self daemonController];
  [v9 sendInvitation:self->_uniqueID withOptions:v4];
}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A441AC();
    }
  }
  int v10 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 length];
    uint64_t v12 = @"NO";
    if (v4) {
      uint64_t v12 = @"YES";
    }
    int v14 = 134218242;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation with data (%lu bytes), declineOnError %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v13 = [(_IDSSession *)self daemonController];
  [v13 sendInvitation:self->_uniqueID withData:v6 declineOnError:v4];
}

- (void)cancelInvitation
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A44244();
    }
  }
  id v6 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Cancel", v8, 2u);
  }

  int v7 = [(_IDSSession *)self daemonController];
  [v7 cancelInvitation:self->_uniqueID];
}

- (void)cancelInvitationWithData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A442DC();
    }
  }
  int v8 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v4 length];
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Cancel with data (%lu bytes)", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(_IDSSession *)self daemonController];
  [v9 cancelInvitation:self->_uniqueID withData:v4];
}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A44374();
    }
  }
  int v8 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Cancel with Reason %u", (uint8_t *)v10, 8u);
  }

  uint64_t v9 = [(_IDSSession *)self daemonController];
  [v9 cancelInvitation:self->_uniqueID withRemoteEndedReasonOverride:v3];
}

- (void)acceptInvitation
{
  uint64_t v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A4440C();
    }
  }
  int v6 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Accept", v8, 2u);
  }

  int v7 = [(_IDSSession *)self daemonController];
  [v7 acceptInvitation:self->_uniqueID];
}

- (void)acceptInvitationWithData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A444A4();
    }
  }
  int v8 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v4 length];
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Accept with data (%lu bytes)", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(_IDSSession *)self daemonController];
  [v9 acceptInvitation:self->_uniqueID withData:v4];
}

- (void)declineInvitation
{
  uint64_t v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A4453C();
    }
  }
  int v6 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Decline", v8, 2u);
  }

  int v7 = [(_IDSSession *)self daemonController];
  [v7 declineInvitation:self->_uniqueID];
}

- (void)declineInvitationWithData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A445D4();
    }
  }
  int v8 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v4 length];
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Decline with data (%lu bytes)", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(_IDSSession *)self daemonController];
  [v9 declineInvitation:self->_uniqueID withData:v4];
}

- (void)reconnectSession
{
  uint64_t v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A4466C();
    }
  }
  int v6 = [(_IDSSession *)self daemonController];
  [v6 reconnectSessionWithUniqueID:self->_uniqueID];
}

- (void)endSession
{
  uint64_t v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A44704();
    }
  }
  int v6 = [(_IDSSession *)self daemonController];
  [v6 endSession:self->_uniqueID];

  [(_IDSSession *)self _cleanupSocketPairConnections];
  self->_state = 2;
}

- (void)endSessionWithData:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A4479C();
    }
  }
  int v8 = [(_IDSSession *)self daemonController];
  [v8 endSession:self->_uniqueID withData:v4];
}

- (void)sendSessionMessage:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A44834();
    }
  }
  int v8 = [(_IDSSession *)self daemonController];
  [v8 sendSessionMessage:v4 toDestinations:self->_destinations forSessionWithUniqueID:self->_uniqueID];
}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = a4;
  int v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A448CC();
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v21 = v6;
  [MEMORY[0x1E4F6B438] destinationWithDestinations:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v20 = long long v26 = 0u;
  uint64_t v11 = [v20 destinationURIs];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if ([(NSSet *)self->_destinations containsObject:v16])
        {
          [v10 addObject:v16];
        }
        else
        {
          uint64_t v17 = +[IDSLogging _IDSSession];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            destinations = self->_destinations;
            *(_DWORD *)buf = 138478083;
            uint64_t v28 = v16;
            __int16 v29 = 2113;
            uint64_t v30 = destinations;
            _os_log_error_impl(&dword_19190B000, v17, OS_LOG_TYPE_ERROR, "Skipping destination %{private}@, which is not in this session's list of destinations: %{private}@", buf, 0x16u);
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }

  int v19 = [(_IDSSession *)self daemonController];
  [v19 sendSessionMessage:v22 toDestinations:v10 forSessionWithUniqueID:self->_uniqueID];
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A44964();
    }
  }
  int v8 = [(_IDSSession *)self daemonController];
  [v8 setAudioEnabled:v3 forSessionWithUniqueID:self->_uniqueID];
}

- (BOOL)getAudioEnabled
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A449FC();
    }
  }
  return self->_isAudioEnabled;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A44A94();
    }
  }
  int v8 = [(_IDSSession *)self daemonController];
  [v8 setMuted:v3 forSessionWithUniqueID:self->_uniqueID];
}

- (BOOL)getMuted
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A44B2C();
    }
  }
  return self->_isMuted;
}

- (void)setPreferences:(id)a3
{
  int v4 = (NSMutableDictionary *)a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A44BC4();
    }
  }
  if (self->_preferences != v4)
  {
    int v8 = (NSMutableDictionary *)[(NSMutableDictionary *)v4 mutableCopy];
    preferences = self->_preferences;
    self->_preferences = v8;

    id v10 = [(_IDSSession *)self daemonController];
    [v10 setPreferences:v4 forSessionWithUniqueID:self->_uniqueID];
  }
}

- (id)getPreferences
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A44C5C();
    }
  }
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_preferences];

  return v6;
}

- (void)setInviteTimeout:(int64_t)a3
{
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A44CF4();
    }
  }
  int v8 = [(_IDSSession *)self daemonController];
  [v8 setInviteTimetout:a3 forSessionWithUniqueID:self->_uniqueID];
}

- (int64_t)inviteTimeout
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A44D8C();
    }
  }
  return self->_inviteTimeout;
}

- (unsigned)sessionEndedReason
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A44E24();
    }
  }
  return self->_sessionEndedReason;
}

- (BOOL)shouldUseSocketForTransport
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldUseSocketForTransport) {
      int v4 = @"YES";
    }
    else {
      int v4 = @"NO";
    }
    int v6 = 138412290;
    int v7 = v4;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Asked if shouldUseSocketForTransport %@", (uint8_t *)&v6, 0xCu);
  }

  return self->_shouldUseSocketForTransport;
}

- (unint64_t)MTUForAddressFamily:(unint64_t)a3
{
  if (a3 == 1) {
    return 1378;
  }
  else {
    return 1228;
  }
}

- (BOOL)sendData:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A45024();
    }
  }
  if (self->_state != 1)
  {
    uint64_t v14 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A44FAC(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    if (a4)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v23 = *MEMORY[0x1E4F6B348];
      uint64_t v24 = 1;
LABEL_15:
      BOOL v13 = 0;
      *a4 = (id)[v22 initWithDomain:v23 code:v24 userInfo:0];
      goto LABEL_20;
    }
LABEL_19:
    BOOL v13 = 0;
    goto LABEL_20;
  }
  if (!self->_unreliableSocketPairConnection)
  {
    long long v25 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_191A44EBC(v25, v26, v27, v28, v29, v30, v31, v32);
    }

    goto LABEL_19;
  }
  uint64_t v10 = [v6 length];
  uint64_t v11 = +[IDSLogging _IDSSession];
  uint64_t v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A44F34(v12, v34, v35, v36, v37, v38, v39, v40);
    }

    if (a4)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v23 = *MEMORY[0x1E4F6B348];
      uint64_t v24 = 2;
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v41 = 134218240;
    uint64_t v42 = [v6 hash];
    __int16 v43 = 2048;
    uint64_t v44 = [v6 length];
    _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_INFO, "Sending data Client -> Daemon  (hash: %lu)  (length: %lu)", (uint8_t *)&v41, 0x16u);
  }

  [(IDSBaseSocketPairConnection *)self->_unreliableSocketPairConnection sendData:v6];
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

- (void)sessionAcceptReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (NSString *)a4;
  id v10 = a5;
  uint64_t v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    BOOL v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A450BC();
    }
  }
  uint64_t v14 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Session accept received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    uint64_t v15 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v9, 0);
    destinations = self->_destinations;
    self->_destinations = v15;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_191A1FE54;
    v19[3] = &unk_1E572D7C0;
    v19[4] = self;
    uint64_t v20 = v9;
    id v21 = v10;
    [(_IDSSession *)self _callDelegateWithBlock:v19];
  }
  else
  {
    uint64_t v17 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = uniqueID;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring accept, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)sessionDeclineReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (NSString *)a4;
  id v10 = a5;
  uint64_t v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    BOOL v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A45154();
    }
  }
  uint64_t v14 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Session decline received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    uint64_t v15 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v9, 0);
    destinations = self->_destinations;
    self->_destinations = v15;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_191A2016C;
    v19[3] = &unk_1E572D7C0;
    v19[4] = self;
    uint64_t v20 = v9;
    id v21 = v10;
    [(_IDSSession *)self _callDelegateWithBlock:v19];
  }
  else
  {
    uint64_t v17 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = uniqueID;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring decline, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)sessionCancelReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (NSString *)a4;
  id v10 = a5;
  uint64_t v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    BOOL v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A451EC();
    }
  }
  uint64_t v14 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Session cancel received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    uint64_t v15 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v9, 0);
    destinations = self->_destinations;
    self->_destinations = v15;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_191A20484;
    v19[3] = &unk_1E572D7C0;
    v19[4] = self;
    uint64_t v20 = v9;
    id v21 = v10;
    [(_IDSSession *)self _callDelegateWithBlock:v19];
  }
  else
  {
    uint64_t v17 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = uniqueID;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring cancel, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)sessionMessageReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (NSString *)a4;
  id v10 = a5;
  uint64_t v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    BOOL v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A45284();
    }
  }
  uint64_t v14 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Session message received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_191A2076C;
    v17[3] = &unk_1E572D7C0;
    v17[4] = self;
    uint64_t v18 = v9;
    id v19 = v10;
    [(_IDSSession *)self _callDelegateWithBlock:v17];
  }
  else
  {
    uint64_t v15 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v21 = uniqueID;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring message, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)sessionEndReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (NSString *)a4;
  id v10 = a5;
  uint64_t v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    BOOL v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A4531C();
    }
  }
  uint64_t v14 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Session end received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_191A20A24;
    v17[3] = &unk_1E572D7C0;
    v17[4] = self;
    uint64_t v18 = v9;
    id v19 = v10;
    [(_IDSSession *)self _callDelegateWithBlock:v17];
  }
  else
  {
    uint64_t v15 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v21 = uniqueID;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring end, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 invitationSentToTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = (NSString *)a3;
  uint64_t v9 = (NSString *)a4;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A453B4();
    }
  }
  BOOL v13 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    if (v5) {
      uint64_t v14 = @"YES";
    }
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v14;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Session %@ invitation sent to tokens %@ shouldBreakBeforeMake %@", buf, 0x20u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_191A20CDC;
    v17[3] = &unk_1E572D7E8;
    v17[4] = self;
    uint64_t v18 = v9;
    BOOL v19 = v5;
    [(_IDSSession *)self _callDelegateWithBlock:v17];
  }
  else
  {
    uint64_t v15 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v21 = uniqueID;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring session:invitationSentToTokens:, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)allocationDone:(id)a3 sessionInfo:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A4544C();
    }
  }
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_191A20F4C;
    v13[3] = &unk_1E572D810;
    v13[4] = self;
    id v14 = v7;
    [(_IDSSession *)self _callDelegateWithBlock:v13];
  }
  else
  {
    int v11 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = uniqueID;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring session started, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)sessionStarted:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = (NSString *)a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A454E4();
    }
  }
  id v8 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v13 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Session started for IDSSessionID: %@", buf, 0xCu);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v4])
  {
    self->_state = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_191A211B0;
    v11[3] = &unk_1E572D798;
    void v11[4] = self;
    [(_IDSSession *)self _callDelegateWithBlock:v11];
  }
  else
  {
    int v9 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      BOOL v13 = uniqueID;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring session started, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = (NSString *)a3;
  int v9 = (NSString *)a5;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A4557C();
    }
  }
  BOOL v13 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Session ended %@ with error: %@", buf, 0x16u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    [(_IDSSession *)self _cleanupSocketPairConnections];
    self->_state = 2;
    if (a4 <= 1) {
      unsigned int v14 = 1;
    }
    else {
      unsigned int v14 = a4;
    }
    self->_sessionEndedReason = v14;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_191A21460;
    v17[3] = &unk_1E572D838;
    v17[4] = self;
    unsigned int v19 = a4;
    id v18 = v9;
    [(_IDSSession *)self _callDelegateWithBlock:v17];
  }
  else
  {
    uint64_t v15 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v21 = uniqueID;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring session ended, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 audioEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    int v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A45614();
    }
  }
  id v10 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = @"NO";
    if (v4) {
      int v11 = @"YES";
    }
    int v14 = 138412290;
    uint64_t v15 = v11;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Session audio enabled ? %@", (uint8_t *)&v14, 0xCu);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    self->_isAudioEnabled = v4;
  }
  else
  {
    int v12 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      int v14 = 138412546;
      uint64_t v15 = (__CFString *)uniqueID;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring audioEnabled, session doesn't match %@ vs. %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)session:(id)a3 muted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    int v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A456AC();
    }
  }
  id v10 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = @"NO";
    if (v4) {
      int v11 = @"YES";
    }
    int v14 = 138412290;
    uint64_t v15 = v11;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Session muted ? %@", (uint8_t *)&v14, 0xCu);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    self->_isMuted = v4;
  }
  else
  {
    int v12 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      int v14 = 138412546;
      uint64_t v15 = (__CFString *)uniqueID;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring muted, session doesn't match %@ vs. %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFDictionaryRef Value = (const __CFDictionary *)a4;
  CFDictionaryRef v8 = Value;
  if (Value)
  {
    int v9 = (id)CFDictionaryGetValue(Value, @"object-type");
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v8, @"sessionID");
  }
  else
  {
    int v9 = 0;
  }
  CFDictionaryRef v10 = Value;
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v10])
  {
    int v11 = [(__CFDictionary *)v8 objectForKey:@"error"];
    int v12 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412546;
      *(void *)uint64_t v26 = v6;
      *(_WORD *)&v26[8] = 2112;
      *(void *)&v26[10] = v8;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "xpc object: [%@] context: [%@]", (uint8_t *)&v25, 0x16u);
    }

    if ([v9 isEqualToIgnoringCase:@"session-device-socket"])
    {
      if (v6)
      {
        int v13 = xpc_fd_dup(v6);
      }
      else
      {
        self->_shouldUseSocketForTransport = 0;
        int v13 = -1;
      }
      [(_IDSSession *)self _cleanupSocketPairConnections];
      self->_int socket = v13;
      id v21 = +[IDSLogging _IDSSession];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int socket = self->_socket;
        int v25 = 67109378;
        *(_DWORD *)uint64_t v26 = socket;
        *(_WORD *)&v26[4] = 2112;
        *(void *)&v26[6] = v11;
        _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "Received XPC Response/Socket: %d    Error: %@", (uint8_t *)&v25, 0x12u);
      }

      [(_IDSSession *)self sessionStarted:self->_uniqueID];
      goto LABEL_28;
    }
    if ([v9 isEqualToIgnoringCase:@"session-initial-link-type"])
    {
      if (v6 && MEMORY[0x192FE0A00](v6) == MEMORY[0x1E4F145C0])
      {
        self->_unint64_t initialLinkType = xpc_int64_get_value(v6);
        uint64_t v15 = +[IDSLogging _IDSSession];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t initialLinkType = self->_initialLinkType;
          uniqueID = self->_uniqueID;
          int v25 = 67109634;
          *(_DWORD *)uint64_t v26 = initialLinkType;
          *(_WORD *)&v26[4] = 2112;
          *(void *)&v26[6] = uniqueID;
          *(_WORD *)&v26[14] = 2112;
          *(void *)&v26[16] = v11;
          id v17 = "Received initial link type %d for session %@ with error %@.";
          uint64_t v18 = v15;
          uint32_t v19 = 28;
          goto LABEL_26;
        }
      }
      else
      {
        uint64_t v15 = +[IDSLogging _IDSSession];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = self->_uniqueID;
          int v25 = 138412546;
          *(void *)uint64_t v26 = v16;
          *(_WORD *)&v26[8] = 2112;
          *(void *)&v26[10] = v11;
          id v17 = "Received invalid initial link type xpc object for session %@ with error %@.";
          uint64_t v18 = v15;
          uint32_t v19 = 22;
LABEL_26:
          _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, v19);
        }
      }

      goto LABEL_28;
    }
    uint64_t v20 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      *(void *)uint64_t v26 = v9;
      _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Received invalid xpc object type: %@.", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    int v11 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = self->_uniqueID;
      int v25 = 138412546;
      *(void *)uint64_t v26 = v14;
      *(_WORD *)&v26[8] = 2112;
      *(void *)&v26[10] = v10;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring xpc object, session doesn't match %@ vs. %@", (uint8_t *)&v25, 0x16u);
    }
  }
LABEL_28:
}

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (NSString *)a3;
  id v7 = (NSString *)a4;
  CFDictionaryRef v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    CFDictionaryRef v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A45744();
    }
  }
  int v11 = +[IDSLogging _IDSSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    uint32_t v19 = v7;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Session %@ received the report: %@", buf, 0x16u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_191A21E90;
    v14[3] = &unk_1E572D810;
    v14[4] = self;
    uint64_t v15 = v7;
    [(_IDSSession *)self _callDelegateWithBlock:v14];
  }
  else
  {
    int v12 = +[IDSLogging _IDSSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v17 = uniqueID;
      __int16 v18 = 2112;
      uint32_t v19 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveReport, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    CFDictionaryRef v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A457DC();
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_191A22000;
  v10[3] = &unk_1E572D810;
  id v11 = v5;
  int v12 = self;
  id v9 = v5;
  [(_IDSSession *)self _callDelegateWithBlock:v10];
}

- (unsigned)state
{
  return self->_state;
}

- (id)boostContext
{
  return self->_boostContext;
}

- (void)setBoostContext:(id)a3
{
}

- (unint64_t)initialLinkType
{
  return self->_initialLinkType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfig, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_unreliableSocketPairConnection, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong(&self->_boostContext, 0);

  objc_storeStrong(&self->_delegateContext, 0);
}

@end