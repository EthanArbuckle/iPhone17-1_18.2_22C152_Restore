@interface AMSTimeout
+ (id)timeoutWithExpiration:(double)a3;
- (AMSTimeout)initWithExpiration:(double)a3 clockSource:(id)a4;
- (AMSTimeoutClockSource)clockSource;
- (BOOL)hasExpired;
- (double)expirationTimestamp;
- (double)timestampAtPreviousQuery;
- (void)setClockSource:(id)a3;
- (void)setExpirationTimestamp:(double)a3;
- (void)setTimestampAtPreviousQuery:(double)a3;
@end

@implementation AMSTimeout

+ (id)timeoutWithExpiration:(double)a3
{
  v4 = [AMSTimeout alloc];
  v5 = objc_opt_new();
  v6 = [(AMSTimeout *)v4 initWithExpiration:v5 clockSource:a3];

  return v6;
}

- (AMSTimeout)initWithExpiration:(double)a3 clockSource:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSTimeout;
  v8 = [(AMSTimeout *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clockSource, a4);
    [v7 currentTimestampWithOffset:a3];
    v9->_expirationTimestamp = v10;
  }

  return v9;
}

- (BOOL)hasExpired
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_expired) {
    return 1;
  }
  v4 = [(AMSTimeout *)self clockSource];
  [v4 currentTimestampWithOffset:0.0];
  double v6 = v5;

  [(AMSTimeout *)self timestampAtPreviousQuery];
  if (v6 < v7)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v10 = objc_opt_class();
      id v11 = v10;
      objc_super v12 = AMSLogKey();
      int v14 = 138543618;
      v15 = v10;
      __int16 v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Current timestamp is older than the previous. A monotonic clock source was expected.", (uint8_t *)&v14, 0x16u);
    }
  }
  [(AMSTimeout *)self setTimestampAtPreviousQuery:v6];
  [(AMSTimeout *)self expirationTimestamp];
  BOOL result = v6 > v13;
  self->_expired = v6 > v13;
  return result;
}

- (AMSTimeoutClockSource)clockSource
{
  return self->_clockSource;
}

- (void)setClockSource:(id)a3
{
}

- (double)expirationTimestamp
{
  return self->_expirationTimestamp;
}

- (void)setExpirationTimestamp:(double)a3
{
  self->_expirationTimestamp = a3;
}

- (double)timestampAtPreviousQuery
{
  return self->_timestampAtPreviousQuery;
}

- (void)setTimestampAtPreviousQuery:(double)a3
{
  self->_timestampAtPreviousQuery = a3;
}

- (void).cxx_destruct
{
}

@end