@interface PDPublishAdminRequest
+ (id)defaultEndpointInfo;
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)processAdminRequestAccountPayload:(id)a3;
- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4;
- (BOOL)requiresValidUser;
- (BOOL)shouldProcessPayloadWithStatusCode:(int)a3;
- (BOOL)wantsToExecute;
- (CLSAdminRequestor)requestor;
- (Class)expectedResponseClass;
- (NSArray)adminRequestAccounts;
- (NSArray)adminRequests;
- (NSMutableArray)failures;
- (NSMutableArray)successfulObjects;
- (PDPublishAdminRequest)initWithDatabase:(id)a3 adminRequests:(id)a4 requestor:(id)a5;
- (id)acceptContentType;
- (id)customRequestHeaders;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (void)disableSearchIfAccountIsUnapproved:(id)a3;
- (void)finishedResponseProcessing;
- (void)setAdminRequestAccounts:(id)a3;
- (void)setAdminRequests:(id)a3;
- (void)setFailures:(id)a3;
- (void)setRequestor:(id)a3;
- (void)setSuccessfulObjects:(id)a3;
@end

@implementation PDPublishAdminRequest

- (id)logSubsystem
{
  return CLSLogOnboarding;
}

+ (id)defaultEndpointInfo
{
  v2 = objc_alloc_init(PDEndpointInfo);
  sub_10007C770((uint64_t)v2, @"apple_school_manager");
  sub_1000435F8((uint64_t)v2, @"ee.adminRequest");
  sub_100043608((uint64_t)v2, @"https://ws.school.apple.com/maid/v1/adminrequest/publish");
  if (v2)
  {
    *(_WORD *)&v2->_requiresAuth = 256;
    v2->_payloadLimitBytes = 0;
    v2->_responseTTLSeconds = 0;
    v2->_payloadLimitItems = 0;
  }
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)endpointIdentifier
{
  return @"ee.adminRequest";
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

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 0xC) & (0xD13u >> a3);
}

- (BOOL)shouldProcessPayloadWithStatusCode:(int)a3
{
  BOOL result = 1;
  if ((a3 - 102) > 0xA || ((1 << (a3 - 102)) & 0x481) == 0) {
    return a3 == 1 || a3 == 804;
  }
  return result;
}

- (id)customRequestHeaders
{
  v3 = [(PDPublishAdminRequest *)self requestor];

  if (v3)
  {
    v4 = [(PDPublishAdminRequest *)self requestor];
    v5 = [(PDOperation *)self database];
    uint64_t v6 = objc_opt_class();
    v7 = [v4 objectID];
    v8 = [v5 select:v6 identity:v7];

    if (v8)
    {
      objc_msgSend(v4, "setState:", objc_msgSend(v8, "state"));
      v9 = [v8 serverRequestHeaders];
      [v4 setServerRequestHeaders:v9];
    }
    v10 = [v4 serverRequestHeaders];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)requiresValidUser
{
  return 0;
}

- (PDPublishAdminRequest)initWithDatabase:(id)a3 adminRequests:(id)a4 requestor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PDPublishAdminRequest;
  v11 = [(PDASMPayloadOperation *)&v18 initWithDatabase:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 242), a4);
    objc_storeStrong((id *)(v12 + 250), a5);
    uint64_t v13 = objc_opt_new();
    v14 = *(void **)(v12 + 266);
    *(void *)(v12 + 266) = v13;

    uint64_t v15 = objc_opt_new();
    v16 = *(void **)(v12 + 274);
    *(void *)(v12 + 274) = v15;

    v12[234] = 1;
  }

  return (PDPublishAdminRequest *)v12;
}

- (void)setAdminRequestAccounts:(id)a3
{
}

- (BOOL)wantsToExecute
{
  v3 = [(PDOperation *)self manager];
  BOOL v4 = sub_100003494((BOOL)v3);

  if (*(NSArray **)((char *)&self->_adminRequests + 2)) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = !v4;
  }
  BOOL v6 = !v5 && [*(id *)(&self->_firstRun + 2) count] != 0;
  v7 = +[PDUserDefaults sharedDefaults];
  unsigned int v8 = [v7 enableVerboseLogging];

  if (v8 && !v6)
  {
    if (!v4 && !*(NSArray **)((char *)&self->_adminRequests + 2))
    {
      CLSInitLog();
      id v9 = [(PDPublishAdminRequest *)self logSubsystem];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = objc_opt_class();
        id v11 = v15;
        v12 = [(PDURLRequestOperation *)self operationID];
        int v16 = 138543618;
        v17 = v15;
        __int16 v18 = 2114;
        v19 = v12;
        uint64_t v13 = "%{public}@: %{public}@ Skipping operation: no requestor supplied.";
        goto LABEL_18;
      }
LABEL_15:

      return v6;
    }
    if (BYTE2(self->super._unresolvedMissingEntityIDs))
    {
      CLSInitLog();
      id v9 = [(PDPublishAdminRequest *)self logSubsystem];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = objc_opt_class();
        id v11 = v10;
        v12 = [(PDURLRequestOperation *)self operationID];
        int v16 = 138543618;
        v17 = v10;
        __int16 v18 = 2114;
        v19 = v12;
        uint64_t v13 = "%{public}@: %{public}@ Skipping operation: no admin requests supplied.";
LABEL_18:
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v16, 0x16u);

        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  return v6;
}

- (id)requestData
{
  v2 = self;
  if ([(PDOperation *)self isFinished])
  {
    v3 = 0;
    goto LABEL_69;
  }
  id v4 = objc_alloc_init((Class)PBDataWriter);
  BOOL v5 = objc_alloc_init(PDDPPublishAdminRequest);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v70 = 242;
  id obj = *(id *)(&v2->_firstRun + 2);
  BOOL v6 = (char *)[obj countByEnumeratingWithState:&v102 objects:v114 count:16];
  v7 = 0;
  if (v6)
  {
    uint64_t v86 = 0;
    uint64_t v8 = 0;
    uint64_t v73 = *(void *)v103;
    v88 = v2;
    id v74 = v4;
LABEL_5:
    uint64_t v9 = 0;
    uint64_t v10 = v8;
    v71 = &v6[v8];
    v75 = v6;
    while (1)
    {
      uint64_t v79 = v10;
      if (*(void *)v103 != v73) {
        objc_enumerationMutation(obj);
      }
      v89 = v7;
      uint64_t v76 = v9;
      id v11 = *(PDDPAdminRequestDetails **)(*((void *)&v102 + 1) + 8 * v9);
      v87 = [(PDOperation *)v2 database];
      v93 = objc_opt_new();
      v12 = [(PDOperation *)v2 manager];
      if (!sub_100003494((BOOL)v12)) {
        goto LABEL_14;
      }
      uint64_t v13 = [(PDDPAdminRequestDetails *)v11 organizationID];

      if (!v13) {
        break;
      }
LABEL_15:
      v17 = sub_10007B534(v11, *(void **)((char *)&v2->_adminRequests + 2));
      __int16 v18 = objc_alloc_init(PDDPEEPayload);
      [(PDDPEEPayload *)v18 setType:10];
      [(PDDPEEPayload *)v18 setAction:1];
      [(PDDPEEPayload *)v18 setAdminRequest:v17];
      [v93 addObject:v18];
      v19 = +[PDUserDefaults sharedDefaults];
      unsigned int v20 = [v19 enableVerboseLogging];

      if (v20)
      {
        v21 = [(PDDPEEPayload *)v18 adminRequest];
        unsigned int v22 = [v21 hasRequestor];

        if (v22)
        {
          CLSInitLog();
          v23 = [(PDPublishAdminRequest *)v2 logSubsystem];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v55 = objc_opt_class();
            id v92 = v55;
            v56 = [(PDURLRequestOperation *)v2 operationID];
            v57 = [(PDDPEEPayload *)v18 adminRequest];
            v58 = [v57 requestor];
            v59 = [v58 description];
            *(_DWORD *)buf = 138543874;
            v109 = v55;
            __int16 v110 = 2114;
            v111 = v56;
            __int16 v112 = 2112;
            uint64_t v113 = (uint64_t)v59;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ using requestor: %@", buf, 0x20u);

            v2 = v88;
          }
        }
      }
      v77 = v18;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v91 = *(id *)((char *)&v2->_requestor + 2);
      id v24 = [v91 countByEnumeratingWithState:&v98 objects:v107 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v99;
        do
        {
          v27 = 0;
          do
          {
            if (*(void *)v99 != v26) {
              objc_enumerationMutation(v91);
            }
            v28 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v27);
            v29 = objc_alloc_init(PDDPEEPayload);
            [(PDDPEEPayload *)v29 setType:11];
            [(PDDPEEPayload *)v29 setAction:1];
            v30 = sub_10007B92C(v11, v28, v17);
            [(PDDPEEPayload *)v29 setAdminRequestAccount:v30];

            uint64_t v31 = [v28 requestedRoleID];
            if (v31)
            {
              v32 = (void *)v31;
            }
            else
            {
              if ([v28 requestedRoleType] != (id)6) {
                goto LABEL_28;
              }
              uint64_t v38 = (uint64_t)v89;
              if (!v89)
              {
                v39 = [v87 select:objc_opt_class() where:@"type = ?" bindings:&off_10020B278];
                if (!v39) {
                  goto LABEL_44;
                }
                v40 = v39;
                uint64_t v90 = [v39 objectID];
                v41 = +[PDUserDefaults sharedDefaults];
                unsigned int v42 = [v41 enableVerboseLogging];

                if (v42)
                {
                  CLSInitLog();
                  v43 = [(PDPublishAdminRequest *)v88 logSubsystem];
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                  {
                    v83 = objc_opt_class();
                    id v85 = v83;
                    v46 = [(PDURLRequestOperation *)v88 operationID];
                    *(_DWORD *)buf = 138543874;
                    v109 = v83;
                    __int16 v110 = 2114;
                    v111 = v46;
                    __int16 v112 = 2112;
                    uint64_t v113 = v90;
                    _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ using default 'student' roleID: %@", buf, 0x20u);
                  }
                }

                uint64_t v38 = v90;
                if (!v90)
                {
LABEL_44:
                  v89 = 0;
                  goto LABEL_28;
                }
              }
              v32 = [(PDDPEEPayload *)v29 adminRequestAccount];
              v89 = (void *)v38;
              [v32 setRequestedRoleId:v38];
            }

LABEL_28:
            v33 = +[PDUserDefaults sharedDefaults];
            unsigned int v34 = [v33 enableVerboseLogging];

            if (v34)
            {
              v35 = [(PDDPEEPayload *)v29 adminRequestAccount];
              unsigned int v36 = [v35 hasPerson];

              if (v36)
              {
                CLSInitLog();
                v37 = [(PDPublishAdminRequest *)v88 logSubsystem];
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  v80 = objc_opt_class();
                  id v84 = v80;
                  v44 = [(PDURLRequestOperation *)v88 operationID];
                  v82 = [(PDDPEEPayload *)v29 adminRequestAccount];
                  v81 = [v82 person];
                  v45 = [v81 description];
                  *(_DWORD *)buf = 138543874;
                  v109 = v80;
                  __int16 v110 = 2114;
                  v111 = v44;
                  __int16 v112 = 2112;
                  uint64_t v113 = (uint64_t)v45;
                  _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ person info: %@", buf, 0x20u);
                }
              }
            }
            [v93 addObject:v29];

            v27 = (char *)v27 + 1;
          }
          while (v25 != v27);
          v86 += (uint64_t)v25;
          id v47 = [v91 countByEnumeratingWithState:&v98 objects:v107 count:16];
          id v25 = v47;
        }
        while (v47);
      }
      uint64_t v10 = v79 + 1;

      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v48 = v93;
      id v49 = [v48 countByEnumeratingWithState:&v94 objects:v106 count:16];
      if (v49)
      {
        id v50 = v49;
        uint64_t v51 = *(void *)v95;
        id v4 = v74;
        v2 = v88;
        do
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v95 != v51) {
              objc_enumerationMutation(v48);
            }
            uint64_t v53 = *(void *)(*((void *)&v94 + 1) + 8 * i);
            -[PDDPPublishAdminRequest addPayload:](v5, "addPayload:", v53, v70);
            unsigned int v54 = [(PDASMPayloadOperation *)v88 writePayload:v53 toRequest:v5 writer:v74];
            [(PDDPPublishAdminRequest *)v5 clearPayloads];
          }
          id v50 = [v48 countByEnumeratingWithState:&v94 objects:v106 count:16];
        }
        while (v50);

        if (!v54)
        {
          uint64_t v8 = v79 + 1;
          v7 = v89;
          goto LABEL_60;
        }
      }
      else
      {

        id v4 = v74;
        v2 = v88;
      }
      uint64_t v9 = v76 + 1;
      v7 = v89;
      if ((char *)(v76 + 1) == v75)
      {
        BOOL v6 = (char *)[obj countByEnumeratingWithState:&v102 objects:v114 count:16];
        uint64_t v8 = (uint64_t)v71;
        if (!v6) {
          goto LABEL_60;
        }
        goto LABEL_5;
      }
    }
    v12 = sub_1000670BC(v87);
    [(PDDPAdminRequestDetails *)v11 setOrganizationID:v12];
    v14 = +[PDUserDefaults sharedDefaults];
    unsigned int v15 = [v14 enableVerboseLogging];

    if (v15)
    {
      CLSInitLog();
      int v16 = [(PDPublishAdminRequest *)v2 logSubsystem];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v60 = objc_opt_class();
        id v61 = v60;
        v62 = [(PDURLRequestOperation *)v2 operationID];
        *(_DWORD *)buf = 138543874;
        v109 = v60;
        __int16 v110 = 2114;
        v111 = v62;
        __int16 v112 = 2112;
        uint64_t v113 = (uint64_t)v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ using current organizationID: %@", buf, 0x20u);

        v2 = v88;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v86 = 0;
  uint64_t v8 = 0;
LABEL_60:

  BYTE2(v2->super._unresolvedMissingEntityIDs) = 0;
  v63 = [(PDURLRequestOperation *)v2 stats];
  if (v63 && (uint64_t v64 = v63[14], v63, v64))
  {
    if (v8 >= 1)
    {
      uint64_t v65 = objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.super.super.isa + v70), "subarrayWithRange:", v8, (char *)objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.super.super.isa + v70), "count") - v8);
      v66 = *(Class *)((char *)&v2->super.super.super.super.super.super.super.isa + v70);
      *(Class *)((char *)&v2->super.super.super.super.super.super.super.isa + v70) = (Class)v65;
    }
    if (v86 >= 1)
    {
      uint64_t v67 = objc_msgSend(*(id *)((char *)&v2->_requestor + 2), "subarrayWithRange:", v86, (char *)objc_msgSend(*(id *)((char *)&v2->_requestor + 2), "count") - v86);
      v68 = *(CLSAdminRequestor **)((char *)&v2->_requestor + 2);
      *(CLSAdminRequestor **)((char *)&v2->_requestor + 2) = (CLSAdminRequestor *)v67;
    }
    v3 = objc_msgSend(v4, "immutableData", v70);
  }
  else
  {
    [(PDEndpointRequestOperation *)v2 markAsFinished];
    v3 = 0;
  }

LABEL_69:

  return v3;
}

- (void)disableSearchIfAccountIsUnapproved:(id)a3
{
  id v10 = a3;
  id v4 = [v10 person];

  if (v4)
  {
    BOOL v5 = [(PDOperation *)self database];
    uint64_t v6 = objc_opt_class();
    v7 = [v10 parentRequestId];
    uint64_t v8 = [v5 select:v6 identity:v7];

    if (v8 && [v8 type] == (id)2 && objc_msgSend(v8, "approval") != (id)3)
    {
      uint64_t v9 = [v10 person];
      [v9 setIsRosterSearchAllowed:0];
    }
  }
}

- (BOOL)processAdminRequestAccountPayload:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 adminRequestAccount];
  if ([v5 hasPerson])
  {
    uint64_t v6 = [v5 person];
    [(PDPublishAdminRequest *)self disableSearchIfAccountIsUnapproved:v5];
    v7 = [(PDOperation *)self manager];
    BOOL v8 = sub_100003494((BOOL)v7);

    if (!v8)
    {
      uint64_t v9 = objc_opt_new();
      id v10 = [(PDOperation *)self database];
      id v11 = [v6 roleLocations];
      id v12 = [v11 count];

      if (v12)
      {
        unsigned int v36 = self;
        id v37 = v4;
        v40 = v5;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id obj = [v6 roleLocations];
        uint64_t v13 = v9;
        id v42 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v42)
        {
          uint64_t v14 = *(void *)v45;
          unsigned int v15 = CKRecordID_ptr;
          uint64_t v38 = v10;
          v39 = v13;
          do
          {
            for (i = 0; i != v42; i = (char *)i + 1)
            {
              if (*(void *)v45 != v14) {
                objc_enumerationMutation(obj);
              }
              v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              if ([v17 hasRoleType] && !objc_msgSend(v17, "hasRoleId")
                || [v17 hasRoleId]
                && (uint64_t v18 = objc_opt_class(),
                    [v17 roleId],
                    v19 = objc_claimAutoreleasedReturnValue(),
                    LOBYTE(v18) = [v10 entityExistsByClass:v18 identity:v19],
                    v19,
                    (v18 & 1) == 0))
              {
                unsigned int v20 = v15;
                uint64_t v21 = v14;
                unsigned int v22 = v6;
                v23 = [v6 personId];
                id v24 = [v17 roleType];
                if (v24 >= 7)
                {
                  id v25 = +[NSString stringWithFormat:@"(unknown: %i)", v24];
                }
                else
                {
                  id v25 = *(&off_1001F6398 + (int)v24);
                }
                uint64_t v26 = [v17 locationId];
                v27 = [v40 parentRequestId];
                v28 = +[NSString stringWithFormat:@"%@-%@-%@-%@", v23, v25, v26, v27];

                [v17 setRoleId:v28];
                id v29 = [objc_alloc((Class)CLSRole) _init];
                [v29 setObjectID:v28];
                objc_msgSend(v29, "setType:", (int)objc_msgSend(v17, "roleType"));
                [v29 setPrivileges:&__NSArray0__struct];
                uint64_t v13 = v39;
                [v39 addObject:v29];

                uint64_t v6 = v22;
                uint64_t v14 = v21;
                unsigned int v15 = v20;
                id v10 = v38;
              }
              uint64_t v30 = objc_opt_class();
              uint64_t v31 = [v17 locationId];
              LOBYTE(v30) = [v10 entityExistsByClass:v30 identity:v31];

              if ((v30 & 1) == 0)
              {
                id v32 = [objc_alloc((Class)v15[54]) _init];
                v33 = [v17 locationId];
                [v32 setObjectID:v33];

                [v32 setLocationName:&stru_1001F6580];
                [v13 addObject:v32];
              }
            }
            id v42 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v42);
        }

        [v10 insertOrUpdateObjects:v13];
        self = v36;
        id v4 = v37;
        uint64_t v9 = v13;
        BOOL v5 = v40;
      }
    }
  }
  v43.receiver = self;
  v43.super_class = (Class)PDPublishAdminRequest;
  BOOL v34 = [(PDASMPayloadOperation *)&v43 processAdminRequestAccountPayload:v4];

  return v34;
}

- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PDPublishAdminRequest;
  BOOL v7 = [(PDASMPayloadOperation *)&v24 processPayloadFromResponse:v6 error:a4];
  if ([v6 hasStatus])
  {
    BOOL v8 = [v6 status];
    BOOL v9 = [v8 code] == 1;
  }
  else
  {
    BOOL v9 = 1;
  }
  if ([v6 type] == 10)
  {
    id v10 = [v6 adminRequest];
    id v11 = sub_10007B728(v10);

    if (v7 && v9)
    {
      [*(id *)((char *)&self->_adminRequestAccounts + 2) addObject:v11];
LABEL_18:

      goto LABEL_19;
    }
    unsigned int v15 = [v6 status];

    if (!v15) {
      goto LABEL_18;
    }
    id v13 = v11;
    id v11 = v13;
  }
  else
  {
    char v12 = [v6 type] != 11 || v9;
    if (v12) {
      goto LABEL_19;
    }
    id v13 = [v6 adminRequestAccount];
    uint64_t v14 = [v6 status];
    id v11 = sub_10007C02C(v13, v14);
  }
  if (v11)
  {
    int v16 = [v6 status];
    v17 = +[NSError cls_createErrorWithCode:sub_1000F5094(v16) errorObject:v11 description:0];

    [*(id *)((char *)&self->_successfulObjects + 2) addObject:v17];
    CLSInitLog();
    uint64_t v18 = [(PDPublishAdminRequest *)self logSubsystem];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v20 = objc_opt_class();
      id v21 = v20;
      unsigned int v22 = [(PDURLRequestOperation *)self operationID];
      v23 = [v6 dictionaryRepresentation];
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v20;
      __int16 v27 = 2114;
      v28 = v22;
      __int16 v29 = 2112;
      uint64_t v30 = v23;
      __int16 v31 = 2114;
      id v32 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ failing payload item %@ with error %{public}@", buf, 0x2Au);
    }
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

- (void)finishedResponseProcessing
{
  v3 = [(PDPublishAdminRequest *)self successfulObjects];
  uint64_t v4 = (uint64_t)[v3 count];

  BOOL v5 = [(PDPublishAdminRequest *)self failures];
  uint64_t v6 = (uint64_t)[v5 count];

  BOOL v7 = [(PDOperation *)self operationError];
  if (!v7)
  {
    if (v6 < 1 || v4 < 1) {
      return;
    }
    BOOL v8 = [(PDPublishAdminRequest *)self successfulObjects];
    BOOL v9 = [(PDPublishAdminRequest *)self failures];
    id v10 = +[NSError cls_createErrorWithCode:9 successfulObjects:v8 underlyingErrors:v9 description:0];

    [(PDOperation *)self finishWithError:v10];
    BOOL v7 = v10;
  }
}

- (NSArray)adminRequests
{
  return *(NSArray **)(&self->_firstRun + 2);
}

- (void)setAdminRequests:(id)a3
{
}

- (CLSAdminRequestor)requestor
{
  return *(CLSAdminRequestor **)((char *)&self->_adminRequests + 2);
}

- (void)setRequestor:(id)a3
{
}

- (NSArray)adminRequestAccounts
{
  return *(NSArray **)((char *)&self->_requestor + 2);
}

- (NSMutableArray)successfulObjects
{
  return *(NSMutableArray **)((char *)&self->_adminRequestAccounts + 2);
}

- (void)setSuccessfulObjects:(id)a3
{
}

- (NSMutableArray)failures
{
  return *(NSMutableArray **)((char *)&self->_successfulObjects + 2);
}

- (void)setFailures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_successfulObjects + 2), 0);
  objc_storeStrong((id *)((char *)&self->_adminRequestAccounts + 2), 0);
  objc_storeStrong((id *)((char *)&self->_requestor + 2), 0);
  objc_storeStrong((id *)((char *)&self->_adminRequests + 2), 0);

  objc_storeStrong((id *)(&self->_firstRun + 2), 0);
}

@end