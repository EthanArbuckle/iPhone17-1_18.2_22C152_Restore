@interface HAPSocketInfo
+ (id)ipAddressAddScopeWithAddress:(id)a3;
+ (id)ipAddressRemoveScopeWithAddress:(id)a3;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HAPSocketInfo)initWithDictionary:(id)a3;
- (HAPSocketInfo)initWithIPAddressString:(id)a3 ipAddressType:(int64_t)a4 port:(id)a5;
- (HAPSocketInfo)initWithIPAddressString:(id)a3 port:(id)a4;
- (HAPSocketInfo)initWithSocket:(const sockaddr_storage *)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)port;
- (NSString)ipAddressString;
- (NSString)ipAddressStringWithScope;
- (NSString)shortDescription;
- (int64_t)ipAddressType;
- (unint64_t)hash;
@end

@implementation HAPSocketInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);

  objc_storeStrong((id *)&self->_ipAddressString, 0);
}

- (int64_t)ipAddressType
{
  return self->_ipAddressType;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)ipAddressString
{
  return self->_ipAddressString;
}

- (NSString)shortDescription
{
  return (NSString *)[NSString stringWithFormat:@"%@ %@/%@", objc_opt_class(), self->_ipAddressString, self->_port];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_ipAddressString hash];
  return [(NSNumber *)self->_port hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((ipAddressString = self->_ipAddressString, !((unint64_t)ipAddressString | v4[1]))
     || -[NSString isEqualToString:](ipAddressString, "isEqualToString:")))
  {
    port = self->_port;
    if ((unint64_t)port | v4[2]) {
      char v7 = -[NSNumber isEqual:](port, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(HAPSocketInfo *)self ipAddressString];
  v4 = +[HAPSocketInfo ipAddressRemoveScopeWithAddress:v3];

  v8[0] = @"HAPSocketInfoIPAddressString";
  v8[1] = @"HAPSocketInfoPort";
  v9[0] = v4;
  v5 = [(HAPSocketInfo *)self port];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return (NSDictionary *)v6;
}

- (NSString)ipAddressStringWithScope
{
  NSUInteger v3 = [(HAPSocketInfo *)self ipAddressType];
  if ((unint64_t)(v3 - 1) <= 2)
  {
    NSUInteger v3 = [(HAPSocketInfo *)self ipAddressString];
  }

  return (NSString *)v3;
}

- (HAPSocketInfo)initWithIPAddressString:(id)a3 ipAddressType:(int64_t)a4 port:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HAPSocketInfo;
  v11 = [(HAPSocketInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ipAddressString, a3);
    v12->_ipAddressType = a4;
    objc_storeStrong((id *)&v12->_port, a5);
  }

  return v12;
}

- (HAPSocketInfo)initWithIPAddressString:(id)a3 port:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    int v20 = 0;
    id v10 = v6;
    if (inet_pton(2, (const char *)[v10 UTF8String], &v20) == 1)
    {
      v11 = self;
      id v12 = v10;
      uint64_t v13 = 1;
LABEL_5:
      self = [(HAPSocketInfo *)v11 initWithIPAddressString:v12 ipAddressType:v13 port:v8];
      id v9 = self;
      goto LABEL_16;
    }
    v19[0] = 0;
    v19[1] = 0;
    id v14 = v10;
    if (inet_pton(30, (const char *)[v14 UTF8String], v19) == 1)
    {
      if (LOBYTE(v19[0]) == 255)
      {
        if ((BYTE1(v19[0]) & 0xF) == 0xE)
        {
          v11 = self;
          id v12 = v14;
          uint64_t v13 = 3;
          goto LABEL_5;
        }
      }
      else if (LOBYTE(v19[0]) == 254 && (BYTE1(v19[0]) & 0xC0) == 0x80)
      {
        v11 = self;
        id v12 = v14;
        uint64_t v13 = 2;
        goto LABEL_5;
      }
    }
    v15 = (void *)MEMORY[0x1D944E080]();
    self = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not determine IP address type from string: %@", buf, 0x16u);
    }
    id v9 = 0;
  }
LABEL_16:

  return v9;
}

- (HAPSocketInfo)initWithDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_stringForKey:", @"HAPSocketInfoIPAddressString");
  uint64_t v6 = objc_msgSend(v4, "hmf_numberForKey:", @"HAPSocketInfoPort");
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    v8 = +[HAPSocketInfo ipAddressRemoveScopeWithAddress:v5];
    id v9 = +[HAPSocketInfo ipAddressAddScopeWithAddress:v8];
    id v10 = [(HAPSocketInfo *)self initWithIPAddressString:v9 port:v7];

    v11 = v10;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D944E080]();
    id v10 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize socket info from dictionary: %@", (uint8_t *)&v16, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (HAPSocketInfo)initWithSocket:(const sockaddr_storage *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int ss_family = a3->ss_family;
  if (ss_family == 2 || ss_family == 30)
  {
    int v6 = SockAddrToString();
    if (!v6)
    {
      uint64_t Port = SockAddrGetPort();
      int v16 = [NSString stringWithUTF8String:buf];
      v17 = [NSNumber numberWithUnsignedInt:Port];
      id v10 = [(HAPSocketInfo *)self initWithIPAddressString:v16 port:v17];

      id v14 = v10;
      goto LABEL_13;
    }
    int v7 = v6;
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v19 = 138543618;
      uint64_t v20 = v8;
      __int16 v21 = 1024;
      int v22 = v7;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize HAPSocketInfo: failed to obtain socket address string: %d", (uint8_t *)&v19, 0x12u);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D944E080](self, a2);
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v13;
      __int16 v25 = 1024;
      int v26 = ss_family;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize HAPSocketInfo: invalid socket address family: %d", buf, 0x12u);
    }
  }

  id v14 = 0;
LABEL_13:

  return v14;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)ipAddressAddScopeWithAddress:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v10[0] = 0;
    v10[1] = 0;
    id v5 = v3;
    if (inet_pton(30, (const char *)[v5 UTF8String], v10) == 1
      && LOBYTE(v10[0]) == 254
      && (BYTE1(v10[0]) & 0xC0) == 0x80)
    {
      uint64_t v6 = +[HAPInterfaceConfig activeWifiOrEthernetInterfaceName];
      int v7 = (void *)v6;
      if (v6)
      {
        id v8 = [v5 stringByAppendingFormat:@"%%%@", v6];
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)ipAddressRemoveScopeWithAddress:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v9[2] = 0;
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v9[0] = 0;
    v9[1] = 0;
    id v5 = v3;
    if (inet_pton(30, (const char *)[v5 UTF8String], v9) == 1
      && LOBYTE(v9[0]) == 254
      && (BYTE1(v9[0]) & 0xC0) == 0x80)
    {
      id v5 = v5;
      [v5 UTF8String];
      if (!StringToSockAddr())
      {
        SockAddrToString();
        uint64_t v6 = [NSString stringWithUTF8String:v10];

        id v5 = (id)v6;
      }
    }
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end