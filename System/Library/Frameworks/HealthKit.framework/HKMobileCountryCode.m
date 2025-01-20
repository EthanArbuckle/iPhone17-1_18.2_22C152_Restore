@interface HKMobileCountryCode
- (BOOL)isOverridden;
- (HKMobileCountryCode)initWithMobileCountryCode:(id)a3 ISOCode:(id)a4 isOverridden:(BOOL)a5;
- (NSDate)timestamp;
- (NSString)ISOCode;
- (NSString)code;
- (id)countryCode;
- (id)description;
- (int64_t)provenance;
@end

@implementation HKMobileCountryCode

- (HKMobileCountryCode)initWithMobileCountryCode:(id)a3 ISOCode:(id)a4 isOverridden:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKMobileCountryCode;
  v10 = [(HKMobileCountryCode *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    code = v10->_code;
    v10->_code = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    ISOCode = v10->_ISOCode;
    v10->_ISOCode = (NSString *)v13;

    v10->_overridden = a5;
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
    timestamp = v10->_timestamp;
    v10->_timestamp = (NSDate *)v15;
  }
  return v10;
}

- (id)countryCode
{
  return self->_ISOCode;
}

- (int64_t)provenance
{
  if (self->_overridden) {
    return 101;
  }
  else {
    return 1;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_overridden) {
    v5 = @" OVERRIDDEN";
  }
  else {
    v5 = &stru_1EEC60288;
  }
  return (id)[v3 stringWithFormat:@"<%@:%p MCC:%@ ISO:%@ %@>", v4, self, self->_code, self->_ISOCode, v5];
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)code
{
  return self->_code;
}

- (NSString)ISOCode
{
  return self->_ISOCode;
}

- (BOOL)isOverridden
{
  return self->_overridden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ISOCode, 0);
  objc_storeStrong((id *)&self->_code, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end