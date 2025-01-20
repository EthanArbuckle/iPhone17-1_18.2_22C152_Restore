@interface CTPlmnInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTPlmnInfo)initWithCoder:(id)a3;
- (CTPlmnInfo)initWithMcc:(MCC *)a3 mnc:;
- (NSString)mcc;
- (NSString)mnc;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTPlmnInfo

- (CTPlmnInfo)initWithMcc:(MCC *)a3 mnc:
{
  v4 = v3;
  v16.receiver = self;
  v16.super_class = (Class)CTPlmnInfo;
  v6 = [(CTPlmnInfo *)&v16 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%03d", MCC::getIntValue(a3));
    mcc = v6->_mcc;
    v6->_mcc = (NSString *)v7;

    v9 = NSString;
    BOOL isThreeDigit = MNC::isThreeDigit(v4);
    unsigned int IntValue = MCC::getIntValue((MCC *)v4);
    if (isThreeDigit) {
      v12 = @"%03d";
    }
    else {
      v12 = @"%02d";
    }
    uint64_t v13 = objc_msgSend(v9, "stringWithFormat:", v12, IntValue);
    mnc = v6->_mnc;
    v6->_mnc = (NSString *)v13;
  }
  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTPlmnInfo *)self mcc];
  [v3 appendFormat:@", mcc=%@", v4];

  v5 = [(CTPlmnInfo *)self mnc];
  [v3 appendFormat:@", mnc=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTPlmnInfo *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTPlmnInfo *)self mcc];
      v6 = [(CTPlmnInfo *)v4 mcc];
      if ([v5 isEqualToString:v6])
      {
        uint64_t v7 = [(CTPlmnInfo *)self mnc];
        v8 = [(CTPlmnInfo *)v4 mnc];
        char v9 = [v7 isEqualToString:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTPlmnInfo *)self mcc];
  v6 = (void *)[v5 copy];
  [v4 setMcc:v6];

  uint64_t v7 = [(CTPlmnInfo *)self mnc];
  v8 = (void *)[v7 copy];
  [v4 setMnc:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTPlmnInfo *)self mcc];
  [v6 encodeObject:v4 forKey:@"mcc"];

  v5 = [(CTPlmnInfo *)self mnc];
  [v6 encodeObject:v5 forKey:@"mnc"];
}

- (CTPlmnInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPlmnInfo;
  v5 = [(CTPlmnInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcc"];
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mnc"];
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v8;
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

- (NSString)mnc
{
  return self->_mnc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mnc, 0);

  objc_storeStrong((id *)&self->_mcc, 0);
}

@end