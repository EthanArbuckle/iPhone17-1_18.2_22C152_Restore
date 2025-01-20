@interface PHAssetCameraCaptureDeviceProperties
+ (id)keyPathFromPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)isSelfie;
- (PHAssetCameraCaptureDeviceProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetCameraCaptureDeviceProperties

- (BOOL)isSelfie
{
  return self->_isSelfie;
}

- (PHAssetCameraCaptureDeviceProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetCameraCaptureDeviceProperties;
  v8 = [(PHAssetCameraCaptureDeviceProperties *)&v14 init];
  if (v8)
  {
    if (v5) {
      v9 = @"additionalAttributes.cameraCaptureDevice";
    }
    else {
      v9 = @"cameraCaptureDevice";
    }
    v10 = [v7 objectForKeyedSubscript:v9];
    __int16 v11 = [v10 integerValue];

    if (v11)
    {
      BOOL v12 = v11;
      if (v11 != 1) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    v8->_isSelfie = v12;
  }
LABEL_10:

  return v8;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_47;

  return v2;
}

void __57__PHAssetCameraCaptureDeviceProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"cameraCaptureDevice";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_47;
  propertiesToFetch_pl_once_object_47 = v1;
}

+ (id)keyPathFromPrimaryObject
{
  return @"additionalAttributes";
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetCameraCaptureDevice";
}

@end