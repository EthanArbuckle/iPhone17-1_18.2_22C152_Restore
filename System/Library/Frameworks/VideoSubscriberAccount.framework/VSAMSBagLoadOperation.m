@interface VSAMSBagLoadOperation
- (NSError)error;
- (NSString)bagKey;
- (id)value;
- (void)executionDidBegin;
- (void)setBagKey:(id)a3;
- (void)setError:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation VSAMSBagLoadOperation

- (void)executionDidBegin
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSAMSBagLoadOperation executionDidBegin]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v4 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vs_defaultBag");
  v5 = [(VSAMSBagLoadOperation *)self bagKey];
  v6 = [v4 stringForKey:v5];

  v7 = [(VSAMSBagLoadOperation *)self bagKey];
  v8 = v7;
  if (v7 == @"SoleProviderFeatureEnabled")
  {

LABEL_7:
    v10 = [(VSAMSBagLoadOperation *)self bagKey];
    uint64_t v11 = [v4 BOOLForKey:v10];

    v6 = (void *)v11;
    goto LABEL_8;
  }
  v9 = [(VSAMSBagLoadOperation *)self bagKey];

  if (v9 == @"ShowMultiAppInstallForCaseAlwaysRequirePassword") {
    goto LABEL_7;
  }
LABEL_8:
  v12 = [v6 valuePromise];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__VSAMSBagLoadOperation_executionDidBegin__block_invoke;
  v13[3] = &unk_1E6BD3F70;
  v13[4] = self;
  [v12 addFinishBlock:v13];
}

void __42__VSAMSBagLoadOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [*(id *)(a1 + 32) bagKey];
    int v12 = 138412802;
    id v13 = v5;
    __int16 v14 = 2112;
    v15 = v8;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Finished loading value %@ for AMS bag key %@ with error %@", (uint8_t *)&v12, 0x20u);
  }
  [*(id *)(a1 + 32) setValue:v5];
  v9 = [v6 domain];
  if (![v9 isEqualToString:*MEMORY[0x1E4F4DA40]])
  {

    goto LABEL_9;
  }
  uint64_t v10 = [v6 code];

  if (v10 != 204)
  {
LABEL_9:
    [*(id *)(a1 + 32) setError:v6];
    goto LABEL_10;
  }
  uint64_t v11 = VSDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1DA674000, v11, OS_LOG_TYPE_DEFAULT, "Bag error was AMSErrorCodeBagValueMissing, ignoring error", (uint8_t *)&v12, 2u);
  }

LABEL_10:
  [*(id *)(a1 + 32) finishExecutionIfPossible];
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_bagKey, 0);
}

@end