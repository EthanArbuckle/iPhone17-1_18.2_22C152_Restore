@interface BDSOSTransactionProvider
- (BDSOSTransactionDelegate)delegate;
- (id)createTransactionWithName:(const char *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BDSOSTransactionProvider

- (id)createTransactionWithName:(const char *)a3
{
  v5 = [BDSOSTransaction alloc];
  v12 = objc_msgSend_initWithTransactionName_(v5, v6, (uint64_t)a3, v7, v8, v9, v10, v11);
  v20 = objc_msgSend_delegate(self, v13, v14, v15, v16, v17, v18, v19);

  if (v20)
  {
    v28 = objc_msgSend_delegate(self, v21, v22, v23, v24, v25, v26, v27);
    objc_msgSend_setDelegate_(v12, v29, (uint64_t)v28, v30, v31, v32, v33, v34);

    v42 = objc_msgSend_delegate(self, v35, v36, v37, v38, v39, v40, v41);
    objc_msgSend_transactionDidBeginWithName_(v42, v43, (uint64_t)a3, v44, v45, v46, v47, v48);
  }
  return v12;
}

- (BDSOSTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BDSOSTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end