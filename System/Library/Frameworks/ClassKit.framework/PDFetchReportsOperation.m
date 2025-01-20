@interface PDFetchReportsOperation
+ (id)serviceID;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)wantsToExecute;
- (Class)expectedResponseClass;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)requestContentType;
- (id)requestData;
- (void)execute;
- (void)populateClassIDsBuffer:(id)a3 handoutIDsBuffer:(id)a4 studentIDsBUffer:(id)a5;
- (void)prepare;
@end

@implementation PDFetchReportsOperation

+ (id)serviceID
{
  return @"orion";
}

- (void)prepare
{
  v3.receiver = self;
  v3.super_class = (Class)PDFetchReportsOperation;
  [(PDAsyncOperation *)&v3 prepare];
  if (!*(void *)(&self->_firstTime + 2)) {
    [(PDEndpointRequestOperation *)self abort];
  }
}

- (id)endpointIdentifier
{
  return @"progressReport";
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

- (void)execute
{
  v3.receiver = self;
  v3.super_class = (Class)PDFetchReportsOperation;
  [(PDEndpointRequestOperation *)&v3 execute];
  BYTE2(self->_nextBatchPointer) = 0;
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted])
  {
    objc_super v3 = 0;
  }
  else
  {
    v4 = objc_opt_new();
    uint64_t v5 = [(PDEndpointRequestOperation *)self endpointInfo];
    v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = *(unsigned int *)(v5 + 64);
    }
    else {
      uint64_t v7 = 0;
    }
    [v4 setMaxReportItemsCount:v7];

    uint64_t v8 = [(PDEndpointRequestOperation *)self endpointInfo];
    v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = *(unsigned int *)(v8 + 72);
    }
    else {
      uint64_t v10 = 0;
    }
    [v4 setMaxPayloadSize:v10];

    if (*(NSError **)((char *)&self->super._responseStatusError + 2))
    {
      objc_msgSend(v4, "setBatchPointer:");
      objc_super v3 = [v4 data];
    }
    else
    {
      v11 = +[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:");
      v12 = +[NSHashTable hashTableWithOptions:0];
      v13 = +[NSHashTable hashTableWithOptions:0];
      [(PDFetchReportsOperation *)self populateClassIDsBuffer:v11 handoutIDsBuffer:v12 studentIDsBUffer:v13];
      v64 = v11;
      v14 = [v11 allObjects];
      v15 = objc_opt_new();
      if ([v14 count])
      {
        v16 = +[PDDatabase whereSQLForArray:v14 prefix:@"classID in "];
        [v15 addObject:v16];
      }
      v17 = [v12 allObjects];
      if ([v17 count])
      {
        v18 = +[PDDatabase whereSQLForArray:v17 prefix:@"parentObjectID in "];
        [v15 addObject:v18];
      }
      if ([v15 count])
      {
        v55 = v15;
        uint64_t v19 = [v15 componentsJoinedByString:@" and "];
        v57 = v17;
        [v14 arrayByAddingObjectsFromArray:v17];
        uint64_t v21 = v20 = v14;
        v22 = +[NSMapTable strongToStrongObjectsMapTable];
        [v12 removeAllObjects];
        v23 = [(PDOperation *)self database];
        uint64_t v24 = objc_opt_class();
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_10008396C;
        v67[3] = &unk_1001F36F8;
        id v62 = v22;
        id v68 = v62;
        id v61 = v4;
        id v69 = v61;
        v59 = v12;
        id v70 = v12;
        v63 = v23;
        uint64_t v25 = v24;
        v26 = (void *)v19;
        v56 = (void *)v21;
        [v23 selectAll:v25 where:v19 bindings:v21 block:v67];
        v60 = v13;
        v27 = [v13 allObjects];
        v58 = v27;
        if ([v27 count])
        {
          v28 = objc_opt_new();
          v29 = objc_opt_new();
          v30 = +[PDDatabase whereSQLForArray:v27 prefix:@"personID in "];
          [v29 addObjectsFromArray:v27];
          [v28 addObject:v30];
          v14 = v20;
          if ([v20 count])
          {
            uint64_t v31 = +[PDDatabase whereSQLForArray:v20 prefix:@"parentObjectID in "];

            [v28 addObject:v31];
            [v29 addObjectsFromArray:v14];
            v30 = (void *)v31;
          }
          v15 = v55;
          v32 = v62;
          uint64_t v33 = [v28 componentsJoinedByString:@" and "];

          uint64_t v34 = objc_opt_class();
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_100083A54;
          v65[3] = &unk_1001F3480;
          id v66 = v62;
          [v63 selectAll:v34 where:v33 bindings:v29 block:v65];

          v35 = (void *)v33;
        }
        else
        {
          v15 = v55;
          v35 = v26;
          v14 = v20;
          v32 = v62;
        }
        v36 = v61;
        v37 = [v61 requestItems];
        id v38 = [v37 count];

        CLSInitLog();
        v39 = [(PDOperation *)self logSubsystem];
        v40 = v39;
        if (v38)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v45 = objc_opt_class();
            id v46 = v45;
            [(PDURLRequestOperation *)self operationID];
            v48 = v47 = v35;
            v49 = [v61 dictionaryRepresentation];
            *(_DWORD *)buf = 138543874;
            v72 = v45;
            __int16 v73 = 2114;
            v74 = v48;
            __int16 v75 = 2112;
            v76 = v49;
            _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ prepared request payload: %@", buf, 0x20u);

            v36 = v61;
            v35 = v47;
            v32 = v62;
          }
          v41 = [v36 requestItems];
          id v42 = [v41 count];
          v43 = [(PDURLRequestOperation *)self stats];
          if (v43) {
            v43[14] = v42;
          }

          objc_super v3 = [v36 data];
        }
        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v50 = objc_opt_class();
            id v51 = v50;
            [(PDURLRequestOperation *)self operationID];
            v53 = v52 = v35;
            v54 = [v61 dictionaryRepresentation];
            *(_DWORD *)buf = 138543874;
            v72 = v50;
            __int16 v73 = 2114;
            v74 = v53;
            __int16 v75 = 2112;
            v76 = v54;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ attempting to send request with no items: %@", buf, 0x20u);

            v35 = v52;
            v32 = v62;
          }
          [(PDEndpointRequestOperation *)self markAsFinished];
          objc_super v3 = 0;
        }
        v17 = v57;

        v12 = v59;
        v13 = v60;
      }
      else
      {
        [(PDEndpointRequestOperation *)self abort];
        objc_super v3 = 0;
      }
    }
  }

  return v3;
}

- (void)populateClassIDsBuffer:(id)a3 handoutIDsBuffer:(id)a4 studentIDsBUffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend(*(id *)(&self->_firstTime + 2), "pd_keypathValueMap");
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100083F94;
  v54[3] = &unk_1001F3720;
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  id v55 = v37;
  v11 = objc_retainBlock(v54);
  v12 = ((void (*)(void *, const __CFString *))v11[2])(v11, @"classID");
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v51;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v12);
        }
        [v8 addObject:*(void *)(*((void *)&v50 + 1) + 8 * (void)v16)];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v14);
  }
  v17 = ((void (*)(void *, const __CFString *))v11[2])(v11, @"handoutID");

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v47;
    do
    {
      v22 = 0;
      do
      {
        if (*(void *)v47 != v21) {
          objc_enumerationMutation(v18);
        }
        [v9 addObject:*(void *)(*((void *)&v46 + 1) + 8 * (void)v22)];
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v20);
  }

  v23 = [(PDOperation *)self database];
  uint64_t v24 = ((void (*)(void *, const __CFString *))v11[2])(v11, @"attachmentID");
  if ([v24 count])
  {
    uint64_t v25 = +[PDDatabase whereSQLForArray:v24 prefix:@"objectID in "];
    uint64_t v26 = objc_opt_class();
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000840FC;
    v44[3] = &unk_1001F3010;
    id v45 = v9;
    [v23 selectAll:v26 where:v25 bindings:v24 block:v44];
  }
  v27 = ((void (*)(void *, const __CFString *))v11[2])(v11, @"studentID");

  if ([v27 count])
  {
    uint64_t v28 = +[PDDatabase whereSQLForArray:v27 prefix:@"personID in "];
    uint64_t v29 = objc_opt_class();
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100084154;
    v42[3] = &unk_1001F3480;
    id v43 = v8;
    v35 = (void *)v28;
    v36 = v23;
    [v23 selectAll:v29 where:v28 bindings:v27 block:v42];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v30 = v27;
    id v31 = [v30 countByEnumeratingWithState:&v38 objects:v56 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v39;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(v30);
          }
          [v10 addObject:*(void *)(*((void *)&v38 + 1) + 8 * (void)v34)];
          uint64_t v34 = (char *)v34 + 1;
        }
        while (v32 != v34);
        id v32 = [v30 countByEnumeratingWithState:&v38 objects:v56 count:16];
      }
      while (v32);
    }

    v23 = v36;
  }
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(PDOperation *)self isAborted])
  {
    id v8 = [(PDOperation *)self database];
    if ([v6 hasStatus])
    {
      id v9 = [v6 status];
      id v10 = sub_1000F5844(v9);
      [(PDEndpointRequestOperation *)self handleServerAlerts:v10];

      v11 = [v6 status];
      v12 = sub_1000F51A0(v11, 0);

      id v13 = [(PDURLRequestOperation *)self operationID];
      id v14 = v13;
      if (v12)
      {
        CLSInitLog();
        uint64_t v15 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v24 = (id)objc_opt_class();
          uint64_t v25 = [v6 status];
          id v26 = [v25 code];
          if ((int)v26 > 299)
          {
            switch((int)v26)
            {
              case 800:
                v27 = @"E_NOT_APPLICABLE_TYPE";
                break;
              case 801:
                v27 = @"E_ENTITY_NOT_FOUND";
                break;
              case 802:
                v27 = @"E_ENTITY_PRIVILEGE_CHANGE";
                break;
              case 803:
                v27 = @"E_MUST_ACCEPT_TERMS";
                break;
              case 804:
                v27 = @"E_ENTITY_EXPIRED";
                break;
              case 805:
                v27 = @"E_NOT_ALLOWED_FEDERATED_ORGANIZATION";
                break;
              case 806:
                v27 = @"E_DISALLOWED_EMAIL_DOMAIN";
                break;
              default:
                if (v26 == 300)
                {
                  v27 = @"E_DEVICE_UNSUPPORTED";
                }
                else if (v26 == 500)
                {
                  v27 = @"E_INVALID_FIELD_VALUE";
                }
                else
                {
LABEL_62:
                  v27 = +[NSString stringWithFormat:@"(unknown: %i)", v26];
                }
                break;
            }
          }
          else
          {
            switch((int)v26)
            {
              case 'd':
                v27 = @"E_BOOTSTRAP_REQUIRED";
                break;
              case 'e':
                v27 = @"E_AUTHENTICATION_FAILED";
                break;
              case 'f':
                v27 = @"E_NOT_AUTHORIZED";
                break;
              case 'g':
                v27 = @"E_MESCAL_SIGNATURE_REQUIRED";
                break;
              case 'h':
                v27 = @"E_MESCAL_BAD_SIGNATURE";
                break;
              case 'i':
                v27 = @"E_MESCAL_PARSE_ERROR";
                break;
              case 'j':
                v27 = @"E_BAD_REQUEST";
                break;
              case 'k':
                v27 = @"E_BAD_PROTOCOL_VERSION";
                break;
              case 'l':
                v27 = @"E_REQUEST_TOO_LARGE";
                break;
              case 'm':
                v27 = @"E_REQUEST_TOO_MANY_ITEMS";
                break;
              case 'n':
                v27 = @"E_SERVER_BUSY";
                break;
              case 'o':
                v27 = @"E_ACCESS_DENIED";
                break;
              case 'p':
                v27 = @"E_CONFLICT";
                break;
              case 'q':
                v27 = @"E_INVALID_STATE";
                break;
              case 'r':
                v27 = @"E_LOCK_TAKEN";
                break;
              case 's':
                v27 = @"E_DOWNSTREAM_SERVICE_FAILED";
                break;
              case 't':
                v27 = @"E_DOWNSTREAM_SERVICE_THROTTLED";
                break;
              case 'u':
                v27 = @"E_DRIVE_USER_QUOTA_EXCEEDED";
                break;
              case 'v':
                v27 = @"E_DRIVE_GROUP_QUOTA_EXCEEDED";
                break;
              case 'w':
                v27 = @"E_DRIVE_ORG_QUOTA_EXCEEDED";
                break;
              case 'x':
                v27 = @"E_RECORD_LIMIT_EXCEEDED";
                break;
              case 'y':
                v27 = @"E_DISALLOWED_COUNTRY_CODE";
                break;
              default:
                v27 = @"UNKNOWN_CODE";
                switch((int)v26)
                {
                  case 0:
                    goto LABEL_63;
                  case 1:
                    v27 = @"S_OK";
                    break;
                  case 2:
                    v27 = @"E_ERROR";
                    break;
                  case 3:
                    v27 = @"S_MIXED_RESPONSE";
                    break;
                  case 4:
                    v27 = @"S_OK_HAS_MORE_DATA";
                    break;
                  case 5:
                    v27 = @"S_PROCESSING";
                    break;
                  default:
                    goto LABEL_62;
                }
                break;
            }
          }
LABEL_63:
          uint64_t v28 = [v6 status];
          *(_DWORD *)buf = 138544130;
          id v34 = v24;
          __int16 v35 = 2114;
          v36 = v14;
          __int16 v37 = 2112;
          long long v38 = v27;
          __int16 v39 = 2048;
          uint64_t v40 = (int)[v28 code];
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ request failed with status: %@ (%ld)", buf, 0x2Au);
        }
        if (a4) {
          *a4 = v12;
        }

        unsigned __int8 v7 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    v16 = [v6 reports];
    id v17 = [v16 count];
    id v18 = [(PDURLRequestOperation *)self stats];
    if (v18) {
      v18[15] = v17;
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000847BC;
    v29[3] = &unk_1001F3060;
    id v19 = v6;
    id v30 = v19;
    id v20 = v8;
    id v31 = v20;
    id v32 = self;
    if (v20) {
      unsigned __int8 v7 = [v20 performTransaction:v29 forWriting:1];
    }
    else {
      unsigned __int8 v7 = 0;
    }
    if ([v19 hasNextBatchPointer])
    {
      uint64_t v21 = [v19 nextBatchPointer];
      v22 = *(NSError **)((char *)&self->super._responseStatusError + 2);
      *(NSError **)((char *)&self->super._responseStatusError + 2) = v21;
    }
    else
    {
      v22 = *(NSError **)((char *)&self->super._responseStatusError + 2);
      *(NSError **)((char *)&self->super._responseStatusError + 2) = 0;
    }

    v12 = v30;
    goto LABEL_18;
  }
  unsigned __int8 v7 = 0;
LABEL_19:

  return v7;
}

- (BOOL)wantsToExecute
{
  if ([(PDOperation *)self isAborted]) {
    return 0;
  }
  if (BYTE2(self->_nextBatchPointer)) {
    return 1;
  }
  return *(NSError **)((char *)&self->super._responseStatusError + 2) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_firstTime + 2), 0);

  objc_storeStrong((id *)((char *)&self->super._responseStatusError + 2), 0);
}

@end