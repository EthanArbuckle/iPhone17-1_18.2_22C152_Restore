@interface ENRegion
+ (BOOL)supportsSecureCoding;
+ (BOOL)validSubdivisionCode:(id)a3 forCountryCode:(id)a4;
+ (ENRegion)regionWithCode:(id)a3;
+ (id)regionFromServerResponseDictionary:(id)a3;
- (BOOL)isCountryCodeEqualToRegion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubdivisionCodeEqualToRegion:(id)a3;
- (BOOL)validSubdivisionCode;
- (ENRegion)initWithCoder:(id)a3;
- (ENRegion)initWithCountryCode:(id)a3;
- (ENRegion)initWithCountryCode:(id)a3 subdivisionCode:(id)a4;
- (NSString)countryCode;
- (NSString)regionCode;
- (NSString)subdivisionCode;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENRegion

- (ENRegion)initWithCountryCode:(id)a3
{
  return [(ENRegion *)self initWithCountryCode:a3 subdivisionCode:0];
}

- (BOOL)validSubdivisionCode
{
  return +[ENRegion validSubdivisionCode:self->_subdivisionCode forCountryCode:self->_countryCode];
}

+ (BOOL)validSubdivisionCode:(id)a3 forCountryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v5, "containsString:", @"-"))
  {
    v7 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "rangeOfString:", @"-"));
    char v8 = [v7 isEqualToString:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(ENRegion *)self isCountryCodeEqualToRegion:v5]) {
      BOOL v6 = [(ENRegion *)self isSubdivisionCodeEqualToRegion:v5];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isCountryCodeEqualToRegion:(id)a3
{
  countryCode = self->_countryCode;
  id v4 = [a3 countryCode];
  id v5 = countryCode;
  BOOL v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else if ((v5 == 0) == (v6 != 0))
  {
    char v8 = 0;
  }
  else
  {
    char v8 = [(NSString *)v5 isEqual:v6];
  }

  return v8;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (ENRegion)initWithCountryCode:(id)a3 subdivisionCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENRegion;
  char v8 = [(ENRegion *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 uppercaseString];
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v9;

    if (v7)
    {
      if (+[ENRegion validSubdivisionCode:v7 forCountryCode:v6])
      {
        uint64_t v11 = [v7 uppercaseString];
        subdivisionCode = v8->_subdivisionCode;
        v8->_subdivisionCode = (NSString *)v11;
      }
      else if (gLogCategory_ENRegion <= 90 && (gLogCategory_ENRegion != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subdivisionCode, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

- (BOOL)isSubdivisionCodeEqualToRegion:(id)a3
{
  subdivisionCode = self->_subdivisionCode;
  id v4 = [a3 subdivisionCode];
  id v5 = subdivisionCode;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else if ((v5 == 0) == (v6 != 0))
  {
    char v8 = 0;
  }
  else
  {
    char v8 = [(NSString *)v5 isEqual:v6];
  }

  return v8;
}

- (NSString)subdivisionCode
{
  return self->_subdivisionCode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  countryCode = self->_countryCode;
  subdivisionCode = self->_subdivisionCode;

  return (id)[v4 initWithCountryCode:countryCode subdivisionCode:subdivisionCode];
}

+ (id)regionFromServerResponseDictionary:(id)a3
{
  id v3 = a3;
  CFStringGetTypeID();
  id v4 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  id v5 = CFDictionaryGetTypedValue();
  if (![v5 length])
  {
    id v6 = [[ENRegion alloc] initWithCountryCode:v4];
    goto LABEL_5;
  }
  if (+[ENRegion validSubdivisionCode:v5 forCountryCode:v4])
  {
    id v6 = [[ENRegion alloc] initWithCountryCode:v4 subdivisionCode:v5];
LABEL_5:
    id v7 = v6;
    goto LABEL_6;
  }
  if (gLogCategory__ENRegionServerConfiguration <= 90
    && (gLogCategory__ENRegionServerConfiguration != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

+ (ENRegion)regionWithCode:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"-"])
  {
    id v4 = [v3 componentsSeparatedByString:@"-"];
    id v5 = [v4 firstObject];
    id v6 = [[ENRegion alloc] initWithCountryCode:v5 subdivisionCode:v3];

    id v3 = v4;
  }
  else
  {
    id v6 = [[ENRegion alloc] initWithCountryCode:v3];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subdivisionCode"];

  id v7 = [(ENRegion *)self initWithCountryCode:v5 subdivisionCode:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  countryCode = self->_countryCode;
  id v5 = a3;
  [v5 encodeObject:countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_subdivisionCode forKey:@"subdivisionCode"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_countryCode hash];
  return [(NSString *)self->_subdivisionCode hash] ^ v3;
}

- (NSString)regionCode
{
  if ([(ENRegion *)self validSubdivisionCode]) {
    [(ENRegion *)self subdivisionCode];
  }
  else {
  NSUInteger v3 = [(ENRegion *)self countryCode];
  }

  return (NSString *)v3;
}

@end