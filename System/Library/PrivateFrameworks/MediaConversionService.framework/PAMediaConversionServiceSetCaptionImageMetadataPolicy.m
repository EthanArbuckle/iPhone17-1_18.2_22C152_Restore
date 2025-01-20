@interface PAMediaConversionServiceSetCaptionImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithCaption:(id)a3;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSString)caption;
- (PAMediaConversionServiceSetCaptionImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCaption:(id)a3;
@end

@implementation PAMediaConversionServiceSetCaptionImageMetadataPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithCaption:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCaption:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setCaption:(id)a3
{
}

- (NSString)caption
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  uint64_t v7 = *MEMORY[0x1E4F2FB80];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FB80]];
  v9 = (void *)[v8 mutableCopy];

  v10 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];

  if (v10)
  {
    if (!v9)
    {
      v9 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v11 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v12 = (void *)v11;
  [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2FB58]];

  [v6 setObject:v9 forKeyedSubscript:v7];
  return v6;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F2FB80]];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FB58]];
  v6 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];

  if (v6)
  {
    uint64_t v7 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];
    char v8 = [v7 isEqualToString:v5];
  }
  else
  {
    if (!v5)
    {
      char v9 = 0;
      goto LABEL_6;
    }
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    char v8 = [v5 isEqual:v7];
  }
  char v9 = v8 ^ 1;

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];
  [v4 encodeObject:v5 forKey:@"caption"];
}

- (PAMediaConversionServiceSetCaptionImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"caption"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caption"];
    [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self setCaption:v5];
  }
  return self;
}

@end