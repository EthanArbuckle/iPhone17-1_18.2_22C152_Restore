@interface _HMFNetAddressHostname
+ (id)normalizedHostname:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)hostname;
- (_HMFNetAddressHostname)init;
- (_HMFNetAddressHostname)initWithHostname:(id)a3;
- (unint64_t)hash;
@end

@implementation _HMFNetAddressHostname

- (_HMFNetAddressHostname)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)normalizedHostname:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"." options:4];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v6 = v4, uint64_t v7 = v5, v4 != [v3 length] - 1))
  {
    uint64_t v8 = [v3 copy];
  }
  else
  {
    uint64_t v8 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v6, v7, &stru_1EEF0F5E0);
  }
  v9 = (void *)v8;

  return v9;
}

- (_HMFNetAddressHostname)initWithHostname:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)_HMFNetAddressHostname;
    uint64_t v5 = [(_HMFNetAddressHostname *)&v14 init];
    if (v5)
    {
      uint64_t v6 = +[_HMFNetAddressHostname normalizedHostname:v4];
      hostname = v5->_hostname;
      v5->_hostname = (NSString *)v6;
    }
    uint64_t v8 = v5;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier(v8);
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid hostname", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(_HMFNetAddressHostname *)self hostname];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMFNetAddressHostname *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(_HMFNetAddressHostname *)self hostname];
      uint64_t v8 = [(_HMFNetAddressHostname *)v6 hostname];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void).cxx_destruct
{
}

@end