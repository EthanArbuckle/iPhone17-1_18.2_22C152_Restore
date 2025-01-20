@interface PHAssetPhotosOneUpProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)reverseLocationDataIsValid;
- (BOOL)shiftedLocationIsValid;
- (NSData)reverseLocationData;
- (NSString)addressString;
- (PHAssetPhotosOneUpProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (id)_locationInfo;
- (id)localizedGeoDescriptionIsHome:(BOOL *)a3;
- (id)placeNamesForLocalizedDetailedDescriptionIsHome:(BOOL *)a3;
- (signed)viewPresentation;
- (unint64_t)variationSuggestionStates;
@end

@implementation PHAssetPhotosOneUpProperties

- (void).cxx_destruct
{
}

- (signed)viewPresentation
{
  return self->_viewPresentation;
}

- (unint64_t)variationSuggestionStates
{
  return self->_variationSuggestionStates;
}

- (BOOL)shiftedLocationIsValid
{
  return self->_shiftedLocationIsValid;
}

- (NSData)reverseLocationData
{
  return self->_reverseLocationData;
}

- (BOOL)reverseLocationDataIsValid
{
  return self->_reverseLocationDataIsValid;
}

- (id)placeNamesForLocalizedDetailedDescriptionIsHome:(BOOL *)a3
{
  v4 = [(PHAssetPhotosOneUpProperties *)self _locationInfo];
  v5 = v4;
  if (v4)
  {
    if (a3) {
      *a3 = [v4 isHome];
    }
    v6 = [v5 placeNamesForLocalizedDetailedDescription];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)localizedGeoDescriptionIsHome:(BOOL *)a3
{
  v4 = [(PHAssetPhotosOneUpProperties *)self _locationInfo];
  v5 = v4;
  if (v4)
  {
    if (a3) {
      *a3 = [v4 isHome];
    }
    v6 = [v5 localizedDescription];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_locationInfo
{
  if (self->_reverseLocationDataIsValid)
  {
    v2 = [(PHAssetPhotosOneUpProperties *)self reverseLocationData];
    v3 = [MEMORY[0x1E4F8AB70] infoFromPlistData:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)addressString
{
  v2 = [(PHAssetPhotosOneUpProperties *)self _locationInfo];
  v3 = [v2 addressString];

  return (NSString *)v3;
}

- (PHAssetPhotosOneUpProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PHAssetPhotosOneUpProperties;
  v10 = [(PHAssetPhotosOneUpProperties *)&v24 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.reverseLocationDataIsValid";
    }
    else {
      v12 = @"reverseLocationDataIsValid";
    }
    if (v5) {
      v13 = @"additionalAttributes.reverseLocationData";
    }
    else {
      v13 = @"reverseLocationData";
    }
    if (v5) {
      v14 = @"additionalAttributes.shiftedLocationIsValid";
    }
    else {
      v14 = @"shiftedLocationIsValid";
    }
    if (v5) {
      v15 = @"additionalAttributes.variationSuggestionStates";
    }
    else {
      v15 = @"variationSuggestionStates";
    }
    if (v5) {
      v16 = @"additionalAttributes.viewPresentation";
    }
    else {
      v16 = @"viewPresentation";
    }
    v17 = [v8 objectForKeyedSubscript:v12];
    v11->_reverseLocationDataIsValid = [v17 BOOLValue];

    uint64_t v18 = [v8 objectForKeyedSubscript:v13];
    reverseLocationData = v11->_reverseLocationData;
    v11->_reverseLocationData = (NSData *)v18;

    v20 = [v8 objectForKeyedSubscript:v14];
    v11->_shiftedLocationIsValid = [v20 BOOLValue];

    v21 = [v8 objectForKeyedSubscript:v15];
    v11->_variationSuggestionStates = [v21 unsignedLongLongValue];

    v22 = [v8 objectForKeyedSubscript:v16];
    v11->_viewPresentation = [v22 unsignedLongLongValue];

    if (v11->_viewPresentation >= 2) {
      v11->_viewPresentation = 0;
    }
  }

  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_42;

  return v2;
}

void __49__PHAssetPhotosOneUpProperties_propertiesToFetch__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = @"reverseLocationData";
  v3[1] = @"reverseLocationDataIsValid";
  v3[2] = @"variationSuggestionStates";
  v3[3] = @"shiftedLocationIsValid";
  v3[4] = @"viewPresentation";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_42;
  propertiesToFetch_pl_once_object_42 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetPhotosOneUp";
}

@end