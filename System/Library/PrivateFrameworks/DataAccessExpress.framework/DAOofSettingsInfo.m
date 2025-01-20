@interface DAOofSettingsInfo
- (DAOofResponseDelegate)consumer;
- (NSString)requestID;
- (void)setConsumer:(id)a3;
- (void)setRequestID:(id)a3;
@end

@implementation DAOofSettingsInfo

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (DAOofResponseDelegate)consumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  return (DAOofResponseDelegate *)WeakRetained;
}

- (void)setConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_consumer);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end