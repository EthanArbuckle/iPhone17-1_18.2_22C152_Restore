@interface PDCollaborationStateChangePublish
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)allowMixedResponseStatusCode;
- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4;
- (BOOL)shouldProcessPayloadWithStatusCode:(int)a3;
- (BOOL)shouldSaveStateChangeWithStatusCode:(int)a3;
- (BOOL)stopProcessingIfResponseStatusPayloadFailed;
- (BOOL)wantsToExecute;
- (Class)expectedResponseClass;
- (id)acceptContentType;
- (id)assetsPayloadsForStateChange:(id)a3;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (int64_t)maxExecutionCount;
- (void)consolidateChangesByTargetAndOwner;
- (void)mergeExistingLocalStateIntoRequestStateChange:(id)a3;
@end

@implementation PDCollaborationStateChangePublish

- (id)logSubsystem
{
  return CLSLogHandout;
}

- (BOOL)allowMixedResponseStatusCode
{
  return 1;
}

- (BOOL)shouldSaveStateChangeWithStatusCode:(int)a3
{
  return (a3 - 112) < 2 || a3 == 1;
}

- (BOOL)shouldProcessPayloadWithStatusCode:(int)a3
{
  return [(PDCollaborationStateChangePublish *)self shouldSaveStateChangeWithStatusCode:*(void *)&a3];
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 0x14) & (0x88003u >> a3);
}

- (id)endpointIdentifier
{
  return @"publishStateChange";
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

- (BOOL)wantsToExecute
{
  return [*(id *)(&self->super._responseStatusPayloadFailed + 3) count] != 0;
}

- (int64_t)maxExecutionCount
{
  uint64_t v3 = [(PDEndpointRequestOperation *)self endpointInfo];
  if (!v3) {
    goto LABEL_13;
  }
  v4 = (void *)v3;
  v5 = [(PDEndpointRequestOperation *)self endpointInfo];
  if (!v5)
  {

    goto LABEL_13;
  }
  uint64_t v6 = v5[8];

  if (v6 < 1)
  {
LABEL_13:
    v14.receiver = self;
    v14.super_class = (Class)PDCollaborationStateChangePublish;
    return [(PDOperation *)&v14 maxExecutionCount];
  }
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super._responseStatusError + 3);
  v8 = [(PDEndpointRequestOperation *)self endpointInfo];
  if (v8) {
    uint64_t v9 = v8[8];
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v7 / v9;

  v15.receiver = self;
  v15.super_class = (Class)PDCollaborationStateChangePublish;
  id v11 = [(PDOperation *)&v15 maxExecutionCount];
  if (v10 + 1 > (uint64_t)v11) {
    int64_t v12 = v10 + 1;
  }
  else {
    int64_t v12 = (int64_t)v11;
  }
  if (v12 >= 67) {
    return 67;
  }
  else {
    return v12;
  }
}

- (void)mergeExistingLocalStateIntoRequestStateChange:(id)a3
{
  id v4 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [v4 states];
  id v5 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v51;
    v8 = CKRecordID_ptr;
    v39 = self;
    id v40 = v4;
    uint64_t v38 = *(void *)v51;
    do
    {
      uint64_t v9 = 0;
      id v41 = v6;
      do
      {
        if (*(void *)v51 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v9);
        id v11 = v8[33];
        int64_t v12 = objc_msgSend(v4, "targetObjectID", v38, v39, v40);
        v13 = [v4 ownerPersonID];
        uint64_t v14 = objc_msgSend(v11, "identifierForTargetObjectID:ownerPersonID:domain:", v12, v13, objc_msgSend(v10, "domain"));

        objc_super v15 = (void *)v14;
        v16 = [(PDOperation *)self database];
        v17 = [v16 select:objc_opt_class() identity:v15];

        if (v17)
        {
          objc_msgSend(v10, "setServerStatus:", objc_msgSend(v17, "serverStatus"));
          v18 = [v17 serverExecutionID];
          [v10 setServerExecutionID:v18];

          v19 = [v17 serverETag];
          [v10 setServerETag:v19];
        }
        v45 = v17;
        v20 = [v17 info];

        v21 = [v10 info];

        if (v21)
        {
          v22 = v45;
          if (!v20) {
            goto LABEL_28;
          }
          v43 = v15;
          v44 = v9;
          v23 = [v10 info];
          id v24 = [v23 mutableCopy];

          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          v25 = [v45 info];
          id v26 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v47;
            do
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v47 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                v31 = [v10 info];
                v32 = [v31 objectForKeyedSubscript:v30];

                if (v32)
                {
                  v33 = +[NSNull null];
                  unsigned int v34 = [v33 isEqual:v32];

                  if (v34) {
                    [v24 setObject:0 forKeyedSubscript:v30];
                  }
                }
                else
                {
                  v35 = [v45 info];
                  v36 = [v35 objectForKeyedSubscript:v30];
                  [v24 setObject:v36 forKeyedSubscript:v30];
                }
              }
              id v27 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
            }
            while (v27);
          }

          if ([v24 count]) {
            uint64_t v37 = (uint64_t)v24;
          }
          else {
            uint64_t v37 = 0;
          }
          self = v39;
          id v4 = v40;
          uint64_t v7 = v38;
          v8 = CKRecordID_ptr;
          id v6 = v41;
          objc_super v15 = v43;
          v22 = v45;
        }
        else
        {
          v22 = v45;
          if (!v20) {
            goto LABEL_28;
          }
          v44 = v9;
          uint64_t v37 = [v45 info];
          id v24 = (id)v37;
        }
        [v10 setInfo:v37];

        uint64_t v9 = v44;
LABEL_28:

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v9 != v6);
      id v6 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v6);
  }
}

- (id)assetsPayloadsForStateChange:(id)a3
{
  id v3 = a3;
  id v53 = (id)objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = [v3 states];
  id v48 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v66;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v66 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v4;
        id v5 = *(void **)(*((void *)&v65 + 1) + 8 * v4);
        id v6 = objc_opt_new();
        uint64_t v7 = objc_opt_new();
        v8 = [(PDOperation *)self database];
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = [v5 objectID];
        v71 = v10;
        id v11 = +[NSArray arrayWithObjects:&v71 count:1];
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_100150AC8;
        v62[3] = &unk_1001F6140;
        id v49 = v6;
        id v63 = v49;
        id v52 = v7;
        id v64 = v52;
        [v8 selectAll:v9 where:@"parentObjectID = ?" bindings:v11 block:v62];

        int64_t v12 = [v5 assetsToAddOrUpdate];
        id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v51 = v12;
        id v14 = [v51 countByEnumeratingWithState:&v58 objects:v70 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v59;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v59 != v16) {
                objc_enumerationMutation(v51);
              }
              v18 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              v19 = [v5 objectID];
              [v18 setParentObjectID:v19];

              [v18 setParentEntityType:6];
              v20 = [v18 objectID];
              [v13 addObject:v20];

              v21 = objc_alloc_init(PDDPPayload);
              [(PDDPPayload *)v21 setType:15];
              v22 = [v18 objectID];
              unsigned int v23 = [v52 containsObject:v22];

              if (v23) {
                uint64_t v24 = 2;
              }
              else {
                uint64_t v24 = 1;
              }
              [(PDDPPayload *)v21 setAction:v24];
              v25 = sub_100025010(v18);
              [(PDDPPayload *)v21 setAsset:v25];

              id v26 = objc_alloc((Class)NSMutableArray);
              id v27 = [v3 targetClassID];
              id v28 = objc_msgSend(v26, "initWithObjects:", v27, 0);
              v29 = [(PDDPPayload *)v21 asset];
              [v29 setClassIds:v28];

              [v53 addObject:v21];
            }
            id v15 = [v51 countByEnumeratingWithState:&v58 objects:v70 count:16];
          }
          while (v15);
        }

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v30 = v49;
        id v31 = [v30 countByEnumeratingWithState:&v54 objects:v69 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v55;
          do
          {
            for (j = 0; j != v32; j = (char *)j + 1)
            {
              if (*(void *)v55 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
              v36 = [v35 objectID];
              unsigned __int8 v37 = [v13 containsObject:v36];

              if ((v37 & 1) == 0)
              {
                uint64_t v38 = objc_alloc_init(PDDPPayload);
                [(PDDPPayload *)v38 setType:15];
                [(PDDPPayload *)v38 setAction:3];
                v39 = sub_100025010(v35);
                [(PDDPPayload *)v38 setAsset:v39];

                id v40 = objc_alloc((Class)NSMutableArray);
                id v41 = [v3 targetClassID];
                id v42 = objc_msgSend(v40, "initWithObjects:", v41, 0);
                v43 = [(PDDPPayload *)v38 asset];
                [v43 setClassIds:v42];

                [v53 addObject:v38];
              }
            }
            id v32 = [v30 countByEnumeratingWithState:&v54 objects:v69 count:16];
          }
          while (v32);
        }

        uint64_t v4 = v50 + 1;
      }
      while ((id)(v50 + 1) != v48);
      id v48 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v48);
  }

  return v53;
}

- (void)consolidateChangesByTargetAndOwner
{
  id v3 = objc_opt_new();
  v17 = self;
  v18 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(&self->super._responseStatusPayloadFailed + 3);
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v8 targetObjectID];
        uint64_t v10 = [v8 ownerPersonID];
        id v11 = [v8 recipientPersonID];
        int64_t v12 = +[NSString stringWithFormat:@"%@/%@/%@", v9, v10, v11];

        id v13 = [v3 objectForKeyedSubscript:v12];
        id v14 = v13;
        if (v13)
        {
          [v13 mergeChangesFrom:v8];
        }
        else
        {
          [v3 setObject:v8 forKeyedSubscript:v12];
          [v18 addObject:v8];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  uint64_t v15 = +[NSArray arrayWithArray:v18];
  uint64_t v16 = *(void **)(&v17->super._responseStatusPayloadFailed + 3);
  *(void *)(&v17->super._responseStatusPayloadFailed + 3) = v15;
}

- (id)requestData
{
  if ([(PDOperation *)self isFinished])
  {
    id v3 = 0;
  }
  else
  {
    [(PDCollaborationStateChangePublish *)self consolidateChangesByTargetAndOwner];
    id v4 = objc_alloc_init((Class)PBDataWriter);
    id v5 = objc_alloc_init(PDDPPublishStateChangeRequest);
    v86 = [(PDURLRequestOperation *)self operationID];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id obj = *(id *)(&self->super._responseStatusPayloadFailed + 3);
    id v6 = [obj countByEnumeratingWithState:&v95 objects:v113 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v96;
      uint64_t v76 = *(void *)v96;
      while (2)
      {
        uint64_t v10 = 0;
        id v77 = v7;
        do
        {
          if (*(void *)v96 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v95 + 1) + 8 * (void)v10);
          if ([v11 hasChanges])
          {
            v80 = v12;
            [(PDCollaborationStateChangePublish *)self mergeExistingLocalStateIntoRequestStateChange:v11];
            id v13 = objc_alloc_init(PDDPPayload);
            [(PDDPPayload *)v13 setType:19];
            [(PDDPPayload *)v13 setAction:1];
            id v14 = sub_100020AD0(v11);
            [(PDDPPayload *)v13 setStateChange:v14];

            v82 = v13;
            [(PDDPPublishStateChangeRequest *)v5 addPayload:v13];
            [(PDDPPublishStateChangeRequest *)v5 writeTo:v4];
            [(PDDPPublishStateChangeRequest *)v5 clearPayloads];
            uint64_t v15 = [v4 data];
            id v16 = [v15 length];
            v17 = [(PDURLRequestOperation *)self stats];
            if (v17) {
              v17[10] = v16;
            }
            v79 = v10;
            uint64_t v81 = v8;

            v18 = [(PDURLRequestOperation *)self stats];
            if (v18) {
              ++v18[14];
            }

            v19 = [(PDCollaborationStateChangePublish *)self assetsPayloadsForStateChange:v11];
            long long v91 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            id v20 = v19;
            id v21 = [v20 countByEnumeratingWithState:&v91 objects:v112 count:16];
            v85 = v20;
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v92;
              do
              {
                for (i = 0; i != v22; i = (char *)i + 1)
                {
                  if (*(void *)v92 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                  [(PDDPPublishStateChangeRequest *)v5 addPayload:v25];
                  [(PDDPPublishStateChangeRequest *)v5 writeTo:v4];
                  [(PDDPPublishStateChangeRequest *)v5 clearPayloads];
                  id v26 = [v4 data];
                  id v27 = [v26 length];
                  id v28 = [(PDURLRequestOperation *)self stats];
                  if (v28) {
                    v28[10] = v27;
                  }

                  v29 = [(PDURLRequestOperation *)self stats];
                  if (v29) {
                    ++v29[14];
                  }

                  CLSInitLog();
                  id v30 = [(PDCollaborationStateChangePublish *)self logSubsystem];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  {
                    id v31 = objc_opt_class();
                    id v32 = v31;
                    uint64_t v33 = [v25 dictionaryRepresentation];
                    *(_DWORD *)buf = 138543874;
                    v101 = v31;
                    __int16 v102 = 2114;
                    v103 = v86;
                    __int16 v104 = 2112;
                    v105 = v33;
                    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ added asset payload item %@ ", buf, 0x20u);

                    id v20 = v85;
                  }
                }
                id v22 = [v20 countByEnumeratingWithState:&v91 objects:v112 count:16];
              }
              while (v22);
            }

            CLSInitLog();
            unsigned int v34 = [(PDCollaborationStateChangePublish *)self logSubsystem];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              long long v55 = objc_opt_class();
              id v56 = v55;
              long long v57 = [(PDDPPayload *)v82 dictionaryRepresentation];
              *(_DWORD *)buf = 138543874;
              v101 = v55;
              __int16 v102 = 2114;
              v103 = v86;
              __int16 v104 = 2112;
              v105 = v57;
              _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);
            }
            v35 = +[PDUserDefaults sharedDefaults];
            unsigned int v36 = [v35 enableVerboseLogging];

            if (v36)
            {
              CLSInitLog();
              unsigned __int8 v37 = [(PDCollaborationStateChangePublish *)self logSubsystem];
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                long long v58 = objc_opt_class();
                id v84 = v58;
                v75 = [(PDDPPayload *)v82 stateChange];
                long long v59 = [v75 targetEntityName];
                v74 = [(PDDPPayload *)v82 stateChange];
                v72 = [v74 targetObjectId];
                v73 = [(PDDPPayload *)v82 stateChange];
                long long v60 = [v73 targetOwnerPersonId];
                long long v61 = [(PDDPPayload *)v82 stateChange];
                v62 = [v61 targetClassId];
                *(_DWORD *)buf = 138544642;
                v101 = v58;
                __int16 v102 = 2114;
                v103 = v86;
                __int16 v104 = 2112;
                v105 = v59;
                __int16 v106 = 2112;
                v107 = v72;
                __int16 v108 = 2112;
                v109 = v60;
                __int16 v110 = 2112;
                v111 = v62;
                _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ state change payload targetEntity:%@ targetObjectID:%@ ownerPersonID:%@ targetClassID:%@", buf, 0x3Eu);
              }
              long long v89 = 0u;
              long long v90 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              uint64_t v38 = [(PDDPPayload *)v82 stateChange];
              v39 = [v38 stateChangePayloads];

              id v40 = [v39 countByEnumeratingWithState:&v87 objects:v99 count:16];
              if (v40)
              {
                id v41 = v40;
                uint64_t v42 = *(void *)v88;
                do
                {
                  for (j = 0; j != v41; j = (char *)j + 1)
                  {
                    if (*(void *)v88 != v42) {
                      objc_enumerationMutation(v39);
                    }
                    v44 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
                    CLSInitLog();
                    v45 = [(PDCollaborationStateChangePublish *)self logSubsystem];
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v46 = objc_opt_class();
                      id v83 = v46;
                      long long v47 = [v44 dictionaryRepresentation];
                      *(_DWORD *)buf = 138543874;
                      v101 = v46;
                      __int16 v102 = 2114;
                      v103 = v86;
                      __int16 v104 = 2112;
                      v105 = v47;
                      _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ state change: %@", buf, 0x20u);
                    }
                  }
                  id v41 = [v39 countByEnumeratingWithState:&v87 objects:v99 count:16];
                }
                while (v41);
              }
            }
            uint64_t v48 = [(PDURLRequestOperation *)self stats];
            id v49 = (void *)v48;
            if (v48) {
              uint64_t v50 = *(void *)(v48 + 80);
            }
            else {
              uint64_t v50 = 0;
            }
            uint64_t v10 = v79;
            uint64_t v51 = [(PDURLRequestOperation *)self stats];
            id v52 = (void *)v51;
            if (v51) {
              uint64_t v53 = *(void *)(v51 + 112);
            }
            else {
              uint64_t v53 = 0;
            }
            uint64_t v8 = v81 + 1;
            unsigned int v54 = [(PDEndpointRequestOperation *)self hasReachedRequestPayloadLimitBytes:v50 count:v53];

            if (v54)
            {
              CLSInitLog();
              id v64 = [(PDCollaborationStateChangePublish *)self logSubsystem];
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v69 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v101 = v69;
                __int16 v102 = 2114;
                v103 = v86;
                id v70 = v69;
                _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ payload limit reached.", buf, 0x16u);
              }
              goto LABEL_57;
            }

            uint64_t v9 = v76;
            id v7 = v77;
            int64_t v12 = v80;
          }
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v10 != v7);
        id v63 = [obj countByEnumeratingWithState:&v95 objects:v113 count:16];
        id v7 = v63;
        if (v63) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
LABEL_57:

    long long v65 = [(PDURLRequestOperation *)self stats];
    if (v65 && (uint64_t v66 = v65[14], v65, v66))
    {
      if (v8 >= 1)
      {
        uint64_t v67 = objc_msgSend(*(id *)(&self->super._responseStatusPayloadFailed + 3), "subarrayWithRange:", v8, (char *)objc_msgSend(*(id *)(&self->super._responseStatusPayloadFailed + 3), "count") - v8);
        long long v68 = *(void **)(&self->super._responseStatusPayloadFailed + 3);
        *(void *)(&self->super._responseStatusPayloadFailed + 3) = v67;
      }
      id v3 = [v4 immutableData];
    }
    else
    {
      [(PDEndpointRequestOperation *)self markAsFinished];
      id v3 = 0;
    }
  }

  return v3;
}

- (BOOL)stopProcessingIfResponseStatusPayloadFailed
{
  return 0;
}

- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PDCollaborationStateChangePublish;
  BOOL v7 = [(PDAbstractClassZoneOperation *)&v44 processPayloadFromResponse:v6 error:a4];
  if ([v6 type] == 19)
  {
    uint64_t v8 = [v6 stateChange];
    uint64_t v9 = sub_10002108C(v8);

    if ([v6 hasStatus])
    {
      uint64_t v10 = [v6 status];
      unsigned int v11 = [v10 code];

      int64_t v12 = [v6 status];
      unsigned int v13 = [v12 code];

      if (v11 != 1 || !v7)
      {
        if (v13 == 112)
        {
          CLSInitLog();
          uint64_t v15 = [(PDCollaborationStateChangePublish *)self logSubsystem];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v39 = objc_opt_class();
            id v40 = v39;
            id v41 = [(PDURLRequestOperation *)self operationID];
            uint64_t v42 = [v6 dictionaryRepresentation];
            *(_DWORD *)buf = 138543874;
            uint64_t v46 = v39;
            __int16 v47 = 2114;
            uint64_t v48 = v41;
            __int16 v49 = 2112;
            uint64_t v50 = v42;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ detected conflicted response payload for item %@", buf, 0x20u);
          }
          id v16 = *(NSMutableDictionary **)((char *)&self->_statesByError + 3);
          if (!v16)
          {
            v17 = (NSMutableDictionary *)objc_opt_new();
            v18 = *(NSMutableDictionary **)((char *)&self->_statesByError + 3);
            *(NSMutableDictionary **)((char *)&self->_statesByError + 3) = v17;

            id v16 = *(NSMutableDictionary **)((char *)&self->_statesByError + 3);
          }
          goto LABEL_15;
        }
LABEL_16:
        v19 = [v6 status];

        if (v19)
        {
          if (!*(int64_t *)((char *)&self->_totalStateChanges + 3))
          {
            uint64_t v20 = objc_opt_new();
            id v21 = *(void **)((char *)&self->_totalStateChanges + 3);
            *(int64_t *)((char *)&self->_totalStateChanges + 3) = v20;
          }
          id v22 = [v6 status];
          uint64_t v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_1000F4EF8((int)[v22 code]));
          uint64_t v24 = [v23 stringValue];

          CLSInitLog();
          v25 = [(PDCollaborationStateChangePublish *)self logSubsystem];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v34 = objc_opt_class();
            id v43 = v34;
            v35 = [(PDURLRequestOperation *)self operationID];
            uint64_t v36 = [v6 dictionaryRepresentation];
            id v37 = *a4;
            *(_DWORD *)buf = 138544386;
            uint64_t v46 = v34;
            __int16 v47 = 2114;
            uint64_t v48 = v35;
            __int16 v49 = 2112;
            uint64_t v50 = v24;
            __int16 v51 = 2112;
            uint64_t v52 = v36;
            uint64_t v38 = (void *)v36;
            __int16 v53 = 2112;
            id v54 = v37;
            _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ errorKey %@ for payload item %@ with error %@", buf, 0x34u);
          }
          id v26 = [*(id *)((char *)&self->_totalStateChanges + 3) objectForKey:v24];

          if (v26)
          {
            id v27 = [*(id *)((char *)&self->_totalStateChanges + 3) valueForKey:v24];
            [v27 addObjectsFromArray:v9];
          }
          else
          {
            id v27 = objc_alloc_init((Class)NSMutableArray);
            [v27 addObjectsFromArray:v9];
            [*(id *)((char *)&self->_totalStateChanges + 3) setObject:v27 forKey:v24];
          }
        }
        else
        {
          CLSInitLog();
          uint64_t v24 = [(PDCollaborationStateChangePublish *)self logSubsystem];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            id v28 = objc_opt_class();
            id v29 = v28;
            id v30 = [(PDURLRequestOperation *)self operationID];
            id v31 = [v6 dictionaryRepresentation];
            id v32 = *a4;
            *(_DWORD *)buf = 138544130;
            uint64_t v46 = v28;
            __int16 v47 = 2114;
            uint64_t v48 = v30;
            __int16 v49 = 2112;
            uint64_t v50 = v31;
            __int16 v51 = 2112;
            uint64_t v52 = (uint64_t)v32;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ ignoring response payload item %@ with error %@", buf, 0x2Au);
          }
        }

        goto LABEL_28;
      }
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
    if (![v9 count])
    {
LABEL_28:

      goto LABEL_29;
    }
    id v16 = *(NSArray **)((char *)&self->_requestedStateChanges + 3);
LABEL_15:
    [v16 addObjectsFromArray:v9];
    goto LABEL_28;
  }
LABEL_29:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_statesByError + 3), 0);
  objc_storeStrong((id *)((char *)&self->_requestedStateChanges + 3), 0);
  objc_storeStrong((id *)((char *)&self->_totalStateChanges + 3), 0);

  objc_storeStrong((id *)(&self->super._responseStatusPayloadFailed + 3), 0);
}

@end