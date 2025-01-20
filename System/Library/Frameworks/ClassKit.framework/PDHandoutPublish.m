@interface PDHandoutPublish
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)allowMixedResponseStatusCode;
- (BOOL)processPayloadStatus:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5;
- (BOOL)shouldProcessPayload:(id)a3;
- (BOOL)stopProcessingIfResponseStatusPayloadFailed;
- (Class)expectedResponseClass;
- (id)_findDependencyObjects:(id)a3 from:(id)a4;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (void)_addDependentObject:(id)a3 to:(id)a4;
- (void)_buildDependencyHashMap:(id)a3;
@end

@implementation PDHandoutPublish

- (id)logSubsystem
{
  return CLSLogHandout;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 0x20) & (0xC60E801F >> a3);
}

- (id)endpointIdentifier
{
  return @"publishHandout";
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

- (BOOL)allowMixedResponseStatusCode
{
  return 1;
}

- (BOOL)shouldProcessPayload:(id)a3
{
  id v3 = a3;
  v4 = [v3 status];
  unsigned int v5 = [v3 type];

  unsigned int v6 = [v4 code];
  if (v5 == 1) {
    BOOL v7 = v6 == 1;
  }
  else {
    BOOL v7 = v6 - 1 < 2;
  }

  return v7;
}

- (BOOL)processPayloadStatus:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [v8 status];
  if ([v9 hasInternalMessage])
  {
    CLSInitLog();
    v10 = [(PDHandoutPublish *)self logSubsystem];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_opt_class();
      id v25 = v17;
      v18 = [(PDURLRequestOperation *)self operationID];
      unsigned int v24 = [v9 code];
      v19 = [v9 message];
      v20 = [v9 internalMessage];
      *(_DWORD *)buf = 138544386;
      v27 = v17;
      __int16 v28 = 2114;
      v29 = v18;
      __int16 v30 = 1024;
      *(_DWORD *)v31 = v24;
      *(_WORD *)&v31[4] = 2112;
      *(void *)&v31[6] = v19;
      __int16 v32 = 2112;
      v33 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ status code: %d message: %@ internal message:%@", buf, 0x30u);
    }
  }
  uint64_t v11 = sub_1000F5844(v9);
  [(PDEndpointRequestOperation *)self handleServerAlerts:v11];

  LOBYTE(v11) = [(PDHandoutPublish *)self shouldProcessPayload:v8];
  if ((v11 & 1) != 0 || (sub_1000F51A0(v9, a4), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v15 = 1;
  }
  else
  {
    v13 = (void *)v12;
    [(PDEndpointRequestOperation *)self setResponseStatusError:v12];
    if (a5) {
      *a5 = v13;
    }
    CLSInitLog();
    v14 = [(PDHandoutPublish *)self logSubsystem];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      id v22 = v21;
      v23 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543874;
      v27 = v21;
      __int16 v28 = 2114;
      v29 = v23;
      __int16 v30 = 2114;
      *(void *)v31 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ assignment request errored: %{public}@;",
        buf,
        0x20u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (id)requestData
{
  if ([(PDOperation *)self isFinished])
  {
    id v3 = 0;
    goto LABEL_88;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  if (self) {
    v4 = *(void **)(&self->super._responseStatusPayloadFailed + 3);
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v83 objects:v97 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v84;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v84 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 classID];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            uint64_t v96 = v11;
            v13 = +[NSArray arrayWithObjects:&v96 count:1];

            if (v13) {
              goto LABEL_40;
            }
            goto LABEL_16;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v83 objects:v97 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_16:
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  if (self) {
    v14 = *(void **)(&self->super._responseStatusPayloadFailed + 3);
  }
  else {
    v14 = 0;
  }
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v79 objects:v95 count:16];
  if (!v16)
  {
    v13 = 0;
    goto LABEL_39;
  }
  id v17 = v16;
  v13 = 0;
  uint64_t v18 = *(void *)v80;
  do
  {
    for (j = 0; j != v17; j = (char *)j + 1)
    {
      if (*(void *)v80 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
      id v22 = [(PDOperation *)self database];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [v20 objectID];
        uint64_t v24 = sub_10016B0FC(v22, v23);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v23 = [v20 objectID];
          uint64_t v24 = sub_1001564D8(v22, v23);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [v20 objectID];
            uint64_t v24 = sub_1000BB1D8(v22, v23);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [v20 objectID];
              uint64_t v24 = sub_100065A04(v22, v23);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_34;
              }
              v23 = [v20 objectID];
              uint64_t v24 = sub_1001534A4(v22, v23);
            }
          }
        }
      }
      id v25 = (void *)v24;

      v13 = v25;
LABEL_34:
      id v26 = [v13 count];

      if (v26) {
        goto LABEL_39;
      }
    }
    id v17 = [v15 countByEnumeratingWithState:&v79 objects:v95 count:16];
  }
  while (v17);
LABEL_39:

LABEL_40:
  if ([v13 count])
  {
    id v27 = objc_alloc_init((Class)PBDataWriter);
    __int16 v28 = objc_alloc_init(PDDPPublishHandoutRequest);
    v69 = [(PDURLRequestOperation *)self operationID];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v29 = *(id *)(&self->super._responseStatusPayloadFailed + 3);
    id v30 = [v29 countByEnumeratingWithState:&v75 objects:v94 count:16];
    v67 = v13;
    if (v30)
    {
      id v31 = v30;
      uint64_t v68 = *(void *)v76;
      __int16 v32 = &off_10020A000;
      id v64 = v29;
      do
      {
        v33 = 0;
        id v62 = v31;
        do
        {
          if (*(void *)v76 != v68) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v33);
          if ([(id)objc_opt_class() conformsToProtocol:v32[107]])
          {
            context = v35;
            v63 = v33;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v36 = [(PDHandoutPublish *)self _findDependencyObjects:v34 from:*(void *)(&self->super._responseStatusPayloadFailed + 3)];
              v37 = [v34 payloadsWithClassIDs:v13 dependencies:v36];
            }
            else
            {
              v37 = [v34 payloadsWithClassIDs:v13 dependencies:0];
            }
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id obj = v37;
            id v38 = [obj countByEnumeratingWithState:&v71 objects:v93 count:16];
            if (v38)
            {
              id v39 = v38;
              uint64_t v40 = *(void *)v72;
              do
              {
                v41 = 0;
                do
                {
                  if (*(void *)v72 != v40) {
                    objc_enumerationMutation(obj);
                  }
                  v42 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v41);
                  if (objc_msgSend(v34, "needsRepair", v62)) {
                    uint64_t v43 = 5;
                  }
                  else {
                    uint64_t v43 = 1;
                  }
                  [v42 setAction:v43];
                  [(PDDPPublishHandoutRequest *)v28 addPayload:v42];
                  [(PDDPPublishHandoutRequest *)v28 writeTo:v27];
                  [(PDDPPublishHandoutRequest *)v28 clearPayloads];
                  v44 = [v27 data];
                  id v45 = [v44 length];
                  v46 = [(PDURLRequestOperation *)self stats];
                  if (v46) {
                    v46[10] = v45;
                  }

                  v47 = [(PDURLRequestOperation *)self stats];
                  if (v47) {
                    ++v47[14];
                  }

                  CLSInitLog();
                  v48 = [(PDHandoutPublish *)self logSubsystem];
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                  {
                    v56 = objc_opt_class();
                    id v66 = v56;
                    v57 = [v42 dictionaryRepresentation];
                    *(_DWORD *)buf = 138543874;
                    v88 = v56;
                    __int16 v89 = 2114;
                    v90 = v69;
                    __int16 v91 = 2112;
                    v92 = v57;
                    _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);
                  }
                  uint64_t v49 = [(PDURLRequestOperation *)self stats];
                  v50 = (void *)v49;
                  if (v49) {
                    uint64_t v51 = *(void *)(v49 + 80);
                  }
                  else {
                    uint64_t v51 = 0;
                  }
                  uint64_t v52 = [(PDURLRequestOperation *)self stats];
                  v53 = (void *)v52;
                  if (v52) {
                    uint64_t v54 = *(void *)(v52 + 112);
                  }
                  else {
                    uint64_t v54 = 0;
                  }
                  unsigned __int8 v55 = [(PDEndpointRequestOperation *)self hasReachedRequestPayloadLimitBytes:v51 count:v54];

                  if (v55)
                  {

                    id v29 = v64;
                    goto LABEL_79;
                  }
                  v41 = (char *)v41 + 1;
                }
                while (v39 != v41);
                id v58 = [obj countByEnumeratingWithState:&v71 objects:v93 count:16];
                id v39 = v58;
                v13 = v67;
              }
              while (v58);
            }

            v33 = v63;
            id v29 = v64;
            __int16 v32 = &off_10020A000;
            id v31 = v62;
            v35 = context;
          }
          v33 = (char *)v33 + 1;
        }
        while (v33 != v31);
        id v31 = [v29 countByEnumeratingWithState:&v75 objects:v94 count:16];
      }
      while (v31);
    }
LABEL_79:

    v59 = [(PDURLRequestOperation *)self stats];
    if (v59 && (uint64_t v60 = v59[14], v59, v60))
    {
      id v3 = [v27 immutableData];
    }
    else
    {
      [(PDEndpointRequestOperation *)self markAsFinished];
      id v3 = 0;
    }

    v13 = v67;
  }
  else
  {
    id v27 = +[NSError cls_createErrorWithCode:2 description:@"handout graph missing handout recipient classID."];
    [(PDOperation *)self finishWithError:v27];
    id v3 = 0;
  }

LABEL_88:

  return v3;
}

- (BOOL)stopProcessingIfResponseStatusPayloadFailed
{
  return 0;
}

- (id)_findDependencyObjects:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![*(id *)((char *)&self->super.super._responseStatusError + 3) count]) {
    [(PDHandoutPublish *)self _buildDependencyHashMap:v7];
  }
  uint64_t v8 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v6 objectID];
    [(PDHandoutPublish *)self _addDependentObject:v9 to:v8];
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_buildDependencyHashMap:(id)a3
{
  id v4 = a3;
  id v6 = (NSError *)objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v13 = objc_opt_new();
        v14 = [v12 objectID];
        [(NSError *)v6 setObject:v13 forKeyedSubscript:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        v21 = objc_msgSend(v20, "parentObjectID", (void)v25);
        id v22 = [(NSError *)v6 objectForKeyedSubscript:v21];

        if (v22)
        {
          v23 = [(NSError *)v6 objectForKeyedSubscript:v21];
          [v23 addObject:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }

  uint64_t v24 = *(NSError **)((char *)&self->super.super._responseStatusError + 3);
  *(NSError **)((char *)&self->super.super._responseStatusError + 3) = v6;
}

- (void)_addDependentObject:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)((char *)&self->super.super._responseStatusError + 3) objectForKeyedSubscript:v6];
  id v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [*(id *)((char *)&self->super.super._responseStatusError + 3) objectForKeyedSubscript:v6];
    [v7 addObjectsFromArray:v10];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = objc_msgSend(*(id *)((char *)&self->super.super._responseStatusError + 3), "objectForKeyedSubscript:", v6, 0);
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v15);
          uint64_t v18 = [v16 objectID];
          [(PDHandoutPublish *)self _addDependentObject:v18 to:v7];

          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super._responseStatusPayloadFailed + 3), 0);

  objc_storeStrong((id *)((char *)&self->super.super._responseStatusError + 3), 0);
}

@end