@interface GEOComposedStringArgument_Maneuver
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Maneuver)initWithCoder:(id)a3;
- (id)_attributedStringReplacementWithOptions:(id)a3;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)attributedStringHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedStringHandler:(id)a3;
@end

@implementation GEOComposedStringArgument_Maneuver

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedStringArgument_Maneuver;
  v5 = [(GEOComposedStringArgument *)&v15 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    v6 = [v4 maneuverData];
    v5[8] = [v6 maneuverType];

    v7 = [v4 maneuverData];
    uint64_t v8 = [v7 junctionInfo];
    v9 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v8;

    v10 = [v4 valString];
    uint64_t v11 = [v10 copy];
    v12 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v11;

    v13 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  if (a3 && *((unsigned char *)a3 + 9)) {
    return self->_fallbackStringValue;
  }
  else {
    return 0;
  }
}

- (id)_attributedStringReplacementWithOptions:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  attributedStringHandler = (void (**)(id, void, GEOJunctionInfo *))self->_attributedStringHandler;
  if (attributedStringHandler)
  {
    v6 = attributedStringHandler[2](attributedStringHandler, self->_maneuverType, self->_junctionInfo);
  }
  else
  {
    if (qword_1EB29DE10 != -1) {
      dispatch_once(&qword_1EB29DE10, &__block_literal_global_91);
    }
    v7 = _MergedGlobals_3_0;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_3_0, OS_LOG_TYPE_ERROR))
    {
      fallbackStringValue = self->_fallbackStringValue;
      int v10 = 138412290;
      uint64_t v11 = fallbackStringValue;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Maneuver string \"%@\" was built without attributedStringHandler set.", (uint8_t *)&v10, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedStringArgument_Maneuver;
  id v4 = [(GEOComposedStringArgument *)&v8 copyWithZone:a3];
  *((_DWORD *)v4 + 8) = self->_maneuverType;
  objc_storeStrong((id *)v4 + 5, self->_junctionInfo);
  uint64_t v5 = [(NSString *)self->_fallbackStringValue copy];
  v6 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v5;

  return v4;
}

- (GEOComposedStringArgument_Maneuver)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Maneuver;
  uint64_t v5 = [(GEOComposedStringArgument *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_maneuverType = [v4 decodeIntegerForKey:@"_maneuverType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_junctionInfo"];
    junctionInfo = v5->_junctionInfo;
    v5->_junctionInfo = (GEOJunctionInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fallbackStringValue"];
    fallbackStringValue = v5->_fallbackStringValue;
    v5->_fallbackStringValue = (NSString *)v8;

    int v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Maneuver;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maneuverType, @"_maneuverType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_junctionInfo forKey:@"_junctionInfo"];
  [v4 encodeObject:self->_fallbackStringValue forKey:@"_fallbackStringValue"];
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
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_Maneuver;
    if ([(GEOComposedStringArgument *)&v17 isEqual:v5]
      && self->_maneuverType == *((_DWORD *)v5 + 8)
      && ((v6 = (void *)v5[5], v7 = self->_junctionInfo, unint64_t v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, BOOL v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10)))
    {
      fallbackStringValue = self->_fallbackStringValue;
      uint64_t v12 = v5[6];
      id v13 = fallbackStringValue;
      v14 = v13;
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

- (id)attributedStringHandler
{
  return self->_attributedStringHandler;
}

- (void)setAttributedStringHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attributedStringHandler, 0);
  objc_storeStrong((id *)&self->_fallbackStringValue, 0);

  objc_storeStrong((id *)&self->_junctionInfo, 0);
}

@end