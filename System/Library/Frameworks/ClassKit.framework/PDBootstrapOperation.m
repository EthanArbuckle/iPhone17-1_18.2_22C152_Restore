@interface PDBootstrapOperation
- (BOOL)canSkipExecution;
- (id)acceptContentType;
- (id)httpMethod;
- (id)overrideConfig:(id)a3;
- (id)replaceEndpoints:(id)a3 excludeEndpointIDs:(id)a4 forServiceID:(id)a5;
- (id)requestContentType;
- (id)saveEndpointConfig:(id)a3;
- (void)prepare;
@end

@implementation PDBootstrapOperation

- (id)httpMethod
{
  return @"GET";
}

- (id)requestContentType
{
  return 0;
}

- (id)acceptContentType
{
  return @"application/x-protobuf";
}

- (BOOL)canSkipExecution
{
  uint64_t v3 = [(PDEndpointRequestOperation *)self endpointInfo];
  v4 = (void *)v3;
  if (!v3 || *(double *)(v3 + 16) == 0.0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v5 = [(PDEndpointRequestOperation *)self endpointInfo];
    BOOL v6 = !sub_1000DA3C0((BOOL)v5);
  }
  return v6;
}

- (void)prepare
{
  v4.receiver = self;
  v4.super_class = (Class)PDBootstrapOperation;
  [(PDAsyncOperation *)&v4 prepare];
  if ([(PDBootstrapOperation *)self canSkipExecution])
  {
    v3.receiver = self;
    v3.super_class = (Class)PDBootstrapOperation;
    [(PDOperation *)&v3 setFinished:1];
  }
}

- (id)saveEndpointConfig:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PDEndpointInfo);
  BOOL v6 = [v4 serviceId];
  sub_10007C770((uint64_t)v5, v6);

  v7 = [v4 identifier];
  sub_1000435F8((uint64_t)v5, v7);

  v8 = [v4 url];
  sub_100043608((uint64_t)v5, v8);

  v9 = sub_1000DA200(v5);

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v10 = +[NSError cls_createErrorWithCode:307 description:@"Server sent invalid URL!"];
  }
  signed int v11 = [v4 payloadLimitBytes];
  if (v5)
  {
    v5->_payloadLimitBytes = v11;
    v5->_payloadLimitItems = (int)[v4 payloadLimitItems];
    v5->_responseTTLSeconds = (int)[v4 responseTTLSeconds];
    v5->_requiresAuth = [v4 requiresAuth];
  }
  else
  {
    [v4 payloadLimitItems];
    [v4 responseTTLSeconds];
    [v4 requiresAuth];
  }
  if ([v4 hasIsInternal])
  {
    unsigned __int8 v12 = [v4 isInternal];
    if (v5) {
      v5->_isInternal = v12;
    }
  }
  v13 = [(PDOperation *)self database];
  unsigned __int8 v14 = [v13 insertOrUpdateObject:v5];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = +[NSError cls_createErrorWithCode:100 description:@"save EndpointInfo failed!"];

    v10 = (void *)v15;
  }

  return v10;
}

- (id)replaceEndpoints:(id)a3 excludeEndpointIDs:(id)a4 forServiceID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = objc_opt_new();
  [v11 addObject:v10];
  if ([v9 count])
  {
    +[PDDatabase whereSQLForArray:v9 prefix:@"serviceID = ? AND NOT identifier IN "];
    unsigned __int8 v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v11 addObjectsFromArray:v9];
  }
  else
  {
    unsigned __int8 v12 = @"serviceID = ?";
  }
  v13 = [(PDOperation *)self database];
  [v13 deleteAll:objc_opt_class() where:v12 bindings:v11];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    v26 = v11;
    id v27 = v9;
    uint64_t v17 = *(void *)v29;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (v10)
        {
          if ([@"orion" isEqualToString:v10])
          {
            v21 = [v19 serviceId];

            if (!v21) {
              [v19 setServiceId:@"orion"];
            }
          }
        }
        v22 = [(PDBootstrapOperation *)self overrideConfig:v19];
        if (v22)
        {
          uint64_t v23 = [(PDBootstrapOperation *)self saveEndpointConfig:v22];
          if (v23)
          {
            v24 = (void *)v23;

            goto LABEL_19;
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16) {
        continue;
      }
      break;
    }
    v24 = 0;
LABEL_19:
    signed int v11 = v26;
    id v9 = v27;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)overrideConfig:(id)a3
{
  id v3 = a3;

  return v3;
}

@end