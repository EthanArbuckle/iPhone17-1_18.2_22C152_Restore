@interface NEPrivateLTENetwork
+ (BOOL)supportsSecureCoding;
- (NEPrivateLTENetwork)initWithCoder:(id)a3;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (NSString)trackingAreaCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMobileCountryCode:(NSString *)mobileCountryCode;
- (void)setMobileNetworkCode:(NSString *)mobileNetworkCode;
- (void)setTrackingAreaCode:(NSString *)trackingAreaCode;
@end

@implementation NEPrivateLTENetwork

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingAreaCode, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);

  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
}

- (void)setTrackingAreaCode:(NSString *)trackingAreaCode
{
}

- (NSString)trackingAreaCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMobileNetworkCode:(NSString *)mobileNetworkCode
{
}

- (NSString)mobileNetworkCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMobileCountryCode:(NSString *)mobileCountryCode
{
}

- (NSString)mobileCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[NEPrivateLTENetwork allocWithZone:a3] init];
  v5 = [(NEPrivateLTENetwork *)self mobileCountryCode];
  [(NEPrivateLTENetwork *)v4 setMobileCountryCode:v5];

  v6 = [(NEPrivateLTENetwork *)self mobileNetworkCode];
  [(NEPrivateLTENetwork *)v4 setMobileNetworkCode:v6];

  v7 = [(NEPrivateLTENetwork *)self trackingAreaCode];
  [(NEPrivateLTENetwork *)v4 setTrackingAreaCode:v7];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NEPrivateLTENetwork *)self mobileCountryCode];
  [v4 encodeObject:v5 forKey:@"PLTEMCC"];

  v6 = [(NEPrivateLTENetwork *)self mobileNetworkCode];
  [v4 encodeObject:v6 forKey:@"PLTEMNC"];

  id v7 = [(NEPrivateLTENetwork *)self trackingAreaCode];
  [v4 encodeObject:v7 forKey:@"PLTETAC"];
}

- (NEPrivateLTENetwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEPrivateLTENetwork;
  v5 = [(NEPrivateLTENetwork *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLTEMCC"];
    mobileCountryCode = v5->_mobileCountryCode;
    v5->_mobileCountryCode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLTEMNC"];
    mobileNetworkCode = v5->_mobileNetworkCode;
    v5->_mobileNetworkCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLTETAC"];
    trackingAreaCode = v5->_trackingAreaCode;
    v5->_trackingAreaCode = (NSString *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NEPrivateLTENetwork *)self mobileCountryCode];
  v5 = [(NEPrivateLTENetwork *)self mobileNetworkCode];
  uint64_t v6 = [(NEPrivateLTENetwork *)self trackingAreaCode];
  if (v6)
  {
    id v7 = [(NEPrivateLTENetwork *)self trackingAreaCode];
    uint64_t v8 = [v3 stringWithFormat:@"Mobile Country Code:[%@] Mobile Network Code:[%@] Tracking Area Code:[%@]", v4, v5, v7];
  }
  else
  {
    uint64_t v8 = [v3 stringWithFormat:@"Mobile Country Code:[%@] Mobile Network Code:[%@] Tracking Area Code:[%@]", v4, v5, &stru_1EF054CB8];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end