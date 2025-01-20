@interface PAMediaConversionServiceSetLocationImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithLocation:(id)a3;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (CLLocation)location;
- (PAMediaConversionServiceSetLocationImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation PAMediaConversionServiceSetLocationImageMetadataPolicy

- (void).cxx_destruct
{
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  v7 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F8CD88];
    v9 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];
    v10 = [v8 gpsDictionaryForLocation:v9];
  }
  else
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F2FA18]];

  return v6;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA18]];
  v5 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F8CD88];
    v7 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];
    v8 = [v6 gpsDictionaryForLocation:v7];

    char v9 = [v8 isEqualToDictionary:v4];
  }
  else
  {
    if (!v4)
    {
      char v10 = 0;
      goto LABEL_6;
    }
    v8 = [MEMORY[0x1E4F1CA98] null];
    char v9 = [v4 isEqual:v8];
  }
  char v10 = v9 ^ 1;

LABEL_6:
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];
  [v4 encodeObject:v5 forKey:@"location"];
}

- (PAMediaConversionServiceSetLocationImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"location"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self setLocation:v5];
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithLocation:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setLocation:v3];

  return v4;
}

@end