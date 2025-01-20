@interface PDUploadEventsOperation
+ (id)serviceID;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)wantsToExecute;
- (Class)expectedResponseClass;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (void)prepare;
@end

@implementation PDUploadEventsOperation

+ (id)serviceID
{
  return @"orion";
}

- (id)logSubsystem
{
  return CLSLogUpload;
}

- (id)endpointIdentifier
{
  return @"uploadEvents";
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
  if ([(PDOperation *)self isAborted]) {
    return 0;
  }
  v4 = [(PDOperation *)self database];
  id v5 = [v4 count:objc_opt_class() where:0 bindings:0];

  return (uint64_t)v5 > 0;
}

- (void)prepare
{
  v2.receiver = self;
  v2.super_class = (Class)PDUploadEventsOperation;
  [(PDAsyncOperation *)&v2 prepare];
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(PDURLRequestOperation *)self stats];
    if (v4) {
      v4[14] = 0;
    }

    id v5 = objc_alloc_init((Class)PBDataWriter);
    v6 = objc_alloc_init(PDDPUploadEventsRequest);
    v7 = [(PDOperation *)self database];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [(PDEndpointRequestOperation *)self endpointInfo];
    v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = *(void *)(v9 + 64);
    }
    else {
      uint64_t v11 = 0;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000D6640;
    v17[3] = &unk_1001F4508;
    v17[4] = self;
    v18 = v6;
    id v12 = v5;
    id v19 = v12;
    v13 = v6;
    [v7 selectAll:v8 where:0 orderBy:@"dateCreated asc" limit:v11 offset:0 bindings:0 block:v17];

    v14 = [(PDURLRequestOperation *)self stats];
    if (v14 && (uint64_t v15 = v14[14], v14, v15))
    {
      v3 = [v12 immutableData];
    }
    else
    {
      [(PDEndpointRequestOperation *)self markAsFinished];
      v3 = 0;
    }
  }

  return v3;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [(PDOperation *)self isAborted];
  unsigned __int8 v7 = v6;
  if ((v6 & 1) == 0)
  {
    unsigned __int8 v42 = v6;
    uint64_t v8 = [(PDOperation *)self database];
    CLSInitLog();
    uint64_t v9 = [(PDUploadEventsOperation *)self logSubsystem];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      id v12 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543618;
      id v52 = v10;
      __int16 v53 = 2114;
      v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ processing response;",
        buf,
        0x16u);
    }
    CLSInitLog();
    v13 = [(PDUploadEventsOperation *)self logSubsystem];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v37 = objc_opt_class();
      id v38 = v37;
      v39 = [(PDURLRequestOperation *)self operationID];
      v40 = [v5 dictionaryRepresentation];
      *(_DWORD *)buf = 138543874;
      id v52 = v37;
      __int16 v53 = 2114;
      v54 = v39;
      __int16 v55 = 2112;
      v56 = v40;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ response data: %@", buf, 0x20u);
    }
    v45 = [(PDURLRequestOperation *)self operationID];
    v14 = [v5 eventItems];
    id v15 = [v14 count];
    v16 = [(PDURLRequestOperation *)self stats];
    if (v16) {
      v16[15] = v15;
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v41 = v5;
    v17 = [v5 eventItems];
    id v18 = [v17 countByEnumeratingWithState:&v46 objects:v59 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v47;
      v43 = v17;
      v44 = v8;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v24 = [v22 status];
          unsigned int v25 = [v24 code];

          if (v25 == 1)
          {
            uint64_t v26 = objc_opt_class();
            v27 = [v22 objectId];
            v50 = v27;
            v28 = +[NSArray arrayWithObjects:&v50 count:1];
            LOBYTE(v26) = [v8 deleteAll:v26 where:@"objectID = ?" bindings:v28];

            if (v26) {
              goto LABEL_65;
            }
          }
          else
          {
            CLSInitLog();
            v29 = [(PDUploadEventsOperation *)self logSubsystem];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = (id)objc_opt_class();
              v31 = [v22 objectId];
              v32 = [v22 status];
              id v33 = [v32 code];
              if ((int)v33 > 299)
              {
                switch((int)v33)
                {
                  case 800:
                    v34 = @"E_NOT_APPLICABLE_TYPE";
                    break;
                  case 801:
                    v34 = @"E_ENTITY_NOT_FOUND";
                    break;
                  case 802:
                    v34 = @"E_ENTITY_PRIVILEGE_CHANGE";
                    break;
                  case 803:
                    v34 = @"E_MUST_ACCEPT_TERMS";
                    break;
                  case 804:
                    v34 = @"E_ENTITY_EXPIRED";
                    break;
                  case 805:
                    v34 = @"E_NOT_ALLOWED_FEDERATED_ORGANIZATION";
                    break;
                  case 806:
                    v34 = @"E_DISALLOWED_EMAIL_DOMAIN";
                    break;
                  default:
                    if (v33 == 300)
                    {
                      v34 = @"E_DEVICE_UNSUPPORTED";
                    }
                    else if (v33 == 500)
                    {
                      v34 = @"E_INVALID_FIELD_VALUE";
                    }
                    else
                    {
LABEL_59:
                      v34 = +[NSString stringWithFormat:@"(unknown: %i)", v33];
                    }
                    break;
                }
              }
              else
              {
                switch((int)v33)
                {
                  case 'd':
                    v34 = @"E_BOOTSTRAP_REQUIRED";
                    break;
                  case 'e':
                    v34 = @"E_AUTHENTICATION_FAILED";
                    break;
                  case 'f':
                    v34 = @"E_NOT_AUTHORIZED";
                    break;
                  case 'g':
                    v34 = @"E_MESCAL_SIGNATURE_REQUIRED";
                    break;
                  case 'h':
                    v34 = @"E_MESCAL_BAD_SIGNATURE";
                    break;
                  case 'i':
                    v34 = @"E_MESCAL_PARSE_ERROR";
                    break;
                  case 'j':
                    v34 = @"E_BAD_REQUEST";
                    break;
                  case 'k':
                    v34 = @"E_BAD_PROTOCOL_VERSION";
                    break;
                  case 'l':
                    v34 = @"E_REQUEST_TOO_LARGE";
                    break;
                  case 'm':
                    v34 = @"E_REQUEST_TOO_MANY_ITEMS";
                    break;
                  case 'n':
                    v34 = @"E_SERVER_BUSY";
                    break;
                  case 'o':
                    v34 = @"E_ACCESS_DENIED";
                    break;
                  case 'p':
                    v34 = @"E_CONFLICT";
                    break;
                  case 'q':
                    v34 = @"E_INVALID_STATE";
                    break;
                  case 'r':
                    v34 = @"E_LOCK_TAKEN";
                    break;
                  case 's':
                    v34 = @"E_DOWNSTREAM_SERVICE_FAILED";
                    break;
                  case 't':
                    v34 = @"E_DOWNSTREAM_SERVICE_THROTTLED";
                    break;
                  case 'u':
                    v34 = @"E_DRIVE_USER_QUOTA_EXCEEDED";
                    break;
                  case 'v':
                    v34 = @"E_DRIVE_GROUP_QUOTA_EXCEEDED";
                    break;
                  case 'w':
                    v34 = @"E_DRIVE_ORG_QUOTA_EXCEEDED";
                    break;
                  case 'x':
                    v34 = @"E_RECORD_LIMIT_EXCEEDED";
                    break;
                  case 'y':
                    v34 = @"E_DISALLOWED_COUNTRY_CODE";
                    break;
                  default:
                    v34 = @"UNKNOWN_CODE";
                    switch((int)v33)
                    {
                      case 0:
                        goto LABEL_60;
                      case 1:
                        v34 = @"S_OK";
                        break;
                      case 2:
                        v34 = @"E_ERROR";
                        break;
                      case 3:
                        v34 = @"S_MIXED_RESPONSE";
                        break;
                      case 4:
                        v34 = @"S_OK_HAS_MORE_DATA";
                        break;
                      case 5:
                        v34 = @"S_PROCESSING";
                        break;
                      default:
                        goto LABEL_59;
                    }
                    break;
                }
              }
LABEL_60:
              *(_DWORD *)buf = 138544130;
              id v52 = v30;
              __int16 v53 = 2114;
              v54 = v45;
              __int16 v55 = 2112;
              v56 = v31;
              __int16 v57 = 2112;
              v58 = v34;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Upload item %@ was rejected. status: %@", buf, 0x2Au);

              v17 = v43;
              uint64_t v8 = v44;
            }
          }
          v35 = [(PDURLRequestOperation *)self stats];
          if (v35) {
            ++v35[16];
          }

LABEL_65:
        }
        id v19 = [v17 countByEnumeratingWithState:&v46 objects:v59 count:16];
      }
      while (v19);
    }

    unsigned __int8 v7 = v42;
    id v5 = v41;
  }

  return v7 ^ 1;
}

@end