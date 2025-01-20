@interface _CTSplicedFontKey
- (BOOL)ignoreLegibilityWeight;
- (BOOL)isEqual:(id)a3;
- (NSString)design;
- (NSString)language;
- (NSString)name;
- (NSString)variableSizeParameter;
- (double)lineHeightRatio;
- (double)lineSpacingOverride;
- (double)weight;
- (double)width;
- (id)description;
- (int64_t)legibilityWeight;
- (unint64_t)hash;
- (unint64_t)sizeCategory;
- (unsigned)grade;
- (unsigned)modifier;
- (unsigned)platform;
- (void)dealloc;
- (void)setDesign:(id)a3;
- (void)setGrade:(unsigned int)a3;
- (void)setIgnoreLegibilityWeight:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLegibilityWeight:(int64_t)a3;
- (void)setLineHeightRatio:(double)a3;
- (void)setLineSpacingOverride:(double)a3;
- (void)setModifier:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(unsigned int)a3;
- (void)setSizeCategory:(unint64_t)a3;
- (void)setVariableSizeParameter:(id)a3;
- (void)setWeight:(double)a3;
- (void)setWidth:(double)a3;
@end

@implementation _CTSplicedFontKey

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v16) = 1;
    return v16;
  }
  uint64_t v34 = v5;
  uint64_t v35 = v4;
  uint64_t v36 = v3;
  if (!a3) {
    goto LABEL_21;
  }
  uint64_t v13 = objc_opt_class();
  if (v13 != objc_opt_class()) {
    goto LABEL_21;
  }
  unint64_t hash = self->_hash;
  if (hash != [a3 hash]) {
    goto LABEL_21;
  }
  name = self->_name;
  if (name == (NSString *)[a3 name]
    || (BOOL v16 = -[NSString isEqualToString:](self->_name, "isEqualToString:", [a3 name])))
  {
    language = self->_language;
    if (language == (NSString *)objc_msgSend(a3, "language", v10, v9, v6, v34, v35, v36, v7, v8)
      || (BOOL v16 = -[NSString isEqualToString:](self->_language, "isEqualToString:", [a3 language])))
    {
      double lineHeightRatio = self->_lineHeightRatio;
      [a3 lineHeightRatio];
      if (lineHeightRatio != v19) {
        goto LABEL_21;
      }
      double lineSpacingOverride = self->_lineSpacingOverride;
      [a3 lineSpacingOverride];
      if (lineSpacingOverride != v21) {
        goto LABEL_21;
      }
      int64_t legibilityWeight = self->_legibilityWeight;
      if (legibilityWeight != [a3 legibilityWeight]) {
        goto LABEL_21;
      }
      int ignoreLegibilityWeight = self->_ignoreLegibilityWeight;
      if (ignoreLegibilityWeight != [a3 ignoreLegibilityWeight]) {
        goto LABEL_21;
      }
      unint64_t sizeCategory = self->_sizeCategory;
      if (sizeCategory != [a3 sizeCategory]) {
        goto LABEL_21;
      }
      design = self->_design;
      if (design == (NSString *)[a3 design]
        || (BOOL v16 = -[NSString isEqualToString:](self->_design, "isEqualToString:", [a3 design])))
      {
        double weight = self->_weight;
        [a3 weight];
        if (weight == v27)
        {
          double width = self->_width;
          [a3 width];
          if (width == v29)
          {
            unsigned int grade = self->_grade;
            if (grade == [a3 grade])
            {
              unsigned int platform = self->_platform;
              if (platform == [a3 platform])
              {
                unsigned int modifier = self->_modifier;
                LOBYTE(v16) = modifier == [a3 modifier];
                return v16;
              }
            }
          }
        }
LABEL_21:
        LOBYTE(v16) = 0;
      }
    }
  }
  return v16;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSString)design
{
  return self->_design;
}

- (double)width
{
  return self->_width;
}

- (double)weight
{
  return self->_weight;
}

- (unint64_t)sizeCategory
{
  return self->_sizeCategory;
}

- (unsigned)platform
{
  return self->_platform;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)modifier
{
  return self->_modifier;
}

- (double)lineSpacingOverride
{
  return self->_lineSpacingOverride;
}

- (double)lineHeightRatio
{
  return self->_lineHeightRatio;
}

- (int64_t)legibilityWeight
{
  return self->_legibilityWeight;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)ignoreLegibilityWeight
{
  return self->_ignoreLegibilityWeight;
}

- (unsigned)grade
{
  return self->_grade;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CTSplicedFontKey;
  [(_CTSplicedFontKey *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@/<%p>/%lu/%g/%g", self->_name, self, self->_sizeCategory, *(void *)&self->_weight, *(void *)&self->_width];
}

- (void)setName:(id)a3
{
}

- (void)setLanguage:(id)a3
{
}

- (void)setLineHeightRatio:(double)a3
{
  self->_double lineHeightRatio = a3;
}

- (void)setLineSpacingOverride:(double)a3
{
  self->_double lineSpacingOverride = a3;
}

- (void)setLegibilityWeight:(int64_t)a3
{
  self->_int64_t legibilityWeight = a3;
}

- (void)setIgnoreLegibilityWeight:(BOOL)a3
{
  self->_int ignoreLegibilityWeight = a3;
}

- (void)setSizeCategory:(unint64_t)a3
{
  self->_unint64_t sizeCategory = a3;
}

- (void)setDesign:(id)a3
{
}

- (void)setWeight:(double)a3
{
  self->_double weight = a3;
}

- (void)setWidth:(double)a3
{
  self->_double width = a3;
}

- (void)setGrade:(unsigned int)a3
{
  self->_unsigned int grade = a3;
}

- (void)setPlatform:(unsigned int)a3
{
  self->_unsigned int platform = a3;
}

- (void)setModifier:(unsigned int)a3
{
  self->_unsigned int modifier = a3;
}

- (NSString)variableSizeParameter
{
  return self->_variableSizeParameter;
}

- (void)setVariableSizeParameter:(id)a3
{
  self->_variableSizeParameter = (NSString *)a3;
}

@end