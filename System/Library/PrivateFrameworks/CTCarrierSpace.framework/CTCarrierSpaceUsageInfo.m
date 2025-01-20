@interface CTCarrierSpaceUsageInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCarrierSpaceUsageInfo)init;
- (CTCarrierSpaceUsageInfo)initWithCoder:(id)a3;
- (NSArray)accountMetrics;
- (NSString)moreDetailsURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountMetrics:(id)a3;
- (void)setMoreDetailsURL:(id)a3;
@end

@implementation CTCarrierSpaceUsageInfo

- (CTCarrierSpaceUsageInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTCarrierSpaceUsageInfo;
  v2 = [(CTCarrierSpaceUsageInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    accountMetrics = v2->_accountMetrics;
    v2->_accountMetrics = 0;

    moreDetailsURL = v3->_moreDetailsURL;
    v3->_moreDetailsURL = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCarrierSpaceUsageInfo *)self accountMetrics];
  [v3 appendFormat:@" accountMetrics=%@", v4];

  v5 = [(CTCarrierSpaceUsageInfo *)self moreDetailsURL];
  [v3 appendFormat:@", moreDetailsURL=%@", v5];

  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCarrierSpaceUsageInfo *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTCarrierSpaceUsageInfo *)self accountMetrics];
      v6 = [(CTCarrierSpaceUsageInfo *)v4 accountMetrics];
      if (v5 == v6)
      {
        char v9 = 1;
      }
      else
      {
        objc_super v7 = [(CTCarrierSpaceUsageInfo *)self accountMetrics];
        v8 = [(CTCarrierSpaceUsageInfo *)v4 accountMetrics];
        char v9 = [v7 isEqual:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTCarrierSpaceUsageInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTCarrierSpaceUsageInfo;
  v5 = [(CTCarrierSpaceUsageInfo *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"account_metrics"];
    accountMetrics = v5->_accountMetrics;
    v5->_accountMetrics = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)accountMetrics
{
  return self->_accountMetrics;
}

- (void)setAccountMetrics:(id)a3
{
}

- (NSString)moreDetailsURL
{
  return self->_moreDetailsURL;
}

- (void)setMoreDetailsURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreDetailsURL, 0);
  objc_storeStrong((id *)&self->_accountMetrics, 0);
}

@end