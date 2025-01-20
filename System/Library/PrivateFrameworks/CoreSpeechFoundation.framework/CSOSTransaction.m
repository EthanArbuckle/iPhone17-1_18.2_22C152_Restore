@interface CSOSTransaction
- (CSOSTransaction)initWithDescription:(id)a3;
- (void)dealloc;
@end

@implementation CSOSTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSOSTransaction dealloc]";
    __int16 v8 = 2114;
    v9 = description;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Release OS Transaction for %{public}@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSOSTransaction;
  [(CSOSTransaction *)&v5 dealloc];
}

- (CSOSTransaction)initWithDescription:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSOSTransaction;
  objc_super v5 = [(CSOSTransaction *)&v17 init];
  if (v5)
  {
    v6 = NSString;
    v7 = (void *)[v4 copy];
    __int16 v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    uint64_t v10 = [v6 stringWithFormat:@"%@-%@", v7, v9];
    description = v5->_description;
    v5->_description = (NSString *)v10;

    [(NSString *)v5->_description UTF8String];
    uint64_t v12 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v12;

    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v5->_description;
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSOSTransaction initWithDescription:]";
      __int16 v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating OS Transaction for %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

@end