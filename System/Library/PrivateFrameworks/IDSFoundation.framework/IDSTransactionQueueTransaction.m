@interface IDSTransactionQueueTransaction
- (BOOL)readyToExecute;
- (IDSTransactionQueueTransaction)initWithItem:(id)a3;
- (IDSTransactionQueueTransaction)initWithItem:(id)a3 readyToExecute:(BOOL)a4;
- (id)item;
- (void)setItem:(id)a3;
- (void)setReadyToExecute:(BOOL)a3;
@end

@implementation IDSTransactionQueueTransaction

- (IDSTransactionQueueTransaction)initWithItem:(id)a3
{
  return (IDSTransactionQueueTransaction *)objc_msgSend_initWithItem_readyToExecute_(self, a2, (uint64_t)a3, v3, 1);
}

- (IDSTransactionQueueTransaction)initWithItem:(id)a3 readyToExecute:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSTransactionQueueTransaction;
  v8 = [(IDSTransactionQueueTransaction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_item, a3);
    v9->_readyToExecute = a4;
  }

  return v9;
}

- (BOOL)readyToExecute
{
  return self->_readyToExecute;
}

- (void)setReadyToExecute:(BOOL)a3
{
  self->_readyToExecute = a3;
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end