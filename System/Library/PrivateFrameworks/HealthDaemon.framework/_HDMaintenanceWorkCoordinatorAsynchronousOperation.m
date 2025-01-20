@interface _HDMaintenanceWorkCoordinatorAsynchronousOperation
- (_HDMaintenanceWorkCoordinatorAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4;
- (_HDMaintenanceWorkCoordinatorAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4 canceledBlock:(id)a5;
- (void)cancel;
- (void)main;
@end

@implementation _HDMaintenanceWorkCoordinatorAsynchronousOperation

- (_HDMaintenanceWorkCoordinatorAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4
{
  return [(_HDMaintenanceWorkCoordinatorAsynchronousOperation *)self initWithName:a3 operationBlock:a4 canceledBlock:0];
}

- (_HDMaintenanceWorkCoordinatorAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4 canceledBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_HDMaintenanceWorkCoordinatorAsynchronousOperation;
  v10 = [(HDMaintenanceOperation *)&v16 initWithName:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    id operationBlock = v10->_operationBlock;
    v10->_id operationBlock = (id)v11;

    v13 = _Block_copy(v9);
    id canceledBlock = v10->_canceledBlock;
    v10->_id canceledBlock = v13;
  }
  return v10;
}

- (void)cancel
{
  id canceledBlock = (void (**)(id, void *))self->_canceledBlock;
  if (canceledBlock)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60___HDMaintenanceWorkCoordinatorAsynchronousOperation_cancel__block_invoke;
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
  id operationBlock = (void (**)(id, void *))self->_operationBlock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58___HDMaintenanceWorkCoordinatorAsynchronousOperation_main__block_invoke;
  v3[3] = &unk_1E62F3208;
  v3[4] = self;
  operationBlock[2](operationBlock, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canceledBlock, 0);

  objc_storeStrong(&self->_operationBlock, 0);
}

@end