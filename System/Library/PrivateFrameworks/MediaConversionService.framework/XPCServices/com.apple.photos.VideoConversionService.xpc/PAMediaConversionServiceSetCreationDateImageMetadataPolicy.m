@interface PAMediaConversionServiceSetCreationDateImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithCreationDate:(id)a3 inTimeZone:(id)a4;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSDate)creationDate;
- (NSTimeZone)timeZone;
- (PAMediaConversionServiceSetCreationDateImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation PAMediaConversionServiceSetCreationDateImageMetadataPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithCreationDate:(id)a3 inTimeZone:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setCreationDate:v6];

  if (v5)
  {
    [v7 setTimeZone:v5];
  }
  else
  {
    v8 = +[NSTimeZone defaultTimeZone];
    [v7 setTimeZone:v8];
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)setTimeZone:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];

  if (v5)
  {
    id v6 = +[NSMutableDictionary dictionary];
    v7 = v6;
    if (v4) {
      [v6 addEntriesFromDictionary:v4];
    }
    id v8 = objc_alloc_init((Class)PFImageMetadataBuilder);
    v9 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];
    v10 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self timeZone];
    [v8 setCreationDate:v9 timeZone:v10];

    v19[0] = kCGImagePropertyExifDictionary;
    v11 = [v8 exifDictionary];
    v20[0] = v11;
    v19[1] = kCGImagePropertyTIFFDictionary;
    v12 = [v8 tiffDictionary];
    v20[1] = v12;
    v19[2] = kCGImagePropertyIPTCDictionary;
    v13 = [v8 iptcDictionary];
    v20[2] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006304;
    v17[3] = &unk_100040E28;
    id v15 = v7;
    id v18 = v15;
    [v14 enumerateKeysAndObjectsUsingBlock:v17];
  }
  else
  {
    id v15 = v4;
  }

  return v15;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];

  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:kCGImagePropertyExifDictionary];
    v7 = [v4 objectForKeyedSubscript:kCGImagePropertyTIFFDictionary];
    v24 = [v4 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary];
    id v8 = objc_alloc_init((Class)PFImageMetadataBuilder);
    v9 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];
    v10 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self timeZone];
    [v8 setCreationDate:v9 timeZone:v10];

    v11 = [v8 exifDictionary];
    v12 = [v8 tiffDictionary];
    v13 = [v8 iptcDictionary];
    v28[0] = kCGImagePropertyExifDateTimeOriginal;
    v28[1] = kCGImagePropertyExifSubsecTimeOriginal;
    v28[2] = kCGImagePropertyExifOffsetTimeOriginal;
    v28[3] = kCGImagePropertyExifDateTimeDigitized;
    v28[4] = kCGImagePropertyExifSubsecTimeDigitized;
    v28[5] = kCGImagePropertyExifOffsetTimeDigitized;
    v28[6] = kCGImagePropertyExifSubsecTime;
    v28[7] = kCGImagePropertyExifOffsetTime;
    v14 = +[NSArray arrayWithObjects:v28 count:8];
    v25 = v6;
    int v15 = sub_1000066C0(v6, v11, v14);

    if (v15)
    {
      CFStringRef v27 = kCGImagePropertyTIFFDateTime;
      char v16 = 1;
      v17 = +[NSArray arrayWithObjects:&v27 count:1];
      id v18 = v7;
      int v19 = sub_1000066C0(v7, v12, v17);

      v20 = v24;
      if (v19)
      {
        v26[0] = kCGImagePropertyIPTCDateCreated;
        v26[1] = kCGImagePropertyIPTCTimeCreated;
        v21 = +[NSArray arrayWithObjects:v26 count:2];
        char v22 = sub_1000066C0(v24, v13, v21);

        char v16 = v22 ^ 1;
      }
    }
    else
    {
      id v18 = v7;
      char v16 = 1;
      v20 = v24;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];
  [v4 encodeObject:v5 forKey:@"creationDate"];

  id v6 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self timeZone];
  [v4 encodeObject:v6 forKey:@"creationDateTimeZone"];
}

- (PAMediaConversionServiceSetCreationDateImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"creationDate"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDateTimeZone"];
    [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self setCreationDate:v5];
    [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self setTimeZone:v6];
  }
  return self;
}

@end