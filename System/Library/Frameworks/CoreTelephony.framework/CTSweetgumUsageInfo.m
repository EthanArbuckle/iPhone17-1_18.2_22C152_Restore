@interface CTSweetgumUsageInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSweetgumUsageInfo)init;
- (CTSweetgumUsageInfo)initWithCoder:(id)a3;
- (NSArray)accountMetrics;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountMetrics:(id)a3;
@end

@implementation CTSweetgumUsageInfo

- (CTSweetgumUsageInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTSweetgumUsageInfo;
  v2 = [(CTSweetgumUsageInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    accountMetrics = v2->_accountMetrics;
    v2->_accountMetrics = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumUsageInfo *)self accountMetrics];
  [v3 appendFormat:@" accountMetrics=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTSweetgumUsageInfo *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTSweetgumUsageInfo *)self accountMetrics];
      objc_super v6 = [(CTSweetgumUsageInfo *)v4 accountMetrics];
      if (v5 == v6)
      {
        char v9 = 1;
      }
      else
      {
        v7 = [(CTSweetgumUsageInfo *)self accountMetrics];
        v8 = [(CTSweetgumUsageInfo *)v4 accountMetrics];
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

- (CTSweetgumUsageInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTSweetgumUsageInfo;
  v5 = [(CTSweetgumUsageInfo *)&v12 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
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

- (void).cxx_destruct
{
}

@end