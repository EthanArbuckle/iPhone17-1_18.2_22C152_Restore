@interface THNetworkSignature
+ (BOOL)supportsSecureCoding;
- (NSData)ipv4NwSignature;
- (NSData)ipv6NwSignature;
- (NSString)wifiPassword;
- (NSString)wifiSSID;
- (THNetworkSignature)initWithCoder:(id)a3;
- (THNetworkSignature)initWithSignatures:(id)a3 ipv6NwSignature:(id)a4 wifSSID:(id)a5 wifiPassword:(id)a6;
- (id)initSignaturesWithArrays:(char *)a3 ipv4BytesLen:(int)a4 ipv6Bytes:(char *)a5 ipv6BytesLen:(int)a6 wifSSID:(id)a7 wifiPassword:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation THNetworkSignature

- (THNetworkSignature)initWithSignatures:(id)a3 ipv6NwSignature:(id)a4 wifSSID:(id)a5 wifiPassword:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)THNetworkSignature;
  v14 = [(THNetworkSignature *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    ipv4NwSignature = v14->_ipv4NwSignature;
    v14->_ipv4NwSignature = (NSData *)v15;

    uint64_t v17 = [v11 copy];
    ipv6NwSignature = v14->_ipv6NwSignature;
    v14->_ipv6NwSignature = (NSData *)v17;

    uint64_t v19 = [v12 copy];
    wifiSSID = v14->_wifiSSID;
    v14->_wifiSSID = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    wifiPassword = v14->_wifiPassword;
    v14->_wifiPassword = (NSString *)v21;
  }
  return v14;
}

- (id)initSignaturesWithArrays:(char *)a3 ipv4BytesLen:(int)a4 ipv6Bytes:(char *)a5 ipv6BytesLen:(int)a6 wifSSID:(id)a7 wifiPassword:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v16 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a4];
  uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:a5 length:a6];
  v18 = (void *)v17;
  if (v16) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    self = [(THNetworkSignature *)self initWithSignatures:v16 ipv6NwSignature:v17 wifSSID:v14 wifiPassword:v15];
    v20 = self;
  }

  return v20;
}

- (THNetworkSignature)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ipv4"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ipv6"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ssid"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwd"];

  v9 = [(THNetworkSignature *)self initWithSignatures:v5 ipv6NwSignature:v6 wifSSID:v7 wifiPassword:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(THNetworkSignature *)self ipv4NwSignature];
  [v4 encodeObject:v5 forKey:@"ipv4"];

  v6 = [(THNetworkSignature *)self ipv6NwSignature];
  [v4 encodeObject:v6 forKey:@"ipv6"];

  v7 = [(THNetworkSignature *)self wifiSSID];
  [v4 encodeObject:v7 forKey:@"ssid"];

  id v8 = [(THNetworkSignature *)self wifiPassword];
  [v4 encodeObject:v8 forKey:@"passwd"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)ipv4NwSignature
{
  return self->_ipv4NwSignature;
}

- (NSData)ipv6NwSignature
{
  return self->_ipv6NwSignature;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (NSString)wifiPassword
{
  return self->_wifiPassword;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiPassword, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_ipv6NwSignature, 0);
  objc_storeStrong((id *)&self->_ipv4NwSignature, 0);
}

@end