@interface IDSSession
- (BOOL)isAudioEnabled;
- (BOOL)isMuted;
- (BOOL)sendData:(id)a3 error:(id *)a4;
- (BOOL)shouldUseSocketForTransport;
- (IDSSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5;
- (IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)destination;
- (NSString)sessionID;
- (NSString)uniqueID;
- (id)_initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 uniqueID:(id)a6;
- (id)_internal;
- (id)_streamPreferences;
- (id)description;
- (int)socket;
- (int64_t)invitationTimeOut;
- (unint64_t)MTUForAddressFamily:(unint64_t)a3;
- (unint64_t)initialLinkType;
- (unsigned)sessionEndedReason;
- (unsigned)state;
- (void)acceptInvitation;
- (void)acceptInvitationWithData:(id)a3;
- (void)cancelInvitation;
- (void)cancelInvitationWithData:(id)a3;
- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3;
- (void)dealloc;
- (void)declineInvitation;
- (void)declineInvitationWithData:(id)a3;
- (void)endSession;
- (void)endSessionWithData:(id)a3;
- (void)reconnectSession;
- (void)sendAllocationRequest:(id)a3;
- (void)sendInvitation;
- (void)sendInvitationWithData:(id)a3;
- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4;
- (void)sendInvitationWithOptions:(id)a3;
- (void)sendSessionMessage:(id)a3;
- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setInvitationTimeOut:(int64_t)a3;
- (void)setIsAudioEnabled:(BOOL)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)setStreamPreferences:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation IDSSession

- (IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (_IDSRunningInDaemon())
  {
    v10 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    v11 = 0;
  }
  else
  {
    v12 = +[IDSInternalQueueController sharedInstance];
    int v13 = [v12 assertQueueIsNotCurrent];

    if (v13)
    {
      v14 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_191A2DE9C();
      }
    }
    v24.receiver = self;
    v24.super_class = (Class)IDSSession;
    v15 = [(IDSSession *)&v24 init];
    v16 = v15;
    if (v15)
    {
      v15->_uniqueIDLock._os_unfair_lock_opaque = 0;
      v17 = +[IDSInternalQueueController sharedInstance];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_19194CC18;
      v19[3] = &unk_1E5728E20;
      v20 = v16;
      id v21 = v8;
      id v22 = v9;
      int64_t v23 = a5;
      [v17 performBlock:v19 waitUntilDone:1];
    }
    self = v16;
    v11 = self;
  }

  return v11;
}

- (IDSSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_IDSRunningInDaemon())
  {
    v11 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    v12 = 0;
  }
  else
  {
    int v13 = +[IDSInternalQueueController sharedInstance];
    int v14 = [v13 assertQueueIsNotCurrent];

    if (v14)
    {
      v15 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_191A2DF34();
      }
    }
    v25.receiver = self;
    v25.super_class = (Class)IDSSession;
    v16 = [(IDSSession *)&v25 init];
    v17 = v16;
    if (v16)
    {
      v16->_uniqueIDLock._os_unfair_lock_opaque = 0;
      v18 = +[IDSInternalQueueController sharedInstance];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_19194CE98;
      v20[3] = &unk_1E5729680;
      id v21 = v17;
      id v22 = v8;
      id v23 = v9;
      id v24 = v10;
      [v18 performBlock:v20 waitUntilDone:1];
    }
    self = v17;
    v12 = self;
  }

  return v12;
}

- (id)_initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 uniqueID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (_IDSRunningInDaemon())
  {
    int v13 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    int v14 = 0;
  }
  else
  {
    v15 = +[IDSInternalQueueController sharedInstance];
    int v16 = [v15 assertQueueIsCurrent];

    if (v16)
    {
      v17 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_191A2DFCC();
      }
    }
    v25.receiver = self;
    v25.super_class = (Class)IDSSession;
    v18 = [(IDSSession *)&v25 init];
    if (v18)
    {
      v19 = [[_IDSSession alloc] initWithAccount:v10 destinations:v11 transportType:a5 uniqueID:v12 delegateContext:v18];
      internal = v18->_internal;
      v18->_internal = v19;

      v18->_uniqueIDLock._os_unfair_lock_opaque = 0;
      os_unfair_lock_lock(&v18->_uniqueIDLock);
      id v21 = [(_IDSSession *)v18->_internal uniqueID];
      uint64_t v22 = [v21 copy];
      uniqueID = v18->_uniqueID;
      v18->_uniqueID = (NSString *)v22;

      os_unfair_lock_unlock(&v18->_uniqueIDLock);
    }
    self = v18;
    int v14 = self;
  }

  return v14;
}

- (void)dealloc
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_1919186A0;
  v8[4] = sub_191918570;
  id v9 = (_IDSSession *)0xAAAAAAAAAAAAAAAALL;
  id v9 = self->_internal;
  v3 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194D25C;
  v7[3] = &unk_1E5728DD0;
  v7[4] = v8;
  [v3 performBlock:v7 waitUntilDone:0];

  v4 = +[IDSLogging IDSSession];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_INFO, "IDSSession dealloced", buf, 2u);
  }

  _Block_object_dispose(v8, 8);
  v5.receiver = self;
  v5.super_class = (Class)IDSSession;
  [(IDSSession *)&v5 dealloc];
}

- (int)socket
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19194D370;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

- (NSString)sessionID
{
  p_uniqueIDLock = &self->_uniqueIDLock;
  os_unfair_lock_lock(&self->_uniqueIDLock);
  v4 = [(IDSSession *)self uniqueID];
  os_unfair_lock_unlock(p_uniqueIDLock);

  return (NSString *)v4;
}

- (NSString)destination
{
  p_uniqueIDLock = &self->_uniqueIDLock;
  os_unfair_lock_lock(&self->_uniqueIDLock);
  v4 = [(IDSSession *)self uniqueID];
  os_unfair_lock_unlock(p_uniqueIDLock);
  objc_super v5 = [@"session:" stringByAppendingString:v4];

  return (NSString *)v5;
}

- (id)description
{
  p_uniqueIDLock = &self->_uniqueIDLock;
  os_unfair_lock_lock(&self->_uniqueIDLock);
  v4 = [(IDSSession *)self uniqueID];
  os_unfair_lock_unlock(p_uniqueIDLock);

  return v4;
}

- (unsigned)state
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19194D5B4;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return self;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19194D6C8;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (id)_internal
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2E064();
    }
  }
  internal = self->_internal;

  return internal;
}

- (unint64_t)initialLinkType
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19194D854;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)sendInvitation
{
}

- (void)sendInvitationWithOptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 objectForKey:@"direction"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = +[IDSLogging IDSSession];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_INFO, "Received invalid options %@, bailing", buf, 0xCu);
    }
  }
  else
  {
    id v6 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v5, "BOOLValue"));
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"direction", 0);
    uint64_t v8 = +[IDSInternalQueueController sharedInstance];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19194DA5C;
    v10[3] = &unk_1E57291B8;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    [v8 performBlock:v10];
  }
}

- (void)sendInvitationWithData:(id)a3
{
}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19194DB30;
  v9[3] = &unk_1E572A3C8;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [v7 performBlock:v9];
}

- (void)setStreamPreferences:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194DBFC;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (id)_streamPreferences
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1919186A0;
  BOOL v11 = sub_191918570;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19194DD30;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19194DE20;
  v6[3] = &unk_1E572A3F0;
  v6[4] = self;
  unsigned int v7 = a3;
  [v5 performBlock:v6];
}

- (void)cancelInvitationWithData:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194DEEC;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)acceptInvitationWithData:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194DFB0;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)declineInvitationWithData:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194E074;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)cancelInvitation
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19194E110;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)acceptInvitation
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19194E1AC;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)declineInvitation
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19194E248;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)endSession
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19194E2E4;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)endSessionWithData:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194E3A8;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)sendSessionMessage:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194E46C;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19194E554;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)sendAllocationRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194E620;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)setIsAudioEnabled:(BOOL)a3
{
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19194E6CC;
  v6[3] = &unk_1E5729050;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlock:v6];
}

- (BOOL)isAudioEnabled
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19194E7C8;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (void)setIsMuted:(BOOL)a3
{
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19194E8A0;
  v6[3] = &unk_1E5729050;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlock:v6];
}

- (BOOL)isMuted
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19194E99C;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)sendData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = -86;
  BOOL v7 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19194EAF4;
  v10[3] = &unk_1E572A418;
  id v12 = &v14;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  id v13 = a4;
  [v7 performBlock:v10 waitUntilDone:1];

  LOBYTE(a4) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)a4;
}

- (void)setInvitationTimeOut:(int64_t)a3
{
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19194EBCC;
  v6[3] = &unk_1E5728E48;
  v6[4] = self;
  void v6[5] = a3;
  [v5 performBlock:v6];
}

- (int64_t)invitationTimeOut
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19194ECC0;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)reconnectSession
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19194ED88;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (unsigned)sessionEndedReason
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19194EE7C;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return self;
}

- (void)setPreferences:(id)a3
{
  int64_t v4 = (void *)[a3 copy];
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194EF70;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (BOOL)shouldUseSocketForTransport
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19194F064;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (unint64_t)MTUForAddressFamily:(unint64_t)a3
{
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19194F18C;
  v8[3] = &unk_1E5729DB8;
  v8[4] = self;
  void v8[5] = &v9;
  v8[6] = a3;
  [v5 performBlock:v8 waitUntilDone:1];

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSSet)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSSet)requiredLackOfCapabilities
{
  return self->_requiredLackOfCapabilities;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredLackOfCapabilities, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end