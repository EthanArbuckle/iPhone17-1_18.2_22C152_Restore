@interface NLModelConfiguration
+ (BOOL)supportsSecureCoding;
+ (NSIndexSet)supportedRevisionsForType:(NLModelType)type;
+ (NSUInteger)currentRevisionForType:(NLModelType)type;
+ (id)defaultModelConfigurationForType:(int64_t)a3;
+ (id)defaultModelConfigurationForType:(int64_t)a3 options:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (NLLanguage)language;
- (NLModelConfiguration)initWithCoder:(id)a3;
- (NLModelConfiguration)initWithModelType:(int64_t)a3 options:(id)a4 error:(id *)a5;
- (NLModelType)type;
- (NSUInteger)revision;
- (id)embeddingData;
- (id)embeddingModel;
- (id)embeddingURL;
- (id)options;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NLModelConfiguration

- (NLModelConfiguration)initWithModelType:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = unsignedIntegerForKey(v8, @"Revision", 0);
  v10 = stringForKey(v8, @"Language", 0);
  if (v9)
  {
    v11 = +[NLModelConfiguration supportedRevisionsForType:a3];
    char v12 = [v11 containsIndex:v9];

    if ((v12 & 1) == 0)
    {
      if (a5)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v27[0] = @"The specified revision is not supported";
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
        *a5 = [v13 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:3 userInfo:v14];
      }
      v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
    uint64_t v9 = +[NLModelConfiguration currentRevisionForType:a3];
    v17 = [NSNumber numberWithUnsignedInteger:v9];
    [v16 setObject:v17 forKey:@"Revision"];

    id v8 = v16;
  }
  v25.receiver = self;
  v25.super_class = (Class)NLModelConfiguration;
  v18 = [(NLModelConfiguration *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    v18->_revision = v9;
    uint64_t v20 = [v10 copy];
    language = v19->_language;
    v19->_language = (NSString *)v20;

    uint64_t v22 = [v8 copy];
    options = v19->_options;
    v19->_options = (NSDictionary *)v22;
  }
  self = v19;
  v15 = self;
LABEL_10:

  return v15;
}

+ (id)defaultModelConfigurationForType:(int64_t)a3
{
  v3 = [[NLModelConfiguration alloc] initWithModelType:a3 options:0 error:0];

  return v3;
}

+ (id)defaultModelConfigurationForType:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [[NLModelConfiguration alloc] initWithModelType:a3 options:v7 error:a5];

  return v8;
}

- (unint64_t)hash
{
  NLModelType v3 = [(NLModelConfiguration *)self type];
  NSUInteger v4 = [(NLModelConfiguration *)self revision] ^ (v3 << 16);
  v5 = [(NLModelConfiguration *)self language];
  uint64_t v6 = [v5 hash];
  id v7 = [(NLModelConfiguration *)self options];
  unint64_t v8 = v4 ^ v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (NLModelConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  NLModelType v6 = [(NLModelConfiguration *)self type];
  if (v6 != [(NLModelConfiguration *)v5 type]) {
    goto LABEL_10;
  }
  NSUInteger v7 = [(NLModelConfiguration *)self revision];
  if (v7 != [(NLModelConfiguration *)v5 revision]) {
    goto LABEL_10;
  }
  unint64_t v8 = [(NLModelConfiguration *)self language];
  if (!v8)
  {
    v10 = [(NLModelConfiguration *)v5 language];

    if (!v10) {
      goto LABEL_12;
    }
LABEL_10:
    char v9 = 0;
    goto LABEL_11;
  }

LABEL_12:
  char v12 = [(NLModelConfiguration *)self language];
  v13 = [(NLModelConfiguration *)v5 language];
  if ([v12 isEqualToString:v13])
  {
    v14 = [(NLModelConfiguration *)self options];
    v15 = [(NLModelConfiguration *)v5 options];
    char v9 = [v14 isEqual:v15];
  }
  else
  {
    char v9 = 0;
  }

LABEL_11:
  return v9;
}

- (NLModelType)type
{
  return self->_type;
}

- (NSUInteger)revision
{
  return self->_revision;
}

- (NLLanguage)language
{
  return self->_language;
}

- (id)options
{
  return self->_options;
}

- (id)embeddingURL
{
  v2 = [(NSDictionary *)self->_options objectForKey:@"EmbeddingURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    NSUInteger v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
    goto LABEL_5;
  }
  NSUInteger v4 = 0;
LABEL_7:

  return v4;
}

- (id)embeddingModel
{
  v2 = [(NSDictionary *)self->_options objectForKey:@"EmbeddingModel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)embeddingData
{
  v2 = [(NSDictionary *)self->_options objectForKey:@"EmbeddingData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLModelConfiguration requires keyed coding" userInfo:0];
    objc_exception_throw(v5);
  }
  objc_msgSend(v6, "encodeInteger:forKey:", -[NLModelConfiguration type](self, "type"), @"NLModelType");
  NSUInteger v4 = [(NLModelConfiguration *)self options];
  [v6 encodeObject:v4 forKey:@"NLOptions"];
}

- (NLModelConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLModelConfiguration requires keyed coding" userInfo:0];
    objc_exception_throw(v9);
  }
  uint64_t v5 = [v4 decodeIntegerForKey:@"NLModelType"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NLOptions"];
  NSUInteger v7 = [(NLModelConfiguration *)self initWithModelType:v5 options:v6 error:0];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSIndexSet)supportedRevisionsForType:(NLModelType)type
{
  id v3 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v4 = [a1 currentRevisionForType:type];

  return (NSIndexSet *)[v3 indexSetWithIndex:v4];
}

+ (NSUInteger)currentRevisionForType:(NLModelType)type
{
  return (unint64_t)type < 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end