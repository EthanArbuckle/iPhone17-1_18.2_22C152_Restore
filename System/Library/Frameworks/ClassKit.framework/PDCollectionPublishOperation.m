@interface PDCollectionPublishOperation
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)handleZoneRemoved:(id)a3;
- (BOOL)needsToMakeNetworkRequest;
- (BOOL)wantsToExecute;
- (Class)expectedResponseClass;
- (PDCollectionPublishOperation)initWithDatabase:(id)a3;
- (PDCollectionPublishOperation)initWithDatabase:(id)a3 andObjectsToDelete:(id)a4;
- (id)acceptContentType;
- (id)createPayloadForDeletingCollection:(id)a3;
- (id)createPayloadForDeletingCollectionItem:(id)a3;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)objectsToDelete;
- (id)requestContentType;
- (id)requestData;
- (int)actionForPayload:(id)a3;
- (void)execute;
@end

@implementation PDCollectionPublishOperation

- (PDCollectionPublishOperation)initWithDatabase:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDCollectionPublishOperation;
  result = [(PDURLRequestOperation *)&v4 initWithDatabase:a3];
  if (result) {
    BYTE3(result->super.super._responseStatusError) = 1;
  }
  return result;
}

- (PDCollectionPublishOperation)initWithDatabase:(id)a3 andObjectsToDelete:(id)a4
{
  id v6 = a4;
  v7 = [(PDCollectionPublishOperation *)self initWithDatabase:a3];
  if (v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
            objc_msgSend(v8, "addObject:", v14, (void)v18);
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v15 = [v8 copy];
    v16 = *(void **)(&v7->super._responseStatusPayloadFailed + 3);
    *(void *)(&v7->super._responseStatusPayloadFailed + 3) = v15;

    BYTE3(v7->super.super._responseStatusError) = 1;
  }

  return v7;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 0x16) & (0x300002u >> a3);
}

- (id)endpointIdentifier
{
  return @"publishCollection";
}

- (int)actionForPayload:(id)a3
{
  return [a3 action];
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted]) {
    goto LABEL_31;
  }
  if (!*(void *)(&self->super._responseStatusPayloadFailed + 3))
  {
    [(PDEndpointRequestOperation *)self markAsFinished];
LABEL_31:
    v28 = 0;
    goto LABEL_32;
  }
  v3 = objc_alloc_init(PDDPPublishCollectionRequest);
  id v4 = objc_alloc_init((Class)PBDataWriter);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = *(id *)(&self->super._responseStatusPayloadFailed + 3);
  id v34 = [v5 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v36;
    *(void *)&long long v6 = 138543874;
    long long v30 = v6;
    id v31 = v5;
LABEL_5:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v36 != v33) {
        objc_enumerationMutation(v5);
      }
      uint64_t v8 = *(void *)(*((void *)&v35 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [(PDCollectionPublishOperation *)self createPayloadForDeletingCollection:v8];
      }
      else
      {
        id v10 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [(PDCollectionPublishOperation *)self createPayloadForDeletingCollectionItem:v8];

        id v10 = (void *)v11;
      }
      -[PDDPPublishCollectionRequest addPayload:](v3, "addPayload:", v10, v30);
      [(PDDPPublishCollectionRequest *)v3 writeTo:v4];
      [(PDDPPublishCollectionRequest *)v3 clearPayloads];
      uint64_t v12 = [v4 data];
      id v13 = [v12 length];
      uint64_t v14 = [(PDURLRequestOperation *)self stats];
      if (v14) {
        v14[10] = v13;
      }

      id v15 = [(PDURLRequestOperation *)self stats];
      if (v15) {
        ++v15[14];
      }

      CLSInitLog();
      v16 = [(PDCollectionPublishOperation *)self logSubsystem];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v24 = objc_opt_class();
        id v32 = v24;
        v25 = [(PDURLRequestOperation *)self operationID];
        v26 = [v10 dictionaryRepresentation];
        *(_DWORD *)buf = v30;
        v40 = v24;
        __int16 v41 = 2114;
        v42 = v25;
        __int16 v43 = 2112;
        v44 = v26;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);

        id v5 = v31;
      }

      uint64_t v17 = [(PDURLRequestOperation *)self stats];
      long long v18 = (void *)v17;
      uint64_t v19 = v17 ? *(void *)(v17 + 80) : 0;
      uint64_t v20 = [(PDURLRequestOperation *)self stats];
      long long v21 = (void *)v20;
      uint64_t v22 = v20 ? *(void *)(v20 + 112) : 0;
      unsigned __int8 v23 = [(PDEndpointRequestOperation *)self hasReachedRequestPayloadLimitBytes:v19 count:v22];

      if (v23) {
        break;
      }
      if (v34 == (id)++v7)
      {
        id v27 = [v5 countByEnumeratingWithState:&v35 objects:v45 count:16];
        id v34 = v27;
        if (v27) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  v28 = [v4 immutableData];

LABEL_32:

  return v28;
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
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
  v3.super_class = (Class)PDCollectionPublishOperation;
  [(PDEndpointRequestOperation *)&v3 execute];
  BYTE3(self->super.super._responseStatusError) = 0;
}

- (BOOL)wantsToExecute
{
  BOOL result = 0;
  if (BYTE3(self->super.super._responseStatusError))
  {
    v2 = *(void **)(&self->super._responseStatusPayloadFailed + 3);
    if (v2)
    {
      if ([v2 count]) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)needsToMakeNetworkRequest
{
  return 1;
}

- (id)logSubsystem
{
  return CLSLogCollection;
}

- (id)createPayloadForDeletingCollectionItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v4 setAction:3];
  [(PDDPPayload *)v4 setType:21];
  id v5 = sub_100024034(v3);

  [(PDDPPayload *)v4 setCollectionItem:v5];

  return v4;
}

- (id)createPayloadForDeletingCollection:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v4 setAction:3];
  [(PDDPPayload *)v4 setType:20];
  id v5 = sub_10002395C(v3);

  [(PDDPPayload *)v4 setCollection:v5];

  return v4;
}

- (id)objectsToDelete
{
  return *(id *)(&self->super._responseStatusPayloadFailed + 3);
}

- (void).cxx_destruct
{
}

@end