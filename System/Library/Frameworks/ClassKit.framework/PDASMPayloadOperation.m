@interface PDASMPayloadOperation
+ (id)serviceID;
- (BOOL)_deleteEntity:(Class)a3 identity:(id)a4;
- (BOOL)_deleteWithPayload:(id)a3 error:(id *)a4;
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)allowMixedResponseStatusCode;
- (BOOL)deleteClassMemberWithClassID:(id)a3 personIDs:(id)a4;
- (BOOL)deleteClassWithObjectID:(id)a3 deletePersons:(BOOL)a4;
- (BOOL)deletePersonWithObjectID:(id)a3;
- (BOOL)forgetAboutDeletedEntity:(Class)a3 withObjectID:(id)a4;
- (BOOL)handleZoneRemoved:(id)a3;
- (BOOL)hasBigResponses;
- (BOOL)insertEntity:(id)a3;
- (BOOL)processAdminRequest:(id)a3;
- (BOOL)processAdminRequestAccountPayload:(id)a3;
- (BOOL)processClassMember:(id)a3;
- (BOOL)processClassPayload:(id)a3;
- (BOOL)processGroupMember:(id)a3;
- (BOOL)processGroupPayload:(id)a3;
- (BOOL)processLocation:(id)a3;
- (BOOL)processOrganization:(id)a3;
- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4;
- (BOOL)processPayloadWithinWriteTransaction:(id)a3 error:(id *)a4 stop:(BOOL *)a5;
- (BOOL)processPayloads:(id)a3 error:(id *)a4;
- (BOOL)processPerson:(id)a3;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)processResponseZone:(id)a3;
- (BOOL)processStatusPayload:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5;
- (BOOL)readStreamablePayload:(id)a3 reader:(id)a4 error:(id *)a5;
- (BOOL)shouldProcessPayload:(id)a3 error:(id *)a4;
- (BOOL)shouldProcessPayloadWithStatusCode:(int)a3;
- (BOOL)writePayload:(id)a3 toRequest:(id)a4 writer:(id)a5;
- (Class)streamablePayloadClass;
- (PDASMPayloadOperation)initWithDatabase:(id)a3;
- (int)actionForPayload:(id)a3;
- (int64_t)streamablePayloadClassTagValue;
- (void)_forceNoCache:(id)a3;
@end

@implementation PDASMPayloadOperation

+ (id)serviceID
{
  return @"apple_school_manager";
}

- (PDASMPayloadOperation)initWithDatabase:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDASMPayloadOperation;
  v3 = [(PDURLRequestOperation *)&v7 initWithDatabase:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    v5 = *(void **)(v3 + 226);
    *(void *)(v3 + 226) = v4;
  }
  return (PDASMPayloadOperation *)v3;
}

- (BOOL)allowMixedResponseStatusCode
{
  return 1;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return 1;
}

- (Class)streamablePayloadClass
{
  return (Class)objc_opt_class();
}

- (int64_t)streamablePayloadClassTagValue
{
  return 1;
}

- (BOOL)readStreamablePayload:(id)a3 reader:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(PDASMPayloadOperation *)self streamablePayloadClass];
  if (objc_opt_isKindOfClass())
  {
    char v10 = sub_10015BA14((uint64_t)v8, (uint64_t)v9);
  }
  else
  {
    CLSInitLog();
    v11 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      *(_DWORD *)buf = 138412290;
      id v16 = (id)objc_opt_class();
      id v14 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Parse Error! Cannot read streamed response payloads of type '%@'!", buf, 0xCu);
    }
    +[NSError cls_assignError:a5, 300, @"Cannot read streamed responses containing payloads of type '%@'!", objc_opt_class() code format];
    char v10 = 0;
  }

  return v10;
}

- (int)actionForPayload:(id)a3
{
  return [a3 action];
}

- (BOOL)hasBigResponses
{
  return 1;
}

- (BOOL)writePayload:(id)a3 toRequest:(id)a4 writer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a4 writeTo:v9];
  char v10 = [v9 data];

  id v11 = [v10 length];
  v12 = [(PDURLRequestOperation *)self stats];
  if (v12) {
    v12[10] = v11;
  }

  v13 = [(PDURLRequestOperation *)self stats];
  if (v13) {
    ++v13[14];
  }

  id v14 = [(PDURLRequestOperation *)self operationID];
  CLSInitLog();
  v15 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v25 = objc_opt_class();
    id v26 = v25;
    v27 = [v8 dictionaryRepresentation];
    int v30 = 138543874;
    v31 = v25;
    __int16 v32 = 2114;
    v33 = v14;
    __int16 v34 = 2112;
    v35 = v27;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ added payload item %@ ", (uint8_t *)&v30, 0x20u);
  }
  uint64_t v16 = [(PDURLRequestOperation *)self stats];
  v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = *(void *)(v16 + 80);
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [(PDURLRequestOperation *)self stats];
  v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = *(void *)(v19 + 112);
  }
  else {
    uint64_t v21 = 0;
  }
  unsigned int v22 = [(PDEndpointRequestOperation *)self hasReachedRequestPayloadLimitBytes:v18 count:v21];

  if (v22)
  {
    CLSInitLog();
    v23 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v28 = objc_opt_class();
      int v30 = 138543618;
      v31 = v28;
      __int16 v32 = 2114;
      v33 = v14;
      id v29 = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ payload limit reached.", (uint8_t *)&v30, 0x16u);
    }
  }

  return v22 ^ 1;
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDOperation *)self isAborted])
  {
    BOOL v7 = 0;
  }
  else
  {
    CLSInitLog();
    id v8 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      id v11 = [(PDURLRequestOperation *)self operationID];
      int v17 = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ processing response;",
        (uint8_t *)&v17,
        0x16u);
    }
    v12 = [v6 payloads];
    v13 = v12;
    if (v12)
    {
      id v14 = [v12 count];
      v15 = [(PDURLRequestOperation *)self stats];
      if (v15) {
        v15[15] = v14;
      }

      BOOL v7 = [(PDASMPayloadOperation *)self processPayloads:v13 error:a4];
    }
    else
    {
      BOOL v7 = 0;
    }
    [(PDASMPayloadOperation *)self finishedResponseProcessing];
  }
  return v7;
}

- (BOOL)processPayloadWithinWriteTransaction:(id)a3 error:(id *)a4 stop:(BOOL *)a5
{
  id v8 = a3;
  if (!a4)
  {
    uint64_t v24 = 0;
    a4 = (id *)&v24;
  }
  if ([(PDOperation *)self isAborted])
  {
    LOBYTE(v9) = 0;
    *a5 = 1;
  }
  else
  {
    id v23 = 0;
    unsigned int v9 = [(PDASMPayloadOperation *)self processPayloadFromResponse:v8 error:&v23];
    id v10 = v23;
    id v11 = [(PDURLRequestOperation *)self stats];
    sub_100092A6C((uint64_t)v11, (uint64_t)[v8 type], v9);

    if ((v9 & 1) == 0)
    {
      CLSInitLog();
      v12 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_opt_class();
        id v14 = v13;
        v15 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138543874;
        id v26 = v13;
        __int16 v27 = 2114;
        v28 = v15;
        __int16 v29 = 2114;
        id v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ failed to process payload: %{public}@", buf, 0x20u);
      }
      uint64_t v16 = [(PDEndpointRequestOperation *)self responseStatusError];

      if (v16)
      {
        *a4 = [(PDEndpointRequestOperation *)self responseStatusError];
        *a5 = 1;
      }
    }
    if (*a4)
    {
      CLSInitLog();
      int v17 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = objc_opt_class();
        id v20 = v19;
        uint64_t v21 = [(PDURLRequestOperation *)self operationID];
        id v22 = *a4;
        *(_DWORD *)buf = 138543874;
        id v26 = v19;
        __int16 v27 = 2114;
        v28 = v21;
        __int16 v29 = 2114;
        id v30 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ failed to process response: %{public}@", buf, 0x20u);
      }
      if (*a4 && [v8 type] == 1) {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (BOOL)processPayloads:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDOperation *)self isAborted])
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    int v17 = sub_10000B6B4;
    uint64_t v18 = sub_10000B574;
    id v19 = 0;
    id v8 = [(PDOperation *)self database];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100087F80;
    v11[3] = &unk_1001F2E38;
    v11[4] = self;
    id v12 = v6;
    v13 = &v14;
    if (v8) {
      unsigned __int8 v7 = [v8 performTransaction:v11 forWriting:1];
    }
    else {
      unsigned __int8 v7 = 0;
    }

    unsigned int v9 = (void *)v15[5];
    if (v9)
    {
      unsigned __int8 v7 = 0;
      if (a4) {
        *a4 = v9;
      }
    }

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (BOOL)shouldProcessPayloadWithStatusCode:(int)a3
{
  return (a3 < 6) & a3;
}

- (BOOL)shouldProcessPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 hasStatus]) {
    goto LABEL_9;
  }
  unsigned __int8 v7 = [v6 status];
  unsigned __int8 v8 = -[PDASMPayloadOperation shouldProcessPayloadWithStatusCode:](self, "shouldProcessPayloadWithStatusCode:", [v7 code]);

  if (v8) {
    goto LABEL_9;
  }
  unsigned int v9 = [v6 status];
  id v10 = sub_1000F51A0(v9, 0);

  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    CLSInitLog();
    id v11 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (id)objc_opt_class();
      id v13 = [(PDURLRequestOperation *)self operationID];
      id v14 = [v6 type];
      if (v14 >= 0xE)
      {
        v15 = +[NSString stringWithFormat:@"(unknown: %i)", v14];
      }
      else
      {
        v15 = *(&off_1001F37C0 + (int)v14);
      }
      *(_DWORD *)buf = 138544130;
      id v19 = v12;
      __int16 v20 = 2114;
      id v21 = v13;
      __int16 v22 = 2114;
      id v23 = v15;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Skipping %{public}@ payload with error: %{public}@", buf, 0x2Au);
    }
    BOOL v16 = 0;
  }
  else
  {
LABEL_9:
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDOperation *)self isAborted]) {
    goto LABEL_2;
  }
  unsigned int v8 = -[PDASMPayloadOperation acceptsPayloadType:](self, "acceptsPayloadType:", [v6 type]);
  CLSInitLog();
  unsigned int v9 = [(PDOperation *)self logSubsystem];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (v10)
    {
      id v15 = (id)objc_opt_class();
      id v16 = [(PDURLRequestOperation *)self operationID];
      id v17 = [v6 type];
      if (v17 >= 0xE)
      {
        uint64_t v18 = +[NSString stringWithFormat:@"(unknown: %i)", v17];
      }
      else
      {
        uint64_t v18 = *(&off_1001F37C0 + (int)v17);
      }
      *(_DWORD *)buf = 138543874;
      id v37 = v15;
      __int16 v38 = 2114;
      id v39 = v16;
      __int16 v40 = 2114;
      v41 = v18;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Ignoring payload type: %{public}@", buf, 0x20u);

      goto LABEL_21;
    }
LABEL_22:

    BOOL v7 = 1;
    goto LABEL_23;
  }
  if (v10)
  {
    id v11 = (id)objc_opt_class();
    id v12 = [(PDURLRequestOperation *)self operationID];
    id v13 = [v6 type];
    if (v13 >= 0xE)
    {
      id v14 = +[NSString stringWithFormat:@"(unknown: %i)", v13];
    }
    else
    {
      id v14 = *(&off_1001F37C0 + (int)v13);
    }
    id v19 = [v6 dictionaryRepresentation];
    *(_DWORD *)buf = 138544130;
    id v37 = v11;
    __int16 v38 = 2114;
    id v39 = v12;
    __int16 v40 = 2114;
    v41 = v14;
    __int16 v42 = 2112;
    v43 = v19;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Processing payload type: %{public}@\n    payload: %@", buf, 0x2Au);
  }
  if ([v6 type] == 1)
  {
    unsigned __int8 v20 = [(PDASMPayloadOperation *)self processStatusPayload:v6 allowMixedResponse:[(PDASMPayloadOperation *)self allowMixedResponseStatusCode] error:a4];
LABEL_14:
    BOOL v7 = v20;
    goto LABEL_23;
  }
  if ([v6 type] == 3)
  {
    id v21 = [v6 responseZone];
    unsigned __int8 v22 = [(PDASMPayloadOperation *)self processResponseZone:v21];
LABEL_17:
    BOOL v7 = v22;
LABEL_18:

    goto LABEL_23;
  }
  if ([(PDASMPayloadOperation *)self shouldProcessPayload:v6 error:a4])
  {
    unsigned int v24 = [(PDASMPayloadOperation *)self actionForPayload:v6];
    if (v24 != 1)
    {
      if (v24 != 3)
      {
        if (v24 == 2)
        {
          unsigned __int8 v20 = [(PDASMPayloadOperation *)self _deleteWithPayload:v6 error:a4];
          goto LABEL_14;
        }
        CLSInitLog();
        unsigned int v9 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          __int16 v27 = objc_opt_class();
          id v15 = v27;
          id v16 = [(PDURLRequestOperation *)self operationID];
          v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 action]);
          __int16 v29 = [v6 dictionaryRepresentation];
          *(_DWORD *)buf = 138544130;
          id v37 = v27;
          __int16 v38 = 2114;
          id v39 = v16;
          __int16 v40 = 2114;
          v41 = v28;
          __int16 v42 = 2112;
          v43 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ ignoring unknown action: %{public}@; payload: %@",
            buf,
            0x2Au);

LABEL_21:
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      [(PDASMPayloadOperation *)self _deleteWithPayload:v6 error:a4];
    }
    id v21 = [(PDOperation *)self database];
    switch([v6 type])
    {
      case 4u:
        v25 = [v6 location];
        unsigned __int8 v26 = [(PDASMPayloadOperation *)self processLocation:v25];
        goto LABEL_46;
      case 5u:
        v25 = [v6 person];
        unsigned __int8 v26 = [(PDASMPayloadOperation *)self processPerson:v25];
        goto LABEL_46;
      case 6u:
        unsigned __int8 v22 = [(PDASMPayloadOperation *)self processClassPayload:v6];
        goto LABEL_17;
      case 7u:
        v25 = [v6 classMember];
        unsigned __int8 v26 = [(PDASMPayloadOperation *)self processClassMember:v25];
        goto LABEL_46;
      case 8u:
        v35 = [v6 role];
        v25 = sub_10007AB58(v35);

        unsigned __int8 v26 = sub_100051818(v21, v25);
        goto LABEL_46;
      case 9u:
        v25 = [v6 organization];
        unsigned __int8 v26 = [(PDASMPayloadOperation *)self processOrganization:v25];
        goto LABEL_46;
      case 0xAu:
        v25 = [v6 adminRequest];
        unsigned __int8 v26 = [(PDASMPayloadOperation *)self processAdminRequest:v25];
        goto LABEL_46;
      case 0xBu:
        unsigned __int8 v22 = [(PDASMPayloadOperation *)self processAdminRequestAccountPayload:v6];
        goto LABEL_17;
      case 0xCu:
        unsigned __int8 v22 = [(PDASMPayloadOperation *)self processGroupPayload:v6];
        goto LABEL_17;
      case 0xDu:
        v25 = [v6 groupMember];
        unsigned __int8 v26 = [(PDASMPayloadOperation *)self processGroupMember:v25];
LABEL_46:
        BOOL v7 = v26;

        break;
      default:
        CLSInitLog();
        id v30 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          id v31 = (id)objc_opt_class();
          id v32 = [(PDURLRequestOperation *)self operationID];
          id v33 = [v6 type];
          if (v33 >= 0xE)
          {
            __int16 v34 = +[NSString stringWithFormat:@"(unknown: %i)", v33];
          }
          else
          {
            __int16 v34 = *(&off_1001F37C0 + (int)v33);
          }
          *(_DWORD *)buf = 138543874;
          id v37 = v31;
          __int16 v38 = 2114;
          id v39 = v32;
          __int16 v40 = 2114;
          v41 = v34;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Unexpected payload type: %{public}@;",
            buf,
            0x20u);
        }
        BOOL v7 = 1;
        break;
    }
    goto LABEL_18;
  }
LABEL_2:
  BOOL v7 = 0;
LABEL_23:

  return v7;
}

- (BOOL)processStatusPayload:(id)a3 allowMixedResponse:(BOOL)a4 error:(id *)a5
{
  unsigned int v8 = [a3 status];
  unsigned int v9 = v8;
  if (v8)
  {
    if ([v8 hasInternalMessage])
    {
      CLSInitLog();
      BOOL v10 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v19 = objc_opt_class();
        id v24 = v19;
        unsigned __int8 v20 = [(PDURLRequestOperation *)self operationID];
        unsigned int v21 = [v9 code];
        unsigned __int8 v22 = [v9 message];
        id v23 = [v9 internalMessage];
        *(_DWORD *)buf = 138544386;
        unsigned __int8 v26 = v19;
        __int16 v27 = 2114;
        v28 = v20;
        __int16 v29 = 1024;
        *(_DWORD *)id v30 = v21;
        *(_WORD *)&v30[4] = 2112;
        *(void *)&v30[6] = v22;
        __int16 v31 = 2112;
        id v32 = v23;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ status code: %d message: %@ internal message:%@", buf, 0x30u);
      }
    }
    id v11 = sub_1000F5844(v9);
    [(PDEndpointRequestOperation *)self handleServerAlerts:v11];

    id v12 = sub_1000F51A0(v9, a4);
    BOOL v13 = v12 == 0;
    if (v12)
    {
      [(PDEndpointRequestOperation *)self setResponseStatusError:v12];
      if (a5) {
        *a5 = v12;
      }
      CLSInitLog();
      id v14 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = objc_opt_class();
        id v16 = v15;
        id v17 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138543874;
        unsigned __int8 v26 = v15;
        __int16 v27 = 2114;
        v28 = v17;
        __int16 v29 = 2114;
        *(void *)id v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ response status error: %{public}@;",
          buf,
          0x20u);
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)processResponseZone:(id)a3
{
  return 1;
}

- (void)_forceNoCache:(id)a3
{
  id v3 = a3;
  [v3 setExpiration:0.0];
  [v3 setEnforceImmutability:0];
}

- (BOOL)processPerson:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(PDOperation *)self database];
  id v6 = sub_100079604(v4);
  [(PDASMPayloadOperation *)self _forceNoCache:v6];
  BOOL v7 = sub_100079A04(v4);

  LOBYTE(v4) = sub_10010C28C(v5, v6, v7);
  return (char)v4;
}

- (BOOL)processClassPayload:(id)a3
{
  id v4 = a3;
  if ([v4 hasClassInfo])
  {
    v5 = [v4 classInfo];
    id v6 = sub_10007A010(v5);

    [(PDASMPayloadOperation *)self _forceNoCache:v6];
    BOOL v7 = [v4 tempObjectId];
    [v6 setTempObjectID:v7];

    BOOL v8 = [(PDASMPayloadOperation *)self insertEntity:v6];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)processGroupPayload:(id)a3
{
  id v4 = a3;
  if ([v4 hasGroupInfo])
  {
    v5 = [v4 groupInfo];
    id v6 = sub_100079D7C(v5);

    [(PDASMPayloadOperation *)self _forceNoCache:v6];
    BOOL v7 = [(PDASMPayloadOperation *)self insertEntity:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)processClassMember:(id)a3
{
  if (!a3) {
    return 0;
  }
  sub_10007A5A4(a3);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    char v7 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unsigned __int8 v10 = [(PDASMPayloadOperation *)self insertEntity:v9];
        if ((v10 & 1) == 0)
        {
          id v11 = [v9 personID];
          uint64_t v12 = objc_opt_class();
          BOOL v13 = [v9 objectID];
          [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v11 forClass:v12 fromEntityWithID:v13 withClass:objc_opt_class()];

          id v14 = [v9 parentObjectID];
          uint64_t v15 = objc_opt_class();
          id v16 = [v9 objectID];
          [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v14 forClass:v15 fromEntityWithID:v16 withClass:objc_opt_class()];
        }
        v7 &= v10;
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)processGroupMember:(id)a3
{
  if (!a3) {
    return 0;
  }
  sub_10007A6EC(a3);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    char v7 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unsigned __int8 v10 = [(PDASMPayloadOperation *)self insertEntity:v9];
        if ((v10 & 1) == 0)
        {
          id v11 = [v9 personID];
          uint64_t v12 = objc_opt_class();
          BOOL v13 = [v9 objectID];
          [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v11 forClass:v12 fromEntityWithID:v13 withClass:objc_opt_class()];

          id v14 = [v9 parentObjectID];
          uint64_t v15 = objc_opt_class();
          id v16 = [v9 objectID];
          [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v14 forClass:v15 fromEntityWithID:v16 withClass:objc_opt_class()];
        }
        v7 &= v10;
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)processLocation:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = sub_10007AA50(a3);
  LOBYTE(self) = [(PDASMPayloadOperation *)self insertEntity:v4];

  return (char)self;
}

- (BOOL)processOrganization:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    unsigned __int8 v26 = sub_10007AF14(v4);
    __int16 v27 = v5;
    if ([v26 count])
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v6 = v26;
      id v7 = [v6 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v34;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v34 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            if (![(PDASMPayloadOperation *)self insertEntity:v11])
            {
              CLSInitLog();
              uint64_t v12 = [(PDOperation *)self logSubsystem];
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                BOOL v13 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                id v39 = v13;
                __int16 v40 = 2114;
                uint64_t v41 = v11;
                id v14 = v13;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ failed to save location: %{public}@", buf, 0x16u);
              }
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v8);
      }

      id v5 = v27;
    }
    uint64_t v15 = sub_10007B058(v5);
    unsigned __int8 v28 = [(PDASMPayloadOperation *)self insertEntity:v15];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = [v15 locationIDs];
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
          uint64_t v22 = objc_opt_class();
          id v23 = [v15 objectID];
          [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v21 forClass:v22 fromEntityWithID:v23 withClass:objc_opt_class()];
        }
        id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v18);
    }

    id v5 = v27;
    BOOL v24 = v28;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)processAdminRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PDOperation *)self database];
    id v6 = objc_opt_new();
    id v7 = sub_10007B728(v4);
    if (v7) {
      [v6 addObject:v7];
    }
    id v8 = [v4 requestor];
    uint64_t v9 = sub_10007B420(v8);

    if (v9) {
      [v6 addObject:v9];
    }
    unsigned __int8 v10 = [v5 insertOrUpdateObjects:v6];
    if ((v10 & 1) == 0)
    {
      CLSInitLog();
      uint64_t v11 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = objc_opt_class();
        id v14 = v13;
        uint64_t v15 = [(PDURLRequestOperation *)self operationID];
        int v16 = 138543874;
        id v17 = v13;
        __int16 v18 = 2114;
        uint64_t v19 = v15;
        __int16 v20 = 2114;
        uint64_t v21 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Failed to insert %{public}@.", (uint8_t *)&v16, 0x20u);
      }
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)processAdminRequestAccountPayload:(id)a3
{
  id v4 = a3;
  if ([v4 hasAdminRequestAccount])
  {
    id v5 = [(PDOperation *)self database];
    id v6 = objc_opt_new();
    id v7 = [v4 adminRequestAccount];
    id v8 = [v4 status];
    uint64_t v9 = sub_10007C02C(v7, v8);

    if (v9) {
      [v6 addObject:v9];
    }
    if ([v7 hasPerson])
    {
      unsigned __int8 v10 = [v7 person];
      uint64_t v11 = sub_100079604(v10);

      if (v11)
      {
        [v6 addObject:v11];
        uint64_t v12 = [v7 person];
        BOOL v13 = sub_100079A04(v12);

        [v6 addObjectsFromArray:v13];
      }
    }
    unsigned __int8 v14 = [v5 insertOrUpdateObjects:v6];
    if ((v14 & 1) == 0)
    {
      CLSInitLog();
      uint64_t v15 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v17 = objc_opt_class();
        id v18 = v17;
        uint64_t v19 = [(PDURLRequestOperation *)self operationID];
        int v20 = 138543874;
        uint64_t v21 = v17;
        __int16 v22 = 2114;
        id v23 = v19;
        __int16 v24 = 2114;
        v25 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Failed to insert %{public}@.", (uint8_t *)&v20, 0x20u);
      }
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)handleZoneRemoved:(id)a3
{
  id v4 = a3;
  [(PDOperation *)self database];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100089BEC;
  v11[3] = &unk_1001F3060;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  id v13 = v5;
  unsigned __int8 v14 = self;
  id v6 = v12;
  id v7 = v6;
  if (v6) {
    unsigned __int8 v8 = [v6 performTransaction:v11 forWriting:1];
  }
  else {
    unsigned __int8 v8 = 0;
  }
  CLSInitLog();
  uint64_t v9 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "removed from zoneIDs: zone %@", buf, 0xCu);
  }

  return v8;
}

- (BOOL)insertEntity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PDOperation *)self database];
    if ([v5 insertOrUpdateObject:v4])
    {
      id v6 = *(NSError **)((char *)&self->super._responseStatusError + 2);
      id v7 = [v4 objectID];
      LOBYTE(v6) = [v6 containsObject:v7];

      if (v6)
      {
        CLSInitLog();
        unsigned __int8 v8 = (void *)CLSLogSearch;
        if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
        {
          id v18 = v8;
          uint64_t v19 = objc_opt_class();
          id v20 = v19;
          uint64_t v21 = [(PDURLRequestOperation *)self operationID];
          __int16 v22 = [v4 objectID];
          *(_DWORD *)buf = 138543874;
          v25 = v19;
          __int16 v26 = 2114;
          __int16 v27 = v21;
          __int16 v28 = 2112;
          id v29 = v22;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Missing entity %@ remains missing. Leaving it in PDMissingEntityReference.", buf, 0x20u);
        }
        unsigned __int8 v9 = 1;
      }
      else
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = [v4 objectID];
        id v23 = v15;
        id v16 = +[NSArray arrayWithObjects:&v23 count:1];
        unsigned __int8 v9 = [v5 deleteAll:v14 where:@"entityID = ?" bindings:v16];
      }
    }
    else
    {
      CLSInitLog();
      unsigned __int8 v10 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = objc_opt_class();
        id v12 = v11;
        id v13 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138543874;
        v25 = v11;
        __int16 v26 = 2114;
        __int16 v27 = v13;
        __int16 v28 = 2114;
        id v29 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ Failed to insert %{public}@.", buf, 0x20u);
      }
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)_deleteWithPayload:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = 1;
  switch([v5 type])
  {
    case 1u:
      goto LABEL_30;
    case 4u:
      uint64_t v7 = objc_opt_class();
      unsigned __int8 v8 = [v5 location];
      uint64_t v9 = [v8 locationId];
      goto LABEL_11;
    case 5u:
      unsigned __int8 v8 = [v5 person];
      uint64_t v15 = [v8 personId];
      unsigned __int8 v16 = [(PDASMPayloadOperation *)self deletePersonWithObjectID:v15];
      goto LABEL_12;
    case 6u:
      unsigned __int8 v8 = [v5 classInfo];
      uint64_t v15 = [v8 classId];
      unsigned __int8 v16 = [(PDASMPayloadOperation *)self deleteClassWithObjectID:v15 deletePersons:0];
      goto LABEL_12;
    case 7u:
      id v17 = [v5 classMember];
      id v18 = [v17 classMemberId];

      if (v18)
      {
        uint64_t v7 = objc_opt_class();
        unsigned __int8 v8 = [v5 classMember];
        uint64_t v9 = [v8 classMemberId];
LABEL_11:
        uint64_t v15 = (void *)v9;
        unsigned __int8 v16 = [(PDASMPayloadOperation *)self _deleteEntity:v7 identity:v9];
LABEL_12:
        BOOL v6 = v16;
      }
      else
      {
        unsigned __int8 v8 = [v5 classMember];
        uint64_t v15 = [v8 classId];
        id v39 = [v5 classMember];
        [v39 personIds];
        v41 = id v40 = v5;
        __int16 v42 = [v41 stringListValues];
        BOOL v6 = [(PDASMPayloadOperation *)self deleteClassMemberWithClassID:v15 personIDs:v42];

        id v5 = v40;
LABEL_28:
      }
LABEL_30:

      return v6;
    case 8u:
      uint64_t v7 = objc_opt_class();
      unsigned __int8 v8 = [v5 role];
      uint64_t v9 = [v8 roleId];
      goto LABEL_11;
    case 9u:
      uint64_t v19 = [v5 organization];
      id v20 = [v19 locationsCount];

      if (v20)
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v44 = v5;
        uint64_t v21 = [v5 organization];
        __int16 v22 = [v21 locations];

        id v23 = [v22 countByEnumeratingWithState:&v46 objects:v56 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v47;
          __int16 v26 = CKRecordID_ptr;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v47 != v25) {
                objc_enumerationMutation(v22);
              }
              __int16 v28 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              uint64_t v29 = objc_opt_class();
              long long v30 = [v28 locationId];
              LOBYTE(v29) = [(PDASMPayloadOperation *)self _deleteEntity:v29 identity:v30];

              if ((v29 & 1) == 0)
              {
                CLSInitLog();
                long long v31 = [(PDOperation *)self logSubsystem];
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  long long v32 = objc_opt_class();
                  id v45 = v32;
                  [(PDURLRequestOperation *)self operationID];
                  uint64_t v33 = v25;
                  long long v34 = self;
                  long long v35 = v26;
                  id v37 = v36 = v22;
                  *(_DWORD *)buf = 138543874;
                  id v51 = v32;
                  __int16 v52 = 2114;
                  id v53 = v37;
                  __int16 v54 = 2114;
                  v55 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to delete location %{public}@.", buf, 0x20u);

                  __int16 v22 = v36;
                  __int16 v26 = v35;
                  self = v34;
                  uint64_t v25 = v33;
                }
              }
            }
            id v24 = [v22 countByEnumeratingWithState:&v46 objects:v56 count:16];
          }
          while (v24);
        }

        id v5 = v44;
      }
      uint64_t v38 = objc_opt_class();
      unsigned __int8 v8 = [v5 organization];
      uint64_t v15 = [v8 organizationId];
      id v39 = sub_1000792AC(v15);
      BOOL v6 = [(PDASMPayloadOperation *)self _deleteEntity:v38 identity:v39];
      goto LABEL_28;
    default:
      CLSInitLog();
      unsigned __int8 v10 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (id)objc_opt_class();
        id v12 = [(PDURLRequestOperation *)self operationID];
        id v13 = [v5 type];
        if (v13 >= 0xE)
        {
          uint64_t v14 = +[NSString stringWithFormat:@"(unknown: %i)", v13];
        }
        else
        {
          uint64_t v14 = *(&off_1001F37C0 + (int)v13);
        }
        *(_DWORD *)buf = 138543874;
        id v51 = v11;
        __int16 v52 = 2114;
        id v53 = v12;
        __int16 v54 = 2114;
        v55 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Unexpected payload type: %{public}@;",
          buf,
          0x20u);
      }
      BOOL v6 = 1;
      goto LABEL_30;
  }
}

- (BOOL)deletePersonWithObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (![(PDASMPayloadOperation *)self _deleteEntity:objc_opt_class() identity:v4])
    {
      CLSInitLog();
      id v5 = (void *)CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v6 = v5;
        *(_DWORD *)buf = 138543618;
        id v19 = (id)objc_opt_class();
        __int16 v20 = 2114;
        id v21 = v4;
        id v7 = v19;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete person %{public}@", buf, 0x16u);
      }
    }
    unsigned __int8 v8 = [(PDOperation *)self database];
    uint64_t v9 = objc_opt_class();
    id v17 = v4;
    BOOL v10 = 1;
    id v11 = +[NSArray arrayWithObjects:&v17 count:1];
    LOBYTE(v9) = [v8 deleteAll:v9 where:@"studentID = ?" bindings:v11];

    if ((v9 & 1) == 0)
    {
      CLSInitLog();
      id v12 = (void *)CLSLogDatabase;
      BOOL v10 = 0;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v19 = v14;
        __int16 v20 = 2114;
        id v21 = v4;
        id v15 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete cached report items for person %{public}@", buf, 0x16u);

        BOOL v10 = 0;
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)deleteClassWithObjectID:(id)a3 deletePersons:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PDOperation *)self database];
  unsigned __int8 v8 = v7;
  if (v4)
  {
    uint64_t v9 = sub_10006B53C(v7, v6);
    BOOL v10 = sub_100003E58(v8);
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 objectID];

      if (v12)
      {
        id v13 = [v11 objectID];
        [v9 removeObject:v13];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (![(PDASMPayloadOperation *)self _deleteEntity:objc_opt_class() identity:v6])
  {
    CLSInitLog();
    uint64_t v14 = (void *)CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      *(_DWORD *)buf = 138543618;
      id v32 = (id)objc_opt_class();
      __int16 v33 = 2114;
      id v34 = v6;
      id v16 = v32;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete class %{public}@", buf, 0x16u);
    }
  }
  if (v4 && [v9 count])
  {
    id v17 = +[PDDatabase whereSQLForArray:v9 prefix:@"objectID in "];
    if (([v8 deleteAll:objc_opt_class() where:v17 bindings:v9] & 1) == 0)
    {
      CLSInitLog();
      id v18 = (void *)CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v18;
        __int16 v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v32 = v20;
        __int16 v33 = 2114;
        id v34 = v6;
        id v21 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete persons in class %{public}@", buf, 0x16u);
      }
    }
  }
  uint64_t v22 = objc_opt_class();
  id v30 = v6;
  id v23 = +[NSArray arrayWithObjects:&v30 count:1];
  unsigned __int8 v24 = [v8 deleteAllWithoutTracking:v22 where:@"classID = ?" bindings:v23];

  if ((v24 & 1) == 0)
  {
    CLSInitLog();
    uint64_t v25 = (void *)CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = v25;
      __int16 v27 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v32 = v27;
      __int16 v33 = 2114;
      id v34 = v6;
      id v28 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete cached report items for class %{public}@", buf, 0x16u);
    }
  }

  return v24;
}

- (BOOL)forgetAboutDeletedEntity:(Class)a3 withObjectID:(id)a4
{
  id v6 = a4;
  id v7 = [(PDOperation *)self database];
  id v15 = v6;
  unsigned __int8 v8 = +[NSArray arrayWithObjects:&v15 count:1];
  if ([v7 deleteAll:objc_opt_class() where:@"entityID = ?" bindings:v8]
    && [v7 deleteAll:objc_opt_class() where:@"entityIdentity = ?" bindings:v8]
    && [v7 deleteAll:objc_opt_class() where:@"objectID = ?" bindings:v8])
  {
    uint64_t v9 = objc_opt_class();
    BOOL v10 = +[PDDatabase nameOfEntity:a3];
    v14[0] = v10;
    v14[1] = v6;
    id v11 = +[NSArray arrayWithObjects:v14 count:2];
    unsigned __int8 v12 = [v7 deleteAll:v9 where:@"entityName = ? AND entityIdentity = ?" bindings:v11];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)deleteClassMemberWithClassID:(id)a3 personIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = v7;
  if (!v7 || ![v7 count]) {
    goto LABEL_13;
  }
  uint64_t v9 = +[PDDatabase whereSQLForArray:v8 prefix:@"parentObjectID = ? AND personID in "];
  BOOL v10 = objc_opt_new();
  uint64_t v11 = objc_opt_class();
  [v10 addObject:v6];
  [v10 addObjectsFromArray:v8];
  unsigned __int8 v12 = [(PDOperation *)self database];
  unsigned __int8 v13 = [v12 deleteAll:v11 where:v9 bindings:v10];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v15)
  {
    id v16 = v15;
    __int16 v26 = v10;
    __int16 v27 = v9;
    id v28 = v8;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = +[CLSClassMember objectIDForClassID:v6 andPersonID:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        unsigned __int8 v13 = [(PDASMPayloadOperation *)self forgetAboutDeletedEntity:v11 withObjectID:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v16);
    uint64_t v9 = v27;
    unsigned __int8 v8 = v28;
    BOOL v10 = v26;
  }

  if (v13)
  {
    BOOL v20 = 1;
  }
  else
  {
LABEL_13:
    CLSInitLog();
    id v21 = (void *)CLSLogDatabase;
    BOOL v20 = 0;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = v21;
      id v23 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v34 = v23;
      __int16 v35 = 2114;
      id v36 = v6;
      __int16 v37 = 2114;
      uint64_t v38 = v8;
      id v24 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to delete classMembers class:%{public}@ persons:%{public}@", buf, 0x20u);

      BOOL v20 = 0;
    }
  }

  return v20;
}

- (BOOL)_deleteEntity:(Class)a3 identity:(id)a4
{
  id v6 = a4;
  id v7 = [(PDOperation *)self database];
  id v25 = v6;
  unsigned __int8 v8 = +[NSArray arrayWithObjects:&v25 count:1];
  uint64_t v9 = [(objc_class *)a3 identityColumnName];
  BOOL v10 = [v9 stringByAppendingString:@" = ?"];

  if ([v7 deleteAll:a3 where:v10 bindings:v8])
  {
    BOOL v11 = [(PDASMPayloadOperation *)self forgetAboutDeletedEntity:a3 withObjectID:v6];
  }
  else
  {
    CLSInitLog();
    unsigned __int8 v12 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v13 = objc_opt_class();
      id v14 = v13;
      id v15 = [(PDURLRequestOperation *)self operationID];
      int v17 = 138544130;
      id v18 = v13;
      __int16 v19 = 2114;
      BOOL v20 = v15;
      __int16 v21 = 2114;
      Class v22 = a3;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Failed to delete %{public}@ %@.", (uint8_t *)&v17, 0x2Au);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end