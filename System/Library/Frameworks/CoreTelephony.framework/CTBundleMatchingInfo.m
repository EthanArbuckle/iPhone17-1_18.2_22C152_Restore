@interface CTBundleMatchingInfo
+ (BOOL)supportsSecureCoding;
- (CTBundleMatchingInfo)initWithCoder:(id)a3;
- (NSString)imsi;
- (NSString)mcc;
- (NSString)mnc;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setImsi:(id)a3;
- (void)setMcc:(id)a3;
- (void)setMnc:(id)a3;
@end

@implementation CTBundleMatchingInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTBundleMatchingInfo *)self mcc];
  [v3 appendFormat:@", MCC=%@", v4];

  v5 = [(CTBundleMatchingInfo *)self mnc];
  [v3 appendFormat:@", MNC=%@", v5];

  v6 = [(CTBundleMatchingInfo *)self imsi];
  [v3 appendFormat:@", IMSI=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTBundleMatchingInfo *)self mcc];
  v6 = (void *)[v5 copy];
  [v4 setMcc:v6];

  v7 = [(CTBundleMatchingInfo *)self mnc];
  v8 = (void *)[v7 copy];
  [v4 setMnc:v8];

  v9 = [(CTBundleMatchingInfo *)self imsi];
  v10 = (void *)[v9 copy];
  [v4 setImsi:v10];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTBundleMatchingInfo *)self mcc];
  [v4 encodeObject:v5 forKey:@"mcc"];

  v6 = [(CTBundleMatchingInfo *)self mnc];
  [v4 encodeObject:v6 forKey:@"mnc"];

  id v7 = [(CTBundleMatchingInfo *)self imsi];
  [v4 encodeObject:v7 forKey:@"imsi"];
}

- (CTBundleMatchingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTBundleMatchingInfo;
  v5 = [(CTBundleMatchingInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcc"];
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mnc"];
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imsi"];
    imsi = v5->_imsi;
    v5->_imsi = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)mcc
{
  return self->_mcc;
}

- (void)setMcc:(id)a3
{
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void)setMnc:(id)a3
{
}

- (NSString)imsi
{
  return self->_imsi;
}

- (void)setImsi:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imsi, 0);
  objc_storeStrong((id *)&self->_mnc, 0);

  objc_storeStrong((id *)&self->_mcc, 0);
}

@end