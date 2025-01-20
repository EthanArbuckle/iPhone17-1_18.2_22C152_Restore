@interface AKPeerIDSAnisetteService
+ (id)sharedService;
- (AKPeerIDSAnisetteService)init;
- (id)_activePairedTinkerDevice;
- (void)_handleIncomingCommandMessage:(id)a3 completion:(id)a4;
- (void)_mhq_handleIncomingReplyMessage:(id)a3;
- (void)_performRemoteCommand:(unint64_t)a3 argument:(id)a4 completion:(id)a5;
- (void)_replyToCommandMessageWithInternalID:(id)a3 didSucceed:(BOOL)a4 returnData:(id)a5 error:(id)a6 completion:(id)a7;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)startListeningForMessagesFromPairedDevice;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation AKPeerIDSAnisetteService

+ (id)sharedService
{
  if (qword_100272408 != -1) {
    dispatch_once(&qword_100272408, &stru_100228250);
  }
  v2 = (void *)qword_100272400;

  return v2;
}

- (AKPeerIDSAnisetteService)init
{
  v13.receiver = self;
  v13.super_class = (Class)AKPeerIDSAnisetteService;
  v2 = [(AKPeerIDSAnisetteService *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ak.idsq", v3);
    messageHandlingQueue = v2->_messageHandlingQueue;
    v2->_messageHandlingQueue = (OS_dispatch_queue *)v4;

    v6 = (IDSService *)[objc_alloc((Class)sub_100040BF4()) initWithService:@"com.apple.private.alloy.anisette"];
    messageSendingService = v2->_messageSendingService;
    v2->_messageSendingService = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    completionsByInternalMessageID = v2->_completionsByInternalMessageID;
    v2->_completionsByInternalMessageID = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    internalMessageIDsByTransportID = v2->_internalMessageIDsByTransportID;
    v2->_internalMessageIDsByTransportID = v10;

    [(IDSService *)v2->_messageSendingService addDelegate:v2 queue:v2->_messageHandlingQueue];
  }
  return v2;
}

- (void)startListeningForMessagesFromPairedDevice
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Listening for messages from paired device...", v3, 2u);
  }
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100181790();
  }

  v8 = +[NSNumber numberWithBool:v4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004200C;
  v10[3] = &unk_100228278;
  id v11 = v6;
  id v9 = v6;
  [(AKPeerIDSAnisetteService *)self _performRemoteCommand:1 argument:v8 completion:v10];
}

- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v13 = 0;
  v7 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v13];
  id v8 = v13;
  if (v8)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001818A0();
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100042258;
  v11[3] = &unk_100228278;
  id v12 = v6;
  id v10 = v6;
  [(AKPeerIDSAnisetteService *)self _performRemoteCommand:6 argument:v7 completion:v11];
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100181A40();
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004254C;
  v10[3] = &unk_100228278;
  id v11 = v6;
  id v9 = v6;
  [(AKPeerIDSAnisetteService *)self _performRemoteCommand:4 argument:v7 completion:v10];
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100181ABC();
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042630;
  v7[3] = &unk_100228278;
  id v8 = v4;
  id v6 = v4;
  [(AKPeerIDSAnisetteService *)self _performRemoteCommand:5 argument:0 completion:v7];
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100181B38();
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042714;
  v7[3] = &unk_100228278;
  id v8 = v4;
  id v6 = v4;
  [(AKPeerIDSAnisetteService *)self _performRemoteCommand:3 argument:0 completion:v7];
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100181BB4();
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100042808;
  v10[3] = &unk_100228278;
  id v11 = v6;
  id v9 = v6;
  [(AKPeerIDSAnisetteService *)self _performRemoteCommand:2 argument:v7 completion:v10];
}

- (void)_performRemoteCommand:(unint64_t)a3 argument:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100181C30(a3, v10);
  }

  id v11 = objc_alloc_init(AKCommandMessage);
  [(AKCommandMessage *)v11 setCommand:a3];
  [(AKCommandMessage *)v11 setArgument:v9];

  id v12 = sub_10004125C();
  v25[0] = v12;
  v26[0] = &__kCFBooleanTrue;
  id v13 = sub_1000413D0();
  v25[1] = v13;
  v26[1] = &__kCFBooleanFalse;
  v14 = sub_100041544();
  v25[2] = v14;
  v26[2] = &off_10023AF90;
  v15 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

  messageHandlingQueue = self->_messageHandlingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042AD4;
  block[3] = &unk_100227618;
  v21 = v11;
  v22 = self;
  id v23 = v15;
  id v24 = v8;
  id v17 = v8;
  id v18 = v15;
  v19 = v11;
  dispatch_async(messageHandlingQueue, block);
}

- (id)_activePairedTinkerDevice
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10000F8C0;
  id v10 = sub_10000F7B0;
  id v11 = 0;
  v2 = [(IDSService *)self->_messageSendingService linkedDevicesWithRelationship:2];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100042FB4;
  v5[3] = &unk_1002282A0;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_replyToCommandMessageWithInternalID:(id)a3 didSucceed:(BOOL)a4 returnData:(id)a5 error:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  v16 = _AKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100181D38();
  }

  id v17 = objc_alloc_init(AKReplyMessage);
  [(AKReplyMessage *)v17 setReplyToID:v12];
  [(AKReplyMessage *)v17 setDidSucceed:v10];
  [(AKReplyMessage *)v17 setReturnData:v15];

  [(AKReplyMessage *)v17 setError:v14];
  id v18 = sub_10004125C();
  v31[0] = v18;
  v32[0] = &__kCFBooleanTrue;
  v19 = sub_1000413D0();
  v31[1] = v19;
  v32[1] = &__kCFBooleanFalse;
  v20 = sub_100041544();
  v31[2] = v20;
  v32[2] = &off_10023AF90;
  v21 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

  messageHandlingQueue = self->_messageHandlingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004328C;
  block[3] = &unk_100227618;
  v27 = v17;
  v28 = self;
  id v29 = v21;
  id v30 = v13;
  id v23 = v13;
  id v24 = v21;
  v25 = v17;
  dispatch_async(messageHandlingQueue, block);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = _AKLogSystem();
  id v17 = v16;
  if (v14)
  {
    if (a6)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Success sending message with Transport ID %@!", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100181E3C();
      }

      id v17 = [(NSMutableDictionary *)self->_internalMessageIDsByTransportID objectForKeyedSubscript:v14];
      if (v17)
      {
        id v18 = [(NSMutableDictionary *)self->_completionsByInternalMessageID objectForKeyedSubscript:v17];
        [(NSMutableDictionary *)self->_completionsByInternalMessageID removeObjectForKey:v17];
        [(NSMutableDictionary *)self->_internalMessageIDsByTransportID removeObjectForKey:v14];
        if (v18)
        {
          v19 = dispatch_get_global_queue(21, 0);
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100043694;
          v20[3] = &unk_1002279F0;
          id v18 = v18;
          v22 = v18;
          id v21 = v15;
          dispatch_async(v19, v20);
        }
      }
      else
      {
        id v18 = _AKLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v14;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No internal message ID exists for transport ID %@, so we're ignoring the send failure.", buf, 0xCu);
        }
      }
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    sub_100181E08();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a5;
  if ((id)+[_AKMessage typeForMessageWithTransportRepresentation:v8] == (id)1)
  {
    id v9 = +[_AKMessage messageFromTransportRepresentation:v8];

    BOOL v10 = _AKLogSystem();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v18 = v9;
    id v11 = "Received reply message from paired device: %@";
  }
  else
  {
    id v9 = +[_AKMessage messageFromTransportRepresentation:v8];

    BOOL v10 = _AKLogSystem();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v18 = v9;
    id v11 = "Received command message from paired device: %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
LABEL_7:

  id v12 = [v9 identifier];
  if (v12)
  {
    id v13 = os_transaction_create();
    if ([v9 type] == (id)1)
    {
      [(AKPeerIDSAnisetteService *)self _mhq_handleIncomingReplyMessage:v9];
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000438E4;
      v14[3] = &unk_1002282C8;
      v14[4] = self;
      id v15 = v12;
      id v13 = v13;
      v16 = v13;
      [(AKPeerIDSAnisetteService *)self _handleIncomingCommandMessage:v9 completion:v14];
    }
  }
  else
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100181EC0();
    }
  }
}

- (void)_handleIncomingCommandMessage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 command];
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:v7];
    *(_DWORD *)buf = 138412290;
    v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling command from paired device: %@", buf, 0xCu);
  }
  if (v7)
  {
    BOOL v10 = [v5 argument];
    id v11 = objc_alloc_init(AKNativeAnisetteService);
    switch((unint64_t)v7)
    {
      case 1uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_18;
        }
        id v12 = [v10 BOOLValue];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100043F9C;
        v35[3] = &unk_1002282F0;
        id v36 = v6;
        [(AKNativeAnisetteService *)v11 fetchAnisetteDataAndProvisionIfNecessary:v12 withCompletion:v35];
        id v13 = v36;
        break;
      case 2uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_18;
        }
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100044094;
        v27[3] = &unk_1002282F0;
        id v28 = v6;
        [(AKNativeAnisetteService *)v11 legacyAnisetteDataForDSID:v10 withCompletion:v27];
        id v13 = v28;
        break;
      case 3uLL:
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10004404C;
        v33[3] = &unk_1002270A8;
        id v34 = v6;
        [(AKNativeAnisetteService *)v11 provisionAnisetteWithCompletion:v33];
        id v13 = v34;
        break;
      case 4uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_18:
          uint64_t v16 = AKAnisetteErrorDomain;
          uint64_t v17 = -8016;
          goto LABEL_19;
        }
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100044064;
        void v31[3] = &unk_1002270A8;
        id v32 = v6;
        [(AKNativeAnisetteService *)v11 syncAnisetteWithSIMData:v10 completion:v31];
        id v13 = v32;
        break;
      case 5uLL:
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10004407C;
        v29[3] = &unk_1002270A8;
        id v30 = v6;
        [(AKNativeAnisetteService *)v11 eraseAnisetteWithCompletion:v29];
        id v13 = v30;
        break;
      case 6uLL:
        id v13 = v10;
        uint64_t v18 = objc_opt_class();
        v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(), 0);
        id v26 = 0;
        v20 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v19 fromData:v13 error:&v26];
        id v21 = v26;

        if (v21 || !v13)
        {
          v22 = _AKLogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_100181FC8();
          }
        }
        id v23 = objc_alloc_init((Class)AKAppleIDSigningController);
        [v23 setIsProxy:1];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100044144;
        v24[3] = &unk_100228318;
        id v25 = v6;
        [v23 signingHeadersForRequest:v20 completion:v24];

        break;
      default:
        id v15 = _AKLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100181F28((uint64_t)v7, v15);
        }

        uint64_t v16 = AKAnisetteErrorDomain;
        uint64_t v17 = -8015;
LABEL_19:
        id v13 = +[NSError errorWithDomain:v16 code:v17 userInfo:0];
        (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v13);
        break;
    }
  }
  else
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100181EF4();
    }

    BOOL v10 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8016 userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v10);
  }
}

- (void)_mhq_handleIncomingReplyMessage:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100182134();
  }

  id v6 = [v4 replyToID];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_completionsByInternalMessageID objectForKeyedSubscript:v6];
    if (v7)
    {
      uint64_t v18 = v4;
      [(NSMutableDictionary *)self->_completionsByInternalMessageID removeObjectForKey:v6];
      id v8 = [(NSMutableDictionary *)self->_internalMessageIDsByTransportID copy];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v24;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            id v15 = [v9 objectForKeyedSubscript:v14];
            unsigned int v16 = [v15 isEqual:v6];

            if (v16)
            {
              [(NSMutableDictionary *)self->_internalMessageIDsByTransportID removeObjectForKey:v14];
              goto LABEL_17;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      uint64_t v17 = dispatch_get_global_queue(21, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000444DC;
      block[3] = &unk_100228340;
      id v20 = v6;
      v22 = v7;
      id v4 = v18;
      id v21 = v18;
      dispatch_async(v17, block);
    }
    else
    {
      id v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1001820CC();
      }
    }
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100182098();
    }
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6 = (void (**)(void))a5;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100182220();
  }

  completionsByInternalMessageID = self->_completionsByInternalMessageID;
  if (completionsByInternalMessageID)
  {
    id v21 = self;
    v22 = v6;
    id v9 = [(NSMutableDictionary *)completionsByInternalMessageID allValues];
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
      *(_DWORD *)buf = 138412290;
      id v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Paired device changed while %@ remote commands were pending.", buf, 0xCu);
    }
    uint64_t v12 = +[NSError errorWithDomain:AKAnisetteErrorDomain code:-8018 userInfo:0];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v17);
          v19 = dispatch_get_global_queue(21, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10004485C;
          block[3] = &unk_1002279F0;
          uint64_t v25 = v18;
          id v24 = v12;
          dispatch_async(v19, block);

          uint64_t v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    [(NSMutableDictionary *)v21->_completionsByInternalMessageID removeAllObjects];
    [(NSMutableDictionary *)v21->_internalMessageIDsByTransportID removeAllObjects];

    id v6 = v22;
  }
  id v20 = _AKLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Acknowledged!", buf, 2u);
  }

  v6[2](v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalMessageIDsByTransportID, 0);
  objc_storeStrong((id *)&self->_completionsByInternalMessageID, 0);
  objc_storeStrong((id *)&self->_messageHandlingQueue, 0);

  objc_storeStrong((id *)&self->_messageSendingService, 0);
}

@end