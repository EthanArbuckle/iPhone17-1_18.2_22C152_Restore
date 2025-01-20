@interface BCSVisibilityItem
+ (BOOL)supportsSecureCoding;
- (BCSVisibilityItem)initWithCoder:(id)a3;
- (BCSVisibilityItem)initWithLanguage:(id)a3 country:(id)a4 ratio:(double)a5;
- (BCSVisibilityItem)initWithVisibility:(id)a3;
- (BOOL)isVisibleForDSID:(id)a3;
- (NSString)country;
- (NSString)language;
- (double)ratio;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSVisibilityItem

- (BCSVisibilityItem)initWithVisibility:(id)a3
{
  id v4 = a3;
  v5 = [v4 language];
  v6 = [v4 country];
  [v4 ratio];
  double v8 = v7;

  v9 = [(BCSVisibilityItem *)self initWithLanguage:v5 country:v6 ratio:v8];
  return v9;
}

- (BCSVisibilityItem)initWithLanguage:(id)a3 country:(id)a4 ratio:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCSVisibilityItem;
  v10 = [(BCSVisibilityItem *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    language = v10->_language;
    v10->_language = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    country = v10->_country;
    v10->_country = (NSString *)v13;

    v10->_ratio = a5;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(BCSVisibilityItem *)self language];
  v5 = [(BCSVisibilityItem *)self country];
  [(BCSVisibilityItem *)self ratio];
  double v7 = [v3 stringWithFormat:@"(%@ - %@) : %f", v4, v5, v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  language = self->_language;
  id v5 = a3;
  [v5 encodeObject:language forKey:@"BCSVisibilityItemLanguageKey"];
  [v5 encodeObject:self->_country forKey:@"BCSVisibilityItemCountryKey"];
  [v5 encodeDouble:@"BCSVisibilityItemRatioKey" forKey:self->_ratio];
}

- (BCSVisibilityItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSVisibilityItemLanguageKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSVisibilityItemCountryKey"];
  [v4 decodeDoubleForKey:@"BCSVisibilityItemRatioKey"];
  double v8 = v7;

  id v9 = [(BCSVisibilityItem *)self initWithLanguage:v5 country:v6 ratio:v8];
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(BCSVisibilityItem *)self language];
    uint64_t v7 = [v6 copyWithZone:a3];
    double v8 = (void *)v5[1];
    v5[1] = v7;

    id v9 = [(BCSVisibilityItem *)self language];
    uint64_t v10 = [v9 copyWithZone:a3];
    uint64_t v11 = (void *)v5[2];
    v5[2] = v10;

    [(BCSVisibilityItem *)self ratio];
    v5[3] = v12;
  }
  return v5;
}

- (BOOL)isVisibleForDSID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = +[BCSHashService SHA256TruncatedHashForInputString:v4 includedBytes:32];
  uint64_t v6 = [v4 length];
  uint64_t v7 = ABSLogCommon();
  double v8 = v7;
  if (!v6 || (v5 & 0x8000000000000000) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v4 length];
      v15 = NSStringFromBOOL();
      objc_super v16 = NSStringFromBOOL();
      int v17 = 136315650;
      v18 = "-[BCSVisibilityItem isVisibleForDSID:]";
      __int16 v19 = 2114;
      double v20 = *(double *)&v15;
      __int16 v21 = 2114;
      v22 = v16;
      _os_log_error_impl(&dword_2154F4000, v8, OS_LOG_TYPE_ERROR, "%s isVisible - DSID length greater than 0:%{public}@ - hashedDSID greater than 0:%{public}@", (uint8_t *)&v17, 0x20u);
    }
    BOOL v13 = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      v18 = "-[BCSVisibilityItem isVisibleForDSID:]";
      _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s isVisible - valid DSID & hashedDSID", (uint8_t *)&v17, 0xCu);
    }

    int64_t v9 = v5 % 0xF4240;
    [(BCSVisibilityItem *)self ratio];
    double v11 = v10 * 1000000.0;
    uint64_t v12 = ABSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[BCSVisibilityItem isVisibleForDSID:]";
      __int16 v19 = 2048;
      double v20 = v11;
      _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "%s isVisible - visibilityConverted:%f", (uint8_t *)&v17, 0x16u);
    }

    BOOL v13 = v11 > (double)v9;
  }

  return v13;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)country
{
  return self->_country;
}

- (double)ratio
{
  return self->_ratio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end