@interface PDASMSyncOperation
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)processResponseZone:(id)a3;
- (BOOL)wantsToExecute;
- (Class)expectedResponseClass;
- (PDASMSyncOperation)initWithDatabase:(id)a3;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (void)abortWithError:(id)a3;
- (void)execute;
- (void)prepare;
- (void)rescheduleOperation;
@end

@implementation PDASMSyncOperation

- (id)logSubsystem
{
  return CLSLogASMSync;
}

- (id)endpointIdentifier
{
  return @"ee.sync";
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

- (PDASMSyncOperation)initWithDatabase:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDASMSyncOperation;
  result = [(PDASMPayloadOperation *)&v4 initWithDatabase:a3];
  if (result) {
    BYTE2(result->_initialSyncZoneNames) = 1;
  }
  return result;
}

- (void)prepare
{
  v20.receiver = self;
  v20.super_class = (Class)PDASMSyncOperation;
  [(PDAsyncOperation *)&v20 prepare];
  if (![(PDOperation *)self isFinished]
    && ![*(id *)((char *)&self->super._unresolvedMissingEntityIDs + 2) count])
  {
    v3 = [(PDOperation *)self database];
    objc_super v4 = objc_opt_new();
    v5 = objc_opt_new();
    uint64_t v6 = objc_opt_class();
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10012BBDC;
    v17 = &unk_1001F5C48;
    id v7 = v4;
    id v18 = v7;
    id v8 = v5;
    id v19 = v8;
    [v3 selectAll:v6 block:&v14];
    objc_storeStrong((id *)((char *)&self->super._unresolvedMissingEntityIDs + 2), v4);
    objc_storeStrong((id *)((char *)&self->_zoneNames + 2), v5);
    if (objc_msgSend(*(id *)((char *)&self->_zoneNames + 2), "count", v14, v15, v16, v17))
    {
      sub_10015FEC4(v3, 1, @"initialASMSyncRequired");
      CLSInitLog();
      v9 = [(PDASMSyncOperation *)self logSubsystem];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_opt_class();
        id v11 = v10;
        v12 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138543618;
        v22 = v10;
        __int16 v23 = 2114;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Initial ASM sync required.", buf, 0x16u);
      }
      v13 = +[NSDate now];
      sub_100160238(v3, v13, @"initialASMSyncStartDate");
    }
  }
}

- (void)execute
{
  if (![(PDASMSyncOperation *)self wantsToExecute]) {
    [(PDEndpointRequestOperation *)self markAsFinished];
  }
  v3.receiver = self;
  v3.super_class = (Class)PDASMSyncOperation;
  [(PDEndpointRequestOperation *)&v3 execute];
  BYTE2(self->_initialSyncZoneNames) = 0;
}

- (BOOL)wantsToExecute
{
  if (BYTE2(self->_initialSyncZoneNames))
  {
    objc_super v3 = [(PDOperation *)self database];
  }
  else
  {
    id v4 = [*(id *)((char *)&self->super._unresolvedMissingEntityIDs + 2) count];
    objc_super v3 = [(PDOperation *)self database];
    if (!v4)
    {
      BOOL v5 = 0;
      goto LABEL_8;
    }
  }
  if (!sub_100006970(v3, @"initialASMSyncRequired") || sub_100051044(v3) || sub_1000510B8(v3))
  {
    BOOL v5 = 1;
  }
  else
  {
    CLSInitLog();
    id v7 = [(PDASMSyncOperation *)self logSubsystem];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      v10 = [(PDURLRequestOperation *)self operationID];
      int v11 = BYTE2(self->_initialSyncZoneNames);
      int v12 = 138543874;
      v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      __int16 v16 = 1024;
      int v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Initial ASM sync in progress but deferring. firstRun: %d", (uint8_t *)&v12, 0x1Cu);
    }
    BOOL v5 = BYTE2(self->_initialSyncZoneNames) != 0;
  }
LABEL_8:

  return v5;
}

- (id)requestData
{
  v2 = self;
  if ([(PDOperation *)self isAborted])
  {
    objc_super v3 = 0;
    goto LABEL_25;
  }
  id v4 = [(PDEndpointRequestOperation *)v2 endpointInfo];
  if (v4)
  {
    uint64_t v5 = v4[8];

    if (v5 < 1)
    {
      uint64_t v6 = 1000;
      goto LABEL_9;
    }
    id v4 = [(PDEndpointRequestOperation *)v2 endpointInfo];
    if (v4) {
      uint64_t v6 = *((unsigned int *)v4 + 16);
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 1000;
  }

LABEL_9:
  id v7 = objc_alloc_init(PDDPEESyncRequest);
  id v8 = [(PDOperation *)v2 database];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = *(id *)((char *)&v2->super._unresolvedMissingEntityIDs + 2);
  v39 = v8;
  id v41 = [v9 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v41)
  {
    uint64_t v10 = *(void *)v43;
    v38 = v7;
    unsigned int v37 = v6;
    uint64_t v35 = *(void *)v43;
    id v36 = v9;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v9);
        }
        int v12 = [v8 select:objc_opt_class() identity:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        v13 = sub_100079384(v12);
        [v13 setLimit:v6];
        [(PDDPEESyncRequest *)v7 addRequestZones:v13];
        if ([v13 hasCursor])
        {
          CLSInitLog();
          __int16 v14 = [(PDASMSyncOperation *)v2 logSubsystem];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = objc_opt_class();
            id v40 = v15;
            __int16 v16 = [(PDURLRequestOperation *)v2 operationID];
            int v17 = [v13 zoneName];
            [v13 cursor];
            v19 = id v18 = v2;
            objc_super v20 = [v19 base64EncodedStringWithOptions:0];
            *(_DWORD *)buf = 138544130;
            v47 = v15;
            uint64_t v6 = v37;
            __int16 v48 = 2114;
            v49 = v16;
            __int16 v50 = 2112;
            *(void *)v51 = v17;
            *(_WORD *)&v51[8] = 2112;
            v52 = v20;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ zoneName: %@ cursor: %@", buf, 0x2Au);

            v2 = v18;
            id v7 = v38;

            uint64_t v10 = v35;
            id v9 = v36;

            id v8 = v39;
          }
        }
      }
      id v41 = [v9 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v41);
  }

  [*(id *)((char *)&v2->super._unresolvedMissingEntityIDs + 2) removeAllObjects];
  CLSInitLog();
  v21 = [(PDASMSyncOperation *)v2 logSubsystem];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v24 = objc_opt_class();
    id v25 = v24;
    v26 = [(PDURLRequestOperation *)v2 operationID];
    BOOL v27 = sub_100006970(v8, @"initialASMSyncRequired");
    v28 = v2;
    BOOL v29 = sub_100006970(v39, @"initialASMSyncComplete");
    BOOL v30 = sub_100006970(v39, @"initialOrionSyncComplete");
    *(_DWORD *)buf = 138544386;
    v47 = v24;
    __int16 v48 = 2114;
    v49 = v26;
    __int16 v50 = 1024;
    *(_DWORD *)v51 = v27;
    id v8 = v39;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = v29;
    v2 = v28;
    LOWORD(v52) = 1024;
    *(_DWORD *)((char *)&v52 + 2) = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Sync request: initialASMSyncRequired:%d initialASMSyncComplete:%d initialOrionSyncComplete:%d", buf, 0x28u);
  }
  CLSInitLog();
  v22 = [(PDASMSyncOperation *)v2 logSubsystem];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v31 = objc_opt_class();
    id v32 = v31;
    v33 = [(PDURLRequestOperation *)v2 operationID];
    v34 = [(PDDPEESyncRequest *)v7 dictionaryRepresentation];
    *(_DWORD *)buf = 138543874;
    v47 = v31;
    __int16 v48 = 2114;
    v49 = v33;
    __int16 v50 = 2114;
    *(void *)v51 = v34;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Sync request: %{public}@", buf, 0x20u);

    id v8 = v39;
  }

  objc_super v3 = [(PDDPEESyncRequest *)v7 data];

LABEL_25:

  return v3;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  v28.receiver = self;
  v28.super_class = (Class)PDASMSyncOperation;
  BOOL v5 = [(PDASMPayloadOperation *)&v28 processResponseObject:a3 error:a4];
  uint64_t v6 = [(PDOperation *)self database];
  id v7 = v6;
  if (v5)
  {
    if (!sub_100051044(v6))
    {
      uint64_t v8 = sub_100004EE8(v7, @"initialASMSyncRoundTripCount");
      sub_10015FF5C(v7, v8 + 1, @"initialASMSyncRoundTripCount");
      if (![*(id *)((char *)&self->super._unresolvedMissingEntityIDs + 2) count])
      {
        sub_10015FEC4(v7, 0, @"initialASMSyncRequired");
        sub_10015FEC4(v7, 1, @"initialASMSyncComplete");
        id v9 = +[NSDate date];
        sub_100160238(v7, v9, CLSSyncInitialRosterSyncDateKey);

        uint64_t v10 = +[NSNotificationCenter defaultCenter];
        [v10 postNotificationName:CLSInitialServerSyncCompleteNotificationName object:0 userInfo:0];

        CLSInitLog();
        int v11 = [(PDASMSyncOperation *)self logSubsystem];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = objc_opt_class();
          id v13 = v12;
          __int16 v14 = [(PDURLRequestOperation *)self operationID];
          *(_DWORD *)buf = 138543618;
          BOOL v30 = v12;
          __int16 v31 = 2114;
          id v32 = v14;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Sync Initial ASM sync complete", buf, 0x16u);
        }
        uint64_t v15 = sub_1000A8424();
        __int16 v16 = sub_1000A8424();
        int v17 = +[NSDate now];
        id v18 = sub_1000A8C98(v16, v17, v7);
        sub_1000A9080(v15, v18, v7);
      }
    }
    if (![*(id *)((char *)&self->super._unresolvedMissingEntityIDs + 2) count])
    {
      id v19 = +[NSDate date];
      sub_100160238(v7, v19, CLSSyncLatestRosterSyncDateKey);
    }
  }
  CLSInitLog();
  objc_super v20 = [(PDASMSyncOperation *)self logSubsystem];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = objc_opt_class();
    id v23 = v22;
    v24 = [(PDURLRequestOperation *)self operationID];
    BOOL v25 = sub_100006970(v7, @"initialASMSyncRequired");
    BOOL v26 = sub_100006970(v7, @"initialASMSyncComplete");
    BOOL v27 = sub_100006970(v7, @"initialOrionSyncComplete");
    *(_DWORD *)buf = 138544386;
    BOOL v30 = v22;
    __int16 v31 = 2114;
    id v32 = v24;
    __int16 v33 = 1024;
    BOOL v34 = v25;
    __int16 v35 = 1024;
    BOOL v36 = v26;
    __int16 v37 = 1024;
    BOOL v38 = v27;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Sync response: initialASMSyncRequired:%d initialASMSyncComplete:%d initialOrionSyncComplete:%d", buf, 0x28u);
  }
  return v5;
}

- (BOOL)processResponseZone:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  uint64_t v6 = sub_100079454(v4);
  id v7 = [v4 status];
  unsigned int v8 = [v7 code];

  id v9 = [v4 status];
  unsigned int v10 = [v9 code];

  if ([v4 hasCursor])
  {
    CLSInitLog();
    int v11 = [(PDASMSyncOperation *)self logSubsystem];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = objc_opt_class();
      id v40 = v12;
      [(PDURLRequestOperation *)self operationID];
      v13 = id v41 = v6;
      __int16 v14 = [v4 zoneName];
      [v4 cursor];
      uint64_t v15 = v42 = v5;
      __int16 v16 = [v15 base64EncodedStringWithOptions:0];
      *(_DWORD *)buf = 138544130;
      long long v45 = v12;
      __int16 v46 = 2114;
      v47 = v13;
      __int16 v48 = 2112;
      v49 = v14;
      __int16 v50 = 2112;
      v51 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ zoneName: %@ cursor: %@", buf, 0x2Au);

      BOOL v5 = v42;
      uint64_t v6 = v41;
    }
  }
  if (v10 == 111)
  {
    CLSInitLog();
    int v17 = [(PDASMSyncOperation *)self logSubsystem];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v32 = objc_opt_class();
      id v33 = v32;
      BOOL v34 = [(PDURLRequestOperation *)self operationID];
      __int16 v35 = [v4 zoneName];
      *(_DWORD *)buf = 138543874;
      long long v45 = v32;
      __int16 v46 = 2114;
      v47 = v34;
      __int16 v48 = 2112;
      v49 = v35;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ zone access denied: %@", buf, 0x20u);
    }
    if (v6) {
      id v18 = (void *)v6[1];
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;
    v43.receiver = self;
    v43.super_class = (Class)PDASMSyncOperation;
    unsigned int v20 = [(PDASMPayloadOperation *)&v43 handleZoneRemoved:v19];

    if (v20)
    {
      v21 = *(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2);
      v22 = [v4 zoneName];
      [v21 removeObject:v22];

      id v23 = *(NSMutableArray **)((char *)&self->_zoneNames + 2);
      v24 = [v4 zoneName];
      [v23 removeObject:v24];

      unsigned __int8 v25 = 1;
    }
    else
    {
      unsigned __int8 v25 = 0;
    }
  }
  else
  {
    if (v8 == 4)
    {
      CLSInitLog();
      BOOL v26 = [(PDASMSyncOperation *)self logSubsystem];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        BOOL v36 = objc_opt_class();
        id v37 = v36;
        BOOL v38 = [(PDURLRequestOperation *)self operationID];
        v39 = [v4 zoneName];
        *(_DWORD *)buf = 138543874;
        long long v45 = v36;
        __int16 v46 = 2114;
        v47 = v38;
        __int16 v48 = 2112;
        v49 = v39;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ zone: %@ has more data", buf, 0x20u);
      }
      BOOL v27 = *(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2);
      if (v6) {
        objc_super v28 = (void *)v6[1];
      }
      else {
        objc_super v28 = 0;
      }
      id v29 = v28;
      [v27 addObject:v29];
    }
    else
    {
      BOOL v30 = *(NSMutableArray **)((char *)&self->_zoneNames + 2);
      id v29 = [v4 zoneName];
      [v30 removeObject:v29];
    }

    unsigned __int8 v25 = [v5 insertOrUpdateObject:v6];
  }

  return v25;
}

- (void)rescheduleOperation
{
  objc_super v3 = [(PDOperation *)self manager];
  sub_100003784(v3, 0);

  v4.receiver = self;
  v4.super_class = (Class)PDASMSyncOperation;
  [(PDURLRequestOperation *)&v4 rescheduleOperation];
}

- (void)abortWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDOperation *)self database];
  uint64_t v6 = +[NSDate date];
  sub_100160238(v5, v6, CLSSyncLatestRosterSyncFailureDateKey);

  v7.receiver = self;
  v7.super_class = (Class)PDASMSyncOperation;
  [(PDURLRequestOperation *)&v7 abortWithError:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_zoneNames + 2), 0);

  objc_storeStrong((id *)((char *)&self->super._unresolvedMissingEntityIDs + 2), 0);
}

@end