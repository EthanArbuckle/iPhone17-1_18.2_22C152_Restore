@interface DATransaction
- (DATransaction)init;
- (DATransaction)initWithLabel:(id)a3;
- (NSString)label;
- (NSString)transactionId;
- (void)dealloc;
@end

@implementation DATransaction

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = +[DATransactionMonitor sharedTransactionMonitor];
  [v3 decrementTransactionCountForTransaction:self->_transactionId];

  v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = [(DATransaction *)self transactionId];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1BA384000, v4, v5, "DATransaction exiting, ID: %@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)DATransaction;
  [(DATransaction *)&v7 dealloc];
}

- (DATransaction)init
{
  return [(DATransaction *)self initWithLabel:0];
}

- (DATransaction)initWithLabel:(id)a3
{
  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)DATransaction;
  os_log_type_t v5 = [(DATransaction *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSString, "da_newGUID");
    transactionId = v5->_transactionId;
    v5->_transactionId = (NSString *)v6;

    v8 = v4;
    if (!v4) {
      v8 = v5->_transactionId;
    }
    v9 = v8;
    label = v5->_label;
    v5->_label = v9;

    [(NSString *)v5->_label UTF8String];
    uint64_t v11 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v11;

    v13 = +[DATransactionMonitor sharedTransactionMonitor];
    [v13 incrementTransactionCountForTransaction:v5->_transactionId];
  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end