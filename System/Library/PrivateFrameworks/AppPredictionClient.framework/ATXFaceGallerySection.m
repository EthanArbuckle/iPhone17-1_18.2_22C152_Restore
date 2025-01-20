@interface ATXFaceGallerySection
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)sectionFromJSONDictionary:(id)a3;
- (ATXFaceGallerySection)initWithCoder:(id)a3;
- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 symbolImageName:(id)a4 symbolColorName:(id)a5 localizedSubtitle:(id)a6 localizedDescriptiveText:(id)a7 unityDescription:(id)a8 type:(int64_t)a9 items:(id)a10 semanticType:(int64_t)a11;
- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 unityDescription:(id)a4 type:(int64_t)a5 items:(id)a6;
- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 unityDescription:(id)a4 type:(int64_t)a5 items:(id)a6 semanticType:(int64_t)a7;
- (ATXFaceGallerySection)initWithProto:(id)a3;
- (ATXFaceGallerySection)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSDictionary)jsonDictionary;
- (NSString)description;
- (NSString)localizedDescriptiveText;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)symbolColorName;
- (NSString)symbolImageName;
- (NSString)unityDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)json;
- (id)proto;
- (int64_t)semanticType;
- (int64_t)type;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setItems:(id)a3;
- (void)setLocalizedDescriptiveText:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setSymbolColorName:(id)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUnityDescription:(id)a3;
@end

@implementation ATXFaceGallerySection

- (ATXFaceGallerySection)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSubtitle"];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescriptiveText"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"symbolImageName"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"symbolColorName"];
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"unityDescription"];
  uint64_t v9 = [v3 decodeIntegerForKey:@"type"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v12 = [v10 setWithArray:v11];
  v13 = [v3 decodeObjectOfClasses:v12 forKey:@"items"];

  if (v13)
  {
    uint64_t v22 = v9;
    v14 = (void *)v5;
    v15 = (void *)v4;
    v16 = (void *)v23;
    v17 = (void *)v8;
    v18 = -[ATXFaceGallerySection initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:](self, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v23, v6, v7, v15, v14, v8, v22, v13, [v3 decodeIntegerForKey:@"semanticType"]);
    v19 = v18;
  }
  else
  {
    v17 = (void *)v8;
    v14 = (void *)v5;
    v15 = (void *)v4;
    v16 = (void *)v23;
    v18 = self;
    v20 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceGallerySection initWithCoder:](v20);
    }

    v19 = 0;
  }

  return v19;
}

- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 symbolImageName:(id)a4 symbolColorName:(id)a5 localizedSubtitle:(id)a6 localizedDescriptiveText:(id)a7 unityDescription:(id)a8 type:(int64_t)a9 items:(id)a10 semanticType:(int64_t)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)ATXFaceGallerySection;
  v24 = [(ATXFaceGallerySection *)&v40 init];
  if (v24)
  {
    uint64_t v25 = [v17 copy];
    localizedTitle = v24->_localizedTitle;
    v24->_localizedTitle = (NSString *)v25;

    uint64_t v27 = [v20 copy];
    localizedSubtitle = v24->_localizedSubtitle;
    v24->_localizedSubtitle = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    symbolImageName = v24->_symbolImageName;
    v24->_symbolImageName = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    symbolColorName = v24->_symbolColorName;
    v24->_symbolColorName = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    localizedDescriptiveText = v24->_localizedDescriptiveText;
    v24->_localizedDescriptiveText = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    unityDescription = v24->_unityDescription;
    v24->_unityDescription = (NSString *)v35;

    v24->_type = a9;
    uint64_t v37 = [v23 copy];
    items = v24->_items;
    v24->_items = (NSArray *)v37;

    v24->_semanticType = a11;
  }

  return v24;
}

- (NSArray)items
{
  return self->_items;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 unityDescription:(id)a4 type:(int64_t)a5 items:(id)a6
{
  return [(ATXFaceGallerySection *)self initWithLocalizedTitle:a3 unityDescription:a4 type:a5 items:a6 semanticType:0];
}

- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 unityDescription:(id)a4 type:(int64_t)a5 items:(id)a6 semanticType:(int64_t)a7
{
  return [(ATXFaceGallerySection *)self initWithLocalizedTitle:a3 symbolImageName:0 symbolColorName:0 localizedSubtitle:0 localizedDescriptiveText:0 unityDescription:a4 type:a5 items:a6 semanticType:a7];
}

+ (id)sectionFromJSONDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"localizedTitle"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"localizedTitle"];
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = [v3 objectForKeyedSubscript:@"localizedSubtitle"];
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  if (v8)
  {
    uint64_t v9 = [v3 objectForKeyedSubscript:@"localizedSubtitle"];
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = [v3 objectForKeyedSubscript:@"symbolImageName"];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    v12 = [v3 objectForKeyedSubscript:@"symbolImageName"];
  }
  else
  {
    v12 = 0;
  }
  v13 = [v3 objectForKeyedSubscript:@"symbolColorName"];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if (v14)
  {
    v15 = [v3 objectForKeyedSubscript:@"symbolColorName"];
  }
  else
  {
    v15 = 0;
  }
  v16 = [v3 objectForKeyedSubscript:@"localizedDescriptiveText"];
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  if (v17)
  {
    id v18 = [v3 objectForKeyedSubscript:@"localizedDescriptiveText"];
  }
  else
  {
    id v18 = 0;
  }
  id v19 = [v3 objectForKeyedSubscript:@"unityDescription"];
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();

  if (v20)
  {
    id v21 = [v3 objectForKeyedSubscript:@"unityDescription"];
  }
  else
  {
    id v21 = &stru_1EFD9B408;
  }
  id v22 = [v3 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  char v23 = objc_opt_isKindOfClass();

  uint64_t v37 = (void *)v9;
  if (v23)
  {
    id v24 = [v3 objectForKeyedSubscript:@"type"];
    if ([v24 isEqualToString:@"Full"])
    {
      uint64_t v25 = (void *)v6;
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v25 = (void *)v6;
      if ([v24 isEqualToString:@"Scrollable"])
      {
        uint64_t v26 = 1;
      }
      else if ([v24 isEqualToString:@"Unity"])
      {
        uint64_t v26 = 2;
      }
      else if ([v24 isEqualToString:@"ScrollableSquares"])
      {
        uint64_t v26 = 3;
      }
      else
      {
        uint64_t v26 = 0;
      }
    }
  }
  else
  {
    uint64_t v25 = (void *)v6;
    uint64_t v26 = 1;
  }
  uint64_t v27 = [v3 objectForKeyedSubscript:@"items"];
  objc_opt_class();
  char v28 = objc_opt_isKindOfClass();

  if (v28)
  {
    uint64_t v29 = [v3 objectForKeyedSubscript:@"items"];
    v30 = objc_msgSend(v29, "_pas_mappedArrayWithTransform:", &__block_literal_global_68);
  }
  else
  {
    v30 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v31 = [v3 objectForKeyedSubscript:@"semanticType"];
  objc_opt_class();
  char v32 = objc_opt_isKindOfClass();

  if (v32)
  {
    id v33 = [v3 objectForKeyedSubscript:@"semanticType"];
    if ([v33 isEqualToString:@"Default"])
    {
      uint64_t v34 = 0;
    }
    else if ([v33 isEqualToString:@"FeaturedFaces"])
    {
      uint64_t v34 = 1;
    }
    else if ([v33 isEqualToString:@"FeaturedPhotos"])
    {
      uint64_t v34 = 2;
    }
    else if ([v33 isEqualToString:@"Focus"])
    {
      uint64_t v34 = 3;
    }
    else if ([v33 isEqualToString:@"Hero"])
    {
      uint64_t v34 = 4;
    }
    else if ([v33 isEqualToString:@"PhotoShuffle"])
    {
      uint64_t v34 = 5;
    }
    else if ([v33 isEqualToString:@"WeatherAndAstronomy"])
    {
      uint64_t v34 = 6;
    }
    else if ([v33 isEqualToString:@"Kaleidoscope"])
    {
      uint64_t v34 = 7;
    }
    else if ([v33 isEqualToString:@"Emoji"])
    {
      uint64_t v34 = 8;
    }
    else if ([v33 isEqualToString:@"Unity"])
    {
      uint64_t v34 = 9;
    }
    else if ([v33 isEqualToString:@"Pride"])
    {
      uint64_t v34 = 10;
    }
    else if ([v33 isEqualToString:@"OSVersion"])
    {
      uint64_t v34 = 11;
    }
    else if ([v33 isEqualToString:@"Collections"])
    {
      uint64_t v34 = 12;
    }
    else if ([v33 isEqualToString:@"Color"])
    {
      uint64_t v34 = 13;
    }
    else
    {
      uint64_t v34 = 0;
    }
  }
  else
  {
    uint64_t v34 = 0;
  }
  uint64_t v35 = [[ATXFaceGallerySection alloc] initWithLocalizedTitle:v25 symbolImageName:v12 symbolColorName:v15 localizedSubtitle:v37 localizedDescriptiveText:v18 unityDescription:v21 type:v26 items:v30 semanticType:v34];

  return v35;
}

id __51__ATXFaceGallerySection_sectionFromJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[ATXFaceGalleryItem itemFromJSONDictionary:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSString)description
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = [NSString alloc];
  uint64_t v5 = [(ATXFaceGallerySection *)self localizedTitle];
  uint64_t v6 = (void *)[v4 initWithFormat:@"    localizedTitle: %@", v5];
  [v3 addObject:v6];

  id v7 = [NSString alloc];
  char v8 = [(ATXFaceGallerySection *)self symbolImageName];
  uint64_t v9 = (void *)[v7 initWithFormat:@"    symbolImageName: %@", v8];
  [v3 addObject:v9];

  id v10 = [NSString alloc];
  char v11 = [(ATXFaceGallerySection *)self symbolColorName];
  v12 = (void *)[v10 initWithFormat:@"    symbolColorName: %@", v11];
  [v3 addObject:v12];

  id v13 = [NSString alloc];
  char v14 = [(ATXFaceGallerySection *)self localizedSubtitle];
  v15 = (void *)[v13 initWithFormat:@"    localizedSubtitle: %@", v14];
  [v3 addObject:v15];

  id v16 = [NSString alloc];
  char v17 = [(ATXFaceGallerySection *)self localizedDescriptiveText];
  id v18 = (void *)[v16 initWithFormat:@"    localizedDescriptiveText: %@", v17];
  [v3 addObject:v18];

  id v19 = [NSString alloc];
  char v20 = [(ATXFaceGallerySection *)self unityDescription];
  id v21 = (void *)[v19 initWithFormat:@"    unityDescription: %@", v20];
  [v3 addObject:v21];

  id v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"    type: %zd", -[ATXFaceGallerySection type](self, "type"));
  [v3 addObject:v22];

  [v3 addObject:@"    items:"];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  char v23 = [(ATXFaceGallerySection *)self items];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        char v28 = (void *)[[NSString alloc] initWithFormat:@"        %@", *(void *)(*((void *)&v34 + 1) + 8 * i)];
        [v3 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v25);
  }

  uint64_t v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"semanticType: %zd", -[ATXFaceGallerySection semanticType](self, "semanticType"));
  [v3 addObject:v29];

  id v30 = [NSString alloc];
  uint64_t v31 = [v3 componentsJoinedByString:@"\n"];
  char v32 = (void *)[v30 initWithFormat:@"ATXFaceGallerySection:\n%@", v31];

  return (NSString *)v32;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(ATXFaceGallerySection *)self localizedTitle];
  [v11 encodeObject:v4 forKey:@"localizedTitle"];

  uint64_t v5 = [(ATXFaceGallerySection *)self localizedSubtitle];
  [v11 encodeObject:v5 forKey:@"localizedSubtitle"];

  uint64_t v6 = [(ATXFaceGallerySection *)self symbolImageName];
  [v11 encodeObject:v6 forKey:@"symbolImageName"];

  id v7 = [(ATXFaceGallerySection *)self symbolColorName];
  [v11 encodeObject:v7 forKey:@"symbolColorName"];

  char v8 = [(ATXFaceGallerySection *)self localizedDescriptiveText];
  [v11 encodeObject:v8 forKey:@"localizedDescriptiveText"];

  uint64_t v9 = [(ATXFaceGallerySection *)self unityDescription];
  [v11 encodeObject:v9 forKey:@"unityDescription"];

  objc_msgSend(v11, "encodeInteger:forKey:", -[ATXFaceGallerySection type](self, "type"), @"type");
  id v10 = [(ATXFaceGallerySection *)self items];
  [v11 encodeObject:v10 forKey:@"items"];

  objc_msgSend(v11, "encodeInteger:forKey:", -[ATXFaceGallerySection semanticType](self, "semanticType"), @"semanticType");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(ATXFaceGallerySection *)self localizedTitle];
  uint64_t v6 = [(ATXFaceGallerySection *)self symbolImageName];
  id v7 = [(ATXFaceGallerySection *)self symbolColorName];
  char v8 = [(ATXFaceGallerySection *)self localizedSubtitle];
  uint64_t v9 = [(ATXFaceGallerySection *)self localizedDescriptiveText];
  id v10 = [(ATXFaceGallerySection *)self unityDescription];
  int64_t v11 = [(ATXFaceGallerySection *)self type];
  v12 = [(ATXFaceGallerySection *)self items];
  id v13 = objc_msgSend(v4, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v5, v6, v7, v8, v9, v10, v11, v12, -[ATXFaceGallerySection semanticType](self, "semanticType"));

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXFaceGallerySection *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      localizedTitle = self->_localizedTitle;
      id v7 = (NSString *)v5[1];
      if (localizedTitle == v7)
      {
      }
      else
      {
        char v8 = v7;
        uint64_t v9 = localizedTitle;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_16;
        }
      }
      unityDescription = self->_unityDescription;
      id v13 = (NSString *)v5[6];
      if (unityDescription == v13)
      {
      }
      else
      {
        char v14 = v13;
        v15 = unityDescription;
        char v16 = [(NSString *)v15 isEqual:v14];

        if ((v16 & 1) == 0) {
          goto LABEL_16;
        }
      }
      int64_t type = self->_type;
      if (type == [v5 type])
      {
        items = self->_items;
        id v19 = (NSArray *)v5[8];
        if (items == v19)
        {
        }
        else
        {
          char v20 = v19;
          id v21 = items;
          char v22 = [(NSArray *)v21 isEqual:v20];

          if ((v22 & 1) == 0) {
            goto LABEL_16;
          }
        }
        int64_t semanticType = self->_semanticType;
        BOOL v11 = semanticType == [v5 semanticType];
        goto LABEL_17;
      }
LABEL_16:
      BOOL v11 = 0;
LABEL_17:

      goto LABEL_18;
    }
    BOOL v11 = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_localizedTitle hash];
  NSUInteger v4 = [(NSString *)self->_unityDescription hash];
  int64_t v5 = self->_type - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  uint64_t v6 = [(NSArray *)self->_items hash];
  return self->_semanticType - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (NSDictionary)jsonDictionary
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19[0] = @"type";
  int64_t v3 = [(ATXFaceGallerySection *)self type];
  if (v3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
    NSUInteger v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSUInteger v4 = off_1E5D08988[(int)v3];
  }
  v20[0] = v4;
  v19[1] = @"items";
  id v5 = [(ATXFaceGallerySection *)self items];
  uint64_t v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_85);
  v20[1] = v6;
  v19[2] = @"semanticType";
  int64_t v7 = [(ATXFaceGallerySection *)self semanticType];
  if (v7 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    char v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v8 = off_1E5D089A8[(int)v7];
  }
  v20[2] = v8;
  v19[3] = @"localizedTitle";
  uint64_t v9 = [(ATXFaceGallerySection *)self localizedTitle];
  char v10 = v9;
  if (!v9)
  {
    char v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[3] = v10;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  v12 = (void *)[v11 mutableCopy];

  if (!v9) {
  id v13 = [(ATXFaceGallerySection *)self localizedSubtitle];
  }
  [v12 setObject:v13 forKeyedSubscript:@"localizedSubtitle"];

  char v14 = [(ATXFaceGallerySection *)self localizedDescriptiveText];
  [v12 setObject:v14 forKeyedSubscript:@"localizedDescriptiveText"];

  v15 = [(ATXFaceGallerySection *)self symbolImageName];
  [v12 setObject:v15 forKeyedSubscript:@"symbolImageName"];

  char v16 = [(ATXFaceGallerySection *)self symbolColorName];
  [v12 setObject:v16 forKeyedSubscript:@"symbolColorName"];

  char v17 = (void *)[v12 copy];

  return (NSDictionary *)v17;
}

uint64_t __39__ATXFaceGallerySection_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonDictionary];
}

- (id)json
{
  id v2 = (void *)MEMORY[0x1E4F28D90];
  int64_t v3 = [(ATXFaceGallerySection *)self jsonDictionary];
  NSUInteger v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXFaceGallerySection)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBFaceGallerySection alloc] initWithData:v4];

    self = [(ATXFaceGallerySection *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  id v2 = [(ATXFaceGallerySection *)self proto];
  int64_t v3 = [v2 data];

  return v3;
}

- (ATXFaceGallerySection)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_9:
    char v14 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v15);
    }

    goto LABEL_9;
  }
  id v5 = v4;
  uint64_t v6 = (int)[v5 type];
  int64_t v7 = [v5 items];
  uint64_t v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_91);
  uint64_t v9 = (void *)v8;
  char v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    char v10 = (void *)v8;
  }
  id v11 = v10;

  int v12 = [v5 semanticType];
  id v13 = [(ATXFaceGallerySection *)self initWithLocalizedTitle:&stru_1EFD9B408 symbolImageName:0 symbolColorName:0 localizedSubtitle:0 localizedDescriptiveText:0 unityDescription:0 type:v6 items:v11 semanticType:v12];

  self = v13;
  char v14 = self;
LABEL_10:

  return v14;
}

ATXFaceGalleryItem *__39__ATXFaceGallerySection_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [[ATXFaceGalleryItem alloc] initWithProto:v2];

  return v3;
}

- (id)proto
{
  int64_t v3 = objc_opt_new();
  objc_msgSend(v3, "setType:", -[ATXFaceGallerySection type](self, "type"));
  id v4 = [(ATXFaceGallerySection *)self items];
  id v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_94_0);
  uint64_t v6 = (void *)[v5 mutableCopy];
  [v3 setItems:v6];

  objc_msgSend(v3, "setSemanticType:", -[ATXFaceGallerySection semanticType](self, "semanticType"));

  return v3;
}

uint64_t __30__ATXFaceGallerySection_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
}

- (NSString)symbolColorName
{
  return self->_symbolColorName;
}

- (void)setSymbolColorName:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (NSString)localizedDescriptiveText
{
  return self->_localizedDescriptiveText;
}

- (void)setLocalizedDescriptiveText:(id)a3
{
}

- (NSString)unityDescription
{
  return self->_unityDescription;
}

- (void)setUnityDescription:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void)setItems:(id)a3
{
}

- (int64_t)semanticType
{
  return self->_semanticType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_unityDescription, 0);
  objc_storeStrong((id *)&self->_localizedDescriptiveText, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_symbolColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Unable to decode items", v1, 2u);
}

@end