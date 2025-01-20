@interface GEOComposedStringArgument
+ (BOOL)supportsSecureCoding;
+ (id)argumentForGeoFormatArgument:(id)a3;
- (BOOL)hasDefaultValue;
- (BOOL)hasOverrideValue;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument)initWithCoder:(id)a3;
- (GEOComposedStringArgument_Artwork)artworkFormat;
- (GEOComposedStringArgument_Countdown)countdownFormat;
- (GEOComposedStringArgument_Distance)distanceFormat;
- (GEOComposedStringArgument_Duration)durationFormat;
- (GEOComposedStringArgument_Frequency)frequencyFormat;
- (GEOComposedStringArgument_Maneuver)maneuverFormat;
- (GEOComposedStringArgument_Percentage)percentageFormat;
- (GEOComposedStringArgument_Power)powerFormat;
- (GEOComposedStringArgument_Price)priceFormat;
- (GEOComposedStringArgument_String)stringFormat;
- (GEOComposedStringArgument_Substitution)substitutionFormat;
- (GEOComposedStringArgument_Timestamp)timestampFormat;
- (GEOComposedStringArgument_TimestampList)timestampListFormat;
- (GEOComposedStringArgument_URL)urlFormat;
- (NSDictionary)stringAttributes;
- (NSString)token;
- (id)_attributedStringReplacementWithOptions:(id)a3;
- (id)_init;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)replaceTokenWithOptions:(id)a3;
- (int)type;
- (void)encodeWithCoder:(id)a3;
- (void)setHasDefaultValue:(BOOL)a3;
- (void)setHasOverrideValue:(BOOL)a3;
- (void)setStringAttributes:(id)a3;
@end

@implementation GEOComposedStringArgument

- (GEOComposedStringArgument_Artwork)artworkFormat
{
  return 0;
}

- (GEOComposedStringArgument_Countdown)countdownFormat
{
  return 0;
}

- (GEOComposedStringArgument_Distance)distanceFormat
{
  return 0;
}

- (GEOComposedStringArgument_Duration)durationFormat
{
  return 0;
}

- (GEOComposedStringArgument_Frequency)frequencyFormat
{
  return 0;
}

- (GEOComposedStringArgument_Maneuver)maneuverFormat
{
  return 0;
}

- (GEOComposedStringArgument_Percentage)percentageFormat
{
  return 0;
}

- (GEOComposedStringArgument_Power)powerFormat
{
  return 0;
}

- (GEOComposedStringArgument_Price)priceFormat
{
  return 0;
}

- (GEOComposedStringArgument_String)stringFormat
{
  return 0;
}

- (GEOComposedStringArgument_Substitution)substitutionFormat
{
  return 0;
}

- (GEOComposedStringArgument_Timestamp)timestampFormat
{
  return 0;
}

- (GEOComposedStringArgument_TimestampList)timestampListFormat
{
  return 0;
}

- (GEOComposedStringArgument_URL)urlFormat
{
  return 0;
}

+ (id)argumentForGeoFormatArgument:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 format])
  {
    unsigned int v5 = [v4 format] - 1;
    if (v5 < 0x12 && ((0x3FFBFu >> v5) & 1) != 0)
    {
      v9 = (void *)[objc_alloc(*off_1E53DD418[v5]) _initWithGeoFormatArgument:v4];
      goto LABEL_16;
    }
    if (qword_1EB29F728 != -1) {
      dispatch_once(&qword_1EB29F728, &__block_literal_global_37);
    }
    v6 = (id)_MergedGlobals_203;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = [v4 format];
      if v7 < 0x13 && ((0x7FF7Fu >> v7))
      {
        v8 = off_1E53DD4A8[(int)v7];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_FAULT, "Unhandled format: %@", buf, 0xCu);
    }
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOComposedStringArgument;
  v2 = [(GEOComposedStringArgument *)&v6 init];
  id v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedStringArgument;
  unsigned int v5 = [(GEOComposedStringArgument *)&v11 init];
  if (v5)
  {
    objc_super v6 = [v4 token];
    uint64_t v7 = [v6 copy];
    token = v5->_token;
    v5->_token = (NSString *)v7;

    v5->_type = [v4 format];
    v9 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = objc_opt_class();
  }
  return 0;
}

- (id)_attributedStringReplacementWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && *((unsigned char *)v4 + 8))
  {
    uint64_t v6 = [(GEOComposedStringArgument *)self _stringReplacementWithOptions:v4];
    if (v6) {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:self->_stringAttributes];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)replaceTokenWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(GEOComposedStringTokenReplacementResult);
  uint64_t v6 = v5;
  if (v5)
  {
    v5->type = self->_type;
    uint64_t v7 = [(GEOComposedStringArgument *)self _stringReplacementWithOptions:v4];
    objc_setProperty_nonatomic_copy(v6, v8, v7, 16);
  }
  else
  {
    uint64_t v7 = [(GEOComposedStringArgument *)self _stringReplacementWithOptions:v4];
  }

  if (v4 && v4[8])
  {
    v10 = [(GEOComposedStringArgument *)self _attributedStringReplacementWithOptions:v4];
    int v11 = 1;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v11 = 0;
  v10 = 0;
  if (v6) {
LABEL_6:
  }
    objc_setProperty_nonatomic_copy(v6, v9, v10, 24);
LABEL_7:
  if (v11) {

  }
  if (v4 && v4[8])
  {
    v12 = [(GEOComposedStringTokenReplacementResult *)v6 attributedString];
    if (v6)
    {
LABEL_12:
      v6->success = v12 != 0;

      v6->range = (_NSRange)xmmword_18A62B170;
      goto LABEL_13;
    }
  }
  else
  {
    v12 = [(GEOComposedStringTokenReplacementResult *)v6 string];
    if (v6) {
      goto LABEL_12;
    }
  }

LABEL_13:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_token copy];
  uint64_t v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  *(_DWORD *)(v4 + 16) = self->_type;
  *(unsigned char *)(v4 + 20) = self->_hasDefaultValue;
  *(unsigned char *)(v4 + 21) = self->_hasOverrideValue;
  uint64_t v7 = [(NSDictionary *)self->_stringAttributes copy];
  SEL v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedStringArgument)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument;
  uint64_t v5 = [(GEOComposedStringArgument *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_token"];
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_hasDefaultValue = [v4 decodeBoolForKey:@"_hasDefaultValue"];
    v5->_hasOverrideValue = [v4 decodeBoolForKey:@"_hasOverrideValue"];
    SEL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringAttributesData"];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:0];
    [v9 setRequiresSecureCoding:0];
    uint64_t v10 = [v9 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    stringAttributes = v5->_stringAttributes;
    v5->_stringAttributes = (NSDictionary *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  token = self->_token;
  id v5 = a3;
  [v5 encodeObject:token forKey:@"_token"];
  [v5 encodeInteger:self->_type forKey:@"_type"];
  [v5 encodeBool:self->_hasDefaultValue forKey:@"_hasDefaultValue"];
  [v5 encodeBool:self->_hasOverrideValue forKey:@"_hasOverrideValue"];
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_stringAttributes requiringSecureCoding:0 error:0];
  [v5 encodeObject:v6 forKey:@"stringAttributesData"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = (void *)v5[1];
    unint64_t v7 = self->_token;
    unint64_t v8 = v6;
    if ((!(v7 | v8)
       || (v9 = (void *)v8, int v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10))
      && self->_type == *((_DWORD *)v5 + 4)
      && self->_hasDefaultValue == *((unsigned __int8 *)v5 + 20)
      && self->_hasOverrideValue == *((unsigned __int8 *)v5 + 21))
    {
      stringAttributes = self->_stringAttributes;
      uint64_t v12 = v5[3];
      id v13 = stringAttributes;
      objc_super v14 = v13;
      if ((unint64_t)v13 | v12) {
        char v15 = [v13 isEqual:v12];
      }
      else {
        char v15 = 1;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  token = self->_token;
  uint64_t type = self->_type;
  if type < 0x13 && ((0x7FF7Fu >> type))
  {
    id v6 = off_1E53DD4A8[type];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", type);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v7 = [(__CFString *)v6 capitalizedString];
  unint64_t v8 = [v3 stringWithFormat:@"%@ [%@]", token, v7];

  uint64_t v9 = objc_opt_new();
  int v10 = (void *)v9;
  if (v9) {
    *(unsigned char *)(v9 + 9) = 1;
  }
  uint64_t v11 = [(GEOComposedStringArgument *)self _stringReplacementWithOptions:v9];
  uint64_t v12 = (void *)v11;
  if (v11) {
    [v8 appendFormat:@" \"%@\"", v11];
  }

  return v8;
}

- (NSString)token
{
  return self->_token;
}

- (int)type
{
  return self->_type;
}

- (BOOL)hasDefaultValue
{
  return self->_hasDefaultValue;
}

- (void)setHasDefaultValue:(BOOL)a3
{
  self->_hasDefaultValue = a3;
}

- (BOOL)hasOverrideValue
{
  return self->_hasOverrideValue;
}

- (void)setHasOverrideValue:(BOOL)a3
{
  self->_hasOverrideValue = a3;
}

- (NSDictionary)stringAttributes
{
  return self->_stringAttributes;
}

- (void)setStringAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringAttributes, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

id __70__GEOComposedStringArgument_TimestampList__initWithGeoFormatArgument___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GEOComposedStringArgument_Timestamp alloc] _initWithGeoTimestampData:v2];

  return v3;
}

void __66__GEOComposedStringArgument_Countdown__initWithGeoFormatArgument___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = *(unsigned int *)([v5 alternateCountdownTypes] + 4 * a3);
  id v10 = (id)[v6 copy];

  unint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [NSNumber numberWithInt:v7];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

@end