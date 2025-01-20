@interface PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy
+ (id)standardPolicy;
- (id)processMetadata:(id)a3;
@end

@implementation PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)PFMetadata) initWithImageProperties:v4 contentType:0 timeZoneLookup:0];
  v6 = [v5 livePhotoPairingIdentifier];
  v13.receiver = self;
  v13.super_class = (Class)PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy;
  v7 = [(PAMediaConversionServiceDefaultImageMetadataPolicy *)&v13 processMetadata:v4];

  if (v6)
  {
    id v8 = [v7 mutableCopy];
    v9 = [v5 livePhotoPairingIdentifierMetadataKey];
    unsigned int v10 = +[PFMetadataUtilities addMakerApplePropertyWithKey:v9 value:v6 toProperties:v8];

    if (v10)
    {
      id v11 = v8;

      v7 = v11;
    }
  }
  return v7;
}

+ (id)standardPolicy
{
  id v4 = objc_opt_class();
  if (([v4 isEqual:objc_opt_class()] & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    id v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 297, @"Subclasses must override %@", v8 object file lineNumber description];
  }
  if (qword_10004A060 != -1) {
    dispatch_once(&qword_10004A060, &stru_100040E00);
  }
  id v5 = (void *)qword_10004A058;
  return v5;
}

@end