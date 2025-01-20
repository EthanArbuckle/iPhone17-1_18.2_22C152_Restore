@interface HDOTAFeatureAvailabilityInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDOTAFeatureAvailabilityInfo)initWithAllowedCountrySet:(id)a3;
- (HDOTAFeatureAvailabilityInfo)initWithCoder:(id)a3;
- (HDOTAFeatureAvailabilityInfo)initWithDictionaryRepresentation:(id)a3;
- (HKCountrySet)allowedCountrySet;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDOTAFeatureAvailabilityInfo

- (HDOTAFeatureAvailabilityInfo)initWithDictionaryRepresentation:(id)a3
{
  v4 = objc_msgSend(a3, "hk_safeDictionaryForKeyPath:error:", @"AllowedCountrySet", 0);
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F2AE70]) initWithDictionaryRepresentation:v4 provenance:4];
    if (v5)
    {
      self = [(HDOTAFeatureAvailabilityInfo *)self initWithAllowedCountrySet:v5];
      v6 = self;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HDOTAFeatureAvailabilityInfo)initWithAllowedCountrySet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDOTAFeatureAvailabilityInfo;
  v5 = [(HDOTAFeatureAvailabilityInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    allowedCountrySet = v5->_allowedCountrySet;
    v5->_allowedCountrySet = (HKCountrySet *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ allowedCountrySet=%@>", objc_opt_class(), self->_allowedCountrySet];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDOTAFeatureAvailabilityInfo;
  if ([(HDOTAFeatureAvailabilityInfo *)&v9 isEqual:v4]) {
    goto LABEL_2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    char v5 = 0;
    goto LABEL_8;
  }
  allowedCountrySet = self->_allowedCountrySet;
  v7 = (HKCountrySet *)v4[1];
  if (allowedCountrySet != v7)
  {
    if (v7)
    {
      char v5 = -[HKCountrySet isEqual:](allowedCountrySet, "isEqual:");
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_2:
  char v5 = 1;
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  return [(HKCountrySet *)self->_allowedCountrySet hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HDOTAFeatureAvailabilityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllowedCountrySet"];

  if (v5)
  {
    self = [(HDOTAFeatureAvailabilityInfo *)self initWithAllowedCountrySet:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (HKCountrySet)allowedCountrySet
{
  return self->_allowedCountrySet;
}

- (void).cxx_destruct
{
}

@end