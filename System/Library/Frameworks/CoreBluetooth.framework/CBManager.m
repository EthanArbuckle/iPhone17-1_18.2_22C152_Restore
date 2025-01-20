@interface CBManager
+ (BOOL)tccAvailable;
+ (CBManagerAuthorization)authorization;
+ (id)getTCCServer;
+ (int)preflightCheckForTCC;
+ (unsigned)retrieveCurrentProcessSessionCount;
+ (void)authorization;
- (BOOL)getCBPrivacySupported;
- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3;
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (BOOL)sendDebugMsg:(unsigned __int16)a3 args:(id)a4;
- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4;
- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4 withReply:(id)a5;
- (BOOL)sendRawCommand:(unsigned __int16)a3 data:(id)a4 completionHandler:(id)a5;
- (BOOL)tccApproved;
- (BOOL)tccComplete;
- (BOOL)tccRequired;
- (CBManagerAuthorization)authorization;
- (CBManagerState)state;
- (CBPairingAgent)sharedPairingAgent;
- (NSData)advertisingAddress;
- (NSData)nonConnectableAdvertisingAddress;
- (NSData)nonConnectableSecondaryAdvertisingAddress;
- (NSString)localAddressString;
- (NSString)localName;
- (id)createCnxWithInfo:(id)a3;
- (id)getCnxInstanceForIdentifier:(id)a3;
- (id)getCurrentQueue;
- (id)getWhbLocalIdForRemoteId:(id)a3;
- (id)initInternal;
- (id)peerWithInfo:(id)a3;
- (id)sendDebugSyncMsg:(unsigned __int16)a3 args:(id)a4;
- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4;
- (int64_t)advertisingAddressType;
- (int64_t)nonConnectableAdvertisingAddressType;
- (int64_t)nonConnectableSecondaryAdvertisingAddressType;
- (void)_handleAdvertisingAddressChanged:(id)a3;
- (void)checkForTCCWithDeviceCount;
- (void)closeL2CAPChannelForPeerUUID:(id)a3 withPsm:(unsigned __int16)a4;
- (void)dealloc;
- (void)didReceiveForwardedMessageForCBManager:(id)a3;
- (void)doneWithTCC;
- (void)extractLocalDeviceStatesDictionary:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handlePairingAgentMsg:(unsigned __int16)a3 args:(id)a4;
- (void)performTCCCheck:(id)a3;
- (void)queryBluetoothStatus:(id)a3 completion:(id)a4;
- (void)removeCnxInstanceForIdentifier:(id)a3;
- (void)removeWhbRemoteId:(id)a3;
- (void)retrieveBundle:(id)a3 sessionCountWithCompletion:(id)a4;
- (void)retrieveSupportedResources:(id)a3 subKey:(id)a4 completion:(id)a5;
- (void)setAdvertisingAddress:(id)a3;
- (void)setConnectionTargetQueue:(id)a3;
- (void)setNonConnectableAdvertisingAddress:(id)a3;
- (void)setNonConnectableSecondaryAdvertisingAddress:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTccApproved:(BOOL)a3;
- (void)setTccComplete:(BOOL)a3;
- (void)setTccRequired:(BOOL)a3;
- (void)setWHBMsgReplyHandler:(id)a3;
- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4;
- (void)startWithQueue:(id)a3 options:(id)a4 sessionType:(int)a5;
- (void)triggerBTErrorReport:(int64_t)a3;
- (void)xpcConnectionDidReceiveMsg:(unsigned __int16)a3 args:(id)a4;
- (void)xpcConnectionDidReset;
- (void)xpcConnectionIsInvalid;
@end

@implementation CBManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localName, 0);
  objc_storeStrong((id *)&self->_localAddressString, 0);
  objc_storeStrong((id *)&self->_nonConnectableSecondaryAdvertisingAddress, 0);
  objc_storeStrong((id *)&self->_nonConnectableAdvertisingAddress, 0);
  objc_storeStrong((id *)&self->_advertisingAddress, 0);
  objc_storeStrong((id *)&self->devicesAroundUsDetails, 0);
  objc_storeStrong((id *)&self->btGlobalTCCCenterLabel, 0);
  objc_storeStrong((id *)&self->_cnxDict, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pairingAgent, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)dealloc
{
  pthread_mutex_lock(&_sessionCounterLock);
  --_sessionCounter;
  pthread_mutex_unlock(&_sessionCounterLock);
  [(CBXpcConnection *)self->_connection disconnect];
  v3.receiver = self;
  v3.super_class = (Class)CBManager;
  [(CBManager *)&v3 dealloc];
}

- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  if (v7)
  {
    uint64_t v8 = [(CBManager *)self getCnxInstanceForIdentifier:v7];
    if (v8)
    {
      v9 = (void *)v8;
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      v10 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1AB9F0000, v10, OS_LOG_TYPE_DEFAULT, "CBManager fwdMsg %@ through WHB for peripheral %@ ", (uint8_t *)&v15, 0x16u);
      }
      [(CBXpcConnection *)self->_connection forwardWhbMsg:v4 args:v6 cnx:v9];

      goto LABEL_16;
    }
  }
  int64_t state = self->_state;
  BOOL v12 = state == 10 || state == 5;
  if (v12
    || state == 4 && [(CBManager *)self isMsgAllowedWhenOff:v4]
    || [(CBManager *)self isMsgAllowedAlways:v4])
  {
    [(CBXpcConnection *)self->_connection sendMsg:v4 args:v6];
LABEL_16:
    BOOL v13 = 1;
    goto LABEL_17;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBManager sendMsg:args:]();
  }
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  return a3 == 4 || a3 == 31;
}

- (void)setTccComplete:(BOOL)a3
{
  self->_tccComplete = a3;
}

+ (int)preflightCheckForTCC
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 2;
  v2 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  objc_super v3 = tcc_credential_singleton_for_self();
  uint64_t v4 = tcc_service_singleton_for_CF_name();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__CBManager_preflightCheckForTCC__block_invoke;
  v8[3] = &unk_1E5E341A0;
  v8[4] = &v9;
  v5 = (void *)MEMORY[0x1AD111AA0](v8);
  id v6 = +[CBManager getTCCServer];
  tcc_server_message_request_authorization();

  LODWORD(v6) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v6;
}

+ (id)getTCCServer
{
  pthread_mutex_lock(&gLock);
  if (!getTCCServer_tccServer)
  {
    uint64_t v2 = tcc_server_create();
    objc_super v3 = (void *)getTCCServer_tccServer;
    getTCCServer_tccServer = v2;
  }
  pthread_mutex_unlock(&gLock);
  uint64_t v4 = (void *)getTCCServer_tccServer;

  return v4;
}

- (void)startWithQueue:(id)a3 options:(id)a4 sessionType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v16 = v8;
  if (v8)
  {
    uint64_t v9 = (OS_dispatch_queue *)v8;
    queue = self->_queue;
    self->_queue = v9;
  }
  else
  {
    uint64_t v11 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
    queue = self->_queue;
    self->_queue = v11;
  }
  id v13 = a4;

  v14 = [[CBXpcConnection alloc] initWithDelegate:self queue:self->_queue options:v13 sessionType:v5];
  connection = self->_connection;
  self->_connection = v14;

  [(CBXpcConnection *)self->_connection connect];
}

- (id)initInternal
{
  v7.receiver = self;
  v7.super_class = (Class)CBManager;
  uint64_t v2 = [(CBManager *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_int64_t state = 0;
    localAddressString = v2->_localAddressString;
    v2->_localAddressString = 0;

    localName = v3->_localName;
    v3->_localName = 0;

    pthread_mutex_lock(&_sessionCounterLock);
    ++_sessionCounter;
    pthread_mutex_unlock(&_sessionCounterLock);
  }
  return v3;
}

- (BOOL)getCBPrivacySupported
{
  return dyld_program_sdk_at_least();
}

- (void)performTCCCheck:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[CBManager tccAvailable])
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v12 = CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    LOWORD(v18) = 0;
    id v13 = "TCC not available, calling doneWithTCC without setting tccComplete.";
    goto LABEL_14;
  }
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgRequiresTCC"];
  -[CBManager setTccRequired:](self, "setTccRequired:", [v5 BOOLValue]);

  id v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgTCCLEDevicesAroundDetails"];
  devicesAroundUsDetails = self->devicesAroundUsDetails;
  self->devicesAroundUsDetails = v6;

  id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgTCCLELocalizedCenterLabel"];
  btGlobalTCCCenterLabel = self->btGlobalTCCCenterLabel;
  self->btGlobalTCCCenterLabel = v8;

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  v10 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    LODWORD(v18) = 67109376;
    HIDWORD(v18) = +[CBManager tccAvailable];
    __int16 v19 = 1024;
    BOOL v20 = [(CBManager *)self tccRequired];
    _os_log_impl(&dword_1AB9F0000, v11, OS_LOG_TYPE_DEFAULT, "Running performTccCheck CBManager tccAvail %d, tccRequired %d", (uint8_t *)&v18, 0xEu);
  }
  if ([(CBManager *)self tccComplete])
  {
    if (CBLogInitOnce == -1)
    {
      id v12 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        [(CBManager *)self doneWithTCC];
        goto LABEL_27;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      id v12 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
    }
    LOWORD(v18) = 0;
    id v13 = "TCC is already complete";
LABEL_14:
    _os_log_impl(&dword_1AB9F0000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 2u);
    goto LABEL_26;
  }
  if (![(CBManager *)self tccRequired])
  {
    if (CBLogInitOnce == -1)
    {
      id v16 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        [(CBManager *)self setTccApproved:1];
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      id v16 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
    }
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AB9F0000, v16, OS_LOG_TYPE_DEFAULT, "TCC not required", (uint8_t *)&v18, 2u);
    goto LABEL_25;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v14 = CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v14 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_19:
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AB9F0000, v14, OS_LOG_TYPE_DEFAULT, "TCC required", (uint8_t *)&v18, 2u);
  }
LABEL_20:
  [(CBManager *)self checkForTCCWithDeviceCount];
LABEL_27:
}

+ (BOOL)tccAvailable
{
  return MEMORY[0x1E4FA99C0] != 0;
}

- (BOOL)tccRequired
{
  return self->_tccRequired;
}

- (BOOL)tccComplete
{
  return self->_tccComplete;
}

- (void)setTccRequired:(BOOL)a3
{
  self->_tccRequired = a3;
}

- (void)setTccApproved:(BOOL)a3
{
  self->_tccApproved = a3;
}

- (void)doneWithTCC
{
  [(CBManager *)self setTccComplete:1];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(CBManager *)self sendMsg:4 args:v3];
}

uint64_t __33__CBManager_preflightCheckForTCC__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v3 = result;
    result = tcc_authorization_record_get_authorization_right();
    int v4 = 2 * (result != 2);
    if (!result) {
      int v4 = 1;
    }
    *(_DWORD *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = v4;
  }
  return result;
}

- (CBPairingAgent)sharedPairingAgent
{
  pairingAgent = self->_pairingAgent;
  if (pairingAgent)
  {
  }
  else
  {
    uint64_t v5 = [[CBPairingAgent alloc] initWithParentManager:self];
    id v6 = self->_pairingAgent;
    self->_pairingAgent = v5;

    pairingAgent = self->_pairingAgent;
  }
  return pairingAgent;
}

- (void)xpcConnectionDidReceiveMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (v4 == 3)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    objc_super v7 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1AB9F0000, v7, OS_LOG_TYPE_DEFAULT, "Received CBMsgIdReadyForTCC", v8, 2u);
    }
    [(CBManager *)self performTCCCheck:v6];
  }
  else
  {
    if (v4 == 6) {
      [(CBManager *)self handleStateUpdatedMsg:v6];
    }
    else {
      [(CBManager *)self handleMsg:v4 args:v6];
    }
  }
}

- (CBManagerState)state
{
  return self->_state;
}

- (void)_handleAdvertisingAddressChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBConnectableAdvertisingAddress"];
  id v6 = [v4 objectForKeyedSubscript:@"kCBConnectableAdvertisingAddressType"];
  int64_t v7 = [v6 integerValue];

  id v8 = [v4 objectForKeyedSubscript:@"kCBNonConnectableAdvertisingAddress"];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"kCBNonConnectableAdvertisingAddressType"];
  int64_t v10 = [v9 integerValue];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"kCBNonConnectableSecondaryAdvertisingAddress"];
  id v12 = [v4 objectForKeyedSubscript:@"kCBNonConnectableSecondaryAdvertisingAddressType"];

  int64_t v13 = [v12 integerValue];
  [(CBManager *)self willChangeValueForKey:@"advertisingAddress"];
  advertisingAddress = self->_advertisingAddress;
  self->_advertisingAddress = v5;
  int v15 = v5;

  nonConnectableAdvertisingAddress = self->_nonConnectableAdvertisingAddress;
  self->_advertisingAddressType = v7;
  self->_nonConnectableAdvertisingAddress = v8;
  __int16 v17 = v8;

  nonConnectableSecondaryAdvertisingAddress = self->_nonConnectableSecondaryAdvertisingAddress;
  self->_nonConnectableAdvertisingAddressType = v10;
  self->_nonConnectableSecondaryAdvertisingAddress = v11;

  self->_nonConnectableSecondaryAdvertisingAddressType = v13;

  [(CBManager *)self didChangeValueForKey:@"advertisingAddress"];
}

- (void)extractLocalDeviceStatesDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgAddressString"];
  id v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  int64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgState"];
  if (v5) {
    objc_storeStrong((id *)&self->_localAddressString, v5);
  }
  if (v6)
  {
    [(CBManager *)self willChangeValueForKey:@"localName"];
    objc_storeStrong((id *)&self->_localName, v6);
    [(CBManager *)self didChangeValueForKey:@"localName"];
  }
  if (+[CBManager authorization] == CBManagerAuthorizationNotDetermined)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    id v8 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    {
      -[CBManager extractLocalDeviceStatesDictionary:](v8);
      if (!v7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  if (v7) {
LABEL_10:
  }
    -[CBManager setState:](self, "setState:", [v7 integerValue]);
LABEL_11:
  [(CBManager *)self handleLocalDeviceStateUpdatedMsg:v4];
}

+ (CBManagerAuthorization)authorization
{
  uint64_t v2 = xpc_copy_entitlement_for_self();
  uint64_t v3 = (void *)v2;
  if (v2 && MEMORY[0x1AD1120E0](v2) == MEMORY[0x1E4F14570] && xpc_BOOL_get_value(v3))
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
      +[CBManager authorization].cold.4();
    }
    goto LABEL_27;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v4 = xpc_copy_entitlement_for_self();
    uint64_t v5 = (void *)v4;
    if (v4 && MEMORY[0x1AD1120E0](v4) == MEMORY[0x1E4F14570] && xpc_BOOL_get_value(v5))
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        +[CBManager authorization].cold.4();
      }

      goto LABEL_27;
    }
  }
  if (!+[CBManager tccAvailable]) {
    goto LABEL_27;
  }
  int v6 = +[CBManager preflightCheckForTCC];
  switch(v6)
  {
    case 2:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        +[CBManager authorization]();
      }
      CBManagerAuthorization v8 = (unint64_t)(TCCAccessRestricted() != 0);

      return v8;
    case 1:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        +[CBManager authorization]();
      }
      if (TCCAccessRestricted()) {
        CBManagerAuthorization v9 = CBManagerAuthorizationRestricted;
      }
      else {
        CBManagerAuthorization v9 = CBManagerAuthorizationDenied;
      }

      return v9;
    case 0:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        +[CBManager authorization]();
      }

      return 3;
    default:
LABEL_27:

      return 0;
  }
}

- (void)setConnectionTargetQueue:(id)a3
{
}

- (id)getCurrentQueue
{
  queue = self->_queue;
  if (queue)
  {
    uint64_t v3 = queue;
  }
  else
  {
    uint64_t v5 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
    uint64_t v3 = v5;
  }
  return v3;
}

- (BOOL)sendRawCommand:(unsigned __int16)a3 data:(id)a4 completionHandler:(id)a5
{
  return 0;
}

- (BOOL)sendDebugMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  v14[2] = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  v13[0] = @"kCBMsgId";
  id v6 = NSNumber;
  id v7 = a4;
  uint64_t v8 = [v6 numberWithUnsignedShort:v4];
  CBManagerAuthorization v9 = (void *)v8;
  v13[1] = @"kCBMsgArgs";
  id v10 = (id)MEMORY[0x1E4F1CC08];
  if (v7) {
    id v10 = v7;
  }
  v14[0] = v8;
  v14[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [(CBXpcConnection *)connection sendMsg:208 args:v11];

  return 1;
}

- (id)sendDebugSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  v15[2] = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  v14[0] = @"kCBMsgId";
  id v6 = NSNumber;
  id v7 = a4;
  uint64_t v8 = [v6 numberWithUnsignedShort:v4];
  CBManagerAuthorization v9 = (void *)v8;
  v14[1] = @"kCBMsgArgs";
  id v10 = (id)MEMORY[0x1E4F1CC08];
  if (v7) {
    id v10 = v7;
  }
  v15[0] = v8;
  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v12 = [(CBXpcConnection *)connection sendSyncMsg:208 args:v11];

  return v12;
}

- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  return [(CBXpcConnection *)self->_connection sendSyncMsg:a3 args:a4];
}

- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4 withReply:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  int64_t state = self->_state;
  BOOL v11 = state == 10 || state == 5;
  if (v11
    || state == 4 && [(CBManager *)self isMsgAllowedWhenOff:v6]
    || [(CBManager *)self isMsgAllowedAlways:v6])
  {
    [(CBXpcConnection *)self->_connection sendMsgWithReply:v6 args:v8 replyBlock:v9];
    BOOL v12 = 1;
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBManager sendMsg:args:]();
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)setWHBMsgReplyHandler:(id)a3
{
}

- (void)closeL2CAPChannelForPeerUUID:(id)a3 withPsm:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBManager closeL2CAPChannelForPeerUUID:withPsm:]();
  }
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = [NSNumber numberWithUnsignedShort:v4];
  id v9 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"kCBMsgArgPSM", v6, @"kCBMsgArgDeviceUUID", 0);
  [(CBManager *)self sendMsg:26 args:v9];
}

- (id)createCnxWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteDeviceUUID"];
  id v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];

  id v8 = [(CBManager *)self getCnxInstanceForIdentifier:v5];
  if (!v8)
  {
    id v8 = objc_alloc_init(CBConnection);
    [(CBConnection *)v8 setDispatchQueue:self->_queue];
    id v9 = objc_alloc_init(CBDevice);
    id v10 = v9;
    if (v6)
    {
      [(CBDevice *)v9 setIdentifier:v6];
    }
    else
    {
      BOOL v11 = [v5 UUIDString];
      [(CBDevice *)v10 setIdentifier:v11];
    }
    [(CBConnection *)v8 setPeerDevice:v10];
    BOOL v12 = [(CBConnection *)v8 peerDevice];
    int64_t v13 = [v12 identifier];

    v14 = objc_alloc_init(CBDevice);
    [(CBDevice *)v14 setIdentifier:v7];
    [(CBConnection *)v8 setRemoteDevice:v14];
    [(NSMutableDictionary *)self->_cnxDict setObject:v8 forKey:v5];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __31__CBManager_createCnxWithInfo___block_invoke;
    v27[3] = &unk_1E5E31248;
    id v15 = v5;
    id v28 = v15;
    [(CBConnection *)v8 setInvalidationHandler:v27];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __31__CBManager_createCnxWithInfo___block_invoke_59;
    v24[3] = &unk_1E5E34150;
    v24[4] = self;
    id v16 = v15;
    id v25 = v16;
    id v17 = v13;
    id v26 = v17;
    [(CBConnection *)v8 setErrorHandler:v24];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __31__CBManager_createCnxWithInfo___block_invoke_61;
    v21[3] = &unk_1E5E31130;
    v21[4] = self;
    id v22 = v16;
    id v23 = v17;
    id v18 = v17;
    [(CBConnection *)v8 setInterruptionHandler:v21];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __31__CBManager_createCnxWithInfo___block_invoke_62;
    v20[3] = &unk_1E5E31608;
    v20[4] = self;
    [(CBConnection *)v8 setXpcForwardMessageReceiveHandler:v20];
  }

  return v8;
}

void __31__CBManager_createCnxWithInfo___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v2 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1AB9F0000, v2, OS_LOG_TYPE_DEFAULT, "WHB cnx instance for localId %@ invalidated", (uint8_t *)&v4, 0xCu);
  }
}

void __31__CBManager_createCnxWithInfo___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    __31__CBManager_createCnxWithInfo___block_invoke_59_cold_1();
  }
  [*(id *)(a1 + 32) removeCnxInstanceForIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) removeWhbRemoteId:*(void *)(a1 + 48)];
}

uint64_t __31__CBManager_createCnxWithInfo___block_invoke_61(uint64_t a1)
{
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) removeCnxInstanceForIdentifier:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) removeWhbRemoteId:*(void *)(a1 + 48)];
}

uint64_t __31__CBManager_createCnxWithInfo___block_invoke_62(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) didReceiveForwardedDelegateCallbackMessage:a2];
}

- (id)getCnxInstanceForIdentifier:(id)a3
{
  id v4 = a3;
  cnxDict = self->_cnxDict;
  if (!cnxDict)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = self->_cnxDict;
    self->_cnxDict = v6;

    cnxDict = self->_cnxDict;
  }
  id v8 = [(NSMutableDictionary *)cnxDict objectForKey:v4];

  return v8;
}

- (void)removeCnxInstanceForIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->_cnxDict, "objectForKey:");
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMutableDictionary *)self->_cnxDict removeObjectForKey:v6];
  }
}

- (void)didReceiveForwardedMessageForCBManager:(id)a3
{
}

- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4
{
}

- (id)getWhbLocalIdForRemoteId:(id)a3
{
  return [(CBXpcConnection *)self->_connection getWhbLocalIdForRemoteId:a3];
}

- (void)removeWhbRemoteId:(id)a3
{
}

- (void)retrieveSupportedResources:(id)a3 subKey:(id)a4 completion:(id)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (__CFString *)a4;
  id v11 = a5;
  if (v9)
  {
    if ([v9 length]) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"CBManager.m", 335, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

    if ([0 length])
    {
LABEL_3:
      if (v11) {
        goto LABEL_4;
      }
LABEL_14:
      BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"CBManager.m", 337, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];

      BOOL v12 = &off_1ABA8F000;
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_7;
    }
  }
  __int16 v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"CBManager.m", 336, @"Invalid parameter not satisfying: %@", @"[key length] > 0" object file lineNumber description];

  if (!v11) {
    goto LABEL_14;
  }
LABEL_4:
  BOOL v12 = &off_1ABA8F000;
  if (v9)
  {
LABEL_5:
    uint64_t v13 = [v9 length];
    if (v11 && v13) {
      goto LABEL_8;
    }
  }
LABEL_7:
  v14 = [(CBXpcConnection *)self->_connection getEventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *((void *)v12 + 269);
  block[2] = __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke;
  block[3] = &unk_1E5E34178;
  id v24 = v11;
  dispatch_async(v14, block);

LABEL_8:
  if (v10) {
    id v15 = v10;
  }
  else {
    id v15 = &stru_1F02E5F20;
  }
  v25[0] = @"kCBMsgArgResourceKey";
  v25[1] = @"kCBMsgArgResourceSubKey";
  v26[0] = v9;
  v26[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = *((void *)v12 + 269);
  v21[2] = __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke_95;
  v21[3] = &unk_1E5E310E0;
  id v22 = v11;
  id v17 = v11;
  [(CBManager *)self sendMsg:28 args:v16 withReply:v21];
}

void __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithInfo:&unk_1F0302228];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

void __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 objectForKeyedSubscript:@"kCBMsgArgResourceTotalCount"];
  id v7 = [v6 objectForKeyedSubscript:@"kCBMsgArgResourceRemainingCount"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveBundle:(id)a3 sessionCountWithCompletion:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v13 = @"kCBMsgArgApplicationID";
  v14[0] = a3;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke;
  v11[3] = &unk_1E5E310E0;
  id v12 = v6;
  id v10 = v6;
  [(CBManager *)self sendMsg:31 args:v9 withReply:v11];
}

void __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke_cold_1();
    }
    id v7 = &unk_1F0302158;
  }
  else
  {
    id v7 = [v5 objectForKeyedSubscript:@"kCBMsgArgCount"];
  }
  (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), (unsigned __int16)[v7 unsignedIntValue]);
}

+ (unsigned)retrieveCurrentProcessSessionCount
{
  pthread_mutex_lock(&_sessionCounterLock);
  unsigned __int16 v2 = _sessionCounter;
  pthread_mutex_unlock(&_sessionCounterLock);
  return v2;
}

- (CBManagerAuthorization)authorization
{
  return +[CBManager authorization];
}

- (void)handlePairingAgentMsg:(unsigned __int16)a3 args:(id)a4
{
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return 0;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
}

- (void)xpcConnectionDidReset
{
  [(CBManager *)self setState:1];
  pairingAgent = self->_pairingAgent;

  [(CBPairingAgent *)pairingAgent updateRegistration];
}

- (void)xpcConnectionIsInvalid
{
}

- (void)triggerBTErrorReport:(int64_t)a3
{
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBManager triggerBTErrorReport:]();
  }
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"kCBMsgArgReasonEnum", 0);
  [(CBManager *)self sendMsg:27 args:v7];
}

- (id)peerWithInfo:(id)a3
{
  return 0;
}

- (void)checkForTCCWithDeviceCount
{
  id v3 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  id v4 = tcc_credential_singleton_for_self();
  id v5 = tcc_service_singleton_for_CF_name();
  id v6 = objc_opt_new();
  [v6 setObject:self->btGlobalTCCCenterLabel forKeyedSubscript:@"mapCentralLabelStringKey"];
  [v6 setObject:self->devicesAroundUsDetails forKeyedSubscript:@"mapLabelArrayForCalloutsKey"];
  tcc_message_options_set_client_dict();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__CBManager_checkForTCCWithDeviceCount__block_invoke;
  v9[3] = &unk_1E5E341C8;
  v9[4] = self;
  id v7 = (void *)MEMORY[0x1AD111AA0](v9);
  id v8 = +[CBManager getTCCServer];
  tcc_server_message_request_authorization();
}

void __39__CBManager_checkForTCCWithDeviceCount__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) getCurrentQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__CBManager_checkForTCCWithDeviceCount__block_invoke_2;
    v10[3] = &unk_1E5E31068;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    dispatch_async(v7, v10);
  }
}

uint64_t __39__CBManager_checkForTCCWithDeviceCount__block_invoke_2(uint64_t a1)
{
  uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
  [*(id *)(a1 + 40) setTccComplete:1];
  [*(id *)(a1 + 40) setTccApproved:authorization_right == 2];
  id v3 = *(void **)(a1 + 40);

  return [v3 doneWithTCC];
}

- (void)queryBluetoothStatus:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3) {
    id v7 = a3;
  }
  else {
    id v7 = (id)MEMORY[0x1E4F1CC08];
  }
  v14 = @"kCBMsgArgOptions";
  v15[0] = v7;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a3;
  id v10 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__CBManager_queryBluetoothStatus_completion___block_invoke;
  v12[3] = &unk_1E5E310E0;
  id v13 = v6;
  id v11 = v6;
  [(CBManager *)self sendMsg:30 args:v10 withReply:v12];
}

void __45__CBManager_queryBluetoothStatus_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v14 = objc_msgSend(v8, "objectForKey:", v13, (void)v15);
        [v7 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)tccApproved
{
  return self->_tccApproved;
}

- (NSData)advertisingAddress
{
  return self->_advertisingAddress;
}

- (void)setAdvertisingAddress:(id)a3
{
}

- (int64_t)advertisingAddressType
{
  return self->_advertisingAddressType;
}

- (NSData)nonConnectableAdvertisingAddress
{
  return self->_nonConnectableAdvertisingAddress;
}

- (void)setNonConnectableAdvertisingAddress:(id)a3
{
}

- (int64_t)nonConnectableAdvertisingAddressType
{
  return self->_nonConnectableAdvertisingAddressType;
}

- (NSData)nonConnectableSecondaryAdvertisingAddress
{
  return self->_nonConnectableSecondaryAdvertisingAddress;
}

- (void)setNonConnectableSecondaryAdvertisingAddress:(id)a3
{
}

- (int64_t)nonConnectableSecondaryAdvertisingAddressType
{
  return self->_nonConnectableSecondaryAdvertisingAddressType;
}

- (NSString)localAddressString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)localName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)extractLocalDeviceStatesDictionary:(void *)a1 .cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  +[CBManager authorization];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1AB9F0000, v1, OS_LOG_TYPE_DEBUG, "Authorization state is %ld", v2, 0xCu);
}

- (void)sendMsg:args:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: %@ can only accept this command while in the powered on state", v2, v3, v4, v5, v6);
}

- (void)closeL2CAPChannelForPeerUUID:withPsm:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1AB9F0000, v1, OS_LOG_TYPE_DEBUG, "Close L2CAP channel for peerUUID %@ with psm :%u", v2, 0x12u);
}

void __31__CBManager_createCnxWithInfo___block_invoke_59_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "CBCentralManager->WHB shim error %@", v2, v3, v4, v5, v6);
}

void __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "retrieveBundle:CBSessionCountWithCompletion failed %@", v2, v3, v4, v5, v6);
}

+ (void)authorization
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1AB9F0000, v0, v1, "Skipping TCC check, authStatus: CBManagerAuthorizationNotDetermined", v2, v3, v4, v5, v6);
}

- (void)triggerBTErrorReport:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1AB9F0000, v0, v1, "Reporting a BT Problem", v2, v3, v4, v5, v6);
}

@end