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
  v5 = +[NSMutableDictionary dictionary];
  v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  v7 = [v6 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary];
  id v8 = [v7 mutableCopy];

  v9 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];

  if (v9)
  {
    if (!v8)
    {
      id v8 = +[NSMutableDictionary dictionary];
    }
    uint64_t v10 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];
  }
  else
  {
    uint64_t v10 = +[NSNull null];
  }
  v11 = (void *)v10;
  [v8 setObject:v10 forKeyedSubscript:kCGImagePropertyIPTCCaptionAbstract];

  [v6 setObject:v8 forKeyedSubscript:kCGImagePropertyIPTCDictionary];
  return v6;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary];
  v5 = [v4 objectForKeyedSubscript:kCGImagePropertyIPTCCaptionAbstract];
  v6 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];

  if (v6)
  {
    v7 = [(PAMediaConversionServiceSetCaptionImageMetadataPolicy *)self caption];
    unsigned __int8 v8 = [v7 isEqualToString:v5];
  }
  else
  {
    if (!v5)
    {
      char v9 = 0;
      goto LABEL_6;
    }
    v7 = +[NSNull null];
    unsigned __int8 v8 = [v5 isEqual:v7];
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