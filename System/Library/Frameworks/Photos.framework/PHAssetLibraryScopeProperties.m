@interface PHAssetLibraryScopeProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)assetIsInOnboardingPreviewState;
- (BOOL)assetIsInPhotosSuggestedPreviewState;
- (BOOL)assetIsPublishedToLibraryScope;
- (BOOL)assetManuallyAddedByUser;
- (BOOL)assetManuallyRejectedByUser;
- (BOOL)assetRejectedByCamera;
- (BOOL)assetRejectedByPhotosSuggester;
- (PHAssetLibraryScopeProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (int64_t)pl_shareState;
- (signed)suggestedByClientType;
- (void)setPl_shareState:(int64_t)a3;
@end

@implementation PHAssetLibraryScopeProperties

- (void)setPl_shareState:(int64_t)a3
{
  self->_pl_shareState = a3;
}

- (int64_t)pl_shareState
{
  return self->_pl_shareState;
}

- (BOOL)assetRejectedByPhotosSuggester
{
  return PLLibraryScopeAssetGetRejectedByPhotosSuggesterFromShareStateValue();
}

- (BOOL)assetRejectedByCamera
{
  return MEMORY[0x1F413F580](self->_pl_shareState, a2);
}

- (BOOL)assetManuallyRejectedByUser
{
  return PLLibraryScopeAssetGetUserManuallyRejectedStateFromShareStateValue();
}

- (BOOL)assetManuallyAddedByUser
{
  return MEMORY[0x1F413F598](self->_pl_shareState, a2);
}

- (BOOL)assetIsPublishedToLibraryScope
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._asset);
  if ([WeakRetained participatesInLibraryScope]) {
    char AddToSharedZoneStateFromShareStateValue = PLLibraryScopeAssetGetAddToSharedZoneStateFromShareStateValue();
  }
  else {
    char AddToSharedZoneStateFromShareStateValue = 0;
  }

  return AddToSharedZoneStateFromShareStateValue;
}

- (BOOL)assetIsInPhotosSuggestedPreviewState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._asset);
  BOOL v4 = ([WeakRetained participatesInLibraryScope] & 1) == 0
    && ![(PHAssetLibraryScopeProperties *)self assetManuallyRejectedByUser]
    && ([(PHAssetLibraryScopeProperties *)self suggestedByClientType] == 1
     || [(PHAssetLibraryScopeProperties *)self suggestedByClientType] == 4);

  return v4;
}

- (BOOL)assetIsInOnboardingPreviewState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._asset);
  BOOL v4 = [WeakRetained participatesInLibraryScope]
    && ![(PHAssetLibraryScopeProperties *)self assetManuallyRejectedByUser]
    && (PLLibraryScopeAssetGetAddToSharedZoneStateFromShareStateValue() & 1) == 0
    && [(PHAssetLibraryScopeProperties *)self suggestedByClientType] == 0;

  return v4;
}

- (signed)suggestedByClientType
{
  return PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue();
}

- (PHAssetLibraryScopeProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHAssetLibraryScopeProperties;
  v9 = [(PHAssetLibraryScopeProperties *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = [v7 objectForKeyedSubscript:@"libraryScopeShareState"];
    v10->_pl_shareState = [v11 integerValue];
  }
  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_67;

  return v2;
}

void __50__PHAssetLibraryScopeProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"libraryScopeShareState";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_67;
  propertiesToFetch_pl_once_object_67 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetLibraryScope";
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

@end