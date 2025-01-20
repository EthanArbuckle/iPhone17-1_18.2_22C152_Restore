@interface HMFNetAddress
+ (id)localAddress;
- (BOOL)isEqual:(id)a3;
- (HMFNetAddress)init;
- (HMFNetAddress)initWithHostname:(id)a3;
- (HMFNetAddress)initWithSocketAddress:(const sockaddr *)a3;
- (HMFNetAddressInternal)internal;
- (NSString)addressString;
- (id)attributeDescriptions;
- (id)dataUsingEncoding:(unint64_t)a3;
- (unint64_t)addressFamily;
- (unint64_t)hash;
@end

@implementation HMFNetAddress

+ (id)localAddress
{
  if (qword_1EB4EEDD8 != -1) {
    dispatch_once(&qword_1EB4EEDD8, &__block_literal_global_41);
  }
  v2 = (void *)_MergedGlobals_72;
  return v2;
}

void __29__HMFNetAddress_localAddress__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  long long v2 = xmmword_19D611900;
  v0 = [[HMFNetAddress alloc] initWithSocketAddress:&v2];
  v1 = (void *)_MergedGlobals_72;
  _MergedGlobals_72 = (uint64_t)v0;
}

- (HMFNetAddress)init
{
  long long v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFNetAddress)initWithSocketAddress:(const sockaddr *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int sa_family = a3->sa_family;
  if (sa_family == 2)
  {
    v6 = off_1E5957338;
  }
  else
  {
    if (sa_family != 30) {
      goto LABEL_9;
    }
    v6 = off_1E5957340;
  }
  uint64_t v7 = [objc_alloc(*v6) initWithSocketAddress:a3];
  if (v7)
  {
    v8 = (void *)v7;
    v18.receiver = self;
    v18.super_class = (Class)HMFNetAddress;
    v9 = [(HMFNetAddress *)&v18 init];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_internal, v8);
    }
    v11 = v10;

    v12 = v11;
    goto LABEL_12;
  }
LABEL_9:
  v13 = (void *)MEMORY[0x19F3A87A0]();
  v11 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier(v11);
    int v16 = a3->sa_family;
    *(_DWORD *)buf = 138543618;
    v20 = v15;
    __int16 v21 = 1024;
    int v22 = v16;
    _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Invalid socket address family: 0x%02x", buf, 0x12u);
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (HMFNetAddress)initWithHostname:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMFNetAddress;
    v5 = [(HMFNetAddress *)&v14 init];
    if (v5)
    {
      v6 = [[_HMFNetAddressHostname alloc] initWithHostname:v4];
      internal = v5->_internal;
      v5->_internal = &v6->super;
    }
    v8 = v5;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3A87A0]();
    v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier(v8);
      *(_DWORD *)buf = 138543362;
      int v16 = v12;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid hostname", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  long long v2 = [(HMFNetAddress *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMFNetAddress *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HMFNetAddress *)self internal];
      v6 = [(HMFNetAddress *)v4 internal];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [HMFAttributeDescription alloc];
  id v4 = [(HMFNetAddress *)self addressString];
  v5 = [(HMFAttributeDescription *)v3 initWithName:@"Address" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (unint64_t)addressFamily
{
  long long v2 = [(HMFNetAddress *)self internal];
  unint64_t v3 = [v2 addressFamily];

  return v3;
}

- (NSString)addressString
{
  long long v2 = [(HMFNetAddress *)self internal];
  unint64_t v3 = [v2 addressString];

  return (NSString *)v3;
}

- (id)dataUsingEncoding:(unint64_t)a3
{
  id v4 = [(HMFNetAddress *)self internal];
  v5 = [v4 dataUsingEncoding:a3];

  return v5;
}

- (HMFNetAddressInternal)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
}

@end