@interface PHAssetPhotosSmartStyleExtendedProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)isCurrentlySmartStyleable;
- (BOOL)originallySmartStyleable;
- (NSNumber)originalSmartStyleCast;
- (NSNumber)smartStyleColorBias;
- (NSNumber)smartStyleIntensity;
- (NSNumber)smartStyleRenderingVersion;
- (NSNumber)smartStyleToneBias;
- (PHAssetPhotosSmartStyleExtendedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (unsigned)smartStyleIsReversible;
@end

@implementation PHAssetPhotosSmartStyleExtendedProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSmartStyleCast, 0);
  objc_storeStrong((id *)&self->_smartStyleIntensity, 0);
  objc_storeStrong((id *)&self->_smartStyleColorBias, 0);
  objc_storeStrong((id *)&self->_smartStyleToneBias, 0);

  objc_storeStrong((id *)&self->_smartStyleRenderingVersion, 0);
}

- (unsigned)smartStyleIsReversible
{
  return self->_smartStyleIsReversible;
}

- (NSNumber)originalSmartStyleCast
{
  return self->_originalSmartStyleCast;
}

- (NSNumber)smartStyleIntensity
{
  return self->_smartStyleIntensity;
}

- (NSNumber)smartStyleColorBias
{
  return self->_smartStyleColorBias;
}

- (NSNumber)smartStyleToneBias
{
  return self->_smartStyleToneBias;
}

- (NSNumber)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (BOOL)originallySmartStyleable
{
  return [(PHAssetPhotosSmartStyleExtendedProperties *)self smartStyleIsReversible] == 1;
}

- (BOOL)isCurrentlySmartStyleable
{
  if ([(PHAssetPhotosSmartStyleExtendedProperties *)self smartStyleIsReversible] != 1) {
    return 0;
  }
  v3 = [(PHAssetPropertySet *)self asset];
  BOOL v4 = (int)[v3 currentSmartStyleCast] > 0;

  return v4;
}

- (PHAssetPhotosSmartStyleExtendedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    goto LABEL_8;
  }
  v28.receiver = self;
  v28.super_class = (Class)PHAssetPhotosSmartStyleExtendedProperties;
  v9 = [(PHAssetPhotosSmartStyleExtendedProperties *)&v28 init];
  self = v9;
  if (!v9) {
    goto LABEL_8;
  }
  objc_storeWeak((id *)&v9->super._asset, v8);
  v10 = [v7 objectForKeyedSubscript:@"extendedAttributes.sleetRenderingVersion"];
  smartStyleRenderingVersion = self->_smartStyleRenderingVersion;
  self->_smartStyleRenderingVersion = v10;

  v12 = self->_smartStyleRenderingVersion;
  v13 = [v7 objectForKeyedSubscript:@"extendedAttributes.sleetIntensity"];
  smartStyleIntensity = self->_smartStyleIntensity;
  self->_smartStyleIntensity = v13;

  v15 = self->_smartStyleIntensity;
  v16 = [v7 objectForKeyedSubscript:@"extendedAttributes.sleetToneBias"];
  smartStyleToneBias = self->_smartStyleToneBias;
  self->_smartStyleToneBias = v16;

  v18 = self->_smartStyleToneBias;
  v19 = [v7 objectForKeyedSubscript:@"extendedAttributes.sleetColorBias"];
  smartStyleColorBias = self->_smartStyleColorBias;
  self->_smartStyleColorBias = v19;

  v21 = self->_smartStyleColorBias;
  v22 = [v7 objectForKeyedSubscript:@"extendedAttributes.sleetCast"];
  originalSmartStyleCast = self->_originalSmartStyleCast;
  self->_originalSmartStyleCast = v22;

  v24 = self->_originalSmartStyleCast;
  v25 = [v7 objectForKeyedSubscript:@"additionalAttributes.sleetIsReversible"];
  self->_smartStyleIsReversible = [v25 intValue];

  if (v12 || v15 || v18 || v21 || v24)
  {
    self = self;
    v26 = self;
  }
  else
  {
LABEL_8:
    v26 = 0;
  }

  return v26;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_45;

  return v2;
}

void __62__PHAssetPhotosSmartStyleExtendedProperties_propertiesToFetch__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = @"extendedAttributes.sleetRenderingVersion";
  v3[1] = @"extendedAttributes.sleetIntensity";
  v3[2] = @"extendedAttributes.sleetToneBias";
  v3[3] = @"extendedAttributes.sleetColorBias";
  v3[4] = @"extendedAttributes.sleetCast";
  v3[5] = @"additionalAttributes.sleetIsReversible";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_45;
  propertiesToFetch_pl_once_object_45 = v1;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return 0;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetPhotosSmartStyleExtended";
}

@end