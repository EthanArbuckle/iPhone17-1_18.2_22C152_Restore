@interface LACEvaluationRequestDefault
- (BOOL)isPurposeApplePay;
- (BOOL)isPurposeUnlock;
- (BOOL)isRecoveringFromBiolockout;
- (LACXPCClient)client;
- (NSData)acl;
- (NSData)externalizedContext;
- (NSDictionary)options;
- (NSDictionary)payload;
- (NSError)retryingForError;
- (NSUUID)contextID;
- (id)aclOperation;
- (int64_t)policy;
- (int64_t)purpose;
- (unsigned)evaluationUserId;
- (unsigned)identifier;
- (void)setClient:(id)a3;
- (void)setExternalizedContext:(id)a3;
- (void)setRetryingForError:(id)a3;
@end

@implementation LACEvaluationRequestDefault

- (NSData)acl
{
  return self->acl;
}

- (id)aclOperation
{
  return self->aclOperation;
}

- (LACXPCClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->client);
  return (LACXPCClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (NSUUID)contextID
{
  return self->contextID;
}

- (unsigned)evaluationUserId
{
  return self->evaluationUserId;
}

- (NSData)externalizedContext
{
  return self->externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
}

- (unsigned)identifier
{
  return self->identifier;
}

- (BOOL)isPurposeApplePay
{
  return self->isPurposeApplePay;
}

- (BOOL)isPurposeUnlock
{
  return self->isPurposeUnlock;
}

- (NSDictionary)options
{
  return self->options;
}

- (NSDictionary)payload
{
  return self->payload;
}

- (int64_t)policy
{
  return self->policy;
}

- (int64_t)purpose
{
  return self->purpose;
}

- (NSError)retryingForError
{
  return self->retryingForError;
}

- (void)setRetryingForError:(id)a3
{
}

- (BOOL)isRecoveringFromBiolockout
{
  return self->isRecoveringFromBiolockout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->retryingForError, 0);
  objc_storeStrong((id *)&self->payload, 0);
  objc_storeStrong((id *)&self->options, 0);
  objc_storeStrong((id *)&self->externalizedContext, 0);
  objc_storeStrong((id *)&self->contextID, 0);
  objc_destroyWeak((id *)&self->client);
  objc_storeStrong(&self->aclOperation, 0);
  objc_storeStrong((id *)&self->acl, 0);
}

@end