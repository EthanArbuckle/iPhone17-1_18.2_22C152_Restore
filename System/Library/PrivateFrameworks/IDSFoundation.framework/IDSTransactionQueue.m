@interface IDSTransactionQueue
- (IDSTransactionQueue)init;
- (NSMutableArray)transactions;
- (id)appendPendingItem:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_appendTransaction:(id)a3;
- (void)_prependTransaction:(id)a3;
- (void)_readyTransaction:(id)a3;
- (void)_removeTransaction:(id)a3;
- (void)appendItem:(id)a3;
- (void)executeReadyItemsWithBlock:(id)a3;
- (void)prependItem:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setTransactions:(id)a3;
@end

@implementation IDSTransactionQueue

- (IDSTransactionQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSTransactionQueue;
  v2 = [(IDSTransactionQueue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    transactions = v2->_transactions;
    v2->_transactions = 0;

    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)prependItem:(id)a3
{
  id v4 = a3;
  v5 = [IDSTransactionQueueTransaction alloc];
  id v10 = (id)objc_msgSend_initWithItem_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend__prependTransaction_(self, v8, (uint64_t)v10, v9);
}

- (void)appendItem:(id)a3
{
  id v4 = a3;
  v5 = [IDSTransactionQueueTransaction alloc];
  id v10 = (id)objc_msgSend_initWithItem_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend__appendTransaction_(self, v8, (uint64_t)v10, v9);
}

- (id)appendPendingItem:(id)a3
{
  id v4 = a3;
  v5 = [IDSTransactionQueueTransaction alloc];
  v8 = objc_msgSend_initWithItem_readyToExecute_(v5, v6, (uint64_t)v4, v7, 0);

  objc_msgSend__appendTransaction_(self, v9, (uint64_t)v8, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19DA1DFB8;
  v14[3] = &unk_1E5973CF8;
  v14[4] = self;
  id v15 = v8;
  id v11 = v8;
  v12 = _Block_copy(v14);

  return v12;
}

- (void)_prependTransaction:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  double v9 = objc_msgSend_transactions(self, v6, v7, v8);

  if (!v9)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend_setTransactions_(self, v14, (uint64_t)v13, v15);
  }
  v16 = objc_msgSend_transactions(self, v10, v11, v12);
  objc_msgSend_insertObject_atIndex_(v16, v17, (uint64_t)v5, v18, 0);

  os_unfair_lock_unlock(p_lock);
}

- (void)_appendTransaction:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  double v9 = objc_msgSend_transactions(self, v6, v7, v8);

  if (!v9)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend_setTransactions_(self, v14, (uint64_t)v13, v15);
  }
  v16 = objc_msgSend_transactions(self, v10, v11, v12);
  objc_msgSend_addObject_(v16, v17, (uint64_t)v5, v18);

  os_unfair_lock_unlock(p_lock);
}

- (void)_readyTransaction:(id)a3
{
  p_lock = &self->_lock;
  id v4 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_setReadyToExecute_(v4, v5, 1, v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeTransaction:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  double v9 = objc_msgSend_transactions(self, v6, v7, v8);
  objc_msgSend_removeObject_(v9, v10, (uint64_t)v5, v11);

  double v15 = objc_msgSend_transactions(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_count(v15, v16, v17, v18);

  if (!v19) {
    objc_msgSend_setTransactions_(self, v20, 0, v21);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)executeReadyItemsWithBlock:(id)a3
{
  v56 = (char *)a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = objc_msgSend_transactions(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);
  double v14 = v56;
  if (v11)
  {
    while (1)
    {
      double v15 = objc_msgSend_transactions(self, v14, v12, v13);
      uint64_t v19 = objc_msgSend_firstObject(v15, v16, v17, v18);
      int v23 = objc_msgSend_readyToExecute(v19, v20, v21, v22);

      if (!v23) {
        break;
      }
      v27 = objc_msgSend_transactions(self, v24, v25, v26);
      v31 = objc_msgSend_firstObject(v27, v28, v29, v30);

      v35 = objc_msgSend_transactions(self, v32, v33, v34);
      objc_msgSend_removeFirstObject(v35, v36, v37, v38);

      os_unfair_lock_unlock(&self->_lock);
      v42 = objc_msgSend_item(v31, v39, v40, v41);
      (*((void (**)(char *, void *))v56 + 2))(v56, v42);

      os_unfair_lock_lock(&self->_lock);
      uint64_t v7 = objc_msgSend_transactions(self, v43, v44, v45);
      if (!objc_msgSend_count(v7, v46, v47, v48)) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
  }
  v49 = objc_msgSend_transactions(self, v24, v25, v26);
  uint64_t v53 = objc_msgSend_count(v49, v50, v51, v52);

  if (!v53) {
    objc_msgSend_setTransactions_(self, v54, 0, v55);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end