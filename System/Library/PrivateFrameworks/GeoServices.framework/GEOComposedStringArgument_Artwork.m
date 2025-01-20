@interface GEOComposedStringArgument_Artwork
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Artwork)initWithCoder:(id)a3;
- (id)_attributedStringReplacementWithOptions:(id)a3;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)attributedStringHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedStringHandler:(id)a3;
@end

@implementation GEOComposedStringArgument_Artwork

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_Artwork;
  id v5 = [(GEOComposedStringArgument *)&v16 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    uint64_t v6 = [v4 artwork];
    v7 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v6;

    v8 = [v4 valString];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v11 = [*((id *)v5 + 4) shield];
      id v10 = [v11 shieldText];
    }
    uint64_t v12 = [v10 copy];
    v13 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v12;

    id v14 = v5;
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  artwork = self->_artwork;
  if (artwork
    && (attributedStringHandler = (void (**)(id, GEOPBTransitArtwork *, id, NSString *))self->_attributedStringHandler) != 0)
  {
    if (v4) {
      v8 = (void *)*((void *)v4 + 2);
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
    id v10 = attributedStringHandler[2](attributedStringHandler, artwork, v9, self->_fallbackStringValue);

    if (v10) {
      goto LABEL_14;
    }
    if (self->_fallbackStringValue)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_fallbackStringValue];
      v11 = GEOGetGEOComposedStringLog_1();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        fallbackStringValue = self->_fallbackStringValue;
        int v18 = 138412290;
        v19 = (GEOComposedStringArgument_Artwork *)fallbackStringValue;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Did not get valid string replacement from attributedStringHandler, using fallback string: \"%@\"", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_13;
    }
    v11 = GEOGetGEOComposedStringLog_1();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v18 = 138412290;
      v19 = self;
      id v14 = "Did not get valid string replacement from attributedStringHandler and no fallback string is available: %@";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_FAULT;
      goto LABEL_11;
    }
  }
  else
  {
    v11 = GEOGetGEOComposedStringLog_1();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = self->_fallbackStringValue;
      int v18 = 138412290;
      v19 = (GEOComposedStringArgument_Artwork *)v13;
      id v14 = "Artwork string \"%@\" was built without attributedStringHandler set.";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_11:
      _os_log_impl(&dword_188D96000, v15, v16, v14, (uint8_t *)&v18, 0xCu);
    }
  }
  id v10 = 0;
LABEL_13:

LABEL_14:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedStringArgument_Artwork;
  id v4 = [(GEOComposedStringArgument *)&v8 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_artwork);
  uint64_t v5 = [(NSString *)self->_fallbackStringValue copy];
  id v6 = v4[5];
  v4[5] = (id)v5;

  return v4;
}

- (GEOComposedStringArgument_Artwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Artwork;
  uint64_t v5 = [(GEOComposedStringArgument *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_artwork"];
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fallbackStringValue"];
    fallbackStringValue = v5->_fallbackStringValue;
    v5->_fallbackStringValue = (NSString *)v8;

    id v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Artwork;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_artwork, @"_artwork", v5.receiver, v5.super_class);
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
    v17.super_class = (Class)GEOComposedStringArgument_Artwork;
    if ([(GEOComposedStringArgument *)&v17 isEqual:v5]
      && ((uint64_t v6 = (void *)v5[4], v7 = self->_artwork, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, BOOL v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10)))
    {
      fallbackStringValue = self->_fallbackStringValue;
      uint64_t v12 = v5[5];
      id v13 = fallbackStringValue;
      id v14 = v13;
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

  objc_storeStrong((id *)&self->_artwork, 0);
}

@end