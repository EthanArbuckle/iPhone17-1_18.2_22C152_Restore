@interface _HMFNetAddressIPV4
- (BOOL)isEqual:(id)a3;
- (_HMFNetAddressIPV4)init;
- (_HMFNetAddressIPV4)initWithSocketAddress:(const sockaddr *)a3;
- (id)addressString;
- (id)dataUsingEncoding:(unint64_t)a3;
- (unint64_t)addressFamily;
- (unint64_t)hash;
@end

@implementation _HMFNetAddressIPV4

- (_HMFNetAddressIPV4)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (_HMFNetAddressIPV4)initWithSocketAddress:(const sockaddr *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3->sa_family == 2)
  {
    v12.receiver = self;
    v12.super_class = (Class)_HMFNetAddressIPV4;
    v5 = [(_HMFNetAddressIPV4 *)&v12 init];
    if (v5) {
      *(sockaddr *)(v5 + 24) = *a3;
    }
    v6 = v5;
    id v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A87A0](self, a2);
    v6 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier(v6);
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid sockaddr, must be AF_INET", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_in.sin_addr.s_addr ^ self->_in.sin_port;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HMFNetAddressIPV4 *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    BOOL v7 = v6 && self->_in.sin_addr.s_addr == v6->_in.sin_addr.s_addr && self->_in.sin_port == v6->_in.sin_port;
  }
  return v7;
}

- (unint64_t)addressFamily
{
  return 1;
}

- (id)addressString
{
  v2 = NSString;
  v3.s_addr = self->_in.sin_addr.s_addr;
  v4 = inet_ntoa(v3);
  return (id)[v2 stringWithUTF8String:v4];
}

- (id)dataUsingEncoding:(unint64_t)a3
{
  if (a3 == 1)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self->_in, 16, v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end