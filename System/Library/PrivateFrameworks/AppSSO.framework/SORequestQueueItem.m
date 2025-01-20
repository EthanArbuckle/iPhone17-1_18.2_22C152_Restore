@interface SORequestQueueItem
- (BOOL)isRunning;
- (NSString)description;
- (SOAuthorizationRequestParameters)requestParameters;
- (SORequestQueueItem)initWithService:(id)a3 requestParameters:(id)a4 completionBlock:(id)a5;
- (SOServiceProtocol)service;
- (id)completionBlock;
- (void)setIsRunning:(BOOL)a3;
@end

@implementation SORequestQueueItem

- (SORequestQueueItem)initWithService:(id)a3 requestParameters:(id)a4 completionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SORequestQueueItem;
  v12 = [(SORequestQueueItem *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    objc_storeStrong((id *)&v13->_requestParameters, a4);
    uint64_t v14 = MEMORY[0x21D46DFC0](v11);
    id completionBlock = v13->_completionBlock;
    v13->_id completionBlock = (id)v14;

    v13->_isRunning = 0;
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)[(SOAuthorizationRequestParameters *)self->_requestParameters description];
}

- (SOServiceProtocol)service
{
  return self->_service;
}

- (SOAuthorizationRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end