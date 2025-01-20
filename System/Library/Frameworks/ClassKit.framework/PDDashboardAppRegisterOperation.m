@interface PDDashboardAppRegisterOperation
+ (id)serviceID;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (Class)expectedResponseClass;
- (NSMutableArray)appIdentifiersInRequest;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)httpMethod;
- (id)requestContentType;
- (id)requestData;
- (void)setAppIdentifiersInRequest:(id)a3;
@end

@implementation PDDashboardAppRegisterOperation

+ (id)serviceID
{
  return @"orion";
}

- (id)endpointIdentifier
{
  return @"registerDashboardApp";
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted])
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc_init(PDDPRegisterDashboardAppRequest);
    v5 = [(PDOperation *)self database];
    uint64_t v6 = objc_opt_class();
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000618C4;
    v32[3] = &unk_1001F32F0;
    v7 = v4;
    v33 = v7;
    v34 = self;
    [v5 selectAll:v6 block:v32];

    if ([(PDDPRegisterDashboardAppRequest *)v7 dashboardAppsCount])
    {
      id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[PDDPRegisterDashboardAppRequest dashboardAppsCount](v7, "dashboardAppsCount"));
      [(PDDashboardAppRegisterOperation *)self setAppIdentifiersInRequest:v8];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v9 = [(PDDPRegisterDashboardAppRequest *)v7 dashboardApps];
      id v10 = [v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v29;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v15 = [(PDDashboardAppRegisterOperation *)self appIdentifiersInRequest];
            v16 = [v14 appIdentifier];
            [v15 addObject:v16];
          }
          id v11 = [v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
        }
        while (v11);
      }

      CLSInitLog();
      v17 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_opt_class();
        id v19 = v18;
        v20 = [(PDURLRequestOperation *)self operationID];
        v21 = [(PDDPRegisterDashboardAppRequest *)v7 data];
        id v22 = [v21 length];
        *(_DWORD *)buf = 138543874;
        v36 = v18;
        __int16 v37 = 2114;
        v38 = v20;
        __int16 v39 = 2048;
        id v40 = v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ request payload size %ld bytes", buf, 0x20u);
      }
      v3 = [(PDDPRegisterDashboardAppRequest *)v7 data];
    }
    else
    {
      CLSInitLog();
      v23 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_opt_class();
        id v25 = v24;
        v26 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138543618;
        v36 = v24;
        __int16 v37 = 2114;
        v38 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ request no pending register.", buf, 0x16u);
      }
      [(PDEndpointRequestOperation *)self markAsFinished];
      v3 = 0;
    }
  }

  return v3;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDOperation *)self isAborted])
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    CLSInitLog();
    id v8 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      id v11 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ processing response;",
        buf,
        0x16u);
    }
    CLSInitLog();
    uint64_t v12 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      long long v28 = objc_opt_class();
      id v29 = v28;
      long long v30 = [(PDURLRequestOperation *)self operationID];
      long long v31 = [v6 dictionaryRepresentation];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2112;
      v47 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ response data: %@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v47 = sub_10000B674;
    v48 = sub_10000B554;
    id v49 = [(PDURLRequestOperation *)self operationID];
    v13 = [(PDURLRequestOperation *)self stats];
    if (v13) {
      v13[15] = 1;
    }

    if (![v6 hasStatus]) {
      goto LABEL_15;
    }
    v14 = [v6 status];
    v15 = sub_1000F5844(v14);
    [(PDEndpointRequestOperation *)self handleServerAlerts:v15];

    v16 = [v6 status];
    sub_1000F51A0(v16, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      CLSInitLog();
      v18 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = (id)objc_opt_class();
        uint64_t v20 = *(void *)(*(void *)&buf[8] + 40);
        v21 = [v6 status];
        id v22 = [v21 code];
        id v23 = v22;
        if ((int)v22 > 299)
        {
          switch((int)v22)
          {
            case 800:
              v24 = @"E_NOT_APPLICABLE_TYPE";
              break;
            case 801:
              v24 = @"E_ENTITY_NOT_FOUND";
              break;
            case 802:
              v24 = @"E_ENTITY_PRIVILEGE_CHANGE";
              break;
            case 803:
              v24 = @"E_MUST_ACCEPT_TERMS";
              break;
            case 804:
              v24 = @"E_ENTITY_EXPIRED";
              break;
            case 805:
              v24 = @"E_NOT_ALLOWED_FEDERATED_ORGANIZATION";
              break;
            case 806:
              v24 = @"E_DISALLOWED_EMAIL_DOMAIN";
              break;
            default:
              if (v22 == 300)
              {
                v24 = @"E_DEVICE_UNSUPPORTED";
              }
              else if (v22 == 500)
              {
                v24 = @"E_INVALID_FIELD_VALUE";
              }
              else
              {
LABEL_39:
                v24 = +[NSString stringWithFormat:@"(unknown: %i)", v23];
              }
              break;
          }
        }
        else
        {
          switch((int)v22)
          {
            case 'd':
              v24 = @"E_BOOTSTRAP_REQUIRED";
              break;
            case 'e':
              v24 = @"E_AUTHENTICATION_FAILED";
              break;
            case 'f':
              v24 = @"E_NOT_AUTHORIZED";
              break;
            case 'g':
              v24 = @"E_MESCAL_SIGNATURE_REQUIRED";
              break;
            case 'h':
              v24 = @"E_MESCAL_BAD_SIGNATURE";
              break;
            case 'i':
              v24 = @"E_MESCAL_PARSE_ERROR";
              break;
            case 'j':
              v24 = @"E_BAD_REQUEST";
              break;
            case 'k':
              v24 = @"E_BAD_PROTOCOL_VERSION";
              break;
            case 'l':
              v24 = @"E_REQUEST_TOO_LARGE";
              break;
            case 'm':
              v24 = @"E_REQUEST_TOO_MANY_ITEMS";
              break;
            case 'n':
              v24 = @"E_SERVER_BUSY";
              break;
            case 'o':
              v24 = @"E_ACCESS_DENIED";
              break;
            case 'p':
              v24 = @"E_CONFLICT";
              break;
            case 'q':
              v24 = @"E_INVALID_STATE";
              break;
            case 'r':
              v24 = @"E_LOCK_TAKEN";
              break;
            case 's':
              v24 = @"E_DOWNSTREAM_SERVICE_FAILED";
              break;
            case 't':
              v24 = @"E_DOWNSTREAM_SERVICE_THROTTLED";
              break;
            case 'u':
              v24 = @"E_DRIVE_USER_QUOTA_EXCEEDED";
              break;
            case 'v':
              v24 = @"E_DRIVE_GROUP_QUOTA_EXCEEDED";
              break;
            case 'w':
              v24 = @"E_DRIVE_ORG_QUOTA_EXCEEDED";
              break;
            case 'x':
              v24 = @"E_RECORD_LIMIT_EXCEEDED";
              break;
            case 'y':
              v24 = @"E_DISALLOWED_COUNTRY_CODE";
              break;
            default:
              v24 = @"UNKNOWN_CODE";
              switch((int)v23)
              {
                case 0:
                  goto LABEL_58;
                case 1:
                  v24 = @"S_OK";
                  break;
                case 2:
                  v24 = @"E_ERROR";
                  break;
                case 3:
                  v24 = @"S_MIXED_RESPONSE";
                  break;
                case 4:
                  v24 = @"S_OK_HAS_MORE_DATA";
                  break;
                case 5:
                  v24 = @"S_PROCESSING";
                  break;
                default:
                  goto LABEL_39;
              }
              break;
          }
        }
LABEL_58:
        v32 = v24;
        v33 = [v6 status];
        *(_DWORD *)v38 = 138544130;
        id v39 = v19;
        __int16 v40 = 2114;
        uint64_t v41 = v20;
        __int16 v42 = 2114;
        v43 = v32;
        __int16 v44 = 2048;
        uint64_t v45 = (int)[v33 code];
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Dashboard app register request failed. status: %{public}@ (%ld)", v38, 0x2Au);
      }
      if (a4)
      {
        id v17 = v17;
        unsigned __int8 v7 = 0;
        *a4 = v17;
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
    }
    else
    {
LABEL_15:
      [(PDOperation *)self database];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000621E4;
      v35[3] = &unk_1001F2E38;
      v35[4] = self;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      id v36 = v25;
      __int16 v37 = buf;
      if (v25)
      {
        unsigned __int8 v7 = [v25 performTransaction:v35 forWriting:1];
        v27 = v36;
      }
      else
      {
        v27 = 0;
        unsigned __int8 v7 = 0;
      }

      id v17 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  return v7;
}

- (id)httpMethod
{
  return @"POST";
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

- (NSMutableArray)appIdentifiersInRequest
{
  return *(NSMutableArray **)((char *)&self->super._responseStatusError + 2);
}

- (void)setAppIdentifiersInRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end