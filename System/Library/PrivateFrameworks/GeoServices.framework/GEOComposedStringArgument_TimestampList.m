@interface GEOComposedStringArgument_TimestampList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_TimestampList)initWithCoder:(id)a3;
- (NSArray)overrideTimestamps;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideTimestamps:(id)a3;
@end

@implementation GEOComposedStringArgument_TimestampList

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedStringArgument_TimestampList;
  v5 = [(GEOComposedStringArgument *)&v11 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    v6 = [v4 timestampDatas];
    uint64_t v7 = objc_msgSend(v6, "_geo_map:", &__block_literal_global_56);
    id v8 = v5[4];
    v5[4] = (id)v7;

    objc_msgSend(v5, "setHasDefaultValue:", objc_msgSend(v5[4], "count") != 0);
    v9 = v5;
  }

  return v5;
}

- (void)setOverrideTimestamps:(id)a3
{
  id v4 = a3;
  [(GEOComposedStringArgument *)self setHasOverrideValue:1];
  v5 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];

  overrideTimestamps = self->_overrideTimestamps;
  self->_overrideTimestamps = v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  if ([(GEOComposedStringArgument *)self hasOverrideValue]
    || [(GEOComposedStringArgument *)self hasDefaultValue])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = +[GEOComposedString localizationProvider];
    v6 = [v5 locale];
    [v4 setLocale:v6];

    v33 = [v4 AMSymbol];
    v30 = v4;
    v32 = [v4 PMSymbol];
    overrideTimestamps = self->_overrideTimestamps;
    if (!overrideTimestamps) {
      overrideTimestamps = self->_defaultTimestamps;
    }
    id v8 = overrideTimestamps;
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v8, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = [(NSArray *)v8 reverseObjectEnumerator];
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = [*(id *)(*((void *)&v35 + 1) + 8 * i) _stringReplacementWithOptions:v34];
          uint64_t v16 = [v15 rangeOfString:v33];
          uint64_t v18 = v17;
          uint64_t v19 = [v15 rangeOfString:v32];
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v19 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v12 = 0;
              goto LABEL_22;
            }
            if (v12 == 2)
            {
              uint64_t v16 = v19;
              uint64_t v18 = v20;
              uint64_t v21 = 2;
LABEL_17:
              uint64_t v22 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v16, v18, &stru_1ED51F370);

              v15 = (void *)v22;
              goto LABEL_19;
            }
            uint64_t v21 = 2;
          }
          else
          {
            uint64_t v21 = 1;
            if (v12 == 1) {
              goto LABEL_17;
            }
          }
LABEL_19:
          if (v21 == v12)
          {
            v23 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[  ]{2,}" options:0 error:0];
            v24 = objc_msgSend(v23, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v15, "length"), @" ");

            v25 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            v15 = [v24 stringByTrimmingCharactersInSet:v25];
          }
          else
          {
            uint64_t v12 = v21;
          }
LABEL_22:
          [v9 insertObject:v15 atIndex:0];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v11);
    }

    v26 = +[GEOComposedString localizationProvider];
    v27 = [v26 separatorForTimestampList];

    v28 = [v9 componentsJoinedByString:v27];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_TimestampList;
  id v4 = [(GEOComposedStringArgument *)&v10 copyWithZone:a3];
  if (self->_defaultTimestamps)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_defaultTimestamps copyItems:1];
    v6 = (void *)v4[4];
    v4[4] = v5;
  }
  if (self->_overrideTimestamps)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_overrideTimestamps copyItems:1];
    id v8 = (void *)v4[5];
    v4[5] = v7;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_TimestampList;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultTimestamps, @"_defaultTimestamps", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_overrideTimestamps forKey:@"_overrideTimestamps"];
}

- (GEOComposedStringArgument_TimestampList)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_TimestampList;
  objc_super v5 = [(GEOComposedStringArgument *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_defaultTimestamps"];
    defaultTimestamps = v5->_defaultTimestamps;
    v5->_defaultTimestamps = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_overrideTimestamps"];
    overrideTimestamps = v5->_overrideTimestamps;
    v5->_overrideTimestamps = (NSArray *)v8;

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
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_TimestampList;
    if ([(GEOComposedStringArgument *)&v17 isEqual:v5]
      && ((v6 = (void *)v5[4], unint64_t v7 = self->_defaultTimestamps, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, int v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10)))
    {
      overrideTimestamps = self->_overrideTimestamps;
      uint64_t v12 = v5[5];
      id v13 = overrideTimestamps;
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

- (NSArray)overrideTimestamps
{
  return self->_overrideTimestamps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTimestamps, 0);

  objc_storeStrong((id *)&self->_defaultTimestamps, 0);
}

@end