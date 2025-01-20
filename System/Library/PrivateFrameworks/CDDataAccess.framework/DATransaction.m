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
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = [(DATransaction *)self transactionId];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1C86FF000, v4, v5, "DATransaction exiting, ID: %@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)DATransaction;
  [(DATransaction *)&v7 dealloc];
}

- (DATransaction)init
{
  v7.receiver = self;
  v7.super_class = (Class)DATransaction;
  v2 = [(DATransaction *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(NSString, "da_newGUID");
    transactionId = v2->_transactionId;
    v2->_transactionId = (NSString *)v3;

    objc_storeStrong((id *)&v2->_label, v2->_transactionId);
    os_log_type_t v5 = +[DATransactionMonitor sharedTransactionMonitor];
    [v5 incrementTransactionCountForTransaction:v2->_transactionId];
  }
  return v2;
}

- (DATransaction)initWithLabel:(id)a3
{
  id v5 = a3;
  v6 = [(DATransaction *)self init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_label, a3);
  }

  return v7;
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
}

@end