@interface _HMFNetAddressIPV6
- (BOOL)isEqual:(id)a3;
- (_HMFNetAddressIPV6)init;
- (_HMFNetAddressIPV6)initWithSocketAddress:(const sockaddr *)a3;
- (id)addressString;
- (id)dataUsingEncoding:(unint64_t)a3;
- (unint64_t)addressFamily;
- (unint64_t)hash;
@end

@implementation _HMFNetAddressIPV6

- (_HMFNetAddressIPV6)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (_HMFNetAddressIPV6)initWithSocketAddress:(const sockaddr *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3->sa_family == 30)
  {
    v13.receiver = self;
    v13.super_class = (Class)_HMFNetAddressIPV6;
    v5 = [(_HMFNetAddressIPV6 *)&v13 init];
    if (v5)
    {
      long long v6 = *(_OWORD *)&a3->sa_data[10];
      *(sockaddr *)(v5 + 24) = *a3;
      *(_OWORD *)(v5 + 36) = v6;
    }
    id v7 = v5;
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x19F3A87A0](self, a2);
    id v7 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier(v7);
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid sockaddr, must be AF_INET6", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return CFHashBytes() ^ self->_in6.sin6_port ^ self->_in6.sin6_scope_id;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HMFNetAddressIPV6 *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
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
    long long v6 = v5;
    BOOL v8 = v6
      && (*(void *)self->_in6.sin6_addr.__u6_addr8 == *(void *)v6->_in6.sin6_addr.__u6_addr8
        ? (BOOL v7 = *(void *)&self->_in6.sin6_addr.__u6_addr32[2] == *(void *)&v6->_in6.sin6_addr.__u6_addr32[2])
        : (BOOL v7 = 0),
          v7 && self->_in6.sin6_port == v6->_in6.sin6_port)
      && self->_in6.sin6_scope_id == v6->_in6.sin6_scope_id;
  }
  return v8;
}

- (unint64_t)addressFamily
{
  return 2;
}

- (id)addressString
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_in6 = &self->_in6;
  if (inet_ntop(30, &self->_in6.sin6_addr, v23, 0x2Eu))
  {
    uint64_t sin6_scope_id = p_in6->sin6_scope_id;
    if (sin6_scope_id)
    {
      if (if_indextoname(sin6_scope_id, (char *)buf)) {
        objc_msgSend(NSString, "stringWithFormat:", @"%s%%%s", v23, buf);
      }
      else {
      objc_super v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s%%%u", v23, sin6_scope_id);
      }
    }
    else
    {
      objc_super v13 = [NSString stringWithUTF8String:v23];
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x19F3A87A0]();
    long long v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier(0);
      BOOL v8 = __error();
      v9 = strerror(*v8);
      int v10 = *__error();
      v11 = [(_HMFNetAddressIPV6 *)self dataUsingEncoding:1];
      v12 = objc_msgSend(v11, "hmf_hexadecimalRepresentation");
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = v7;
      __int16 v17 = 2080;
      v18 = v9;
      __int16 v19 = 1024;
      int v20 = v10;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_ERROR, "%{public}@inet_ntop() failed  with '%s' (%d) for sockaddr_in6: %@", buf, 0x26u);
    }
    objc_super v13 = 0;
  }
  return v13;
}

- (id)dataUsingEncoding:(unint64_t)a3
{
  if (a3 == 1)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self->_in6, 28, v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end