@interface IDSGroupSession
+ (id)augmentNetworkParametersForSession:(id)a3 participantID:(unint64_t)a4 parameters:(id)a5;
+ (id)augmentNetworkParametersForSessionAlias:(id)a3 participantIDAlias:(unint64_t)a4 salt:(id)a5 parameters:(id)a6;
+ (id)createEndpointForSessionIDAlias:(id)a3 topic:(id)a4 participantIDAlias:(unint64_t)a5 salt:(id)a6;
+ (id)createGroupDescriptorForSessionIDAlias:(id)a3 topic:(id)a4 salt:(id)a5;
+ (id)keyValueDeliveryForSessionID:(id)a3;
+ (void)augmentConnectionGroupNetworkParameters:(id)a3;
+ (void)keyValueDeliveryForSessionID:(id)a3 completionHandler:(id)a4;
+ (void)requestNWConnectionWithDataBlob:(id)a3 completionHandler:(id)a4;
+ (void)requestNWConnectionforIDSGroupSessionBroadcastParameter:(id)a3 withCompletionHandler:(id)a4;
+ (void)requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3 withCompletionHandler:(id)a4;
- (IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5;
- (IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7;
- (IDSGroupSession)initWithAccount:(id)a3 options:(id)a4;
- (IDSGroupSession)initWithAccount:(id)a3 options:(id)a4 delegate:(id)a5 queue:(id)a6;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)destination;
- (NSString)sessionID;
- (id)_internal;
- (id)_internal_sessionWithValidityCheck;
- (id)broadcastParameterForService:(id)a3;
- (id)keyValueDelivery;
- (id)sessionIDAliasWithSalt:(id)a3;
- (id)unicastConnectorWithDataMode:(int64_t)a3;
- (id)unicastParameterForParticipantID:(unint64_t)a3 dataMode:(int64_t)a4 connectionIndex:(unint64_t)a5;
- (id)unicastParameterForParticipantIDAlias:(unint64_t)a3 salt:(id)a4 dataMode:(int64_t)a5 connectionIndex:(unint64_t)a6;
- (unint64_t)createAliasForLocalParticipantIDWithSalt:(id)a3;
- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unsigned)sessionEndedReason;
- (unsigned)state;
- (void)createAliasForLocalParticipantIDWithSalt:(id)a3 completionHandler:(id)a4;
- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5;
- (void)createSessionIDAliasWithSalt:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5;
- (void)invalidate;
- (void)joinWithOptions:(id)a3;
- (void)leaveGroupSession;
- (void)leaveGroupSessionWithOptions:(id)a3;
- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4;
- (void)reconnectUPlusOneSession;
- (void)registerPluginWithOptions:(id)a3;
- (void)removeParticipants:(id)a3;
- (void)requestActiveParticipants;
- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4;
- (void)requestEncryptionKeyForParticipants:(id)a3;
- (void)requestURIsForParticipantIDs:(id)a3 completionHandler:(id)a4;
- (void)setCallScreeningMode:(BOOL)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3;
- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3;
- (void)setParticipantInfo:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)unregisterPluginWithOptions:(id)a3;
- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6;
- (void)updateMembers:(id)a3 withContext:(id)a4 triggeredLocally:(BOOL)a5;
- (void)updateParticipantData:(id)a3 withContext:(id)a4;
- (void)updateParticipantInfo:(id)a3;
- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 withContext:(id)a5 triggeredLocally:(BOOL)a6;
@end

@implementation IDSGroupSession

- (IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsNotCurrent];

  if (v12)
  {
    v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A2BE94();
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)IDSGroupSession;
  v14 = [(IDSGroupSession *)&v22 init];
  if (v14)
  {
    v15 = +[IDSInternalQueueController sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1919283E4;
    v17[3] = &unk_1E5729680;
    v18 = v14;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    [v15 performBlock:v17];
  }
  return v14;
}

- (IDSGroupSession)initWithAccount:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsNotCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2BF2C();
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)IDSGroupSession;
  v11 = [(IDSGroupSession *)&v18 init];
  if (v11)
  {
    int v12 = +[IDSInternalQueueController sharedInstance];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19192859C;
    v14[3] = &unk_1E5728DA8;
    id v15 = v7;
    v16 = v11;
    id v17 = v6;
    [v12 performBlock:v14];
  }
  return v11;
}

- (IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[IDSInternalQueueController sharedInstance];
  int v18 = [v17 assertQueueIsNotCurrent];

  if (v18)
  {
    id v19 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_191A2BFC4();
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)IDSGroupSession;
  id v20 = [(IDSGroupSession *)&v30 init];
  if (v20)
  {
    id v21 = +[IDSInternalQueueController sharedInstance];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_19192881C;
    v23[3] = &unk_1E57296A8;
    v24 = v20;
    id v25 = v12;
    id v26 = v13;
    id v27 = v14;
    id v28 = v15;
    id v29 = v16;
    [v21 performBlock:v23];
  }
  return v20;
}

- (IDSGroupSession)initWithAccount:(id)a3 options:(id)a4 delegate:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsNotCurrent];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A2C05C();
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)IDSGroupSession;
  id v17 = [(IDSGroupSession *)&v26 init];
  if (v17)
  {
    int v18 = +[IDSInternalQueueController sharedInstance];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_191928A20;
    v20[3] = &unk_1E57296D0;
    id v21 = v11;
    objc_super v22 = v17;
    id v23 = v10;
    id v24 = v12;
    id v25 = v13;
    [v18 performBlock:v20];
  }
  return v17;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_191918650;
  v6[4] = sub_191918548;
  id v7 = (_IDSGroupSession *)0xAAAAAAAAAAAAAAAALL;
  id v7 = self->_internal;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191928C00;
  v5[3] = &unk_1E5728DD0;
  v5[4] = v6;
  [v3 performBlock:v5 waitUntilDone:0];

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSGroupSession;
  [(IDSGroupSession *)&v4 dealloc];
}

- (void)invalidate
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191928CBC;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (id)_internal_sessionWithValidityCheck
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2C180();
    }
  }
  internal = self->_internal;
  if (!internal)
  {
    id v7 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2C0F4((uint64_t)self, (uint64_t *)&self->_internal, v7);
    }

    internal = self->_internal;
  }

  return internal;
}

- (NSString)sessionID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918650;
  id v11 = sub_191918548;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191928F94;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (id)sessionIDAliasWithSalt:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_191918650;
  id v16 = sub_191918548;
  id v17 = 0;
  v5 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_191929134;
  v9[3] = &unk_1E5729190;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlock:v9 waitUntilDone:1];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = IDSIDAliasHashUInt64();
  id v7 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218498;
    unint64_t v10 = v6;
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "createAliasForParticipantID created %llu from %llu and %@", (uint8_t *)&v9, 0x20u);
  }

  return v6;
}

- (unint64_t)createAliasForLocalParticipantIDWithSalt:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191929414;
  v11[3] = &unk_1E57296F8;
  v11[4] = self;
  __int16 v13 = &v14;
  id v6 = v4;
  id v12 = v6;
  [v5 performBlock:v11 waitUntilDone:1];

  id v7 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v15[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v8;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "createAliasForLocalParticipantIDWithSalt created and returning %llu", buf, 0xCu);
  }

  unint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v21 = 0;
  objc_super v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1919296C0;
  v16[3] = &unk_1E5729748;
  v16[4] = self;
  unint64_t v20 = a3;
  id v9 = v6;
  id v17 = v9;
  uint64_t v19 = &v21;
  unint64_t v10 = v7;
  int v18 = v10;
  [v8 performBlock:v16];

  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    id v12 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "IDS daemon took too long to respond to participantIDForAlias:salt:", v15, 2u);
    }
  }
  unint64_t v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)createSessionIDAliasWithSalt:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191929860;
  v11[3] = &unk_1E5729140;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[IDSInternalQueueController sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_19192995C;
  v13[3] = &unk_1E5728FB0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

- (void)createAliasForLocalParticipantIDWithSalt:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191929A4C;
  v11[3] = &unk_1E5729140;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[IDSInternalQueueController sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_191929B48;
  v13[3] = &unk_1E5728FB0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

- (NSString)destination
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918650;
  id v11 = sub_191918548;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191929C84;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (unsigned)state
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191929DE4;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return self;
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
  v5[2] = sub_191929F04;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return self;
}

- (NSSet)requiredCapabilities
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918650;
  id v11 = sub_191918548;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19192A064;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (NSSet)requiredLackOfCapabilities
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918650;
  id v11 = sub_191918548;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19192A1DC;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19192A308;
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
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2C218();
    }
  }
  internal = self->_internal;

  return internal;
}

- (void)updateMembers:(id)a3 withContext:(id)a4 triggeredLocally:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[IDSInternalQueueController sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_19192A4D8;
  v13[3] = &unk_1E5729770;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[IDSInternalQueueController sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_19192A63C;
  v17[3] = &unk_1E5729798;
  void v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 performBlock:v17];
}

- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4 < 0xE)
  {
    id v8 = +[IDSInternalQueueController sharedInstance];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_19192A7E8;
    v9[3] = &unk_1E57297C0;
    v9[4] = self;
    id v10 = v6;
    __int16 v11 = v4;
    [v8 performBlock:v9];
  }
  else
  {
    id v7 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v13 = v4;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "manageDesignatedMembers: invalid type: %u", buf, 8u);
    }
  }
}

- (void)removeParticipants:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192A8F8;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)updateParticipantData:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19192AA28;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)updateParticipantInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192AB34;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)setParticipantInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192AC40;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 withContext:(id)a5 triggeredLocally:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = +[IDSInternalQueueController sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19192AD88;
  v15[3] = &unk_1E57297E8;
  unsigned __int16 v18 = a3;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  BOOL v19 = a6;
  id v13 = v11;
  id v14 = v10;
  [v12 performBlock:v15];
}

- (void)joinWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192AE9C;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)leaveGroupSession
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19192AF80;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)leaveGroupSessionWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192B080;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)reconnectUPlusOneSession
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19192B164;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)setPreferences:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192B260;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  id v8 = (void *)[v6 copy];

  id v9 = +[IDSInternalQueueController sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19192B3A4;
  v12[3] = &unk_1E5728DA8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlock:v12];
}

- (void)requestActiveParticipants
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19192B488;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)registerPluginWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192B588;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)unregisterPluginWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192B694;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)setCallScreeningMode:(BOOL)a3
{
  id v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19192B788;
  v6[3] = &unk_1E5729050;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlock:v6];
}

- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3
{
  id v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19192B87C;
  v6[3] = &unk_1E5729050;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlock:v6];
}

- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3
{
  id v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19192B970;
  v6[3] = &unk_1E5729050;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlock:v6];
}

- (void)requestURIsForParticipantIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19192BAA0;
  v11[3] = &unk_1E5729140;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (id)unicastParameterForParticipantID:(unint64_t)a3 dataMode:(int64_t)a4 connectionIndex:(unint64_t)a5
{
  id v9 = IDSIDAliasFixedSalt();
  id v10 = [(IDSGroupSession *)self unicastParameterForParticipantIDAlias:[(IDSGroupSession *)self createAliasForParticipantID:a3 salt:v9] salt:v9 dataMode:a4 connectionIndex:a5];

  return v10;
}

- (id)unicastParameterForParticipantIDAlias:(unint64_t)a3 salt:(id)a4 dataMode:(int64_t)a5 connectionIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = [(IDSGroupSession *)self sessionIDAliasWithSalt:v10];
  id v12 = [[IDSGroupSessionUnicastParameter alloc] initWithGroupSessionID:v11 localParticipantID:[(IDSGroupSession *)self createAliasForLocalParticipantIDWithSalt:v10] remoteParticipantID:a3 salt:v10 dataMode:a5 connectionIndex:a6];

  return v12;
}

+ (void)requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3 withCompletionHandler:(id)a4
{
}

- (id)unicastConnectorWithDataMode:(int64_t)a3
{
  id v5 = IDSIDAliasFixedSalt();
  id v6 = [(IDSGroupSession *)self sessionIDAliasWithSalt:v5];
  id v7 = [[IDSGroupSessionUnicastConnector alloc] initWithGroupSessionIDAlias:v6 participantIDAlias:[(IDSGroupSession *)self createAliasForLocalParticipantIDWithSalt:v5] salt:v5 dataMode:a3];

  return v7;
}

+ (void)requestNWConnectionWithDataBlob:(id)a3 completionHandler:(id)a4
{
}

+ (id)augmentNetworkParametersForSession:(id)a3 participantID:(unint64_t)a4 parameters:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F1C9B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 data];
  id v11 = +[IDSGroupSession augmentNetworkParametersForSessionAlias:v9 participantIDAlias:a4 salt:v10 parameters:v8];

  return v11;
}

+ (id)augmentNetworkParametersForSessionAlias:(id)a3 participantIDAlias:(unint64_t)a4 salt:(id)a5 parameters:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  xpc_object_t v12 = xpc_array_create(0, 0);
  xpc_object_t v13 = xpc_array_create(0, 0);
  id v14 = [NSString stringWithFormat:@"%@%u", *MEMORY[0x1E4F6B100], getuid()];
  xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v14 UTF8String]);

  xpc_array_set_string(v13, 0xFFFFFFFFFFFFFFFFLL, (const char *)[(id)*MEMORY[0x1E4F6B108] UTF8String]);
  nw_parameters_set_required_netagent_classes();
  id v15 = objc_alloc_init(MEMORY[0x1E4F6B488]);
  [v15 setMultiplexer:@"groupsession"];
  [v15 setSessionID:v11];

  [v15 setParticipantID:a4];
  [v15 setSalt:v10];

  id v16 = [v15 stringRepresentation];
  [v16 UTF8String];
  nw_parameters_set_account_id();

  nw_endpoint_t host = nw_endpoint_create_host("0.0.0.0", "0");
  MEMORY[0x192FDFFD0](v9, host);

  nw_endpoint_t v18 = nw_endpoint_create_host("0.0.0.0", "3030");

  return v18;
}

+ (id)createEndpointForSessionIDAlias:(id)a3 topic:(id)a4 participantIDAlias:(unint64_t)a5 salt:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x1E4F6B488];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v9);
  [v13 setMultiplexer:@"groupsession"];
  [v13 setSessionID:v12];

  [v13 setParticipantID:a5];
  [v13 setSalt:v10];

  id v14 = [v13 stringRepresentation];
  [v14 UTF8String];
  id v15 = v11;
  [v15 UTF8String];

  apple_service = (void *)nw_endpoint_create_apple_service();

  return apple_service;
}

+ (id)createGroupDescriptorForSessionIDAlias:(id)a3 topic:(id)a4 salt:(id)a5
{
  id v5 = +[IDSGroupSession createEndpointForSessionIDAlias:a3 topic:a4 participantIDAlias:0 salt:a5];
  apple_id = (void *)nw_group_descriptor_create_apple_id();

  return apple_id;
}

+ (void)augmentConnectionGroupNetworkParameters:(id)a3
{
  id v3 = a3;
  id v5 = xpc_array_create(0, 0);
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, "com.apple.ids");
  xpc_object_t v4 = xpc_array_create(0, 0);
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "IDSGroupAgent");
  nw_parameters_set_required_netagent_classes();
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19192C22C;
  v11[3] = &unk_1E5729140;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)requestEncryptionKeyForParticipants:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19192C338;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (id)keyValueDelivery
{
  v2 = [(IDSGroupSession *)self _internal_sessionWithValidityCheck];
  id v3 = [v2 keyValueDelivery];

  return v3;
}

+ (id)keyValueDeliveryForSessionID:(id)a3
{
  return (id)MEMORY[0x1F4181798](_IDSGroupSession, sel_keyValueDeliveryForSessionID_);
}

+ (void)keyValueDeliveryForSessionID:(id)a3 completionHandler:(id)a4
{
}

- (id)broadcastParameterForService:(id)a3
{
  id v4 = a3;
  id v5 = [IDSGroupSessionBroadcastParameter alloc];
  id v6 = [(IDSGroupSession *)self sessionID];
  id v7 = IDSIDAliasFixedSalt();
  id v8 = [(IDSGroupSessionBroadcastParameter *)v5 initWithGroupSessionID:v6 salt:v7 serviceName:v4];

  return v8;
}

+ (void)requestNWConnectionforIDSGroupSessionBroadcastParameter:(id)a3 withCompletionHandler:(id)a4
{
}

- (void).cxx_destruct
{
}

@end