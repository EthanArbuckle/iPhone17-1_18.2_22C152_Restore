@interface MTRAsyncWorkItem
- (MTRAsyncWorkItem)initWithQueue:(id)a3;
- (id)batchableData;
- (id)batchingHandler;
- (id)cancelHandler;
- (id)description;
- (id)duplicateCheckHandler;
- (id)readyHandler;
- (unint64_t)batchingID;
- (unint64_t)duplicateTypeID;
- (unint64_t)uniqueID;
- (void)setBatchingID:(unint64_t)a3 data:(id)a4 handler:(id)a5;
- (void)setCancelHandler:(id)a3;
- (void)setDuplicateTypeID:(unint64_t)a3 handler:(id)a4;
- (void)setReadyHandler:(id)a3;
@end

@implementation MTRAsyncWorkItem

- (MTRAsyncWorkItem)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTRAsyncWorkItem;
  v6 = [(MTRAsyncWorkItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_uniqueID = atomic_fetch_add(&qword_268EBD100, 1uLL);
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_state = 0;
  }

  return v7;
}

- (void)setReadyHandler:(id)a3
{
  v4 = (void *)MEMORY[0x2456969D0](a3, a2);
  id readyHandler = self->_readyHandler;
  self->_id readyHandler = v4;
}

- (void)setCancelHandler:(id)a3
{
  v4 = (void *)MEMORY[0x2456969D0](a3, a2);
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = v4;
}

- (void)setBatchingID:(unint64_t)a3 data:(id)a4 handler:(id)a5
{
  self->_batchingID = a3;
  objc_storeStrong(&self->_batchableData, a4);
  id v11 = a4;
  id v8 = a5;
  objc_super v9 = (void *)MEMORY[0x2456969D0]();

  id batchingHandler = self->_batchingHandler;
  self->_id batchingHandler = v9;
}

- (void)setDuplicateTypeID:(unint64_t)a3 handler:(id)a4
{
  self->_duplicateTypeID = a3;
  id v5 = (void *)MEMORY[0x2456969D0](a4, a2);
  id duplicateCheckHandler = self->_duplicateCheckHandler;
  self->_id duplicateCheckHandler = v5;
}

- (id)description
{
  unint64_t state = self->_state;
  if (state >= 3)
  {
    id v8 = NSString;
    uint64_t v9 = objc_opt_class();
    unint64_t v11 = self->_state;
    BOOL v12 = v11 >= 3;
    unint64_t v13 = v11 - 3;
    if (!v12) {
      unint64_t v13 = 0;
    }
    objc_msgSend_stringWithFormat_(v8, v10, @"<%@ %llu running retry: %ld>", v9, self->_uniqueID, v13);
  }
  else
  {
    v4 = off_26519B700[state];
    id v5 = NSString;
    uint64_t v6 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v5, v7, @"<%@ %llu %@>", v6, self->_uniqueID, v4);
  v14 = };

  return v14;
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (id)readyHandler
{
  return self->_readyHandler;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (unint64_t)batchingID
{
  return self->_batchingID;
}

- (id)batchableData
{
  return self->_batchableData;
}

- (id)batchingHandler
{
  return self->_batchingHandler;
}

- (unint64_t)duplicateTypeID
{
  return self->_duplicateTypeID;
}

- (id)duplicateCheckHandler
{
  return self->_duplicateCheckHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_duplicateCheckHandler, 0);
  objc_storeStrong(&self->_batchingHandler, 0);
  objc_storeStrong(&self->_batchableData, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_readyHandler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end