@interface PAMediaConversionServiceDefaultImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithLossyCompressionQuality:(float)a3;
+ (id)standardPolicy;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)init;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithCoder:(id)a3;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithLossyCompressionQuality:(float)a3;
- (float)lossyCompressionQuality;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLossyCompressionQuality:(float)a3;
@end

@implementation PAMediaConversionServiceDefaultImageMetadataPolicy

- (void)setLossyCompressionQuality:(float)a3
{
  self->_lossyCompressionQuality = a3;
}

- (float)lossyCompressionQuality
{
  return self->_lossyCompressionQuality;
}

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  [(PAMediaConversionServiceDefaultImageMetadataPolicy *)self lossyCompressionQuality];
  v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v6 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v5, kCGImageDestinationLossyCompressionQuality, 0);

  v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", kCGImagePropertyExifDictionary, kCGImagePropertyExifAuxDictionary, kCGImagePropertyGPSDictionary, kCGImagePropertyMakerCanonDictionary, kCGImagePropertyMakerCanonDictionary, kCGImagePropertyMakerNikonDictionary, kCGImagePropertyMakerMinoltaDictionary, kCGImagePropertyMakerFujiDictionary, kCGImagePropertyMakerOlympusDictionary, kCGImagePropertyMakerPentaxDictionary, 0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v13 = [v4 objectForKey:v12];
        if (v13) {
          [v6 setObject:v13 forKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }
  v14 = [v4 objectForKey:kCGImagePropertyIPTCDictionary];
  if (v14)
  {
    v15 = v14;
    id v16 = [v14 mutableCopy];

    [v16 removeObjectForKey:kCGImagePropertyIPTCImageOrientation];
    [v6 setObject:v16 forKey:kCGImagePropertyIPTCDictionary];
  }
  v17 = [v4 objectForKey:kCGImagePropertyTIFFDictionary];
  if (v17)
  {
    v18 = v17;
    id v19 = [v17 mutableCopy];

    [v19 removeObjectForKey:kCGImagePropertyTIFFOrientation];
    [v6 setObject:v19 forKey:kCGImagePropertyTIFFDictionary];
  }
  else
  {
    id v19 = 0;
  }
  v20 = [v4 objectForKey:kCGImagePropertyMakerAppleDictionary];
  if (v20)
  {
    id v21 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];

    uint64_t v22 = AVAppleMakerNote_MeteorHeadroom;
    v23 = [v20 objectForKeyedSubscript:AVAppleMakerNote_MeteorHeadroom];
    [v21 setObject:v23 forKeyedSubscript:v22];

    uint64_t v24 = AVAppleMakerNote_MeteorPlusGainMap;
    v25 = [v20 objectForKeyedSubscript:AVAppleMakerNote_MeteorPlusGainMap];
    [v21 setObject:v25 forKeyedSubscript:v24];

    [v6 setObject:v21 forKey:kCGImagePropertyMakerAppleDictionary];
    id v19 = v21;
  }

  return v6;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(PAMediaConversionServiceDefaultImageMetadataPolicy *)self lossyCompressionQuality];
  objc_msgSend(v4, "encodeFloat:forKey:", @"lossyCompressionQuality");
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"lossyCompressionQuality"])
  {
    [v4 decodeFloatForKey:@"lossyCompressionQuality"];
    v5 = -[PAMediaConversionServiceDefaultImageMetadataPolicy initWithLossyCompressionQuality:](self, "initWithLossyCompressionQuality:");
  }
  else
  {
    v5 = [(PAMediaConversionServiceDefaultImageMetadataPolicy *)self init];
  }
  v6 = v5;

  return v6;
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithLossyCompressionQuality:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PAMediaConversionServiceDefaultImageMetadataPolicy;
  id v4 = [(PAMediaConversionServiceDefaultImageMetadataPolicy *)&v8 init];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = a3;
    [(PAMediaConversionServiceDefaultImageMetadataPolicy *)v4 setLossyCompressionQuality:v5];
  }
  return v6;
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)init
{
  LODWORD(v2) = 1062836634;
  return [(PAMediaConversionServiceDefaultImageMetadataPolicy *)self initWithLossyCompressionQuality:v2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithLossyCompressionQuality:(float)a3
{
  id v4 = objc_alloc((Class)a1);
  *(float *)&double v5 = a3;
  id v6 = [v4 initWithLossyCompressionQuality:v5];
  return v6;
}

+ (id)standardPolicy
{
  id v4 = objc_opt_class();
  if (([v4 isEqual:objc_opt_class()] & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    objc_super v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 82, @"Subclasses must override %@", v8 object file lineNumber description];
  }
  if (qword_10003CD20 != -1) {
    dispatch_once(&qword_10003CD20, &stru_100034EC8);
  }
  double v5 = (void *)qword_10003CD18;
  return v5;
}

@end