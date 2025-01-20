@interface PHFetchOptions
+ (PHFetchOptions)fetchOptionsWithInclusiveDefaults;
+ (PHFetchOptions)fetchOptionsWithInclusiveDefaultsForPhotoLibrary:(id)a3;
+ (PHFetchOptions)fetchOptionsWithPhotoLibrary:(id)a3 orObject:(id)a4;
+ (id)defaultDetectionTypes;
+ (id)effectivePhotoLibraryForFetchOptions:(id)a3 object:(id)a4;
+ (id)fetchOptionsCopyFromNullableFetchOptions:(id)a3 photoLibrary:(id)a4;
+ (int64_t)defaultMediaAnalysisProcessingRangeTypes;
- (BOOL)excludeDuplicateAssetVisibilityStateHidden;
- (BOOL)excludeMontageAssets;
- (BOOL)excludeNonVisibleStackedAssets;
- (BOOL)excludeScreenshotAssets;
- (BOOL)hasAnySortDescriptors;
- (BOOL)includeActionCamVideoSmartAlbum;
- (BOOL)includeAllBurstAssets;
- (BOOL)includeAllPhotosSmartAlbum;
- (BOOL)includeBothPrivateAssetsAndSharedContentContributedByCurrentUser;
- (BOOL)includeDuplicateAssetVisibilityStateMostRelevant;
- (BOOL)includeDuplicateAssets;
- (BOOL)includeDuplicatesAlbums;
- (BOOL)includeExitingShares;
- (BOOL)includeExpiredShares;
- (BOOL)includeFavoriteMemoriesCollectionList;
- (BOOL)includeGuestAssets;
- (BOOL)includeHiddenAssets;
- (BOOL)includeLocalMemories;
- (BOOL)includeNonvisibleFaces;
- (BOOL)includeOnlyAssetsAllowedForAnalysis;
- (BOOL)includeOnlyContentContributedByCurrentUser;
- (BOOL)includeOnlyFacesInFaceGroups;
- (BOOL)includeOnlyFacesNeedingFaceCrop;
- (BOOL)includeOnlyFacesWithFaceprints;
- (BOOL)includeOnlyPersonsWithVisibleKeyFaces;
- (BOOL)includeOnlyTorsoDetectionData;
- (BOOL)includePendingMemories;
- (BOOL)includePlaceholderAssets;
- (BOOL)includePlacesSmartAlbum;
- (BOOL)includeProResSmartAlbum;
- (BOOL)includeRecentlyEditedSmartAlbum;
- (BOOL)includeRejectedMemories;
- (BOOL)includeRootFolder;
- (BOOL)includeScreenRecordingsSmartAlbum;
- (BOOL)includeSharedLibrarySharingSuggestionsSmartAlbum;
- (BOOL)includeSourceMemories;
- (BOOL)includeStoryMemories;
- (BOOL)includeTorsoAndFaceDetectionData;
- (BOOL)includeTorsoOnlyPerson;
- (BOOL)includeTrashBinAlbum;
- (BOOL)includeTrashedAssets;
- (BOOL)includeTrashedShares;
- (BOOL)includeUserSmartAlbums;
- (BOOL)isExclusivePredicate;
- (BOOL)reverseDefaultSortDescriptors;
- (BOOL)reverseSortOrder;
- (BOOL)shouldPrefetchCount;
- (BOOL)suppressSlowFetchReports;
- (BOOL)useNoIndexOnSharingFilter;
- (BOOL)wantsIncrementalChangeDetails;
- (NSArray)customObjectIDSortOrder;
- (NSArray)fetchPropertySets;
- (NSArray)includedDetectionTypes;
- (NSArray)internalSortDescriptors;
- (NSArray)sortDescriptors;
- (NSDictionary)internalLoggingDescriptionDictionary;
- (NSPredicate)internalInclusionPredicate;
- (NSPredicate)internalPredicate;
- (NSPredicate)predicate;
- (NSSet)fetchPropertySetsAsSet;
- (NSSet)verifiedPersonTypes;
- (NSString)importantFetchName;
- (NSString)relatedEntityName;
- (NSString)relatedRelationshipProperty;
- (NSString)shortDescription;
- (NSString)transientIdentifier;
- (NSUInteger)fetchLimit;
- (PHAssetSourceType)includeAssetSourceTypes;
- (PHFetchOptions)init;
- (PHPhotoLibrary)photoLibrary;
- (PHQueryChangeDetectionCriteria)changeDetectionCriteria;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cacheSizeForFetch;
- (int64_t)chunkSizeForFetch;
- (int64_t)curationType;
- (int64_t)includeMediaAnalysisProcessingRangeTypes;
- (int64_t)personContext;
- (int64_t)socialGroupContext;
- (unint64_t)fetchOffset;
- (unint64_t)minimumUnverifiedFaceCount;
- (unint64_t)minimumVerifiedFaceCount;
- (unint64_t)sharingStream;
- (unsigned)highlightCurationType;
- (unsigned)sharingFilter;
- (void)addFetchPropertySets:(id)a3;
- (void)mergeWithFetchOptions:(id)a3;
- (void)setCacheSizeForFetch:(int64_t)a3;
- (void)setChangeDetectionCriteria:(id)a3;
- (void)setChunkSizeForFetch:(int64_t)a3;
- (void)setCurationType:(int64_t)a3;
- (void)setCustomObjectIDSortOrder:(id)a3;
- (void)setExcludeDuplicateAssetVisibilityStateHidden:(BOOL)a3;
- (void)setExcludeMontageAssets:(BOOL)a3;
- (void)setExcludeNonVisibleStackedAssets:(BOOL)a3;
- (void)setExcludeScreenshotAssets:(BOOL)a3;
- (void)setFetchLimit:(NSUInteger)fetchLimit;
- (void)setFetchOffset:(unint64_t)a3;
- (void)setFetchPropertySets:(id)a3;
- (void)setHighlightCurationType:(unsigned __int16)a3;
- (void)setImportantFetchName:(id)a3;
- (void)setIncludeActionCamVideoSmartAlbum:(BOOL)a3;
- (void)setIncludeAllBurstAssets:(BOOL)includeAllBurstAssets;
- (void)setIncludeAllPhotosSmartAlbum:(BOOL)a3;
- (void)setIncludeAssetSourceTypes:(PHAssetSourceType)includeAssetSourceTypes;
- (void)setIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser:(BOOL)a3;
- (void)setIncludeDuplicateAssetVisibilityStateMostRelevant:(BOOL)a3;
- (void)setIncludeDuplicateAssets:(BOOL)a3;
- (void)setIncludeDuplicatesAlbums:(BOOL)a3;
- (void)setIncludeExitingShares:(BOOL)a3;
- (void)setIncludeExpiredShares:(BOOL)a3;
- (void)setIncludeFavoriteMemoriesCollectionList:(BOOL)a3;
- (void)setIncludeGuestAssets:(BOOL)a3;
- (void)setIncludeHiddenAssets:(BOOL)includeHiddenAssets;
- (void)setIncludeLocalMemories:(BOOL)a3;
- (void)setIncludeMediaAnalysisProcessingRangeTypes:(int64_t)a3;
- (void)setIncludeNonvisibleFaces:(BOOL)a3;
- (void)setIncludeOnlyAssetsAllowedForAnalysis:(BOOL)a3;
- (void)setIncludeOnlyContentContributedByCurrentUser:(BOOL)a3;
- (void)setIncludeOnlyFacesInFaceGroups:(BOOL)a3;
- (void)setIncludeOnlyFacesNeedingFaceCrop:(BOOL)a3;
- (void)setIncludeOnlyFacesWithFaceprints:(BOOL)a3;
- (void)setIncludeOnlyPersonsWithVisibleKeyFaces:(BOOL)a3;
- (void)setIncludeOnlyTorsoDetectionData:(BOOL)a3;
- (void)setIncludePendingMemories:(BOOL)a3;
- (void)setIncludePlaceholderAssets:(BOOL)a3;
- (void)setIncludePlacesSmartAlbum:(BOOL)a3;
- (void)setIncludeProResSmartAlbum:(BOOL)a3;
- (void)setIncludeRecentlyEditedSmartAlbum:(BOOL)a3;
- (void)setIncludeRejectedMemories:(BOOL)a3;
- (void)setIncludeRootFolder:(BOOL)a3;
- (void)setIncludeScreenRecordingsSmartAlbum:(BOOL)a3;
- (void)setIncludeSharedLibrarySharingSuggestionsSmartAlbum:(BOOL)a3;
- (void)setIncludeSourceMemories:(BOOL)a3;
- (void)setIncludeStoryMemories:(BOOL)a3;
- (void)setIncludeTorsoAndFaceDetectionData:(BOOL)a3;
- (void)setIncludeTorsoOnlyPerson:(BOOL)a3;
- (void)setIncludeTrashBinAlbum:(BOOL)a3;
- (void)setIncludeTrashedAssets:(BOOL)a3;
- (void)setIncludeTrashedShares:(BOOL)a3;
- (void)setIncludeUserSmartAlbums:(BOOL)a3;
- (void)setIncludedDetectionTypes:(id)a3;
- (void)setInternalInclusionPredicate:(id)a3;
- (void)setInternalPredicate:(id)a3;
- (void)setInternalSortDescriptors:(id)a3;
- (void)setIsExclusivePredicate:(BOOL)a3;
- (void)setMinimumUnverifiedFaceCount:(unint64_t)a3;
- (void)setMinimumVerifiedFaceCount:(unint64_t)a3;
- (void)setPersonContext:(int64_t)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPredicate:(NSPredicate *)predicate;
- (void)setRelatedEntityName:(id)a3;
- (void)setRelatedRelationshipProperty:(id)a3;
- (void)setReverseDefaultSortDescriptors:(BOOL)a3;
- (void)setReverseSortOrder:(BOOL)a3;
- (void)setSharingFilter:(unsigned __int16)a3;
- (void)setSharingStream:(unint64_t)a3;
- (void)setShouldPrefetchCount:(BOOL)a3;
- (void)setSocialGroupContext:(int64_t)a3;
- (void)setSortDescriptors:(NSArray *)sortDescriptors;
- (void)setSuppressSlowFetchReports:(BOOL)a3;
- (void)setTransientIdentifier:(id)a3;
- (void)setUseNoIndexOnSharingFilter:(BOOL)a3;
- (void)setVerifiedPersonTypes:(id)a3;
- (void)setWantsIncrementalChangeDetails:(BOOL)wantsIncrementalChangeDetails;
@end

@implementation PHFetchOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedRelationshipProperty, 0);
  objc_storeStrong((id *)&self->_relatedEntityName, 0);
  objc_storeStrong((id *)&self->_importantFetchName, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_verifiedPersonTypes, 0);
  objc_storeStrong((id *)&self->_customObjectIDSortOrder, 0);
  objc_storeStrong((id *)&self->_internalInclusionPredicate, 0);
  objc_storeStrong((id *)&self->_internalSortDescriptors, 0);
  objc_storeStrong((id *)&self->_internalPredicate, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
  objc_storeStrong((id *)&self->_changeDetectionCriteria, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_useNoIndexOnSharingFilter, 0);
  objc_storeStrong((id *)&self->_sharingFilterNumber, 0);
  objc_storeStrong((id *)&self->_reverseDefaultSortDescriptorsNumber, 0);
  objc_storeStrong((id *)&self->_suppressSlowFetchReportsNumber, 0);
  objc_storeStrong((id *)&self->_includeMediaAnalysisProcessingRangeTypesNumber, 0);
  objc_storeStrong((id *)&self->_includeDuplicatesAlbumsNumber, 0);
  objc_storeStrong((id *)&self->_includeTorsoOnlyPersonNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyTorsoDetectionDataNumber, 0);
  objc_storeStrong((id *)&self->_includeTorsoAndFaceDetectionDataNumber, 0);
  objc_storeStrong((id *)&self->_includedDetectionTypes, 0);
  objc_storeStrong((id *)&self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyContentContributedByCurrentUserNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyAssetsAllowedForAnalysisNumber, 0);
  objc_storeStrong((id *)&self->_includeUserSmartAlbumsNumber, 0);
  objc_storeStrong((id *)&self->_sharingStreamNumber, 0);
  objc_storeStrong((id *)&self->_highlightCurationTypeNumber, 0);
  objc_storeStrong((id *)&self->_shouldPrefetchCountNumber, 0);
  objc_storeStrong((id *)&self->_propertySets, 0);
  objc_storeStrong((id *)&self->_isExclusivePredicateNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyFacesInFaceGroupsNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyFacesWithFaceprintsNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyFacesNeedingFaceCropNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyPersonsWithVisibleKeyFacesNumber, 0);
  objc_storeStrong((id *)&self->_includeNonvisibleFacesNumber, 0);
  objc_storeStrong((id *)&self->_minimumUnverifiedFaceCountNumber, 0);
  objc_storeStrong((id *)&self->_minimumVerifiedFaceCountNumber, 0);
  objc_storeStrong((id *)&self->_excludeScreenshotAssetsNumber, 0);
  objc_storeStrong((id *)&self->_excludeMontageAssetsNumber, 0);
  objc_storeStrong((id *)&self->_includeRootFolderNumber, 0);
  objc_storeStrong((id *)&self->_includeTrashBinAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeProResSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeActionCamVideoSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeScreenRecordingsSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeRecentlyEditedSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeAllPhotosSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includePlacesSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeFavoriteMemoriesCollectionListNumber, 0);
  objc_storeStrong((id *)&self->_includeExitingSharesNumber, 0);
  objc_storeStrong((id *)&self->_includeExpiredSharesNumber, 0);
  objc_storeStrong((id *)&self->_includeTrashedSharesNumber, 0);
  objc_storeStrong((id *)&self->_includeTrashedAssetsNumber, 0);
  objc_storeStrong((id *)&self->_socialGroupContextNumber, 0);
  objc_storeStrong((id *)&self->_personContextNumber, 0);
  objc_storeStrong((id *)&self->_includeSourceMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includeStoryMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includeLocalMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includeRejectedMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includePendingMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includePlaceholderAssetsNumber, 0);
  objc_storeStrong((id *)&self->_includeGuestAssetsNumber, 0);
  objc_storeStrong((id *)&self->_excludeNonVisibleStackedAssetsNumber, 0);
  objc_storeStrong((id *)&self->_includeDuplicateAssetVisibilityStateMostRelevantNumber, 0);
  objc_storeStrong((id *)&self->_excludeDuplicateAssetVisibilityStateHiddenNumber, 0);
  objc_storeStrong((id *)&self->_includeDuplicateAssetsNumber, 0);
  objc_storeStrong((id *)&self->_reverseSortOrderNumber, 0);
  objc_storeStrong((id *)&self->_cacheSizeForFetchNumber, 0);
  objc_storeStrong((id *)&self->_chunkSizeForFetchNumber, 0);
  objc_storeStrong((id *)&self->_wantsIncrementalChangeDetailsNumber, 0);
  objc_storeStrong((id *)&self->_curationTypeNumber, 0);
  objc_storeStrong((id *)&self->_fetchOffsetNumber, 0);
  objc_storeStrong((id *)&self->_fetchLimitNumber, 0);
  objc_storeStrong((id *)&self->_includeAssetSourceTypesNumber, 0);
  objc_storeStrong((id *)&self->_includeAllBurstAssetsNumber, 0);

  objc_storeStrong((id *)&self->_includeHiddenAssetsNumber, 0);
}

- (BOOL)isExclusivePredicate
{
  return [(NSNumber *)self->_isExclusivePredicateNumber BOOLValue];
}

- (int64_t)cacheSizeForFetch
{
  return [(NSNumber *)self->_cacheSizeForFetchNumber integerValue];
}

- (NSSet)fetchPropertySetsAsSet
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_propertySets];
}

- (NSString)importantFetchName
{
  return self->_importantFetchName;
}

- (BOOL)reverseDefaultSortDescriptors
{
  return [(NSNumber *)self->_reverseDefaultSortDescriptorsNumber BOOLValue];
}

- (BOOL)reverseSortOrder
{
  return [(NSNumber *)self->_reverseSortOrderNumber BOOLValue];
}

- (BOOL)suppressSlowFetchReports
{
  return [(NSNumber *)self->_suppressSlowFetchReportsNumber BOOLValue];
}

- (BOOL)shouldPrefetchCount
{
  return [(NSNumber *)self->_shouldPrefetchCountNumber BOOLValue];
}

- (BOOL)wantsIncrementalChangeDetails
{
  wantsIncrementalChangeDetailsNumber = self->_wantsIncrementalChangeDetailsNumber;
  return !wantsIncrementalChangeDetailsNumber || [(NSNumber *)wantsIncrementalChangeDetailsNumber BOOLValue];
}

- (NSString)relatedEntityName
{
  return self->_relatedEntityName;
}

- (NSUInteger)fetchLimit
{
  return [(NSNumber *)self->_fetchLimitNumber unsignedIntegerValue];
}

- (unint64_t)fetchOffset
{
  return [(NSNumber *)self->_fetchOffsetNumber unsignedIntegerValue];
}

- (int64_t)chunkSizeForFetch
{
  return [(NSNumber *)self->_chunkSizeForFetchNumber integerValue];
}

- (BOOL)includeFavoriteMemoriesCollectionList
{
  return [(NSNumber *)self->_includeFavoriteMemoriesCollectionListNumber BOOLValue];
}

+ (id)effectivePhotoLibraryForFetchOptions:(id)a3 object:(id)a4
{
  id v5 = a3;
  v6 = [a4 photoLibrary];
  if (!v6)
  {
    v6 = [v5 photoLibrary];
    if (!v6)
    {
      v6 = +[PHPhotoLibrary sharedPhotoLibrary];
    }
  }

  return v6;
}

+ (id)fetchOptionsCopyFromNullableFetchOptions:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    v7 = (PHFetchOptions *)[v5 copy];
  }
  else {
    v7 = objc_alloc_init(PHFetchOptions);
  }
  v8 = v7;
  if (v6) {
    [(PHFetchOptions *)v7 setPhotoLibrary:v6];
  }

  return v8;
}

- (BOOL)hasAnySortDescriptors
{
  v3 = [(PHFetchOptions *)self sortDescriptors];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(PHFetchOptions *)self internalSortDescriptors];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)setIncludeHiddenAssets:(BOOL)includeHiddenAssets
{
  BOOL v4 = [NSNumber numberWithBool:includeHiddenAssets];
  includeHiddenAssetsNumber = self->_includeHiddenAssetsNumber;
  self->_includeHiddenAssetsNumber = v4;
}

- (void)mergeWithFetchOptions:(id)a3
{
  v46 = a3;
  BOOL v4 = (void (**)(uint64_t, void *, void *))PHPredicateByCombiningPredicatesWithAnd;
  id v5 = [(PHFetchOptions *)self predicate];
  id v6 = [v46 predicate];
  v7 = v4[2]((uint64_t)v4, v5, v6);

  v8 = (void (**)(uint64_t, void *, void *))PHPredicateByCombiningPredicatesWithAnd;
  v9 = [(PHFetchOptions *)self internalPredicate];
  v10 = [v46 internalPredicate];
  v11 = v8[2]((uint64_t)v8, v9, v10);

  [(PHFetchOptions *)self setPredicate:v7];
  [(PHFetchOptions *)self setInternalPredicate:v11];
  v12 = (void (**)(uint64_t, void *, void *))PHPredicateByCombiningPredicatesWithOr;
  v13 = [(PHFetchOptions *)self internalInclusionPredicate];
  v14 = [v46 internalInclusionPredicate];
  v15 = v12[2]((uint64_t)v12, v13, v14);

  [(PHFetchOptions *)self setInternalInclusionPredicate:v15];
  v16 = [v46 fetchPropertySets];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = [v46 fetchPropertySets];
    [(PHFetchOptions *)self addFetchPropertySets:v18];
  }
  v19 = [v46 sortDescriptors];

  if (v19)
  {
    v20 = [v46 sortDescriptors];
    [(PHFetchOptions *)self setSortDescriptors:v20];
  }
  v21 = [v46 internalSortDescriptors];

  if (v21)
  {
    v22 = [v46 internalSortDescriptors];
    [(PHFetchOptions *)self setInternalSortDescriptors:v22];
  }
  v23 = [v46 transientIdentifier];

  if (v23)
  {
    v24 = [v46 transientIdentifier];
    [(PHFetchOptions *)self setTransientIdentifier:v24];
  }
  v25 = [v46 customObjectIDSortOrder];

  if (v25)
  {
    v26 = [v46 customObjectIDSortOrder];
    [(PHFetchOptions *)self setCustomObjectIDSortOrder:v26];
  }
  v27 = v46;
  if (v46[40])
  {
    -[PHFetchOptions setMinimumVerifiedFaceCount:](self, "setMinimumVerifiedFaceCount:", [v46 minimumVerifiedFaceCount]);
    v27 = v46;
  }
  if (v27[41])
  {
    -[PHFetchOptions setMinimumUnverifiedFaceCount:](self, "setMinimumUnverifiedFaceCount:", [v46 minimumUnverifiedFaceCount]);
    v27 = v46;
  }
  if ([v27 includeOnlyFacesNeedingFaceCrop]) {
    [(PHFetchOptions *)self setIncludeOnlyFacesNeedingFaceCrop:1];
  }
  v28 = [v46 photoLibrary];

  if (v28)
  {
    v29 = [v46 photoLibrary];
    [(PHFetchOptions *)self setPhotoLibrary:v29];
  }
  v30 = [v46 verifiedPersonTypes];

  if (v30)
  {
    v31 = [v46 verifiedPersonTypes];
    [(PHFetchOptions *)self setVerifiedPersonTypes:v31];
  }
  v32 = [v46 changeDetectionCriteria];

  if (v32)
  {
    v33 = [(PHFetchOptions *)self changeDetectionCriteria];
    v34 = [v46 changeDetectionCriteria];
    if (v33)
    {
      v35 = [v33 changeDetectionCriteriaByAddingChangeDetectionCriteria:v34];
      [(PHFetchOptions *)self setChangeDetectionCriteria:v35];
    }
    else
    {
      [(PHFetchOptions *)self setChangeDetectionCriteria:v34];
    }
  }
  v36 = v46;
  if (v46[6])
  {
    -[PHFetchOptions setCurationType:](self, "setCurationType:", [v46 curationType]);
    v36 = v46;
  }
  if (v36[7])
  {
    -[PHFetchOptions setWantsIncrementalChangeDetails:](self, "setWantsIncrementalChangeDetails:", [v46 wantsIncrementalChangeDetails]);
    v36 = v46;
  }
  if (v36[2])
  {
    -[PHFetchOptions setIncludeAllBurstAssets:](self, "setIncludeAllBurstAssets:", [v46 includeAllBurstAssets]);
    v36 = v46;
  }
  if (v36[1])
  {
    -[PHFetchOptions setIncludeHiddenAssets:](self, "setIncludeHiddenAssets:", [v46 includeHiddenAssets]);
    v36 = v46;
  }
  if (v36[8])
  {
    -[PHFetchOptions setChunkSizeForFetch:](self, "setChunkSizeForFetch:", [v46 chunkSizeForFetch]);
    v36 = v46;
  }
  if (v36[9])
  {
    -[PHFetchOptions setCacheSizeForFetch:](self, "setCacheSizeForFetch:", [v46 cacheSizeForFetch]);
    v36 = v46;
  }
  if (v36[4])
  {
    -[PHFetchOptions setFetchLimit:](self, "setFetchLimit:", [v46 fetchLimit]);
    v36 = v46;
  }
  if (v36[5])
  {
    -[PHFetchOptions setFetchOffset:](self, "setFetchOffset:", [v46 fetchOffset]);
    v36 = v46;
  }
  if (v36[3])
  {
    -[PHFetchOptions setIncludeAssetSourceTypes:](self, "setIncludeAssetSourceTypes:", [v46 includeAssetSourceTypes]);
    v36 = v46;
  }
  if (v36[11])
  {
    -[PHFetchOptions setIncludeDuplicateAssets:](self, "setIncludeDuplicateAssets:", [v46 includeDuplicateAssets]);
    v36 = v46;
  }
  if (v36[12])
  {
    -[PHFetchOptions setExcludeDuplicateAssetVisibilityStateHidden:](self, "setExcludeDuplicateAssetVisibilityStateHidden:", [v46 excludeDuplicateAssetVisibilityStateHidden]);
    v36 = v46;
  }
  if (v36[13])
  {
    -[PHFetchOptions setIncludeDuplicateAssetVisibilityStateMostRelevant:](self, "setIncludeDuplicateAssetVisibilityStateMostRelevant:", [v46 includeDuplicateAssetVisibilityStateMostRelevant]);
    v36 = v46;
  }
  if (v36[14])
  {
    -[PHFetchOptions setExcludeNonVisibleStackedAssets:](self, "setExcludeNonVisibleStackedAssets:", [v46 excludeNonVisibleStackedAssets]);
    v36 = v46;
  }
  if (v36[15])
  {
    -[PHFetchOptions setIncludeGuestAssets:](self, "setIncludeGuestAssets:", [v46 includeGuestAssets]);
    v36 = v46;
  }
  if (v36[16])
  {
    -[PHFetchOptions setIncludePlaceholderAssets:](self, "setIncludePlaceholderAssets:", [v46 includePlaceholderAssets]);
    v36 = v46;
  }
  if (v36[17])
  {
    -[PHFetchOptions setIncludePendingMemories:](self, "setIncludePendingMemories:", [v46 includePendingMemories]);
    v36 = v46;
  }
  if (v36[18])
  {
    -[PHFetchOptions setIncludeRejectedMemories:](self, "setIncludeRejectedMemories:", [v46 includeRejectedMemories]);
    v36 = v46;
  }
  if (v36[19])
  {
    -[PHFetchOptions setIncludeLocalMemories:](self, "setIncludeLocalMemories:", [v46 includeLocalMemories]);
    v36 = v46;
  }
  if (v36[20])
  {
    -[PHFetchOptions setIncludeStoryMemories:](self, "setIncludeStoryMemories:", [v46 includeStoryMemories]);
    v36 = v46;
  }
  if (v36[21])
  {
    -[PHFetchOptions setIncludeSourceMemories:](self, "setIncludeSourceMemories:", [v46 includeSourceMemories]);
    v36 = v46;
  }
  if (v36[22])
  {
    -[PHFetchOptions setPersonContext:](self, "setPersonContext:", [v46 personContext]);
    v36 = v46;
  }
  if (v36[23])
  {
    -[PHFetchOptions setSocialGroupContext:](self, "setSocialGroupContext:", [v46 socialGroupContext]);
    v36 = v46;
  }
  if (v36[10])
  {
    -[PHFetchOptions setReverseSortOrder:](self, "setReverseSortOrder:", [v46 reverseSortOrder]);
    v36 = v46;
  }
  if (v36[24])
  {
    -[PHFetchOptions setIncludeTrashedAssets:](self, "setIncludeTrashedAssets:", [v46 includeTrashedAssets]);
    v36 = v46;
  }
  if (v36[25])
  {
    -[PHFetchOptions setIncludeTrashedShares:](self, "setIncludeTrashedShares:", [v46 includeTrashedShares]);
    v36 = v46;
  }
  if (v36[26])
  {
    -[PHFetchOptions setIncludeExpiredShares:](self, "setIncludeExpiredShares:", [v46 includeExpiredShares]);
    v36 = v46;
  }
  if (v36[27])
  {
    -[PHFetchOptions setIncludeExitingShares:](self, "setIncludeExitingShares:", [v46 includeExitingShares]);
    v36 = v46;
  }
  if (v36[28])
  {
    -[PHFetchOptions setIncludeFavoriteMemoriesCollectionList:](self, "setIncludeFavoriteMemoriesCollectionList:", [v46 includeFavoriteMemoriesCollectionList]);
    v36 = v46;
  }
  if (v36[29])
  {
    -[PHFetchOptions setIncludePlacesSmartAlbum:](self, "setIncludePlacesSmartAlbum:", [v46 includePlacesSmartAlbum]);
    v36 = v46;
  }
  if (v36[30])
  {
    -[PHFetchOptions setIncludeAllPhotosSmartAlbum:](self, "setIncludeAllPhotosSmartAlbum:", [v46 includeAllPhotosSmartAlbum]);
    v36 = v46;
  }
  if (v36[31])
  {
    -[PHFetchOptions setIncludeRecentlyEditedSmartAlbum:](self, "setIncludeRecentlyEditedSmartAlbum:", [v46 includeRecentlyEditedSmartAlbum]);
    v36 = v46;
  }
  if (v36[32])
  {
    -[PHFetchOptions setIncludeScreenRecordingsSmartAlbum:](self, "setIncludeScreenRecordingsSmartAlbum:", [v46 includeScreenRecordingsSmartAlbum]);
    v36 = v46;
  }
  if (v36[33])
  {
    -[PHFetchOptions setIncludeSharedLibrarySharingSuggestionsSmartAlbum:](self, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", [v46 includeSharedLibrarySharingSuggestionsSmartAlbum]);
    v36 = v46;
  }
  if (v36[34])
  {
    -[PHFetchOptions setIncludeActionCamVideoSmartAlbum:](self, "setIncludeActionCamVideoSmartAlbum:", [v46 includeActionCamVideoSmartAlbum]);
    v36 = v46;
  }
  if (v36[35])
  {
    -[PHFetchOptions setIncludeProResSmartAlbum:](self, "setIncludeProResSmartAlbum:", [v46 includeProResSmartAlbum]);
    v36 = v46;
  }
  if (v36[36])
  {
    -[PHFetchOptions setIncludeTrashBinAlbum:](self, "setIncludeTrashBinAlbum:", [v46 includeTrashedAssets]);
    v36 = v46;
  }
  if (v36[37])
  {
    -[PHFetchOptions setIncludeRootFolder:](self, "setIncludeRootFolder:", [v46 includeRootFolder]);
    v36 = v46;
  }
  if (v36[38])
  {
    -[PHFetchOptions setExcludeMontageAssets:](self, "setExcludeMontageAssets:", [v46 excludeMontageAssets]);
    v36 = v46;
  }
  if (v36[39])
  {
    -[PHFetchOptions setExcludeScreenshotAssets:](self, "setExcludeScreenshotAssets:", [v46 excludeScreenshotAssets]);
    v36 = v46;
  }
  if (v36[49])
  {
    -[PHFetchOptions setShouldPrefetchCount:](self, "setShouldPrefetchCount:", [v46 shouldPrefetchCount]);
    v36 = v46;
  }
  if (v36[47])
  {
    -[PHFetchOptions setIsExclusivePredicate:](self, "setIsExclusivePredicate:", [v46 isExclusivePredicate]);
    v36 = v46;
  }
  if (v36[50])
  {
    -[PHFetchOptions setHighlightCurationType:](self, "setHighlightCurationType:", [v46 highlightCurationType]);
    v36 = v46;
  }
  if (v36[51])
  {
    -[PHFetchOptions setSharingStream:](self, "setSharingStream:", [v46 sharingStream]);
    v36 = v46;
  }
  if (v36[52])
  {
    -[PHFetchOptions setIncludeUserSmartAlbums:](self, "setIncludeUserSmartAlbums:", [v46 includeUserSmartAlbums]);
    v36 = v46;
  }
  if (v36[42])
  {
    -[PHFetchOptions setIncludeNonvisibleFaces:](self, "setIncludeNonvisibleFaces:", [v46 includeNonvisibleFaces]);
    v36 = v46;
  }
  if (v36[45])
  {
    -[PHFetchOptions setIncludeOnlyFacesWithFaceprints:](self, "setIncludeOnlyFacesWithFaceprints:", [v46 includeOnlyFacesWithFaceprints]);
    v36 = v46;
  }
  if (v36[46])
  {
    -[PHFetchOptions setIncludeOnlyFacesInFaceGroups:](self, "setIncludeOnlyFacesInFaceGroups:", [v46 includeOnlyFacesInFaceGroups]);
    v36 = v46;
  }
  if (v36[43])
  {
    -[PHFetchOptions setIncludeOnlyPersonsWithVisibleKeyFaces:](self, "setIncludeOnlyPersonsWithVisibleKeyFaces:", [v46 includeOnlyPersonsWithVisibleKeyFaces]);
    v36 = v46;
  }
  if (v36[53])
  {
    -[PHFetchOptions setIncludeOnlyAssetsAllowedForAnalysis:](self, "setIncludeOnlyAssetsAllowedForAnalysis:", [v46 includeOnlyAssetsAllowedForAnalysis]);
    v36 = v46;
  }
  if (v36[54])
  {
    -[PHFetchOptions setIncludeOnlyContentContributedByCurrentUser:](self, "setIncludeOnlyContentContributedByCurrentUser:", [v46 includeOnlyContentContributedByCurrentUser]);
    v36 = v46;
  }
  if (v36[55])
  {
    -[PHFetchOptions setIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser:](self, "setIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser:", [v46 includeBothPrivateAssetsAndSharedContentContributedByCurrentUser]);
    v36 = v46;
  }
  v37 = [v36 importantFetchName];

  if (v37)
  {
    v38 = [v46 importantFetchName];
    [(PHFetchOptions *)self setImportantFetchName:v38];
  }
  v39 = [v46 includedDetectionTypes];

  if (v39)
  {
    v40 = [v46 includedDetectionTypes];
    [(PHFetchOptions *)self setIncludedDetectionTypes:v40];
  }
  v41 = v46;
  if (v46[57])
  {
    -[PHFetchOptions setIncludeTorsoAndFaceDetectionData:](self, "setIncludeTorsoAndFaceDetectionData:", [v46 includeTorsoAndFaceDetectionData]);
    v41 = v46;
  }
  if (v41[58])
  {
    -[PHFetchOptions setIncludeOnlyTorsoDetectionData:](self, "setIncludeOnlyTorsoDetectionData:", [v46 includeOnlyTorsoDetectionData]);
    v41 = v46;
  }
  if (v41[59])
  {
    -[PHFetchOptions setIncludeTorsoOnlyPerson:](self, "setIncludeTorsoOnlyPerson:", [v46 includeTorsoOnlyPerson]);
    v41 = v46;
  }
  if (v41[60])
  {
    -[PHFetchOptions setIncludeDuplicatesAlbums:](self, "setIncludeDuplicatesAlbums:", [v46 includeDuplicatesAlbums]);
    v41 = v46;
  }
  if (v41[61])
  {
    -[PHFetchOptions setIncludeMediaAnalysisProcessingRangeTypes:](self, "setIncludeMediaAnalysisProcessingRangeTypes:", [v46 includeMediaAnalysisProcessingRangeTypes]);
    v41 = v46;
  }
  if (v41[64])
  {
    -[PHFetchOptions setSharingFilter:](self, "setSharingFilter:", [v46 sharingFilter]);
    v41 = v46;
  }
  if (v41[65])
  {
    -[PHFetchOptions setUseNoIndexOnSharingFilter:](self, "setUseNoIndexOnSharingFilter:", [v46 useNoIndexOnSharingFilter]);
    v41 = v46;
  }
  if (v41[62])
  {
    -[PHFetchOptions setSuppressSlowFetchReports:](self, "setSuppressSlowFetchReports:", [v46 suppressSlowFetchReports]);
    v41 = v46;
  }
  if (v41[63])
  {
    -[PHFetchOptions setReverseDefaultSortDescriptors:](self, "setReverseDefaultSortDescriptors:", [v46 reverseDefaultSortDescriptors]);
    v41 = v46;
  }
  v42 = [v41 relatedEntityName];

  if (v42)
  {
    v43 = [v46 relatedEntityName];
    [(PHFetchOptions *)self setRelatedEntityName:v43];
  }
  v44 = [v46 relatedRelationshipProperty];

  if (v44)
  {
    v45 = [v46 relatedRelationshipProperty];
    [(PHFetchOptions *)self setRelatedRelationshipProperty:v45];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  BOOL v4 = objc_opt_new();
  id v5 = [(PHFetchOptions *)self predicate];
  id v6 = (void *)[v5 copy];
  [v4 setPredicate:v6];

  v7 = [(PHFetchOptions *)self sortDescriptors];
  v8 = (void *)[v7 copy];
  [v4 setSortDescriptors:v8];

  v9 = [(PHFetchOptions *)self internalPredicate];
  v10 = (void *)[v9 copy];
  [v4 setInternalPredicate:v10];

  v11 = [(PHFetchOptions *)self internalInclusionPredicate];
  v12 = (void *)[v11 copy];
  [v4 setInternalInclusionPredicate:v12];

  v13 = [(PHFetchOptions *)self internalSortDescriptors];
  v14 = (void *)[v13 copy];
  [v4 setInternalSortDescriptors:v14];

  v15 = [(PHFetchOptions *)self fetchPropertySets];
  [v4 setFetchPropertySets:v15];

  v16 = [(PHFetchOptions *)self transientIdentifier];
  [v4 setTransientIdentifier:v16];

  uint64_t v17 = [(PHFetchOptions *)self customObjectIDSortOrder];
  [v4 setCustomObjectIDSortOrder:v17];

  v18 = [(PHFetchOptions *)self photoLibrary];
  [v4 setPhotoLibrary:v18];

  v19 = [(PHFetchOptions *)self verifiedPersonTypes];
  v20 = (void *)[v19 copy];
  [v4 setVerifiedPersonTypes:v20];

  v21 = [(PHFetchOptions *)self changeDetectionCriteria];
  v22 = (void *)[v21 copy];
  [v4 setChangeDetectionCriteria:v22];

  uint64_t v23 = [(NSNumber *)self->_curationTypeNumber copy];
  v24 = (void *)v4[6];
  v4[6] = v23;

  uint64_t v25 = [(NSNumber *)self->_wantsIncrementalChangeDetailsNumber copy];
  v26 = (void *)v4[7];
  v4[7] = v25;

  uint64_t v27 = [(NSNumber *)self->_includeAllBurstAssetsNumber copy];
  v28 = (void *)v4[2];
  v4[2] = v27;

  uint64_t v29 = [(NSNumber *)self->_includeHiddenAssetsNumber copy];
  v30 = (void *)v4[1];
  v4[1] = v29;

  uint64_t v31 = [(NSNumber *)self->_chunkSizeForFetchNumber copy];
  v32 = (void *)v4[8];
  v4[8] = v31;

  uint64_t v33 = [(NSNumber *)self->_cacheSizeForFetchNumber copy];
  v34 = (void *)v4[9];
  v4[9] = v33;

  uint64_t v35 = [(NSNumber *)self->_fetchLimitNumber copy];
  v36 = (void *)v4[4];
  v4[4] = v35;

  uint64_t v37 = [(NSNumber *)self->_fetchOffsetNumber copy];
  v38 = (void *)v4[5];
  v4[5] = v37;

  uint64_t v39 = [(NSNumber *)self->_includeAssetSourceTypesNumber copy];
  v40 = (void *)v4[3];
  v4[3] = v39;

  uint64_t v41 = [(NSNumber *)self->_includeDuplicateAssetsNumber copy];
  v42 = (void *)v4[11];
  v4[11] = v41;

  uint64_t v43 = [(NSNumber *)self->_excludeDuplicateAssetVisibilityStateHiddenNumber copy];
  v44 = (void *)v4[12];
  v4[12] = v43;

  uint64_t v45 = [(NSNumber *)self->_includeDuplicateAssetVisibilityStateMostRelevantNumber copy];
  v46 = (void *)v4[13];
  v4[13] = v45;

  uint64_t v47 = [(NSNumber *)self->_excludeNonVisibleStackedAssetsNumber copy];
  v48 = (void *)v4[14];
  v4[14] = v47;

  uint64_t v49 = [(NSNumber *)self->_includeGuestAssetsNumber copy];
  v50 = (void *)v4[15];
  v4[15] = v49;

  uint64_t v51 = [(NSNumber *)self->_includePlaceholderAssetsNumber copy];
  v52 = (void *)v4[16];
  v4[16] = v51;

  uint64_t v53 = [(NSNumber *)self->_includePendingMemoriesNumber copy];
  v54 = (void *)v4[17];
  v4[17] = v53;

  uint64_t v55 = [(NSNumber *)self->_includeRejectedMemoriesNumber copy];
  v56 = (void *)v4[18];
  v4[18] = v55;

  uint64_t v57 = [(NSNumber *)self->_includeLocalMemoriesNumber copy];
  v58 = (void *)v4[19];
  v4[19] = v57;

  uint64_t v59 = [(NSNumber *)self->_includeStoryMemoriesNumber copy];
  v60 = (void *)v4[20];
  v4[20] = v59;

  uint64_t v61 = [(NSNumber *)self->_personContextNumber copy];
  v62 = (void *)v4[22];
  v4[22] = v61;

  uint64_t v63 = [(NSNumber *)self->_includeSourceMemoriesNumber copy];
  v64 = (void *)v4[21];
  v4[21] = v63;

  uint64_t v65 = [(NSNumber *)self->_socialGroupContextNumber copy];
  v66 = (void *)v4[23];
  v4[23] = v65;

  uint64_t v67 = [(NSNumber *)self->_reverseSortOrderNumber copy];
  v68 = (void *)v4[10];
  v4[10] = v67;

  uint64_t v69 = [(NSNumber *)self->_includeTrashedAssetsNumber copy];
  v70 = (void *)v4[24];
  v4[24] = v69;

  uint64_t v71 = [(NSNumber *)self->_includeTrashedSharesNumber copy];
  v72 = (void *)v4[25];
  v4[25] = v71;

  uint64_t v73 = [(NSNumber *)self->_includeExpiredSharesNumber copy];
  v74 = (void *)v4[26];
  v4[26] = v73;

  uint64_t v75 = [(NSNumber *)self->_includeExitingSharesNumber copy];
  v76 = (void *)v4[27];
  v4[27] = v75;

  uint64_t v77 = [(NSNumber *)self->_includeFavoriteMemoriesCollectionListNumber copy];
  v78 = (void *)v4[28];
  v4[28] = v77;

  uint64_t v79 = [(NSNumber *)self->_includePlacesSmartAlbumNumber copy];
  v80 = (void *)v4[29];
  v4[29] = v79;

  uint64_t v81 = [(NSNumber *)self->_includeAllPhotosSmartAlbumNumber copy];
  v82 = (void *)v4[30];
  v4[30] = v81;

  uint64_t v83 = [(NSNumber *)self->_includeRecentlyEditedSmartAlbumNumber copy];
  v84 = (void *)v4[31];
  v4[31] = v83;

  uint64_t v85 = [(NSNumber *)self->_includeScreenRecordingsSmartAlbumNumber copy];
  v86 = (void *)v4[32];
  v4[32] = v85;

  uint64_t v87 = [(NSNumber *)self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber copy];
  v88 = (void *)v4[33];
  v4[33] = v87;

  uint64_t v89 = [(NSNumber *)self->_includeActionCamVideoSmartAlbumNumber copy];
  v90 = (void *)v4[34];
  v4[34] = v89;

  uint64_t v91 = [(NSNumber *)self->_includeProResSmartAlbumNumber copy];
  v92 = (void *)v4[35];
  v4[35] = v91;

  uint64_t v93 = [(NSNumber *)self->_includeTrashBinAlbumNumber copy];
  v94 = (void *)v4[36];
  v4[36] = v93;

  uint64_t v95 = [(NSNumber *)self->_includeRootFolderNumber copy];
  v96 = (void *)v4[37];
  v4[37] = v95;

  uint64_t v97 = [(NSNumber *)self->_excludeMontageAssetsNumber copy];
  v98 = (void *)v4[38];
  v4[38] = v97;

  uint64_t v99 = [(NSNumber *)self->_excludeScreenshotAssetsNumber copy];
  v100 = (void *)v4[39];
  v4[39] = v99;

  uint64_t v101 = [(NSNumber *)self->_minimumVerifiedFaceCountNumber copy];
  v102 = (void *)v4[40];
  v4[40] = v101;

  uint64_t v103 = [(NSNumber *)self->_minimumUnverifiedFaceCountNumber copy];
  v104 = (void *)v4[41];
  v4[41] = v103;

  uint64_t v105 = [(NSNumber *)self->_includeNonvisibleFacesNumber copy];
  v106 = (void *)v4[42];
  v4[42] = v105;

  uint64_t v107 = [(NSNumber *)self->_includeOnlyPersonsWithVisibleKeyFacesNumber copy];
  v108 = (void *)v4[43];
  v4[43] = v107;

  uint64_t v109 = [(NSNumber *)self->_includeOnlyFacesNeedingFaceCropNumber copy];
  v110 = (void *)v4[44];
  v4[44] = v109;

  uint64_t v111 = [(NSNumber *)self->_includeOnlyFacesWithFaceprintsNumber copy];
  v112 = (void *)v4[45];
  v4[45] = v111;

  uint64_t v113 = [(NSNumber *)self->_includeOnlyFacesInFaceGroupsNumber copy];
  v114 = (void *)v4[46];
  v4[46] = v113;

  uint64_t v115 = [(NSNumber *)self->_shouldPrefetchCountNumber copy];
  v116 = (void *)v4[49];
  v4[49] = v115;

  uint64_t v117 = [(NSNumber *)self->_isExclusivePredicateNumber copy];
  v118 = (void *)v4[47];
  v4[47] = v117;

  uint64_t v119 = [(NSNumber *)self->_highlightCurationTypeNumber copy];
  v120 = (void *)v4[50];
  v4[50] = v119;

  uint64_t v121 = [(NSNumber *)self->_sharingStreamNumber copy];
  v122 = (void *)v4[51];
  v4[51] = v121;

  uint64_t v123 = [(NSNumber *)self->_includeUserSmartAlbumsNumber copy];
  v124 = (void *)v4[52];
  v4[52] = v123;

  uint64_t v125 = [(NSNumber *)self->_includeOnlyAssetsAllowedForAnalysisNumber copy];
  v126 = (void *)v4[53];
  v4[53] = v125;

  uint64_t v127 = [(NSNumber *)self->_includeOnlyContentContributedByCurrentUserNumber copy];
  v128 = (void *)v4[54];
  v4[54] = v127;

  uint64_t v129 = [(NSNumber *)self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber copy];
  v130 = (void *)v4[55];
  v4[55] = v129;

  uint64_t v131 = [(NSString *)self->_importantFetchName copy];
  v132 = (void *)v4[76];
  v4[76] = v131;

  uint64_t v133 = [(NSArray *)self->_includedDetectionTypes copy];
  v134 = (void *)v4[56];
  v4[56] = v133;

  uint64_t v135 = [(NSNumber *)self->_includeTorsoAndFaceDetectionDataNumber copy];
  v136 = (void *)v4[57];
  v4[57] = v135;

  uint64_t v137 = [(NSNumber *)self->_includeOnlyTorsoDetectionDataNumber copy];
  v138 = (void *)v4[58];
  v4[58] = v137;

  uint64_t v139 = [(NSNumber *)self->_includeTorsoOnlyPersonNumber copy];
  v140 = (void *)v4[59];
  v4[59] = v139;

  uint64_t v141 = [(NSNumber *)self->_includeDuplicatesAlbumsNumber copy];
  v142 = (void *)v4[60];
  v4[60] = v141;

  uint64_t v143 = [(NSNumber *)self->_includeMediaAnalysisProcessingRangeTypesNumber copy];
  v144 = (void *)v4[61];
  v4[61] = v143;

  uint64_t v145 = [(NSNumber *)self->_sharingFilterNumber copy];
  v146 = (void *)v4[64];
  v4[64] = v145;

  uint64_t v147 = [(NSNumber *)self->_useNoIndexOnSharingFilter copy];
  v148 = (void *)v4[65];
  v4[65] = v147;

  uint64_t v149 = [(NSNumber *)self->_suppressSlowFetchReportsNumber copy];
  v150 = (void *)v4[62];
  v4[62] = v149;

  uint64_t v151 = [(NSNumber *)self->_reverseDefaultSortDescriptorsNumber copy];
  v152 = (void *)v4[63];
  v4[63] = v151;

  uint64_t v153 = [(NSString *)self->_relatedEntityName copy];
  v154 = (void *)v4[77];
  v4[77] = v153;

  uint64_t v155 = [(NSString *)self->_relatedRelationshipProperty copy];
  v156 = (void *)v4[78];
  v4[78] = v155;

  return v4;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (NSArray)internalSortDescriptors
{
  return self->_internalSortDescriptors;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSPredicate)internalPredicate
{
  return self->_internalPredicate;
}

- (NSPredicate)internalInclusionPredicate
{
  return self->_internalInclusionPredicate;
}

- (NSArray)customObjectIDSortOrder
{
  return self->_customObjectIDSortOrder;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHFetchOptions)init
{
  v10.receiver = self;
  v10.super_class = (Class)PHFetchOptions;
  v2 = [(PHFetchOptions *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    propertySets = v2->_propertySets;
    v2->_propertySets = (NSMutableSet *)v3;

    uint64_t v5 = +[PHFetchOptions defaultDetectionTypes];
    includedDetectionTypes = v2->_includedDetectionTypes;
    v2->_includedDetectionTypes = (NSArray *)v5;

    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", +[PHFetchOptions defaultMediaAnalysisProcessingRangeTypes](PHFetchOptions, "defaultMediaAnalysisProcessingRangeTypes"));
    includeMediaAnalysisProcessingRangeTypesNumber = v2->_includeMediaAnalysisProcessingRangeTypesNumber;
    v2->_includeMediaAnalysisProcessingRangeTypesNumber = (NSNumber *)v7;
  }
  return v2;
}

+ (int64_t)defaultMediaAnalysisProcessingRangeTypes
{
  return 1;
}

+ (id)defaultDetectionTypes
{
  return &unk_1EEB269B8;
}

- (void)setInternalSortDescriptors:(id)a3
{
}

- (void)setInternalPredicate:(id)a3
{
}

- (void)setFetchPropertySets:(id)a3
{
  propertySets = self->_propertySets;
  id v5 = a3;
  [(NSMutableSet *)propertySets removeAllObjects];
  [(NSMutableSet *)self->_propertySets addObjectsFromArray:v5];
}

- (void)setInternalInclusionPredicate:(id)a3
{
}

- (void)setPredicate:(NSPredicate *)predicate
{
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
}

- (NSArray)fetchPropertySets
{
  return (NSArray *)[(NSMutableSet *)self->_propertySets allObjects];
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (NSSet)verifiedPersonTypes
{
  return self->_verifiedPersonTypes;
}

- (PHQueryChangeDetectionCriteria)changeDetectionCriteria
{
  return (PHQueryChangeDetectionCriteria *)objc_getProperty(self, a2, 544, 1);
}

- (void)setTransientIdentifier:(id)a3
{
}

- (void)setCustomObjectIDSortOrder:(id)a3
{
}

- (void)setVerifiedPersonTypes:(id)a3
{
}

- (void)setChangeDetectionCriteria:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setSharingFilter:(unsigned __int16)a3
{
  BOOL v4 = [NSNumber numberWithUnsignedShort:a3];
  sharingFilterNumber = self->_sharingFilterNumber;
  self->_sharingFilterNumber = v4;
}

- (void)setIsExclusivePredicate:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  isExclusivePredicateNumber = self->_isExclusivePredicateNumber;
  self->_isExclusivePredicateNumber = v4;
}

- (void)setReverseDefaultSortDescriptors:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  reverseDefaultSortDescriptorsNumber = self->_reverseDefaultSortDescriptorsNumber;
  self->_reverseDefaultSortDescriptorsNumber = v4;
}

- (void)setIncludeGuestAssets:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeGuestAssetsNumber = self->_includeGuestAssetsNumber;
  self->_includeGuestAssetsNumber = v4;
}

- (NSArray)includedDetectionTypes
{
  return self->_includedDetectionTypes;
}

- (unsigned)sharingFilter
{
  sharingFilterNumber = self->_sharingFilterNumber;
  if (sharingFilterNumber) {
    return [(NSNumber *)sharingFilterNumber unsignedShortValue];
  }
  else {
    return 2;
  }
}

- (BOOL)includeTrashedAssets
{
  return [(NSNumber *)self->_includeTrashedAssetsNumber BOOLValue];
}

- (BOOL)includeHiddenAssets
{
  return [(NSNumber *)self->_includeHiddenAssetsNumber BOOLValue];
}

- (BOOL)includeTrashedShares
{
  return [(NSNumber *)self->_includeTrashedSharesNumber BOOLValue];
}

- (BOOL)includeOnlyContentContributedByCurrentUser
{
  return [(NSNumber *)self->_includeOnlyContentContributedByCurrentUserNumber BOOLValue];
}

- (BOOL)includeOnlyAssetsAllowedForAnalysis
{
  return [(NSNumber *)self->_includeOnlyAssetsAllowedForAnalysisNumber BOOLValue];
}

- (BOOL)includeExpiredShares
{
  return [(NSNumber *)self->_includeExpiredSharesNumber BOOLValue];
}

- (BOOL)includeExitingShares
{
  return [(NSNumber *)self->_includeExitingSharesNumber BOOLValue];
}

- (BOOL)includeBothPrivateAssetsAndSharedContentContributedByCurrentUser
{
  return [(NSNumber *)self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber BOOLValue];
}

- (BOOL)includeRecentlyEditedSmartAlbum
{
  return [(NSNumber *)self->_includeRecentlyEditedSmartAlbumNumber BOOLValue];
}

- (BOOL)excludeNonVisibleStackedAssets
{
  return [(NSNumber *)self->_excludeNonVisibleStackedAssetsNumber BOOLValue];
}

- (BOOL)useNoIndexOnSharingFilter
{
  return [(NSNumber *)self->_useNoIndexOnSharingFilter BOOLValue];
}

- (BOOL)includeDuplicateAssets
{
  return [(NSNumber *)self->_includeDuplicateAssetsNumber BOOLValue];
}

- (BOOL)includeDuplicateAssetVisibilityStateMostRelevant
{
  return [(NSNumber *)self->_includeDuplicateAssetVisibilityStateMostRelevantNumber BOOLValue];
}

- (BOOL)includeAllBurstAssets
{
  return [(NSNumber *)self->_includeAllBurstAssetsNumber BOOLValue];
}

- (BOOL)excludeScreenshotAssets
{
  return [(NSNumber *)self->_excludeScreenshotAssetsNumber BOOLValue];
}

- (BOOL)excludeMontageAssets
{
  return [(NSNumber *)self->_excludeMontageAssetsNumber BOOLValue];
}

- (BOOL)excludeDuplicateAssetVisibilityStateHidden
{
  return [(NSNumber *)self->_excludeDuplicateAssetVisibilityStateHiddenNumber BOOLValue];
}

- (BOOL)includeGuestAssets
{
  return [(NSNumber *)self->_includeGuestAssetsNumber BOOLValue];
}

- (PHAssetSourceType)includeAssetSourceTypes
{
  return [(NSNumber *)self->_includeAssetSourceTypesNumber unsignedIntegerValue];
}

- (void)setReverseSortOrder:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  reverseSortOrderNumber = self->_reverseSortOrderNumber;
  self->_reverseSortOrderNumber = v4;
}

- (int64_t)includeMediaAnalysisProcessingRangeTypes
{
  return [(NSNumber *)self->_includeMediaAnalysisProcessingRangeTypesNumber integerValue];
}

- (void)setIncludedDetectionTypes:(id)a3
{
}

- (BOOL)includeOnlyFacesNeedingFaceCrop
{
  return [(NSNumber *)self->_includeOnlyFacesNeedingFaceCropNumber BOOLValue];
}

- (void)setIncludeMediaAnalysisProcessingRangeTypes:(int64_t)a3
{
  BOOL v4 = [NSNumber numberWithInteger:a3];
  includeMediaAnalysisProcessingRangeTypesNumber = self->_includeMediaAnalysisProcessingRangeTypesNumber;
  self->_includeMediaAnalysisProcessingRangeTypesNumber = v4;
}

- (NSString)relatedRelationshipProperty
{
  return self->_relatedRelationshipProperty;
}

- (void)setFetchLimit:(NSUInteger)fetchLimit
{
  BOOL v4 = [NSNumber numberWithUnsignedInteger:fetchLimit];
  fetchLimitNumber = self->_fetchLimitNumber;
  self->_fetchLimitNumber = v4;
}

- (void)setCacheSizeForFetch:(int64_t)a3
{
  BOOL v4 = [NSNumber numberWithInteger:a3];
  cacheSizeForFetchNumber = self->_cacheSizeForFetchNumber;
  self->_cacheSizeForFetchNumber = v4;
}

- (void)setExcludeNonVisibleStackedAssets:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  excludeNonVisibleStackedAssetsNumber = self->_excludeNonVisibleStackedAssetsNumber;
  self->_excludeNonVisibleStackedAssetsNumber = v4;
}

- (BOOL)includeOnlyFacesWithFaceprints
{
  return [(NSNumber *)self->_includeOnlyFacesWithFaceprintsNumber BOOLValue];
}

- (BOOL)includeOnlyFacesInFaceGroups
{
  return [(NSNumber *)self->_includeOnlyFacesInFaceGroupsNumber BOOLValue];
}

- (BOOL)includeNonvisibleFaces
{
  includeNonvisibleFacesNumber = self->_includeNonvisibleFacesNumber;
  return !includeNonvisibleFacesNumber || [(NSNumber *)includeNonvisibleFacesNumber BOOLValue];
}

- (BOOL)includeTorsoOnlyPerson
{
  return [(NSNumber *)self->_includeTorsoOnlyPersonNumber BOOLValue];
}

- (BOOL)includeStoryMemories
{
  return [(NSNumber *)self->_includeStoryMemoriesNumber BOOLValue];
}

- (BOOL)includeSourceMemories
{
  return [(NSNumber *)self->_includeSourceMemoriesNumber BOOLValue];
}

- (BOOL)includeRejectedMemories
{
  return [(NSNumber *)self->_includeRejectedMemoriesNumber BOOLValue];
}

- (BOOL)includePendingMemories
{
  return [(NSNumber *)self->_includePendingMemoriesNumber BOOLValue];
}

- (BOOL)includeOnlyPersonsWithVisibleKeyFaces
{
  return [(NSNumber *)self->_includeOnlyPersonsWithVisibleKeyFacesNumber BOOLValue];
}

- (BOOL)includeLocalMemories
{
  return [(NSNumber *)self->_includeLocalMemoriesNumber BOOLValue];
}

- (void)setUseNoIndexOnSharingFilter:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  useNoIndexOnSharingFilter = self->_useNoIndexOnSharingFilter;
  self->_useNoIndexOnSharingFilter = v4;
}

- (void)setChunkSizeForFetch:(int64_t)a3
{
  BOOL v4 = [NSNumber numberWithInteger:a3];
  chunkSizeForFetchNumber = self->_chunkSizeForFetchNumber;
  self->_chunkSizeForFetchNumber = v4;
}

- (BOOL)includePlacesSmartAlbum
{
  return [(NSNumber *)self->_includePlacesSmartAlbumNumber BOOLValue];
}

- (BOOL)includeAllPhotosSmartAlbum
{
  return [(NSNumber *)self->_includeAllPhotosSmartAlbumNumber BOOLValue];
}

- (BOOL)includeUserSmartAlbums
{
  return [(NSNumber *)self->_includeUserSmartAlbumsNumber BOOLValue];
}

- (BOOL)includeSharedLibrarySharingSuggestionsSmartAlbum
{
  return [(NSNumber *)self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber BOOLValue];
}

- (BOOL)includeScreenRecordingsSmartAlbum
{
  return [(NSNumber *)self->_includeScreenRecordingsSmartAlbumNumber BOOLValue];
}

- (BOOL)includeProResSmartAlbum
{
  return [(NSNumber *)self->_includeProResSmartAlbumNumber BOOLValue];
}

- (BOOL)includeDuplicatesAlbums
{
  return [(NSNumber *)self->_includeDuplicatesAlbumsNumber BOOLValue];
}

- (BOOL)includeActionCamVideoSmartAlbum
{
  return [(NSNumber *)self->_includeActionCamVideoSmartAlbumNumber BOOLValue];
}

- (void)addFetchPropertySets:(id)a3
{
  if (a3) {
    -[NSMutableSet addObjectsFromArray:](self->_propertySets, "addObjectsFromArray:");
  }
}

- (BOOL)includeTrashBinAlbum
{
  return [(NSNumber *)self->_includeTrashBinAlbumNumber BOOLValue];
}

- (void)setIncludeAllBurstAssets:(BOOL)includeAllBurstAssets
{
  BOOL v4 = [NSNumber numberWithBool:includeAllBurstAssets];
  includeAllBurstAssetsNumber = self->_includeAllBurstAssetsNumber;
  self->_includeAllBurstAssetsNumber = v4;
}

- (int64_t)socialGroupContext
{
  return [(NSNumber *)self->_socialGroupContextNumber integerValue];
}

- (void)setIncludeTrashedAssets:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeTrashedAssetsNumber = self->_includeTrashedAssetsNumber;
  self->_includeTrashedAssetsNumber = v4;
}

+ (PHFetchOptions)fetchOptionsWithPhotoLibrary:(id)a3 orObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(PHFetchOptions);
  v8 = v7;
  if (v5)
  {
    [(PHFetchOptions *)v7 setPhotoLibrary:v5];
  }
  else
  {
    v9 = [v6 photoLibrary];
    [(PHFetchOptions *)v8 setPhotoLibrary:v9];
  }

  return v8;
}

- (void)setIncludeDuplicateAssets:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeDuplicateAssetsNumber = self->_includeDuplicateAssetsNumber;
  self->_includeDuplicateAssetsNumber = v4;
}

- (BOOL)includeTorsoAndFaceDetectionData
{
  return [(NSNumber *)self->_includeTorsoAndFaceDetectionDataNumber BOOLValue];
}

- (BOOL)includeOnlyTorsoDetectionData
{
  return [(NSNumber *)self->_includeOnlyTorsoDetectionDataNumber BOOLValue];
}

- (void)setIncludeAssetSourceTypes:(PHAssetSourceType)includeAssetSourceTypes
{
  BOOL v4 = [NSNumber numberWithUnsignedInteger:includeAssetSourceTypes];
  includeAssetSourceTypesNumber = self->_includeAssetSourceTypesNumber;
  self->_includeAssetSourceTypesNumber = v4;
}

- (void)setImportantFetchName:(id)a3
{
}

- (void)setIncludeTorsoAndFaceDetectionData:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeTorsoAndFaceDetectionDataNumber = self->_includeTorsoAndFaceDetectionDataNumber;
  self->_includeTorsoAndFaceDetectionDataNumber = v4;
}

- (void)setIncludeScreenRecordingsSmartAlbum:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeScreenRecordingsSmartAlbumNumber = self->_includeScreenRecordingsSmartAlbumNumber;
  self->_includeScreenRecordingsSmartAlbumNumber = v4;
}

- (void)setIncludeProResSmartAlbum:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeProResSmartAlbumNumber = self->_includeProResSmartAlbumNumber;
  self->_includeProResSmartAlbumNumber = v4;
}

- (void)setIncludeDuplicatesAlbums:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeDuplicatesAlbumsNumber = self->_includeDuplicatesAlbumsNumber;
  self->_includeDuplicatesAlbumsNumber = v4;
}

- (void)setWantsIncrementalChangeDetails:(BOOL)wantsIncrementalChangeDetails
{
  BOOL v4 = [NSNumber numberWithBool:wantsIncrementalChangeDetails];
  wantsIncrementalChangeDetailsNumber = self->_wantsIncrementalChangeDetailsNumber;
  self->_wantsIncrementalChangeDetailsNumber = v4;
}

- (void)setIncludeAllPhotosSmartAlbum:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeAllPhotosSmartAlbumNumber = self->_includeAllPhotosSmartAlbumNumber;
  self->_includeAllPhotosSmartAlbumNumber = v4;
}

- (void)setIncludeTrashBinAlbum:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeTrashBinAlbumNumber = self->_includeTrashBinAlbumNumber;
  self->_includeTrashBinAlbumNumber = v4;
}

- (void)setIncludeRecentlyEditedSmartAlbum:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeRecentlyEditedSmartAlbumNumber = self->_includeRecentlyEditedSmartAlbumNumber;
  self->_includeRecentlyEditedSmartAlbumNumber = v4;
}

- (void)setIncludePlacesSmartAlbum:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includePlacesSmartAlbumNumber = self->_includePlacesSmartAlbumNumber;
  self->_includePlacesSmartAlbumNumber = v4;
}

- (void)setPersonContext:(int64_t)a3
{
  BOOL v4 = [NSNumber numberWithInteger:a3];
  personContextNumber = self->_personContextNumber;
  self->_personContextNumber = v4;
}

- (void)setIncludeUserSmartAlbums:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeUserSmartAlbumsNumber = self->_includeUserSmartAlbumsNumber;
  self->_includeUserSmartAlbumsNumber = v4;
}

- (void)setIncludeStoryMemories:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeStoryMemoriesNumber = self->_includeStoryMemoriesNumber;
  self->_includeStoryMemoriesNumber = v4;
}

- (void)setIncludeSharedLibrarySharingSuggestionsSmartAlbum:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeSharedLibrarySharingSuggestionsSmartAlbumNumber = self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber;
  self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber = v4;
}

- (void)setIncludePendingMemories:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includePendingMemoriesNumber = self->_includePendingMemoriesNumber;
  self->_includePendingMemoriesNumber = v4;
}

- (void)setIncludeExitingShares:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeExitingSharesNumber = self->_includeExitingSharesNumber;
  self->_includeExitingSharesNumber = v4;
}

- (void)setIncludeActionCamVideoSmartAlbum:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeActionCamVideoSmartAlbumNumber = self->_includeActionCamVideoSmartAlbumNumber;
  self->_includeActionCamVideoSmartAlbumNumber = v4;
}

- (int64_t)personContext
{
  return [(NSNumber *)self->_personContextNumber integerValue];
}

- (void)setIncludeNonvisibleFaces:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  includeNonvisibleFacesNumber = self->_includeNonvisibleFacesNumber;
  self->_includeNonvisibleFacesNumber = v4;
}

- (void)setShouldPrefetchCount:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  shouldPrefetchCountNumber = self->_shouldPrefetchCountNumber;
  self->_shouldPrefetchCountNumber = v4;
}

- (void)setRelatedRelationshipProperty:(id)a3
{
}

- (void)setRelatedEntityName:(id)a3
{
}

- (NSDictionary)internalLoggingDescriptionDictionary
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (MEMORY[0x19F388B10]())
  {
    unsigned int outCount = 0;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = class_copyPropertyList(v5, &outCount);
    if (v6)
    {
      uint64_t v7 = v6;
      NSStringFromSelector(a2);
      id v8 = objc_claimAutoreleasedReturnValue();
      v9 = (const char *)[v8 UTF8String];

      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ++i)
        {
          v11 = (void *)MEMORY[0x19F389B10]();
          Name = property_getName(v7[i]);
          if (Name)
          {
            v13 = Name;
            if (strcmp(Name, "shortDescription"))
            {
              if (strcmp(v13, v9))
              {
                v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, objc_msgSend(NSString, "defaultCStringEncoding"));
                v15 = [(PHFetchOptions *)self valueForKey:v14];
                v16 = v15;
                if (v15)
                {
                  uint64_t v17 = [v15 debugDescription];
                  [v4 setObject:v17 forKeyedSubscript:v14];
                }
                else
                {
                  [v4 setObject:@"(null)" forKeyedSubscript:v14];
                }
              }
            }
          }
        }
      }
      free(v7);
    }
  }

  return (NSDictionary *)v4;
}

- (NSString)shortDescription
{
  v17.receiver = self;
  v17.super_class = (Class)PHFetchOptions;
  uint64_t v3 = [(PHFetchOptions *)&v17 description];
  v16 = [(PHFetchOptions *)self predicate];
  uint64_t v15 = objc_opt_class();
  id v4 = [(PHFetchOptions *)self internalPredicate];
  uint64_t v14 = objc_opt_class();
  NSUInteger v5 = [(PHFetchOptions *)self fetchLimit];
  id v6 = [(PHFetchOptions *)self sortDescriptors];
  uint64_t v7 = [(PHFetchOptions *)self internalSortDescriptors];
  id v8 = [(PHFetchOptions *)self customObjectIDSortOrder];
  uint64_t v9 = [v8 count];
  if ([(PHFetchOptions *)self reverseSortOrder]) {
    objc_super v10 = @"D";
  }
  else {
    objc_super v10 = @"A";
  }
  v11 = [(PHFetchOptions *)self transientIdentifier];
  v12 = [v3 stringByAppendingFormat:@" predicate=%@/%@[%ld], sort=%@/%@/%ld/%@, changes[%@]=%d", v15, v14, v5, v6, v7, v9, v10, v11, -[PHFetchOptions wantsIncrementalChangeDetails](self, "wantsIncrementalChangeDetails")];

  return (NSString *)v12;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHFetchOptions;
  uint64_t v3 = [(PHFetchOptions *)&v8 description];
  id v4 = [(PHFetchOptions *)self predicate];
  NSUInteger v5 = [(PHFetchOptions *)self sortDescriptors];
  id v6 = [v3 stringByAppendingFormat:@" predicate=%@, sort=%@, wantsChangeDetails=%d", v4, v5, -[PHFetchOptions wantsIncrementalChangeDetails](self, "wantsIncrementalChangeDetails")];

  return v6;
}

- (void)setSuppressSlowFetchReports:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  suppressSlowFetchReportsNumber = self->_suppressSlowFetchReportsNumber;
  self->_suppressSlowFetchReportsNumber = v4;
}

- (void)setIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber = self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber;
  self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber = v4;
}

- (void)setIncludeOnlyContentContributedByCurrentUser:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeOnlyContentContributedByCurrentUserNumber = self->_includeOnlyContentContributedByCurrentUserNumber;
  self->_includeOnlyContentContributedByCurrentUserNumber = v4;
}

- (void)setIncludeOnlyAssetsAllowedForAnalysis:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeOnlyAssetsAllowedForAnalysisNumber = self->_includeOnlyAssetsAllowedForAnalysisNumber;
  self->_includeOnlyAssetsAllowedForAnalysisNumber = v4;
}

- (void)setSharingStream:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  sharingStreamNumber = self->_sharingStreamNumber;
  self->_sharingStreamNumber = v4;
}

- (unint64_t)sharingStream
{
  sharingStreamNumber = self->_sharingStreamNumber;
  if (sharingStreamNumber) {
    return [(NSNumber *)sharingStreamNumber unsignedIntegerValue];
  }
  else {
    return 1;
  }
}

- (void)setHighlightCurationType:(unsigned __int16)a3
{
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  highlightCurationTypeNumber = self->_highlightCurationTypeNumber;
  self->_highlightCurationTypeNumber = v4;
}

- (unsigned)highlightCurationType
{
  highlightCurationTypeNumber = self->_highlightCurationTypeNumber;
  if (highlightCurationTypeNumber) {
    LOWORD(highlightCurationTypeNumber) = [(NSNumber *)highlightCurationTypeNumber integerValue];
  }
  return (unsigned __int16)highlightCurationTypeNumber;
}

- (void)setIncludeOnlyFacesInFaceGroups:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeOnlyFacesInFaceGroupsNumber = self->_includeOnlyFacesInFaceGroupsNumber;
  self->_includeOnlyFacesInFaceGroupsNumber = v4;
}

- (void)setIncludeOnlyFacesWithFaceprints:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeOnlyFacesWithFaceprintsNumber = self->_includeOnlyFacesWithFaceprintsNumber;
  self->_includeOnlyFacesWithFaceprintsNumber = v4;
}

- (void)setIncludeOnlyFacesNeedingFaceCrop:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeOnlyFacesNeedingFaceCropNumber = self->_includeOnlyFacesNeedingFaceCropNumber;
  self->_includeOnlyFacesNeedingFaceCropNumber = v4;
}

- (void)setIncludeTorsoOnlyPerson:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeTorsoOnlyPersonNumber = self->_includeTorsoOnlyPersonNumber;
  self->_includeTorsoOnlyPersonNumber = v4;
}

- (void)setIncludeOnlyTorsoDetectionData:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeOnlyTorsoDetectionDataNumber = self->_includeOnlyTorsoDetectionDataNumber;
  self->_includeOnlyTorsoDetectionDataNumber = v4;
}

- (void)setIncludeOnlyPersonsWithVisibleKeyFaces:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeOnlyPersonsWithVisibleKeyFacesNumber = self->_includeOnlyPersonsWithVisibleKeyFacesNumber;
  self->_includeOnlyPersonsWithVisibleKeyFacesNumber = v4;
}

- (void)setMinimumUnverifiedFaceCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  minimumUnverifiedFaceCountNumber = self->_minimumUnverifiedFaceCountNumber;
  self->_minimumUnverifiedFaceCountNumber = v4;
}

- (unint64_t)minimumUnverifiedFaceCount
{
  minimumUnverifiedFaceCountNumber = self->_minimumUnverifiedFaceCountNumber;
  if (minimumUnverifiedFaceCountNumber) {
    return [(NSNumber *)minimumUnverifiedFaceCountNumber unsignedIntegerValue];
  }
  else {
    return 2;
  }
}

- (void)setMinimumVerifiedFaceCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  minimumVerifiedFaceCountNumber = self->_minimumVerifiedFaceCountNumber;
  self->_minimumVerifiedFaceCountNumber = v4;
}

- (unint64_t)minimumVerifiedFaceCount
{
  minimumVerifiedFaceCountNumber = self->_minimumVerifiedFaceCountNumber;
  if (minimumVerifiedFaceCountNumber) {
    return [(NSNumber *)minimumVerifiedFaceCountNumber unsignedIntegerValue];
  }
  else {
    return 1;
  }
}

- (void)setExcludeScreenshotAssets:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  excludeScreenshotAssetsNumber = self->_excludeScreenshotAssetsNumber;
  self->_excludeScreenshotAssetsNumber = v4;
}

- (void)setExcludeMontageAssets:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  excludeMontageAssetsNumber = self->_excludeMontageAssetsNumber;
  self->_excludeMontageAssetsNumber = v4;
}

- (void)setIncludeRootFolder:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeRootFolderNumber = self->_includeRootFolderNumber;
  self->_includeRootFolderNumber = v4;
}

- (BOOL)includeRootFolder
{
  return [(NSNumber *)self->_includeRootFolderNumber BOOLValue];
}

- (void)setIncludeFavoriteMemoriesCollectionList:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeFavoriteMemoriesCollectionListNumber = self->_includeFavoriteMemoriesCollectionListNumber;
  self->_includeFavoriteMemoriesCollectionListNumber = v4;
}

- (void)setIncludeExpiredShares:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeExpiredSharesNumber = self->_includeExpiredSharesNumber;
  self->_includeExpiredSharesNumber = v4;
}

- (void)setIncludeTrashedShares:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeTrashedSharesNumber = self->_includeTrashedSharesNumber;
  self->_includeTrashedSharesNumber = v4;
}

- (void)setSocialGroupContext:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  socialGroupContextNumber = self->_socialGroupContextNumber;
  self->_socialGroupContextNumber = v4;
}

- (void)setCurationType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  curationTypeNumber = self->_curationTypeNumber;
  self->_curationTypeNumber = v4;
}

- (int64_t)curationType
{
  return [(NSNumber *)self->_curationTypeNumber integerValue];
}

- (void)setIncludeSourceMemories:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeSourceMemoriesNumber = self->_includeSourceMemoriesNumber;
  self->_includeSourceMemoriesNumber = v4;
}

- (void)setIncludeLocalMemories:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeLocalMemoriesNumber = self->_includeLocalMemoriesNumber;
  self->_includeLocalMemoriesNumber = v4;
}

- (void)setIncludeRejectedMemories:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeRejectedMemoriesNumber = self->_includeRejectedMemoriesNumber;
  self->_includeRejectedMemoriesNumber = v4;
}

- (void)setIncludePlaceholderAssets:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includePlaceholderAssetsNumber = self->_includePlaceholderAssetsNumber;
  self->_includePlaceholderAssetsNumber = v4;
}

- (BOOL)includePlaceholderAssets
{
  BOOL result = PLIsMobileSlideShow();
  if (self->_includePlaceholderAssetsNumber)
  {
    includePlaceholderAssetsNumber = self->_includePlaceholderAssetsNumber;
    return [(NSNumber *)includePlaceholderAssetsNumber BOOLValue];
  }
  return result;
}

- (void)setIncludeDuplicateAssetVisibilityStateMostRelevant:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  includeDuplicateAssetVisibilityStateMostRelevantNumber = self->_includeDuplicateAssetVisibilityStateMostRelevantNumber;
  self->_includeDuplicateAssetVisibilityStateMostRelevantNumber = v4;
}

- (void)setExcludeDuplicateAssetVisibilityStateHidden:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  excludeDuplicateAssetVisibilityStateHiddenNumber = self->_excludeDuplicateAssetVisibilityStateHiddenNumber;
  self->_excludeDuplicateAssetVisibilityStateHiddenNumber = v4;
}

- (void)setFetchOffset:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  fetchOffsetNumber = self->_fetchOffsetNumber;
  self->_fetchOffsetNumber = v4;
}

+ (PHFetchOptions)fetchOptionsWithInclusiveDefaultsForPhotoLibrary:(id)a3
{
  uint64_t v3 = [a3 librarySpecificFetchOptions];
  [v3 setIncludeHiddenAssets:1];
  [v3 setIncludeAllBurstAssets:1];

  return (PHFetchOptions *)v3;
}

+ (PHFetchOptions)fetchOptionsWithInclusiveDefaults
{
  uint64_t v3 = +[PHPhotoLibrary sharedPhotoLibrary];
  id v4 = [a1 fetchOptionsWithInclusiveDefaultsForPhotoLibrary:v3];

  return (PHFetchOptions *)v4;
}

@end