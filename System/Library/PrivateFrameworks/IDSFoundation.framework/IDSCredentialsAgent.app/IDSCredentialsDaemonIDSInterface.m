@interface IDSCredentialsDaemonIDSInterface
+ (id)sharedInstance;
- (BOOL)_sendIDSMessage:(id)a3;
- (BOOL)_sendIDSMessage:(id)a3 queueOneIdentifier:(id)a4;
- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 forcedIdentifier:(id)a5;
- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6;
- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6 options:(id)a7 identifier:(id *)a8;
- (BOOL)_sendIDSPairingMessage:(id)a3;
- (BOOL)_sendIDSPairingMessage:(id)a3 queueOneIdentifier:(id)a4;
- (BOOL)_sendIDSPairingMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6;
- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 completionBlock:(id)a4 isPairing:(BOOL)a5;
- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 queueOneIdentifier:(id)a4 completionBlock:(id)a5 isPairing:(BOOL)a6;
- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 timeOut:(id)a4 forcedIdentifier:(id)a5 completionBlock:(id)a6 isPairing:(BOOL)a7;
- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6 completionBlock:(id)a7 isPairing:(BOOL)a8;
- (BOOL)isLocalDevicePresent;
- (IDSCredentialsDaemonIDSInterface)init;
- (IDSCredentialsDaemonIDSInterface)initWithIDSService:(id)a3;
- (NSMutableArray)queuedMessages;
- (id)_credentialUniqueIDFromMessageIdentifier:(id)a3;
- (void)_addMessageInfo:(id)a3 description:(id)a4 completionBlock:(id)a5;
- (void)_handleFetchFaceTimeAndiMessageInfoMessage:(id)a3;
- (void)_handleFetchFaceTimeAndiMessageInfoMessageResponse:(id)a3;
- (void)_handleFetchRAMessage:(id)a3;
- (void)_handleFetchRAMessageResponse:(id)a3;
- (void)_handleIncomingAccountSyncMessage:(id)a3;
- (void)_handleIncomingAccountSyncMessageResponse:(id)a3;
- (void)_handleSendIDSIDLocalIDQuery:(id)a3;
- (void)_handleSendIDSIDLocalIDQueryResponse:(id)a3;
- (void)_handleSendIDSLocalDeviceInfoRequest:(id)a3;
- (void)_handleSendIDSLocalDeviceInfoResponse:(id)a3;
- (void)_mapMessageIdentifier:(id)a3 toCredentialUniqueID:(id)a4;
- (void)_removeMessageIdentifierMapping:(id)a3;
- (void)_removeMessageIdentifierMappingWithCredentialUniqueID:(id)a3;
- (void)_removeMessageInfo:(id)a3;
- (void)_sendAccountSyncMessageToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendFetchIMFTRequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendFetchRARequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendIDSLocalDeviceInfoRequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendIDStatusQueryRequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)dealloc;
- (void)forwardIPCRequestToIDS:(id)a3 withCompletionBlock:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)setQueuedMessages:(id)a3;
@end

@implementation IDSCredentialsDaemonIDSInterface

+ (id)sharedInstance
{
  if (qword_1000157E0 != -1) {
    dispatch_once(&qword_1000157E0, &stru_100010608);
  }
  v2 = (void *)qword_1000157E8;
  return v2;
}

- (IDSCredentialsDaemonIDSInterface)init
{
  id v3 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.idscredentials"];
  v4 = [(IDSCredentialsDaemonIDSInterface *)self initWithIDSService:v3];

  return v4;
}

- (IDSCredentialsDaemonIDSInterface)initWithIDSService:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSCredentialsDaemonIDSInterface;
  v6 = [(IDSCredentialsDaemonIDSInterface *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsService, a3);
    [(IDSService *)v7->_idsService addDelegate:v7 queue:&_dispatch_main_q];
    v8 = (IMOrderedMutableDictionary *)objc_alloc_init((Class)IMOrderedMutableDictionary);
    uniqueIDToInfo = v7->_uniqueIDToInfo;
    v7->_uniqueIDToInfo = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    credentialIDByMessageID = v7->_credentialIDByMessageID;
    v7->_credentialIDByMessageID = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedMessages = v7->_queuedMessages;
    v7->_queuedMessages = v12;
  }
  return v7;
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)IDSCredentialsDaemonIDSInterface;
  [(IDSCredentialsDaemonIDSInterface *)&v3 dealloc];
}

- (BOOL)isLocalDevicePresent
{
  return 1;
}

- (void)_sendFetchIMFTRequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  v6 = +[NSString stringGUID];
  v7 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v7, IDSRemoteCredentialKeyCommand, &off_100011248);
  if (v6) {
    CFDictionarySetValue(v7, IDSRemoteCredentialKeyUniqueID, v6);
  }
  if ([v6 length]) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    [(IDSCredentialsDaemonIDSInterface *)self _addMessageInfo:v6 description:@"IDSRemoteCredentialCommandFetchIMFT" completionBlock:v5];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000359C;
  v11[3] = &unk_100010630;
  id v9 = v5;
  id v12 = v9;
  v10 = objc_retainBlock(v11);
  if (![(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:v7 completionBlock:v10 isPairing:0]&& ![(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v7]&& v5)
  {
    (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 9, 0, 0);
  }
}

- (void)_sendFetchRARequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  BOOL v8 = IMGetXPCArrayFromDictionary();

  id v9 = +[NSString stringGUID];
  v10 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v10, IDSRemoteCredentialKeyCommand, &off_100011260);
  if (v9) {
    CFDictionarySetValue(v10, IDSRemoteCredentialKeyUniqueID, v9);
  }
  if (v8) {
    CFDictionarySetValue(v10, IDSRemoteCredentialKeyServiceTypes, v8);
  }
  if ([v9 length] && v7) {
    [(IDSCredentialsDaemonIDSInterface *)self _addMessageInfo:v9 description:@"IDSRemoteCredentialCommandFetchRA" completionBlock:v7];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003790;
  v13[3] = &unk_100010630;
  id v11 = v7;
  id v14 = v11;
  id v12 = objc_retainBlock(v13);
  if (![(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:v10 completionBlock:v12 isPairing:0]&& ![(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v10 queueOneIdentifier:@"IDSRemoteCredentialCommandFetchRA"]&& v7)
  {
    (*((void (**)(id, uint64_t, void, void))v11 + 2))(v11, 17, 0, 0);
  }
}

- (void)_sendIDSLocalDeviceInfoRequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  BOOL v8 = +[NSString stringGUID];
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "About to send device info request to IDS", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v10 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting remote device info", buf, 2u);
  }

  id v11 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v11, IDSRemoteCredentialKeyCommand, &off_100011278);
  if (v8) {
    CFDictionarySetValue(v11, IDSRemoteCredentialKeyUniqueID, v8);
  }
  if ([v8 length] && v7) {
    [(IDSCredentialsDaemonIDSInterface *)self _addMessageInfo:v8 description:@"IDSRemoteCredentialCommandRequestDeviceInfo" completionBlock:v7];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003A6C;
  v15[3] = &unk_100010630;
  id v12 = v7;
  id v16 = v12;
  v13 = objc_retainBlock(v15);
  if (![(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:v11 queueOneIdentifier:@"IDSRemoteCredentialCommandRequestDeviceInfo" completionBlock:v13 isPairing:1]&& ![(IDSCredentialsDaemonIDSInterface *)self _sendIDSPairingMessage:v11 queueOneIdentifier:@"IDSRemoteCredentialCommandRequestDeviceInfo"]&& v7)
  {
    id v14 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10000A4B4(v14);
    }

    (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 12, 0, 0);
  }
}

- (void)_sendIDStatusQueryRequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[NSString stringGUID];
  id v9 = IMGetXPCArrayFromDictionary();
  v10 = IMGetXPCStringFromDictionary();
  uint64_t v11 = IMGetXPCBoolFromDictionary();
  uint64_t v12 = IMGetXPCBoolFromDictionary();
  v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "About to ID Query request to IDS", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v14 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v14, IDSRemoteCredentialKeyCommand, &off_100011290);
  if (v8) {
    CFDictionarySetValue(v14, IDSRemoteCredentialKeyUniqueID, v8);
  }
  if (v9) {
    CFDictionarySetValue(v14, IDSRemoteCredentialKeyIDs, v9);
  }
  if (v10) {
    CFDictionarySetValue(v14, IDSRemoteCredentialKeyService, v10);
  }
  objc_super v15 = +[NSNumber numberWithBool:v11];
  if (v15) {
    CFDictionarySetValue(v14, IDSRemoteCredentialKeyLightQuery, v15);
  }

  id v16 = +[NSNumber numberWithBool:v12];
  if (v16) {
    CFDictionarySetValue(v14, IDSRemoteCredentialKeyAllowQuery, v16);
  }

  if ([v8 length]) {
    [(IDSCredentialsDaemonIDSInterface *)self _addMessageInfo:v8 description:@"IDSRemoteCredentialCommandRequestIDStatus" completionBlock:v7];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100003E28;
  v20[3] = &unk_100010630;
  id v17 = v7;
  id v21 = v17;
  v18 = objc_retainBlock(v20);
  if (![(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:v14 queueOneIdentifier:@"IDSRemoteCredentialCommandRequestDeviceInfo" completionBlock:v18 isPairing:0])
  {
    unsigned __int8 v19 = [(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v14 timeOut:&off_100011338 forcedIdentifier:v8];
    if (v17)
    {
      if ((v19 & 1) == 0) {
        (*((void (**)(id, uint64_t, void, void))v17 + 2))(v17, 14, 0, 0);
      }
    }
  }
}

- (void)_sendAccountSyncMessageToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = +[NSString stringGUID];
  id v9 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending account sync message to paired device", buf, 2u);
  }

  v10 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
  IMGetXPCStringFromDictionary();
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int v12 = IMGetXPCBoolFromDictionary();

  v13 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v13, IDSRemoteCredentialKeyCommand, &off_1000112A8);
  if (v8) {
    CFDictionarySetValue(v13, IDSRemoteCredentialKeyUniqueID, v8);
  }
  if (v10) {
    CFDictionarySetValue(v13, IDSRemoteCredentialKeySyncPayload, v10);
  }
  if ([v8 length]) {
    [(IDSCredentialsDaemonIDSInterface *)self _addMessageInfo:v8 description:@"IDSRemoteCredentialCommandAccountSyncMessage" completionBlock:v6];
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000041A4;
  v27[3] = &unk_100010630;
  id v14 = v6;
  id v28 = v14;
  objc_super v15 = objc_retainBlock(v27);
  id v16 = @"IDSRemoteCredentialCommandRequestDeviceInfo";
  if (v11) {
    id v16 = v11;
  }
  id v17 = v16;
  if (![(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:v13 queueOneIdentifier:v17 completionBlock:v15 isPairing:0])
  {
    v23 = v10;
    if (v12)
    {
      uint64_t v30 = IDSSendMessageOptionAllowCloudDeliveryKey;
      v31 = &__kCFBooleanTrue;
      v18 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    }
    else
    {
      v18 = &__NSDictionary0__struct;
    }
    unsigned __int8 v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout, v23);
    v25 = v18;
    id v26 = 0;
    v20 = self;
    unsigned __int8 v21 = [(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v13 timeOut:v19 queueOneIdentifier:v11 forcedIdentifier:0 options:v18 identifier:&v26];
    id v22 = v26;

    if (!v14 || (v21 & 1) != 0) {
      [(IDSCredentialsDaemonIDSInterface *)v20 _mapMessageIdentifier:v22 toCredentialUniqueID:v8];
    }
    else {
      (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 16, 0, 0);
    }
    v10 = v24;
  }
}

- (BOOL)_sendIDSMessage:(id)a3
{
  return [(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:a3 queueOneIdentifier:0];
}

- (BOOL)_sendIDSMessage:(id)a3 queueOneIdentifier:(id)a4
{
  double v6 = IDSMaxMessageTimeout;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[NSNumber numberWithDouble:v6];
  LOBYTE(self) = [(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v8 timeOut:v9 queueOneIdentifier:v7 forcedIdentifier:0];

  return (char)self;
}

- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 forcedIdentifier:(id)a5
{
  return [(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:a3 timeOut:a4 queueOneIdentifier:0 forcedIdentifier:a5];
}

- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6
{
  return [(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:a3 timeOut:a4 queueOneIdentifier:a5 forcedIdentifier:a6 options:0 identifier:0];
}

- (BOOL)_sendIDSMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6 options:(id)a7 identifier:(id *)a8
{
  id v13 = a3;
  id value = a4;
  id v14 = a5;
  id v46 = a6;
  id v45 = a7;
  [(IDSService *)self->_idsService linkedDevicesWithRelationship:3];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [v15 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v51;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v51 != v17) {
        objc_enumerationMutation(v15);
      }
      unsigned __int8 v19 = *(void **)(*((void *)&v50 + 1) + 8 * v18);
      if ([v19 isActive])
      {
        v20 = [v19 uniqueIDOverride];
        BOOL v21 = [v20 length] == 0;

        if (!v21) {
          break;
        }
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v15 countByEnumeratingWithState:&v50 objects:v64 count:16];
        if (v16) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v22 = IDSCopyIDForDevice();

    if (!v22) {
      goto LABEL_34;
    }
    v23 = JWEncodeDictionary();
    id v43 = [v23 _CUTCopyGzippedData];
    v24 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v25 = v24;
    if (value) {
      CFDictionarySetValue(v24, IDSSendMessageOptionTimeoutKey, value);
    }
    id v26 = IDSGetUUIDData();
    if (v26) {
      CFDictionarySetValue(v25, IDSSendMessageOptionUUIDKey, v26);
    }

    CFDictionarySetValue(v25, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
    if (v14) {
      CFDictionarySetValue(v25, IDSSendMessageOptionQueueOneIdentifierKey, v14);
    }
    [(__CFDictionary *)v25 addEntriesFromDictionary:v45];
    idsService = self->_idsService;
    id v28 = +[NSSet setWithObject:v22];
    id v48 = 0;
    id v49 = 0;
    unsigned int v29 = [(IDSService *)idsService sendData:v43 toDestinations:v28 priority:300 options:v25 identifier:&v49 error:&v48];
    id v30 = v49;
    id v31 = v48;

    v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v33 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v55 = v30;
      if (v29) {
        CFStringRef v33 = @"YES";
      }
      __int16 v56 = 2112;
      id v57 = v31;
      __int16 v58 = 2112;
      v59 = v25;
      __int16 v60 = 2112;
      id v61 = v13;
      __int16 v62 = 2112;
      CFStringRef v63 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Sending message to local account (identifier %@)  (error %@)  (options %@)  (messageDict %@) success: %@", buf, 0x34u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v34 = @"NO";
      if (v29) {
        CFStringRef v34 = @"YES";
      }
      id v41 = v13;
      CFStringRef v42 = v34;
      id v39 = v31;
      v40 = v25;
      id v38 = v30;
      _IDSLogV();
    }
    v35 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v36 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v55 = v30;
      if (v29) {
        CFStringRef v36 = @"YES";
      }
      __int16 v56 = 2112;
      id v57 = v31;
      __int16 v58 = 2112;
      v59 = v25;
      __int16 v60 = 2112;
      id v61 = v13;
      __int16 v62 = 2112;
      CFStringRef v63 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Sending message to local account (identifier %@)  (error %@)  (options %@)  (messageDict %@) success: %@", buf, 0x34u);
    }

    if (a8) {
      *a8 = v30;
    }
  }
  else
  {
LABEL_10:

LABEL_34:
    id v22 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Couldn't find active device to send message", buf, 2u);
    }
    LOBYTE(v29) = 0;
  }

  return v29;
}

- (BOOL)_sendIDSPairingMessage:(id)a3
{
  return [(IDSCredentialsDaemonIDSInterface *)self _sendIDSPairingMessage:a3 queueOneIdentifier:0];
}

- (BOOL)_sendIDSPairingMessage:(id)a3 queueOneIdentifier:(id)a4
{
  double v6 = IDSMaxMessageTimeout;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[NSNumber numberWithDouble:v6];
  LOBYTE(self) = [(IDSCredentialsDaemonIDSInterface *)self _sendIDSPairingMessage:v8 timeOut:v9 queueOneIdentifier:v7 forcedIdentifier:0];

  return (char)self;
}

- (BOOL)_sendIDSPairingMessage:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v33 = a6;
  id v13 = JWEncodeDictionary();
  id v14 = [v13 _CUTCopyGzippedData];
  id v15 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v16 = v15;
  if (v11) {
    CFDictionarySetValue(v15, IDSSendMessageOptionTimeoutKey, v11);
  }
  uint64_t v17 = IDSGetUUIDData();
  if (v17) {
    CFDictionarySetValue(v16, IDSSendMessageOptionUUIDKey, v17);
  }

  CFDictionarySetValue(v16, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
  if (v12) {
    CFDictionarySetValue(v16, IDSSendMessageOptionQueueOneIdentifierKey, v12);
  }
  idsService = self->_idsService;
  unsigned __int8 v19 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v34 = 0;
  id v35 = 0;
  unsigned int v20 = [(IDSService *)idsService sendData:v14 toDestinations:v19 priority:300 options:v16 identifier:&v35 error:&v34];
  id v21 = v35;
  id v22 = v34;

  v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v24 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v37 = v21;
    if (v20) {
      CFStringRef v24 = @"YES";
    }
    __int16 v38 = 2112;
    id v39 = v22;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    CFStringRef v43 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Sending pairing message to local account (identifier %@)  (error %@)  (messageDict %@) success: %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v25 = @"NO";
    if (v20) {
      CFStringRef v25 = @"YES";
    }
    id v31 = v10;
    CFStringRef v32 = v25;
    id v29 = v21;
    id v30 = v22;
    _IDSLogV();
  }
  id v26 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v27 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v37 = v21;
    if (v20) {
      CFStringRef v27 = @"YES";
    }
    __int16 v38 = 2112;
    id v39 = v22;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    CFStringRef v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sending pairing message to local account (identifier %@)  (error %@)  (messageDict %@) success: %@", buf, 0x2Au);
  }

  return v20;
}

- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 completionBlock:(id)a4 isPairing:(BOOL)a5
{
  return [(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:a3 queueOneIdentifier:0 completionBlock:a4 isPairing:a5];
}

- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 queueOneIdentifier:(id)a4 completionBlock:(id)a5 isPairing:(BOOL)a6
{
  BOOL v6 = a6;
  double v10 = IDSMaxMessageTimeout;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[NSNumber numberWithDouble:v10];
  LOBYTE(v6) = [(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:v13 timeOut:v14 queueOneIdentifier:v12 forcedIdentifier:0 completionBlock:v11 isPairing:v6];

  return v6;
}

- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 timeOut:(id)a4 forcedIdentifier:(id)a5 completionBlock:(id)a6 isPairing:(BOOL)a7
{
  return [(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:a3 timeOut:a4 queueOneIdentifier:0 forcedIdentifier:a5 completionBlock:a6 isPairing:a7];
}

- (BOOL)_storeIDSMessageForLaterDeliveryIfNecessary:(id)a3 timeOut:(id)a4 queueOneIdentifier:(id)a5 forcedIdentifier:(id)a6 completionBlock:(id)a7 isPairing:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  unsigned __int8 v19 = [(IDSService *)self->_idsService accounts];
  id v20 = [v19 count];

  if (!v20)
  {
    id v21 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v22 = +[NSNumber numberWithBool:v8];
    if (v22) {
      CFDictionarySetValue(v21, @"IDSQueuedMessageIsPairing", v22);
    }

    if (v14) {
      CFDictionarySetValue(v21, @"IDSQueuedMessageRequest", v14);
    }
    if (v15) {
      CFDictionarySetValue(v21, @"IDSQueuedMessageTimeout", v15);
    }
    if (v16) {
      CFDictionarySetValue(v21, @"IDSQueuedMessageQueueOneIdentifier", v16);
    }
    if (v17) {
      CFDictionarySetValue(v21, @"IDSQueuedMessageForceIdentifier", v17);
    }
    id v23 = objc_retainBlock(v18);
    if (v23) {
      CFDictionarySetValue(v21, @"IDSQueuedMessageCompletionBlock", v23);
    }

    [(NSMutableArray *)self->_queuedMessages addObject:v21];
  }

  return v20 == 0;
}

- (void)forwardIPCRequestToIDS:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  int v8 = IMGetXPCIntFromDictionary();
  switch(v8)
  {
    case 9:
      [(IDSCredentialsDaemonIDSInterface *)self _sendFetchIMFTRequestToIDS:v6 withCompletionBlock:v7];
      break;
    case 11:
      [(IDSCredentialsDaemonIDSInterface *)self _sendIDSLocalDeviceInfoRequestToIDS:v6 withCompletionBlock:v7];
      break;
    case 13:
      [(IDSCredentialsDaemonIDSInterface *)self _sendIDStatusQueryRequestToIDS:v6 withCompletionBlock:v7];
      break;
    case 15:
      [(IDSCredentialsDaemonIDSInterface *)self _sendAccountSyncMessageToIDS:v6 withCompletionBlock:v7];
      break;
    case 17:
      [(IDSCredentialsDaemonIDSInterface *)self _sendFetchRARequestToIDS:v6 withCompletionBlock:v7];
      break;
    default:
      id v9 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Could not forward command %d to IDS", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      break;
  }
}

- (void)_handleFetchFaceTimeAndiMessageInfoMessage:(id)a3
{
  id v22 = (__CFDictionary *)a3;
  objc_super v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received fetch iMessage info message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v20 = v22;
    _IDSLogV();
  }
  v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching All Accounts that support AccountSync: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v20 = v22;
    _IDSLogV();
  }
  uint64_t v5 = objc_opt_class();
  id v6 = (const void *)IDSRemoteCredentialKeyUniqueID;
  id v7 = sub_100005440(v5, v22, IDSRemoteCredentialKeyUniqueID);
  int v8 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v8, IDSRemoteCredentialKeyCommand, &off_1000112C0);
  if (v7) {
    CFDictionarySetValue(v8, v6, v7);
  }
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc((Class)IDSAccountController);
  id v11 = [v10 initWithService:IDSServiceNameiMessage];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = [v11 enabledAccounts];
  id v13 = 0;
  id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      id v16 = 0;
      id v17 = v13;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v13 = objc_msgSend(v11, "accountWithUniqueID:", *(void *)(*((void *)&v23 + 1) + 8 * (void)v16), v20);

        id v18 = [v13 accountInfo];
        [v9 addObject:v18];

        id v16 = (char *)v16 + 1;
        id v17 = v13;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  if (v9) {
    CFDictionarySetValue(v8, IDSRemoteCredentialKeyiMessageAccountInfo, v9);
  }
  unsigned __int8 v19 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending iMessage account info %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v20 = v8;
    _IDSLogV();
  }
  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:](self, "_storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:", v8, 0, 0, v20))[(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v8]; {
}
  }

- (void)_handleFetchFaceTimeAndiMessageInfoMessageResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received fetch FaceTime and iMessage info response message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = v4;
    _IDSLogV();
  }
  uint64_t v6 = objc_opt_class();
  id v7 = sub_100005440(v6, v4, IDSRemoteCredentialKeyUniqueID);
  if (![v7 length])
  {
    int v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No unique ID in message, ignoring response...", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  uint64_t v9 = -[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:](self, "_blockForMessageIdentifier:", v7, v11);
  id v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v9 + 16))(v9, 10, v4, 1);
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageInfo:v7];
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageIdentifierMappingWithCredentialUniqueID:v7];
  }
}

- (void)_handleFetchRAMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received fetch Remote Accounts Message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v4;
    _IDSLogV();
  }
  uint64_t v6 = objc_msgSend(v4, "_arrayForKey:", @"serviceTypes", v15);
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching All Accounts Passed In: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = v6;
    _IDSLogV();
  }
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = (const void *)IDSRemoteCredentialKeyUniqueID;
  id v10 = sub_100005440(v8, v4, IDSRemoteCredentialKeyUniqueID);
  id v11 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v11, IDSRemoteCredentialKeyCommand, &off_1000112D8);
  if (v10) {
    CFDictionarySetValue(v11, v9, v10);
  }
  id v12 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Local setup - received incoming RA Request message", buf, 2u);
  }

  id v13 = +[IDSPairedDeviceManager sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100005A64;
  v17[3] = &unk_100010658;
  id v18 = v11;
  unsigned __int8 v19 = self;
  id v14 = v11;
  [v13 constructRAResponseDictionary:v6 completionHandler:v17];
}

- (void)_handleFetchRAMessageResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received fetch remote account response message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = v4;
    _IDSLogV();
  }
  uint64_t v6 = objc_opt_class();
  id v7 = sub_100005440(v6, v4, IDSRemoteCredentialKeyUniqueID);
  if (![v7 length])
  {
    uint64_t v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No unique ID in message, ignoring response...", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  uint64_t v9 = -[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:](self, "_blockForMessageIdentifier:", v7, v11);
  id v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v9 + 16))(v9, 18, v4, 1);
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageInfo:v7];
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageIdentifierMappingWithCredentialUniqueID:v7];
  }
}

- (void)_handleSendIDSLocalDeviceInfoRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to provide my device info to remote device", buf, 2u);
  }

  uint64_t v6 = +[IDSPairedDeviceManager sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005EA4;
  v8[3] = &unk_100010658;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 getLocalDeviceInfoWithCompletionBlock:v8 queue:&_dispatch_main_q];
}

- (void)_handleSendIDSLocalDeviceInfoResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received remote device info: %@", buf, 0xCu);
  }

  uint64_t v6 = IDSRemoteCredentialKeyEncryptionKey;
  id v7 = [v4 objectForKey:IDSRemoteCredentialKeyEncryptionKey];
  objc_opt_class();
  __int16 v38 = self;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v4 objectForKey:v6];
    uint64_t v9 = +[NSData _IDSDataFromBase64String:v8];
LABEL_7:
    id v10 = (void *)v9;
    goto LABEL_9;
  }
  uint64_t v8 = [v4 objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v4 objectForKey:v6];
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_9:

  uint64_t v11 = IDSRemoteCredentialKeyEncryptionClassAKey;
  id v12 = [v4 objectForKey:IDSRemoteCredentialKeyEncryptionClassAKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v4 objectForKey:v11];
    uint64_t v14 = +[NSData _IDSDataFromBase64String:v13];
LABEL_13:
    __int16 v40 = (void *)v14;
    goto LABEL_15;
  }
  id v13 = [v4 objectForKey:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v4 objectForKey:v11];
    goto LABEL_13;
  }
  __int16 v40 = 0;
LABEL_15:

  uint64_t v15 = IDSRemoteCredentialKeyEncryptionClassCKey;
  id v16 = [v4 objectForKey:IDSRemoteCredentialKeyEncryptionClassCKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [v4 objectForKey:v15];
    uint64_t v18 = +[NSData _IDSDataFromBase64String:v17];
LABEL_19:
    unsigned __int8 v19 = (void *)v18;
    goto LABEL_21;
  }
  id v17 = [v4 objectForKey:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [v4 objectForKey:v15];
    goto LABEL_19;
  }
  unsigned __int8 v19 = 0;
LABEL_21:

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = sub_100005440(v20, v4, IDSRemoteCredentialKeyIdentifier);
  uint64_t v22 = objc_opt_class();
  long long v23 = sub_100005440(v22, v4, IDSRemoteCredentialKeyPrivateDeviceData);
  uint64_t v24 = objc_opt_class();
  long long v25 = sub_100005440(v24, v4, IDSRemoteCredentialKeyDeviceName);
  uint64_t v26 = objc_opt_class();
  CFStringRef v27 = sub_100005440(v26, v4, IDSRemoteCredentialKeyHardwareVersion);
  id v28 = objc_alloc((Class)NSDictionary);
  id v29 = v19;
  id v37 = v19;
  id v39 = v10;
  id v30 = (void *)v21;
  id v31 = objc_msgSend(v28, "initWithObjectsAndKeys:", v21, IDSDevicePropertyIdentifier, v10, IDSDevicePropertyEncryptionKey, v40, IDSDevicePropertyEncryptionClassAKey, v37, IDSDevicePropertyEncryptionClassCKey, v23, IDSDevicePropertyPrivateDeviceData, v25, IDSDevicePropertyName, v27, IDSDevicePropertyHardwareVersion, 0);
  CFStringRef v32 = +[IDSPairedDeviceManager sharedInstance];
  [v32 setPairedDeviceInfo:v31];

  uint64_t v33 = objc_opt_class();
  id v34 = sub_100005440(v33, v4, IDSRemoteCredentialKeyUniqueID);
  uint64_t v35 = [(IDSCredentialsDaemonIDSInterface *)v38 _blockForMessageIdentifier:v34];
  CFStringRef v36 = (void *)v35;
  if (v35)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v35 + 16))(v35, 12, v4, 1);
    [(IDSCredentialsDaemonIDSInterface *)v38 _removeMessageInfo:v34];
    [(IDSCredentialsDaemonIDSInterface *)v38 _removeMessageIdentifierMappingWithCredentialUniqueID:v34];
  }
}

- (void)_handleSendIDSIDLocalIDQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received IDs V2 Query Request message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = v4;
    _IDSLogV();
  }
  uint64_t v6 = objc_msgSend(v4, "_arrayForKey:", IDSRemoteCredentialKeyIDs, v18);
  id v7 = (const void *)IDSRemoteCredentialKeyService;
  uint64_t v8 = [v4 _stringForKey:IDSRemoteCredentialKeyService];
  uint64_t v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RUNNING REMOTE ID QUERY V2 WITH IDs: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    unsigned __int8 v19 = v6;
    _IDSLogV();
  }
  id v10 = +[IDSIDQueryController sharedInstance];
  uint64_t v11 = [v10 _refreshIDStatusForDestinations:v6 service:v8 listenerID:@"__kIDSCredentialsProxyIDSQueryControllerListenerID"];

  id v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remote ID Status V2 Query has completed with the following results: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v20 = v11;
    _IDSLogV();
  }
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = (const void *)IDSRemoteCredentialKeyUniqueID;
  uint64_t v15 = sub_100005440(v13, v4, IDSRemoteCredentialKeyUniqueID);
  id v16 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v16, IDSRemoteCredentialKeyCommand, &off_100011308);
  if (v15) {
    CFDictionarySetValue(v16, v14, v15);
  }
  if (v8) {
    CFDictionarySetValue(v16, v7, v8);
  }
  if (v11) {
    CFDictionarySetValue(v16, IDSRemoteCredentialKeyIdStatusUpdates, v11);
  }
  CFDictionarySetValue(v16, IDSRemoteCredentialKeySuccess, &__kCFBooleanTrue);
  id v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Remote IDs Query V2 - Sending results over IDS", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (!-[IDSCredentialsDaemonIDSInterface _storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:](self, "_storeIDSMessageForLaterDeliveryIfNecessary:completionBlock:isPairing:", v16, 0, 0, v20))[(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v16]; {
}
  }

- (void)_handleSendIDSIDLocalIDQueryResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received ID Query response message V2 : %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  uint64_t v6 = objc_opt_class();
  id v7 = sub_100005440(v6, v4, IDSRemoteCredentialKeyUniqueID);
  uint64_t v8 = [(IDSCredentialsDaemonIDSInterface *)self _blockForMessageIdentifier:v7];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 16))(v8, 14, v4, 1);
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageInfo:v7];
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageIdentifierMappingWithCredentialUniqueID:v7];
  }
}

- (void)_handleIncomingAccountSyncMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = +[NSDictionary dictionaryWithDictionary:v4];
    int v13 = 138412290;
    uint64_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received incoming account sync message %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = sub_100005440(v7, v4, IDSRemoteCredentialKeySyncPayload);
  IDSIncomingAccountSyncMessage();
  uint64_t v9 = objc_opt_class();
  id v10 = (const void *)IDSRemoteCredentialKeyUniqueID;
  id v11 = sub_100005440(v9, v4, IDSRemoteCredentialKeyUniqueID);
  id v12 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v12, IDSRemoteCredentialKeyCommand, &off_100011320);
  if (v11) {
    CFDictionarySetValue(v12, v10, v11);
  }
  CFDictionarySetValue(v12, IDSRemoteCredentialKeySuccess, &__kCFBooleanTrue);
  if (![(IDSCredentialsDaemonIDSInterface *)self _storeIDSMessageForLaterDeliveryIfNecessary:v12 completionBlock:0 isPairing:0])[(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v12]; {
}
  }

- (void)_handleIncomingAccountSyncMessageResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = +[NSDictionary dictionaryWithDictionary:v4];
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received incoming account sync message response %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = sub_100005440(v7, v4, IDSRemoteCredentialKeyUniqueID);
  uint64_t v9 = [(IDSCredentialsDaemonIDSInterface *)self _blockForMessageIdentifier:v8];
  id v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v9 + 16))(v9, 16, v4, 1);
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageInfo:v8];
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageIdentifierMappingWithCredentialUniqueID:v8];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2112;
    id v34 = v14;
    __int16 v35 = 2112;
    id v36 = v15;
    __int16 v37 = 2112;
    id v38 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "incomingData on service %@, account %@ data %@ fromID %@ context %@", buf, 0x34u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v27 = v15;
    id v28 = v16;
    id v25 = v13;
    id v26 = v14;
    id v24 = v12;
    _IDSLogV();
  }
  id v18 = objc_msgSend(v14, "_CUTOptionallyDecompressData", v24, v25, v26, v27, v28);
  unsigned __int8 v19 = JWDecodeDictionary();
  uint64_t v20 = [v19 objectForKey:IDSRemoteCredentialKeyCommand];
  unsigned int v21 = [v20 unsignedIntValue];

  switch(v21)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      id v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received deprecated IDSRemoteCredential command -- ignoring { command: %u }", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        goto LABEL_11;
      }
      break;
    case 9u:
      [(IDSCredentialsDaemonIDSInterface *)self _handleFetchFaceTimeAndiMessageInfoMessage:v19];
      break;
    case 0xAu:
      [(IDSCredentialsDaemonIDSInterface *)self _handleFetchFaceTimeAndiMessageInfoMessageResponse:v19];
      break;
    case 0xBu:
      [(IDSCredentialsDaemonIDSInterface *)self _handleSendIDSLocalDeviceInfoRequest:v19];
      break;
    case 0xCu:
      [(IDSCredentialsDaemonIDSInterface *)self _handleSendIDSLocalDeviceInfoResponse:v19];
      break;
    case 0xDu:
      [(IDSCredentialsDaemonIDSInterface *)self _handleSendIDSIDLocalIDQuery:v19];
      break;
    case 0xEu:
      [(IDSCredentialsDaemonIDSInterface *)self _handleSendIDSIDLocalIDQueryResponse:v19];
      break;
    case 0xFu:
      [(IDSCredentialsDaemonIDSInterface *)self _handleIncomingAccountSyncMessage:v19];
      break;
    case 0x10u:
      [(IDSCredentialsDaemonIDSInterface *)self _handleIncomingAccountSyncMessageResponse:v19];
      break;
    case 0x11u:
      [(IDSCredentialsDaemonIDSInterface *)self _handleFetchRAMessage:v19];
      break;
    case 0x12u:
      [(IDSCredentialsDaemonIDSInterface *)self _handleFetchRAMessageResponse:v19];
      break;
    default:
      long long v23 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Unknown incoming IDS message with command %d, ignoring...", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_11:
      }
        _IDSLogV();
      break;
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v30 = v14;
    __int16 v31 = 2112;
    if (v8) {
      CFStringRef v17 = @"YES";
    }
    CFStringRef v32 = v17;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sent message with identifier %@ success %@ error %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v18 = @"NO";
    if (v8) {
      CFStringRef v18 = @"YES";
    }
    CFStringRef v27 = v18;
    id v28 = v15;
    id v26 = v14;
    _IDSLogV();
  }
  unsigned __int8 v19 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    unsigned int v21 = [(IMOrderedMutableDictionary *)self->_uniqueIDToInfo orderedObjects];
    *(_DWORD *)buf = 138413058;
    id v30 = v14;
    __int16 v31 = 2112;
    CFStringRef v32 = v20;
    __int16 v33 = 2112;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sent message with identifier %@ success %@ error %@. Messages still in the queue: %@", buf, 0x2Au);
  }
  if (!v8)
  {
    id v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to send IDS message", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    long long v23 = [(IDSCredentialsDaemonIDSInterface *)self _credentialUniqueIDFromMessageIdentifier:v14];
    id v24 = [(IDSCredentialsDaemonIDSInterface *)self _blockForMessageIdentifier:v23];
    if (v24)
    {
      id v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found original completion block for this message", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v24[2](v24, 0, 0, 0);
      [(IDSCredentialsDaemonIDSInterface *)self _removeMessageInfo:v23];
    }
    [(IDSCredentialsDaemonIDSInterface *)self _removeMessageIdentifierMapping:v14];
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  queuedMessages = self->_queuedMessages;
  uint64_t v6 = (void (**)(void))a5;
  [(NSMutableArray *)queuedMessages removeAllObjects];
  v6[2]();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (objc_msgSend(a4, "count", a3))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obj = self->_queuedMessages;
    id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v5) {
      goto LABEL_15;
    }
    id v6 = v5;
    uint64_t v21 = *(void *)v23;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        id v10 = sub_100005440(v9, v8, @"IDSQueuedMessageRequest");
        uint64_t v11 = objc_opt_class();
        id v12 = sub_100005440(v11, v8, @"IDSQueuedMessageTimeout");
        uint64_t v13 = objc_opt_class();
        id v14 = sub_100005440(v13, v8, @"IDSQueuedMessageQueueOneIdentifier");
        uint64_t v15 = objc_opt_class();
        id v16 = sub_100005440(v15, v8, @"IDSQueuedMessageForceIdentifier");
        CFStringRef v17 = [v8 objectForKey:@"IDSQueuedMessageCompletionBlock"];
        CFStringRef v18 = [v8 objectForKey:@"IDSQueuedMessageIsPairing"];
        unsigned int v19 = [v18 BOOLValue];

        if (v19)
        {
          if ([(IDSCredentialsDaemonIDSInterface *)self _sendIDSPairingMessage:v10 timeOut:v12 queueOneIdentifier:v14 forcedIdentifier:v16])
          {
            goto LABEL_13;
          }
        }
        else if ([(IDSCredentialsDaemonIDSInterface *)self _sendIDSMessage:v10 timeOut:v12 queueOneIdentifier:v14 forcedIdentifier:v16])
        {
          goto LABEL_13;
        }
        if (v17) {
          v17[2](v17);
        }
LABEL_13:
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v6)
      {
LABEL_15:

        break;
      }
    }
  }
  [(NSMutableArray *)self->_queuedMessages removeAllObjects];
}

- (void)_addMessageInfo:(id)a3 description:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v12 = objc_retainBlock(v9);

  if (v12)
  {
    CFDictionarySetValue(Mutable, @"block", v12);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000A6E0();
  }

  id v13 = v8;
  if (v13)
  {
    CFDictionarySetValue(Mutable, @"description", v13);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000A644();
  }

  [(IMOrderedMutableDictionary *)self->_uniqueIDToInfo setOrderedObject:Mutable forKey:v10];
}

- (void)_removeMessageInfo:(id)a3
{
}

- (void)_mapMessageIdentifier:(id)a3 toCredentialUniqueID:(id)a4
{
  if (a3)
  {
    if (a4) {
      [(NSMutableDictionary *)self->_credentialIDByMessageID setObject:a4 forKey:a3];
    }
  }
}

- (void)_removeMessageIdentifierMapping:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_credentialIDByMessageID, "removeObjectForKey:");
  }
}

- (void)_removeMessageIdentifierMappingWithCredentialUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_credentialIDByMessageID;
    id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_credentialIDByMessageID, "objectForKeyedSubscript:", v10, (void)v14);
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      id v13 = v10;

      if (!v13) {
        goto LABEL_14;
      }
      [(IDSCredentialsDaemonIDSInterface *)self _removeMessageIdentifierMapping:v13];
      id v5 = v13;
    }
LABEL_13:
  }
LABEL_14:
}

- (id)_credentialUniqueIDFromMessageIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_credentialIDByMessageID, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSMutableArray)queuedMessages
{
  return self->_queuedMessages;
}

- (void)setQueuedMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedMessages, 0);
  objc_storeStrong((id *)&self->_credentialIDByMessageID, 0);
  objc_storeStrong((id *)&self->_uniqueIDToInfo, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end