@interface PDCollectionSearchOperation
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)allowMixedResponseStatusCode;
- (BOOL)handleZoneRemoved:(id)a3;
- (BOOL)needsToMakeNetworkRequest;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)wantsToExecute;
- (Class)expectedResponseClass;
- (PDCollectionSearchOperation)initWithDatabase:(id)a3;
- (id)acceptContentType;
- (id)createCollectionQueryRequest;
- (id)createHandoutQueryRequest;
- (id)endpointIdentifier;
- (id)initForCollectionItemsWithDatabase:(id)a3;
- (id)initForCollectionsWithDatabase:(id)a3;
- (id)logSubsystem;
- (id)requestContentType;
- (id)requestData;
- (void)execute;
@end

@implementation PDCollectionSearchOperation

- (PDCollectionSearchOperation)initWithDatabase:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDCollectionSearchOperation;
  result = [(PDURLRequestOperation *)&v4 initWithDatabase:a3];
  if (result) {
    BYTE3(result->super.super._responseStatusError) = 1;
  }
  return result;
}

- (id)initForCollectionsWithDatabase:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDCollectionSearchOperation;
  id result = [(PDURLRequestOperation *)&v4 initWithDatabase:a3];
  if (result)
  {
    *(_DWORD *)((char *)result + 231) = 0;
    *((unsigned char *)result + 227) = 1;
  }
  return result;
}

- (id)initForCollectionItemsWithDatabase:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDCollectionSearchOperation;
  id result = [(PDURLRequestOperation *)&v4 initWithDatabase:a3];
  if (result)
  {
    *(_DWORD *)((char *)result + 231) = 1;
    *((unsigned char *)result + 227) = 1;
  }
  return result;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 0x1E) & (0x31F0800Eu >> a3);
}

- (id)endpointIdentifier
{
  return @"queryEntities";
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (id)requestData
{
  int v3 = *(_DWORD *)((char *)&self->super.super._responseStatusError + 7);
  if (v3 == 1)
  {
    uint64_t v4 = [(PDCollectionSearchOperation *)self createHandoutQueryRequest];
LABEL_5:
    v5 = (void *)v4;
    if (v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!v3)
  {
    uint64_t v4 = [(PDCollectionSearchOperation *)self createCollectionQueryRequest];
    goto LABEL_5;
  }
LABEL_6:
  [(PDEndpointRequestOperation *)self markAsFinished];
  v5 = 0;
LABEL_7:
  v6 = [v5 data];

  return v6;
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
    v8 = [(PDCollectionSearchOperation *)self logSubsystem];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      v11 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ processing response;",
        buf,
        0x16u);
    }
    v12 = [v6 queryPayloads];
    id v13 = [v12 count];
    v14 = [(PDURLRequestOperation *)self stats];
    if (v14) {
      v14[15] = v13;
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v23 = sub_10000B654;
    v24 = sub_10000B544;
    id v25 = 0;
    v15 = [(PDOperation *)self database];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004FD34;
    v19[3] = &unk_1001F2E38;
    v19[4] = self;
    id v16 = v12;
    id v20 = v16;
    v21 = buf;
    if (v15) {
      unsigned __int8 v7 = [v15 performTransaction:v19 forWriting:1];
    }
    else {
      unsigned __int8 v7 = 0;
    }

    v17 = *(void **)(*(void *)&buf[8] + 40);
    if (v17)
    {
      unsigned __int8 v7 = 0;
      if (a4) {
        *a4 = v17;
      }
    }

    _Block_object_dispose(buf, 8);
  }

  return v7;
}

- (id)requestContentType
{
  return @"application/x-protobuf";
}

- (id)acceptContentType
{
  return @"application/x-protobuf";
}

- (BOOL)handleZoneRemoved:(id)a3
{
  return 1;
}

- (void)execute
{
  v3.receiver = self;
  v3.super_class = (Class)PDCollectionSearchOperation;
  [(PDEndpointRequestOperation *)&v3 execute];
  BYTE3(self->super.super._responseStatusError) = 0;
}

- (BOOL)allowMixedResponseStatusCode
{
  return 1;
}

- (BOOL)wantsToExecute
{
  if (*(_DWORD *)((char *)&self->super.super._responseStatusError + 7) != 1) {
    return BYTE3(self->super.super._responseStatusError) != 0;
  }
  v2 = [(PDOperation *)self database];
  BOOL v3 = sub_1000C889C(v2);

  return v3;
}

- (BOOL)needsToMakeNetworkRequest
{
  return 1;
}

- (id)logSubsystem
{
  return CLSLogCollection;
}

- (id)createCollectionQueryRequest
{
  BOOL v3 = objc_alloc_init(PDDPQueryRequest);
  uint64_t v4 = objc_alloc_init(PDDPSchoolworkQueryZone);
  uint64_t v5 = [(PDEndpointRequestOperation *)self endpointInfo];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(unsigned int *)(v5 + 64);
  }
  else {
    uint64_t v7 = 0;
  }
  [(PDDPSchoolworkQueryZone *)v4 setLimit:v7];

  [(PDDPSchoolworkQueryZone *)v4 setZoneName:@"collections"];
  [(PDDPQueryRequest *)v3 setQueryZone:v4];
  [(PDDPQueryRequest *)v3 setIncludeChildren:1];
  v8 = objc_alloc_init(PDDPSchoolworkSearchQuery);
  [(PDDPSchoolworkSearchQuery *)v8 setType:3];
  v9 = objc_alloc_init(PDDPSchoolworkSearchQuery);
  [(PDDPSchoolworkSearchQuery *)v9 setType:3];
  id v10 = objc_alloc_init(PDDPSchoolworkSearchCriteria);
  [(PDDPSchoolworkSearchCriteria *)v10 setFieldName:@"record_type"];
  [(PDDPSchoolworkSearchCriteria *)v10 setSearchOperator:2];
  v11 = objc_alloc_init(PDDPTypedValue);
  [(PDDPTypedValue *)v11 setStringValue:@"collection"];
  [(PDDPTypedValue *)v11 setType:1];
  [(PDDPSchoolworkSearchCriteria *)v10 setValue:v11];
  [(PDDPSchoolworkSearchQuery *)v9 setCriteria:v10];
  [(PDDPSchoolworkSearchQuery *)v8 addContents:v9];
  [(PDDPQueryRequest *)v3 setFilterQuery:v8];

  return v3;
}

- (id)createHandoutQueryRequest
{
  BOOL v3 = [(PDOperation *)self database];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10000B654;
  id v16 = sub_10000B544;
  id v17 = 0;
  uint64_t v4 = objc_opt_class();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100050468;
  v8[3] = &unk_1001F2E60;
  id v5 = v3;
  id v10 = self;
  v11 = &v12;
  id v9 = v5;
  [v5 selectAll:v4 where:@"type in (?,?)" bindings:&off_10020B158 block:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

@end