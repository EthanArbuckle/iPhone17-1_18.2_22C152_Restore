@interface GEOComposedStringArgument_String
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_String)initWithCoder:(id)a3;
- (NSString)overrideValue;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)privacyFilterType;
- (int)stringSubstituteType;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideValue:(id)a3;
@end

@implementation GEOComposedStringArgument_String

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument_String;
  v5 = [(GEOComposedStringArgument *)&v14 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    v6 = [v4 stringSubstituteData];
    v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 tokenSubstitute];
      v9 = (void *)v5[4];
      v5[4] = v8;

      *((_DWORD *)v5 + 12) = [v7 stringSubstituteType];
      *((_DWORD *)v5 + 13) = [v7 privacyFilterType];
    }
    if ([v4 hasValString])
    {
      uint64_t v10 = [v4 valString];
      v11 = (void *)v5[4];
      v5[4] = v10;

      *((_DWORD *)v5 + 12) = 0;
      *((_DWORD *)v5 + 13) = 0;
    }
    v12 = v5;
  }
  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  overrideValue = self->_overrideValue;
  if (overrideValue || v4 && *((unsigned char *)v4 + 9) && (overrideValue = self->_defaultValue) != 0) {
    v7 = overrideValue;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_String;
  id v4 = [(GEOComposedStringArgument *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_defaultValue copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSString *)self->_overrideValue copy];
  uint64_t v8 = (void *)v4[5];
  v4[5] = v7;

  *((_DWORD *)v4 + 12) = self->_stringSubstituteType;
  *((_DWORD *)v4 + 13) = self->_privacyFilterType;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_String;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, @"_defaultValue", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_overrideValue forKey:@"_overrideValue"];
  [v4 encodeInteger:self->_stringSubstituteType forKey:@"_stringSubstituteType"];
  [v4 encodeInteger:self->_privacyFilterType forKey:@"_privacyFilterType"];
}

- (GEOComposedStringArgument_String)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_String;
  objc_super v5 = [(GEOComposedStringArgument *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultValue"];
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideValue"];
    overrideValue = v5->_overrideValue;
    v5->_overrideValue = (NSString *)v8;

    v5->_stringSubstituteType = [v4 decodeIntegerForKey:@"_stringSubstituteType"];
    v5->_privacyFilterType = [v4 decodeIntegerForKey:@"_privacyFilterType"];
    objc_super v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v5 = v4;
    v18.receiver = self;
    v18.super_class = (Class)GEOComposedStringArgument_String;
    if (![(GEOComposedStringArgument *)&v18 isEqual:v5]) {
      goto LABEL_10;
    }
    uint64_t v6 = (void *)v5[4];
    unint64_t v7 = self->_defaultValue;
    unint64_t v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      int v10 = [(id)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_10;
      }
    }
    if (((v11 = (void *)v5[5], unint64_t v12 = self->_overrideValue, v13 = v11, !(v12 | v13))
       || (objc_super v14 = (void *)v13, v15 = [(id)v12 isEqual:v13],
                              v14,
                              (id)v12,
                              v15))
      && self->_stringSubstituteType == *((_DWORD *)v5 + 12))
    {
      BOOL v16 = self->_privacyFilterType == *((_DWORD *)v5 + 13);
    }
    else
    {
LABEL_10:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (NSString)overrideValue
{
  return self->_overrideValue;
}

- (void)setOverrideValue:(id)a3
{
}

- (int)stringSubstituteType
{
  return self->_stringSubstituteType;
}

- (int)privacyFilterType
{
  return self->_privacyFilterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValue, 0);

  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end