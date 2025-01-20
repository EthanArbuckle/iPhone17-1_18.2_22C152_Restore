@interface LNRegulatoryDomainRelevantContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNRegulatoryDomainRelevantContext)initWithCoder:(id)a3;
- (LNRegulatoryDomainRelevantContext)initWithCountryCodes:(id)a3;
- (NSSet)countryCodes;
- (id)analyticsDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNRegulatoryDomainRelevantContext

- (void).cxx_destruct
{
}

- (NSSet)countryCodes
{
  return self->_countryCodes;
}

- (id)analyticsDescription
{
  return @".regulatoryDomain()";
}

- (id)description
{
  v2 = NSString;
  v3 = [(LNRegulatoryDomainRelevantContext *)self countryCodes];
  v4 = [v2 stringWithFormat:@"<regulatory domain: %@>", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNRegulatoryDomainRelevantContext *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(LNRegulatoryDomainRelevantContext *)v4 countryCodes];
      v6 = [(LNRegulatoryDomainRelevantContext *)self countryCodes];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSSet *)self->_countryCodes hash];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNRegulatoryDomainRelevantContext *)self countryCodes];
  [v4 encodeObject:v5 forKey:@"countryCodes"];
}

- (LNRegulatoryDomainRelevantContext)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  char v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"countryCodes"];

  v9 = [(LNRegulatoryDomainRelevantContext *)self initWithCountryCodes:v8];
  return v9;
}

- (LNRegulatoryDomainRelevantContext)initWithCountryCodes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LNRegulatoryDomainRelevantContext;
  id v5 = [(LNRelevantContext *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    countryCodes = v5->_countryCodes;
    v5->_countryCodes = (NSSet *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end