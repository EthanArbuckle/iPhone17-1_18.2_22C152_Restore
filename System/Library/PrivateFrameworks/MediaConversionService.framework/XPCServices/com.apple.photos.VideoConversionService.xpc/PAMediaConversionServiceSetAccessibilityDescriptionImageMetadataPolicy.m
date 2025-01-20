@interface PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithAccessibilityDescription:(id)a3;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSString)accessibilityDescription;
- (PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
@end

@implementation PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithAccessibilityDescription:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setAccessibilityDescription:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
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

  v9 = [(PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy *)self accessibilityDescription];

  if (v9)
  {
    if (!v8)
    {
      id v8 = +[NSMutableDictionary dictionary];
    }
    uint64_t v10 = [(PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy *)self accessibilityDescription];
  }
  else
  {
    uint64_t v10 = +[NSNull null];
  }
  v11 = (void *)v10;
  [v8 setObject:v10 forKeyedSubscript:kCGImagePropertyIPTCExtArtworkContentDescription];

  [v6 setObject:v8 forKeyedSubscript:kCGImagePropertyIPTCDictionary];
  return v6;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary];
  v5 = [v4 objectForKeyedSubscript:kCGImagePropertyIPTCExtArtworkContentDescription];
  v6 = [(PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy *)self accessibilityDescription];

  if (v6)
  {
    v7 = [(PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy *)self accessibilityDescription];
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
  id v5 = [(PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy *)self accessibilityDescription];
  [v4 encodeObject:v5 forKey:@"accessibilityDescription"];
}

- (PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"accessibilityDescription"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityDescription"];
    [(PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy *)self setAccessibilityDescription:v5];
  }
  return self;
}

@end