@interface AMSMescalSession
+ (AMSMescalSession)sessionWithType:(int64_t)a3;
+ (id)defaultSession;
+ (id)primeSession;
- (AMSMescalSession)initWithType:(int64_t)a3;
- (BOOL)_cacheCertData:(id)a3 expiration:(double)a4;
- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4;
- (id)_cachedCertData;
- (id)_cachedCertPath;
- (id)primeSignatureForData:(id)a3 bag:(id)a4;
- (id)primeSignatureForData:(id)a3 bag:(id)a4 error:(id *)a5;
- (id)signData:(id)a3 bag:(id)a4;
- (id)signData:(id)a3 bag:(id)a4 error:(id *)a5;
- (id)verifyData:(id)a3 withSignature:(id)a4 bag:(id)a5;
- (id)verifyPrimeSignature:(id)a3;
@end

@implementation AMSMescalSession

id __33__AMSMescalSession_initWithType___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained _cachedCertData];
  }
  else
  {
    v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      v4 = +[AMSLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      uint64_t v8 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Attempted to get cached certificate from deallocated AMSMescalSession", (uint8_t *)&v7, 0xCu);
    }

    v3 = 0;
  }

  return v3;
}

- (id)_cachedCertData
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSMescalSession *)self _cachedCertPath];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v5 = [v4 fileExistsAtPath:v3];

    if (!v5)
    {
      v6 = 0;
      goto LABEL_29;
    }
    id v24 = 0;
    v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:0 error:&v24];
    id v7 = v24;
    uint64_t v8 = v7;
    if (!v6 || v7)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
      if (!v9)
      {
        uint64_t v9 = +[AMSLogConfig sharedConfig];
      }
      v11 = [v9 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v26 = v17;
        __int16 v27 = 2114;
        v28 = v8;
        id v18 = v17;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to find cert data. Error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v9 = +[AMSDefaults mescalCertExpiration];
      v10 = [MEMORY[0x1E4F1C9C8] date];
      v11 = v10;
      if (v9 && [v10 compare:v9] != 1)
      {
        v19 = +[AMSLogConfig sharedConfig];
        if (!v19)
        {
          v19 = +[AMSLogConfig sharedConfig];
        }
        v20 = [v19 OSLogObject];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v26 = v21;
          id v22 = v21;
          _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Loaded cert data", buf, 0xCu);
        }
      }
      else
      {
        v12 = +[AMSLogConfig sharedConfig];
        if (!v12)
        {
          v12 = +[AMSLogConfig sharedConfig];
        }
        v13 = [v12 OSLogObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v26 = v14;
          id v15 = v14;
          _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Removing expired cert data cache", buf, 0xCu);
        }
        [(AMSMescalSession *)self _cacheCertData:0 expiration:0.0];

        v6 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = (id)objc_opt_class();
      id v16 = v26;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_INFO, "%{public}@: Failed to determine cache path", buf, 0xCu);
    }
    v6 = 0;
  }

LABEL_29:
  return v6;
}

- (id)_cachedCertPath
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = [v3 lastObject];
  int v5 = objc_msgSend(v2, "initWithObjects:", v4, @"com.apple.AppleMediaServices", 0);

  v6 = [NSString pathWithComponents:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if (([v7 fileExistsAtPath:v6] & 1) != 0
    || (uint64_t v8 = 0,
        [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0]))
  {
    uint64_t v8 = [v6 stringByAppendingPathComponent:@"sap-setup-cert.txt"];
  }

  return v8;
}

uint64_t __34__AMSMescalSession_defaultSession__block_invoke()
{
  qword_1EB38DD48 = [[AMSMescalSession alloc] initWithType:1];
  return MEMORY[0x1F41817F8]();
}

- (AMSMescalSession)initWithType:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AMSMescalSession;
  v4 = [(AMSMescalSession *)&v14 init];
  if (v4)
  {
    objc_initWeak(&location, v4);
    int v5 = [AMSMescalFairplaySession alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__AMSMescalSession_initWithType___block_invoke;
    v11[3] = &unk_1E55A3E50;
    objc_copyWeak(&v12, &location);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__AMSMescalSession_initWithType___block_invoke_4;
    v9[3] = &unk_1E55A3E78;
    objc_copyWeak(&v10, &location);
    uint64_t v6 = [(AMSMescalFairplaySession *)v5 initWithMescalType:a3 cachedCertificateProvider:v11 certificateCacher:v9];
    session = v4->_session;
    v4->_session = (AMSMescalFairplaySession *)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (id)signData:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(AMSMutablePromise);
  session = self->_session;
  id v10 = AMSLogKey();
  v11 = [(AMSPromise *)v8 completionHandlerAdapter];
  [(AMSMescalFairplaySession *)session signData:v7 bag:v6 logKey:v10 completionHandler:v11];

  return v8;
}

+ (AMSMescalSession)sessionWithType:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = +[AMSMescalSession primeSession];
  }
  else if (a3 == 1)
  {
    v3 = +[AMSMescalSession defaultSession];
  }
  else
  {
    v3 = 0;
  }
  return (AMSMescalSession *)v3;
}

+ (id)defaultSession
{
  if (_MergedGlobals_127 != -1) {
    dispatch_once(&_MergedGlobals_127, &__block_literal_global_85);
  }
  id v2 = (void *)qword_1EB38DD48;
  return v2;
}

void __33__AMSMescalSession_initWithType___block_invoke_4(uint64_t a1, void *a2, double a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _cacheCertData:v5 expiration:a3];
  }
  else
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      uint64_t v11 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Attempted to cache certificate in deallocated AMSMescalSession", (uint8_t *)&v10, 0xCu);
    }
  }
}

+ (id)primeSession
{
  if (qword_1EB38DD50 != -1) {
    dispatch_once(&qword_1EB38DD50, &__block_literal_global_8_0);
  }
  id v2 = (void *)qword_1EB38DD58;
  return v2;
}

uint64_t __32__AMSMescalSession_primeSession__block_invoke()
{
  qword_1EB38DD58 = [[AMSMescalSession alloc] initWithType:2];
  return MEMORY[0x1F41817F8]();
}

- (id)primeSignatureForData:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(AMSMutablePromise);
  session = self->_session;
  int v10 = AMSLogKey();
  uint64_t v11 = [(AMSPromise *)v8 completionHandlerAdapter];
  [(AMSMescalFairplaySession *)session primeSignatureForData:v7 bag:v6 logKey:v10 completionHandler:v11];

  return v8;
}

- (id)verifyData:(id)a3 withSignature:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(AMSMutableBinaryPromise);
  session = self->_session;
  v13 = AMSLogKey();
  objc_super v14 = [(AMSBinaryPromise *)v11 completionHandlerAdapter];
  [(AMSMescalFairplaySession *)session verifyData:v10 signature:v9 bag:v8 logKey:v13 completionHandler:v14];

  return v11;
}

- (id)verifyPrimeSignature:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSMutableBinaryPromise);
  session = self->_session;
  id v7 = [(AMSBinaryPromise *)v5 completionHandlerAdapter];
  [(AMSMescalFairplaySession *)session verifyPrimeSignature:v4 completionHandler:v7];

  return v5;
}

- (BOOL)_cacheCertData:(id)a3 expiration:(double)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(AMSMescalSession *)self _cachedCertPath];
  if (v7)
  {
    if (v6)
    {
      id v29 = 0;
      int v8 = [v6 writeToFile:v7 options:1 error:&v29];
      id v9 = v29;
      if (v8)
      {
        id v10 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v11 = [v10 dateByAddingTimeInterval:a4];
        +[AMSDefaults setMescalCertExpiration:v11];

        uint64_t v12 = +[AMSLogConfig sharedConfig];
        if (!v12)
        {
          uint64_t v12 = +[AMSLogConfig sharedConfig];
        }
        v13 = [v12 OSLogObject];
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
          goto LABEL_29;
        }
        objc_super v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v31 = v14;
        __int16 v32 = 2048;
        uint64_t v33 = (uint64_t)a4;
        id v15 = v14;
        id v16 = "%{public}@: Saved mescal cert with expiration: %ld";
        v17 = v13;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        goto LABEL_22;
      }
      uint64_t v12 = +[AMSLogConfig sharedConfig];
      if (!v12)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      id v22 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v31 = v22;
      __int16 v32 = 2114;
      uint64_t v33 = (uint64_t)v9;
      id v15 = v22;
      id v16 = "%{public}@: Failed to cache mescal cert. Error: %{public}@";
LABEL_21:
      v17 = v13;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_22:
      uint32_t v23 = 22;
LABEL_28:
      _os_log_impl(&dword_18D554000, v17, v18, v16, buf, v23);

LABEL_29:
      goto LABEL_30;
    }
    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v28 = 0;
    LOBYTE(v8) = [v20 removeItemAtPath:v7 error:&v28];
    id v9 = v28;

    if ((v8 & 1) == 0)
    {
      v21 = [v9 domain];
      if ([v21 isEqual:*MEMORY[0x1E4F281F8]])
      {
        if ([v9 code] == 4)
        {

LABEL_32:
          uint64_t v12 = +[AMSLogConfig sharedConfig];
          if (!v12)
          {
            uint64_t v12 = +[AMSLogConfig sharedConfig];
          }
          v13 = [v12 OSLogObject];
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_29;
          }
          __int16 v27 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v31 = v27;
          __int16 v32 = 2114;
          uint64_t v33 = (uint64_t)v9;
          id v15 = v27;
          id v16 = "%{public}@: Failed to remove existing mescal cert. Error: %{public}@";
          goto LABEL_21;
        }
        uint64_t v26 = [v9 code];

        if (v26 == 260) {
          goto LABEL_32;
        }
      }
      else
      {
      }
    }
    uint64_t v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_29;
    }
    id v24 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v31 = v24;
    id v15 = v24;
    id v16 = "%{public}@: Removed mescal cert if there was one present.";
    v17 = v13;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v23 = 12;
    goto LABEL_28;
  }
  id v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v12 = [v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = (id)objc_opt_class();
    id v19 = v31;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_INFO, "%{public}@: Failed to determine cache path", buf, 0xCu);
  }
  LOBYTE(v8) = 0;
LABEL_30:

  return v8;
}

- (id)signData:(id)a3 bag:(id)a4 error:(id *)a5
{
  id v6 = [(AMSMescalSession *)self signData:a3 bag:a4];
  id v7 = [v6 resultWithError:a5];

  return v7;
}

- (id)primeSignatureForData:(id)a3 bag:(id)a4 error:(id *)a5
{
  id v6 = [(AMSMescalSession *)self primeSignatureForData:a3 bag:a4];
  id v7 = [v6 resultWithError:a5];

  return v7;
}

- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4
{
  id v5 = [(AMSMescalSession *)self verifyPrimeSignature:a3];
  LOBYTE(a4) = [v5 resultWithError:a4];

  return (char)a4;
}

- (void).cxx_destruct
{
}

@end