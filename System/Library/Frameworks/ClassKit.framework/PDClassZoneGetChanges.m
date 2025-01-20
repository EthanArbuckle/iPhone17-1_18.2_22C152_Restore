@interface PDClassZoneGetChanges
+ (id)defaultEndpointInfo;
+ (id)syncZonesBindings;
+ (id)syncZonesMatchingSQL;
- (BOOL)_needsFullSync;
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)handleZoneRemoved:(id)a3 forClassWithObjectID:(id)a4;
- (BOOL)processAttachment:(id)a3;
- (BOOL)processAttachmentPayload:(id)a3;
- (BOOL)processClassZonePayload:(id)a3;
- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)stopProcessingIfResponseStatusPayloadFailed;
- (BOOL)wantsToExecute;
- (Class)expectedResponseClass;
- (PDClassZoneGetChanges)initWithDatabase:(id)a3;
- (id)acceptContentType;
- (id)attachmentsNeedingUpdate;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (int64_t)streamablePayloadClassTagValue;
- (void)abortWithError:(id)a3;
- (void)execute;
- (void)prepare;
- (void)processUpdatedTimeExpectation:(id)a3 newExpectation:(double)a4;
- (void)rescheduleOperation;
- (void)updateAttachmentCollabStatesIfNeeded;
@end

@implementation PDClassZoneGetChanges

+ (id)defaultEndpointInfo
{
  v2 = objc_alloc_init(PDEndpointInfo);
  sub_10007C770((uint64_t)v2, @"orion");
  sub_1000435F8((uint64_t)v2, @"getChanges");
  sub_100043608((uint64_t)v2, @"https://cls-iosclient.itunes.apple.com/v5/getchanges");
  if (v2)
  {
    v2->_payloadLimitItems = 0;
    v2->_payloadLimitBytes = 0;
    v2->_responseTTLSeconds = 0;
    *(_WORD *)&v2->_requiresAuth = 257;
  }
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 - 9) < 0xFFFFFFFD;
}

+ (id)syncZonesMatchingSQL
{
  return @"zoneName like ?";
}

+ (id)syncZonesBindings
{
  return &off_10020B230;
}

- (PDClassZoneGetChanges)initWithDatabase:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDClassZoneGetChanges;
  v3 = [(PDURLRequestOperation *)&v8 initWithDatabase:a3];
  v4 = v3;
  if (v3)
  {
    *(&v3->super._responseStatusPayloadFailed + 3) = 1;
    uint64_t v5 = objc_opt_new();
    v6 = *(NSMutableArray **)((char *)&v4->_zoneIDs + 3);
    *(NSMutableArray **)((char *)&v4->_zoneIDs + 3) = (NSMutableArray *)v5;
  }
  return v4;
}

- (id)logSubsystem
{
  return CLSLogHandout;
}

- (id)endpointIdentifier
{
  return @"getChanges";
}

- (id)requestContentType
{
  return @"application/x-protobuf";
}

- (id)acceptContentType
{
  return @"application/x-protobuf";
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)streamablePayloadClassTagValue
{
  return 2;
}

- (void)prepare
{
  v14.receiver = self;
  v14.super_class = (Class)PDClassZoneGetChanges;
  [(PDAsyncOperation *)&v14 prepare];
  if (![(PDOperation *)self isFinished])
  {
    v3 = [(PDOperation *)self database];
    if (![*(id *)((char *)&self->super.super._responseStatusError + 3) count])
    {
      v4 = objc_opt_new();
      uint64_t v5 = objc_opt_class();
      v6 = +[PDClassZoneGetChanges syncZonesMatchingSQL];
      v7 = +[PDClassZoneGetChanges syncZonesBindings];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000F0534;
      v12[3] = &unk_1001F4C38;
      objc_super v8 = v4;
      v13 = v8;
      [v3 selectAll:v5 where:v6 bindings:v7 block:v12];

      v9 = *(NSError **)((char *)&self->super.super._responseStatusError + 3);
      *(NSError **)((char *)&self->super.super._responseStatusError + 3) = v8;
      v10 = v8;
    }
    if ([(PDClassZoneGetChanges *)self _needsFullSync])
    {
      v11 = +[NSDate now];
      sub_100160238(v3, v11, @"initialOrionSyncStartDate");

      sub_10015FEC4(v3, 0, @"initialOrionSyncComplete");
    }
  }
}

- (BOOL)_needsFullSync
{
  if (![*(id *)((char *)&self->super.super._responseStatusError + 3) count]) {
    return 1;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v3 = objc_opt_new();
  v4 = [(PDOperation *)self database];
  uint64_t v5 = objc_opt_class();
  v6 = +[PDClassZoneGetChanges syncZonesMatchingSQL];
  v7 = +[PDClassZoneGetChanges syncZonesBindings];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F087C;
  v11[3] = &unk_1001F4C60;
  id v8 = v3;
  id v12 = v8;
  v13 = &v14;
  [v4 selectAll:v5 where:v6 bindings:v7 block:v11];

  BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)execute
{
  v3.receiver = self;
  v3.super_class = (Class)PDClassZoneGetChanges;
  [(PDEndpointRequestOperation *)&v3 execute];
  *(&self->super._responseStatusPayloadFailed + 3) = 0;
}

- (BOOL)wantsToExecute
{
  return *(&self->super._responseStatusPayloadFailed + 3)
      || [*(id *)((char *)&self->super.super._responseStatusError + 3) count] != 0;
}

- (id)requestData
{
  v2 = self;
  if ([(PDOperation *)self isAborted])
  {
    objc_super v3 = 0;
  }
  else
  {
    v4 = [(PDOperation *)v2 database];
    uint64_t v5 = objc_alloc_init(PDDPGetChangesRequest);
    v6 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = *(id *)((char *)&v2->super.super._responseStatusError + 3);
    v41 = v5;
    v42 = v4;
    v43 = v6;
    id v47 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v49;
LABEL_5:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v48 + 1) + 8 * v7);
        id v9 = [v6 count];
        v10 = [(PDEndpointRequestOperation *)v2 endpointInfo];
        if (!v10) {
          break;
        }
        unint64_t v11 = v10[8];

        if ((unint64_t)v9 >= v11) {
          break;
        }
        uint64_t v12 = objc_opt_class();
        v13 = [v8 zoneName];
        uint64_t v14 = [v4 select:v12 identity:v13];

        v15 = [v8 zoneName];
        uint64_t v16 = sub_10001F378(v14, v15);

        [(PDDPGetChangesRequest *)v5 addZones:v16];
        [v6 addObject:v8];
        if ([v16 hasChangeToken])
        {
          CLSInitLog();
          char v17 = [(PDClassZoneGetChanges *)v2 logSubsystem];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = objc_opt_class();
            id v44 = v18;
            v19 = [(PDURLRequestOperation *)v2 operationID];
            v20 = [v16 zoneName];
            [v16 changeToken];
            v22 = v21 = v2;
            v23 = [v22 base64EncodedStringWithOptions:0];
            *(_DWORD *)buf = 138544130;
            v53 = v18;
            __int16 v54 = 2114;
            v55 = v19;
            __int16 v56 = 2112;
            *(void *)v57 = v20;
            *(_WORD *)&v57[8] = 2112;
            v58 = v23;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ zoneName: %@ changeToken: %@", buf, 0x2Au);

            v2 = v21;
            v6 = v43;

            uint64_t v5 = v41;
            v4 = v42;
          }
        }

        if (v47 == (id)++v7)
        {
          id v47 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
          if (v47) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    [*(id *)((char *)&v2->super.super._responseStatusError + 3) removeObjectsInArray:v6];
    CLSInitLog();
    v24 = [(PDClassZoneGetChanges *)v2 logSubsystem];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v29 = objc_opt_class();
      id v30 = v29;
      [(PDURLRequestOperation *)v2 operationID];
      v32 = v31 = v2;
      v33 = [(PDDPGetChangesRequest *)v5 dictionaryRepresentation];
      *(_DWORD *)buf = 138543874;
      v53 = v29;
      __int16 v54 = 2114;
      v55 = v32;
      __int16 v56 = 2112;
      *(void *)v57 = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Request payload: %@", buf, 0x20u);

      uint64_t v5 = v41;
      v2 = v31;

      v4 = v42;
    }

    CLSInitLog();
    v25 = [(PDClassZoneGetChanges *)v2 logSubsystem];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v34 = objc_opt_class();
      id v35 = v34;
      v36 = [(PDURLRequestOperation *)v2 operationID];
      BOOL v37 = sub_100006970(v4, @"initialASMSyncRequired");
      v38 = v2;
      BOOL v39 = sub_100006970(v42, @"initialASMSyncComplete");
      BOOL v40 = sub_100006970(v42, @"initialOrionSyncComplete");
      *(_DWORD *)buf = 138544386;
      v53 = v34;
      __int16 v54 = 2114;
      v55 = v36;
      __int16 v56 = 1024;
      *(_DWORD *)v57 = v37;
      v4 = v42;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v39;
      v2 = v38;
      LOWORD(v58) = 1024;
      *(_DWORD *)((char *)&v58 + 2) = v40;
      _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ GetChanges: initialASMSyncRequired:%d initialASMSyncComplete:%d initialOrionSyncComplete:%d", buf, 0x28u);

      uint64_t v5 = v41;
    }

    id v26 = [v43 count];
    v27 = [(PDURLRequestOperation *)v2 stats];
    if (v27) {
      v27[14] = v26;
    }

    objc_super v3 = [(PDDPGetChangesRequest *)v5 data];
  }

  return v3;
}

- (BOOL)stopProcessingIfResponseStatusPayloadFailed
{
  return 0;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  v21.receiver = self;
  v21.super_class = (Class)PDClassZoneGetChanges;
  BOOL v5 = [(PDAbstractClassZoneOperation *)&v21 processResponseObject:a3 error:a4];
  v6 = [(PDOperation *)self database];
  uint64_t v7 = v6;
  if (v5)
  {
    if (!sub_1000510B8(v6))
    {
      uint64_t v8 = sub_100004EE8(v7, @"initialOrionSyncRoundTripCount");
      sub_10015FF5C(v7, v8 + 1, @"initialOrionSyncRoundTripCount");
      if (![*(id *)((char *)&self->super.super._responseStatusError + 3) count])
      {
        sub_10015FEC4(v7, 1, @"initialOrionSyncComplete");
        id v9 = +[NSDate date];
        sub_100160238(v7, v9, CLSSyncInitialHandoutSyncDateKey);

        CLSInitLog();
        v10 = [(PDClassZoneGetChanges *)self logSubsystem];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v11 = objc_opt_class();
          id v12 = v11;
          v13 = [(PDURLRequestOperation *)self operationID];
          *(_DWORD *)buf = 138543618;
          v23 = v11;
          __int16 v24 = 2114;
          v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Initial Schoolwork sync complete", buf, 0x16u);
        }
        uint64_t v14 = +[NSNotificationCenter defaultCenter];
        [v14 postNotificationName:CLSInitialServerSyncCompleteNotificationName object:0 userInfo:0];

        v15 = sub_1000A8424();
        uint64_t v16 = sub_1000A8424();
        char v17 = +[NSDate now];
        v18 = sub_1000A8EBC(v16, v17, v7);
        sub_1000A9080(v15, v18, v7);
      }
    }
    if (![*(id *)((char *)&self->super.super._responseStatusError + 3) count])
    {
      v19 = +[NSDate date];
      sub_100160238(v7, v19, CLSSyncLatestHandoutSyncDateKey);
    }
  }
  [(PDClassZoneGetChanges *)self updateAttachmentCollabStatesIfNeeded];

  return v5;
}

- (void)updateAttachmentCollabStatesIfNeeded
{
  objc_super v3 = [(PDOperation *)self database];
  v27 = self;
  if ([*(id *)((char *)&self->_zoneIDs + 3) count])
  {
    id v26 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = *(id *)((char *)&self->_zoneIDs + 3);
    id v30 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v35;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(obj);
          }
          BOOL v5 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v6 = v5;
          uint64_t v7 = objc_opt_new();
          uint64_t v8 = v6;
          id v9 = [v3 select:objc_opt_class() identity:v6];
          uint64_t v10 = objc_opt_class();
          unint64_t v11 = [v9 parentObjectID];
          id v12 = [v3 select:v10 identity:v11];

          if (v12) {
            BOOL v13 = v9 == 0;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13)
          {
            uint64_t v14 = objc_opt_class();
            v38 = v8;
            v15 = +[NSArray arrayWithObjects:&v38 count:1];
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_1000F1520;
            v32[3] = &unk_1001F3BB0;
            id v16 = v7;
            id v33 = v16;
            [v3 selectAll:v14 where:@"parentObjectID = ?" bindings:v15 block:v32];

            char v17 = sub_100003E58(v3);
            v18 = [v17 objectID];

            v19 = [*(id *)((char *)&v27->_zoneIDs + 3) objectForKey:v8];
            v20 = v3;
            id v21 = [v19 integerValue];

            id v22 = v21;
            objc_super v3 = v20;
            v23 = +[PDSchoolworkCollaborationStateAdaptor setActivityState:v22 forAttachment:v9 forHandout:v12 senderPersonID:v18 withStates:v16];
            [v26 addObject:v23];
          }
        }
        id v30 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v30);
    }

    __int16 v24 = sub_10014FEB4([PDCollaborationStateChangePublish alloc], (uint64_t)v3, v26);
    v25 = [(PDOperation *)v27 manager];
    sub_100111240(v25, v24);
  }
}

- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDOperation *)self isAborted])
  {
    BOOL v7 = 0;
  }
  else
  {
    if ([v6 type] == 12 || objc_msgSend(v6, "type") == 3)
    {
      [(PDAbstractClassZoneOperation *)self logPayloadBeforeProcessing:v6];
      if ([v6 type] == 3)
      {
        unsigned __int8 v8 = [(PDClassZoneGetChanges *)self processAttachmentPayload:v6];
      }
      else
      {
        if ([v6 hasClassZone])
        {
          id v9 = [v6 classZone];
          unsigned int v10 = [v9 hasChangeToken];

          if (v10)
          {
            CLSInitLog();
            unint64_t v11 = [(PDClassZoneGetChanges *)self logSubsystem];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              id v12 = objc_opt_class();
              id v20 = v12;
              BOOL v13 = [(PDURLRequestOperation *)self operationID];
              uint64_t v14 = [v6 classZone];
              v15 = [v14 zoneName];
              id v16 = [v6 classZone];
              char v17 = [v16 changeToken];
              v18 = [v17 base64EncodedStringWithOptions:0];
              *(_DWORD *)buf = 138544130;
              v23 = v12;
              __int16 v24 = 2114;
              v25 = v13;
              __int16 v26 = 2112;
              v27 = v15;
              __int16 v28 = 2112;
              uint64_t v29 = v18;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ zoneName: %@ changeToken: %@", buf, 0x2Au);
            }
          }
        }
        unsigned __int8 v8 = [(PDClassZoneGetChanges *)self processClassZonePayload:v6];
      }
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)PDClassZoneGetChanges;
      unsigned __int8 v8 = [(PDAbstractClassZoneOperation *)&v21 processPayloadFromResponse:v6 error:a4];
    }
    BOOL v7 = v8;
  }

  return v7;
}

- (BOOL)processAttachmentPayload:(id)a3
{
  id v4 = a3;
  if ([v4 action] == 3)
  {
    id v8 = 0;
    BOOL v5 = [(PDAbstractClassZoneOperation *)self _deleteWithPayload:v4 error:&v8];
  }
  else
  {
    id v6 = [v4 attachment];

    BOOL v5 = [(PDClassZoneGetChanges *)self processAttachment:v6];
  }
  return v5;
}

- (BOOL)processAttachment:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  id v6 = sub_1000200A0(v4);
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [v4 objectId];
    id v9 = [v5 select:v7 identity:v8];

    if (v9)
    {
      objc_msgSend(v6, "setCompletionStatus:", objc_msgSend(v9, "completionStatus"));
      if (v5) {
        unint64_t v10 = ((unint64_t)sub_100004B84(v5) >> 1) & 1;
      }
      else {
        LOBYTE(v10) = 0;
      }
      [v9 timeExpectation];
      double v12 = v11;
      [v6 timeExpectation];
      if (v12 != v13 && (v10 & 1) == 0)
      {
        [v6 timeExpectation];
        -[PDClassZoneGetChanges processUpdatedTimeExpectation:newExpectation:](self, "processUpdatedTimeExpectation:newExpectation:", v9);
      }
    }
    if ([v5 insertOrUpdateObject:v6])
    {
      uint64_t v14 = objc_opt_class();
      v15 = [v6 objectID];
      __int16 v28 = v15;
      id v16 = +[NSArray arrayWithObjects:&v28 count:1];
      unsigned __int8 v17 = [v5 deleteAll:v14 where:@"entityID = ?" bindings:v16];
    }
    else
    {
      CLSInitLog();
      v15 = [(PDClassZoneGetChanges *)self logSubsystem];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_opt_class();
        id v19 = v18;
        id v20 = [(PDURLRequestOperation *)self operationID];
        int v22 = 138543874;
        v23 = v18;
        __int16 v24 = 2114;
        v25 = v20;
        __int16 v26 = 2114;
        v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to insert %{public}@.", (uint8_t *)&v22, 0x20u);
      }
      unsigned __int8 v17 = 0;
    }
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (void)processUpdatedTimeExpectation:(id)a3 newExpectation:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(PDOperation *)self database];
  id v8 = [v6 objectID];
  id v15 = 0;
  unsigned __int8 v9 = sub_100156F98(v7, v6, &v15);
  id v10 = v15;
  if (v10 && (CLSInitLog(), double v11 = (void *)CLSLogDefault, os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR)))
  {
    double v13 = v11;
    uint64_t v14 = [v10 description];
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v17 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to determine activity state due to missing collaboration states: %@.", buf, 0xCu);

    if (v9) {
      goto LABEL_7;
    }
  }
  else if (v9)
  {
    goto LABEL_7;
  }
  if (sub_10007D18C(v7, v8, 0) < a4 && sub_100156E14(v7, v6))
  {
    double v12 = +[NSNumber numberWithInteger:1];
    [*(id *)((char *)&self->_zoneIDs + 3) setObject:v12 forKeyedSubscript:v8];
  }
LABEL_7:
}

- (BOOL)processClassZonePayload:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 classZone];
  id v6 = [(__CFString *)v5 zoneName];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    id v8 = objc_alloc((Class)CKRecordZoneID);
    unsigned __int8 v9 = [(__CFString *)v5 zoneName];
    id v10 = [v8 initWithZoneName:v9 ownerName:CKCurrentUserDefaultName];

    double v11 = [(__CFString *)v5 zoneName];
    sub_100075F50((uint64_t)v7, v11);

    if ([(__CFString *)v5 hasChangeToken])
    {
      id v12 = objc_alloc((Class)CKServerChangeToken);
      double v13 = [(__CFString *)v5 changeToken];
      id v14 = [v12 initWithData:v13];

      sub_100075F30((uint64_t)v7, v14);
    }
    if ([v4 action] == 3
      || [(__CFString *)v5 isAccessDenied])
    {
      CLSInitLog();
      id v15 = [(PDClassZoneGetChanges *)self logSubsystem];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = objc_opt_class();
        id v38 = v16;
        unsigned __int8 v17 = [(PDURLRequestOperation *)self operationID];
        id v18 = v10;
        if ([(__CFString *)v5 isAccessDenied]) {
          CFStringRef v19 = @"zone access denied";
        }
        else {
          CFStringRef v19 = @"zone deleted";
        }
        id v20 = [(__CFString *)v5 zoneName];
        *(_DWORD *)buf = 138544130;
        BOOL v40 = v16;
        __int16 v41 = 2114;
        v42 = v17;
        __int16 v43 = 2112;
        CFStringRef v44 = v19;
        id v10 = v18;
        __int16 v45 = 2112;
        uint64_t v46 = v20;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ %@: %@", buf, 0x2Au);
      }
      objc_super v21 = [(__CFString *)v5 classId];

      if (!v21)
      {
        CLSInitLog();
        int v22 = [(PDClassZoneGetChanges *)self logSubsystem];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v30 = objc_opt_class();
          id v31 = v30;
          v32 = [(PDURLRequestOperation *)self operationID];
          id v33 = [(__CFString *)v5 zoneName];
          *(_DWORD *)buf = 138543874;
          BOOL v40 = v30;
          __int16 v41 = 2114;
          v42 = v32;
          __int16 v43 = 2112;
          CFStringRef v44 = v33;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ SWK server sent a payload with DELETE action but did not specify a classID, maybe progressd sent a user zone was sent in the request. Zone name: %@", buf, 0x20u);
        }
        BOOL v24 = 1;
        goto LABEL_25;
      }
      int v22 = [(__CFString *)v5 classId];
      unsigned __int8 v23 = [(PDClassZoneGetChanges *)self handleZoneRemoved:v10 forClassWithObjectID:v22];
    }
    else
    {
      if ([(__CFString *)v5 moreDataAvailable])
      {
        CLSInitLog();
        v25 = [(PDClassZoneGetChanges *)self logSubsystem];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          long long v34 = objc_opt_class();
          id v35 = v34;
          long long v36 = [(PDURLRequestOperation *)self operationID];
          long long v37 = [(__CFString *)v5 zoneName];
          *(_DWORD *)buf = 138543874;
          BOOL v40 = v34;
          __int16 v41 = 2114;
          v42 = v36;
          __int16 v43 = 2112;
          CFStringRef v44 = v37;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ zone: %@ has more data", buf, 0x20u);
        }
        [*(id *)((char *)&self->super.super._responseStatusError + 3) addObject:v10];
      }
      int v22 = [(PDOperation *)self database];
      unsigned __int8 v23 = [v22 insertOrUpdateObject:v7];
    }
    BOOL v24 = v23;
LABEL_25:

    goto LABEL_26;
  }
  CLSInitLog();
  uint64_t v7 = [(PDClassZoneGetChanges *)self logSubsystem];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v27 = objc_opt_class();
    id v28 = v27;
    uint64_t v29 = [(PDURLRequestOperation *)self operationID];
    *(_DWORD *)buf = 138543874;
    BOOL v40 = v27;
    __int16 v41 = 2114;
    v42 = v29;
    __int16 v43 = 2112;
    CFStringRef v44 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ illegal server response (missing zone name): %@", buf, 0x20u);
  }
  BOOL v24 = 0;
LABEL_26:

  return v24;
}

- (BOOL)handleZoneRemoved:(id)a3 forClassWithObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PDOperation *)self database];
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_1000F2340;
  objc_super v21 = &unk_1001F4CB0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v8;
  id v9 = v6;
  id v23 = v9;
  BOOL v24 = self;
  id v10 = v7;
  id v25 = v10;
  if (v8) {
    unsigned __int8 v11 = [v8 performTransaction:&v18 forWriting:1];
  }
  else {
    unsigned __int8 v11 = 0;
  }
  objc_msgSend(*(id *)((char *)&self->super.super._responseStatusError + 3), "removeObject:", v9, v18, v19, v20, v21);
  CLSInitLog();
  id v12 = [(PDClassZoneGetChanges *)self logSubsystem];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v14 = objc_opt_class();
    id v15 = v14;
    id v16 = [(PDURLRequestOperation *)self operationID];
    unsigned __int8 v17 = [v9 zoneName];
    *(_DWORD *)buf = 138543874;
    v27 = v14;
    __int16 v28 = 2114;
    uint64_t v29 = v16;
    __int16 v30 = 2112;
    id v31 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ removed from zoneIDs: zone %@", buf, 0x20u);
  }
  return v11;
}

- (void)rescheduleOperation
{
  objc_super v3 = [(PDOperation *)self manager];
  sub_100003784(v3, 0);

  v4.receiver = self;
  v4.super_class = (Class)PDClassZoneGetChanges;
  [(PDURLRequestOperation *)&v4 rescheduleOperation];
}

- (void)abortWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  id v6 = +[NSDate date];
  sub_100160238(v5, v6, CLSSyncLatestHandoutSyncFailureDateKey);

  v7.receiver = self;
  v7.super_class = (Class)PDClassZoneGetChanges;
  [(PDURLRequestOperation *)&v7 abortWithError:v4];
}

- (id)attachmentsNeedingUpdate
{
  return *(id *)((char *)&self->_zoneIDs + 3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_zoneIDs + 3), 0);

  objc_storeStrong((id *)((char *)&self->super.super._responseStatusError + 3), 0);
}

@end