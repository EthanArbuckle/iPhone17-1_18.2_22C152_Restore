@interface PDEndpointRequestOperation
+ (BOOL)isEndpointAvailable:(id)a3 inDatabase:(id)a4;
+ (NSString)serviceID;
+ (id)defaultEndpointInfo;
- (BOOL)canParseStreams;
- (BOOL)checkForMissingEntityWithObjectID:(id)a3 forClass:(Class)a4 fromEntityWithID:(id)a5 withClass:(Class)a6;
- (BOOL)hasReachedRequestPayloadLimitBytes:(unint64_t)a3 count:(int64_t)a4;
- (BOOL)parseStreamedResponse:(id)a3;
- (BOOL)processPayloadWithinWriteTransaction:(id)a3 error:(id *)a4 stop:(BOOL *)a5;
- (BOOL)processResponse:(id *)a3;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)readStreamablePayload:(id)a3 reader:(id)a4 error:(id *)a5;
- (BOOL)requiresAuth;
- (BOOL)shouldProcessResponseBody;
- (Class)expectedResponseClass;
- (Class)streamablePayloadClass;
- (NSError)responseStatusError;
- (NSString)endpointIdentifier;
- (PDEndpointInfo)endpointInfo;
- (id)URL;
- (id)acceptContentType;
- (id)httpMethod;
- (id)parseResponseData;
- (id)parser;
- (id)requestContentType;
- (id)statusReport;
- (int64_t)getRetryAfterSeconds;
- (int64_t)streamablePayloadClassTagValue;
- (void)abort;
- (void)didCompleteProcessingResponse;
- (void)execute;
- (void)flushCachedData;
- (void)handleASMRefreshRequired;
- (void)handleBootstrapRequired;
- (void)handleCooldown;
- (void)handleExpiration;
- (void)handleRequestError;
- (void)handleResponseStatusErrors;
- (void)handleServerAlerts:(id)a3;
- (void)handleTransportServerErrors;
- (void)markAsFinished;
- (void)requestDidParseResponse:(id)a3;
- (void)setAuthHeadersForRequest:(id)a3;
- (void)setHeadersForRequest:(id)a3;
- (void)setResponseStatusError:(id)a3;
- (void)updateEndpointInfo;
@end

@implementation PDEndpointRequestOperation

+ (NSString)serviceID
{
  return (NSString *)&stru_1001F6580;
}

+ (id)defaultEndpointInfo
{
  return &__NSArray0__struct;
}

+ (BOOL)isEndpointAvailable:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned __int8 v7 = [v5 entityExistsByClass:objc_opt_class() identity:v6];

  return v7;
}

- (NSString)endpointIdentifier
{
  return (NSString *)&stru_1001F6580;
}

- (PDEndpointInfo)endpointInfo
{
  v3 = *(void **)((char *)&self->super._timeoutIntervalForRequest + 2);
  if (!v3)
  {
    v4 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    id v5 = [(PDOperation *)self database];
    uint64_t v6 = [v5 select:objc_opt_class() identity:v4];
    unsigned __int8 v7 = *(void **)((char *)&self->super._timeoutIntervalForRequest + 2);
    *(void *)((char *)&self->super._timeoutIntervalForRequest + 2) = v6;

    v8 = *(PDEndpointInfo **)((char *)&self->_endpointInfo + 2);
    *(PDEndpointInfo **)((char *)&self->_endpointInfo + 2) = 0;

    v3 = *(void **)((char *)&self->super._timeoutIntervalForRequest + 2);
  }

  return (PDEndpointInfo *)v3;
}

- (void)updateEndpointInfo
{
  if (![(PDAsyncOperation *)self didExecute]
    || ![(PDURLRequestOperation *)self urlRequestAttempted])
  {
    return;
  }
  uint64_t v4 = *(uint64_t *)((char *)&self->_endpointInfo + 2);
  if (!v4)
  {
    uint64_t v10 = [(PDURLRequestOperation *)self operationID];
    if (!v10) {
      return;
    }
    v2 = (void *)v10;
    if (!*(PDEndpointInfo **)((char *)&self->_endpointInfo + 2))
    {
LABEL_12:

      goto LABEL_14;
    }
  }
  uint64_t v5 = [(PDURLRequestOperation *)self operationID];
  if (!v5)
  {
    if (v4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  uint64_t v6 = (void *)v5;
  unsigned __int8 v7 = *(PDEndpointInfo **)((char *)&self->_endpointInfo + 2);
  v8 = [(PDURLRequestOperation *)self operationID];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if (v4)
  {
    if (v9) {
      return;
    }
  }
  else
  {

    if (v9) {
      return;
    }
  }
LABEL_14:
  v11 = [(PDURLRequestOperation *)self operationID];
  v12 = *(PDEndpointInfo **)((char *)&self->_endpointInfo + 2);
  *(PDEndpointInfo **)((char *)&self->_endpointInfo + 2) = v11;

  if ([(PDURLRequestOperation *)self urlRequestFailed]) {
    return;
  }
  id v32 = [(PDOperation *)self database];
  if (![(PDURLRequestOperation *)self httpRequestCompleted]) {
    goto LABEL_34;
  }
  int64_t v13 = [(PDURLRequestOperation *)self clsErrorCode];
  v14 = [(PDEndpointRequestOperation *)self endpointInfo];
  if (!v14)
  {
    v21 = 0;
LABEL_26:

    goto LABEL_27;
  }
  int v15 = v14[8];

  if (v15)
  {
    uint64_t v16 = [(PDURLRequestOperation *)self response];
    v17 = (void *)v16;
    uint64_t v19 = !v16 || (v18 = *(void **)(v16 + 56)) == 0 || [v18 statusCode] != (id)401;

    uint64_t v20 = [(PDEndpointRequestOperation *)self endpointInfo];
    v21 = (void *)v20;
    if (v20) {
      v22 = *(void **)(v20 + 40);
    }
    else {
      v22 = 0;
    }
    id v23 = v22;
    sub_100043D98((uint64_t)PDAccountInfo, v19, v23, 0);

    goto LABEL_26;
  }
LABEL_27:
  if ([(PDURLRequestOperation *)self httpRequestSucceeded])
  {
    v24 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    sub_1000DAF60(v32, v24);
  }
  else
  {
    if (v13 == 306)
    {
      uint64_t v25 = [(PDEndpointRequestOperation *)self getRetryAfterSeconds];
      if (v25 >= 1)
      {
        uint64_t v26 = v25;
        v27 = [(PDEndpointRequestOperation *)self endpointIdentifier];
        sub_1000DB330(v32, v27, v26);
      }
      goto LABEL_37;
    }
    v24 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    sub_1000DB0BC(v32, v24);
  }

LABEL_34:
  uint64_t v28 = [(PDOperation *)self operationError];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(PDOperation *)self operationError];
    id v31 = [v30 code];

    if (v31 == (id)307) {
      sub_1000DB264(v32, @"bootstrap");
    }
  }
LABEL_37:
}

- (id)parser
{
  v2 = [(PDEndpointRequestOperation *)self acceptContentType];
  v3 = v2;
  if (v2)
  {
    if ([v2 isEqualToString:@"application/x-protobuf"])
    {
      uint64_t v4 = off_1001F14A0;
LABEL_9:
      id v5 = objc_alloc_init(*v4);
      goto LABEL_11;
    }
    if ([v3 isEqualToString:@"application/json"])
    {
      uint64_t v4 = off_1001F1488;
      goto LABEL_9;
    }
    if (([v3 isEqualToString:@"text/xml"] & 1) != 0
      || [v3 isEqualToString:@"application/json"])
    {
      uint64_t v4 = &off_1001F14A8;
      goto LABEL_9;
    }
  }
  id v5 = 0;
LABEL_11:

  return v5;
}

- (id)parseResponseData
{
  if ([(PDOperation *)self isFinished])
  {
    v3 = 0;
    goto LABEL_12;
  }
  uint64_t v4 = [(PDURLRequestOperation *)self response];
  id v5 = sub_1001010EC(v4, @"Content-Type");

  if (v5 && ![(PDURLRequestOperation *)self willAcceptResponseContentType:v5])
  {
    id v16 = 0;
    +[NSError cls_assignError:&v16, 100, @"Unacceptable response content type %@.", v5 code format];
    id v9 = v16;
LABEL_8:
    CLSInitLog();
    uint64_t v10 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      id v12 = v11;
      int64_t v13 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543874;
      v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to parse response: %{public}@", buf, 0x20u);
    }
    [(PDURLRequestOperation *)self abortWithError:v9];
    v3 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [(PDEndpointRequestOperation *)self parser];
  unsigned __int8 v7 = [(PDURLRequestOperation *)self response];
  v8 = sub_100100EB0(v7);
  id v15 = 0;
  v3 = objc_msgSend(v6, "parseData:expectedClass:error:", v8, -[PDEndpointRequestOperation expectedResponseClass](self, "expectedResponseClass"), &v15);
  id v9 = v15;

  if (!v3) {
    goto LABEL_8;
  }
LABEL_11:

LABEL_12:

  return v3;
}

- (BOOL)parseStreamedResponse:(id)a3
{
  id v4 = a3;
  id v5 = +[PDUserDefaults sharedDefaults];
  unsigned int v6 = [v5 enableVerboseLogging];

  if (v6)
  {
    CLSInitLog();
    unsigned __int8 v7 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v12 = objc_opt_class();
      id v13 = v12;
      v14 = [(PDURLRequestOperation *)self operationID];
      NSStringFromClass([(PDEndpointRequestOperation *)self streamablePayloadClass]);
      id v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      id v32 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ streamed response processing for payloads of type %@.", buf, 0x20u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v32 = sub_10000B7B4;
  v33 = sub_10000B5F4;
  id v34 = 0;
  v8 = [(PDOperation *)self database];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10012D790;
  v21[3] = &unk_1001F2E38;
  id v9 = v4;
  id v22 = v9;
  id v23 = self;
  v24 = buf;
  if (v8
    && (unsigned __int8 v10 = [v8 performTransaction:v21 forWriting:1],
        v8,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    CLSInitLog();
    id v16 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (id)objc_opt_class();
      v18 = [(PDURLRequestOperation *)self operationID];
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v25 = 138543874;
      id v26 = v17;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@ streamed response processing failed. error: %@", v25, 0x20u);
    }
    BOOL v11 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v11;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)processPayloadWithinWriteTransaction:(id)a3 error:(id *)a4 stop:(BOOL *)a5
{
  return 0;
}

- (void)setHeadersForRequest:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PDEndpointRequestOperation;
  [(PDURLRequestOperation *)&v16 setHeadersForRequest:v4];
  uint64_t v5 = *(void *)((char *)&self->super._timeoutIntervalForRequest + 2);
  if (v5)
  {
    unsigned int v6 = +[NSNumber numberWithDouble:*(double *)(v5 + 16)];
    unsigned __int8 v7 = [v6 stringValue];
    [v4 setValue:v7 forHTTPHeaderField:@"X-Apple-ClassKit-LastSuccessTime"];

    uint64_t v8 = *(void *)((char *)&self->super._timeoutIntervalForRequest + 2);
    if (v8) {
      double v9 = *(double *)(v8 + 24);
    }
    else {
      double v9 = 0.0;
    }
    unsigned __int8 v10 = +[NSNumber numberWithDouble:v9];
    BOOL v11 = [v10 stringValue];
    [v4 setValue:v11 forHTTPHeaderField:@"X-Apple-ClassKit-LastAttemptTime"];

    uint64_t v12 = *(void *)((char *)&self->super._timeoutIntervalForRequest + 2);
    if (v12) {
      uint64_t v13 = *(void *)(v12 + 32);
    }
    else {
      uint64_t v13 = 0;
    }
    v14 = +[NSNumber numberWithInteger:v13];
    id v15 = [v14 stringValue];
    [v4 setValue:v15 forHTTPHeaderField:@"X-Apple-ClassKit-AttemptCount"];
  }
}

- (void)setAuthHeadersForRequest:(id)a3
{
  id v4 = a3;
  if (![(PDOperation *)self isAborted])
  {
    v84.receiver = self;
    v84.super_class = (Class)PDEndpointRequestOperation;
    [(PDURLRequestOperation *)&v84 setAuthHeadersForRequest:v4];
    uint64_t v5 = PDDPAdminRequestDetails;
    sub_1000062FC();
    unsigned int v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      goto LABEL_64;
    }
    uint64_t v7 = [(PDEndpointRequestOperation *)self endpointInfo];
    if (!v7) {
      goto LABEL_64;
    }
    id v8 = (id)v7;
    double v9 = [(PDEndpointRequestOperation *)self endpointInfo];
    if (!v9) {
      goto LABEL_63;
    }
    int v10 = v9[8];

    if (!v10)
    {
LABEL_64:

      goto LABEL_65;
    }
    uint64_t v11 = [(PDEndpointRequestOperation *)self endpointInfo];
    uint64_t v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = *(void **)(v11 + 40);
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;
    int v15 = sub_100044208((uint64_t)v6, v14);

    p_cache = PDFetchReportsOperation.cache;
    id v17 = +[PDUserDefaults sharedDefaults];
    LODWORD(v14) = [v17 enableVerboseLogging];

    if (v14)
    {
      CLSInitLog();
      v18 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v33 = objc_opt_class();
        id v34 = v33;
        v35 = [(PDURLRequestOperation *)self operationID];
        uint64_t v36 = [(PDEndpointRequestOperation *)self endpointInfo];
        v37 = (void *)v36;
        v81 = v34;
        if (v36) {
          v38 = *(void **)(v36 + 40);
        }
        else {
          v38 = 0;
        }
        id v39 = v38;
        *(_DWORD *)buf = 138544130;
        v86 = v33;
        __int16 v87 = 2114;
        v88 = v35;
        __int16 v89 = 2048;
        id v90 = (id)v15;
        __int16 v91 = 2112;
        id v92 = v39;
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ account authenticationState: %ld for %@", buf, 0x2Au);

        uint64_t v5 = PDDPAdminRequestDetails;
        p_cache = (void **)(PDFetchReportsOperation + 16);
      }
    }
    if (v15 == 1)
    {
      id v8 = +[NSError cls_createErrorWithCode:[(PDURLRequestOperation *)self clsErrorCodeForAuthenticationFailure] description:@"Aborting operation: credentials are known to be invalid."];
      uint64_t v19 = [(PDOperation *)self logSubsystem];
      objc_msgSend(v8, "cls_log:", v19);

      [(PDURLRequestOperation *)self abortWithError:v8];
LABEL_63:

      goto LABEL_64;
    }
    uint64_t v20 = [(PDEndpointRequestOperation *)self endpointInfo];
    __int16 v21 = (void *)v20;
    if (v20 && (id v22 = *(id *)(v20 + 40)) != 0)
    {
      id v23 = v22;
      uint64_t v24 = [(PDEndpointRequestOperation *)self endpointInfo];
      uint64_t v25 = (void *)v24;
      if (v24) {
        id v26 = *(void **)(v24 + 40);
      }
      else {
        id v26 = 0;
      }
      id v27 = v26;
      id v28 = [@"orion" caseInsensitiveCompare:v27];

      if (!v28)
      {
        __int16 v29 = [p_cache + 468 sharedDefaults];
        unsigned int v30 = [v29 enableVerboseLogging];

        if (!v30)
        {
          uint64_t v32 = 48;
LABEL_56:
          id v8 = *(id *)&v6[v32];
LABEL_57:
          if ([v8 length])
          {
            [v4 setValue:v8 forHTTPHeaderField:@"X-Apple-GS-Token"];
          }
          else
          {
            CLSInitLog();
            v62 = [(PDOperation *)self logSubsystem];
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              v69 = objc_opt_class();
              id v83 = v69;
              v70 = [(PDURLRequestOperation *)self operationID];
              uint64_t v71 = [(PDEndpointRequestOperation *)self endpointInfo];
              v72 = (void *)v71;
              v73 = v5;
              if (v71) {
                v74 = *(void **)(v71 + 40);
              }
              else {
                v74 = 0;
              }
              id v75 = v74;
              *(_DWORD *)buf = 138543874;
              v86 = v69;
              __int16 v87 = 2114;
              v88 = v70;
              __int16 v89 = 2114;
              id v90 = v75;
              _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Expected to find an auth token for service: %{public}@.", buf, 0x20u);

              uint64_t v5 = v73;
            }

            sub_100043B90((uint64_t)&v5[2], v6, 0);
            uint64_t v63 = [(PDEndpointRequestOperation *)self endpointInfo];
            v64 = (void *)v63;
            if (v63) {
              v65 = *(void **)(v63 + 56);
            }
            else {
              v65 = 0;
            }
            id v66 = v65;
            v67 = +[NSString stringWithFormat:@"Endpoint requires authentication and we have no token URL: %@", v66];
            v68 = +[NSError cls_createErrorWithCode:330 description:v67];

            [(PDURLRequestOperation *)self abortWithError:v68];
          }
          goto LABEL_63;
        }
        CLSInitLog();
        id v31 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v40 = objc_opt_class();
          id v41 = v40;
          v42 = [(PDURLRequestOperation *)self operationID];
          *(_DWORD *)buf = 138543618;
          v86 = v40;
          __int16 v87 = 2114;
          v88 = v42;
          _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ adding Schoolwork service auth token.", buf, 0x16u);
        }
        uint64_t v32 = 48;
LABEL_53:

        goto LABEL_56;
      }
    }
    else
    {
    }
    uint64_t v43 = [(PDEndpointRequestOperation *)self endpointInfo];
    v44 = (void *)v43;
    if (v43)
    {
      id v45 = *(id *)(v43 + 40);
      if (v45)
      {
        uint64_t v46 = [(PDEndpointRequestOperation *)self endpointInfo];
        v47 = (void *)v46;
        if (v46) {
          v48 = *(void **)(v46 + 40);
        }
        else {
          v48 = 0;
        }
        id v49 = v48;
        if (![@"apple_school_manager" caseInsensitiveCompare:v49])
        {

LABEL_49:
          v60 = [p_cache + 468 sharedDefaults];
          unsigned int v61 = [v60 enableVerboseLogging];

          if (!v61)
          {
            uint64_t v32 = 56;
            goto LABEL_56;
          }
          CLSInitLog();
          id v31 = [(PDOperation *)self logSubsystem];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v76 = objc_opt_class();
            id v77 = v76;
            v78 = [(PDURLRequestOperation *)self operationID];
            *(_DWORD *)buf = 138543618;
            v86 = v76;
            __int16 v87 = 2114;
            v88 = v78;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ adding AXM service auth token.", buf, 0x16u);
          }
          uint64_t v32 = 56;
          goto LABEL_53;
        }
        v79 = v49;
        v80 = v47;
        char v50 = 0;
LABEL_38:
        uint64_t v51 = [(PDEndpointRequestOperation *)self endpointInfo];
        v52 = (void *)v51;
        if (v51)
        {
          id v53 = *(id *)(v51 + 40);
          if (v53)
          {
            id v82 = v45;
            uint64_t v54 = [(PDEndpointRequestOperation *)self endpointInfo];
            v55 = (void *)v54;
            char v56 = v50;
            if (v54) {
              v57 = *(void **)(v54 + 40);
            }
            else {
              v57 = 0;
            }
            id v58 = v57;
            BOOL v59 = [@"apple_business_manager" caseInsensitiveCompare:v58] == 0;

            uint64_t v5 = PDDPAdminRequestDetails;
            char v50 = v56;
            id v45 = v82;
LABEL_46:

            if ((v50 & 1) == 0)
            {
            }
            p_cache = PDFetchReportsOperation.cache;
            if (!v59)
            {
              id v8 = 0;
              goto LABEL_57;
            }
            goto LABEL_49;
          }
        }
        else
        {
          id v53 = 0;
        }
        BOOL v59 = 0;
        goto LABEL_46;
      }
    }
    else
    {
      id v45 = 0;
    }
    char v50 = 1;
    goto LABEL_38;
  }
LABEL_65:
}

- (BOOL)shouldProcessResponseBody
{
  v5.receiver = self;
  v5.super_class = (Class)PDEndpointRequestOperation;
  BOOL v3 = [(PDURLRequestOperation *)&v5 shouldProcessResponseBody];
  if (v3)
  {
    BOOL v3 = [(PDURLRequestOperation *)self httpRequestCompleted];
    if (v3) {
      LOBYTE(v3) = [(PDURLRequestOperation *)self httpRequestSucceeded];
    }
  }
  return v3;
}

- (BOOL)processResponse:(id *)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    uint64_t v20 = 0;
    BOOL v3 = (id *)&v20;
  }
  objc_super v5 = [(PDEndpointRequestOperation *)self parser];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v6 = v5;
    objc_initWeak((id *)location, self);
    if ([(PDEndpointRequestOperation *)self canParseStreams])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10012E4FC;
      v18[3] = &unk_1001F5C70;
      objc_copyWeak(&v19, (id *)location);
      unsigned int v7 = sub_100082084(v6, self, v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)location);
      if (v7)
      {
        if ([(PDEndpointRequestOperation *)self parseStreamedResponse:v6]) {
          goto LABEL_16;
        }
        goto LABEL_13;
      }
    }
    else
    {
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  double v9 = [(PDEndpointRequestOperation *)self parseResponseData];
  id v17 = 0;
  unsigned __int8 v10 = [(PDEndpointRequestOperation *)self processResponseObject:v9 error:&v17];
  id v11 = v17;

  if (v11) {
    id *v3 = v11;
  }

  if ((v10 & 1) == 0)
  {
LABEL_13:
    CLSInitLog();
    uint64_t v12 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = v13;
      int v15 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v13;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to process response object.", location, 0x16u);
    }
  }
LABEL_16:

  return 1;
}

- (void)didCompleteProcessingResponse
{
  [(PDEndpointRequestOperation *)self handleResponseStatusErrors];
  [(PDEndpointRequestOperation *)self updateEndpointInfo];
  v3.receiver = self;
  v3.super_class = (Class)PDEndpointRequestOperation;
  [(PDURLRequestOperation *)&v3 didCompleteProcessingResponse];
}

- (void)execute
{
  if ([(PDOperation *)self isFinished]) {
    return;
  }
  objc_super v3 = [(PDEndpointRequestOperation *)self endpointInfo];

  if (!v3)
  {
    id v4 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    uint64_t v5 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    if (v5)
    {
      unsigned int v6 = (void *)v5;
      unsigned int v7 = [(PDEndpointRequestOperation *)self endpointIdentifier];
      unsigned int v8 = [v7 isEqualToString:@"bootstrap"];

      if (v8)
      {
        double v9 = PDOrionBootstrapOperation;
LABEL_10:
        int v15 = [(__objc2_class *)v9 defaultEndpointInfo];
        uint64_t v16 = [v15 objectAtIndexedSubscript:0];
        id v17 = *(void **)((char *)&self->super._timeoutIntervalForRequest + 2);
        *(void *)((char *)&self->super._timeoutIntervalForRequest + 2) = v16;

        goto LABEL_11;
      }
    }
    else
    {
    }
    unsigned __int8 v10 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    uint64_t v11 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      uint64_t v13 = [(PDEndpointRequestOperation *)self endpointIdentifier];
      unsigned int v14 = [v13 isEqualToString:@"ee.setup"];

      if (v14)
      {
        double v9 = PDASMBootstrapOperation;
        goto LABEL_10;
      }
    }
    else
    {
    }
    CLSInitLog();
    uint64_t v24 = [(PDOperation *)self logSubsystem];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
LABEL_23:

      [(PDEndpointRequestOperation *)self abort];
      return;
    }
    unsigned int v30 = objc_opt_class();
    id v26 = v30;
    id v27 = [(PDURLRequestOperation *)self operationID];
    id v28 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    *(_DWORD *)buf = 138543874;
    v33 = v30;
    __int16 v34 = 2114;
    v35 = v27;
    __int16 v36 = 2114;
    v37 = v28;
    __int16 v29 = "%{public}@: %{public}@ Unable to find endpoint info for '%{public}@'. cancelling request.";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v29, buf, 0x20u);

    goto LABEL_23;
  }
LABEL_11:
  v18 = [(PDEndpointRequestOperation *)self endpointInfo];
  BOOL v19 = sub_1000DA3C0((BOOL)v18);

  if (!v19
    || ([(PDEndpointRequestOperation *)self handleExpiration],
        ![(PDOperation *)self isFinished]))
  {
    uint64_t v20 = [(PDEndpointRequestOperation *)self endpointInfo];
    int v21 = sub_1000DA438((uint64_t)v20);

    if (!v21
      || ([(PDEndpointRequestOperation *)self handleCooldown],
          ![(PDOperation *)self isFinished]))
    {
      __int16 v22 = [(PDEndpointRequestOperation *)self endpointInfo];
      id v23 = sub_1000DA200(v22);

      if (v23)
      {
        v31.receiver = self;
        v31.super_class = (Class)PDEndpointRequestOperation;
        [(PDURLRequestOperation *)&v31 execute];
        return;
      }
      CLSInitLog();
      uint64_t v24 = [(PDOperation *)self logSubsystem];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      uint64_t v25 = objc_opt_class();
      id v26 = v25;
      id v27 = [(PDURLRequestOperation *)self operationID];
      id v28 = [(PDEndpointRequestOperation *)self endpointIdentifier];
      *(_DWORD *)buf = 138543874;
      v33 = v25;
      __int16 v34 = 2114;
      v35 = v27;
      __int16 v36 = 2114;
      v37 = v28;
      __int16 v29 = "%{public}@: %{public}@ Unable to find url for '%{public}@'.";
      goto LABEL_22;
    }
  }
}

- (void)handleExpiration
{
  CLSInitLog();
  objc_super v3 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    id v5 = v4;
    unsigned int v6 = [(PDURLRequestOperation *)self operationID];
    unsigned int v7 = [(PDEndpointRequestOperation *)self endpointIdentifier];
    int v8 = 138543874;
    double v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Unable to make endpoint request for '%{public}@'. Endpoint is throttled.", (uint8_t *)&v8, 0x20u);
  }
  [(PDEndpointRequestOperation *)self markAsFinished];
}

- (void)handleRequestError
{
  [(PDEndpointRequestOperation *)self handleTransportServerErrors];
  v3.receiver = self;
  v3.super_class = (Class)PDEndpointRequestOperation;
  [(PDURLRequestOperation *)&v3 handleRequestError];
}

- (void)handleCooldown
{
  objc_super v3 = [(PDEndpointRequestOperation *)self endpointInfo];
  if (v3) {
    BOOL v4 = v3[4] == 0;
  }
  else {
    BOOL v4 = 1;
  }

  uint64_t v5 = [(PDEndpointRequestOperation *)self endpointIdentifier];
  unsigned int v6 = (void *)v5;
  CFStringRef v7 = @"Endpoint is on cooldown.";
  if (v4)
  {
    CFStringRef v7 = @"Server is busy.";
    uint64_t v8 = 306;
  }
  else
  {
    uint64_t v8 = 305;
  }
  id v11 = +[NSString stringWithFormat:@"Unable to make '%@' request. %@", v5, v7];

  double v9 = +[NSError cls_createErrorWithCode:v8 description:v11];
  __int16 v10 = [(PDOperation *)self logSubsystem];
  objc_msgSend(v9, "cls_info:", v10);

  [(PDOperation *)self finishWithError:v9];
}

- (int64_t)getRetryAfterSeconds
{
  v2 = [(PDURLRequestOperation *)self response];
  objc_super v3 = sub_1001010EC(v2, @"Retry-After");

  id v4 = [v3 integerValue];
  return (int64_t)v4;
}

- (void)handleTransportServerErrors
{
  if ((id)[(PDURLRequestOperation *)self clsErrorCode] == (id)306)
  {
    uint64_t v3 = [(PDEndpointRequestOperation *)self getRetryAfterSeconds];
    if (v3 >= 1)
    {
      uint64_t v4 = v3;
      CLSInitLog();
      uint64_t v5 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v6 = objc_opt_class();
        id v7 = v6;
        uint64_t v8 = [(PDURLRequestOperation *)self operationID];
        int v9 = 138543874;
        __int16 v10 = v6;
        __int16 v11 = 2114;
        __int16 v12 = v8;
        __int16 v13 = 2048;
        uint64_t v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Server is busy. Retry in %ld seconds.", (uint8_t *)&v9, 0x20u);
      }
    }
  }
}

- (void)setResponseStatusError:(id)a3
{
  id v5 = a3;
  unsigned int v6 = (id *)((char *)&self->_lastOperationIDChecked + 2);
  id v9 = v5;
  if (v5)
  {
    objc_storeStrong(v6, a3);
    id v7 = [v9 code];
  }
  else
  {
    id v8 = *v6;
    *unsigned int v6 = 0;

    id v7 = 0;
  }
  [(PDURLRequestOperation *)self setClsErrorCode:v7];
}

- (void)handleResponseStatusErrors
{
  uint64_t v3 = [(PDEndpointRequestOperation *)self responseStatusError];

  if (v3)
  {
    uint64_t v4 = [(PDEndpointRequestOperation *)self responseStatusError];
    id v5 = [v4 code];

    if (v5 == (id)310)
    {
      [(PDEndpointRequestOperation *)self handleASMRefreshRequired];
    }
    else if (v5 == (id)309)
    {
      [(PDEndpointRequestOperation *)self handleBootstrapRequired];
    }
  }
}

- (void)flushCachedData
{
  v4.receiver = self;
  v4.super_class = (Class)PDEndpointRequestOperation;
  [(PDURLRequestOperation *)&v4 flushCachedData];
  uint64_t v3 = *(void **)((char *)&self->super._timeoutIntervalForRequest + 2);
  *(double *)((char *)&self->super._timeoutIntervalForRequest + 2) = 0.0;
}

- (void)abort
{
  [(PDEndpointRequestOperation *)self updateEndpointInfo];
  v3.receiver = self;
  v3.super_class = (Class)PDEndpointRequestOperation;
  [(PDURLRequestOperation *)&v3 abort];
}

- (void)markAsFinished
{
  [(PDEndpointRequestOperation *)self updateEndpointInfo];
  v3.receiver = self;
  v3.super_class = (Class)PDEndpointRequestOperation;
  [(PDURLRequestOperation *)&v3 markAsFinished];
}

- (BOOL)hasReachedRequestPayloadLimitBytes:(unint64_t)a3 count:(int64_t)a4
{
  unsigned int v6 = [(PDEndpointRequestOperation *)self endpointInfo];
  BOOL v11 = 0;
  if (v6)
  {
    int64_t v7 = v6[9];
    BOOL v8 = v7 < 1 || v7 > a3;
    if (!v8 || ((int64_t v9 = v6[8], v9 >= 1) ? (v10 = v9 <= a4) : (v10 = 0), v10)) {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (void)handleBootstrapRequired
{
  id v5 = [(PDOperation *)self database];
  CLSInitLog();
  unsigned int v6 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = objc_opt_class();
    id v21 = v20;
    __int16 v22 = [(PDURLRequestOperation *)self operationID];
    uint64_t v23 = [(PDEndpointRequestOperation *)self endpointInfo];
    uint64_t v24 = (void *)v23;
    if (v23) {
      uint64_t v25 = *(void **)(v23 + 40);
    }
    else {
      uint64_t v25 = 0;
    }
    id v26 = v25;
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v20;
    __int16 v55 = 2114;
    char v56 = v22;
    __int16 v57 = 2112;
    id v58 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Bootstrap required for %@", buf, 0x20u);
  }
  uint64_t v7 = [(PDEndpointRequestOperation *)self endpointInfo];
  BOOL v8 = (void *)v7;
  if (v7) {
    int64_t v9 = *(void **)(v7 + 40);
  }
  else {
    int64_t v9 = 0;
  }
  id v10 = v9;
  uint64_t v11 = [(PDEndpointRequestOperation *)self endpointInfo];
  __int16 v12 = (void *)v11;
  if (v11 && (id v13 = *(id *)(v11 + 40)) != 0)
  {
    uint64_t v14 = v13;
    uint64_t v15 = [(PDEndpointRequestOperation *)self endpointInfo];
    uint64_t v16 = (void *)v15;
    if (v15) {
      id v17 = *(void **)(v15 + 40);
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    id v2 = [v18 isEqualToString:@"orion"];

    if (v2)
    {
      BOOL v19 = @"bootstrap";
LABEL_43:
      sub_1000DB264(v5, v19);
      goto LABEL_44;
    }
  }
  else
  {
  }
  uint64_t v27 = [(PDEndpointRequestOperation *)self endpointInfo];
  id v28 = (void *)v27;
  if (v27) {
    __int16 v29 = *(void **)(v27 + 40);
  }
  else {
    __int16 v29 = 0;
  }
  id v30 = v29;
  uint64_t v31 = [(PDEndpointRequestOperation *)self endpointInfo];
  uint64_t v32 = (void *)v31;
  if (!v31)
  {
    v52 = v5;
    id v33 = 0;
    goto LABEL_24;
  }
  id v33 = *(id *)(v31 + 40);
  if (!v33)
  {
    v52 = v5;
LABEL_24:
    char v51 = 1;
    goto LABEL_26;
  }
  uint64_t v34 = [(PDEndpointRequestOperation *)self endpointInfo];
  id v2 = (id)v34;
  if (v34) {
    v35 = *(void **)(v34 + 40);
  }
  else {
    v35 = 0;
  }
  id v3 = v35;
  if (([v3 isEqualToString:@"apple_school_manager"] & 1) == 0)
  {
    v52 = v5;
    char v51 = 0;
LABEL_26:
    uint64_t v37 = [(PDEndpointRequestOperation *)self endpointInfo];
    v38 = (void *)v37;
    if (v37) {
      id v39 = *(void **)(v37 + 40);
    }
    else {
      id v39 = 0;
    }
    id v50 = v39;
    uint64_t v40 = [(PDEndpointRequestOperation *)self endpointInfo];
    id v41 = (void *)v40;
    if (v40)
    {
      id v42 = *(id *)(v40 + 40);
      if (v42)
      {
        id v48 = v3;
        id v49 = v2;
        uint64_t v43 = [(PDEndpointRequestOperation *)self endpointInfo];
        v44 = (void *)v43;
        id v45 = v30;
        if (v43) {
          uint64_t v46 = *(void **)(v43 + 40);
        }
        else {
          uint64_t v46 = 0;
        }
        id v47 = v46;
        unsigned int v36 = [v47 isEqualToString:@"apple_business_manager"];

        id v30 = v45;
        id v3 = v48;
        id v2 = v49;
LABEL_39:

        id v5 = v52;
        if (v51) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
    }
    else
    {
      id v42 = 0;
    }
    unsigned int v36 = 0;
    goto LABEL_39;
  }
  unsigned int v36 = 1;
LABEL_40:

LABEL_41:
  if (v36)
  {
    BOOL v19 = @"ee.setup";
    goto LABEL_43;
  }
LABEL_44:
}

- (void)handleASMRefreshRequired
{
  id v6 = [(PDOperation *)self database];
  sub_10015FEC4(v6, 1, @"asmRefreshRequested");
  sub_1000DB264(v6, @"ee.setup");
  id v3 = +[NSError cls_createErrorWithCode:310 description:@"Refresh required for ASM roster data."];
  objc_super v4 = [(PDOperation *)self logSubsystem];
  objc_msgSend(v3, "cls_notice:", v4);

  [(PDOperation *)self finishWithError:v3];
  id v5 = [(PDOperation *)self manager];
  sub_100003784(v5, 0);
}

- (void)handleServerAlerts:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [(PDOperation *)self database];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          __int16 v12 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v11);
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = objc_msgSend(v12, "objectID", (void)v17);
          uint64_t v15 = [v6 select:v13 identity:v14];

          if (v15 && (uint64_t)[v15 displayedCount] >= 1) {
            objc_msgSend(v12, "setDisplayedCount:", objc_msgSend(v15, "displayedCount"));
          }
          [v6 insertOrUpdateObject:v12];

          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    uint64_t v16 = +[NSNotificationCenter defaultCenter];
    [v16 postNotificationName:CLSServerAlertReceivedNotificationName object:0 userInfo:0];
  }
}

- (BOOL)checkForMissingEntityWithObjectID:(id)a3 forClass:(Class)a4 fromEntityWithID:(id)a5 withClass:(Class)a6
{
  id v10 = a3;
  id v11 = a5;
  if (v10 && [v10 length])
  {
    __int16 v12 = [(PDOperation *)self database];
    unsigned __int8 v13 = [v12 entityExistsByClass:a4 identity:v10];
    if ((v13 & 1) == 0)
    {
      CLSInitLog();
      uint64_t v14 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = objc_opt_class();
        id v24 = v15;
        uint64_t v16 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138544130;
        id v26 = v15;
        __int16 v27 = 2114;
        id v28 = v16;
        __int16 v29 = 2114;
        id v30 = v10;
        __int16 v31 = 2114;
        Class v32 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Detected reference to missing objectID = %{public}@ (%{public}@).", buf, 0x2Au);
      }
      long long v17 = sub_100170BF0((id *)[PDMissingEntityReference alloc], v10, a4, v11, a6);
      if (([v12 insertOrUpdateObject:v17] & 1) == 0)
      {
        CLSInitLog();
        long long v18 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          long long v19 = objc_opt_class();
          id v20 = v19;
          id v21 = [(PDURLRequestOperation *)self operationID];
          *(_DWORD *)buf = 138544130;
          id v26 = v19;
          __int16 v27 = 2114;
          id v28 = v21;
          __int16 v29 = 2114;
          id v30 = v10;
          __int16 v31 = 2114;
          Class v32 = a4;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Failed to save reference to missing objectID = %{public}@ (%{public}@).", buf, 0x2Au);
        }
      }
    }
    char v22 = v13 ^ 1;
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (id)httpMethod
{
  return @"POST";
}

- (BOOL)requiresAuth
{
  id v2 = [(PDEndpointRequestOperation *)self endpointInfo];
  if (v2) {
    BOOL v3 = v2[8] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)requestContentType
{
  return 0;
}

- (id)acceptContentType
{
  return 0;
}

- (void)requestDidParseResponse:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)URL
{
  uint64_t v3 = [(PDEndpointRequestOperation *)self endpointInfo];
  id v4 = sub_1000DA200((void *)v3);
  if (!v4)
  {
    id v5 = [(PDOperation *)self database];
    id v6 = v5;
    if (v3)
    {
      if (([v5 deleteObject:v3] & 1) == 0)
      {
        CLSInitLog();
        id v7 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v13 = *(id *)(v3 + 48);
          *(_DWORD *)buf = 138543362;
          id v15 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to delete endpoint '%{public}@' from local database", buf, 0xCu);
        }
      }
      id v8 = *(void **)(v3 + 56);
    }
    else
    {
      id v8 = 0;
    }
    id v9 = v8;
    id v10 = +[NSString stringWithFormat:@"EndpointInfo has invalid URL: %@", v9];
    id v11 = +[NSError cls_createErrorWithCode:307 description:v10];

    [(PDURLRequestOperation *)self abortWithError:v11];
  }

  return v4;
}

- (id)statusReport
{
  v16.receiver = self;
  v16.super_class = (Class)PDEndpointRequestOperation;
  uint64_t v3 = [(PDURLRequestOperation *)&v16 statusReport];
  id v4 = [(PDEndpointRequestOperation *)self endpointIdentifier];
  id v5 = [(PDOperation *)self database];
  uint64_t v6 = [v5 select:objc_opt_class() identity:v4];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = *(void **)(v6 + 40);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  [v3 setObject:v9 forKeyedSubscript:@"serviceID"];

  [v3 setObject:v4 forKeyedSubscript:@"endpointIdentifier"];
  id v10 = +[NSNumber numberWithBool:sub_1000DA3C0(v7)];
  [v3 setObject:v10 forKeyedSubscript:@"isExpired"];

  id v11 = +[NSNumber numberWithBool:sub_1000DA438(v7)];
  [v3 setObject:v11 forKeyedSubscript:@"needsCooldown"];

  double v12 = 0.0;
  if (v7)
  {
    if (*(double *)(v7 + 24) != 0.0)
    {
      uint64_t v13 = *(void *)(v7 + 32);
      if (v13) {
        double v12 = exp2((double)v13);
      }
    }
  }
  uint64_t v14 = +[NSNumber numberWithDouble:v12];
  [v3 setObject:v14 forKeyedSubscript:@"cooldownPeriod"];

  return v3;
}

- (BOOL)canParseStreams
{
  uint64_t v3 = +[PDUserDefaults sharedDefaults];
  BOOL v4 = [v3 enableResponseStreaming]
    && [(PDEndpointRequestOperation *)self streamablePayloadClass]
    && [(PDEndpointRequestOperation *)self streamablePayloadClassTagValue] > 0;

  return v4;
}

- (BOOL)readStreamablePayload:(id)a3 reader:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  CLSInitLog();
  id v9 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543618;
    CFStringRef v13 = @"[PDEndpointRequestOperation readStreamablePayload] must be overriden by its subclass";
    __int16 v14 = 2112;
    id v15 = (id)objc_opt_class();
    id v10 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@  (%@)", (uint8_t *)&v12, 0x16u);
  }
  id v11 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"[PDEndpointRequestOperation readStreamablePayload] must be overriden by its subclass" userInfo:0];
  objc_exception_throw(v11);
}

- (Class)expectedResponseClass
{
  CLSInitLog();
  uint64_t v3 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    CFStringRef v7 = @"[PDEndpointRequestOperation expectedResponseClass] must be overriden by its subclass";
    __int16 v8 = 2112;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@  (%@)", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"[PDEndpointRequestOperation expectedResponseClass] must be overriden by its subclass" userInfo:0];
  objc_exception_throw(v5);
}

- (Class)streamablePayloadClass
{
  return 0;
}

- (int64_t)streamablePayloadClassTagValue
{
  return -1;
}

- (NSError)responseStatusError
{
  return *(NSError **)((char *)&self->_lastOperationIDChecked + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_lastOperationIDChecked + 2), 0);
  objc_storeStrong((id *)((char *)&self->_endpointInfo + 2), 0);

  objc_storeStrong((id *)((char *)&self->super._timeoutIntervalForRequest + 2), 0);
}

@end