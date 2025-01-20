@interface HMHomeWiFiInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPassword;
- (HMHomeWiFiInfo)initWithCoder:(id)a3;
- (HMHomeWiFiInfo)initWithSSID:(id)a3 requiresPassword:(BOOL)a4;
- (NSString)SSID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMHomeWiFiInfo

- (void).cxx_destruct
{
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMHomeWiFiInfo *)self SSID];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMHomeWiFiInfo requiresPassword](self, "requiresPassword"));
  v6 = [v3 stringWithFormat:@"[HMHomeWiFiInfo: SSID = %@, requiresPassword = %@]", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(HMHomeWiFiInfo *)self SSID];
  uint64_t v4 = [v3 hash];

  return v4 + [(HMHomeWiFiInfo *)self requiresPassword];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMHomeWiFiInfo *)self SSID];
    v8 = [v6 SSID];
    if ([v7 isEqualToString:v8])
    {
      BOOL v9 = [(HMHomeWiFiInfo *)self requiresPassword];
      int v10 = v9 ^ [v6 requiresPassword] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (HMHomeWiFiInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PWD"];

  v7 = -[HMHomeWiFiInfo initWithSSID:requiresPassword:](self, "initWithSSID:requiresPassword:", v5, [v6 BOOLValue]);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(HMHomeWiFiInfo *)self SSID];

  if (v4)
  {
    v5 = [(HMHomeWiFiInfo *)self SSID];
    [v7 encodeObject:v5 forKey:@"SSID"];

    id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMHomeWiFiInfo requiresPassword](self, "requiresPassword"));
    [v7 encodeObject:v6 forKey:@"PWD"];
  }
}

- (HMHomeWiFiInfo)initWithSSID:(id)a3 requiresPassword:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMHomeWiFiInfo;
  v8 = [(HMHomeWiFiInfo *)&v11 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_SSID, a3);
    v9->_requiresPassword = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end