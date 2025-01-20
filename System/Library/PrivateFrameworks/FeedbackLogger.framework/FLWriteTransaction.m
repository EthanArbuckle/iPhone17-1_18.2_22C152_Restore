@interface FLWriteTransaction
- (FLWriteTransaction)init;
- (OS_os_log)log;
- (OS_os_transaction)transaction;
- (RBSAssertion)rbsAssertion;
- (void)dealloc;
- (void)setLog:(id)a3;
- (void)setRbsAssertion:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation FLWriteTransaction

- (void)dealloc
{
  [(RBSAssertion *)self->_rbsAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FLWriteTransaction;
  [(FLWriteTransaction *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_rbsAssertion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setRbsAssertion:(id)a3
{
}

- (RBSAssertion)rbsAssertion
{
  return self->_rbsAssertion;
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (FLWriteTransaction)init
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)FLWriteTransaction;
  v2 = [(FLWriteTransaction *)&v21 init];
  objc_super v3 = v2;
  if (v2)
  {
    uint64_t v4 = flLogForObject(v2);
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    uint64_t v6 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v6;

    v8 = [MEMORY[0x1E4F96478] currentProcess];
    v9 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
    id v10 = objc_alloc(MEMORY[0x1E4F96318]);
    v24[0] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v12 = [v10 initWithExplanation:@"FLLogger" target:v8 attributes:v11];
    rbsAssertion = v3->_rbsAssertion;
    v3->_rbsAssertion = (RBSAssertion *)v12;

    v14 = v3->_rbsAssertion;
    id v20 = 0;
    [(RBSAssertion *)v14 acquireWithError:&v20];
    id v15 = v20;
    if (v15)
    {
      v16 = v3->_log;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = v16;
        v19 = [v15 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_error_impl(&dword_1BA2B8000, v18, OS_LOG_TYPE_ERROR, "Error acquiring write assertion: %@.", buf, 0xCu);
      }
    }
  }
  return v3;
}

@end