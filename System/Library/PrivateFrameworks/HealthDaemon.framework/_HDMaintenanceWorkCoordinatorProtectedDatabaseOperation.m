@interface _HDMaintenanceWorkCoordinatorProtectedDatabaseOperation
- (_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation)initWithName:(id)a3 database:(id)a4 operationBlock:(id)a5;
- (_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation)initWithName:(id)a3 database:(id)a4 operationBlock:(id)a5 canceledBlock:(id)a6;
- (void)cancel;
- (void)dealloc;
- (void)main;
@end

@implementation _HDMaintenanceWorkCoordinatorProtectedDatabaseOperation

- (_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation)initWithName:(id)a3 database:(id)a4 operationBlock:(id)a5
{
  return [(_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation *)self initWithName:a3 database:a4 operationBlock:a5 canceledBlock:0];
}

- (_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation)initWithName:(id)a3 database:(id)a4 operationBlock:(id)a5 canceledBlock:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation;
  v14 = [(HDMaintenanceOperation *)&v26 initWithName:v10];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_database, a4);
    uint64_t v16 = [v12 copy];
    id operationBlock = v15->_operationBlock;
    v15->_id operationBlock = (id)v16;

    v18 = _Block_copy(v13);
    id canceledBlock = v15->_canceledBlock;
    v15->_id canceledBlock = v18;

    id v25 = 0;
    uint64_t v20 = [v11 takeAccessibilityAssertionWithOwnerIdentifier:v10 timeout:&v25 error:600.0];
    id v21 = v25;
    accessibilityAssertion = v15->_accessibilityAssertion;
    v15->_accessibilityAssertion = (HDAssertion *)v20;

    if (!v15->_accessibilityAssertion)
    {
      _HKInitializeLogging();
      v23 = HKLogInfrastructure();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v15;
        __int16 v29 = 2114;
        id v30 = v21;
        _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Error taking accessibility assertion: %{public}@", buf, 0x16u);
      }
    }
  }

  return v15;
}

- (void)dealloc
{
  [(HDAssertion *)self->_accessibilityAssertion invalidate];
  accessibilityAssertion = self->_accessibilityAssertion;
  self->_accessibilityAssertion = 0;

  [(HKDaemonTransaction *)self->_transaction invalidate];
  transaction = self->_transaction;
  self->_transaction = 0;

  v5.receiver = self;
  v5.super_class = (Class)_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation;
  [(_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation *)&v5 dealloc];
}

- (void)cancel
{
  id canceledBlock = (void (**)(id, void *))self->_canceledBlock;
  if (canceledBlock)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_cancel__block_invoke;
    v4[3] = &unk_1E62F3208;
    v4[4] = self;
    canceledBlock[2](canceledBlock, v4);
  }
  else
  {
    -[HDMaintenanceOperation finish]((uint64_t)self);
  }
}

- (void)main
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = +[HKDaemonTransaction transactionWithOwner:self];
  transaction = self->_transaction;
  self->_transaction = v3;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_main__block_invoke;
  aBlock[3] = &unk_1E62F3208;
  aBlock[4] = self;
  objc_super v5 = _Block_copy(aBlock);
  v6 = +[HDDatabaseTransactionContext contextForAccessibilityAssertion:self->_accessibilityAssertion];
  database = self->_database;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_main__block_invoke_2;
  v13[3] = &unk_1E63035C8;
  v13[4] = self;
  id v8 = v5;
  id v14 = v8;
  BOOL v9 = [(HDDatabase *)database performWithTransactionContext:v6 error:&v15 block:v13];
  id v10 = v15;
  if (!v9)
  {
    _HKInitializeLogging();
    id v11 = HKLogInfrastructure();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_fault_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_FAULT, "%{public}@ Error performing initial transaction context: %{public}@", buf, 0x16u);
    }

    (*((void (**)(id, HDDatabase *, void, id, uint64_t))self->_operationBlock + 2))(self->_operationBlock, self->_database, 0, v8, v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canceledBlock, 0);
  objc_storeStrong(&self->_operationBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end