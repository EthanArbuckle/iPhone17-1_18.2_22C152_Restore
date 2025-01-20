@interface ATXFaceGalleryItem
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)itemFromJSONDictionary:(id)a3;
- (ATXComplication)subtitleComplication;
- (ATXFaceGalleryItem)initWithCoder:(id)a3;
- (ATXFaceGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 localizedDisplayName:(id)a6 modeSemanticType:(id)a7 titleFontName:(id)a8 titleColor:(id)a9 subtitleComplication:(id)a10 layoutType:(int64_t)a11 complications:(id)a12;
- (ATXFaceGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 localizedDisplayName:(id)a6 modeSemanticType:(id)a7 titleFontName:(id)a8 titleColor:(id)a9 subtitleComplication:(id)a10 layoutType:(int64_t)a11 complications:(id)a12 landscapeComplications:(id)a13;
- (ATXFaceGalleryItem)initWithProto:(id)a3;
- (ATXFaceGalleryItem)initWithProtoData:(id)a3;
- (BOOL)isBlankTemplate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXFaceGalleryItem:(id)a3;
- (BOOL)isPreferredForGallery;
- (BOOL)shouldShowAsShuffleStack;
- (BSColor)titleColor;
- (NSArray)complications;
- (NSArray)landscapeComplications;
- (NSDictionary)jsonDictionary;
- (NSNumber)modeSemanticType;
- (NSNumber)score;
- (NSString)description;
- (NSString)descriptiveTextLocalizationKey;
- (NSString)descriptorIdentifier;
- (NSString)displayNameLocalizationKey;
- (NSString)extensionBundleIdentifier;
- (NSString)identifier;
- (NSString)localizedDisplayName;
- (NSString)localizedSubtitle;
- (NSString)modeUUID;
- (NSString)spokenNameLocalizationKey;
- (NSString)titleFontName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)json;
- (id)proto;
- (int64_t)layoutType;
- (int64_t)source;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setBlankTemplate:(BOOL)a3;
- (void)setComplications:(id)a3;
- (void)setDescriptiveTextLocalizationKey:(id)a3;
- (void)setDescriptorIdentifier:(id)a3;
- (void)setDisplayNameLocalizationKey:(id)a3;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsPreferredForGallery:(BOOL)a3;
- (void)setLandscapeComplications:(id)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setModeSemanticType:(id)a3;
- (void)setModeUUID:(id)a3;
- (void)setScore:(id)a3;
- (void)setShouldShowAsShuffleStack:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setSpokenNameLocalizationKey:(id)a3;
- (void)setSubtitleComplication:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFontName:(id)a3;
@end

@implementation ATXFaceGalleryItem

- (BOOL)isBlankTemplate
{
  return self->_blankTemplate;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFaceGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 localizedDisplayName:(id)a6 modeSemanticType:(id)a7 titleFontName:(id)a8 titleColor:(id)a9 subtitleComplication:(id)a10 layoutType:(int64_t)a11 complications:(id)a12 landscapeComplications:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v51 = a5;
  id v20 = a6;
  id obj = a7;
  id v21 = a7;
  v22 = v20;
  id v50 = v21;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a12;
  id v27 = a13;
  v52.receiver = self;
  v52.super_class = (Class)ATXFaceGalleryItem;
  v28 = [(ATXFaceGalleryItem *)&v52 init];
  if (v28)
  {
    uint64_t v29 = [v18 copy];
    identifier = v28->_identifier;
    v28->_identifier = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    descriptorIdentifier = v28->_descriptorIdentifier;
    v28->_descriptorIdentifier = (NSString *)v31;

    uint64_t v33 = [v51 copy];
    extensionBundleIdentifier = v28->_extensionBundleIdentifier;
    v28->_extensionBundleIdentifier = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    localizedDisplayName = v28->_localizedDisplayName;
    v28->_localizedDisplayName = (NSString *)v35;

    objc_storeStrong((id *)&v28->_modeSemanticType, obj);
    uint64_t v37 = [v23 copy];
    titleFontName = v28->_titleFontName;
    v28->_titleFontName = (NSString *)v37;

    uint64_t v39 = [v24 copy];
    titleColor = v28->_titleColor;
    v28->_titleColor = (BSColor *)v39;

    uint64_t v41 = [v25 copy];
    subtitleComplication = v28->_subtitleComplication;
    v28->_subtitleComplication = (ATXComplication *)v41;

    v28->_layoutType = a11;
    uint64_t v43 = [v26 copy];
    complications = v28->_complications;
    v28->_complications = (NSArray *)v43;

    uint64_t v45 = [v27 copy];
    landscapeComplications = v28->_landscapeComplications;
    v28->_landscapeComplications = (NSArray *)v45;
  }
  return v28;
}

- (ATXFaceGalleryItem)initWithCoder:(id)a3
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptorIdentifier"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
      if (v7)
      {
        v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameLocalizationKey"];
        v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spokenNameLocalizationKey"];
        v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptiveTextLocalizationKey"];
        v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDisplayName"];
        v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSubtitle"];
        v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleFontName"];
        if (v62)
        {
          v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleColor"];
          if (v9)
          {
            uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeSemanticType"];
            v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeUUID"];
            v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitleComplication"];
            uint64_t v55 = [v4 decodeIntegerForKey:@"layoutType"];
            v10 = (void *)MEMORY[0x1E4F1CAD0];
            v68[0] = objc_opt_class();
            v68[1] = objc_opt_class();
            [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
            v11 = v60 = v8;
            v12 = [v10 setWithArray:v11];
            v58 = [v4 decodeObjectOfClasses:v12 forKey:@"complications"];

            v13 = (void *)MEMORY[0x1E4F1CAD0];
            v67[0] = objc_opt_class();
            v67[1] = objc_opt_class();
            v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
            v15 = [v13 setWithArray:v14];
            v56 = [v4 decodeObjectOfClasses:v15 forKey:@"landscapeComplications"];

            v8 = v60;
            self = [(ATXFaceGalleryItem *)self initWithIdentifier:v5 descriptorIdentifier:v6 extensionBundleIdentifier:v7 localizedDisplayName:v64 modeSemanticType:v59 titleFontName:v62 titleColor:v9 subtitleComplication:v57 layoutType:v55 complications:v58 landscapeComplications:v56];
            [(ATXFaceGalleryItem *)self setDisplayNameLocalizationKey:v60];
            [(ATXFaceGalleryItem *)self setSpokenNameLocalizationKey:v66];
            [(ATXFaceGalleryItem *)self setDescriptiveTextLocalizationKey:v65];
            [(ATXFaceGalleryItem *)self setLocalizedSubtitle:v63];
            v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
            [(ATXFaceGalleryItem *)self setScore:v16];

            v17 = v59;
            [(ATXFaceGalleryItem *)self setModeUUID:v61];
            -[ATXFaceGalleryItem setBlankTemplate:](self, "setBlankTemplate:", [v4 decodeBoolForKey:@"blankTemplate"]);
            -[ATXFaceGalleryItem setShouldShowAsShuffleStack:](self, "setShouldShowAsShuffleStack:", [v4 decodeBoolForKey:@"shouldShowAsShuffleStack"]);
            -[ATXFaceGalleryItem setSource:](self, "setSource:", [v4 decodeIntegerForKey:@"source"]);

            id v18 = self;
          }
          else
          {
            v17 = __atxlog_handle_lock_screen();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[ATXFaceGalleryItem initWithCoder:].cold.5(v17, v47, v48, v49, v50, v51, v52, v53);
            }
            id v18 = 0;
          }
        }
        else
        {
          v9 = __atxlog_handle_lock_screen();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[ATXFaceGalleryItem initWithCoder:].cold.4(v9, v40, v41, v42, v43, v44, v45, v46);
          }
          id v18 = 0;
        }
      }
      else
      {
        v8 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[ATXFaceGalleryItem initWithCoder:](v8, v33, v34, v35, v36, v37, v38, v39);
        }
        id v18 = 0;
      }
    }
    else
    {
      v7 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ATXFaceGalleryItem initWithCoder:](v7, v26, v27, v28, v29, v30, v31, v32);
      }
      id v18 = 0;
    }
  }
  else
  {
    v6 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceGalleryItem initWithCoder:](v6, v19, v20, v21, v22, v23, v24, v25);
    }
    id v18 = 0;
  }

  return v18;
}

- (void)setSpokenNameLocalizationKey:(id)a3
{
}

- (void)setShouldShowAsShuffleStack:(BOOL)a3
{
  self->_shouldShowAsShuffleStack = a3;
}

- (void)setScore:(id)a3
{
}

- (void)setModeUUID:(id)a3
{
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
}

- (void)setDescriptiveTextLocalizationKey:(id)a3
{
}

- (void)setBlankTemplate:(BOOL)a3
{
  self->_blankTemplate = a3;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (ATXFaceGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 localizedDisplayName:(id)a6 modeSemanticType:(id)a7 titleFontName:(id)a8 titleColor:(id)a9 subtitleComplication:(id)a10 layoutType:(int64_t)a11 complications:(id)a12
{
  return [(ATXFaceGalleryItem *)self initWithIdentifier:a3 descriptorIdentifier:a4 extensionBundleIdentifier:a5 localizedDisplayName:a6 modeSemanticType:a7 titleFontName:a8 titleColor:a9 subtitleComplication:a10 layoutType:a11 complications:a12 landscapeComplications:0];
}

+ (id)itemFromJSONDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];

  v6 = [v3 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v3 objectForKeyedSubscript:@"identifier"];

    v5 = (void *)v8;
  }
  v9 = [MEMORY[0x1E4F29128] UUID];
  v10 = [v9 UUIDString];

  v11 = [v3 objectForKeyedSubscript:@"descriptorIdentifier"];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if (v12)
  {
    uint64_t v13 = [v3 objectForKeyedSubscript:@"descriptorIdentifier"];

    v10 = (void *)v13;
  }
  v14 = [v3 objectForKeyedSubscript:@"extensionBundleIdentifier"];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    uint64_t v46 = [v3 objectForKeyedSubscript:@"extensionBundleIdentifier"];
    v16 = [v3 objectForKeyedSubscript:@"localizedDisplayName"];
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    if (v17)
    {
      id v18 = [v3 objectForKeyedSubscript:@"localizedDisplayName"];
    }
    else
    {
      id v18 = &stru_1EFD9B408;
    }
    uint64_t v21 = [v3 objectForKeyedSubscript:@"subtitleComplication"];
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass();

    if (v22)
    {
      uint64_t v23 = [v3 objectForKeyedSubscript:@"subtitleComplication"];
      uint64_t v24 = +[ATXComplication complicationFromDictionaryRepresentation:v23 error:0];
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v25 = [v3 objectForKeyedSubscript:@"complications"];
    objc_opt_class();
    char v26 = objc_opt_isKindOfClass();

    uint64_t v27 = MEMORY[0x1E4F1CBF0];
    uint64_t v28 = (void *)MEMORY[0x1E4F1CBF0];
    if (v26)
    {
      uint64_t v29 = [v3 objectForKeyedSubscript:@"complications"];
      uint64_t v28 = objc_msgSend(v29, "_pas_mappedArrayWithTransform:", &__block_literal_global_19);
    }
    uint64_t v30 = [v3 objectForKeyedSubscript:@"landscapeComplications"];
    objc_opt_class();
    char v31 = objc_opt_isKindOfClass();

    if (v31)
    {
      uint64_t v32 = [v3 objectForKeyedSubscript:@"landscapeComplications"];
      uint64_t v33 = objc_msgSend(v32, "_pas_mappedArrayWithTransform:", &__block_literal_global_79);

      uint64_t v28 = (void *)v33;
    }
    uint64_t v34 = [ATXFaceGalleryItem alloc];
    uint64_t v35 = objc_opt_new();
    uint64_t v20 = [(ATXFaceGalleryItem *)v34 initWithIdentifier:v5 descriptorIdentifier:v10 extensionBundleIdentifier:v46 localizedDisplayName:v18 modeSemanticType:0 titleFontName:&stru_1EFD9B408 titleColor:v35 subtitleComplication:v24 layoutType:0 complications:v28 landscapeComplications:v27];

    uint64_t v36 = [v3 objectForKeyedSubscript:@"blankTemplate"];
    objc_opt_class();
    char v37 = objc_opt_isKindOfClass();

    if (v37)
    {
      uint64_t v38 = [v3 objectForKeyedSubscript:@"blankTemplate"];
      -[ATXFaceGalleryItem setBlankTemplate:](v20, "setBlankTemplate:", [v38 BOOLValue]);
    }
    uint64_t v39 = [v3 objectForKeyedSubscript:@"shouldShowAsShuffleStack"];
    objc_opt_class();
    char v40 = objc_opt_isKindOfClass();

    if (v40)
    {
      uint64_t v41 = [v3 objectForKeyedSubscript:@"shouldShowAsShuffleStack"];
      -[ATXFaceGalleryItem setShouldShowAsShuffleStack:](v20, "setShouldShowAsShuffleStack:", [v41 BOOLValue]);
    }
    uint64_t v42 = [v3 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    char v43 = objc_opt_isKindOfClass();

    if (v43)
    {
      uint64_t v44 = [v3 objectForKeyedSubscript:@"source"];
      -[ATXFaceGalleryItem setSource:](v20, "setSource:", [v44 integerValue]);
    }
  }
  else
  {
    uint64_t v19 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[ATXFaceGalleryItem itemFromJSONDictionary:](v19);
    }

    uint64_t v20 = 0;
  }

  return v20;
}

id __45__ATXFaceGalleryItem_itemFromJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[ATXComplication complicationFromDictionaryRepresentation:v2 error:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __45__ATXFaceGalleryItem_itemFromJSONDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[ATXComplication complicationFromDictionaryRepresentation:v2 error:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSString)description
{
  id v20 = [NSString alloc];
  uint64_t v19 = [(ATXFaceGalleryItem *)self identifier];
  id v18 = [(ATXFaceGalleryItem *)self descriptorIdentifier];
  char v17 = [(ATXFaceGalleryItem *)self extensionBundleIdentifier];
  v16 = [(ATXFaceGalleryItem *)self displayNameLocalizationKey];
  id v3 = [(ATXFaceGalleryItem *)self localizedDisplayName];
  char v15 = [(ATXFaceGalleryItem *)self titleFontName];
  id v4 = [(ATXFaceGalleryItem *)self titleColor];
  v14 = [(ATXFaceGalleryItem *)self subtitleComplication];
  int64_t v13 = [(ATXFaceGalleryItem *)self layoutType];
  v5 = [(ATXFaceGalleryItem *)self complications];
  v6 = [(ATXFaceGalleryItem *)self landscapeComplications];
  v7 = [(ATXFaceGalleryItem *)self modeSemanticType];
  uint64_t v8 = [(ATXFaceGalleryItem *)self score];
  v9 = @"YES";
  if ([(ATXFaceGalleryItem *)self isBlankTemplate]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if (![(ATXFaceGalleryItem *)self shouldShowAsShuffleStack]) {
    v9 = @"NO";
  }
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXFaceGalleryItem source](self, "source"));
  uint64_t v21 = (void *)[v20 initWithFormat:@"identifier: %@, descriptorIdentifier: %@, extensionBundleIdentifier: %@, displayNameLocalizationKey: %@, localizedDisplayName: %@, titleFontName: %@, titleColor: %@, subtitleComplication: %@, layoutType: %d, complications: %@, landscapeComplications: %@, modeSemanticType: %@, score: %@, blankTemplate: %@, shouldShowAsShuffleStack: %@, source: %@", v19, v18, v17, v16, v3, v15, v4, v14, v13, v5, v6, v7, v8, v10, v9, v11];

  return (NSString *)v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  id v4 = [(ATXFaceGalleryItem *)self identifier];
  [v20 encodeObject:v4 forKey:@"identifier"];

  v5 = [(ATXFaceGalleryItem *)self descriptorIdentifier];
  [v20 encodeObject:v5 forKey:@"descriptorIdentifier"];

  v6 = [(ATXFaceGalleryItem *)self extensionBundleIdentifier];
  [v20 encodeObject:v6 forKey:@"extensionBundleIdentifier"];

  v7 = [(ATXFaceGalleryItem *)self localizedDisplayName];
  [v20 encodeObject:v7 forKey:@"localizedDisplayName"];

  uint64_t v8 = [(ATXFaceGalleryItem *)self displayNameLocalizationKey];
  [v20 encodeObject:v8 forKey:@"displayNameLocalizationKey"];

  v9 = [(ATXFaceGalleryItem *)self spokenNameLocalizationKey];
  [v20 encodeObject:v9 forKey:@"spokenNameLocalizationKey"];

  v10 = [(ATXFaceGalleryItem *)self descriptiveTextLocalizationKey];
  [v20 encodeObject:v10 forKey:@"descriptiveTextLocalizationKey"];

  v11 = [(ATXFaceGalleryItem *)self localizedSubtitle];
  [v20 encodeObject:v11 forKey:@"localizedSubtitle"];

  char v12 = [(ATXFaceGalleryItem *)self titleFontName];
  [v20 encodeObject:v12 forKey:@"titleFontName"];

  int64_t v13 = [(ATXFaceGalleryItem *)self titleColor];
  [v20 encodeObject:v13 forKey:@"titleColor"];

  v14 = [(ATXFaceGalleryItem *)self subtitleComplication];
  [v20 encodeObject:v14 forKey:@"subtitleComplication"];

  objc_msgSend(v20, "encodeInteger:forKey:", -[ATXFaceGalleryItem layoutType](self, "layoutType"), @"layoutType");
  char v15 = [(ATXFaceGalleryItem *)self complications];
  [v20 encodeObject:v15 forKey:@"complications"];

  v16 = [(ATXFaceGalleryItem *)self landscapeComplications];
  [v20 encodeObject:v16 forKey:@"landscapeComplications"];

  char v17 = [(ATXFaceGalleryItem *)self modeSemanticType];
  [v20 encodeObject:v17 forKey:@"modeSemanticType"];

  id v18 = [(ATXFaceGalleryItem *)self score];
  [v20 encodeObject:v18 forKey:@"score"];

  uint64_t v19 = [(ATXFaceGalleryItem *)self modeUUID];
  [v20 encodeObject:v19 forKey:@"modeUUID"];

  objc_msgSend(v20, "encodeBool:forKey:", -[ATXFaceGalleryItem isBlankTemplate](self, "isBlankTemplate"), @"blankTemplate");
  objc_msgSend(v20, "encodeBool:forKey:", -[ATXFaceGalleryItem shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"), @"shouldShowAsShuffleStack");
  objc_msgSend(v20, "encodeInteger:forKey:", -[ATXFaceGalleryItem source](self, "source"), @"source");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v21 = [(ATXFaceGalleryItem *)self identifier];
  uint64_t v19 = [(ATXFaceGalleryItem *)self descriptorIdentifier];
  char v22 = [(ATXFaceGalleryItem *)self extensionBundleIdentifier];
  id v20 = [(ATXFaceGalleryItem *)self localizedDisplayName];
  id v4 = [(ATXFaceGalleryItem *)self modeSemanticType];
  v5 = [(ATXFaceGalleryItem *)self titleFontName];
  v6 = [(ATXFaceGalleryItem *)self titleColor];
  v7 = [(ATXFaceGalleryItem *)self subtitleComplication];
  int64_t v8 = [(ATXFaceGalleryItem *)self layoutType];
  v9 = [(ATXFaceGalleryItem *)self complications];
  v10 = [(ATXFaceGalleryItem *)self landscapeComplications];
  v11 = (void *)[v23 initWithIdentifier:v21 descriptorIdentifier:v19 extensionBundleIdentifier:v22 localizedDisplayName:v20 modeSemanticType:v4 titleFontName:v5 titleColor:v6 subtitleComplication:v7 layoutType:v8 complications:v9 landscapeComplications:v10];

  char v12 = [(ATXFaceGalleryItem *)self displayNameLocalizationKey];
  [v11 setDisplayNameLocalizationKey:v12];

  int64_t v13 = [(ATXFaceGalleryItem *)self spokenNameLocalizationKey];
  [v11 setSpokenNameLocalizationKey:v13];

  v14 = [(ATXFaceGalleryItem *)self descriptiveTextLocalizationKey];
  [v11 setDescriptiveTextLocalizationKey:v14];

  char v15 = [(ATXFaceGalleryItem *)self localizedSubtitle];
  [v11 setLocalizedSubtitle:v15];

  v16 = [(ATXFaceGalleryItem *)self score];
  [v11 setScore:v16];

  char v17 = [(ATXFaceGalleryItem *)self modeUUID];
  [v11 setModeUUID:v17];

  objc_msgSend(v11, "setBlankTemplate:", -[ATXFaceGalleryItem isBlankTemplate](self, "isBlankTemplate"));
  objc_msgSend(v11, "setShouldShowAsShuffleStack:", -[ATXFaceGalleryItem shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"));
  objc_msgSend(v11, "setSource:", -[ATXFaceGalleryItem source](self, "source"));
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXFaceGalleryItem *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXFaceGalleryItem *)self isEqualToATXFaceGalleryItem:v5];

  return v6;
}

- (BOOL)isEqualToATXFaceGalleryItem:(id)a3
{
  id v4 = self->_identifier;
  v5 = v4;
  if (v4 == *((NSString **)a3 + 2)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSString isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (unint64_t)hash
{
  id v2 = [(ATXFaceGalleryItem *)self identifier];

  return (unint64_t)v2;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  char v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (NSDictionary)jsonDictionary
{
  v27[9] = *MEMORY[0x1E4F143B8];
  v26[0] = @"identifier";
  uint64_t v25 = [(ATXFaceGalleryItem *)self identifier];
  v27[0] = v25;
  v26[1] = @"descriptorIdentifier";
  uint64_t v24 = [(ATXFaceGalleryItem *)self descriptorIdentifier];
  v27[1] = v24;
  v26[2] = @"extensionBundleIdentifier";
  uint64_t v23 = [(ATXFaceGalleryItem *)self extensionBundleIdentifier];
  v27[2] = v23;
  v26[3] = @"localizedDisplayName";
  uint64_t v3 = [(ATXFaceGalleryItem *)self localizedDisplayName];
  id v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  id v20 = (void *)v3;
  v27[3] = v3;
  v26[4] = @"displayNameLocalizationKey";
  uint64_t v5 = [(ATXFaceGalleryItem *)self displayNameLocalizationKey];
  char v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = (void *)v5;
  v27[4] = v5;
  v26[5] = @"subtitleComplication";
  uint64_t v21 = [(ATXFaceGalleryItem *)self subtitleComplication];
  uint64_t v7 = [v21 dictionaryRepresentation];
  int64_t v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  char v22 = v4;
  v27[5] = v7;
  v26[6] = @"complications";
  v9 = [(ATXFaceGalleryItem *)self complications];
  v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_96_0);
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[6] = v11;
  v26[7] = @"landscapeComplications";
  char v12 = [(ATXFaceGalleryItem *)self landscapeComplications];
  int64_t v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_98);
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[7] = v14;
  v26[8] = @"source";
  char v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXFaceGalleryItem source](self, "source"));
  v27[8] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];

  if (!v13) {
  if (!v10)
  }

  if (!v8) {
  if (!v6)
  }

  if (!v22) {

  }
  return (NSDictionary *)v16;
}

uint64_t __36__ATXFaceGalleryItem_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __36__ATXFaceGalleryItem_jsonDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)json
{
  id v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(ATXFaceGalleryItem *)self jsonDictionary];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXFaceGalleryItem)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[ATXPBFaceGalleryItem alloc] initWithData:v4];

    self = [(ATXFaceGalleryItem *)self initWithProto:v5];
    char v6 = self;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  id v2 = [(ATXFaceGalleryItem *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (ATXFaceGalleryItem)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v11);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  char v6 = [v5 identifier];
  uint64_t v7 = [v5 descriptorIdentifier];
  int64_t v8 = [v5 extensionBundleIdentifier];

  v9 = [MEMORY[0x1E4F62800] blackColor];
  self = [(ATXFaceGalleryItem *)self initWithIdentifier:v6 descriptorIdentifier:v7 extensionBundleIdentifier:v8 localizedDisplayName:&stru_1EFD9B408 modeSemanticType:0 titleFontName:&stru_1EFD9B408 titleColor:v9 subtitleComplication:0 layoutType:0 complications:0 landscapeComplications:0];

  v10 = self;
LABEL_8:

  return v10;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(ATXFaceGalleryItem *)self identifier];
  [v3 setIdentifier:v4];

  id v5 = [(ATXFaceGalleryItem *)self descriptorIdentifier];
  [v3 setDescriptorIdentifier:v5];

  char v6 = [(ATXFaceGalleryItem *)self extensionBundleIdentifier];
  [v3 setExtensionBundleIdentifier:v6];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (void)setDescriptorIdentifier:(id)a3
{
}

- (void)setExtensionBundleIdentifier:(id)a3
{
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (NSString)spokenNameLocalizationKey
{
  return self->_spokenNameLocalizationKey;
}

- (NSString)descriptiveTextLocalizationKey
{
  return self->_descriptiveTextLocalizationKey;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (void)setTitleFontName:(id)a3
{
}

- (BSColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (ATXComplication)subtitleComplication
{
  return self->_subtitleComplication;
}

- (void)setSubtitleComplication:(id)a3
{
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (NSNumber)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (NSArray)complications
{
  return self->_complications;
}

- (void)setComplications:(id)a3
{
}

- (NSArray)landscapeComplications
{
  return self->_landscapeComplications;
}

- (void)setLandscapeComplications:(id)a3
{
}

- (BOOL)shouldShowAsShuffleStack
{
  return self->_shouldShowAsShuffleStack;
}

- (int64_t)source
{
  return self->_source;
}

- (NSNumber)score
{
  return self->_score;
}

- (BOOL)isPreferredForGallery
{
  return self->_isPreferredForGallery;
}

- (void)setIsPreferredForGallery:(BOOL)a3
{
  self->_isPreferredForGallery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_landscapeComplications, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
  objc_storeStrong((id *)&self->_subtitleComplication, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_descriptiveTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_spokenNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)itemFromJSONDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  id v2 = "+[ATXFaceGalleryItem itemFromJSONDictionary:]";
  __int16 v3 = 2112;
  id v4 = @"extensionBundleIdentifier";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: missing key: %@", (uint8_t *)&v1, 0x16u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end