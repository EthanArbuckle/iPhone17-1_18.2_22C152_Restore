@interface HKRegulatoryDomainEstimate
- (BOOL)isEqual:(id)a3;
- (HKRegulatoryDomainEstimate)initWithISOCode:(id)a3 timestamp:(id)a4 provenance:(int64_t)a5;
- (NSDate)timestamp;
- (NSString)ISOCode;
- (id)description;
- (int64_t)provenance;
- (unint64_t)hash;
- (void)initWithEstimate:(id)a1;
@end

@implementation HKRegulatoryDomainEstimate

- (HKRegulatoryDomainEstimate)initWithISOCode:(id)a3 timestamp:(id)a4 provenance:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKRegulatoryDomainEstimate;
  v10 = [(HKRegulatoryDomainEstimate *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    ISOCode = v10->_ISOCode;
    v10->_ISOCode = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    timestamp = v10->_timestamp;
    v10->_timestamp = (NSDate *)v13;

    v10->_provenance = a5;
  }

  return v10;
}

- (void)initWithEstimate:(id)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v5 = [v3 countryCode];

    if (v5)
    {
      v6 = [v4 countryCode];
      v7 = [v4 timestamp];
      if (v7)
      {
        a1 = (id)[a1 initWithISOCode:v6 timestamp:v7 provenance:2];
      }
      else
      {
        id v8 = [MEMORY[0x1E4F1C9C8] now];
        a1 = (id)[a1 initWithISOCode:v6 timestamp:v8 provenance:2];
      }
      v5 = a1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  v2 = NSString;
  ISOCode = self->_ISOCode;
  timestamp = self->_timestamp;
  v5 = NSStringFromHKOnboardingCompletionCountryCodeProvenance(self->_provenance);
  v6 = [v2 stringWithFormat:@"<HKRegulatoryDomainEstimate %@ %@ %@>", ISOCode, timestamp, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKRegulatoryDomainEstimate *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      ISOCode = self->_ISOCode;
      v7 = v5->_ISOCode;
      BOOL v10 = (ISOCode == v7 || v7 && -[NSString isEqualToString:](ISOCode, "isEqualToString:"))
         && ((timestamp = self->_timestamp, id v9 = v5->_timestamp, timestamp == v9)
          || v9 && -[NSDate isEqual:](timestamp, "isEqual:"))
         && self->_provenance == v5->_provenance;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_ISOCode hash];
  return [(NSDate *)self->_timestamp hash] ^ v3 ^ self->_provenance;
}

- (NSString)ISOCode
{
  return self->_ISOCode;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_ISOCode, 0);
}

@end