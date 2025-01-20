@interface _NSPersonNameComponentsFormatterData
+ (BOOL)supportsSecureCoding;
- (BOOL)forceFamilyNameFirst;
- (BOOL)forceGivenNameFirst;
- (BOOL)ignoresFallbacks;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFormatterData:(void *)a1;
- (BOOL)phonetic;
- (NSLocale)locale;
- (_NSPersonNameComponentsFormatterData)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setForceFamilyNameFirst:(BOOL)a3;
- (void)setForceGivenNameFirst:(BOOL)a3;
- (void)setIgnoresFallbacks:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setPhonetic:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _NSPersonNameComponentsFormatterData

- (int64_t)style
{
  return self->_style;
}

- (BOOL)phonetic
{
  return self->_phonetic;
}

- (BOOL)forceGivenNameFirst
{
  return self->_forceGivenNameFirst;
}

- (BOOL)forceFamilyNameFirst
{
  return self->_forceFamilyNameFirst;
}

- (BOOL)ignoresFallbacks
{
  return self->_ignoresFallbacks;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 24, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(_NSPersonNameComponentsFormatterData);
  v5->_style = self->_style;
  v5->_phonetic = self->_phonetic;
  v5->_forceFamilyNameFirst = self->_forceFamilyNameFirst;
  v5->_forceGivenNameFirst = self->_forceGivenNameFirst;
  v5->_ignoresFallbacks = self->_ignoresFallbacks;
  v5->_locale = (NSLocale *)[(NSLocale *)self->_locale copyWithZone:a3];
  return v5;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  locale = self->_locale;
  if (locale)
  {

    self->_locale = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)_NSPersonNameComponentsFormatterData;
  [(_NSPersonNameComponentsFormatterData *)&v4 dealloc];
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setIgnoresFallbacks:(BOOL)a3
{
  self->_ignoresFallbacks = a3;
}

- (_NSPersonNameComponentsFormatterData)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v6 = +[NSString stringWithFormat:@"%@ cannot be decoded by non-keyed archivers", objc_opt_class()];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }
  if (self)
  {
    self->_style = [a3 decodeIntegerForKey:@"NS.nameFormatterStyle"];
    self->_phonetic = [a3 decodeBoolForKey:@"NS.nameFormatterIsPhonetic"];
    self->_forceFamilyNameFirst = [a3 decodeBoolForKey:@"NS.nameFormatterForceFamilyNameFirst"];
    self->_forceGivenNameFirst = [a3 decodeBoolForKey:@"NS.nameFormatterForceGivenNameFirst"];
    self->_ignoresFallbacks = [a3 decodeBoolForKey:@"NS.nameFormatterIgnoresFallbacks"];
    if ([a3 containsValueForKey:@"NS.nameFormatterLocale"]) {
      self->_locale = (NSLocale *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.nameFormatterLocale"), "copy");
    }
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersonNameComponents cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  [a3 encodeInteger:self->_style forKey:@"NS.nameFormatterStyle"];
  [a3 encodeBool:self->_phonetic forKey:@"NS.nameFormatterIsPhonetic"];
  [a3 encodeBool:self->_forceFamilyNameFirst forKey:@"NS.nameFormatterForceFamilyNameFirst"];
  [a3 encodeBool:self->_forceGivenNameFirst forKey:@"NS.nameFormatterForceGivenNameFirst"];
  [a3 encodeBool:self->_ignoresFallbacks forKey:@"NS.nameFormatterIgnoresFallbacks"];
  locale = self->_locale;

  [a3 encodeObject:locale forKey:@"NS.nameFormatterLocale"];
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[_NSPersonNameComponentsFormatterData isEqualToFormatterData:](self, a3);
}

- (BOOL)isEqualToFormatterData:(void *)a1
{
  BOOL result = 0;
  if (a1 && a2)
  {
    if ([a1 locale] && objc_msgSend(a2, "locale"))
    {
      if ((objc_msgSend((id)objc_msgSend(a1, "locale"), "isEqual:", objc_msgSend(a2, "locale")) & 1) == 0) {
        return 0;
      }
    }
    else if ([a1 locale] || objc_msgSend(a2, "locale"))
    {
      return 0;
    }
    int v5 = [a1 phonetic];
    if (v5 == [a2 phonetic])
    {
      int v6 = [a1 forceFamilyNameFirst];
      if (v6 == [a2 forceFamilyNameFirst])
      {
        int v7 = [a1 forceGivenNameFirst];
        if (v7 == [a2 forceGivenNameFirst])
        {
          int v8 = [a1 ignoresFallbacks];
          if (v8 == [a2 ignoresFallbacks])
          {
            uint64_t v9 = [a1 style];
            return v9 == [a2 style];
          }
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)setPhonetic:(BOOL)a3
{
  self->_phonetic = a3;
}

- (void)setForceFamilyNameFirst:(BOOL)a3
{
  self->_forceFamilyNameFirst = a3;
}

- (void)setForceGivenNameFirst:(BOOL)a3
{
  self->_forceGivenNameFirst = a3;
}

- (void)setLocale:(id)a3
{
}

@end