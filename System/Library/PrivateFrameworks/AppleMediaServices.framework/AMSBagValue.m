@interface AMSBagValue
+ (AMSThreadSafeSet)globalBagValueStorage;
+ (BOOL)_value:(id)a3 isKindOfValueType:(unint64_t)a4;
+ (id)_valueFromDictionary:(id)a3 forBagKey:(id)a4;
+ (id)bagValueWithKey:(id)a3 valueType:(unint64_t)a4 valuePromise:(id)a5;
+ (id)failingBagValueWithKey:(id)a3 valueType:(unint64_t)a4 error:(id)a5;
+ (id)frozenBagValueWithKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5;
- (ACAccount)account;
- (AMSBagDataSourceProtocol)dataSource;
- (AMSBagValue)initWithDataSource:(id)a3 key:(id)a4 valueType:(unint64_t)a5;
- (AMSBagValue)initWithDataSource:(id)a3 key:(id)a4 valueType:(unint64_t)a5 account:(id)a6;
- (AMSBagValue)valueWithCompletion:(id)a3;
- (AMSBagValue)valueWithError:(id *)a3;
- (BOOL)isLoaded;
- (NSArray)transformBlocks;
- (NSString)key;
- (id)_processedDefaultValue:(id)a3;
- (id)_processedDefaultValuePromise:(id)a3;
- (id)transformWithBlock:(id)a3;
- (id)valuePromise;
- (unint64_t)valueType;
- (void)_applyTransformsToValue:(id)a3 index:(int64_t)a4 completion:(id)a5;
- (void)_handleSuccessWithValue:(id)a3 isDefault:(BOOL)a4 completion:(id)a5;
- (void)setAccount:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setKey:(id)a3;
- (void)setTransformBlocks:(id)a3;
- (void)setValueType:(unint64_t)a3;
@end

@implementation AMSBagValue

- (AMSBagValue)valueWithError:(id *)a3
{
  v4 = [(AMSBagValue *)self valuePromise];
  v5 = [v4 resultWithError:a3];

  return (AMSBagValue *)v5;
}

- (id)valuePromise
{
  v3 = objc_alloc_init(AMSMutablePromise);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__AMSBagValue_valuePromise__block_invoke;
  v6[3] = &unk_1E55A01F8;
  v4 = v3;
  v7 = v4;
  [(AMSBagValue *)self valueWithCompletion:v6];

  return v4;
}

void __35__AMSBagValue_valueWithCompletion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      v7 = +[AMSLogConfig sharedBagConfig];
      if (!v7)
      {
        v7 = +[AMSLogConfig sharedConfig];
      }
      v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = AMSLogKey();
        v10 = NSString;
        if (v9)
        {
          uint64_t v11 = objc_opt_class();
          v12 = AMSLogKey();
          v13 = [v10 stringWithFormat:@"%@: [%@] ", v11, v12];
        }
        else
        {
          v13 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v12 = v13;
        }
        v21 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543618;
        v40 = v13;
        __int16 v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received error when handling value after default-checking. error = %{public}@", buf, 0x16u);
        if (v9) {
      }
        }
      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v15 = +[AMSLogConfig sharedBagConfig];
      [v14 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v15 userInfo:0];
    }
    else
    {
      v14 = +[AMSLogConfig sharedBagConfig];
      if (!v14)
      {
        v14 = +[AMSLogConfig sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v16 = AMSLogKey();
        v17 = NSString;
        if (v16)
        {
          uint64_t v18 = objc_opt_class();
          v19 = AMSLogKey();
          v20 = [v17 stringWithFormat:@"%@: [%@] ", v18, v19];
        }
        else
        {
          v20 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v19 = v20;
        }
        v22 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543618;
        v40 = v20;
        __int16 v41 = 2114;
        v42 = v22;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_FAULT, "%{public}@Unexpectedly received error when handling value after default-checking. error = %{public}@", buf, 0x16u);
        if (v16) {
      }
        }
    }
  }
  v23 = [v5 first];
  v24 = [v5 second];
  char v25 = [v24 BOOLValue];

  if (v23)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_61;
    v36[3] = &unk_1E55A0158;
    v26 = *(void **)(a1 + 40);
    id v37 = *(id *)(a1 + 48);
    char v38 = v25;
    [v26 _applyTransformsToValue:v23 index:0 completion:v36];
    v27 = v37;
  }
  else
  {
    uint64_t v28 = *(void *)(a1 + 48);
    v27 = [*(id *)(a1 + 32) key];
    v35 = [*(id *)(a1 + 32) dataSource];
    v34 = AMSErrorWithFormat(204, @"Bag Value Missing", @"The bag does not contain %@ nor did anyone register a default value. %@", v29, v30, v31, v32, v33, (uint64_t)v27);
    (*(void (**)(uint64_t, void, void, void, void *))(v28 + 16))(v28, 0, 0, 0, v34);
  }
}

- (void)_applyTransformsToValue:(id)a3 index:(int64_t)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, id, void))a5;
  if (a4 < 0) {
    goto LABEL_6;
  }
  v10 = [(AMSBagValue *)self transformBlocks];
  unint64_t v11 = [v10 count];

  if (v11 <= a4
    || ([(AMSBagValue *)self transformBlocks],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 objectAtIndexedSubscript:a4],
        v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
LABEL_6:
    v9[2](v9, v8, 0);
  }
  else
  {
    v14 = ((void (**)(void, id))v13)[2](v13, v8);
    if (v14)
    {
      v15 = [[AMSMutablePromise alloc] initWithTimeout:60.0];
      [(AMSMutablePromise *)v15 finishWithPromise:v14];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __56__AMSBagValue__applyTransformsToValue_index_completion___block_invoke;
      v20[3] = &unk_1E55A0220;
      v20[4] = self;
      int64_t v22 = a4;
      v21 = v9;
      [(AMSPromise *)v15 addFinishBlock:v20];
    }
    else
    {
      v16 = +[AMSLogConfig sharedBagConfig];
      if (!v16)
      {
        v16 = +[AMSLogConfig sharedConfig];
      }
      v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        v19 = [(AMSBagValue *)self key];
        *(_DWORD *)buf = 138543874;
        uint64_t v24 = v18;
        __int16 v25 = 2048;
        int64_t v26 = a4;
        __int16 v27 = 2114;
        uint64_t v28 = v19;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Transform (%ld) block returned nil promise for %{public}@. Resolving with previous value.", buf, 0x20u);
      }
      v9[2](v9, v8, 0);
    }
  }
}

void __35__AMSBagValue_valueWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  if (v9)
  {
    if (*(void *)(a1 + 32))
    {
      v10 = [NSString stringWithFormat:@" [%@]", *(void *)(a1 + 32)];
    }
    else
    {
      v10 = &stru_1EDCA7308;
    }
    if (a4) {
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    }
    else {
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    }
    v12 = +[AMSLogConfig sharedBagConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, v11))
    {
      v17 = v10;
      uint64_t v14 = objc_opt_class();
      v15 = [*(id *)(a1 + 40) key];
      v16 = [*(id *)(a1 + 40) dataSource];
      *(_DWORD *)buf = 138544386;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      v21 = v17;
      __int16 v22 = 2114;
      v23 = v15;
      __int16 v24 = 2114;
      id v25 = v9;
      __int16 v26 = 2114;
      __int16 v27 = v16;
      _os_log_impl(&dword_18D554000, v13, v11, "%{public}@:%{public}@ Failed to fetch value: %{public}@. %{public}@ %{public}@", buf, 0x34u);

      v10 = v17;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __27__AMSBagValue_valuePromise__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2);
}

uint64_t __35__AMSBagValue_valueWithCompletion___block_invoke_61(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), 1, a3);
}

- (NSArray)transformBlocks
{
  return self->_transformBlocks;
}

void __35__AMSBagValue_valueWithCompletion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [(id)objc_opt_class() globalBagValueStorage];
  [v8 removeObject:WeakRetained];

  if (v5)
  {
    id v9 = [v5 data];
    v10 = [WeakRetained key];
    os_log_type_t v11 = +[AMSBagValue _valueFromDictionary:v9 forBagKey:v10];

    if ([WeakRetained valueType] == 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_2;
      v23[3] = &unk_1E55A00E0;
      v23[4] = WeakRetained;
      v12 = +[AMSBagURLParser URLBySubstitutingVariablesInURLString:v11 usingPromiseBlock:v23];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_4;
      v22[3] = &unk_1E55A0108;
      v22[4] = WeakRetained;
      uint64_t v13 = [(AMSOptional *)v12 continueWithBlock:v22];
    }
    else
    {
      v12 = [[AMSOptional alloc] initWithValue:v11];
      uint64_t v13 = +[AMSPromise promiseWithResult:v12];
    }
    uint64_t v14 = (void *)v13;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_5;
    v20[3] = &unk_1E55A01A8;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 32);
    v20[4] = WeakRetained;
    void v20[5] = v16;
    id v21 = v15;
    [v14 addFinishBlock:v20];
  }
  else
  {
    v17 = NSString;
    uint64_t v18 = [WeakRetained key];
    os_log_type_t v11 = [v17 stringWithFormat:@"Unable to retrieve %@ because we failed to load the bag.", v18];

    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v14 = AMSError(203, @"Bag Load Failed", v11, v6);
    (*(void (**)(uint64_t, void, void, uint64_t, void *))(v19 + 16))(v19, 0, 0, 1, v14);
  }
}

- (NSString)key
{
  return self->_key;
}

+ (id)_valueFromDictionary:(id)a3 forBagKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x192FA47D0]();
  id v8 = [v5 allKeys];
  int v9 = [v8 containsObject:v6];

  if (v9)
  {
    id v10 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    os_log_type_t v11 = [v6 componentsSeparatedByString:@"/"];
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= [v11 count])
      {
        id v10 = 0;
        goto LABEL_13;
      }
      uint64_t v13 = [v11 objectAtIndexedSubscript:i];
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      if (!v14)
      {
LABEL_9:
        id v10 = 0;
        goto LABEL_12;
      }
      if (i == [v11 count] - 1) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_9;
      }

      id v5 = v14;
    }
    id v10 = v14;
LABEL_12:

LABEL_13:
  }

  return v10;
}

void __35__AMSBagValue_valueWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v7 = [v5 value];
    if (![*(id *)(a1 + 32) valueType] && v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_8;
      }
      v31[0] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

      v7 = (void *)v8;
    }
    if (!v7)
    {
      id v21 = *(void **)(a1 + 32);
      __int16 v22 = [v21 dataSource];
      v23 = [*(id *)(a1 + 32) key];
      __int16 v24 = [v22 defaultValueForKey:v23];
      id v25 = [v21 _processedDefaultValuePromise:v24];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_6;
      v30[3] = &unk_1E55A0130;
      v30[4] = *(void *)(a1 + 32);
      v12 = [v25 continueWithBlock:v30];

      v7 = 0;
      goto LABEL_12;
    }
LABEL_8:
    if (!+[AMSBagValue _value:isKindOfValueType:](AMSBagValue, "_value:isKindOfValueType:", v7, [*(id *)(a1 + 32) valueType]))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      v12 = [*(id *)(a1 + 32) key];
      [*(id *)(a1 + 32) valueType];
      uint64_t v14 = (objc_class *)objc_opt_class();
      __int16 v27 = NSStringFromClass(v14);
      __int16 v20 = AMSErrorWithFormat(202, @"Bag Key Value Type Mismatch", @"The bag value for %@ doesn't match the type you requested. (requestedValueType = %li | actualValueClass = %@)", v15, v16, v17, v18, v19, (uint64_t)v12);
      (*(void (**)(uint64_t, void, void, uint64_t, void *))(v13 + 16))(v13, 0, 0, 1, v20);

LABEL_13:
      goto LABEL_14;
    }
    int v9 = [AMSPair alloc];
    id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
    os_log_type_t v11 = [(AMSPair *)v9 initWithFirst:v7 second:v10];
    v12 = +[AMSPromise promiseWithResult:v11];

LABEL_12:
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_54;
    v28[3] = &unk_1E55A0180;
    v28[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 48);
    v28[5] = *(void *)(a1 + 40);
    id v29 = v26;
    [v12 addFinishBlock:v28];

    goto LABEL_13;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (AMSBagValue)valueWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSBagValue globalBagValueStorage];
  [v5 addObject:self];

  id v6 = AMSLogKey();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__AMSBagValue_valueWithCompletion___block_invoke;
  aBlock[3] = &unk_1E55A0090;
  id v7 = v6;
  id v18 = v7;
  uint64_t v19 = self;
  id v8 = v4;
  id v20 = v8;
  int v9 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  id v10 = [(AMSBagValue *)self dataSource];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_13;
  v13[3] = &unk_1E55A01D0;
  objc_copyWeak(&v15, &location);
  id v11 = v9;
  v13[4] = self;
  id v14 = v11;
  [v10 loadWithCompletion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return result;
}

+ (AMSThreadSafeSet)globalBagValueStorage
{
  if (_MergedGlobals_86 != -1) {
    dispatch_once(&_MergedGlobals_86, &__block_literal_global_18);
  }
  v2 = (void *)qword_1EB38D6C8;
  return (AMSThreadSafeSet *)v2;
}

- (AMSBagDataSourceProtocol)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (AMSBagDataSourceProtocol *)WeakRetained;
}

+ (BOOL)_value:(id)a3 isKindOfValueType:(unint64_t)a4
{
  id v5 = a3;
  if (a4 >= 7)
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_processedDefaultValuePromise:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  unint64_t v6 = [(AMSBagValue *)self valueType];
  if (v5 && v6 == 5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__AMSBagValue__processedDefaultValuePromise___block_invoke;
    v11[3] = &unk_1E55A00E0;
    v11[4] = self;
    id v7 = +[AMSBagURLParser URLBySubstitutingVariablesInURLString:v5 usingPromiseBlock:v11];
    uint64_t v8 = [(AMSOptional *)v7 thenWithBlock:&__block_literal_global_70];
  }
  else
  {
    id v7 = [[AMSOptional alloc] initWithValue:v4];
    uint64_t v8 = +[AMSPromise promiseWithResult:v7];
  }
  int v9 = (void *)v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformBlocks, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

id __35__AMSBagValue_valueWithCompletion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      unint64_t v6 = +[AMSLogConfig sharedBagConfig];
      if (!v6)
      {
        unint64_t v6 = +[AMSLogConfig sharedConfig];
      }
      id v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = AMSLogKey();
        int v9 = NSString;
        if (v8)
        {
          uint64_t v10 = objc_opt_class();
          id v11 = AMSLogKey();
          v12 = [v9 stringWithFormat:@"%@: [%@] ", v10, v11];
        }
        else
        {
          v12 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          id v11 = v12;
        }
        id v20 = AMSLogableError(v5);
        *(_DWORD *)buf = 138543618;
        id v29 = v12;
        __int16 v30 = 2114;
        uint64_t v31 = v20;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received error when processing default value. error = %{public}@", buf, 0x16u);
        if (v8) {
      }
        }
      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v14 = +[AMSLogConfig sharedBagConfig];
      [v13 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v14 userInfo:0];
    }
    else
    {
      uint64_t v13 = +[AMSLogConfig sharedBagConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        id v15 = AMSLogKey();
        uint64_t v16 = NSString;
        if (v15)
        {
          uint64_t v17 = objc_opt_class();
          id v18 = AMSLogKey();
          uint64_t v19 = [v16 stringWithFormat:@"%@: [%@] ", v17, v18];
        }
        else
        {
          uint64_t v19 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          id v18 = v19;
        }
        id v21 = AMSLogableError(v5);
        *(_DWORD *)buf = 138543618;
        id v29 = v19;
        __int16 v30 = 2114;
        uint64_t v31 = v21;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_FAULT, "%{public}@Unexpectedly received error when processing default value. error = %{public}@", buf, 0x16u);
        if (v15) {
      }
        }
    }
  }
  __int16 v22 = [v4 value];
  v23 = [AMSPair alloc];
  __int16 v24 = [MEMORY[0x1E4F28ED0] numberWithBool:v22 != 0];
  id v25 = [(AMSPair *)v23 initWithFirst:v22 second:v24];
  id v26 = +[AMSPromise promiseWithResult:v25];

  return v26;
}

id __35__AMSBagValue_valueWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [[AMSOptional alloc] initWithValue:v5];
    uint64_t v8 = +[AMSPromise promiseWithResult:v7];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) key];
    id v14 = AMSErrorWithFormat(200, @"Invalid Bag Value", @"The URL was malformed for key: %@", v9, v10, v11, v12, v13, (uint64_t)v7);
    uint64_t v8 = +[AMSPromise promiseWithError:v14];
  }
  return v8;
}

void __35__AMSBagValue_valueWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = *(void **)(a1 + 32);
  id v4 = [[AMSOptional alloc] initWithValue:v5];
  [v3 finishWithResult:v4];
}

- (BOOL)isLoaded
{
  v2 = [(AMSBagValue *)self dataSource];
  char v3 = [v2 isLoaded];

  return v3;
}

- (AMSBagValue)initWithDataSource:(id)a3 key:(id)a4 valueType:(unint64_t)a5 account:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AMSBagValue;
  uint64_t v13 = [(AMSBagValue *)&v16 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_account, a6);
    objc_storeWeak((id *)&v14->_dataSource, v10);
    objc_storeStrong((id *)&v14->_key, a4);
    v14->_valueType = a5;
  }

  return v14;
}

- (AMSBagValue)initWithDataSource:(id)a3 key:(id)a4 valueType:(unint64_t)a5
{
  return [(AMSBagValue *)self initWithDataSource:a3 key:a4 valueType:a5 account:0];
}

uint64_t __36__AMSBagValue_globalBagValueStorage__block_invoke()
{
  qword_1EB38D6C8 = objc_alloc_init(AMSThreadSafeSet);
  return MEMORY[0x1F41817F8]();
}

+ (id)bagValueWithKey:(id)a3 valueType:(unint64_t)a4 valuePromise:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [[AMSBridgedBagValue alloc] initWithKey:v7 valueType:a4 valuePromise:v8];

  return v9;
}

+ (id)failingBagValueWithKey:(id)a3 valueType:(unint64_t)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [[AMSFailingBagValue alloc] initWithKey:v7 valueType:a4 error:v8];

  return v9;
}

AMSMutablePromise *__35__AMSBagValue_valueWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = [*(id *)(a1 + 32) dataSource];
  id v6 = [*(id *)(a1 + 32) account];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_3;
  v9[3] = &unk_1E55A00B8;
  id v7 = v4;
  id v10 = v7;
  [v5 valueForURLVariable:v3 account:v6 completion:v9];

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

+ (id)frozenBagValueWithKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [[AMSFrozenBagValue alloc] initWithKey:v7 value:v8 valueType:a5];

  return v9;
}

- (id)transformWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [AMSBagValue alloc];
  id v6 = [(AMSBagValue *)self dataSource];
  id v7 = [(AMSBagValue *)self key];
  unint64_t v8 = [(AMSBagValue *)self valueType];
  uint64_t v9 = [(AMSBagValue *)self account];
  id v10 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v7 valueType:v8 account:v9];

  id v11 = [(AMSBagValue *)self transformBlocks];
  id v12 = (void *)[v11 mutableCopy];
  uint64_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v15 = v14;

  objc_super v16 = (void *)[v4 copy];
  [v15 addObject:v16];

  [(AMSBagValue *)v10 setTransformBlocks:v15];
  return v10;
}

void __56__AMSBagValue__applyTransformsToValue_index_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedBagConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    unint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = [*(id *)(a1 + 32) key];
      int v12 = 138544130;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Transform (%ld) failed for %{public}@. %{public}@", (uint8_t *)&v12, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _applyTransformsToValue:v5 index:*(void *)(a1 + 48) + 1 completion:*(void *)(a1 + 40)];
  }
}

- (void)_handleSuccessWithValue:(id)a3 isDefault:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = +[AMSBagValue globalBagValueStorage];
  [v10 removeObject:self];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__AMSBagValue__handleSuccessWithValue_isDefault_completion___block_invoke;
  v12[3] = &unk_1E55A0158;
  id v11 = v9;
  id v13 = v11;
  BOOL v14 = a4;
  [(AMSBagValue *)self _applyTransformsToValue:v8 index:0 completion:v12];
}

uint64_t __60__AMSBagValue__handleSuccessWithValue_isDefault_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), a3);
}

- (id)_processedDefaultValue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ([(AMSBagValue *)self valueType] == 5)
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass())
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __38__AMSBagValue__processedDefaultValue___block_invoke;
      v7[3] = &unk_1E55A0248;
      v7[4] = self;
      id v5 = +[AMSBagURLParser URLBySubstitutingVariablesInURLString:v4 usingBlock:v7];
    }
  }

  return v5;
}

id __38__AMSBagValue__processedDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [*(id *)(a1 + 32) account];
  id v6 = [v4 valueForURLVariable:v3 account:v5];

  return v6;
}

AMSMutablePromise *__45__AMSBagValue__processedDefaultValuePromise___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = [*(id *)(a1 + 32) dataSource];
  id v6 = [*(id *)(a1 + 32) account];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__AMSBagValue__processedDefaultValuePromise___block_invoke_2;
  v9[3] = &unk_1E55A00B8;
  id v7 = v4;
  uint64_t v10 = v7;
  [v5 valueForURLVariable:v3 account:v6 completion:v9];

  return v7;
}

void __45__AMSBagValue__processedDefaultValuePromise___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [[AMSOptional alloc] initWithValue:v5];
  [v3 finishWithResult:v4];
}

id __45__AMSBagValue__processedDefaultValuePromise___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = +[AMSOptional optionalWithValue:a2];
  id v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

- (void)setKey:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)setTransformBlocks:(id)a3
{
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

@end