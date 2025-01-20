@interface PDRelayRequestOperation
+ (id)defaultEndpointInfo;
- (BOOL)processResponse:(id *)a3;
- (BOOL)shouldProcessResponseBody;
- (BOOL)wantsToExecute;
- (PDRelayRequestOperation)initWithDatabase:(id)a3 data:(id)a4 fileHandle:(id)a5 requestType:(unint64_t)a6;
- (id)acceptContentType;
- (id)endpointIdentifier;
- (id)requestContentType;
- (id)requestData;
- (void)didCompleteProcessingResponse;
- (void)execute;
- (void)prepareForNextRequest;
@end

@implementation PDRelayRequestOperation

+ (id)defaultEndpointInfo
{
  v2 = objc_alloc_init(PDEndpointInfo);
  sub_10007C770((uint64_t)v2, @"orion");
  sub_1000435F8((uint64_t)v2, @"fetchInsights");
  sub_100043608((uint64_t)v2, @"https://p1-pg-iosclient.itunes.apple.com/v1/fetchinsights");
  if (v2)
  {
    v2->_payloadLimitItems = 0;
    v2->_payloadLimitBytes = 0;
    v2->_responseTTLSeconds = 60;
    *(_WORD *)&v2->_requiresAuth = 257;
  }
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (PDRelayRequestOperation)initWithDatabase:(id)a3 data:(id)a4 fileHandle:(id)a5 requestType:(unint64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PDRelayRequestOperation;
  v13 = [(PDURLRequestOperation *)&v16 initWithDatabase:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 226), a4);
    objc_storeStrong((id *)(v14 + 234), a5);
    *(void *)(v14 + 242) = a6;
  }

  return (PDRelayRequestOperation *)v14;
}

- (BOOL)shouldProcessResponseBody
{
  return 0;
}

- (void)prepareForNextRequest
{
  v3 = [PDURLResponse alloc];
  v4 = [(PDURLRequestOperation *)self operationID];
  v5 = sub_10010078C((id *)&v3->super.isa, v4, *(void **)((char *)&self->_data + 2));

  [(PDURLRequestOperation *)self prepareForNextRequestWithResponse:v5];
}

- (id)endpointIdentifier
{
  return @"fetchInsights";
}

- (BOOL)processResponse:(id *)a3
{
  return 1;
}

- (void)didCompleteProcessingResponse
{
  [(PDEndpointRequestOperation *)self markAsFinished];
  v3.receiver = self;
  v3.super_class = (Class)PDRelayRequestOperation;
  [(PDEndpointRequestOperation *)&v3 didCompleteProcessingResponse];
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted]) {
    id v3 = 0;
  }
  else {
    id v3 = *(id *)((char *)&self->super._responseStatusError + 2);
  }

  return v3;
}

- (id)requestContentType
{
  return @"application/x-protobuf";
}

- (id)acceptContentType
{
  return @"application/x-protobuf";
}

- (void)execute
{
  v2.receiver = self;
  v2.super_class = (Class)PDRelayRequestOperation;
  [(PDEndpointRequestOperation *)&v2 execute];
}

- (BOOL)wantsToExecute
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_data + 2), 0);

  objc_storeStrong((id *)((char *)&self->super._responseStatusError + 2), 0);
}

@end