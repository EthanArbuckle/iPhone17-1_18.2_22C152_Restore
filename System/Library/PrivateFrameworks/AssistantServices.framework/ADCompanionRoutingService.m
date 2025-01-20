@interface ADCompanionRoutingService
- (ADCompanionRoutingService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)_callStateDidChange:(id)a3;
- (void)_handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)_processPendingCallResultBlocks;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)preheatDomain:(id)a3;
@end

@implementation ADCompanionRoutingService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCallResultBlocks, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_processPendingCallResultBlocks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(NSMutableArray *)self->_pendingCallResultBlocks count];
  if (v3)
  {
    id v4 = v3;
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADCompanionRoutingService _processPendingCallResultBlocks]";
      __int16 v19 = 2048;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Processing %ld pending Call result(s)", buf, 0x16u);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = self->_pendingCallResultBlocks;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    pendingCallResultBlocks = self->_pendingCallResultBlocks;
    self->_pendingCallResultBlocks = 0;
  }
}

- (void)_callStateDidChange:(id)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089A28;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)preheatDomain:(id)a3
{
  id v3 = a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = "-[ADCompanionRoutingService preheatDomain:]";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s preheating companion service domain: %@", (uint8_t *)&v16, 0x16u);
  }
  if (qword_1005858A8 == -1)
  {
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_once(&qword_1005858A8, &stru_1005001F0);
    if (!v3) {
      goto LABEL_10;
    }
  }
  uint64_t v5 = [(id)qword_1005858A0 objectForKeyedSubscript:v3];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = objc_alloc_init((Class)SAAceDomainSignal);
    id v8 = +[NSUUID UUID];
    uint64_t v9 = [v8 UUIDString];

    [v7 setAceId:v9];
    [v7 setDomain:v6];
    v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      long long v12 = [v7 encodedClassName];
      long long v13 = [v7 groupIdentifier];
      int v16 = 136315650;
      v17 = "-[ADCompanionRoutingService preheatDomain:]";
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Dispatching command (%@) for domain (%@)", (uint8_t *)&v16, 0x20u);
    }
    long long v14 = +[ADCommandCenter sharedCommandCenter];
    objc_msgSend(v14, "_remoteExecute_remoteDeviceExecuteCommand:executionContext:completion:", v7, 0, &stru_100500210);

    goto LABEL_12;
  }
LABEL_10:
  long long v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = "-[ADCompanionRoutingService preheatDomain:]";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s unsupported preheat domain: %@", (uint8_t *)&v16, 0x16u);
  }
LABEL_12:
}

- (void)_handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    long long v15 = v14;
    int v16 = [v10 encodedClassName];
    v17 = [v10 groupIdentifier];
    *(_DWORD *)buf = 136315650;
    v31 = "-[ADCompanionRoutingService _handleCommand:forDomain:executionContext:reply:]";
    __int16 v32 = 2112;
    v33 = v16;
    __int16 v34 = 2112;
    v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Dispatching command (%@) for domain (%@)", buf, 0x20u);
  }
  __int16 v18 = [v10 encodedClassName];
  unsigned int v19 = [v18 isEqualToString:SAPhoneCallClassIdentifier];
  char v20 = v19;
  if (!v19)
  {
    if ([v18 isEqualToString:SAUILParseExpressionsClassIdentifier])
    {
      v25 = [v10 targetDevice];
      id v24 = [v25 assistantId];

LABEL_10:
      v26 = +[ADCommandCenter sharedCommandCenter];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10008A21C;
      v27[3] = &unk_1005001D0;
      v27[4] = self;
      id v28 = v13;
      char v29 = v20;
      objc_msgSend(v26, "_remoteExecute_remoteDeviceExecuteCommand:onDeviceForAssistantId:executionContext:completion:", v10, v24, v12, v27);

      goto LABEL_11;
    }
LABEL_9:
    id v24 = 0;
    goto LABEL_10;
  }
  v21 = +[ADCommandCenter sharedCommandCenter];
  unsigned int v22 = [v21 _hasIncomingCall];

  if (!v22) {
    goto LABEL_9;
  }
  if (v13)
  {
    id v23 = objc_alloc((Class)SACommandFailed);
    id v24 = [v23 initWithErrorCode:SAPhoneCompanionHasIncomingCallErrorCode];
    (*((void (**)(id, id, void))v13 + 2))(v13, v24, 0);
LABEL_11:
  }
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A7D0;
  block[3] = &unk_10050D3F0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(serialQueue, block);
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (id)commandsForDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SASmsGroupIdentifier])
  {
    v16[0] = SASmsSearchClassIdentifier;
    v16[1] = SADomainObjectCancelClassIdentifier;
    v16[2] = SADomainObjectCommitClassIdentifier;
    v16[3] = SADomainObjectCreateClassIdentifier;
    v16[4] = SADomainObjectUpdateClassIdentifier;
    v16[5] = SASmsGroupSearchClassIdentifier;
    v16[6] = SASmsRecipientSearchClassIdentifier;
    v16[7] = SADomainObjectRetrieveClassIdentifier;
    id v4 = v16;
LABEL_7:
    uint64_t v5 = 8;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:SAABGroupIdentifier])
  {
    v15[0] = SADomainObjectCancelClassIdentifier;
    v15[1] = SADomainObjectCommitClassIdentifier;
    v15[2] = SADomainObjectUpdateClassIdentifier;
    v15[3] = SADomainObjectRetrieveClassIdentifier;
    v15[4] = SADomainObjectPunchOutClassIdentifier;
    v15[5] = SAABPersonSearchClassIdentifier;
    v15[6] = SAABMultiPersonSearchClassIdentifier;
    id v4 = v15;
    uint64_t v5 = 7;
LABEL_8:
    v6 = +[NSArray arrayWithObjects:v4 count:v5];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:SAReminderGroupIdentifier])
  {
    v14[0] = SAReminderSearchClassIdentifier;
    v14[1] = SAReminderSnoozeClassIdentifier;
    v14[2] = SAReminderListSearchClassIdentifier;
    v14[3] = SADomainObjectCommitClassIdentifier;
    v14[4] = SADomainObjectCreateClassIdentifier;
    v14[5] = SADomainObjectDeleteClassIdentifier;
    v14[6] = SADomainObjectUpdateClassIdentifier;
    v14[7] = SADomainObjectRetrieveClassIdentifier;
    id v4 = v14;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:SAUILGroupIdentifier])
  {
    uint64_t v13 = SAUILParseExpressionsClassIdentifier;
    id v4 = &v13;
LABEL_16:
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:SAGroupIdentifier])
  {
    uint64_t v12 = SAAcknowledgeAlertClassIdentifier;
    id v4 = &v12;
    goto LABEL_16;
  }
  if ([v3 isEqualToString:SAPhoneGroupIdentifier])
  {
    v11[0] = SAPhoneCallClassIdentifier;
    v11[1] = SAPhoneSearchClassIdentifier;
    id v4 = v11;
LABEL_19:
    uint64_t v5 = 2;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:SACalendarGroupIdentifier])
  {
    v10[0] = SADomainObjectDeleteClassIdentifier;
    v10[1] = SADomainObjectCommitClassIdentifier;
    v10[2] = SADomainObjectRetrieveClassIdentifier;
    v10[3] = SACalendarEventSearchClassIdentifier;
    v10[4] = SACalendarDefaultSourceGetClassIdentifier;
    id v4 = v10;
    uint64_t v5 = 5;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:SAEmailGroupIdentifier])
  {
    v9[0] = SADomainObjectCreateClassIdentifier;
    v9[1] = SADomainObjectCommitClassIdentifier;
    v9[2] = SADomainObjectRetrieveClassIdentifier;
    v9[3] = SAEmailSearchClassIdentifier;
    id v4 = v9;
    uint64_t v5 = 4;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:SAStockGroupIdentifier])
  {
    v8[0] = SAStockAddClassIdentifier;
    v8[1] = SAStockSearchClassIdentifier;
    id v4 = v8;
    goto LABEL_19;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)domains
{
  v4[0] = SASmsGroupIdentifier;
  v4[1] = SAABGroupIdentifier;
  v4[2] = SAReminderGroupIdentifier;
  v4[3] = SAUILGroupIdentifier;
  v4[4] = SAGroupIdentifier;
  v4[5] = SAPhoneGroupIdentifier;
  v4[6] = SACalendarGroupIdentifier;
  v4[7] = SAEmailGroupIdentifier;
  v4[8] = SAStockGroupIdentifier;
  v2 = +[NSArray arrayWithObjects:v4 count:9];
  return v2;
}

- (ADCompanionRoutingService)init
{
  v10.receiver = self;
  v10.super_class = (Class)ADCompanionRoutingService;
  v2 = [(ADCompanionRoutingService *)&v10 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Companion Routing Service Queue", v3);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    [(ADService *)v2 setIdentifier:v7];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_callStateDidChange:" name:@"ADCallStateDidChangeNotification" object:0];
  }
  return v2;
}

@end