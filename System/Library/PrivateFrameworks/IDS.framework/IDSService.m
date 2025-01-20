@interface IDSService
+ (BOOL)checkMessageSize:(unint64_t)a3 priority:(int64_t)a4;
+ (IDSService)serviceWithIdentifier:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 completion:(id)a6;
+ (IDSService)serviceWithIdentifier:(id)a3 completion:(id)a4;
+ (id)removeSentinelFromAliases:(id)a3;
- (BOOL)canSend;
- (BOOL)cancelIdentifier:(id)a3 error:(id *)a4;
- (BOOL)cancelMessageWithOptions:(id)a3 destination:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (BOOL)cancelMessageWithOptions:(id)a3 destinations:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (BOOL)cancelMessageWithOptions:(id)a3 identifier:(id *)a4 error:(id *)a5;
- (BOOL)cancelOpportunisticDataWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)getProgressUpdateForIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isPretendingToBeFull;
- (BOOL)needsLaunchOnNearbyDevicesChanged;
- (BOOL)reportSpamMessage:(id)a3;
- (BOOL)sendAccessoryData:(id)a3 toAccessoryID:(id)a4 accessToken:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendAheadGroup:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7;
- (BOOL)sendCertifiedDeliveryReceipt:(id)a3;
- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendData:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7;
- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendInvitation:(id)a3 toDestination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7;
- (BOOL)sendInvitationUpdate:(id)a3 toDestination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7;
- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendOpportunisticData:(id)a3 options:(id)a4 identifier:(id)a5 error:(id *)a6;
- (BOOL)sendProtobuf:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendServerMessage:(id)a3 command:(id)a4 fromAccount:(id)a5;
- (BOOL)setWakingPushPriority:(int64_t)a3 error:(id *)a4;
- (BOOL)updateSubServices:(id)a3 forDevice:(id)a4;
- (IDSService)initWithService:(id)a3;
- (IDSService)initWithService:(id)a3 commands:(id)a4;
- (IDSService)initWithService:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5;
- (IDSService)initWithService:(id)a3 manuallyAckMessages:(BOOL)a4;
- (IDSService)initWithService:(id)a3 serviceDomain:(id)a4;
- (NSArray)URIs;
- (NSArray)devices;
- (NSDictionary)pseudonymURIMap;
- (NSSet)accounts;
- (NSSet)internalAccounts;
- (NSString)serviceIdentifier;
- (SEL)protobufActionForIncomingRequestsOfType:(unsigned __int16)a3;
- (SEL)protobufActionForIncomingResponsesOfType:(unsigned __int16)a3;
- (_IDSService)_internal;
- (id)_accountWithAlias:(id)a3;
- (id)accountMatchingSim:(id)a3;
- (id)accountMatchingSimIdentifier:(id)a3;
- (id)aliases;
- (id)datagramChannelForSessionDestination:(id)a3 error:(id *)a4;
- (id)datagramChannelForSessionDestination:(id)a3 options:(id)a4 error:(id *)a5;
- (id)datagramChannelForSocketDescriptor:(int)a3 error:(id *)a4;
- (id)datagramConnectionForSessionDestination:(id)a3 error:(id *)a4;
- (id)datagramConnectionForSessionDestination:(id)a3 uid:(unsigned int)a4 error:(id *)a5;
- (id)datagramConnectionForSocketDescriptor:(int)a3 error:(id *)a4;
- (id)deviceForFromID:(id)a3;
- (id)deviceForUniqueID:(id)a3;
- (id)devicesForBTUUID:(id)a3;
- (id)firstRoutableInternetDestinationForSelf;
- (id)iCloudAccount;
- (id)internal;
- (id)linkedDeviceForFromID:(id)a3 withRelationship:(int64_t)a4;
- (id)linkedDevicesWithRelationship:(int64_t)a3;
- (id)pseudonymForPseudonymURI:(id)a3;
- (id)pseudonymPropertiesWithFeatureID:(id)a3 expiryDurationInSeconds:(double)a4;
- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5;
- (id)pseudonymsForMaskedURI:(id)a3;
- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4;
- (id)serviceDomain;
- (id)streamConnectionForSessionDestination:(id)a3 error:(id *)a4;
- (id)streamConnectionForSocketDescriptor:(int)a3 error:(id *)a4;
- (id)uriForFromID:(id)a3;
- (int64_t)maxEffectivePayloadSize;
- (int64_t)maxHomeKitPayloadSize;
- (unint64_t)registrationRestrictionReason;
- (void)activateAlias:(id)a3;
- (void)activateAliases:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addDelegate:(id)a3 withDelegateProperties:(id)a4 queue:(id)a5;
- (void)deactivateAlias:(id)a3;
- (void)deactivateAliases:(id)a3;
- (void)dealloc;
- (void)performGroupTask:(id)a3;
- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 completion:(id)a5;
- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6;
- (void)provisionPseudonymWithProperties:(id)a3 completion:(id)a4;
- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)renewPseudonym:(id)a3 forUpdatedDuration:(double)a4 completion:(id)a5;
- (void)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 completion:(id)a5;
- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6;
- (void)retrieveFirewallWithQueue:(id)a3 completion:(id)a4;
- (void)revokePseudonym:(id)a3 completion:(id)a4;
- (void)scheduleTransactionLogTask:(id)a3;
- (void)sendAckForMessageWithContext:(id)a3;
- (void)setLinkPreferences:(id)a3;
- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3;
- (void)setPreferInfraWiFi:(BOOL)a3;
- (void)setPretendingToBeFull:(BOOL)a3;
- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4;
- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4;
- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 completion:(id)a5;
- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 options:(id)a5 completion:(id)a6;
- (void)startOTRTest:(int64_t)a3;
- (void)testCloudQRConnection;
- (void)updateSubServices:(id)a3;
- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 completion:(id)a7;
- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 options:(id)a7 completion:(id)a8;
@end

@implementation IDSService

- (NSSet)accounts
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_191918740;
  v12 = sub_1919185C0;
  id v13 = 0;
  v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19190CD3C;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (NSArray)devices
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_191918740;
  v12 = sub_1919185C0;
  id v13 = 0;
  v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19190CCEC;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (IDSService)initWithService:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (_IDSRunningInDaemon())
  {
    uint64_t v10 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v10);
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
        sub_191A3A488();
      }
    }
    v28.receiver = self;
    v28.super_class = (Class)IDSService;
    v15 = [(IDSService *)&v28 init];
    if (v15)
    {
      v16 = +[IDSInternalQueueController sharedInstance];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = sub_191918A70;
      v23 = &unk_1E5729770;
      v24 = v15;
      id v17 = v8;
      id v25 = v17;
      id v26 = v9;
      BOOL v27 = a5;
      [v16 performBlock:&v20];

      v18 = +[_IDSXPCCheckinManager sharedInstance];
      [v18 noteCreatedService:v17];
    }
    self = v15;
    v11 = self;
  }

  return v11;
}

- (IDSService)initWithService:(id)a3
{
  return (IDSService *)MEMORY[0x1F4181798](self, sel_initWithService_commands_manuallyAckMessages_);
}

- (id)accountMatchingSim:(id)a3
{
  v4 = [a3 SIMIdentifier];
  id v5 = [(IDSService *)self accountMatchingSimIdentifier:v4];

  return v5;
}

- (id)accountMatchingSimIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(IDSService *)self accounts];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [v9 userUniqueIdentifier];
          char v11 = [v10 isEqual:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)internal
{
  return self->_internal;
}

+ (BOOL)checkMessageSize:(unint64_t)a3 priority:(int64_t)a4
{
  unint64_t v4 = 1048577;
  if (a4 != 300) {
    unint64_t v4 = 5242881;
  }
  return v4 > a3;
}

+ (IDSService)serviceWithIdentifier:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsNotCurrent];

  if (v13)
  {
    long long v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A3A3F0();
    }
  }
  if (v11)
  {
    long long v15 = +[IDSInternalQueueController sharedInstance];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = sub_1919ACD6C;
    v22 = &unk_1E572BE98;
    id v16 = v9;
    id v23 = v16;
    id v24 = v10;
    BOOL v26 = a5;
    id v25 = v11;
    [v15 performBlock:&v19];

    id v17 = +[_IDSXPCCheckinManager sharedInstance];
    [v17 noteCreatedService:v16];
  }
  return result;
}

+ (IDSService)serviceWithIdentifier:(id)a3 completion:(id)a4
{
  return (IDSService *)MEMORY[0x1F4181798](a1, sel_serviceWithIdentifier_commands_manuallyAckMessages_completion_);
}

- (IDSService)initWithService:(id)a3 serviceDomain:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3A598();
    }
  }
  id v9 = +[IDSLogging IDSService];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_191A3A520((uint64_t)v5, v9);
  }

  return 0;
}

- (IDSService)initWithService:(id)a3 commands:(id)a4
{
  return (IDSService *)MEMORY[0x1F4181798](self, sel_initWithService_commands_manuallyAckMessages_);
}

- (IDSService)initWithService:(id)a3 manuallyAckMessages:(BOOL)a4
{
  return (IDSService *)MEMORY[0x1F4181798](self, sel_initWithService_commands_manuallyAckMessages_);
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_191918740;
  v6[4] = sub_1919185C0;
  int v7 = (_IDSService *)0xAAAAAAAAAAAAAAAALL;
  int v7 = self->_internal;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1919AD0FC;
  v5[3] = &unk_1E5728DD0;
  v5[4] = v6;
  [v3 performBlock:v5 waitUntilDone:0];

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSService;
  [(IDSService *)&v4 dealloc];
}

- (_IDSService)_internal
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3A630();
    }
  }
  internal = self->_internal;

  return internal;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919AD298;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11 waitUntilDone:0];
}

- (void)addDelegate:(id)a3 withDelegateProperties:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[IDSInternalQueueController sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1919AD38C;
  v12[3] = &unk_1E5728DA8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlock:v12 waitUntilDone:0];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919AD44C;
  v6[3] = &unk_1E5729BB0;
  v6[4] = self;
  void v6[5] = v4;
  [v5 performBlock:v6 waitUntilDone:1];
}

- (void)performGroupTask:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919AD514;
  v7[3] = &unk_1E5729230;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7 waitUntilDone:0];
}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  id v7 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919AD5C4;
  v8[3] = &unk_1E572BEC0;
  v8[4] = self;
  v8[5] = a3;
  unsigned __int16 v9 = a4;
  [v7 performBlock:v8];
}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  id v7 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919AD680;
  v8[3] = &unk_1E572BEC0;
  v8[4] = self;
  v8[5] = a3;
  unsigned __int16 v9 = a4;
  [v7 performBlock:v8];
}

- (SEL)protobufActionForIncomingRequestsOfType:(unsigned __int16)a3
{
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919AD7A4;
  v9[3] = &unk_1E572BEE8;
  v9[4] = self;
  v9[5] = &v11;
  unsigned __int16 v10 = a3;
  [v6 performBlock:v9 waitUntilDone:1];

  id v7 = (const char *)v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (SEL)protobufActionForIncomingResponsesOfType:(unsigned __int16)a3
{
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919AD8F0;
  v9[3] = &unk_1E572BEE8;
  v9[4] = self;
  v9[5] = &v11;
  unsigned __int16 v10 = a3;
  [v6 performBlock:v9 waitUntilDone:1];

  id v7 = (const char *)v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (BOOL)sendProtobuf:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  uint64_t v19 = +[IDSDaemonController sharedInstance];
  [v19 blockUntilConnected];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = -86;
  uint64_t v20 = +[IDSInternalQueueController sharedInstance];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1919ADAF4;
  v26[3] = &unk_1E572BF10;
  v31 = &v35;
  v26[4] = self;
  id v21 = v15;
  id v27 = v21;
  id v22 = v16;
  id v28 = v22;
  id v23 = v17;
  id v29 = v23;
  int64_t v32 = a6;
  id v24 = v18;
  id v30 = v24;
  v33 = a8;
  v34 = a9;
  [v20 performBlock:v26 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v36 + 24);
  _Block_object_dispose(&v35, 8);

  return (char)a8;
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  kdebug_trace();
  id v17 = +[IDSDaemonController sharedInstance];
  [v17 blockUntilConnected];

  uint64_t v31 = 0;
  int64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = -86;
  id v18 = +[IDSInternalQueueController sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1919ADD04;
  v23[3] = &unk_1E572A878;
  id v27 = &v31;
  v23[4] = self;
  id v19 = v14;
  id v24 = v19;
  id v20 = v15;
  id v25 = v20;
  int64_t v28 = a5;
  id v21 = v16;
  id v26 = v21;
  id v29 = a7;
  id v30 = a8;
  [v18 performBlock:v23 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return (char)a8;
}

- (BOOL)sendOpportunisticData:(id)a3 options:(id)a4 identifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[IDSDaemonController sharedInstance];
  [v13 blockUntilConnected];

  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = -86;
  id v14 = +[IDSInternalQueueController sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1919ADEE4;
  v19[3] = &unk_1E572BF38;
  id v23 = &v25;
  v19[4] = self;
  id v15 = v10;
  id v20 = v15;
  id v16 = v11;
  id v21 = v16;
  id v17 = v12;
  id v22 = v17;
  id v24 = a6;
  [v14 performBlock:v19 waitUntilDone:1];

  LOBYTE(a6) = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v25, 8);

  return (char)a6;
}

- (BOOL)cancelOpportunisticDataWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = -86;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919AE060;
  v11[3] = &unk_1E572A418;
  uint64_t v13 = &v15;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v14 = a4;
  [v8 performBlock:v11 waitUntilDone:1];

  LOBYTE(a4) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  return [(IDSService *)self sendMessage:a3 fromAccount:a4 toDestinations:a5 priority:200 options:a6 identifier:a7 error:a8];
}

- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = +[IDSDaemonController sharedInstance];
  [v19 blockUntilConnected];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = -86;
  id v20 = +[IDSInternalQueueController sharedInstance];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1919AE294;
  v26[3] = &unk_1E572BF10;
  uint64_t v31 = &v35;
  v26[4] = self;
  id v21 = v15;
  id v27 = v21;
  id v22 = v16;
  id v28 = v22;
  id v23 = v17;
  id v29 = v23;
  int64_t v32 = a6;
  id v24 = v18;
  id v30 = v24;
  uint64_t v33 = a8;
  char v34 = a9;
  [v20 performBlock:v26 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v36 + 24);
  _Block_object_dispose(&v35, 8);

  return (char)a8;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = +[IDSDaemonController sharedInstance];
  [v17 blockUntilConnected];

  uint64_t v31 = 0;
  int64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = -86;
  id v18 = +[IDSInternalQueueController sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1919AE488;
  v23[3] = &unk_1E572A878;
  id v27 = &v31;
  v23[4] = self;
  id v19 = v14;
  id v24 = v19;
  id v20 = v15;
  id v25 = v20;
  int64_t v28 = a5;
  id v21 = v16;
  id v26 = v21;
  id v29 = a7;
  id v30 = a8;
  [v18 performBlock:v23 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return (char)a8;
}

- (BOOL)cancelMessageWithOptions:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[IDSDaemonController sharedInstance];
  [v9 blockUntilConnected];

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = -86;
  id v10 = +[IDSInternalQueueController sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1919AE61C;
  v13[3] = &unk_1E572BF60;
  id v15 = &v18;
  v13[4] = self;
  id v11 = v8;
  id v14 = v11;
  id v16 = a4;
  id v17 = a5;
  [v10 performBlock:v13 waitUntilDone:1];

  LOBYTE(a5) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)a5;
}

- (BOOL)cancelMessageWithOptions:(id)a3 destination:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = +[IDSDaemonController sharedInstance];
  [v12 blockUntilConnected];

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = -86;
  uint64_t v13 = +[IDSInternalQueueController sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1919AE7C4;
  v17[3] = &unk_1E572BF88;
  uint64_t v20 = &v23;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  id v15 = v11;
  id v19 = v15;
  char v21 = a5;
  id v22 = a6;
  [v13 performBlock:v17 waitUntilDone:1];

  LOBYTE(a6) = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)a6;
}

- (BOOL)cancelMessageWithOptions:(id)a3 destinations:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = +[IDSDaemonController sharedInstance];
  [v12 blockUntilConnected];

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = -86;
  uint64_t v13 = +[IDSInternalQueueController sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1919AE970;
  v17[3] = &unk_1E572BF88;
  uint64_t v20 = &v23;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  id v15 = v11;
  id v19 = v15;
  char v21 = a5;
  id v22 = a6;
  [v13 performBlock:v17 waitUntilDone:1];

  LOBYTE(a6) = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)a6;
}

- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = +[IDSDaemonController sharedInstance];
  [v19 blockUntilConnected];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = -86;
  uint64_t v20 = +[IDSInternalQueueController sharedInstance];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1919AEB74;
  v26[3] = &unk_1E572BF10;
  uint64_t v31 = &v35;
  v26[4] = self;
  id v21 = v15;
  id v27 = v21;
  id v22 = v16;
  id v28 = v22;
  id v23 = v17;
  id v29 = v23;
  int64_t v32 = a6;
  id v24 = v18;
  id v30 = v24;
  uint64_t v33 = a8;
  char v34 = a9;
  [v20 performBlock:v26 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v36 + 24);
  _Block_object_dispose(&v35, 8);

  return (char)a8;
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = +[IDSDaemonController sharedInstance];
  [v17 blockUntilConnected];

  uint64_t v31 = 0;
  int64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = -86;
  id v18 = +[IDSInternalQueueController sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1919AED68;
  v23[3] = &unk_1E572A878;
  id v27 = &v31;
  v23[4] = self;
  id v19 = v14;
  id v24 = v19;
  id v20 = v15;
  id v25 = v20;
  int64_t v28 = a5;
  id v21 = v16;
  id v26 = v21;
  id v29 = a7;
  id v30 = a8;
  [v18 performBlock:v23 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return (char)a8;
}

- (BOOL)sendAccessoryData:(id)a3 toAccessoryID:(id)a4 accessToken:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = +[IDSDaemonController sharedInstance];
  [v18 blockUntilConnected];

  uint64_t v33 = 0;
  char v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = -86;
  id v19 = +[IDSInternalQueueController sharedInstance];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1919AEF78;
  v25[3] = &unk_1E572BFB0;
  id v30 = &v33;
  v25[4] = self;
  id v20 = v14;
  id v26 = v20;
  id v21 = v15;
  id v27 = v21;
  id v22 = v16;
  id v28 = v22;
  id v23 = v17;
  id v29 = v23;
  uint64_t v31 = a7;
  int64_t v32 = a8;
  [v19 performBlock:v25 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v34 + 24);
  _Block_object_dispose(&v33, 8);

  return (char)a8;
}

- (BOOL)sendInvitation:(id)a3 toDestination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = +[IDSDaemonController sharedInstance];
  [v15 blockUntilConnected];

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = -86;
  id v16 = +[IDSInternalQueueController sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1919AF14C;
  v21[3] = &unk_1E572BFD8;
  id v25 = &v28;
  v21[4] = self;
  id v17 = v12;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  id v19 = v14;
  id v24 = v19;
  id v26 = a6;
  id v27 = a7;
  [v16 performBlock:v21 waitUntilDone:1];

  LOBYTE(a7) = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return (char)a7;
}

- (BOOL)sendInvitationUpdate:(id)a3 toDestination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = +[IDSDaemonController sharedInstance];
  [v15 blockUntilConnected];

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = -86;
  id v16 = +[IDSInternalQueueController sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1919AF320;
  v21[3] = &unk_1E572BFD8;
  id v25 = &v28;
  v21[4] = self;
  id v17 = v12;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  id v19 = v14;
  id v24 = v19;
  id v26 = a6;
  id v27 = a7;
  [v16 performBlock:v21 waitUntilDone:1];

  LOBYTE(a7) = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return (char)a7;
}

- (BOOL)setWakingPushPriority:(int64_t)a3 error:(id *)a4
{
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = -86;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919AF47C;
  v10[3] = &unk_1E572C000;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  v10[7] = a4;
  [v8 performBlock:v10 waitUntilDone:1];

  LOBYTE(a4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)a4;
}

- (BOOL)sendData:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  char v14 = +[IDSDaemonController sharedInstance];
  [v14 blockUntilConnected];

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = -86;
  id v15 = +[IDSInternalQueueController sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1919AF62C;
  v19[3] = &unk_1E572C028;
  id v22 = &v26;
  v19[4] = self;
  id v16 = v12;
  id v20 = v16;
  int64_t v23 = a4;
  id v17 = v13;
  id v21 = v17;
  id v24 = a6;
  id v25 = a7;
  [v15 performBlock:v19 waitUntilDone:1];

  LOBYTE(a7) = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return (char)a7;
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = +[IDSDaemonController sharedInstance];
  [v19 blockUntilConnected];

  uint64_t v35 = 0;
  char v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = -86;
  id v20 = +[IDSInternalQueueController sharedInstance];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1919AF834;
  v26[3] = &unk_1E572BF10;
  char v31 = &v35;
  v26[4] = self;
  id v21 = v15;
  id v27 = v21;
  id v22 = v16;
  id v28 = v22;
  id v23 = v17;
  id v29 = v23;
  int64_t v32 = a6;
  id v24 = v18;
  id v30 = v24;
  uint64_t v33 = a8;
  char v34 = a9;
  [v20 performBlock:v26 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v36 + 24);
  _Block_object_dispose(&v35, 8);

  return (char)a8;
}

- (BOOL)getProgressUpdateForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = -86;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919AF9C8;
  v11[3] = &unk_1E572A418;
  id v13 = &v15;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  char v14 = a4;
  [v8 performBlock:v11 waitUntilDone:1];

  LOBYTE(a4) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

- (BOOL)sendAheadGroup:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = +[IDSDaemonController sharedInstance];
  [v13 blockUntilConnected];

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = -86;
  char v14 = +[IDSInternalQueueController sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1919AFB74;
  v18[3] = &unk_1E572BF88;
  id v21 = &v24;
  v18[4] = self;
  id v15 = v11;
  id v19 = v15;
  int64_t v22 = a4;
  id v16 = v12;
  id v20 = v16;
  id v23 = a6;
  [v14 performBlock:v18 waitUntilDone:1];

  LOBYTE(a6) = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return (char)a6;
}

- (BOOL)reportSpamMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = -86;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919AFCEC;
  v9[3] = &unk_1E5729190;
  id v11 = &v12;
  v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  [v6 performBlock:v9 waitUntilDone:1];

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

- (void)sendAckForMessageWithContext:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  id v6 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919AFDF8;
  v8[3] = &unk_1E57291B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

- (BOOL)sendCertifiedDeliveryReceipt:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = -86;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919AFF30;
  v9[3] = &unk_1E5729190;
  id v11 = &v12;
  v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  [v6 performBlock:v9 waitUntilDone:1];

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

- (BOOL)cancelIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = -86;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919B00A4;
  v11[3] = &unk_1E572A418;
  id v13 = &v15;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  uint64_t v14 = a4;
  [v8 performBlock:v11 waitUntilDone:1];

  LOBYTE(a4) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

- (BOOL)sendServerMessage:(id)a3 command:(id)a4 fromAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSDaemonController sharedInstance];
  [v11 blockUntilConnected];

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = -86;
  id v12 = +[IDSInternalQueueController sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1919B025C;
  v17[3] = &unk_1E572C050;
  id v21 = &v22;
  v17[4] = self;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  id v15 = v10;
  id v20 = v15;
  [v12 performBlock:v17 waitUntilDone:1];

  LOBYTE(v8) = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return (char)v8;
}

- (unint64_t)registrationRestrictionReason
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B039C;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)linkedDevicesWithRelationship:(int64_t)a3
{
  unint64_t v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_191918740;
  id v14 = sub_1919185C0;
  id v15 = 0;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919B0520;
  v9[3] = &unk_1E5729DB8;
  v9[4] = self;
  void v9[5] = &v10;
  void v9[6] = a3;
  [v6 performBlock:v9 waitUntilDone:1];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)serviceDomain
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = sub_191918740;
  uint64_t v12 = sub_1919185C0;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B06B8;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)iCloudAccount
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = sub_191918740;
  uint64_t v12 = sub_1919185C0;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B084C;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSSet)internalAccounts
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = sub_191918740;
  uint64_t v12 = sub_1919185C0;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B09E0;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (NSString)serviceIdentifier
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = sub_191918740;
  uint64_t v12 = sub_1919185C0;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B0B74;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (BOOL)canSend
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = -86;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919B0CE4;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v4 performBlock:v6 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

- (id)deviceForFromID:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_191918740;
  uint64_t v17 = sub_1919185C0;
  id v18 = 0;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919B0E88;
  v10[3] = &unk_1E5729190;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [v6 performBlock:v10 waitUntilDone:1];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)linkedDeviceForFromID:(id)a3 withRelationship:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_191918740;
  id v20 = sub_1919185C0;
  id v21 = 0;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1919B1054;
  v12[3] = &unk_1E572A418;
  id v14 = &v16;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  int64_t v15 = a4;
  [v8 performBlock:v12 waitUntilDone:1];

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)firstRoutableInternetDestinationForSelf
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_191918740;
  uint64_t v12 = sub_1919185C0;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B11EC;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)deviceForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_191918740;
  uint64_t v17 = sub_1919185C0;
  id v18 = 0;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919B13A8;
  v10[3] = &unk_1E5729190;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [v6 performBlock:v10 waitUntilDone:1];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)devicesForBTUUID:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_191918740;
  uint64_t v17 = sub_1919185C0;
  id v18 = 0;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919B1564;
  v10[3] = &unk_1E5729190;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [v6 performBlock:v10 waitUntilDone:1];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)uriForFromID:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_191918740;
  uint64_t v17 = sub_1919185C0;
  id v18 = 0;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919B1720;
  v10[3] = &unk_1E5729190;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [v6 performBlock:v10 waitUntilDone:1];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setPreferInfraWiFi:(BOOL)a3
{
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  id v6 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B182C;
  v7[3] = &unk_1E5729050;
  v7[4] = self;
  BOOL v8 = a3;
  [v6 performBlock:v7];
}

- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3
{
  id v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919B18E0;
  v6[3] = &unk_1E5729050;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlock:v6];
}

- (BOOL)needsLaunchOnNearbyDevicesChanged
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = -86;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919B1A38;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v4 performBlock:v6 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

- (void)setLinkPreferences:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  id v6 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919B1B68;
  v8[3] = &unk_1E57291B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

- (void)startOTRTest:(int64_t)a3
{
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  id v6 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B1C2C;
  v7[3] = &unk_1E5728E48;
  v7[4] = self;
  void v7[5] = a3;
  [v6 performBlock:v7];
}

- (void)setPretendingToBeFull:(BOOL)a3
{
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  id v6 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B1CF4;
  v7[3] = &unk_1E5729050;
  v7[4] = self;
  BOOL v8 = a3;
  [v6 performBlock:v7];
}

- (BOOL)isPretendingToBeFull
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = -86;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919B1E0C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v4 performBlock:v6 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

- (void)testCloudQRConnection
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  id v4 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1919B1EF0;
  v5[3] = &unk_1E5729000;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (int64_t)maxHomeKitPayloadSize
{
  return 3072;
}

- (void)updateSubServices:(id)a3
{
}

- (BOOL)updateSubServices:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[IDSDaemonController sharedInstance];
  [v8 blockUntilConnected];

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = -86;
  uint64_t v9 = +[IDSInternalQueueController sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1919B2064;
  v13[3] = &unk_1E5729D90;
  uint64_t v16 = &v17;
  v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  [v9 performBlock:v13 waitUntilDone:1];

  LOBYTE(v6) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v6;
}

- (id)datagramConnectionForSessionDestination:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_191918740;
  char v20 = sub_1919185C0;
  id v21 = 0;
  BOOL v8 = +[IDSInternalQueueController sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1919B221C;
  v12[3] = &unk_1E572A418;
  id v14 = &v16;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  id v15 = a4;
  [v8 performBlock:v12 waitUntilDone:1];

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)datagramConnectionForSessionDestination:(id)a3 uid:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[IDSDaemonController sharedInstance];
  [v9 blockUntilConnected];

  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_191918740;
  id v23 = sub_1919185C0;
  id v24 = 0;
  id v10 = +[IDSInternalQueueController sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1919B23F4;
  v14[3] = &unk_1E572C078;
  uint64_t v16 = &v19;
  v14[4] = self;
  id v11 = v8;
  unsigned int v18 = a4;
  id v15 = v11;
  uint64_t v17 = a5;
  [v10 performBlock:v14 waitUntilDone:1];

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (id)datagramConnectionForSocketDescriptor:(int)a3 error:(id *)a4
{
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_191918740;
  uint64_t v17 = sub_1919185C0;
  id v18 = 0;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919B25A8;
  v11[3] = &unk_1E572C0A0;
  v11[4] = self;
  void v11[5] = &v13;
  int v12 = a3;
  v11[6] = a4;
  [v8 performBlock:v11 waitUntilDone:1];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)streamConnectionForSessionDestination:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_191918740;
  char v20 = sub_1919185C0;
  id v21 = 0;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1919B277C;
  v12[3] = &unk_1E572A418;
  id v14 = &v16;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  uint64_t v15 = a4;
  [v8 performBlock:v12 waitUntilDone:1];

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)streamConnectionForSocketDescriptor:(int)a3 error:(id *)a4
{
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_191918740;
  uint64_t v17 = sub_1919185C0;
  id v18 = 0;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919B292C;
  v11[3] = &unk_1E572C0A0;
  v11[4] = self;
  void v11[5] = &v13;
  int v12 = a3;
  v11[6] = a4;
  [v8 performBlock:v11 waitUntilDone:1];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)datagramChannelForSessionDestination:(id)a3 error:(id *)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F6ADA0];
  v12[0] = *MEMORY[0x1E4F6AD98];
  v12[1] = v6;
  v13[0] = &unk_1EE28B358;
  v13[1] = &unk_1EE28B358;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [(IDSService *)self datagramChannelForSessionDestination:v8 options:v9 error:a4];

  return v10;
}

- (id)datagramChannelForSessionDestination:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[IDSDaemonController sharedInstance];
  [v10 blockUntilConnected];

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_191918740;
  char v25 = sub_1919185C0;
  id v26 = 0;
  id v11 = +[IDSInternalQueueController sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1919B2C10;
  v16[3] = &unk_1E572C0C8;
  uint64_t v19 = &v21;
  v16[4] = self;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  char v20 = a5;
  [v11 performBlock:v16 waitUntilDone:1];

  id v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (id)datagramChannelForSocketDescriptor:(int)a3 error:(id *)a4
{
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 blockUntilConnected];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_191918740;
  id v17 = sub_1919185C0;
  id v18 = 0;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919B2DC4;
  v11[3] = &unk_1E572C0A0;
  v11[4] = self;
  void v11[5] = &v13;
  int v12 = a3;
  v11[6] = a4;
  [v8 performBlock:v11 waitUntilDone:1];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)aliases
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(IDSService *)self accounts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) aliasStrings];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [(id)objc_opt_class() removeSentinelFromAliases:v3];

  return v10;
}

- (void)activateAlias:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_191A3A6C8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)activateAliases:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_191A3A740(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)deactivateAlias:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_191A3A7B8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)deactivateAliases:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_191A3A830(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (id)_accountWithAlias:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IDSService *)self accounts];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919B3184;
  v10[3] = &unk_1E572C0F0;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 objectsPassingTest:v10];
  uint64_t v8 = [v7 anyObject];

  return v8;
}

+ (id)removeSentinelFromAliases:(id)a3
{
  return (id)objc_msgSend(a3, "__imSetByApplyingBlock:", &unk_1EE246BA8);
}

- (int64_t)maxEffectivePayloadSize
{
  id v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B333C;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSArray)URIs
{
  id v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = sub_191918740;
  long long v12 = sub_1919185C0;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B34B8;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSDictionary)pseudonymURIMap
{
  id v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = sub_191918740;
  long long v12 = sub_1919185C0;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B364C;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

- (id)pseudonymForPseudonymURI:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_191918740;
  uint64_t v17 = sub_1919185C0;
  id v18 = 0;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919B3808;
  v10[3] = &unk_1E5729190;
  long long v12 = &v13;
  void v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [v6 performBlock:v10 waitUntilDone:1];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)pseudonymsForMaskedURI:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_191918740;
  uint64_t v17 = sub_1919185C0;
  id v18 = 0;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919B39C4;
  v10[3] = &unk_1E5729190;
  long long v12 = &v13;
  void v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [v6 performBlock:v10 waitUntilDone:1];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSDaemonController sharedInstance];
  [v8 blockUntilConnected];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_191918740;
  uint64_t v22 = sub_1919185C0;
  id v23 = 0;
  uint64_t v9 = +[IDSInternalQueueController sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1919B3BAC;
  v14[3] = &unk_1E5729D90;
  uint64_t v17 = &v18;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  [v9 performBlock:v14 waitUntilDone:1];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (void)provisionPseudonymWithProperties:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F6B540];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 defaultProperties];
  [(IDSService *)self provisionPseudonymWithProperties:v8 requestProperties:v9 completion:v7];
}

- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"IDSService.m", 631, @"Invalid parameter not satisfying: %@", @"requestProperties" object file lineNumber description];
  }
  id v12 = (void *)[v10 copy];

  uint64_t v13 = +[IDSDaemonController sharedInstance];
  [v13 blockUntilConnected];

  long long v14 = +[IDSInternalQueueController sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1919B3E0C;
  v19[3] = &unk_1E5729A88;
  v19[4] = self;
  id v20 = v9;
  id v21 = v12;
  id v22 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v9;
  [v14 performBlock:v19];
}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"IDSService.m", 640, @"Invalid parameter not satisfying: %@", @"requestProperties" object file lineNumber description];
  }
  id v15 = (void *)[v13 copy];

  id v16 = +[IDSDaemonController sharedInstance];
  [v16 blockUntilConnected];

  id v17 = +[IDSInternalQueueController sharedInstance];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1919B4064;
  v23[3] = &unk_1E572AE38;
  v23[4] = self;
  id v24 = v11;
  id v25 = v12;
  id v26 = v15;
  id v27 = v14;
  id v18 = v14;
  id v19 = v15;
  id v20 = v12;
  id v21 = v11;
  [v17 performBlock:v23];
}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 completion:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F6B540];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 defaultProperties];
  [(IDSService *)self provisionPseudonymForURI:v11 withProperties:v10 requestProperties:v12 completion:v9];
}

- (void)renewPseudonym:(id)a3 forUpdatedDuration:(double)a4 completion:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = a3;
  id v12 = [v8 date];
  [v12 timeIntervalSince1970];
  [(IDSService *)self renewPseudonym:v10 forUpdatedExpiryEpoch:v9 completion:v11 + a4];
}

- (void)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[IDSDaemonController sharedInstance];
  [v10 blockUntilConnected];

  double v11 = +[IDSInternalQueueController sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1919B4364;
  v14[3] = &unk_1E5728FB0;
  v14[4] = self;
  id v15 = v8;
  double v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 performBlock:v14];
}

- (void)revokePseudonym:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSDaemonController sharedInstance];
  [v8 blockUntilConnected];

  id v9 = +[IDSInternalQueueController sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1919B44E0;
  v12[3] = &unk_1E5729140;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performBlock:v12];
}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[IDSDaemonController sharedInstance];
  [v10 blockUntilConnected];

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_191918740;
  id v25 = sub_1919185C0;
  id v26 = 0;
  id v11 = +[IDSInternalQueueController sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1919B46FC;
  v16[3] = &unk_1E572C0C8;
  id v19 = &v21;
  v16[4] = self;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  double v20 = a5;
  [v11 performBlock:v16 waitUntilDone:1];

  id v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 expiryDurationInSeconds:(double)a4
{
  return [(IDSService *)self pseudonymPropertiesWithFeatureID:a3 scopeID:0 expiryDurationInSeconds:a4];
}

- (void)retrieveFirewallWithQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"IDSService.m", 686, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"IDSService.m", 687, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = [(IDSService *)self serviceIdentifier];
  if (v10)
  {
    id v11 = [[IDSFirewall alloc] initWithService:v10 queue:v7];
    [(IDSFirewall *)v11 populateImpactedServices:v9];
  }
  else
  {
    id v12 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A3A8A8((uint64_t)self, v12);
    }

    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:19 userInfo:0];
    ((void (**)(void, void, IDSFirewall *))v9)[2](v9, 0, v11);
  }
}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 completion:(id)a5
{
}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[IDSDaemonController sharedInstance];
  [v13 blockUntilConnected];

  id v14 = +[IDSInternalQueueController sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1919B4A38;
  v18[3] = &unk_1E572C118;
  v18[4] = self;
  id v19 = v10;
  id v21 = v12;
  int64_t v22 = a4;
  id v20 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [v14 performBlock:v18];
}

- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 completion:(id)a7
{
}

- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = +[IDSDaemonController sharedInstance];
  [v19 blockUntilConnected];

  id v20 = +[IDSInternalQueueController sharedInstance];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1919B4BD0;
  v26[3] = &unk_1E572C140;
  v26[4] = self;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v31 = v18;
  int64_t v32 = a6;
  id v30 = v17;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  [v20 performBlock:v26];
}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[IDSDaemonController sharedInstance];
  [v13 blockUntilConnected];

  id v14 = +[IDSInternalQueueController sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1919B4D14;
  v18[3] = &unk_1E572C118;
  id v21 = v12;
  int64_t v22 = a3;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [v14 performBlock:v18];
}

- (void)scheduleTransactionLogTask:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919B4DE4;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void).cxx_destruct
{
}

@end