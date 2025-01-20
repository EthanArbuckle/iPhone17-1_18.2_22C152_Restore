@interface BCSBusinessQueryRequest
- (NSUUID)requestId;
- (id)fetchEmailsCompletion;
- (id)fetchEmailsPerItemBlock;
- (void)setFetchEmailsCompletion:(id)a3;
- (void)setFetchEmailsPerItemBlock:(id)a3;
- (void)setRequestId:(id)a3;
@end

@implementation BCSBusinessQueryRequest

- (NSUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (id)fetchEmailsPerItemBlock
{
  return self->_fetchEmailsPerItemBlock;
}

- (void)setFetchEmailsPerItemBlock:(id)a3
{
}

- (id)fetchEmailsCompletion
{
  return self->_fetchEmailsCompletion;
}

- (void)setFetchEmailsCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchEmailsCompletion, 0);
  objc_storeStrong(&self->_fetchEmailsPerItemBlock, 0);

  objc_storeStrong((id *)&self->_requestId, 0);
}

@end