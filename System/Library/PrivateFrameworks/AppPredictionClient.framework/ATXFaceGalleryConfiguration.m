@interface ATXFaceGalleryConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationFromJSONDictionary:(id)a3;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXFaceGalleryConfiguration)initWithCoder:(id)a3;
- (ATXFaceGalleryConfiguration)initWithProto:(id)a3;
- (ATXFaceGalleryConfiguration)initWithProtoData:(id)a3;
- (ATXFaceGalleryConfiguration)initWithSections:(id)a3;
- (ATXFaceGalleryConfiguration)initWithSections:(id)a3 source:(int64_t)a4 locale:(id)a5;
- (ATXFaceGalleryConfiguration)initWithSections:(id)a3 source:(int64_t)a4 locale:(id)a5 dayZero:(BOOL)a6;
- (BOOL)isDayZero;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXFaceGalleryConfiguration:(id)a3;
- (NSArray)sections;
- (NSDictionary)jsonDictionary;
- (NSLocale)locale;
- (id)configurationByApplyingConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)json;
- (id)proto;
- (int64_t)source;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(id)a3;
- (void)setSections:(id)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation ATXFaceGalleryConfiguration

- (NSArray)sections
{
  return self->_sections;
}

- (ATXFaceGalleryConfiguration)initWithSections:(id)a3 source:(int64_t)a4 locale:(id)a5 dayZero:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXFaceGalleryConfiguration;
  v12 = [(ATXFaceGalleryConfiguration *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    sections = v12->_sections;
    v12->_sections = (NSArray *)v13;

    v12->_source = a4;
    objc_storeStrong((id *)&v12->_locale, a5);
    v12->_dayZero = a6;
  }

  return v12;
}

- (ATXFaceGalleryConfiguration)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v7 = [v5 setWithArray:v6];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"sections"];

  if (v8)
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    uint64_t v10 = [v9 integerValue];

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    self = -[ATXFaceGalleryConfiguration initWithSections:source:locale:dayZero:](self, "initWithSections:source:locale:dayZero:", v8, v10, v11, [v4 decodeBoolForKey:@"dayZero"]);
    v12 = self;
  }
  else
  {
    id v11 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceGalleryConfiguration initWithCoder:](v11);
    }
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFaceGalleryConfiguration)initWithSections:(id)a3
{
  return [(ATXFaceGalleryConfiguration *)self initWithSections:a3 source:0 locale:0];
}

- (ATXFaceGalleryConfiguration)initWithSections:(id)a3 source:(int64_t)a4 locale:(id)a5
{
  return [(ATXFaceGalleryConfiguration *)self initWithSections:a3 source:a4 locale:a5 dayZero:0];
}

+ (id)configurationFromJSONDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"sections"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 objectForKeyedSubscript:@"sections"];
    v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_62);

    v8 = [v3 objectForKeyedSubscript:@"source"];
    uint64_t v9 = [v8 integerValue];

    uint64_t v10 = [v3 objectForKeyedSubscript:@"dayZero"];
    uint64_t v11 = [v10 BOOLValue];

    v12 = [[ATXFaceGalleryConfiguration alloc] initWithSections:v7 source:v9 locale:0 dayZero:v11];
  }
  else
  {
    uint64_t v13 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ATXFaceGalleryConfiguration configurationFromJSONDictionary:](v13);
    }

    v12 = 0;
  }

  return v12;
}

id __63__ATXFaceGalleryConfiguration_configurationFromJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[ATXFaceGallerySection sectionFromJSONDictionary:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)configurationByApplyingConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[(ATXFaceGalleryConfiguration *)self copy];
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = [v4 sections];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ((unint64_t)[v11 semanticType] <= 0xD)
          {
            v12 = [v5 sections];
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __68__ATXFaceGalleryConfiguration_configurationByApplyingConfiguration___block_invoke;
            v16[3] = &unk_1E5D08608;
            v16[4] = v11;
            uint64_t v13 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v16);

            if (v13)
            {
              v14 = [v11 items];
              [v13 setItems:v14];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

BOOL __68__ATXFaceGalleryConfiguration_configurationByApplyingConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 semanticType];
  return v3 == [*(id *)(a1 + 32) semanticType];
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(ATXFaceGalleryConfiguration *)self sections];
  [v7 encodeObject:v4 forKey:@"sections"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXFaceGalleryConfiguration source](self, "source"));
  [v7 encodeObject:v5 forKey:@"source"];

  v6 = [(ATXFaceGalleryConfiguration *)self locale];
  [v7 encodeObject:v6 forKey:@"locale"];

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXFaceGalleryConfiguration isDayZero](self, "isDayZero"), @"dayZero");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ATXFaceGalleryConfiguration *)self sections];
  int64_t v6 = [(ATXFaceGalleryConfiguration *)self source];
  id v7 = [(ATXFaceGalleryConfiguration *)self locale];
  uint64_t v8 = objc_msgSend(v4, "initWithSections:source:locale:dayZero:", v5, v6, v7, -[ATXFaceGalleryConfiguration isDayZero](self, "isDayZero"));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXFaceGalleryConfiguration *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXFaceGalleryConfiguration *)self isEqualToATXFaceGalleryConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToATXFaceGalleryConfiguration:(id)a3
{
  id v4 = (id *)a3;
  sections = self->_sections;
  BOOL v6 = (NSArray *)v4[2];
  if (sections == v6)
  {
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = sections;
    char v9 = [(NSArray *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
  }
  if (self->_source == v4[3])
  {
    locale = self->_locale;
    uint64_t v11 = (NSLocale *)v4[4];
    if (locale == v11)
    {
    }
    else
    {
      v12 = v11;
      uint64_t v13 = locale;
      char v14 = [(NSLocale *)v13 isEqual:v12];

      if ((v14 & 1) == 0) {
        goto LABEL_8;
      }
    }
    BOOL v15 = self->_dayZero == *((unsigned __int8 *)v4 + 8);
    goto LABEL_11;
  }
LABEL_8:
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ATXFaceGalleryConfiguration *)self sections];
  uint64_t v4 = [v3 hash];

  int64_t v5 = [(ATXFaceGalleryConfiguration *)self source] - v4 + 32 * v4;
  BOOL v6 = [(ATXFaceGalleryConfiguration *)self locale];
  uint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return 31 * v7 + [(ATXFaceGalleryConfiguration *)self isDayZero];
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  BOOL v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (NSDictionary)jsonDictionary
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"sections";
  uint64_t v3 = [(ATXFaceGalleryConfiguration *)self sections];
  uint64_t v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_32);
  v11[0] = v4;
  v10[1] = @"source";
  int64_t v5 = [(ATXFaceGalleryConfiguration *)self source];
  if (v5)
  {
    if (v5 == 1)
    {
      BOOL v6 = @"Proactive";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v6 = @"Unknown";
  }
  v11[1] = v6;
  v10[2] = @"dayZero";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFaceGalleryConfiguration isDayZero](self, "isDayZero"));
  v11[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return (NSDictionary *)v8;
}

uint64_t __45__ATXFaceGalleryConfiguration_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonDictionary];
}

- (id)json
{
  id v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(ATXFaceGalleryConfiguration *)self jsonDictionary];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXFaceGalleryConfiguration)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = [[ATXPBFaceGalleryConfiguration alloc] initWithData:v4];

    self = [(ATXFaceGalleryConfiguration *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  id v2 = [(ATXFaceGalleryConfiguration *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (ATXFaceGalleryConfiguration)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v14 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v14);
    }

    goto LABEL_9;
  }
  id v5 = v4;
  BOOL v6 = -[ATXPBFaceGalleryConfiguration sections]((uint64_t)v5);
  uint64_t v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_37_0);
  uint64_t v8 = (void *)v7;
  char v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    char v9 = (void *)v7;
  }
  id v10 = v9;

  int v11 = -[ATXPBFaceGalleryConfiguration source]((uint64_t)v5);
  v12 = [(ATXFaceGalleryConfiguration *)self initWithSections:v10 source:v11 locale:0 dayZero:0];

  self = v12;
  uint64_t v13 = self;
LABEL_10:

  return v13;
}

ATXFaceGallerySection *__45__ATXFaceGalleryConfiguration_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ATXFaceGallerySection alloc] initWithProto:v2];

  return v3;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(ATXFaceGalleryConfiguration *)self sections];
  id v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_40_1);
  BOOL v6 = (void *)[v5 mutableCopy];
  -[ATXPBFaceGalleryConfiguration setSections:]((uint64_t)v3, v6);

  -[ATXPBFaceGalleryConfiguration setSource:]((uint64_t)v3, [(ATXFaceGalleryConfiguration *)self source]);

  return v3;
}

uint64_t __36__ATXFaceGalleryConfiguration_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (void)setSections:(id)a3
{
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (BOOL)isDayZero
{
  return self->_dayZero;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

+ (void)configurationFromJSONDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  id v2 = "+[ATXFaceGalleryConfiguration configurationFromJSONDictionary:]";
  __int16 v3 = 2112;
  id v4 = @"sections";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: missing key: %@", (uint8_t *)&v1, 0x16u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Unable to decode sections", v1, 2u);
}

@end