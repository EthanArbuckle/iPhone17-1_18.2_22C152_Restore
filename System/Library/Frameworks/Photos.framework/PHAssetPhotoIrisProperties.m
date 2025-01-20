@interface PHAssetPhotoIrisProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration;
- (PHAssetPhotoIrisProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (unsigned)photoIrisVisibilityState;
@end

@implementation PHAssetPhotoIrisProperties

- (unsigned)photoIrisVisibilityState
{
  return self->_photoIrisVisibilityState;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[1].var3 + 4);
  retstr->var3 = *(void *)&self[2].var2;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self->var3 + 4);
  retstr->var3 = *(void *)&self[1].var2;
  return self;
}

- (PHAssetPhotoIrisProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PHAssetPhotoIrisProperties;
  v10 = [(PHAssetPhotoIrisProperties *)&v27 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    int64_t v12 = [v9 videoCpDurationValue];
    BOOL v13 = !v5;
    if (v5) {
      v14 = @"additionalAttributes.videoCpDurationTimescale";
    }
    else {
      v14 = @"videoCpDurationTimescale";
    }
    if (v5) {
      v15 = @"additionalAttributes.videoCpDisplayValue";
    }
    else {
      v15 = @"videoCpDisplayValue";
    }
    if (v13) {
      v16 = @"videoCpDisplayTimescale";
    }
    else {
      v16 = @"additionalAttributes.videoCpDisplayTimescale";
    }
    v17 = [v8 objectForKeyedSubscript:v14];
    int32_t v18 = [v17 integerValue];

    v19 = [v8 objectForKeyedSubscript:v15];
    int64_t v20 = [v19 integerValue];

    v21 = [v8 objectForKeyedSubscript:v16];
    int32_t v22 = [v21 integerValue];

    CMTimeMake(&v26, v20, v22);
    long long v23 = *(_OWORD *)&v26.value;
    *(void *)&v11->_photoIrisStillDisplayTime.flags = v26.epoch;
    *(_OWORD *)(&v11->_photoIrisVisibilityState + 2) = v23;
    CMTimeMake(&v26, v12, v18);
    long long v24 = *(_OWORD *)&v26.value;
    *(void *)&v11->_photoIrisVideoDuration.flags = v26.epoch;
    *(_OWORD *)((char *)&v11->_photoIrisStillDisplayTime.epoch + 4) = v24;
    v11->_photoIrisVisibilityState = [v9 videoCpVisibilityState];
  }

  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_53;

  return v2;
}

void __47__PHAssetPhotoIrisProperties_propertiesToFetch__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"videoCpDurationTimescale";
  v3[1] = @"videoCpDisplayValue";
  v3[2] = @"videoCpDisplayTimescale";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_53;
  propertiesToFetch_pl_once_object_53 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetPhotoIris";
}

@end