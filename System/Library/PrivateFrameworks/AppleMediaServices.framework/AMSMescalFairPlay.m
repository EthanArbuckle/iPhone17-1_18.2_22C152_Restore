@interface AMSMescalFairPlay
- (AMSMescalFairPlay)initWithMescalType:(int64_t)a3 logKey:(id)a4 error:(id *)a5;
- (BOOL)isComplete;
- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4;
- (BOOL)verifySignature:(id)a3 forData:(id)a4 error:(id *)a5;
- (NSString)logKey;
- (id)_dataWithFairPlayBytes:(const char *)a3 length:(unsigned int)a4;
- (id)exchangeData:(id)a3 error:(id *)a4;
- (id)primingSignatureForData:(id)a3 error:(id *)a4;
- (id)signData:(id)a3 error:(id *)a4;
- (void)_teardownSession;
- (void)dealloc;
- (void)setLogKey:(id)a3;
@end

@implementation AMSMescalFairPlay

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setLogKey:(id)a3
{
}

- (id)signData:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  uint64_t context = (uint64_t)self->_context;
  if (context)
  {
    uint64_t v28 = 0;
    unsigned int v27 = 0;
    id v9 = v6;
    Fc3vhtJDvr(context, [v9 bytes], objc_msgSend(v9, "length"), (uint64_t)&v28, (uint64_t)&v27);
    if (v10)
    {
      int v11 = v10;
      v12 = +[AMSLogConfig sharedConfig];
      if (!v12)
      {
        v12 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_opt_class();
        id v15 = v14;
        v16 = [(AMSMescalFairPlay *)self logKey];
        *(_DWORD *)buf = 138543874;
        v30 = v14;
        __int16 v31 = 2114;
        v32 = v16;
        __int16 v33 = 2048;
        uint64_t v34 = v11;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] SAPExchange failed: %ld", buf, 0x20u);
      }
      if (v11 == -42186)
      {
        v17 = @"Bad SAP session for signing";
        uint64_t v18 = 302;
        v19 = 0;
      }
      else
      {
        v17 = @"Mescal Failed";
        v19 = @"Bad SAP signature";
        uint64_t v18 = 304;
      }
      uint64_t v20 = AMSError(v18, v17, v19, 0);
      uint64_t context = 0;
    }
    else
    {
      uint64_t context = [(AMSMescalFairPlay *)self _dataWithFairPlayBytes:v28 length:v27];
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = AMSError(304, @"Mescal Failed", @"No SAP context for signing", 0);
  }
  if (!(v20 | context))
  {
    uint64_t v20 = AMSError(0, @"FairPlay Mescal Failed", @"An unknown error occurred signing data", 0);
  }
  if (v20)
  {
    if (a4)
    {
      *a4 = (id) v20;
    }
    else
    {
      v21 = +[AMSLogConfig sharedConfig];
      if (!v21)
      {
        v21 = +[AMSLogConfig sharedConfig];
      }
      v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        id v24 = v23;
        v25 = [(AMSMescalFairPlay *)self logKey];
        *(_DWORD *)buf = 138543874;
        v30 = v23;
        __int16 v31 = 2114;
        v32 = v25;
        __int16 v33 = 2114;
        uint64_t v34 = v20;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to signing data. Error = %{public}@", buf, 0x20u);
      }
    }
  }

  return (id)context;
}

- (id)_dataWithFairPlayBytes:(const char *)a3 length:(unsigned int)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 length:a4 deallocator:&__block_literal_global_84];
  return v4;
}

void __51__AMSMescalFairPlay__dataWithFairPlayBytes_length___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  uint64_t context = (uint64_t)self->_context;
  if (context)
  {
    uint64_t v27 = 0;
    unsigned int v26 = 0;
    char v25 = -1;
    if (self->_mescalType == 2) {
      uint64_t v9 = 210;
    }
    else {
      uint64_t v9 = 200;
    }
    id v10 = v6;
    Mib5yocT(v9, (uint64_t)&self->_hardwareInfo, context, [v10 bytes], objc_msgSend(v10, "length"), (uint64_t)&v27, (uint64_t)&v26, (uint64_t)&v25);
    if (v11)
    {
      int v12 = v11;
      v13 = +[AMSLogConfig sharedConfig];
      if (!v13)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = objc_opt_class();
        id v16 = v15;
        v17 = [(AMSMescalFairPlay *)self logKey];
        *(_DWORD *)buf = 138543874;
        v29 = v15;
        __int16 v30 = 2114;
        __int16 v31 = v17;
        __int16 v32 = 2048;
        uint64_t v33 = v12;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] SAPExchange failed: %ld", buf, 0x20u);
      }
      uint64_t context = 0;
    }
    else
    {
      self->_complete = v25 == 0;
      uint64_t context = [(AMSMescalFairPlay *)self _dataWithFairPlayBytes:v27 length:v26];
    }
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = AMSError(304, @"Mescal Failed", @"No context available for exchange", 0);
  }
  if (!(v18 | context))
  {
    uint64_t v18 = AMSError(0, @"FairPlay Mescal Failed", @"An unknown error occurred exchanging data", 0);
  }
  if (v18)
  {
    if (a4)
    {
      *a4 = (id) v18;
    }
    else
    {
      v19 = +[AMSLogConfig sharedConfig];
      if (!v19)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        id v22 = v21;
        v23 = [(AMSMescalFairPlay *)self logKey];
        *(_DWORD *)buf = 138543874;
        v29 = v21;
        __int16 v30 = 2114;
        __int16 v31 = v23;
        __int16 v32 = 2114;
        uint64_t v33 = v18;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to exchange data. Error = %{public}@", buf, 0x20u);
      }
    }
  }

  return (id)context;
}

- (AMSMescalFairPlay)initWithMescalType:(int64_t)a3 logKey:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)AMSMescalFairPlay;
  uint64_t v9 = [(AMSMescalFairPlay *)&v30 init];
  id v10 = v9;
  if (!v9) {
    goto LABEL_13;
  }
  if (!AMSFairPlayGetHardwareInfo((uint64_t)&v9->_hardwareInfo))
  {
    uint64_t v17 = AMSError(12, @"Mescal Failed", @"Failed to fetch hardware info", 0);
    goto LABEL_6;
  }
  cp2g1b9ro((uint64_t)&v10->_context, (uint64_t)&v10->_hardwareInfo);
  if (v11)
  {
    uint64_t v17 = AMSErrorWithFormat(12, @"Mescal Failed", @"SAPInit failed: %ld", v12, v13, v14, v15, v16, v11);
LABEL_6:
    id v18 = (id)v17;
    goto LABEL_7;
  }
  id v18 = 0;
LABEL_7:
  v10->_mescalType = a3;
  uint64_t v19 = [v8 copy];
  logKey = v10->_logKey;
  v10->_logKey = (NSString *)v19;

  if (!v18)
  {
LABEL_13:
    char v25 = v10;
    id v18 = 0;
    goto LABEL_20;
  }
  v21 = +[AMSLogConfig sharedConfig];
  if (!v21)
  {
    v21 = +[AMSLogConfig sharedConfig];
  }
  id v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = NSString;
    uint64_t v24 = objc_opt_class();
    if (v8) {
      [v23 stringWithFormat:@"%@: [%@] ", v24, v8];
    }
    else {
    unsigned int v26 = [v23 stringWithFormat:@"%@: ", v24, v29];
    }
    uint64_t v27 = AMSLogableError(v18);
    *(_DWORD *)buf = 138543618;
    __int16 v32 = v26;
    __int16 v33 = 2112;
    uint64_t v34 = v27;
    _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@Init failed: %@", buf, 0x16u);
  }
  if (a5)
  {
    id v18 = v18;
    char v25 = 0;
    *a5 = v18;
  }
  else
  {
    char v25 = 0;
  }
LABEL_20:

  return v25;
}

- (void)dealloc
{
  uint64_t context = self->_context;
  if (context) {
    IPaI1oem5iL((uint64_t)context);
  }
  v4.receiver = self;
  v4.super_class = (Class)AMSMescalFairPlay;
  [(AMSMescalFairPlay *)&v4 dealloc];
}

- (id)primingSignatureForData:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  unsigned int v27 = 0;
  uint64_t context = self->_context;
  id v7 = a3;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];

  jfkdDAjba3jd((uint64_t)context, 100, v8, v9, &v28, &v27);
  if (v10)
  {
    int v11 = v10;
    uint64_t v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = v14;
      uint64_t v16 = [(AMSMescalFairPlay *)self logKey];
      *(_DWORD *)buf = 138543874;
      objc_super v30 = v14;
      __int16 v31 = 2114;
      __int16 v32 = v16;
      __int16 v33 = 2048;
      id v34 = (id)v11;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Could not SAP prime: %lu", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v20 = [(AMSMescalFairPlay *)self _dataWithFairPlayBytes:v28 length:v27];
    if (v20)
    {
      uint64_t v19 = (void *)v20;
      id v18 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v17 = AMSError(0, @"FairPlay Mescal Failed", @"An unknown error occurred priming data", 0);
  id v18 = v17;
  if (v17)
  {
    if (a4)
    {
      id v18 = v17;
      uint64_t v19 = 0;
      *a4 = v18;
      goto LABEL_18;
    }
    v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      v21 = +[AMSLogConfig sharedConfig];
    }
    id v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      id v24 = v23;
      char v25 = [(AMSMescalFairPlay *)self logKey];
      *(_DWORD *)buf = 138543874;
      objc_super v30 = v23;
      __int16 v31 = 2114;
      __int16 v32 = v25;
      __int16 v33 = 2114;
      id v34 = v18;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to prime data. Error = %{public}@", buf, 0x20u);
    }
  }
  uint64_t v19 = 0;
LABEL_18:

  return v19;
}

- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!self->_context)
  {
    uint64_t v16 = AMSError(304, @"Mescal Failed", @"No SAP context for prime verification", 0);
    if (v16)
    {
      uint64_t v17 = v16;
      if (a4)
      {
        id v18 = v16;
        *a4 = v18;
      }
      else
      {
        uint64_t v20 = +[AMSLogConfig sharedConfig];
        if (!v20)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        v21 = [v20 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = objc_opt_class();
          id v23 = v22;
          id v24 = [(AMSMescalFairPlay *)self logKey];
          int v26 = 138543874;
          unsigned int v27 = v22;
          __int16 v28 = 2114;
          uint64_t v29 = v24;
          __int16 v30 = 2114;
          __int16 v31 = v17;
          _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to verify primed signature. Error = %{public}@", (uint8_t *)&v26, 0x20u);
        }
      }
    }
    goto LABEL_17;
  }
  id v8 = v6;
  [v8 bytes];
  [v8 length];
  gLg1CWr7p();
  if (v9)
  {
    int v10 = v9;
    int v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      int v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = v13;
      id v15 = [(AMSMescalFairPlay *)self logKey];
      int v26 = 138543874;
      unsigned int v27 = v13;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      __int16 v30 = 2048;
      __int16 v31 = (void *)v10;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%public}@] SAPExchange failed: %ld", (uint8_t *)&v26, 0x20u);
    }
    [(AMSMescalFairPlay *)self _teardownSession];
LABEL_17:
    BOOL v19 = 0;
    goto LABEL_18;
  }
  BOOL v19 = 1;
LABEL_18:

  return v19;
}

- (BOOL)verifySignature:(id)a3 forData:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!self->_context)
  {
    BOOL v19 = @"Mescal Failed";
    uint64_t v20 = @"No SAP context for signature verification";
LABEL_12:
    uint64_t v21 = 304;
    goto LABEL_13;
  }
  id v10 = v8;
  [v10 bytes];
  [v10 length];
  id v11 = v9;
  [v11 mutableBytes];
  [v11 length];
  gLg1CWr7p();
  if (!v12)
  {
    BOOL v22 = 1;
    goto LABEL_23;
  }
  int v13 = v12;
  id v14 = +[AMSLogConfig sharedConfig];
  if (!v14)
  {
    id v14 = +[AMSLogConfig sharedConfig];
  }
  id v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    id v17 = v16;
    id v18 = [(AMSMescalFairPlay *)self logKey];
    int v31 = 138543874;
    uint64_t v32 = v16;
    __int16 v33 = 2114;
    id v34 = v18;
    __int16 v35 = 2048;
    v36 = (void *)v13;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] SAPExchange failed: %ld", (uint8_t *)&v31, 0x20u);
  }
  if (v13 != -42186)
  {
    BOOL v19 = @"Mescal Failed";
    uint64_t v20 = @"Bad SAP signature verification";
    goto LABEL_12;
  }
  BOOL v19 = @"Bad Session";
  uint64_t v20 = @"Bad SAP session for signature verification";
  uint64_t v21 = 302;
LABEL_13:
  id v23 = AMSError(v21, v19, v20, 0);
  id v24 = v23;
  if (v23)
  {
    if (a5)
    {
      *a5 = v23;
    }
    else
    {
      char v25 = +[AMSLogConfig sharedConfig];
      if (!v25)
      {
        char v25 = +[AMSLogConfig sharedConfig];
      }
      int v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        unsigned int v27 = objc_opt_class();
        id v28 = v27;
        uint64_t v29 = [(AMSMescalFairPlay *)self logKey];
        int v31 = 138543874;
        uint64_t v32 = v27;
        __int16 v33 = 2114;
        id v34 = v29;
        __int16 v35 = 2114;
        v36 = v24;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to verifying signature. Error = %{public}@", (uint8_t *)&v31, 0x20u);
      }
    }
  }
  BOOL v22 = 0;
LABEL_23:

  return v22;
}

- (void)_teardownSession
{
  uint64_t context = self->_context;
  if (context)
  {
    IPaI1oem5iL((uint64_t)context);
    self->_uint64_t context = 0;
  }
  self->_complete = 0;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void).cxx_destruct
{
}

@end