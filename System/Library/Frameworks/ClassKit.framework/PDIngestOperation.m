@interface PDIngestOperation
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

@implementation PDIngestOperation

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
  return @"ingest";
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
  v3 = [(PDOperation *)self database];
  BOOL v4 = sub_100066C68(v3);

  if (!v4) {
    [(PDEndpointRequestOperation *)self markAsFinished];
  }
  v5.receiver = self;
  v5.super_class = (Class)PDIngestOperation;
  [(PDAsyncOperation *)&v5 prepare];
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted])
  {
    v3 = 0;
  }
  else
  {
    BOOL v4 = [(PDURLRequestOperation *)self stats];
    if (v4) {
      v4[14] = 0;
    }

    id v5 = objc_alloc_init((Class)PBDataWriter);
    v6 = objc_alloc_init(PDDPIngestRequest);
    v7 = [(PDOperation *)self database];
    v8 = +[NSTimeZone localTimeZone];
    id v9 = [v8 secondsFromGMT];

    v10 = objc_opt_new();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [(PDEndpointRequestOperation *)self endpointInfo];
    v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = *(void *)(v12 + 64);
    }
    else {
      uint64_t v14 = 0;
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000D8DE8;
    v27[3] = &unk_1001F4558;
    v27[4] = self;
    id v15 = v7;
    id v28 = v15;
    id v32 = v9;
    id v16 = v10;
    id v29 = v16;
    v30 = v6;
    id v17 = v5;
    id v31 = v17;
    v18 = v6;
    [v15 selectAll:v11 where:0 orderBy:@"wasDeleted asc" limit:v14 offset:0 bindings:0 block:v27];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D9370;
    v24[3] = &unk_1001F1ED8;
    id v25 = v16;
    id v26 = v15;
    id v19 = v15;
    id v20 = v16;
    if (v19) {
      [v19 performTransaction:v24 forWriting:1];
    }
    v21 = [(PDURLRequestOperation *)self stats];
    if (v21 && (uint64_t v22 = v21[14], v21, v22))
    {
      v3 = [v17 immutableData];
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
  id v6 = a3;
  if (![(PDOperation *)self isAborted])
  {
    v8 = [(PDOperation *)self database];
    CLSInitLog();
    id v9 = [(PDIngestOperation *)self logSubsystem];
    v62 = self;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543618;
      id v71 = v10;
      __int16 v72 = 2114;
      v73 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ processing response;",
        buf,
        0x16u);

      self = v62;
    }

    CLSInitLog();
    v13 = [(PDIngestOperation *)self logSubsystem];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v51 = objc_opt_class();
      id v52 = v51;
      v53 = [(PDURLRequestOperation *)self operationID];
      v54 = [v6 dictionaryRepresentation];
      *(_DWORD *)buf = 138543874;
      id v71 = v51;
      __int16 v72 = 2114;
      v73 = v53;
      __int16 v74 = 2112;
      v75 = v54;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ response data: %@", buf, 0x20u);

      self = v62;
    }

    v63 = [(PDURLRequestOperation *)self operationID];
    if ([v6 hasStatus])
    {
      uint64_t v14 = [v6 status];
      id v15 = sub_1000F5844(v14);
      [(PDEndpointRequestOperation *)self handleServerAlerts:v15];

      id v16 = [v6 status];
      sub_1000F51A0(v16, 1);
      id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v17 || [(__CFString *)v17 code] == (id)9)
      {
        v58 = v17;
        v18 = [v6 items];
        id v19 = [v18 count];
        id v20 = [(PDURLRequestOperation *)self stats];
        if (v20) {
          v20[15] = v19;
        }

        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v61 = v6;
        v21 = [v6 items];
        id v22 = [v21 countByEnumeratingWithState:&v65 objects:v82 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v64 = *(void *)v66;
          v59 = v21;
          v60 = v8;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v66 != v64) {
                objc_enumerationMutation(v21);
              }
              id v25 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              v27 = [v25 status];
              unsigned int v28 = [v27 code];

              if (v28 == 1)
              {
                uint64_t v29 = objc_opt_class();
                v30 = [v25 objectId];
                v69 = v30;
                id v31 = +[NSArray arrayWithObjects:&v69 count:1];
                LOBYTE(v29) = [v8 deleteAll:v29 where:@"entityIdentity = ?" bindings:v31];

                if (v29) {
                  goto LABEL_72;
                }
              }
              else
              {
                CLSInitLog();
                id v32 = [(PDIngestOperation *)self logSubsystem];
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  id v33 = (id)objc_opt_class();
                  v34 = [v25 objectId];
                  id v35 = [v25 syncType];
                  if (v35 >= 5)
                  {
                    v36 = +[NSString stringWithFormat:@"(unknown: %i)", v35];
                  }
                  else
                  {
                    v36 = off_1001F4578[(int)v35];
                  }
                  v37 = v36;
                  v38 = [v25 status];
                  id v39 = [v38 code];
                  if ((int)v39 > 299)
                  {
                    switch((int)v39)
                    {
                      case 800:
                        v40 = @"E_NOT_APPLICABLE_TYPE";
                        break;
                      case 801:
                        v40 = @"E_ENTITY_NOT_FOUND";
                        break;
                      case 802:
                        v40 = @"E_ENTITY_PRIVILEGE_CHANGE";
                        break;
                      case 803:
                        v40 = @"E_MUST_ACCEPT_TERMS";
                        break;
                      case 804:
                        v40 = @"E_ENTITY_EXPIRED";
                        break;
                      case 805:
                        v40 = @"E_NOT_ALLOWED_FEDERATED_ORGANIZATION";
                        break;
                      case 806:
                        v40 = @"E_DISALLOWED_EMAIL_DOMAIN";
                        break;
                      default:
                        if (v39 == 300)
                        {
                          v40 = @"E_DEVICE_UNSUPPORTED";
                        }
                        else if (v39 == 500)
                        {
                          v40 = @"E_INVALID_FIELD_VALUE";
                        }
                        else
                        {
LABEL_66:
                          v40 = +[NSString stringWithFormat:@"(unknown: %i)", v39];
                        }
                        break;
                    }
                  }
                  else
                  {
                    switch((int)v39)
                    {
                      case 'd':
                        v40 = @"E_BOOTSTRAP_REQUIRED";
                        break;
                      case 'e':
                        v40 = @"E_AUTHENTICATION_FAILED";
                        break;
                      case 'f':
                        v40 = @"E_NOT_AUTHORIZED";
                        break;
                      case 'g':
                        v40 = @"E_MESCAL_SIGNATURE_REQUIRED";
                        break;
                      case 'h':
                        v40 = @"E_MESCAL_BAD_SIGNATURE";
                        break;
                      case 'i':
                        v40 = @"E_MESCAL_PARSE_ERROR";
                        break;
                      case 'j':
                        v40 = @"E_BAD_REQUEST";
                        break;
                      case 'k':
                        v40 = @"E_BAD_PROTOCOL_VERSION";
                        break;
                      case 'l':
                        v40 = @"E_REQUEST_TOO_LARGE";
                        break;
                      case 'm':
                        v40 = @"E_REQUEST_TOO_MANY_ITEMS";
                        break;
                      case 'n':
                        v40 = @"E_SERVER_BUSY";
                        break;
                      case 'o':
                        v40 = @"E_ACCESS_DENIED";
                        break;
                      case 'p':
                        v40 = @"E_CONFLICT";
                        break;
                      case 'q':
                        v40 = @"E_INVALID_STATE";
                        break;
                      case 'r':
                        v40 = @"E_LOCK_TAKEN";
                        break;
                      case 's':
                        v40 = @"E_DOWNSTREAM_SERVICE_FAILED";
                        break;
                      case 't':
                        v40 = @"E_DOWNSTREAM_SERVICE_THROTTLED";
                        break;
                      case 'u':
                        v40 = @"E_DRIVE_USER_QUOTA_EXCEEDED";
                        break;
                      case 'v':
                        v40 = @"E_DRIVE_GROUP_QUOTA_EXCEEDED";
                        break;
                      case 'w':
                        v40 = @"E_DRIVE_ORG_QUOTA_EXCEEDED";
                        break;
                      case 'x':
                        v40 = @"E_RECORD_LIMIT_EXCEEDED";
                        break;
                      case 'y':
                        v40 = @"E_DISALLOWED_COUNTRY_CODE";
                        break;
                      default:
                        v40 = @"UNKNOWN_CODE";
                        switch((int)v39)
                        {
                          case 0:
                            goto LABEL_67;
                          case 1:
                            v40 = @"S_OK";
                            break;
                          case 2:
                            v40 = @"E_ERROR";
                            break;
                          case 3:
                            v40 = @"S_MIXED_RESPONSE";
                            break;
                          case 4:
                            v40 = @"S_OK_HAS_MORE_DATA";
                            break;
                          case 5:
                            v40 = @"S_PROCESSING";
                            break;
                          default:
                            goto LABEL_66;
                        }
                        break;
                    }
                  }
LABEL_67:
                  v41 = [v61 status];
                  signed int v42 = [v41 code];
                  *(_DWORD *)buf = 138544642;
                  id v71 = v33;
                  __int16 v72 = 2114;
                  v73 = v63;
                  __int16 v74 = 2112;
                  v75 = v34;
                  __int16 v76 = 2112;
                  v77 = v37;
                  __int16 v78 = 2112;
                  v79 = v40;
                  __int16 v80 = 2048;
                  uint64_t v81 = v42;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Upload item %@ (%@) was rejected. status: %@ (%ld)", buf, 0x3Eu);

                  v21 = v59;
                  v8 = v60;
                  self = v62;
                }
              }
              v43 = [(PDURLRequestOperation *)self stats];
              if (v43) {
                ++v43[16];
              }

LABEL_72:
            }
            id v23 = [v21 countByEnumeratingWithState:&v65 objects:v82 count:16];
          }
          while (v23);
        }

        BOOL v7 = 1;
        id v6 = v61;
        id v17 = v58;
LABEL_125:

        goto LABEL_126;
      }
      CLSInitLog();
      v44 = [(PDIngestOperation *)self logSubsystem];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = (id)objc_opt_class();
        v48 = [v6 status];
        id v49 = [v48 code];
        if ((int)v49 > 299)
        {
          switch((int)v49)
          {
            case 800:
              v50 = @"E_NOT_APPLICABLE_TYPE";
              break;
            case 801:
              v50 = @"E_ENTITY_NOT_FOUND";
              break;
            case 802:
              v50 = @"E_ENTITY_PRIVILEGE_CHANGE";
              break;
            case 803:
              v50 = @"E_MUST_ACCEPT_TERMS";
              break;
            case 804:
              v50 = @"E_ENTITY_EXPIRED";
              break;
            case 805:
              v50 = @"E_NOT_ALLOWED_FEDERATED_ORGANIZATION";
              break;
            case 806:
              v50 = @"E_DISALLOWED_EMAIL_DOMAIN";
              break;
            default:
              if (v49 == 300)
              {
                v50 = @"E_DEVICE_UNSUPPORTED";
              }
              else if (v49 == 500)
              {
                v50 = @"E_INVALID_FIELD_VALUE";
              }
              else
              {
LABEL_120:
                v50 = +[NSString stringWithFormat:@"(unknown: %i)", v49];
              }
              break;
          }
        }
        else
        {
          switch((int)v49)
          {
            case 'd':
              v50 = @"E_BOOTSTRAP_REQUIRED";
              break;
            case 'e':
              v50 = @"E_AUTHENTICATION_FAILED";
              break;
            case 'f':
              v50 = @"E_NOT_AUTHORIZED";
              break;
            case 'g':
              v50 = @"E_MESCAL_SIGNATURE_REQUIRED";
              break;
            case 'h':
              v50 = @"E_MESCAL_BAD_SIGNATURE";
              break;
            case 'i':
              v50 = @"E_MESCAL_PARSE_ERROR";
              break;
            case 'j':
              v50 = @"E_BAD_REQUEST";
              break;
            case 'k':
              v50 = @"E_BAD_PROTOCOL_VERSION";
              break;
            case 'l':
              v50 = @"E_REQUEST_TOO_LARGE";
              break;
            case 'm':
              v50 = @"E_REQUEST_TOO_MANY_ITEMS";
              break;
            case 'n':
              v50 = @"E_SERVER_BUSY";
              break;
            case 'o':
              v50 = @"E_ACCESS_DENIED";
              break;
            case 'p':
              v50 = @"E_CONFLICT";
              break;
            case 'q':
              v50 = @"E_INVALID_STATE";
              break;
            case 'r':
              v50 = @"E_LOCK_TAKEN";
              break;
            case 's':
              v50 = @"E_DOWNSTREAM_SERVICE_FAILED";
              break;
            case 't':
              v50 = @"E_DOWNSTREAM_SERVICE_THROTTLED";
              break;
            case 'u':
              v50 = @"E_DRIVE_USER_QUOTA_EXCEEDED";
              break;
            case 'v':
              v50 = @"E_DRIVE_GROUP_QUOTA_EXCEEDED";
              break;
            case 'w':
              v50 = @"E_DRIVE_ORG_QUOTA_EXCEEDED";
              break;
            case 'x':
              v50 = @"E_RECORD_LIMIT_EXCEEDED";
              break;
            case 'y':
              v50 = @"E_DISALLOWED_COUNTRY_CODE";
              break;
            default:
              v50 = @"UNKNOWN_CODE";
              switch((int)v49)
              {
                case 0:
                  goto LABEL_121;
                case 1:
                  v50 = @"S_OK";
                  break;
                case 2:
                  v50 = @"E_ERROR";
                  break;
                case 3:
                  v50 = @"S_MIXED_RESPONSE";
                  break;
                case 4:
                  v50 = @"S_OK_HAS_MORE_DATA";
                  break;
                case 5:
                  v50 = @"S_PROCESSING";
                  break;
                default:
                  goto LABEL_120;
              }
              break;
          }
        }
LABEL_121:
        v55 = [v6 status];
        signed int v56 = [v55 code];
        *(_DWORD *)buf = 138544130;
        id v71 = v47;
        __int16 v72 = 2114;
        v73 = v63;
        __int16 v74 = 2112;
        v75 = v50;
        __int16 v76 = 2048;
        v77 = (__CFString *)v56;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Upload request failed. status: %@ (%ld)", buf, 0x2Au);
      }
    }
    else
    {
      id v17 = +[NSError cls_createErrorWithCode:308 description:@"Invalid server response (missing Status)."];
      CLSInitLog();
      v44 = [(PDIngestOperation *)self logSubsystem];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v71 = v45;
        __int16 v72 = 2114;
        v73 = v63;
        __int16 v74 = 2112;
        v75 = v17;
        id v46 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Upload request failed. Bad reponse: %@", buf, 0x20u);
      }
    }

    if (a4)
    {
      id v17 = v17;
      BOOL v7 = 0;
      *a4 = v17;
    }
    else
    {
      BOOL v7 = 0;
    }
    goto LABEL_125;
  }
  BOOL v7 = 0;
LABEL_126:

  return v7;
}

@end