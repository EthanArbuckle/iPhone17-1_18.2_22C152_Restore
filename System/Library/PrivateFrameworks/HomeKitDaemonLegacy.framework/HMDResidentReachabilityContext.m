@interface HMDResidentReachabilityContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDResidentReachabilityContext)init;
- (HMDResidentReachabilityContext)initWithCoder:(id)a3;
- (HMDResidentReachabilityContext)initWithMostRecentReachability:(id)a3;
- (NSNumber)mostRecentReachability;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDResidentReachabilityContext

- (void).cxx_destruct
{
}

- (NSNumber)mostRecentReachability
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMDResidentReachabilityContext *)self mostRecentReachability];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  if (v7)
  {
    v8 = [(HMDResidentReachabilityContext *)self mostRecentReachability];
    if (v8 || ([v7 mostRecentReachability], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = [(HMDResidentReachabilityContext *)self mostRecentReachability];
      v10 = [v7 mostRecentReachability];
      char v11 = [v9 isEqual:v10];

      if (v8)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      char v11 = 1;
    }

    goto LABEL_12;
  }
  char v11 = 0;
LABEL_13:

  return v11;
}

- (HMDResidentReachabilityContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentReachabilityContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDResidentReachabilityContextCodingKeyMostRecentReachability"];
    mostRecentReachability = v5->_mostRecentReachability;
    v5->_mostRecentReachability = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentReachabilityContext *)self mostRecentReachability];
  [v4 encodeObject:v5 forKey:@"HMDResidentReachabilityContextCodingKeyMostRecentReachability"];
}

- (HMDResidentReachabilityContext)initWithMostRecentReachability:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDResidentReachabilityContext;
  uint64_t v6 = [(HMDResidentReachabilityContext *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mostRecentReachability, a3);
  }

  return v7;
}

- (HMDResidentReachabilityContext)init
{
  return [(HMDResidentReachabilityContext *)self initWithMostRecentReachability:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end