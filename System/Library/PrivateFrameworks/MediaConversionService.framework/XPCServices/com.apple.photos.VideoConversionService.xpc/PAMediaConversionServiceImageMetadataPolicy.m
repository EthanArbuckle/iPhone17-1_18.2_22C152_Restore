@interface PAMediaConversionServiceImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)standardPolicy;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (id)processMetadata:(id)a3;
@end

@implementation PAMediaConversionServiceImageMetadataPolicy

- (id)processMetadata:(id)a3
{
  return a3;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)standardPolicy
{
  v4 = objc_opt_class();
  if (([v4 isEqual:objc_opt_class()] & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 33, @"Subclasses must override %@", v8 object file lineNumber description];
  }
  if (qword_10004A040 != -1) {
    dispatch_once(&qword_10004A040, &stru_100040DC0);
  }
  v5 = (void *)qword_10004A038;
  return v5;
}

@end