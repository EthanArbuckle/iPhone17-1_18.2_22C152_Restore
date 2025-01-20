@interface HMDSRTPCryptoSuite
+ (BOOL)supportsSecureCoding;
+ (id)arrayWithSuites:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDSRTPCryptoSuite)initWithCoder:(id)a3;
- (HMDSRTPCryptoSuite)initWithCryptoSuite:(unint64_t)a3;
- (HMDSRTPCryptoSuite)initWithTLVData:(id)a3;
- (id)description;
- (unint64_t)srtpCryptoSuite;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSRTPCryptoSuite

- (unint64_t)srtpCryptoSuite
{
  return self->_srtpCryptoSuite;
}

- (HMDSRTPCryptoSuite)initWithTLVData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDSRTPCryptoSuite;
  v3 = [(HAPNumberParser *)&v6 initWithTLVData:a3];
  v4 = v3;
  if (v3) {
    v3->_srtpCryptoSuite = [(HAPNumberParser *)v3 decodedNumber];
  }
  return v4;
}

- (HMDSRTPCryptoSuite)initWithCryptoSuite:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDSRTPCryptoSuite;
  result = [(HMDSRTPCryptoSuite *)&v5 init];
  if (result) {
    result->_srtpCryptoSuite = a3;
  }
  return result;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  HMDSRTPCryptoSuiteTypeAsString([(HMDSRTPCryptoSuite *)self srtpCryptoSuite]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 appendFormat:@"\n%@ srtpCryptoSuite = %@", v6, v8];
}

- (id)description
{
  v2 = NSString;
  v3 = HMDSRTPCryptoSuiteTypeAsString([(HMDSRTPCryptoSuite *)self srtpCryptoSuite]);
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDSRTPCryptoSuite *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(HMDSRTPCryptoSuite *)self srtpCryptoSuite];
      BOOL v6 = v5 == [(HMDSRTPCryptoSuite *)v4 srtpCryptoSuite];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMDSRTPCryptoSuite *)self srtpCryptoSuite];
  objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "HMDSRTPCryptoSuite", "srtpCryptoSuite");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt32:v5 forKey:v6];
}

- (HMDSRTPCryptoSuite)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDSRTPCryptoSuite;
  unint64_t v5 = [(HMDSRTPCryptoSuite *)&v8 init];
  if (v5)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "HMDSRTPCryptoSuite", "srtpCryptoSuite");
    v5->_srtpCryptoSuite = (int)[v4 decodeInt32ForKey:v6];
  }
  return v5;
}

+ (id)arrayWithSuites:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [HMDSRTPCryptoSuite alloc];
        v12 = -[HMDSRTPCryptoSuite initWithCryptoSuite:](v11, "initWithCryptoSuite:", objc_msgSend(v10, "unsignedIntegerValue", (void)v14));
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end