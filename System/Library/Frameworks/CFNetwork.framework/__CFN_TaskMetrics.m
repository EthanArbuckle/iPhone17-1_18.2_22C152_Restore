@interface __CFN_TaskMetrics
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)_daemon_transactionMetrics;
- (__CFN_TaskMetrics)initWithCoder:(id)a3;
- (__CFN_TransactionMetrics)_daemon_currentTransactionMetrics;
- (char)initWithTask:(char *)a1;
- (void)completeWithError:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)lockTransactionMetrics:(uint64_t)a1;
- (void)nextTransaction:(void *)a3 withNewRequest:;
@end

@implementation __CFN_TaskMetrics

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_UUID forKey:@"UUID"];
  [v4 encodeInteger:self->_identifier forKey:@"identifier"];
  os_unfair_lock_lock(&self->_lock);
  [v4 encodeObject:self->_transactionMetrics forKey:@"transactionMetrics"];
  os_unfair_lock_unlock(&self->_lock);
  [v4 encodeDouble:@"createTime" forKey:self->_createTime];
  [v4 encodeDouble:@"firstResumeTime" forKey:self->_firstResumeTime];
  [v4 encodeDouble:@"completeTime" forKey:self->_completeTime];
  [v4 encodeInt64:self->_options forKey:@"options"];
}

- (char)initWithTask:(char *)a1
{
  id v3 = a2;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)__CFN_TaskMetrics;
    a1 = (char *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 _uniqueIdentifier];
      v5 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v4;

      *((void *)a1 + 4) = [v3 taskIdentifier];
      id v6 = v3;
      self;
      v7 = [v6 _effectiveConfiguration];
      uint64_t v8 = [v7 _timingDataOptions];
      if (+[NSURLConnection _collectsTimingData])
      {
        char v9 = +[NSURLConnection _timingDataOptions];
        v8 |= ((2
              * +[NSURLConnection _timingDataOptions]) & 4 | (2 * (v9 & 1))) ^ 6;
      }

      *((void *)a1 + 9) = v8;
      *((void *)a1 + 11) = 1;
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      v11 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v10;

      [v6 startTime];
      *((void *)a1 + 6) = v12;
      *(int64x2_t *)(a1 + 56) = vdupq_n_s64(0x7FF8000000000000uLL);
      v13 = [v6 _effectiveConfiguration];
      uint64_t v14 = [v13 _sourceApplicationBundleIdentifier];
      v15 = (void *)*((void *)a1 + 10);
      *((void *)a1 + 10) = v14;

      v16 = [v6 _effectiveConfiguration];
      *((_DWORD *)a1 + 4) = [v16 _pidForHAR];

      *((_DWORD *)a1 + 2) = 0;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransactionMetrics, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionMetrics, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (__CFN_TransactionMetrics)_daemon_currentTransactionMetrics
{
  if (self)
  {
    self = (__CFN_TaskMetrics *)objc_getProperty(self, a2, 96, 1);
    uint64_t v2 = vars8;
  }
  return (__CFN_TransactionMetrics *)self;
}

- (void)nextTransaction:(void *)a3 withNewRequest:
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  if (!a1) {
    goto LABEL_28;
  }
  if (a2 == 2 && *(unsigned char *)(a1 + 13))
  {
    *(unsigned char *)(a1 + 13) = 0;
    goto LABEL_28;
  }
  id v6 = objc_getProperty((id)a1, v5, 96, 1);
  -[__CFN_TransactionMetrics end:taskMetrics:]((uint64_t)v6, a2, (void *)a1);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = [__CFN_TransactionMetrics alloc];
  char v9 = (void *)[v39 copy];
  id v10 = v9;
  if (!v9)
  {
    if (v6) {
      v11 = (void *)v6[7];
    }
    else {
      v11 = 0;
    }
    id v10 = v11;
  }
  id v12 = v10;
  if (v8)
  {
    *(void *)v40 = v8;
    *(void *)&v40[8] = __CFN_TransactionMetrics;
    uint64_t v8 = (__CFN_TransactionMetrics *)objc_msgSendSuper2((objc_super *)v40, sel_init);
    if (v8)
    {
      uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
      UUID = v8->_UUID;
      v8->_UUID = (NSUUID *)v13;

      objc_storeStrong((id *)&v8->_request, v10);
      int64x2_t v15 = vdupq_n_s64(0x7FF8000000000000uLL);
      *(int64x2_t *)&v8->_beginTime = v15;
      *(int64x2_t *)&v8->_cacheLookupBeginTime = v15;
      *(int64x2_t *)&v8->_requestBeginTime = v15;
      *(int64x2_t *)&v8->_responseBeginTime = v15;
      v8->_reusedAfterTime = NAN;
    }
  }

  if (!v9) {
  if (v8)
  }
  {
    v8->_beginTime = Current;
    v8->_options = *(void *)(a1 + 72);
    v8->_schedulingTier = *(void *)(a1 + 88);
    v8->_pidForHAR = *(_DWORD *)(a1 + 16);
    v16 = *(void **)(a1 + 24);
    v17 = v8;
    id v18 = v16;
    if (HARLoggingEnabled(v8->_pidForHAR))
    {
      request = v17->_request;
LABEL_17:
      v20 = request;
      v21 = [MEMORY[0x1E4F1CA60] dictionary];
      v22 = [(NSURLRequest *)v20 URL];
      v23 = [v22 absoluteString];
      [v21 setObject:v23 forKeyedSubscript:@"url"];

      v24 = [(NSURLRequest *)v20 HTTPMethod];
      [v21 setObject:v24 forKeyedSubscript:@"method"];

      v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLRequest attribution](v20, "attribution"));
      [v21 setObject:v25 forKeyedSubscript:@"attribution"];

      v26 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v21 options:0 error:0];
      v50[0] = 0;
      v50[1] = 0;
      [v18 getUUIDBytes:v50];
      v49[0] = 0;
      v49[1] = 0;
      if (v8) {
        v27 = v8->_UUID;
      }
      else {
        v27 = 0;
      }
      v28 = v27;
      [(NSUUID *)v28 getUUIDBytes:v49];

      v29 = instrumentsTransactionLog();
      if (v8) {
        v30 = v8->_UUID;
      }
      else {
        v30 = 0;
      }
      v31 = v30;
      os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v29, v31);

      v33 = instrumentsTransactionLog();
      v34 = v33;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        int v35 = [v26 length];
        uint64_t v36 = [v26 bytes];
        *(void *)v40 = 0x1004120602;
        *(_WORD *)&v40[8] = 2098;
        *(void *)&v40[10] = v49;
        __int16 v41 = 1042;
        int v42 = 16;
        __int16 v43 = 2098;
        v44 = v50;
        __int16 v45 = 1040;
        int v46 = v35;
        __int16 v47 = 2082;
        uint64_t v48 = v36;
        _os_signpost_emit_with_name_impl(&dword_184085000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "Transaction", "UUID: %{public,uuid_t}.16P, Task UUID: %{public,uuid_t}.16P, Additional Info: %{public,xcode:data}.*s", v40, 0x32u);
      }
    }
  }
  else
  {
    id v18 = *(id *)(a1 + 24);
    BOOL v38 = HARLoggingEnabled(0);
    request = 0;
    if (v38) {
      goto LABEL_17;
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 0x14) {
    [*(id *)(a1 + 40) removeObjectAtIndex:0];
  }
  [*(id *)(a1 + 40) addObject:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  objc_setProperty_atomic((id)a1, v37, v8, 96);

LABEL_28:
}

- (void)completeWithError:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  if (a1)
  {
    id Property = objc_getProperty((id)a1, v3, 96, 1);
    if (v20) {
      uint64_t v5 = 1024;
    }
    else {
      uint64_t v5 = 1;
    }
    -[__CFN_TransactionMetrics end:taskMetrics:]((uint64_t)Property, v5, (void *)a1);
    *(CFAbsoluteTime *)(a1 + 64) = CFAbsoluteTimeGetCurrent();
    int v6 = *(_DWORD *)(a1 + 16);
    id v7 = *(id *)(a1 + 24);
    id v8 = v20;
    if (HARLoggingEnabled(v6))
    {
      char v9 = [MEMORY[0x1E4F1CA60] dictionary];
      if (v20)
      {
        id v10 = [MEMORY[0x1E4F1CA60] dictionary];
        v11 = [v8 domain];
        [v10 setObject:v11 forKeyedSubscript:@"domain"];

        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
        [v10 setObject:v12 forKeyedSubscript:@"code"];

        uint64_t v13 = [v8 localizedDescription];
        [v10 setObject:v13 forKeyedSubscript:@"localizedDescription"];

        uint64_t v14 = [v8 description];
        [v10 setObject:v14 forKeyedSubscript:@"description"];

        [v9 setObject:v10 forKeyedSubscript:@"error"];
      }
      int64x2_t v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:0];
      v16 = instrumentsTaskLog();
      os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v7);

      id v18 = instrumentsTaskLog();
      v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 67109634;
        BOOL v22 = v20 == 0;
        __int16 v23 = 1040;
        int v24 = [v15 length];
        __int16 v25 = 2082;
        uint64_t v26 = [v15 bytes];
        _os_signpost_emit_with_name_impl(&dword_184085000, v19, OS_SIGNPOST_EVENT, v17, "Task Completed", "Succeeded: %{BOOL}d, Additional Info: %{public,xcode:data}.*s", buf, 0x18u);
      }
    }
  }
}

- (void)lockTransactionMetrics:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v4[2](v4, *(void *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    id v3 = v4;
  }
}

- (__CFN_TaskMetrics)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)__CFN_TaskMetrics;
  uint64_t v5 = [(__CFN_TaskMetrics *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    v5->_identifier = [v4 decodeIntegerForKey:@"identifier"];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"transactionMetrics"];
    uint64_t v12 = [v11 mutableCopy];
    transactionMetrics = v5->_transactionMetrics;
    v5->_transactionMetrics = (NSMutableArray *)v12;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      __int16 v23 = 0;
      goto LABEL_15;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v14 = v5->_transactionMetrics;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v26;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v14);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_14;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    [v4 decodeDoubleForKey:@"createTime"];
    v5->_createTime = v18;
    [v4 decodeDoubleForKey:@"firstResumeTime"];
    v5->_firstResumeTime = v19;
    [v4 decodeDoubleForKey:@"completeTime"];
    v5->_completeTime = v20;
    v5->_options = [v4 decodeInt64ForKey:@"options"];
    uint64_t v21 = [(NSMutableArray *)v5->_transactionMetrics lastObject];
    currentTransactionMetrics = v5->_currentTransactionMetrics;
    v5->_currentTransactionMetrics = (__CFN_TransactionMetrics *)v21;
  }
  __int16 v23 = v5;
LABEL_15:

  return v23;
}

- (NSMutableArray)_daemon_transactionMetrics
{
  return self->_transactionMetrics;
}

@end