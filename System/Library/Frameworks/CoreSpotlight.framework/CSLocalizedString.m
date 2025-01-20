@interface CSLocalizedString
+ (BOOL)supportsSecureCoding;
- (BOOL)didTrySettingDefaultString;
- (CSLocalizedString)initWithCoder:(id)a3;
- (CSLocalizedString)initWithLocalizedStrings:(NSDictionary *)localizedStrings;
- (NSDictionary)localizedStrings;
- (NSString)defaultString;
- (NSString)localizedString;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)encodeWithCSCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)setDidTrySettingDefaultString:(BOOL)a3;
@end

@implementation CSLocalizedString

- (CSLocalizedString)initWithLocalizedStrings:(NSDictionary *)localizedStrings
{
  v4 = localizedStrings;
  v11.receiver = self;
  v11.super_class = (Class)CSLocalizedString;
  v5 = [(CSLocalizedString *)&v11 init];
  if (v5)
  {
    v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"LSDefaultLocalizedValue"];
    if (v6)
    {
      v7 = (NSDictionary *)[(NSDictionary *)v4 mutableCopy];
      [(NSDictionary *)v7 setObject:0 forKeyedSubscript:@"LSDefaultLocalizedValue"];
      [(NSDictionary *)v7 setObject:v6 forKeyedSubscript:&stru_1EDBB3A50];
      v8 = v5->_localizedStrings;
      v5->_localizedStrings = v7;
    }
    else
    {
      uint64_t v9 = [(NSDictionary *)v4 copy];
      v8 = v5->_localizedStrings;
      v5->_localizedStrings = (NSDictionary *)v9;
    }

    v5->_didTrySettingDefaultString = 0;
  }

  return v5;
}

- (NSString)localizedString
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = &OBJC_IVAR___CSItemSummary__allEmailAddresses;
  if (self->_didTrySettingDefaultString) {
    goto LABEL_36;
  }
  uint64_t v4 = 24;
  if ([(NSDictionary *)self->_localizedStrings count] == 1)
  {
    v5 = [(NSDictionary *)self->_localizedStrings allValues];
    v6 = [v5 objectAtIndex:0];
    defaultString = self->_defaultString;
    self->_defaultString = v6;

    goto LABEL_35;
  }
  [MEMORY[0x1E4F1CA20] preferredLanguages];
  [(NSDictionary *)self->_localizedStrings allKeys];
  v5 = (void *)MDRetrieveBestAvailableLanguage();
  if (v5)
  {
    v8 = [(NSDictionary *)self->_localizedStrings objectForKeyedSubscript:v5];
    if (v8)
    {
      uint64_t v9 = v8;
      objc_storeStrong((id *)&self->_defaultString, v8);
      goto LABEL_34;
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v10 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v11)
  {
    uint64_t v9 = 0;
    goto LABEL_33;
  }
  uint64_t v12 = v11;
  v30 = v5;
  uint64_t v13 = *(void *)v33;
  v14 = @"-";
  v31 = v10;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v10);
      }
      v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v17 = [*(id *)((char *)&self->super.super.isa + v4) objectForKeyedSubscript:v16];
      if (v17)
      {
        uint64_t v9 = (void *)v17;
LABEL_31:
        v3 = &OBJC_IVAR___CSItemSummary__allEmailAddresses;
        objc_storeStrong((id *)&self->_defaultString, v9);
        goto LABEL_32;
      }
      uint64_t v18 = [v16 rangeOfString:v14 options:6];
      if (v18) {
        BOOL v19 = v18 == 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19) {
        continue;
      }
      uint64_t v20 = v4;
      uint64_t v21 = v13;
      v22 = v14;
      v23 = [v16 substringToIndex:v18];
      v24 = [(CSLocalizedString *)self localizedStrings];
      uint64_t v9 = [v24 objectForKeyedSubscript:v23];

      if (v9)
      {

        v10 = v31;
        goto LABEL_31;
      }
      uint64_t v25 = [v16 rangeOfString:v22 options:6];
      if (v25 == 0x7FFFFFFFFFFFFFFFLL || v25 == 0)
      {

        v10 = v31;
        v14 = v22;
        uint64_t v13 = v21;
        uint64_t v4 = v20;
      }
      else
      {
        v27 = [(CSLocalizedString *)self localizedStrings];
        uint64_t v9 = [v27 objectForKeyedSubscript:v23];

        v10 = v31;
        v14 = v22;
        uint64_t v13 = v21;
        uint64_t v4 = v20;
        if (v9) {
          goto LABEL_31;
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  uint64_t v9 = 0;
  v3 = &OBJC_IVAR___CSItemSummary__allEmailAddresses;
LABEL_32:
  v5 = v30;
LABEL_33:

LABEL_34:
LABEL_35:

  self->_didTrySettingDefaultString = 1;
LABEL_36:
  v28 = *(Class *)((char *)&self->super.super.isa + v3[126]);

  return (NSString *)v28;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CSLocalizedString *)self localizedStrings];
  [v4 encodeObject:v5 forKey:@"localizedStrings"];
}

- (CSLocalizedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSLocalizedString;
  id v5 = [(CSLocalizedString *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"localizedStrings"];
    localizedStrings = v5->_localizedStrings;
    v5->_localizedStrings = (NSDictionary *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)length
{
  defaultString = self->_defaultString;
  if (defaultString)
  {
    v3 = defaultString;
  }
  else
  {
    v3 = [(CSLocalizedString *)self localizedString];
  }
  id v4 = v3;
  unint64_t v5 = [(NSString *)v3 length];

  return v5;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  defaultString = self->_defaultString;
  if (defaultString)
  {
    unint64_t v5 = defaultString;
  }
  else
  {
    unint64_t v5 = [(CSLocalizedString *)self localizedString];
  }
  v6 = v5;
  unsigned __int16 v7 = [(NSString *)v5 characterAtIndex:a3];

  return v7;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  defaultString = self->_defaultString;
  if (defaultString)
  {
    v8 = defaultString;
  }
  else
  {
    v8 = [(CSLocalizedString *)self localizedString];
  }
  uint64_t v9 = v8;
  -[NSString getCharacters:range:](v8, "getCharacters:range:", a3, location, length);
}

- (NSString)defaultString
{
  return self->_defaultString;
}

- (BOOL)didTrySettingDefaultString
{
  return self->_didTrySettingDefaultString;
}

- (void)setDidTrySettingDefaultString:(BOOL)a3
{
  self->_didTrySettingDefaultString = a3;
}

- (NSDictionary)localizedStrings
{
  return self->_localizedStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStrings, 0);

  objc_storeStrong((id *)&self->_defaultString, 0);
}

- (void)encodeWithCSCoder:(id)a3
{
  id v5 = a3;
  [v5 beginType:"CSLocalizedString"];
  id v4 = [(CSLocalizedString *)self localizedStrings];
  [v5 encodeObject:v4];

  [v5 endType];
}

@end