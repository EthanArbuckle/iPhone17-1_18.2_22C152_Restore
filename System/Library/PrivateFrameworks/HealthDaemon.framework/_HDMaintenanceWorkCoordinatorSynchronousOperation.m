@interface _HDMaintenanceWorkCoordinatorSynchronousOperation
- (_HDMaintenanceWorkCoordinatorSynchronousOperation)initWithName:(id)a3 queue:(id)a4 block:(id)a5;
- (_HDMaintenanceWorkCoordinatorSynchronousOperation)initWithName:(id)a3 queue:(id)a4 block:(id)a5 canceledBlock:(id)a6;
- (void)cancel;
- (void)main;
@end

@implementation _HDMaintenanceWorkCoordinatorSynchronousOperation

- (_HDMaintenanceWorkCoordinatorSynchronousOperation)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  return [(_HDMaintenanceWorkCoordinatorSynchronousOperation *)self initWithName:a3 queue:a4 block:a5 canceledBlock:0];
}

- (_HDMaintenanceWorkCoordinatorSynchronousOperation)initWithName:(id)a3 queue:(id)a4 block:(id)a5 canceledBlock:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_HDMaintenanceWorkCoordinatorSynchronousOperation;
  v14 = [(HDMaintenanceOperation *)&v21 initWithName:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a4);
    v16 = _Block_copy(v12);
    id block = v15->_block;
    v15->_id block = v16;

    v18 = _Block_copy(v13);
    id canceledBlock = v15->_canceledBlock;
    v15->_id canceledBlock = v18;
  }
  return v15;
}

- (void)cancel
{
  id canceledBlock = (void (**)(void))self->_canceledBlock;
  if (canceledBlock)
  {
    queue = self->_queue;
    if (queue) {
      dispatch_sync(queue, canceledBlock);
    }
    else {
      canceledBlock[2](canceledBlock);
    }
  }

  -[HDMaintenanceOperation finish]((uint64_t)self);
}

- (void)main
{
  queue = self->_queue;
  id block = (void (**)(void))self->_block;
  if (queue) {
    dispatch_sync(queue, block);
  }
  else {
    ((void (**)(id))block)[2](self->_block);
  }

  -[HDMaintenanceOperation finish]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canceledBlock, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end