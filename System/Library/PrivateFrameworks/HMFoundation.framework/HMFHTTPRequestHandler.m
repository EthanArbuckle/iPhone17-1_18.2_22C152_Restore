@interface HMFHTTPRequestHandler
+ (BOOL)_isValidMethodPrediate:(id)a3;
+ (BOOL)_isValidURLPredicate:(id)a3;
- (HMFHTTPRequestHandler)init;
- (HMFHTTPRequestHandler)initWithMethodPredicate:(id)a3 URLPredicate:(id)a4 matchBlock:(id)a5;
- (NSPredicate)URLPredicate;
- (NSPredicate)methodPredicate;
- (id)matchBlock;
- (id)requestBlock;
- (void)setRequestBlock:(id)a3;
@end

@implementation HMFHTTPRequestHandler

- (HMFHTTPRequestHandler)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)_isValidMethodPrediate:(id)a3
{
  return 1;
}

+ (BOOL)_isValidURLPredicate:(id)a3
{
  return 1;
}

- (HMFHTTPRequestHandler)initWithMethodPredicate:(id)a3 URLPredicate:(id)a4 matchBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v20 = (void *)MEMORY[0x19F3A87A0]();
    v18 = self;
    v21 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v22 = HMFGetLogIdentifier(v18);
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    v23 = "%{public}@Parameter is requred: 'methodPredicate'";
LABEL_16:
    _os_log_impl(&dword_19D57B000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

    goto LABEL_17;
  }
  if (!+[HMFHTTPRequestHandler _isValidMethodPrediate:v8])
  {
    v20 = (void *)MEMORY[0x19F3A87A0]();
    v18 = self;
    v21 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v22 = HMFGetLogIdentifier(v18);
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    v23 = "%{public}@Invalid method predicate";
    goto LABEL_16;
  }
  if (!v9)
  {
    v20 = (void *)MEMORY[0x19F3A87A0]();
    v18 = self;
    v21 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v22 = HMFGetLogIdentifier(v18);
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    v23 = "%{public}@Parameter is requred: 'URLPredicate'";
    goto LABEL_16;
  }
  if (!+[HMFHTTPRequestHandler _isValidURLPredicate:v9])
  {
    v20 = (void *)MEMORY[0x19F3A87A0]();
    v18 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier(v18);
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      v23 = "%{public}@Invalid URL predicate";
      goto LABEL_16;
    }
LABEL_17:

    v19 = 0;
    goto LABEL_18;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMFHTTPRequestHandler;
  v11 = [(HMFHTTPRequestHandler *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    methodPredicate = v11->_methodPredicate;
    v11->_methodPredicate = (NSPredicate *)v12;

    uint64_t v14 = [v9 copy];
    URLPredicate = v11->_URLPredicate;
    v11->_URLPredicate = (NSPredicate *)v14;

    uint64_t v16 = [v10 copy];
    id matchBlock = v11->_matchBlock;
    v11->_id matchBlock = (id)v16;
  }
  v18 = v11;
  v19 = v18;
LABEL_18:

  return v19;
}

- (NSPredicate)methodPredicate
{
  return self->_methodPredicate;
}

- (NSPredicate)URLPredicate
{
  return self->_URLPredicate;
}

- (id)matchBlock
{
  return self->_matchBlock;
}

- (id)requestBlock
{
  return self->_requestBlock;
}

- (void)setRequestBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestBlock, 0);
  objc_storeStrong(&self->_matchBlock, 0);
  objc_storeStrong((id *)&self->_URLPredicate, 0);
  objc_storeStrong((id *)&self->_methodPredicate, 0);
}

@end