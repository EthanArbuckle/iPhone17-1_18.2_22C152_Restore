@interface HKDaemonTransaction
+ (id)transactionWithName:(id)a3;
+ (id)transactionWithOwner:(id)a3;
+ (id)transactionWithOwner:(id)a3 activityName:(id)a4;
- (HKDaemonTransaction)init;
- (NSString)name;
- (id)_initWithName:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation HKDaemonTransaction

- (HKDaemonTransaction)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_initWithName:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKDaemonTransaction.m", 24, @"Invalid parameter not satisfying: %@", @"name.length > 0" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HKDaemonTransaction;
  v6 = [(HKDaemonTransaction *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    name = v6->_name;
    v6->_name = (NSString *)v7;

    id v9 = [@"com.apple.healthd." stringByAppendingString:v5];
    [v9 UTF8String];
    uint64_t v10 = os_transaction_create();
    transaction = v6->_transaction;
    v6->_transaction = (OS_os_transaction *)v10;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 16);
  int v7 = 138412546;
  v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  id v6 = v4;
  _os_log_fault_impl(&dword_19C023000, a2, OS_LOG_TYPE_FAULT, "%@ \"%@\" was not invalidated prior to deallocation", (uint8_t *)&v7, 0x16u);
}

+ (id)transactionWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _initWithName:v4];

  return v5;
}

+ (id)transactionWithOwner:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = (objc_class *)objc_opt_class();

  int v7 = NSStringFromClass(v6);
  v8 = (void *)[v5 _initWithName:v7];

  return v8;
}

+ (id)transactionWithOwner:(id)a3 activityName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = [NSString alloc];
  uint64_t v10 = (objc_class *)objc_opt_class();

  uint64_t v11 = NSStringFromClass(v10);
  v12 = (void *)[v9 initWithFormat:@"%@.%@", v11, v6];

  v13 = (void *)[v8 _initWithName:v12];

  return v13;
}

- (void)invalidate
{
  self->_transaction = 0;
  MEMORY[0x1F41817F8]();
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end