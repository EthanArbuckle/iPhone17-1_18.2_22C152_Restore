@interface SFTelephonyURLRequest
- (NSString)failureNotificationName;
- (NSString)successNotificationName;
- (SFTelephonyURLRequest)initWithCompletionHandler:(id)a3;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setFailureNotificationName:(id)a3;
- (void)setSuccessNotificationName:(id)a3;
@end

@implementation SFTelephonyURLRequest

- (SFTelephonyURLRequest)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFTelephonyURLRequest;
  v5 = [(SFTelephonyURLRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1AD0C36A0](v4);
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = (id)v6;

    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    successNotificationName = v5->_successNotificationName;
    v5->_successNotificationName = (NSString *)v9;

    v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];
    failureNotificationName = v5->_failureNotificationName;
    v5->_failureNotificationName = (NSString *)v12;
  }
  return v5;
}

- (NSString)successNotificationName
{
  return self->_successNotificationName;
}

- (void)setSuccessNotificationName:(id)a3
{
}

- (NSString)failureNotificationName
{
  return self->_failureNotificationName;
}

- (void)setFailureNotificationName:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_failureNotificationName, 0);

  objc_storeStrong((id *)&self->_successNotificationName, 0);
}

@end