@interface NSLocaleLanguage
- (BOOL)isEqual:(id)a3;
- (NSLocaleLanguage)init;
- (NSLocaleLanguage)initWithLocaleIdentifier:(id)a3;
- (NSString)threeCharacterCode;
- (NSString)twoCharacterCode;
- (unint64_t)hash;
- (void)setThreeCharacterCode:(id)a3;
- (void)setTwoCharacterCode:(id)a3;
@end

@implementation NSLocaleLanguage

- (NSLocaleLanguage)init
{
  return [(NSLocaleLanguage *)self initWithLocaleIdentifier:&stru_1F3CF7B28];
}

- (NSLocaleLanguage)initWithLocaleIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NSLocaleLanguage;
  v5 = [(NSLocaleLanguage *)&v12 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v4];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 languageCode];
      if ([v8 length])
      {
        [(NSLocaleLanguage *)v5 setTwoCharacterCode:v8];
        v9 = [v7 threeCharacterLanguageCode];
        [(NSLocaleLanguage *)v5 setThreeCharacterCode:v9];

        v10 = v5;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(NSLocaleLanguage *)self twoCharacterCode];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSLocaleLanguage *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(NSLocaleLanguage *)self twoCharacterCode];
      v6 = [(NSLocaleLanguage *)v4 twoCharacterCode];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)twoCharacterCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTwoCharacterCode:(id)a3
{
}

- (NSString)threeCharacterCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setThreeCharacterCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threeCharacterCode, 0);
  objc_storeStrong((id *)&self->_twoCharacterCode, 0);
}

@end