@interface HMDCameraNetworkConfig
+ (id)localIPAddress;
- (BOOL)ipv6;
- (HMDCameraNetworkConfig)init;
- (HMDCameraNetworkConfig)initWithAddress:(id)a3 ipv6:(BOOL)a4 rtpPort:(id)a5;
- (NSNumber)rtpPort;
- (NSString)ipAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIpAddress:(id)a3;
- (void)setIpv6:(BOOL)a3;
- (void)setRtpPort:(id)a3;
@end

@implementation HMDCameraNetworkConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpPort, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

- (void)setRtpPort:(id)a3
{
}

- (NSNumber)rtpPort
{
  return self->_rtpPort;
}

- (void)setIpv6:(BOOL)a3
{
  self->_ipv6 = a3;
}

- (BOOL)ipv6
{
  return self->_ipv6;
}

- (void)setIpAddress:(id)a3
{
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDCameraNetworkConfig *)self ipAddress];
  [(HMDCameraNetworkConfig *)self ipv6];
  v5 = HMFBooleanToString();
  v6 = [(HMDCameraNetworkConfig *)self rtpPort];
  v7 = [v6 stringValue];
  v8 = [v3 stringWithFormat:@"<%@, v6:%@ %@>", v4, v5, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDCameraNetworkConfig allocWithZone:a3];
  v5 = [(HMDCameraNetworkConfig *)self ipAddress];
  BOOL v6 = [(HMDCameraNetworkConfig *)self ipv6];
  v7 = [(HMDCameraNetworkConfig *)self rtpPort];
  uint64_t v8 = [(HMDCameraNetworkConfig *)v4 initWithAddress:v5 ipv6:v6 rtpPort:v7];

  sockaddr sa = self->_ipv4SockAddress.sa;
  *(in6_addr *)(v8 + 20) = *(in6_addr *)((char *)&self->_ipv4SockAddress.v6.sin6_addr + 4);
  *(sockaddr *)(v8 + 8) = sa;
  sockaddr v10 = self->_ipv6SockAddress.sa;
  *(in6_addr *)(v8 + 48) = *(in6_addr *)((char *)&self->_ipv6SockAddress.v6.sin6_addr + 4);
  *(sockaddr *)(v8 + 36) = v10;
  return (id)v8;
}

- (HMDCameraNetworkConfig)initWithAddress:(id)a3 ipv6:(BOOL)a4 rtpPort:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(HMDCameraNetworkConfig *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ipAddress, a3);
    v12->_ipBOOL v6 = a4;
    objc_storeStrong((id *)&v12->_rtpPort, a5);
  }

  return v12;
}

- (HMDCameraNetworkConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDCameraNetworkConfig;
  result = [(HMDCameraNetworkConfig *)&v3 init];
  if (result) {
    result->_ipBOOL v6 = 0;
  }
  return result;
}

+ (id)localIPAddress
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(HMDCameraNetworkConfig);
  if (!GetPrimaryIPAddress())
  {
    p_s_addr = &v2->_ipv4SockAddress.v4.sin_addr.s_addr;
    unsigned int v8 = bswap32(v2->_ipv4SockAddress.v4.sin_addr.s_addr);
    if (HIWORD(v8) != 43518 && (v8 & 0xFFFFFF00) != -536870912)
    {
      *(_OWORD *)buf = 0u;
      memset(v24, 0, sizeof(v24));
      v13 = objc_msgSend(NSString, "stringWithUTF8String:", inet_ntop(2, p_s_addr, (char *)buf, 0x2Eu));
      [(HMDCameraNetworkConfig *)v2 setIpAddress:v13];

      BOOL v6 = v2;
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      v11 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v11;
      __int16 v21 = 2112;
      v22 = v6;
      v12 = "%{public}@Found IPv4 address: %@";
      goto LABEL_18;
    }
    if (v2->_ipv6SockAddress.v6.sin6_addr.__u6_addr8[0] == 254 && (v2->_ipv6SockAddress.sa.sa_data[7] & 0xC0) == 0x80)
    {
      *(_OWORD *)buf = 0u;
      memset(v24, 0, sizeof(v24));
      id v10 = objc_msgSend(NSString, "stringWithUTF8String:", inet_ntop(2, p_s_addr, (char *)buf, 0x2Eu));
      [(HMDCameraNetworkConfig *)v2 setIpAddress:v10];

      BOOL v6 = v2;
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v11;
        __int16 v21 = 2112;
        v22 = v6;
        v12 = "%{public}@Did not non-link-local IPv4 or IPv6, defaulting to IPv4: %@";
LABEL_18:
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      *(_OWORD *)buf = 0u;
      memset(v24, 0, sizeof(v24));
      v17 = objc_msgSend(NSString, "stringWithUTF8String:", inet_ntop(30, &v2->_ipv6SockAddress.v6.sin6_addr, (char *)buf, 0x2Eu));
      [(HMDCameraNetworkConfig *)v2 setIpAddress:v17];

      [(HMDCameraNetworkConfig *)v2 setIpv6:1];
      BOOL v6 = v2;
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v11;
        __int16 v21 = 2112;
        v22 = v6;
        v12 = "%{public}@Found IPv6 address: %@";
        goto LABEL_18;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  objc_super v3 = (void *)MEMORY[0x230FBD990]();
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to get Primary IP Address", buf, 0xCu);
  }
  BOOL v6 = 0;
LABEL_20:

  return v6;
}

@end