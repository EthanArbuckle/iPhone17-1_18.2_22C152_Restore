@interface APLocationInfo
+ (BOOL)supportsSecureCoding;
- (APLocationInfo)initWithCoder:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqualToAPLocationInfo:(id)a3;
- (NSString)administrativeArea;
- (NSString)isoCountryCode;
- (NSString)locality;
- (NSString)postalCode;
- (NSString)subAdministrativeArea;
- (id)description;
- (id)jsonRepresentationWithOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdministrativeArea:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLocality:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
@end

@implementation APLocationInfo

- (id)jsonRepresentationWithOptions:(unint64_t)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21[0] = @"locality";
  uint64_t v4 = [(APLocationInfo *)self locality];
  v5 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v4;
  v22[0] = v4;
  v21[1] = @"administrativeArea";
  v6 = [(APLocationInfo *)self administrativeArea];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[1] = v7;
  v21[2] = @"subAdministrativeArea";
  v8 = [(APLocationInfo *)self subAdministrativeArea];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v9;
  v21[3] = @"isoCountryCode";
  v10 = [(APLocationInfo *)self isoCountryCode];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21[4] = @"postalCode";
  v12 = [(APLocationInfo *)self postalCode];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  if (!v12) {

  }
  if (!v10) {
  if (!v8)
  }

  if (!v6) {
  if (!v5)
  }

  v15 = APLogForCategory(0x1AuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v14 description];
    *(_DWORD *)buf = 138477827;
    v20 = v16;
    _os_log_impl(&dword_1D70B2000, v15, OS_LOG_TYPE_DEFAULT, "Current Location: (%{private}@).", buf, 0xCu);
  }
  return @"<redacted>";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(APLocationInfo *)self locality];
  [v4 encodeObject:v5 forKey:@"locality"];

  v6 = [(APLocationInfo *)self administrativeArea];
  [v4 encodeObject:v6 forKey:@"administrativeArea"];

  v7 = [(APLocationInfo *)self subAdministrativeArea];
  [v4 encodeObject:v7 forKey:@"subAdministrativeArea"];

  v8 = [(APLocationInfo *)self isoCountryCode];
  [v4 encodeObject:v8 forKey:@"isoCountryCode"];

  id v9 = [(APLocationInfo *)self postalCode];
  [v4 encodeObject:v9 forKey:@"postalCode"];
}

- (APLocationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(APLocationInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locality"];
    locality = v5->_locality;
    v5->_locality = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"administrativeArea"];
    administrativeArea = v5->_administrativeArea;
    v5->_administrativeArea = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subAdministrativeArea"];
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isoCountryCode"];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postalCode"];
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v14;
  }
  return v5;
}

- (BOOL)isEqualToAPLocationInfo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(APLocationInfo *)self description];
    uint64_t v6 = [v4 description];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEmpty
{
  v3 = [(APLocationInfo *)self locality];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(APLocationInfo *)self administrativeArea];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      uint64_t v6 = [(APLocationInfo *)self subAdministrativeArea];
      if (v6)
      {
        BOOL v4 = 0;
      }
      else
      {
        char v7 = [(APLocationInfo *)self isoCountryCode];
        if (v7)
        {
          BOOL v4 = 0;
        }
        else
        {
          uint64_t v8 = [(APLocationInfo *)self postalCode];
          BOOL v4 = v8 == 0;
        }
      }
    }
  }

  return v4;
}

- (id)description
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [(APLocationInfo *)self locality];
  [v3 setValue:v4 forKey:@"locality"];

  v5 = [(APLocationInfo *)self administrativeArea];
  [v3 setValue:v5 forKey:@"administrativeArea"];

  uint64_t v6 = [(APLocationInfo *)self subAdministrativeArea];
  [v3 setValue:v6 forKey:@"subAdministrativeArea"];

  char v7 = [(APLocationInfo *)self isoCountryCode];
  [v3 setValue:v7 forKey:@"isoCountryCode"];

  uint64_t v8 = [(APLocationInfo *)self postalCode];
  [v3 setValue:v8 forKey:@"postalCode"];

  id v9 = APLogForCategory(0x1AuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v3 jsonString];
    int v12 = 138477827;
    v13 = v10;
    _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_DEFAULT, "Current Location: (%{private}@).", (uint8_t *)&v12, 0xCu);
  }
  return @"<redacted>";
}

- (NSString)locality
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocality:(id)a3
{
}

- (NSString)administrativeArea
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (NSString)isoCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)postalCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPostalCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
}

@end