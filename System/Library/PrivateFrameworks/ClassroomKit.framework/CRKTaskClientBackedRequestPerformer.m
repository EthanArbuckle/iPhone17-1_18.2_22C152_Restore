@interface CRKTaskClientBackedRequestPerformer
- (CATTaskClient)taskClient;
- (CRKTaskClientBackedRequestPerformer)initWithTaskClient:(id)a3;
- (id)operationForRequest:(id)a3;
@end

@implementation CRKTaskClientBackedRequestPerformer

- (CRKTaskClientBackedRequestPerformer)initWithTaskClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKTaskClientBackedRequestPerformer;
  v6 = [(CRKTaskClientBackedRequestPerformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskClient, a3);
  }

  return v7;
}

- (id)operationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKTaskClientBackedRequestPerformer *)self taskClient];
  v6 = [v5 prepareTaskOperationForRequest:v4];

  return v6;
}

- (CATTaskClient)taskClient
{
  return self->_taskClient;
}

- (void).cxx_destruct
{
}

@end