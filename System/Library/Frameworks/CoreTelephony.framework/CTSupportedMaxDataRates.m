@interface CTSupportedMaxDataRates
+ (BOOL)supportsSecureCoding;
- (CTSupportedMaxDataRates)initWithCoder:(id)a3;
- (CTSupportedMaxDataRates)initWithRates:(id)a3;
- (NSArray)rates;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRates:(id)a3;
@end

@implementation CTSupportedMaxDataRates

- (CTSupportedMaxDataRates)initWithRates:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSupportedMaxDataRates;
  v6 = [(CTSupportedMaxDataRates *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rates, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSupportedMaxDataRates *)self rates];
  [v3 appendFormat:@" rates=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(CTSupportedMaxDataRates *)self rates];
  v6 = (void *)[v5 copy];
  [v4 setRates:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTSupportedMaxDataRates)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTSupportedMaxDataRates;
  id v5 = [(CTSupportedMaxDataRates *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"rates"];
    rates = v5->_rates;
    v5->_rates = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)rates
{
  return self->_rates;
}

- (void)setRates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end