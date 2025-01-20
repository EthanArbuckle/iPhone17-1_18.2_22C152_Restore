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
  v5 = +[NSMutableDictionary dictionary];
  v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  v7 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];

  if (v7)
  {
    v8 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];
    v9 = +[PFSharingUtilities gpsDictionaryForLocation:v8];
  }
  else
  {
    v9 = +[NSNull null];
  }
  [v6 setObject:v9 forKeyedSubscript:kCGImagePropertyGPSDictionary];

  return v6;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:kCGImagePropertyGPSDictionary];
  v5 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];

  if (v5)
  {
    v6 = [(PAMediaConversionServiceSetLocationImageMetadataPolicy *)self location];
    v7 = +[PFSharingUtilities gpsDictionaryForLocation:v6];

    unsigned __int8 v8 = [v7 isEqualToDictionary:v4];
  }
  else
  {
    if (!v4)
    {
      char v9 = 0;
      goto LABEL_6;
    }
    v7 = +[NSNull null];
    unsigned __int8 v8 = [v4 isEqual:v7];
  }
  char v9 = v8 ^ 1;

LABEL_6:
  return v9;
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