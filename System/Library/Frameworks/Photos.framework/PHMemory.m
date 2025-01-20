@interface PHMemory
+ (BOOL)isTriggeredMemoryCategory:(unint64_t)a3;
+ (BOOL)managedObjectSupportsCreationType;
+ (BOOL)managedObjectSupportsPendingState;
+ (BOOL)managedObjectSupportsRejectedState;
+ (BOOL)managedObjectSupportsSharingComposition;
+ (BOOL)managedObjectSupportsTrashedState;
+ (Class)propertySetClassForPropertySet:(id)a3;
+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3;
+ (id)_fetchOptionsForTransientMemoryAssetsWithOptions:(id)a3;
+ (id)assetListPredicateFromQueryHintObjects:(id)a3;
+ (id)blockedPersonLocalIdentifiersInPhotoLibrary:(id)a3;
+ (id)corePropertiesToFetch;
+ (id)entityKeyMap;
+ (id)fetchBestRecentMemoryWithOptions:(id)a3;
+ (id)fetchBlockedMemoriesWithOptions:(id)a3;
+ (id)fetchMemoriesWithGraphMemoryIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchMemoriesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchMemoriesWithNilLastEnrichmentDateWithOptions:(id)a3;
+ (id)fetchMemoriesWithOptions:(id)a3;
+ (id)fetchMemoriesWithUserFeedbackWithOptions:(id)a3;
+ (id)fetchMemoryWithGraphMemoryIdentifier:(id)a3 options:(id)a4;
+ (id)fetchMostRelevantMemoryAtDate:(id)a3 options:(id)a4;
+ (id)fetchMostRelevantMemoryWithOptions:(id)a3;
+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3;
+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4;
+ (id)fetchPredicateFromUserCreatedComparisonPredicate:(id)a3;
+ (id)fetchType;
+ (id)filteredAndSortedPreviewAssetsByScoreFromAssets:(id)a3 targetSize:(CGSize)a4;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)memoriesWithBlockedPersonFeatureInPhotoLibrary:(id)a3;
+ (id)mostRelevantMemoryInMemories:(id)a3 atDate:(id)a4;
+ (id)movieDataWithTitleFontName:(id)a3;
+ (id)previewCandidatesFromAssets:(id)a3;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)propertySetAccessorsByPropertySet;
+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3;
+ (id)stringForCategory:(unint64_t)a3;
+ (id)stringForFeaturedState:(int64_t)a3;
+ (id)stringForNotificationState:(unint64_t)a3;
+ (id)stringForSubcategory:(unint64_t)a3;
+ (id)stringForTriggerType:(unint64_t)a3;
+ (id)titleFontNameFromMovieData:(id)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (id)transientMemoryWithInfo:(id)a3 photoLibrary:(id)a4;
+ (unint64_t)_contextualScoreForMemory:(id)a3;
+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3;
+ (void)clearCurrentMemoryForURLNavigation;
+ (void)generateMemoriesWithOptions:(id)a3 completion:(id)a4;
+ (void)setCurrentMemoryForURLNavigation:(id)a3;
- (BOOL)canContainAssets;
- (BOOL)canPerformEditOperation:(int64_t)a3;
- (BOOL)canShowAvalancheStacks;
- (BOOL)collectionHasFixedOrder;
- (BOOL)hasBlockableFeature;
- (BOOL)isBadgeable;
- (BOOL)isContiguous;
- (BOOL)isCurrentlyRelevant;
- (BOOL)isFavorite;
- (BOOL)isGenerative;
- (BOOL)isGreat;
- (BOOL)isMustSee;
- (BOOL)isPending;
- (BOOL)isPresentedFromURLNavigation;
- (BOOL)isRejected;
- (BOOL)isRelevantAtDate:(id)a3;
- (BOOL)isStellar;
- (BOOL)isTransient;
- (BOOL)isUserCreated;
- (Class)changeRequestClass;
- (NSArray)blockableFeatures;
- (NSArray)triggerTypes;
- (NSData)assetListPredicate;
- (NSData)movieData;
- (NSDate)endDate;
- (NSDate)lastEnrichmentDate;
- (NSDate)lastMoviePlayedDate;
- (NSDate)lastViewedDate;
- (NSDate)startDate;
- (NSDictionary)musicGenreDistribution;
- (NSDictionary)photosGraphProperties;
- (NSSet)featuredPersonLocalIdentifiers;
- (NSString)URLNavigationSourceIdentifier;
- (NSString)graphMemoryIdentifier;
- (NSString)storyTitleCategory;
- (NSString)storyTitleCategoryRaw;
- (NSString)subtitle;
- (PHMemory)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (PHMemoryFeature)blacklistedFeature;
- (double)_evaluatedDurationWithNumberOfStillPhotos:(unint64_t)a3 numberOfLivePhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 options:(id)a6;
- (double)currentRelevanceScore;
- (double)relevanceScoreAtDate:(id)a3;
- (double)score;
- (id)_createPropertyObjectOfClass:(Class)a3;
- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4;
- (id)_curatedAssetIDsWithLibrary:(id)a3;
- (id)_extendedCuratedAssetIDsWithLibrary:(id)a3;
- (id)_predicateForImages;
- (id)_predicateForLivePhotos;
- (id)_predicateForVideos;
- (id)_representativeAndCuratedAssetIDs;
- (id)creationDate;
- (id)curationOfLength:(unint64_t)a3 options:(id)a4 error:(id *)a5;
- (id)defaultSortDescriptor;
- (id)description;
- (id)extractGenerativeMemoryMusicCuration;
- (id)fetchAssetsWithCurationOfLength:(unint64_t)a3 options:(id)a4 error:(id *)a5;
- (id)fetchPreviewAssetForLength:(unint64_t)a3 targetSize:(CGSize)a4;
- (id)localizedSubtitle;
- (id)meaningLabels;
- (id)moodKeywords;
- (id)movieStateDataForAsset:(id)a3;
- (id)predicateForAllAssetsWithLibrary:(id)a3;
- (id)predicateForAllMomentsFromRepresentativeAssets;
- (id)predicateForAssetsContainedInMomentsFromRepresentativeAssets;
- (id)presentationHints;
- (id)query;
- (id)queryForCuratedAssetsWithOptions:(id)a3;
- (id)queryForExtendedCuratedAssetsWithOptions:(id)a3;
- (id)queryForKeyAssetWithOptions:(id)a3;
- (id)rankedPreviewAssetsForLength:(unint64_t)a3 targetSize:(CGSize)a4;
- (id)rejectionCause;
- (id)titleFontName;
- (id)transientMemoryStartDate;
- (id)transientRepresentativeAndCuratedAssetIDs;
- (id)userFeedbackProperties;
- (int64_t)featuredState;
- (int64_t)photosGraphVersion;
- (int64_t)playCount;
- (int64_t)shareCount;
- (int64_t)storyColorGradeKind;
- (int64_t)storyColorGradeKindRaw;
- (int64_t)titleCategory;
- (int64_t)viewCount;
- (unint64_t)_fetchNumberOfAssetsWithType:(unint64_t)a3 predicate:(id)a4;
- (unint64_t)_numberOfAssetsWithType:(unint64_t)a3 optionsValue:(id)a4 predicate:(id)a5;
- (unint64_t)availableCurationLengthsWithOptions:(id)a3;
- (unint64_t)category;
- (unint64_t)currentCurationLengthWithOptions:(id)a3;
- (unint64_t)notificationState;
- (unint64_t)subcategory;
- (unint64_t)suggestedMood;
- (unint64_t)titleFontNameHash;
- (unsigned)creationType;
- (unsigned)pendingState;
- (unsigned)sharingComposition;
- (unsigned)syndicatedContentState;
- (void)_loadValuesFromPhotosGraphProperties;
- (void)setupTransientMemory;
@end

@implementation PHMemory

+ (id)managedEntityName
{
  return @"Memory";
}

+ (BOOL)managedObjectSupportsPendingState
{
  return 1;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 1;
}

+ (BOOL)managedObjectSupportsRejectedState
{
  return 1;
}

+ (BOOL)managedObjectSupportsCreationType
{
  return 1;
}

+ (id)identifierCode
{
  return @"100";
}

- (BOOL)isTransient
{
  return self->_transientMemoryProperties != 0;
}

- (unsigned)pendingState
{
  return self->_pendingState;
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  char v3 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    v7 = [a1 identifierPropertiesToFetch];
    [a1 extendPropertiesToFetch:v5 withProperties:v7];

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = [a1 corePropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v8];

  if ((v3 & 4) != 0) {
LABEL_4:
  }
    [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
LABEL_5:

  return v5;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_15_12802;

  return v2;
}

+ (id)fetchMemoriesWithOptions:(id)a3
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:a3];
}

- (PHMemory)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v63.receiver = self;
  v63.super_class = (Class)PHMemory;
  v10 = [(PHAssetCollection *)&v63 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:v9];
  if (v10)
  {
    v11 = [v8 objectForKeyedSubscript:@"photosGraphVersion"];
    v10->_photosGraphVersion = [v11 longLongValue];

    v12 = [v8 objectForKeyedSubscript:@"category"];
    v10->_category = PHMemoryValidatedMemoryCategory((int)[v12 intValue]);

    v13 = [v8 objectForKeyedSubscript:@"subcategory"];
    v10->_subcategory = PHMemoryValidatedMemorySubcategory((int)[v13 intValue]);

    uint64_t v14 = [v8 objectForKeyedSubscript:@"creationDate"];
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v14;

    uint64_t v16 = [v8 objectForKeyedSubscript:@"movieAssetState"];
    movieAssetState = v10->_movieAssetState;
    v10->_movieAssetState = (NSDictionary *)v16;

    uint64_t v18 = [v8 objectForKeyedSubscript:@"movieData"];
    movieData = v10->_movieData;
    v10->_movieData = (NSData *)v18;

    uint64_t v20 = [v8 objectForKeyedSubscript:@"photosGraphData"];
    photosGraphData = v10->_photosGraphData;
    v10->_photosGraphData = (NSData *)v20;

    v22 = [v8 objectForKeyedSubscript:@"rejected"];
    v10->_rejected = [v22 BOOLValue];

    v23 = [v8 objectForKeyedSubscript:@"favorite"];
    v10->_favorite = [v23 BOOLValue];

    v24 = [v8 objectForKeyedSubscript:@"pendingState"];
    v10->_pendingState = [v24 intValue];

    v25 = [v8 objectForKeyedSubscript:@"creationType"];
    v10->_creationType = [v25 intValue];

    v26 = [v8 objectForKeyedSubscript:@"syndicatedContentState"];
    v10->_syndicatedContentState = [v26 intValue];

    v27 = (void *)MEMORY[0x1E4F8A9A0];
    v28 = [v8 objectForKeyedSubscript:@"userActionOptions"];
    v10->_userCreated = objc_msgSend(v27, "isUserCreatedMemoryWithUserActionOptions:", (unsigned __int16)objc_msgSend(v28, "intValue"));

    uint64_t v29 = [v8 objectForKeyedSubscript:@"subtitle"];
    localizedSubtitle = v10->_localizedSubtitle;
    v10->_localizedSubtitle = (NSString *)v29;

    uint64_t v31 = [v8 objectForKeyedSubscript:@"graphMemoryIdentifier"];
    graphMemoryIdentifier = v10->_graphMemoryIdentifier;
    v10->_graphMemoryIdentifier = (NSString *)v31;

    v33 = [v8 objectForKeyedSubscript:@"storyColorGradeKind"];
    v10->_storyColorGradeKind = (int)[v33 intValue];

    v34 = [v8 objectForKeyedSubscript:@"storySerializedTitleCategory"];
    [v34 intValue];
    uint64_t v35 = PFStoryValidatedTitleCategory();
    storyTitleCategory = v10->_storyTitleCategory;
    v10->_storyTitleCategory = (NSString *)v35;

    v37 = [v8 objectForKeyedSubscript:@"score"];
    [v37 doubleValue];
    v10->_score = v38;

    uint64_t v39 = [v8 objectForKeyedSubscript:@"lastViewedDate"];
    lastViewedDate = v10->_lastViewedDate;
    v10->_lastViewedDate = (NSDate *)v39;

    uint64_t v41 = [v8 objectForKeyedSubscript:@"lastMoviePlayedDate"];
    lastMoviePlayedDate = v10->_lastMoviePlayedDate;
    v10->_lastMoviePlayedDate = (NSDate *)v41;

    uint64_t v43 = [v8 objectForKeyedSubscript:@"lastEnrichmentDate"];
    lastEnrichmentDate = v10->_lastEnrichmentDate;
    v10->_lastEnrichmentDate = (NSDate *)v43;

    uint64_t v45 = [v8 objectForKeyedSubscript:@"assetListPredicate"];
    assetListPredicate = v10->_assetListPredicate;
    v10->_assetListPredicate = (NSData *)v45;

    v47 = [v8 objectForKeyedSubscript:@"notificationState"];
    v10->_notificationState = (int)[v47 intValue];

    v48 = [v8 objectForKeyedSubscript:@"featuredState"];
    v10->_featuredState = (int)[v48 intValue];

    v49 = [v8 objectForKeyedSubscript:@"blacklistedFeature"];
    if (v49)
    {
      v50 = +[PHMemoryFeature memoryFeatureWithData:v49 photoLibrary:v9];
    }
    else
    {
      v50 = 0;
    }
    objc_storeStrong((id *)&v10->_blacklistedFeature, v50);
    if (v49) {

    }
    v51 = [v8 objectForKeyedSubscript:@"playCount"];
    v10->_syncedPlayCount = [v51 longLongValue];

    v52 = [v8 objectForKeyedSubscript:@"shareCount"];
    v10->_syncedShareCount = [v52 longLongValue];

    v53 = [v8 objectForKeyedSubscript:@"viewCount"];
    v10->_syncedViewCount = [v53 longLongValue];

    v54 = [v8 objectForKeyedSubscript:@"pendingPlayCount"];
    v10->_pendingPlayCount = [v54 longLongValue];

    v55 = [v8 objectForKeyedSubscript:@"pendingShareCount"];
    v10->_pendingShareCount = [v55 longLongValue];

    v56 = [v8 objectForKeyedSubscript:@"pendingViewCount"];
    v10->_pendingViewCount = [v56 longLongValue];

    v10->super._assetCollectionType = 4;
    v57 = [v8 objectForKeyedSubscript:@"sharingComposition"];
    v10->_sharingComposition = [v57 unsignedIntegerValue];

    uint64_t v58 = [v8 objectForKeyedSubscript:@"startDate"];
    startDate = v10->super._startDate;
    v10->super._startDate = (NSDate *)v58;

    uint64_t v60 = [v8 objectForKeyedSubscript:@"endDate"];
    endDate = v10->super._endDate;
    v10->super._endDate = (NSDate *)v60;
  }
  return v10;
}

void __24__PHMemory_entityKeyMap__block_invoke()
{
  v57[26] = *MEMORY[0x1E4F143B8];
  v23 = [PHEntityKeyMap alloc];
  v55 = @"objectID";
  v56[0] = @"objectID";
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v57[0] = v29;
  v56[1] = @"uuid";
  v54 = @"uuid";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v57[1] = v28;
  v56[2] = @"title";
  v53[0] = @"localizedTitle";
  v53[1] = @"title";
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  v57[2] = v27;
  v56[3] = @"subtitle";
  v52[0] = @"localizedSubtitle";
  v52[1] = @"subtitle";
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  v57[3] = v26;
  v56[4] = @"graphMemoryIdentifier";
  v51 = @"graphMemoryIdentifier";
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v57[4] = v25;
  v56[5] = @"storyColorGradeKind";
  v50 = @"storyColorGradeKind";
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v57[5] = v24;
  v56[6] = @"storySerializedTitleCategory";
  v49 = @"storyTitleCategory";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v57[6] = v22;
  v56[7] = @"creationDate";
  v48 = @"creationDate";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v57[7] = v21;
  v56[8] = @"photosGraphVersion";
  v47 = @"photosGraphVersion";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v57[8] = v20;
  v56[9] = @"rejected";
  v46 = @"rejected";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v57[9] = v19;
  v56[10] = @"favorite";
  uint64_t v45 = @"favorite";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v57[10] = v18;
  v56[11] = @"pendingState";
  v44 = @"pendingState";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v57[11] = v17;
  v56[12] = @"creationType";
  uint64_t v43 = @"creationType";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v57[12] = v16;
  v56[13] = @"syndicatedContentState";
  v42 = @"syndicatedContentState";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v57[13] = v15;
  v56[14] = @"userActionOptions";
  uint64_t v41 = @"userCreated";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v57[14] = v14;
  v56[15] = @"subcategory";
  v40 = @"subcategory";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v57[15] = v13;
  v56[16] = @"score";
  uint64_t v39 = @"score";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v57[16] = v12;
  v56[17] = @"notificationState";
  double v38 = @"notificationState";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v57[17] = v0;
  v56[18] = @"featuredState";
  v37 = @"featuredState";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v57[18] = v1;
  v56[19] = @"blacklistedFeature";
  v36 = @"blacklistedFeature";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v57[19] = v2;
  v56[20] = @"category";
  uint64_t v35 = @"category";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v57[20] = v3;
  v56[21] = @"lastViewedDate";
  v34 = @"lastViewedDate";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v57[21] = v4;
  v56[22] = @"viewCount";
  v33 = @"viewCount";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v57[22] = v5;
  v56[23] = @"sharingComposition";
  v32 = @"sharingComposition";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v57[23] = v6;
  v56[24] = @"startDate";
  uint64_t v31 = @"startDate";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v57[24] = v7;
  v56[25] = @"endDate";
  v30 = @"endDate";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v57[25] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:26];
  uint64_t v10 = [(PHEntityKeyMap *)v23 initWithPropertyKeysByEntityKey:v9];
  v11 = (void *)entityKeyMap_pl_once_object_15_12802;
  entityKeyMap_pl_once_object_15_12802 = v10;
}

void __38__PHMemory_propertiesToFetchWithHint___block_invoke_328(uint64_t a1)
{
  v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_12810;
  char v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 48) _composePropertiesToFetchWithHint:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_12810;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v10 setObject:v12 forKey:v11];
  }
}

void __38__PHMemory_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_12810;
  propertiesToFetchWithHint__propertiesToFetchByHint_12810 = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.personpropertyhints", 0);
  char v3 = (void *)propertiesToFetchWithHint__propertyQueue_12809;
  propertiesToFetchWithHint__propertyQueue_12809 = (uint64_t)v2;
}

void __33__PHMemory_corePropertiesToFetch__block_invoke()
{
  v4[36] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v0 setName:@"objectID"];
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setExpression:v1];

  [v0 setExpressionResultType:2000];
  v4[0] = v0;
  v4[1] = @"category";
  v4[2] = @"subcategory";
  v4[3] = @"creationDate";
  v4[4] = @"movieAssetState";
  v4[5] = @"movieData";
  v4[6] = @"photosGraphData";
  v4[7] = @"photosGraphVersion";
  v4[8] = @"rejected";
  v4[9] = @"favorite";
  v4[10] = @"pendingState";
  v4[11] = @"creationType";
  v4[12] = @"syndicatedContentState";
  v4[13] = @"userActionOptions";
  v4[14] = @"subtitle";
  v4[15] = @"title";
  v4[16] = @"graphMemoryIdentifier";
  v4[17] = @"storyColorGradeKind";
  v4[18] = @"storySerializedTitleCategory";
  v4[19] = @"score";
  v4[20] = @"lastViewedDate";
  v4[21] = @"lastMoviePlayedDate";
  v4[22] = @"lastEnrichmentDate";
  v4[23] = @"assetListPredicate";
  v4[24] = @"notificationState";
  v4[25] = @"featuredState";
  v4[26] = @"blacklistedFeature";
  v4[27] = @"playCount";
  v4[28] = @"shareCount";
  v4[29] = @"viewCount";
  v4[30] = @"pendingPlayCount";
  v4[31] = @"pendingShareCount";
  v4[32] = @"pendingViewCount";
  v4[33] = @"sharingComposition";
  v4[34] = @"startDate";
  v4[35] = @"endDate";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:36];
  char v3 = (void *)corePropertiesToFetch_array;
  corePropertiesToFetch_array = v2;
}

- (NSString)storyTitleCategory
{
  storyTitleCategory = self->_storyTitleCategory;
  if (!storyTitleCategory)
  {
    [(PHMemory *)self _loadValuesFromPhotosGraphProperties];
    storyTitleCategory = self->_storyTitleCategory;
  }

  return storyTitleCategory;
}

- (NSDate)startDate
{
  return self->super._startDate;
}

- (NSDictionary)photosGraphProperties
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  photosGraphProperties = self->_photosGraphProperties;
  if (!photosGraphProperties)
  {
    if (self->_photosGraphData)
    {
      v17 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v18 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      v11 = objc_msgSend(v17, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
      photosGraphData = self->_photosGraphData;
      id v19 = 0;
      v13 = [v18 unarchivedObjectOfClasses:v11 fromData:photosGraphData error:&v19];
      id v14 = v19;
      v15 = self->_photosGraphProperties;
      self->_photosGraphProperties = v13;

      if (!self->_photosGraphProperties)
      {
        self->_photosGraphProperties = (NSDictionary *)MEMORY[0x1E4F1CC08];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v14;
          _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving photosGraphData from Memory: %@", buf, 0xCu);
        }
      }

      photosGraphProperties = self->_photosGraphProperties;
    }
    else
    {
      photosGraphProperties = 0;
    }
  }

  return photosGraphProperties;
}

- (id)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (BOOL)isRejected
{
  return self->_rejected;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (NSDate)endDate
{
  return self->super._endDate;
}

- (void)_loadValuesFromPhotosGraphProperties
{
  if (!self->_didLoadPhotosGraphProperties)
  {
    id v9 = [(PHMemory *)self photosGraphProperties];
    char v3 = [v9 objectForKeyedSubscript:@"titleCategory"];
    self->_titleCategory = [v3 integerValue];

    if (!self->_storyTitleCategory)
    {
      uint64_t v4 = [v9 objectForKeyedSubscript:@"storyTitleCategory"];
      storyTitleCategory = self->_storyTitleCategory;
      self->_storyTitleCategory = v4;
    }
    uint64_t v6 = v9;
    if (!self->_storyColorGradeKind)
    {
      uint64_t v7 = [v9 objectForKeyedSubscript:@"storyColorGradeKind"];
      self->_storyColorGradeKind = [v7 integerValue];

      uint64_t v6 = v9;
      if (!self->_storyColorGradeKind)
      {
        uint64_t v8 = [v9 objectForKeyedSubscript:@"storyColorGradeCategory"];
        self->_storyColorGradeKind = PFStoryColorGradeKindDefaultForColorGradeCategory();

        uint64_t v6 = v9;
      }
    }
    self->_didLoadPhotosGraphProperties = 1;
  }
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v3 = a3;
  if ([@"PHMemoryPropertySetIdentifier" length]) {
    unint64_t v4 = [v3 containsObject:@"PHMemoryPropertySetIdentifier"];
  }
  else {
    unint64_t v4 = 0;
  }
  if ([@"PHMemoryPropertySetCore" length]
    && [v3 containsObject:@"PHMemoryPropertySetCore"])
  {
    v4 |= 2uLL;
  }
  if ([@"PHMemoryPropertySetUserFeedback" length]
    && [v3 containsObject:@"PHMemoryPropertySetUserFeedback"])
  {
    v4 |= 4uLL;
  }
  if (![v3 containsObject:@"PHMemoryPropertySetIdentifier"]) {
    v4 |= 2uLL;
  }

  return v4;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_12807 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_12807, &__block_literal_global_12808);
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__12540;
  id v9 = __Block_byref_object_dispose__12541;
  id v10 = 0;
  pl_dispatch_sync();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

+ (id)corePropertiesToFetch
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PHMemory_corePropertiesToFetch__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (corePropertiesToFetch_onceToken != -1) {
    dispatch_once(&corePropertiesToFetch_onceToken, block);
  }
  uint64_t v2 = (void *)corePropertiesToFetch_array;

  return v2;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  char v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [@"PHMemoryPropertySetIdentifier" length];
  if ((v3 & 1) != 0 && v5) {
    [v4 addObject:@"PHMemoryPropertySetIdentifier"];
  }
  uint64_t v6 = [@"PHMemoryPropertySetCore" length];
  if ((v3 & 2) != 0 && v6) {
    [v4 addObject:@"PHMemoryPropertySetCore"];
  }
  uint64_t v7 = [@"PHMemoryPropertySetUserFeedback" length];
  if ((v3 & 4) != 0 && v7) {
    [v4 addObject:@"PHMemoryPropertySetUserFeedback"];
  }
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithSet:v4];

  return v8;
}

+ (id)propertySetAccessorsByPropertySet
{
  if (propertySetAccessorsByPropertySet_onceToken_12525 != -1) {
    dispatch_once(&propertySetAccessorsByPropertySet_onceToken_12525, &__block_literal_global_987);
  }
  uint64_t v2 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_12526;

  return v2;
}

void __45__PHMemory_propertySetAccessorsByPropertySet__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHMemoryPropertySetIdentifier";
  v2[1] = @"PHMemoryPropertySetCore";
  v3[0] = @"self";
  v3[1] = @"self";
  v2[2] = @"PHMemoryPropertySetUserFeedback";
  v3[2] = @"userFeedbackProperties";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_12526;
  propertySetAccessorsByPropertySet_accessorByPropertySetName_12526 = v0;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  uint64_t v3 = propertySetClassForPropertySet__onceToken_12528;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&propertySetClassForPropertySet__onceToken_12528, &__block_literal_global_985);
  }
  uint64_t v5 = [(id)propertySetClassForPropertySet__propertySetClassByPropertySetName_12529 objectForKey:v4];

  return (Class)v5;
}

void __43__PHMemory_propertySetClassForPropertySet___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHMemoryPropertySetIdentifier";
  v3[0] = objc_opt_class();
  v2[1] = @"PHMemoryPropertySetCore";
  v3[1] = objc_opt_class();
  v2[2] = @"PHMemoryPropertySetUserFeedback";
  v3[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)propertySetClassForPropertySet__propertySetClassByPropertySetName_12529;
  propertySetClassForPropertySet__propertySetClassByPropertySetName_12529 = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosGraphProperties, 0);
  objc_storeStrong((id *)&self->_blacklistedFeature, 0);
  objc_storeStrong((id *)&self->_assetListPredicate, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_storyTitleCategory, 0);
  objc_storeStrong((id *)&self->_graphMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_lastEnrichmentDate, 0);
  objc_storeStrong((id *)&self->_lastMoviePlayedDate, 0);
  objc_storeStrong((id *)&self->_lastViewedDate, 0);
  objc_storeStrong((id *)&self->_movieData, 0);
  objc_storeStrong((id *)&self->_movieAssetState, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_transientMemoryProperties, 0);
  objc_storeStrong((id *)&self->_photosGraphData, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (PHMemoryFeature)blacklistedFeature
{
  return self->_blacklistedFeature;
}

- (NSData)assetListPredicate
{
  return self->_assetListPredicate;
}

- (NSDate)lastEnrichmentDate
{
  return self->_lastEnrichmentDate;
}

- (NSDate)lastMoviePlayedDate
{
  return self->_lastMoviePlayedDate;
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (double)score
{
  return self->_score;
}

- (int64_t)photosGraphVersion
{
  return self->_photosGraphVersion;
}

- (NSData)movieData
{
  return self->_movieData;
}

- (NSString)graphMemoryIdentifier
{
  return self->_graphMemoryIdentifier;
}

- (BOOL)isUserCreated
{
  return self->_userCreated;
}

- (unsigned)syndicatedContentState
{
  return self->_syndicatedContentState;
}

- (unsigned)creationType
{
  return self->_creationType;
}

- (int64_t)featuredState
{
  return self->_featuredState;
}

- (unint64_t)notificationState
{
  return self->_notificationState;
}

- (unint64_t)subcategory
{
  return self->_subcategory;
}

- (unint64_t)category
{
  return self->_category;
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (id)userFeedbackProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:4];
  uint64_t v3 = objc_opt_class();

  return [(PHMemory *)self _createPropertyObjectOfClass:v3];
}

- (id)_createPropertyObjectOfClass:(Class)a3
{
  return [(PHMemory *)self _createPropertyObjectOfClass:a3 preFetchedProperties:0];
}

- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  id v6 = a4;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__12540;
  v46 = __Block_byref_object_dispose__12541;
  ph_objc_getAssociatedObject(self, a3);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)v43[5];
  if (!v7)
  {
    uint64_t v8 = [(objc_class *)a3 keyPathToPrimaryObject];
    if (v6)
    {
      uint64_t v9 = [[a3 alloc] initWithFetchDictionary:v6 memory:self prefetched:1];
      id v10 = (__CFString *)v43[5];
      v43[5] = v9;
    }
    else
    {
      uint64_t v11 = [(objc_class *)a3 entityName];
      id v12 = (void *)v11;
      v13 = @"Memory";
      if (v11) {
        v13 = (__CFString *)v11;
      }
      id v14 = v13;

      v15 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v16 = [(PHObject *)self objectID];
      if (v8) {
        [v15 predicateWithFormat:@"%K == %@", v8, v16];
      }
      else {
      uint64_t v17 = [v15 predicateWithFormat:@"self == %@", v16];
      }

      uint64_t v18 = [(objc_class *)a3 propertiesToFetch];
      if (objc_opt_respondsToSelector())
      {
        v32 = [(objc_class *)a3 propertiesToSortBy];
        id v19 = (void *)v17;
        uint64_t v20 = v14;
      }
      else
      {
        id v19 = (void *)v17;
        uint64_t v20 = v14;
        v32 = 0;
      }
      id v21 = [(PHObject *)self photoLibrary];
      uint64_t v22 = [(objc_class *)a3 propertySetName];
      v23 = [v21 objectFetchingManagedObjectContextForObject:self propertySet:v22];

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __62__PHMemory__createPropertyObjectOfClass_preFetchedProperties___block_invoke;
      v33[3] = &unk_1E5845E20;
      id v10 = v20;
      v34 = v10;
      id v24 = v19;
      id v35 = v24;
      id v25 = v18;
      id v36 = v25;
      id v26 = v32;
      id v37 = v26;
      id v27 = v23;
      id v38 = v27;
      uint64_t v39 = self;
      v40 = &v42;
      Class v41 = a3;
      [v27 performBlockAndWait:v33];
    }
    uint64_t v28 = ph_objc_setAssociatedObjectIfNotSet(self, a3, (void *)v43[5]);
    uint64_t v29 = (void *)v43[5];
    v43[5] = v28;

    uint64_t v7 = (void *)v43[5];
  }
  id v30 = v7;
  _Block_object_dispose(&v42, 8);

  return v30;
}

void __62__PHMemory__createPropertyObjectOfClass_preFetchedProperties___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  [v2 setPredicate:*(void *)(a1 + 40)];
  [v2 setPropertiesToFetch:*(void *)(a1 + 48)];
  [v2 setResultType:2];
  if ([*(id *)(a1 + 56) count]) {
    [v2 setSortDescriptors:*(void *)(a1 + 56)];
  }
  uint64_t v3 = *(void **)(a1 + 64);
  id v13 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v13];
  id v5 = v13;
  if (!v4)
  {
    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 88) description];
      uint64_t v9 = [*(id *)(a1 + 72) uuid];
      *(_DWORD *)buf = 138412802;
      v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);
    }
    goto LABEL_9;
  }
  id v6 = [v4 firstObject];
  if (!v6) {
LABEL_9:
  }
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  uint64_t v10 = [objc_alloc(*(Class *)(a1 + 88)) initWithFetchDictionary:v6 memory:*(void *)(a1 + 72) prefetched:0];
  uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (double)currentRelevanceScore
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [(PHMemory *)self relevanceScoreAtDate:v3];
  double v5 = v4;

  return v5;
}

- (BOOL)isCurrentlyRelevant
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(self) = [(PHMemory *)self isRelevantAtDate:v3];

  return (char)self;
}

- (BOOL)isBadgeable
{
  uint64_t v3 = [(PHMemory *)self lastViewedDate];

  if (v3
    || [(PHMemory *)self pendingState] != 1
    || [(PHMemory *)self featuredState] != 1)
  {
    return 0;
  }
  if ([(PHMemory *)self isStellar]) {
    return 1;
  }

  return [(PHMemory *)self isMustSee];
}

- (BOOL)isGreat
{
  [(PHMemory *)self score];
  return v2 > 0.25;
}

- (BOOL)isStellar
{
  [(PHMemory *)self score];
  return v2 > 0.5;
}

- (BOOL)isMustSee
{
  [(PHMemory *)self score];
  return v2 > 0.75;
}

- (id)presentationHints
{
  double v2 = [[PHMemoryPresentationHints alloc] initWithMemory:self];

  return v2;
}

- (NSDictionary)musicGenreDistribution
{
  double v2 = [(PHMemory *)self photosGraphProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"info"];

  double v4 = [v3 objectForKeyedSubscript:@"musicGenreDistribution"];
  double v5 = v4;
  if (!v4) {
    double v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v6 = v4;

  return v6;
}

- (id)meaningLabels
{
  double v2 = [(PHMemory *)self photosGraphProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"info"];

  double v4 = [v3 objectForKeyedSubscript:@"meaningLabels"];

  return v4;
}

- (id)moodKeywords
{
  double v2 = [(PHMemory *)self photosGraphProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"info"];

  double v4 = [v3 objectForKeyedSubscript:@"moodKeywords"];

  return v4;
}

- (unint64_t)suggestedMood
{
  double v2 = [(PHMemory *)self photosGraphProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"info"];

  double v4 = [v3 objectForKeyedSubscript:@"suggestedMood"];
  unint64_t v5 = PHMemoryMoodForString(v4);

  return v5;
}

- (NSString)storyTitleCategoryRaw
{
  return self->_storyTitleCategory;
}

- (int64_t)storyColorGradeKindRaw
{
  return self->_storyColorGradeKind;
}

- (int64_t)storyColorGradeKind
{
  int64_t result = self->_storyColorGradeKind;
  if (!result)
  {
    [(PHMemory *)self _loadValuesFromPhotosGraphProperties];
    return self->_storyColorGradeKind;
  }
  return result;
}

- (NSArray)triggerTypes
{
  double v2 = [(PHMemory *)self photosGraphProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"triggerTypes"];

  return (NSArray *)v3;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)PHMemory;
  uint64_t v3 = [(PHAssetCollection *)&v14 description];
  unsigned int v13 = [(PHMemory *)self pendingState];
  unsigned int v4 = [(PHMemory *)self creationType];
  BOOL v5 = [(PHMemory *)self isFavorite];
  BOOL v6 = [(PHMemory *)self isUserCreated];
  BOOL v7 = [(PHMemory *)self isRejected];
  unint64_t v8 = [(PHMemory *)self category];
  unint64_t v9 = [(PHMemory *)self subcategory];
  uint64_t v10 = [(PHMemory *)self creationDate];
  uint64_t v11 = [v3 stringByAppendingFormat:@" pendingState:%d, creationType:%d, fav:%d, user:%d, reject:%d [%d/%d - %@], featuredState: %d, syndicatedContentState: %d", v13, v4, v5, v6, v7, v8, v9, v10, -[PHMemory featuredState](self, "featuredState"), -[PHMemory syndicatedContentState](self, "syndicatedContentState")];

  return v11;
}

- (BOOL)isPending
{
  return [(PHMemory *)self pendingState] == 1;
}

- (id)_extendedCuratedAssetIDsWithLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__12540;
  id v25 = __Block_byref_object_dispose__12541;
  id v26 = 0;
  BOOL v5 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v6 = [MEMORY[0x1E4F8A950] entityName];
  BOOL v7 = [v5 fetchRequestWithEntityName:v6];

  unint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  unint64_t v9 = [(PHObject *)self objectID];
  uint64_t v10 = [v8 predicateWithFormat:@"memoriesBeingExtendedCuratedAssets CONTAINS %@", v9];
  [v7 setPredicate:v10];

  [v7 setResultType:1];
  [v7 setIncludesPropertyValues:0];
  uint64_t v11 = [v4 managedObjectContextForCurrentQueueQoS];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__PHMemory__extendedCuratedAssetIDsWithLibrary___block_invoke;
  v16[3] = &unk_1E58480A0;
  uint64_t v20 = &v21;
  id v12 = v11;
  id v17 = v12;
  id v13 = v7;
  id v18 = v13;
  id v19 = self;
  [v12 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v14;
}

void __48__PHMemory__extendedCuratedAssetIDsWithLibrary___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v12 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v12];
  id v5 = v12;
  uint64_t v6 = *(void *)(a1[7] + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    unint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[6];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Can't fetch extended curated asset IDs for %@: %@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1[7] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

- (id)_curatedAssetIDsWithLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__12540;
  id v25 = __Block_byref_object_dispose__12541;
  id v26 = 0;
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v6 = [MEMORY[0x1E4F8A950] entityName];
  BOOL v7 = [v5 fetchRequestWithEntityName:v6];

  unint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v9 = [(PHObject *)self objectID];
  uint64_t v10 = [v8 predicateWithFormat:@"memoriesBeingCuratedAssets CONTAINS %@", v9];
  [v7 setPredicate:v10];

  [v7 setResultType:1];
  [v7 setIncludesPropertyValues:0];
  uint64_t v11 = [v4 managedObjectContextForCurrentQueueQoS];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__PHMemory__curatedAssetIDsWithLibrary___block_invoke;
  v16[3] = &unk_1E58480A0;
  uint64_t v20 = &v21;
  id v12 = v11;
  id v17 = v12;
  id v13 = v7;
  id v18 = v13;
  id v19 = self;
  [v12 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v14;
}

void __40__PHMemory__curatedAssetIDsWithLibrary___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v12 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v12];
  id v5 = v12;
  uint64_t v6 = *(void *)(a1[7] + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    unint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[6];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Can't fetch curated asset IDs for %@: %@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1[7] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

- (id)_representativeAndCuratedAssetIDs
{
  if ([(PHMemory *)self isTransient])
  {
    id v3 = [(PHMemory *)self transientRepresentativeAndCuratedAssetIDs];
  }
  else
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__12540;
    uint64_t v22 = __Block_byref_object_dispose__12541;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Memory"];
    id v5 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v6 = [(PHObject *)self uuid];
    BOOL v7 = [v5 predicateWithFormat:@"uuid == %@", v6];
    [v4 setPredicate:v7];

    [v4 setResultType:0];
    [v4 setIncludesPropertyValues:0];
    [v4 setRelationshipKeyPathsForPrefetching:&unk_1EEB26958];
    unint64_t v8 = [(PHObject *)self photoLibrary];
    uint64_t v9 = [v8 managedObjectContextForCurrentQueueQoS];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__PHMemory__representativeAndCuratedAssetIDs__block_invoke;
    v13[3] = &unk_1E58480A0;
    id v10 = v9;
    id v14 = v10;
    id v11 = v4;
    id v15 = v11;
    id v16 = self;
    uint64_t v17 = &v18;
    [v10 performBlockAndWait:v13];
    id v3 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  return v3;
}

void __45__PHMemory__representativeAndCuratedAssetIDs__block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v14 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v14];
  id v5 = v14;
  if (v4)
  {
    uint64_t v6 = [v4 firstObject];
    BOOL v7 = *(void **)(*(void *)(a1[7] + 8) + 40);
    unint64_t v8 = [v6 objectIDsForRelationshipNamed:@"representativeAssets"];
    [v7 addObjectsFromArray:v8];

    uint64_t v9 = *(void **)(*(void *)(a1[7] + 8) + 40);
    id v10 = [v6 objectIDsForRelationshipNamed:@"curatedAssets"];
    [v9 addObjectsFromArray:v10];

    id v11 = *(void **)(*(void *)(a1[7] + 8) + 40);
    id v12 = [v6 objectIDsForRelationshipNamed:@"extendedCuratedAssets"];
    [v11 addObjectsFromArray:v12];
  }
  else
  {
    uint64_t v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = a1[6];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch memory and the related asset ids for %@: %@", buf, 0x16u);
    }
  }
}

- (id)predicateForAllMomentsFromRepresentativeAssets
{
  double v2 = [(PHMemory *)self _representativeAndCuratedAssetIDs];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN (%@)", @"assets", v2];

  return v3;
}

- (id)predicateForAssetsContainedInMomentsFromRepresentativeAssets
{
  double v2 = [(PHMemory *)self _representativeAndCuratedAssetIDs];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN (%@)", @"moment.assets", v2];

  return v3;
}

- (id)predicateForAllAssetsWithLibrary:(id)a3
{
  v74[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHMemory *)self _extendedCuratedAssetIDsWithLibrary:v4];
  if ([v5 count])
  {
    uint64_t v6 = [(PHMemory *)self _curatedAssetIDsWithLibrary:v4];
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN (%@) OR self IN (%@)", v5, v6];

    if (v7) {
      goto LABEL_41;
    }
  }
  uint64_t v8 = [(PHMemory *)self assetListPredicate];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v70 = 0;
    id v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v70];
    id v11 = v70;
    if (!v10)
    {
      id v7 = 0;
      goto LABEL_34;
    }
    uint64_t v12 = [v10 objectForKey:@"albums"];
    uint64_t v13 = [v10 objectForKey:@"persons"];
    id v14 = [v10 objectForKey:@"dateRanges"];
    v59 = (void *)v12;
    if (v12)
    {
      id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY albums.uuid IN (%@) OR ANY albums.cloudGUID in (%@)", v12, v12];
    }
    else
    {
      id v7 = 0;
    }
    id v62 = v11;
    objc_super v63 = v10;
    uint64_t v60 = v14;
    v61 = v13;
    if (!v13)
    {
LABEL_16:
      if (v14)
      {
        v55 = v9;
        v56 = v7;
        v57 = v5;
        id v58 = v4;
        uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v29 = v14;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v66 objects:v73 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v67 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              if ([v34 count] == 2)
              {
                id v35 = [v34 objectAtIndex:0];
                id v36 = [v34 objectAtIndex:1];
                id v37 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@ AND dateCreated <= %@", v35, v36];
                [v28 addObject:v37];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v66 objects:v73 count:16];
          }
          while (v31);
        }

        if ([v28 count])
        {
          id v38 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v28];
          uint64_t v39 = v38;
          id v5 = v57;
          uint64_t v9 = v55;
          uint64_t v13 = v61;
          if (v56)
          {
            v40 = (void *)MEMORY[0x1E4F28BA0];
            v72[0] = v38;
            v72[1] = v56;
            Class v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
            id v7 = [v40 andPredicateWithSubpredicates:v41];
          }
          else
          {
            id v7 = v38;
          }
          id v4 = v58;
        }
        else
        {
          id v5 = v57;
          id v4 = v58;
          id v7 = v56;
          uint64_t v9 = v55;
          uint64_t v13 = v61;
        }

        id v11 = v62;
        id v10 = v63;
        id v14 = v60;
      }

LABEL_34:
      if (v7) {
        goto LABEL_41;
      }
      goto LABEL_35;
    }
    id v15 = v9;
    uint64_t v16 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v4 orObject:self];
    __int16 v17 = +[PHPerson fetchPersonsWithLocalIdentifiers:v13 options:v16];
    uint64_t v18 = [v13 count];
    uint64_t v19 = [v17 count];
    uint64_t v20 = v13;
    uint64_t v21 = (void *)MEMORY[0x1E4F28F60];
    if (v18 == v19)
    {
      uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K.%K IN (%@)", @"detectedFaces", @"personForFace.personUUID", v20];
      if (v7)
      {
LABEL_12:
        id v23 = (void *)MEMORY[0x1E4F28BA0];
        v74[0] = v22;
        v74[1] = v7;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
        v25 = id v24 = v7;
        uint64_t v26 = [v23 andPredicateWithSubpredicates:v25];

        id v7 = (id)v26;
LABEL_15:
        uint64_t v9 = v15;

        id v11 = v62;
        id v10 = v63;
        id v14 = v60;
        uint64_t v13 = v61;
        goto LABEL_16;
      }
    }
    else
    {
      id v27 = [(PHObject *)self objectID];
      uint64_t v22 = [v21 predicateWithFormat:@"memoriesBeingCuratedAssets CONTAINS %@", v27];

      if (v7) {
        goto LABEL_12;
      }
    }
    id v7 = v22;
    goto LABEL_15;
  }
LABEL_35:
  id v7 = [(PHMemory *)self predicateForAssetsContainedInMomentsFromRepresentativeAssets];
  if ([(PHMemory *)self subcategory] == 204 || [(PHMemory *)self subcategory] == 203)
  {
    uint64_t v42 = [(PHMemory *)self featuredPersonLocalIdentifiers];
    uint64_t v43 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v4 orObject:self];
    uint64_t v44 = [v42 allObjects];
    uint64_t v45 = +[PHPerson fetchPersonsWithLocalIdentifiers:v44 options:v43];

    uint64_t v46 = [v42 count];
    if (v46 == [v45 count])
    {
      id v47 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v42, "count"));
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __45__PHMemory_predicateForAllAssetsWithLibrary___block_invoke;
      v64[3] = &unk_1E5843D30;
      v65 = v47;
      id v48 = v47;
      [v42 enumerateObjectsUsingBlock:v64];
      v49 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K.%K IN (%@)", @"detectedFaces", @"personForFace.personUUID", v48];
      v50 = (void *)MEMORY[0x1E4F28BA0];
      v71[0] = v49;
      v71[1] = v7;
      v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
      uint64_t v52 = [v50 andPredicateWithSubpredicates:v51];

      id v7 = v65;
    }
    else
    {
      v53 = (void *)MEMORY[0x1E4F28F60];
      id v48 = [(PHObject *)self objectID];
      uint64_t v52 = [v53 predicateWithFormat:@"memoriesBeingCuratedAssets CONTAINS %@", v48];
    }

    id v7 = (id)v52;
  }
LABEL_41:

  return v7;
}

void __45__PHMemory_predicateForAllAssetsWithLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[PHObject uuidFromLocalIdentifier:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

- (unint64_t)titleFontNameHash
{
  id v3 = [(PHMemory *)self creationDate];
  if (!v3)
  {
    id v4 = +[PHAsset fetchKeyCuratedAssetInAssetCollection:self referenceAsset:0];
    id v5 = [v4 firstObject];

    id v3 = [v5 creationDate];
  }
  unint64_t v6 = +[PHAssetCollection titleFontNameHashFromDate:v3];
  id v7 = [(PHAssetCollection *)self title];
  unint64_t v8 = +[PHAssetCollection titleFontNameHashFromHash:andHash:](PHAssetCollection, "titleFontNameHashFromHash:andHash:", v6, +[PHAssetCollection titleFontNameHashFromString:v7]);

  return v8;
}

- (id)titleFontName
{
  titleFontName = self->_titleFontName;
  if (!titleFontName)
  {
    id v4 = [(PHMemory *)self movieData];
    id v5 = [(id)objc_opt_class() titleFontNameFromMovieData:v4];
    unint64_t v6 = self->_titleFontName;
    self->_titleFontName = v5;

    if (!self->_titleFontName)
    {
      v10.receiver = self;
      v10.super_class = (Class)PHMemory;
      id v7 = [(PHAssetCollection *)&v10 titleFontName];
      unint64_t v8 = self->_titleFontName;
      self->_titleFontName = v7;
    }
    titleFontName = self->_titleFontName;
  }

  return titleFontName;
}

- (BOOL)isGenerative
{
  return self->_creationType == 1;
}

- (id)defaultSortDescriptor
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
}

- (int64_t)viewCount
{
  return self->_pendingViewCount + self->_syncedViewCount;
}

- (int64_t)shareCount
{
  return self->_pendingShareCount + self->_syncedShareCount;
}

- (int64_t)playCount
{
  return self->_pendingPlayCount + self->_syncedPlayCount;
}

- (BOOL)hasBlockableFeature
{
  double v2 = [(PHMemory *)self blockableFeatures];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)blockableFeatures
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PHMemory *)self photosGraphProperties];
  if (v3)
  {
    id v15 = v3;
    id v4 = [v3 objectForKeyedSubscript:@"blacklistableFeatures"];
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = [(PHObject *)self photoLibrary];
          uint64_t v13 = +[PHMemoryFeature memoryFeatureWithData:v11 photoLibrary:v12];

          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    BOOL v3 = v15;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (BOOL)isContiguous
{
  double v2 = [(PHMemory *)self photosGraphProperties];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"info"];
    id v5 = [v4 objectForKeyedSubscript:@"sourceTypeEnum"];

    if (v5)
    {
      uint64_t v6 = [v5 unsignedIntegerValue];
    }
    else
    {
      uint64_t v7 = [v3 objectForKeyedSubscript:@"info"];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"sourceType"];

      if (v8)
      {
        if ([v8 isEqualToString:@"Moment"])
        {
          uint64_t v6 = 1;
        }
        else if ([v8 isEqualToString:@"Contiguous Moments"])
        {
          uint64_t v6 = 2;
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (unint64_t)(v6 - 1) < 2;
}

- (NSSet)featuredPersonLocalIdentifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(PHMemory *)self photosGraphProperties];
  if (!v4) {
    goto LABEL_23;
  }
  [(PHMemory *)self photosGraphVersion];
  unsigned int v5 = PLMemoriesAlgorithmsVersionFromPhotosGraphVersion();
  if (v5 < 0x101)
  {
    long long v16 = [v4 objectForKeyedSubscript:@"featureVector"];
    long long v17 = v16;
    if (v16)
    {
      long long v18 = [v16 objectForKeyedSubscript:@"people"];
      long long v19 = v18;
      if (v18 && [v18 count])
      {
        uint64_t v20 = [MEMORY[0x1E4F1CA80] setWithArray:v19];
LABEL_22:
        uint64_t v21 = (void *)v20;

        BOOL v3 = v21;
        goto LABEL_23;
      }
    }
    else
    {
      long long v19 = 0;
    }
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    goto LABEL_22;
  }
  if (v5 == 257) {
    uint64_t v6 = @"featureVector";
  }
  else {
    uint64_t v6 = @"featureVector_v2";
  }
  [v4 objectForKeyedSubscript:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "firstObject", (void)v23);
        int v14 = [v13 isEqualToString:@"People"];

        if (v14)
        {
          id v15 = [v12 lastObject];
          [v3 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

LABEL_23:

  return (NSSet *)v3;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (BOOL)canShowAvalancheStacks
{
  return 1;
}

- (BOOL)canContainAssets
{
  return 1;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  if (a3 != 7) {
    return 0;
  }
  uint64_t v11 = v4;
  uint64_t v12 = v3;
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  BOOL v9 = [(PHMemory *)self pendingState] != 2 || [(PHMemory *)self featuredState] != 2;
  BOOL v10 = [(PHMemory *)self pendingState] != 2
     || [(PHMemory *)self category] != 19 && [(PHMemory *)self category] != 31;
  return v9 && v10;
}

- (id)creationDate
{
  return self->_creationDate;
}

- (NSString)subtitle
{
  return self->_localizedSubtitle;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (id)movieStateDataForAsset:(id)a3
{
  movieAssetState = self->_movieAssetState;
  uint64_t v4 = [a3 uuid];
  uint64_t v5 = [(NSDictionary *)movieAssetState objectForKey:v4];

  return v5;
}

+ (id)memoriesWithBlockedPersonFeatureInPhotoLibrary:(id)a3
{
  uint64_t v4 = [a3 librarySpecificFetchOptions];
  [v4 setChunkSizeForFetch:200];
  [v4 setCacheSizeForFetch:200];
  uint64_t v5 = [a1 fetchBlockedMemoriesWithOptions:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PHMemory_memoriesWithBlockedPersonFeatureInPhotoLibrary___block_invoke;
  v10[3] = &unk_1E5843D58;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
  uint64_t v8 = [v7 allObjects];

  return v8;
}

void __59__PHMemory_memoriesWithBlockedPersonFeatureInPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 blacklistedFeature];
  uint64_t v4 = [v3 type];

  if (v4 == 1) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

+ (id)blockedPersonLocalIdentifiersInPhotoLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 memoriesWithBlockedPersonFeatureInPhotoLibrary:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "blacklistedFeature", (void)v13);
        id v11 = [v10 personLocalIdentifier];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)fetchMostRelevantMemoryWithOptions:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 date];
  uint64_t v6 = +[PHMemory fetchMostRelevantMemoryAtDate:v5 options:v4];

  return v6;
}

+ (unint64_t)_contextualScoreForMemory:(id)a3
{
  id v3 = a3;
  if ([v3 subcategory] == 210)
  {
    unint64_t v4 = 9;
  }
  else
  {
    uint64_t v6 = [v3 category];
    unint64_t v4 = 8;
    switch(v6)
    {
      case 202:
        unint64_t v4 = 6;
        break;
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 211:
      case 215:
        goto LABEL_8;
      case 209:
        unint64_t v4 = 3;
        break;
      case 210:
        unint64_t v4 = 2;
        break;
      case 212:
        break;
      case 213:
        unint64_t v4 = 7;
        break;
      case 214:
        unint64_t v4 = 1;
        break;
      case 216:
        unint64_t v4 = 5;
        break;
      default:
        if (v6 == 101) {
          unint64_t v4 = 4;
        }
        else {
LABEL_8:
        }
          unint64_t v4 = 0;
        break;
    }
  }

  return v4;
}

+ (id)fetchBestRecentMemoryWithOptions:(id)a3
{
  v73[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v7 = [v6 startOfDayForDate:v5];

  v57 = v7;
  id v58 = v5;
  if (!v4)
  {
    uint64_t v8 = objc_opt_new();
    BOOL v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(creationDate >= %@) && (creationDate <= %@)", v7, v5];
    BOOL v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (category IN %@)", &unk_1EEB26970];
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (subcategory IN %@)", &unk_1EEB26988];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(photosGraphVersion & %d) >= %d", 0xFFFFLL, 512);
    long long v13 = (void *)MEMORY[0x1E4F28BA0];
    v73[0] = v9;
    v73[1] = v10;
    v73[2] = v11;
    v73[3] = v12;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
    long long v15 = [v13 andPredicateWithSubpredicates:v14];

    [v8 setInternalPredicate:v15];
    [v8 setIncludePendingMemories:1];
    long long v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v72 = v16;
    id v4 = v8;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    [v8 setSortDescriptors:v17];

    uint64_t v7 = v57;
    id v5 = v58;
  }
  uint64_t v18 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v4];
  uint64_t v60 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v71 count:16];
  id obj = v19;
  if (v20)
  {
    uint64_t v21 = v20;
    id v56 = v4;
    uint64_t v22 = 0;
    long long v23 = 0;
    uint64_t v24 = *(void *)v62;
    int64_t v25 = 0x8000000000000000;
    float v26 = -3.4028e38;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v62 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v29 = [v28 creationDate];
        if (v22 && ![v60 isDate:v22 inSameDayAsDate:v29])
        {

          goto LABEL_21;
        }
        uint64_t v30 = [a1 _contextualScoreForMemory:v28];
        [v28 score];
        float v32 = v31;
        if (v25 < v30 || (v25 == v30 ? (BOOL v33 = v26 < v32) : (BOOL v33 = 0), v33))
        {
          id v34 = v28;

          id v35 = v29;
          uint64_t v22 = v35;
          float v26 = v32;
          int64_t v25 = v30;
          long long v23 = v34;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
      if (v21) {
        continue;
      }
      break;
    }
LABEL_21:
    id v36 = obj;

    if (v23)
    {
      id v37 = PLPhotoKitGetLog();
      uint64_t v7 = v57;
      id v5 = v58;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v67 = "+[PHMemory fetchBestRecentMemoryWithOptions:]";
        __int16 v68 = 2112;
        long long v69 = v23;
        _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_DEFAULT, "%s: Returning memory %@", buf, 0x16u);
      }
      id v4 = v56;
LABEL_42:

      goto LABEL_43;
    }
    id v4 = v56;
    uint64_t v7 = v57;
    id v5 = v58;
  }
  else
  {

    uint64_t v22 = 0;
  }
  id v38 = [v4 photoLibrary];
  uint64_t v39 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v38 orObject:0];

  [v39 setFetchLimit:1];
  v40 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  id v70 = v40;
  Class v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  [v39 setSortDescriptors:v41];

  uint64_t v42 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v43 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v44 = [v42 predicateWithFormat:@"relevantUntilDate > %@ && type == %d", v43, 4];
  [v39 setPredicate:v44];

  uint64_t v45 = +[PHSuggestion fetchSuggestionsWithOptions:v39];
  if ([v45 count])
  {
    long long v23 = [v45 firstObject];
    uint64_t v46 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v67 = "+[PHMemory fetchBestRecentMemoryWithOptions:]";
      __int16 v68 = 2112;
      long long v69 = v23;
      _os_log_impl(&dword_19B043000, v46, OS_LOG_TYPE_DEFAULT, "%s: Returning on-this-day suggestion %@", buf, 0x16u);
    }

    if (v23) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  id v47 = [v4 photoLibrary];
  id v48 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v47 orObject:0];

  [v48 setFetchLimit:1];
  v49 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v65 = v49;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  [v48 setSortDescriptors:v50];

  v51 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate >= %@ && creationDate <= %@ && (subtype == %d || subtype == %d)", v7, v5, 304, 305];
  [v48 setPredicate:v51];

  uint64_t v52 = +[PHSuggestion fetchSuggestionsWithOptions:v48];
  if (![v52 count])
  {

LABEL_39:
    id v37 = PLPhotoKitGetLog();
    id v36 = obj;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v67 = "+[PHMemory fetchBestRecentMemoryWithOptions:]";
      _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_DEFAULT, "%s: No memory or suggestion found", buf, 0xCu);
    }
    long long v23 = 0;
    goto LABEL_42;
  }
  long long v23 = [v52 firstObject];
  v53 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v67 = "+[PHMemory fetchBestRecentMemoryWithOptions:]";
    __int16 v68 = 2112;
    long long v69 = v23;
    _os_log_impl(&dword_19B043000, v53, OS_LOG_TYPE_DEFAULT, "%s: Returning person centric suggestion %@", buf, 0x16u);
  }

  if (!v23) {
    goto LABEL_39;
  }
LABEL_37:
  id v36 = obj;
LABEL_43:
  id v54 = v23;

  return v54;
}

+ (id)stringForTriggerType:(unint64_t)a3
{
  if (a3 > 0x1B) {
    return @"??";
  }
  else {
    return off_1E5843DD0[a3];
  }
}

+ (BOOL)isTriggeredMemoryCategory:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL result = 1;
  if ((uint64_t)a3 <= 200)
  {
    if (a3 <= 0x20)
    {
      if (((1 << a3) & 0x7FBFFFFE) != 0) {
        return result;
      }
      if (((1 << a3) & 0x180000000) != 0) {
        return 0;
      }
    }
    if (a3 - 101 < 2) {
      return result;
    }
    if (a3 == 100) {
      return 0;
    }
    goto LABEL_11;
  }
  if (a3 - 201 < 0x15) {
    return result;
  }
  if (a3 - 301 >= 2 && a3 != 401)
  {
LABEL_11:
    id v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      unint64_t v7 = a3;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "Invalid memory category %lu", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

+ (id)stringForFeaturedState:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3) {
    return @"Unsupported Featured State";
  }
  else {
    return off_1E5843DB0[a3 + 1];
  }
}

+ (id)stringForNotificationState:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unsupported Notification State";
  }
  else {
    return off_1E5843D98[a3];
  }
}

+ (id)stringForSubcategory:(unint64_t)a3
{
  if ((uint64_t)a3 <= 300)
  {
    if ((uint64_t)a3 > 102)
    {
      switch(a3)
      {
        case 0xC9uLL:
          id result = @"Featured Neighbor";
          break;
        case 0xCAuLL:
          id result = @"Featured People";
          break;
        case 0xCBuLL:
          id result = @"Featured Social Group";
          break;
        case 0xCCuLL:
          id result = @"Featured Person";
          break;
        case 0xCDuLL:
          id result = @"Featured Trip";
          break;
        case 0xCEuLL:
          id result = @"Featured Weekend";
          break;
        case 0xCFuLL:
          id result = @"Featured Some Time";
          break;
        case 0xD0uLL:
          id result = @"Featured Place";
          break;
        case 0xD1uLL:
          id result = @"Featured Special Event";
          break;
        case 0xD2uLL:
          id result = @"Featured Birthday";
          break;
        case 0xD3uLL:
          id result = @"Featured Past Superset";
          break;
        case 0xD4uLL:
          id result = @"Featured Pet";
          break;
        case 0xD5uLL:
          id result = @"Featured Meaningful Event";
          break;
        case 0xD6uLL:
          id result = @"Featured Meaningful Event Aggregate";
          break;
        case 0xD7uLL:
          id result = @"Featured Recurrent Trip";
          break;
        case 0xD8uLL:
          id result = @"Featured People Visiting";
          break;
        case 0xD9uLL:
          id result = @"Featured Baby";
          break;
        case 0xDAuLL:
          id result = @"Featured Foodie";
          break;
        default:
          if (a3 != 103) {
            return @"Unsupported Subcategory";
          }
          id result = @"Event Calendar";
          break;
      }
      return result;
    }
    switch(a3)
    {
      case 0uLL:
        return @"None";
      case 0x65uLL:
        return @"Event People";
      case 0x66uLL:
        return @"Event Holiday";
    }
    return @"Unsupported Subcategory";
  }
  if ((uint64_t)a3 <= 400)
  {
    switch(a3)
    {
      case 0x12DuLL:
        return @"Contextual Location";
      case 0x12EuLL:
        return @"Contextual People";
      case 0x12FuLL:
        return @"Contextual Location and People";
    }
    return @"Unsupported Subcategory";
  }
  switch(a3)
  {
    case 0x3E8uLL:
      id result = @"Story Montage";
      break;
    case 0x3E9uLL:
      id result = @"Story Chronological";
      break;
    case 0x3EAuLL:
      id result = @"Story VisualClusterBased";
      break;
    case 0x3EBuLL:
      id result = @"Story VisualClusterBasedChronologica";
      break;
    default:
      if (a3 != 1100) {
        return @"Unsupported Subcategory";
      }
      id result = @"Story LastResort";
      break;
  }
  return result;
}

+ (id)stringForCategory:(unint64_t)a3
{
  if ((uint64_t)a3 > 100)
  {
    if ((uint64_t)a3 > 300)
    {
      switch(a3)
      {
        case 0x12DuLL:
          return @"Featured";
        case 0x12EuLL:
          return @"Place";
        case 0x191uLL:
          return @"Blocked";
        default:
          return @"Unsupported Category";
      }
    }
    else
    {
      switch(a3)
      {
        case 0xC9uLL:
          id result = @"Year Summary";
          break;
        case 0xCAuLL:
          id result = @"Day in History";
          break;
        case 0xCBuLL:
          id result = @"Last Weekend";
          break;
        case 0xCCuLL:
          id result = @"Last Week";
          break;
        case 0xCDuLL:
          id result = @"This Week";
          break;
        case 0xCEuLL:
          id result = @"Same Day";
          break;
        case 0xCFuLL:
          id result = @"Same Weekend";
          break;
        case 0xD0uLL:
          id result = @"Week in History";
          break;
        case 0xD1uLL:
          id result = @"Recent Past Event";
          break;
        case 0xD2uLL:
          id result = @"Upcoming Related Event";
          break;
        case 0xD3uLL:
          id result = @"Best of Past";
          break;
        case 0xD4uLL:
          id result = @"Celebrated Holiday in History";
          break;
        case 0xD5uLL:
          id result = @"Holiday in History";
          break;
        case 0xD6uLL:
          id result = @"Throwback Thursday";
          break;
        case 0xD7uLL:
          id result = @"Celebration Over Time";
          break;
        case 0xD8uLL:
          id result = @"This Season";
          break;
        case 0xD9uLL:
          id result = @"Season in History";
          break;
        case 0xDAuLL:
          id result = @"Key People for Upcoming Holiday Event";
          break;
        case 0xDBuLL:
          id result = @"Early moments with People";
          break;
        case 0xDCuLL:
          id result = @"People over Time";
          break;
        case 0xDDuLL:
          id result = @"Home Aggregation";
          break;
        default:
          if (a3 == 101)
          {
            id result = @"Contextual";
          }
          else
          {
            if (a3 != 102) {
              return @"Unsupported Category";
            }
            id result = @"Nearby Today";
          }
          break;
      }
    }
  }
  else
  {
    id result = @"Unknown";
    switch(a3)
    {
      case 0uLL:
        return result;
      case 1uLL:
        id result = @"Single Moment";
        break;
      case 2uLL:
        id result = @"Person Over Time";
        break;
      case 3uLL:
        id result = @"Person";
        break;
      case 4uLL:
        id result = @"Early Moments With Person";
        break;
      case 5uLL:
        id result = @"Social Group Over Time";
        break;
      case 6uLL:
        id result = @"Social Group";
        break;
      case 7uLL:
        id result = @"Last Month At Home";
        break;
      case 8uLL:
        id result = @"Year In Review";
        break;
      case 9uLL:
        id result = @"Foodie";
        break;
      case 0xAuLL:
        id result = @"Pet";
        break;
      case 0xBuLL:
        id result = @"Baby";
        break;
      case 0xCuLL:
        id result = @"City Location";
        break;
      case 0xDuLL:
        id result = @"Region Location";
        break;
      case 0xEuLL:
        id result = @"Area Location";
        break;
      case 0xFuLL:
        id result = @"Business Location";
        break;
      case 0x10uLL:
        id result = @"Meaningful Event";
        break;
      case 0x11uLL:
        id result = @"Meaningful Event Aggregation";
        break;
      case 0x12uLL:
        id result = @"Recurrent Trip";
        break;
      case 0x13uLL:
        id result = @"Trip";
        break;
      case 0x14uLL:
        id result = @"Past Superset";
        break;
      case 0x15uLL:
        id result = @"Season";
        break;
      case 0x16uLL:
        return @"Unsupported Category";
      case 0x17uLL:
        id result = @"Day In History Aggregation";
        break;
      case 0x18uLL:
        id result = @"Recent Highlights";
        break;
      case 0x19uLL:
        id result = @"Child Activity";
        break;
      case 0x1AuLL:
        id result = @"Exciting Moments";
        break;
      case 0x1BuLL:
        id result = @"Trends";
        break;
      case 0x1CuLL:
        id result = @"Pet Outdoor";
        break;
      case 0x1DuLL:
        id result = @"Child And Person";
        break;
      case 0x1EuLL:
        id result = @"Child Outdoor";
        break;
      case 0x1FuLL:
        id result = @"Ongoing Trip";
        break;
      case 0x20uLL:
        id result = @"Story";
        break;
      default:
        if (a3 != 100) {
          return @"Unsupported Category";
        }
        id result = @"Content Creation Tool";
        break;
    }
  }
  return result;
}

+ (id)assetListPredicateFromQueryHintObjects:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v23 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  int64_t v25 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    BOOL v10 = &off_1E5840000;
    id v24 = v6;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          if ([v13 assetCollectionType] == 1
            && ([v13 assetCollectionSubtype] == 2 || objc_msgSend(v13, "assetCollectionSubtype") == 5))
          {
            long long v14 = [v13 cloudGUID];
            if (v14 || ([v13 uuid], (long long v14 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              [v4 addObject:v14];
              goto LABEL_18;
            }
          }
          goto LABEL_19;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [v12 uuid];
          [v5 addObject:v13];
          goto LABEL_19;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          if ([v13 collectionListSubtype] == 2)
          {
            long long v14 = [v13 startDate];
            [v13 endDate];
            long long v15 = v5;
            v17 = long long v16 = v4;
            v31[0] = v14;
            v31[1] = v17;
            [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
            v19 = uint64_t v18 = v10;
            [v25 addObject:v19];

            BOOL v10 = v18;
            id v4 = v16;
            id v5 = v15;
            id v6 = v24;
LABEL_18:
          }
LABEL_19:

          goto LABEL_20;
        }
        objc_opt_class();
        objc_opt_isKindOfClass();
LABEL_20:
        ++v11;
      }
      while (v8 != v11);
      uint64_t v20 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      uint64_t v8 = v20;
    }
    while (v20);
  }

  if ([v4 count]) {
    [v23 setObject:v4 forKey:@"albums"];
  }
  if ([v5 count]) {
    [v23 setObject:v5 forKey:@"persons"];
  }
  if ([v25 count]) {
    [v23 setObject:v25 forKey:@"dateRanges"];
  }
  if (![v23 count]
    || (uint64_t v26 = 0,
        [MEMORY[0x1E4F28F98] dataWithPropertyList:v23 format:200 options:0 error:&v26],
        (uint64_t v21 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v21 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v21;
}

+ (id)titleFontNameFromMovieData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v9 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v9];
    id v5 = v9;
    if (v4)
    {
      id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleFontName"];
    }
    else
    {
      uint64_t v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "Error while decoding movieData: %@", buf, 0xCu);
      }

      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)movieDataWithTitleFontName:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:@"titleFontName"];

  id v6 = [v5 encodedData];

  return v6;
}

+ (id)fetchMemoriesWithGraphMemoryIdentifiers:(id)a3 options:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    uint64_t v7 = (PHFetchOptions *)[a4 copy];
  }
  else
  {
    id v8 = a3;
    uint64_t v7 = objc_alloc_init(PHFetchOptions);
  }
  id v9 = v7;
  [(PHFetchOptions *)v7 setIncludeRejectedMemories:1];
  BOOL v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"graphMemoryIdentifier IN %@", a3];

  [(PHFetchOptions *)v9 setInternalPredicate:v10];
  [(PHFetchOptions *)v9 setIsExclusivePredicate:1];
  id v11 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v9];

  return v11;
}

+ (id)fetchMemoryWithGraphMemoryIdentifier:(id)a3 options:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    uint64_t v7 = (PHFetchOptions *)[a4 copy];
  }
  else
  {
    id v8 = a3;
    uint64_t v7 = objc_alloc_init(PHFetchOptions);
  }
  id v9 = v7;
  [(PHFetchOptions *)v7 setIncludeLocalMemories:1];
  [(PHFetchOptions *)v9 setIncludeRejectedMemories:1];
  BOOL v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"graphMemoryIdentifier == %@", a3];

  [(PHFetchOptions *)v9 setInternalPredicate:v10];
  [(PHFetchOptions *)v9 setIsExclusivePredicate:1];
  [(PHFetchOptions *)v9 setFetchLimit:1];
  id v11 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v9];

  return v11;
}

+ (id)fetchMemoriesWithNilLastEnrichmentDateWithOptions:(id)a3
{
  if (a3) {
    id v3 = (PHFetchOptions *)[a3 copy];
  }
  else {
    id v3 = objc_alloc_init(PHFetchOptions);
  }
  id v4 = v3;
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"lastEnrichmentDate == nil"];
  [(PHFetchOptions *)v4 setInternalPredicate:v5];

  [(PHFetchOptions *)v4 setIsExclusivePredicate:1];
  id v6 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v4];

  return v6;
}

+ (id)fetchMemoriesWithUserFeedbackWithOptions:(id)a3
{
  if (a3) {
    id v3 = (PHFetchOptions *)[a3 copy];
  }
  else {
    id v3 = objc_alloc_init(PHFetchOptions);
  }
  id v4 = v3;
  [(PHFetchOptions *)v3 setIncludeRejectedMemories:1];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"userFeedbacks.@count > 0"];
  [(PHFetchOptions *)v4 setInternalPredicate:v5];

  id v6 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v4];

  return v6;
}

+ (id)fetchMemoriesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PHMemory_fetchMemoriesWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __54__PHMemory_fetchMemoriesWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = +[PHQuery queryForMemoriesWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchBlockedMemoriesWithOptions:(id)a3
{
  if (a3) {
    id v3 = (PHFetchOptions *)[a3 copy];
  }
  else {
    id v3 = objc_alloc_init(PHFetchOptions);
  }
  id v4 = v3;
  [(PHFetchOptions *)v3 setIncludeRejectedMemories:1];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"blacklistedFeature != nil"];
  [(PHFetchOptions *)v4 setInternalPredicate:v5];
  id v6 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v4];

  return v6;
}

+ (id)fetchPredicateFromUserCreatedComparisonPredicate:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 leftExpression];
  id v5 = [v3 rightExpression];

  if ([v4 expressionType] == 3)
  {
    id v6 = [v4 keyPath];
  }
  else
  {
    id v6 = 0;
  }
  if ([v6 isEqualToString:@"userCreated"] && !objc_msgSend(v5, "expressionType"))
  {
    id v9 = [v5 constantValue];
    if ([v9 BOOLValue])
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"userActionOptions", 1);
      id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"userActionOptions", 3);
      uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
      v17[0] = v10;
      v17[1] = v11;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      long long v14 = v17;
    }
    else
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"userActionOptions", 0);
      id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"userActionOptions", 2);
      uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
      v16[0] = v10;
      v16[1] = v11;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      long long v14 = v16;
    }
    long long v15 = [v13 arrayWithObjects:v14 count:2];
    uint64_t v7 = [v12 orPredicateWithSubpredicates:v15];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PHMemory;
  uint64_t v7 = objc_msgSendSuper2(&v9, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  if (!v7)
  {
    uint64_t v7 = [a1 fetchPredicateFromUserCreatedComparisonPredicate:v6];
  }

  return v7;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PHMemory_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_12790 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_12790, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_12791 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __48__PHMemory_transformValueExpression_forKeyPath___block_invoke()
{
  v4[26] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"localizedTitle";
  v4[1] = @"title";
  v4[2] = @"localizedSubtitle";
  v4[3] = @"subtitle";
  v4[4] = @"graphMemoryIdentifier";
  v4[5] = @"storyColorGradeKind";
  v4[6] = @"storyTitleCategory";
  v4[7] = @"creationDate";
  v4[8] = @"photosGraphVersion";
  v4[9] = @"rejected";
  v4[10] = @"favorite";
  v4[11] = @"pendingState";
  v4[12] = @"creationType";
  v4[13] = @"syndicatedContentState";
  v4[14] = @"subcategory";
  v4[15] = @"uuid";
  v4[16] = @"score";
  v4[17] = @"notificationState";
  v4[18] = @"featuredState";
  v4[19] = @"blacklistedFeature";
  v4[20] = @"category";
  v4[21] = @"lastViewedDate";
  v4[22] = @"viewCount";
  v4[23] = @"sharingComposition";
  v4[24] = @"startDate";
  v4[25] = @"endDate";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:26];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_12791;
  transformValueExpression_forKeyPath___passThroughSet_12791 = v2;
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  if (!a3)
  {
LABEL_4:
    id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"sharingComposition", a3, v3);
    return v5;
  }
  if (a3 == 1)
  {
    *(void *)&a3 = 1;
    goto LABEL_4;
  }
  id v5 = 0;
  return v5;
}

+ (id)fetchType
{
  uint64_t v2 = @"PHMemory";
  return @"PHMemory";
}

+ (void)generateMemoriesWithOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v7 photoLibrary];
  id v10 = [v9 photoLibrary];
  id v11 = [v10 photoAnalysisClient];

  if (v11)
  {
    uint64_t v12 = [v7 dictionaryRepresentation];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__PHMemory_generateMemoriesWithOptions_completion___block_invoke;
    v14[3] = &unk_1E5846C40;
    id v15 = v8;
    [v11 generateMemoriesWithOptions:v12 reply:v14];
  }
  else if (v8)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PHMemory.m", 368, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

uint64_t __51__PHMemory_generateMemoriesWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (double)relevanceScoreAtDate:(id)a3
{
  +[PHMemoryRelevanceHelper relevanceScoreForMemory:self atDate:a3];
  return result;
}

- (BOOL)isRelevantAtDate:(id)a3
{
  return +[PHMemoryRelevanceHelper isMemory:self relevantAtDate:a3];
}

+ (id)mostRelevantMemoryInMemories:(id)a3 atDate:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    objc_super v9 = 0;
    uint64_t v10 = *(void *)v19;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        +[PHMemoryRelevanceHelper relevanceScoreForMemory:v13 atDate:v6];
        if (v14 > v11)
        {
          double v15 = v14;
          id v16 = v13;

          objc_super v9 = v16;
          double v11 = v15;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

+ (id)fetchMostRelevantMemoryAtDate:(id)a3 options:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)[a4 copy];
  [v6 setFetchLimit:12];
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v13[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
  v13[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v6 setSortDescriptors:v9];

  uint64_t v10 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  double v11 = +[PHMemory mostRelevantMemoryInMemories:v10 atDate:v5];

  return v11;
}

- (NSString)URLNavigationSourceIdentifier
{
  return (NSString *)(id)_sourceForMemoryPresentedFromURLNavigation;
}

- (BOOL)isPresentedFromURLNavigation
{
  uint64_t v2 = (void *)_identifierForMemoryPresentedFromURNavigation;
  if (!_identifierForMemoryPresentedFromURNavigation) {
    return 0;
  }
  uint64_t v3 = [(PHObject *)self localIdentifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

+ (void)clearCurrentMemoryForURLNavigation
{
  uint64_t v2 = (void *)_identifierForMemoryPresentedFromURNavigation;
  _identifierForMemoryPresentedFromURNavigation = 0;

  uint64_t v3 = (void *)_sourceForMemoryPresentedFromURLNavigation;
  _sourceForMemoryPresentedFromURLNavigation = 0;
}

+ (void)setCurrentMemoryForURLNavigation:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
  id v5 = [v4 scheme];
  int v6 = [v5 isEqualToString:@"photos"];

  if (!v6)
  {
    double v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = [v4 host];
  if (![v7 isEqualToString:@"memory"])
  {
    double v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  long long v27 = v7;
  long long v28 = v4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [v4 queryItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v9)
  {
    double v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  double v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v30 != v13) {
        objc_enumerationMutation(v8);
      }
      double v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      id v16 = [v15 name];
      int v17 = [v16 isEqualToString:@"identifier"];

      if (v17)
      {
        uint64_t v18 = [v15 value];
        long long v19 = v12;
        uint64_t v12 = (void *)v18;
      }
      else
      {
        long long v20 = [v15 name];
        int v21 = [v20 isEqualToString:@"source"];

        if (!v21) {
          continue;
        }
        uint64_t v22 = [v15 value];
        long long v19 = v11;
        double v11 = (void *)v22;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v10);
LABEL_19:

  char v4 = v28;
  uint64_t v7 = v27;
LABEL_20:

LABEL_21:
  uint64_t v23 = (void *)_identifierForMemoryPresentedFromURNavigation;
  _identifierForMemoryPresentedFromURNavigation = (uint64_t)v12;
  id v24 = v12;

  int64_t v25 = (void *)_sourceForMemoryPresentedFromURLNavigation;
  _sourceForMemoryPresentedFromURLNavigation = (uint64_t)v11;
  id v26 = v11;
}

- (id)rankedPreviewAssetsForLength:(unint64_t)a3 targetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = 0;
  uint64_t v8 = [(PHMemory *)self curationOfLength:a3 options:MEMORY[0x1E4F1CC08] error:&v28];
  id v9 = v28;
  if (v9)
  {
    uint64_t v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v31 = a3;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "[PHMemory+Curation] failed to fetch assets with length(%lu): %@", buf, 0x16u);
    }
    double v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v12 = [(PHObject *)self photoLibrary];
    uint64_t v13 = [v12 librarySpecificFetchOptions];
    uint64_t v10 = +[PHAsset fetchKeyCuratedAssetInAssetCollection:self referenceAsset:0 options:v13];

    double v14 = [v10 firstObject];
    double v15 = [(PHObject *)self photoLibrary];
    id v16 = [v15 librarySpecificFetchOptions];

    [v16 setIncludeGuestAssets:1];
    int v17 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v18 = [v14 localIdentifier];
    long long v19 = [v17 predicateWithFormat:@"localIdentifier != %@", v18];

    long long v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"playbackStyle != %d && playbackStyle != %d", 4, 5);
    int v21 = (void *)MEMORY[0x1E4F28BA0];
    v29[0] = v19;
    v29[1] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    uint64_t v23 = [v21 andPredicateWithSubpredicates:v22];
    [v16 setPredicate:v23];

    id v24 = +[PHAsset fetchAssetsWithUUIDs:v8 options:v16];
    int64_t v25 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v24 count];
      *(_DWORD *)buf = 134217984;
      unint64_t v31 = v26;
      _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_INFO, "[PHMemory+Curation] Curated assets count:%lu", buf, 0xCu);
    }

    double v11 = objc_msgSend((id)objc_opt_class(), "filteredAndSortedPreviewAssetsByScoreFromAssets:targetSize:", v24, width, height);
  }

  return v11;
}

- (id)fetchPreviewAssetForLength:(unint64_t)a3 targetSize:(CGSize)a4
{
  char v4 = -[PHMemory rankedPreviewAssetsForLength:targetSize:](self, "rankedPreviewAssetsForLength:targetSize:", a3, a4.width, a4.height);
  id v5 = [v4 firstObject];

  return v5;
}

- (id)extractGenerativeMemoryMusicCuration
{
  if ([(PHMemory *)self isGenerative])
  {
    id v3 = [(PHMemory *)self photosGraphProperties];
    char v4 = v3;
    if (!v3)
    {
      int v6 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v14 = 0;
        _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "No photosGraphData for the memory", v14, 2u);
      }
      id v9 = 0;
      goto LABEL_19;
    }
    id v5 = [v3 objectForKeyedSubscript:@"generativeMemoryData"];
    int v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:@"musicCuration"];
      if (v7)
      {
        uint64_t v8 = v7;
        id v9 = v8;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v10 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "No MusicCuration in the photosGraphData.GenerativeData", v12, 2u);
      }

      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "No GenerativeData in the photosGraphData", v13, 2u);
      }
    }
    id v9 = 0;
    goto LABEL_18;
  }
  char v4 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_INFO, "Can't extract GenerativeMemoryMusicCuration for non-generative memory", buf, 2u);
  }
  id v9 = 0;
LABEL_20:

  return v9;
}

- (unint64_t)_fetchNumberOfAssetsWithType:(unint64_t)a3 predicate:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  switch(a3)
  {
    case 0uLL:
      uint64_t v7 = [(PHMemory *)self _predicateForImages];
      goto LABEL_7;
    case 1uLL:
      id v9 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v10 = [(PHMemory *)self _predicateForImages];
      v24[0] = v10;
      double v11 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v12 = [(PHMemory *)self _predicateForLivePhotos];
      uint64_t v13 = [v11 notPredicateWithSubpredicate:v12];
      v24[1] = v13;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      uint64_t v8 = [v9 andPredicateWithSubpredicates:v14];

      break;
    case 2uLL:
      uint64_t v7 = [(PHMemory *)self _predicateForLivePhotos];
      goto LABEL_7;
    case 3uLL:
      uint64_t v7 = [(PHMemory *)self _predicateForVideos];
LABEL_7:
      uint64_t v8 = (void *)v7;
      break;
    default:
      uint64_t v8 = 0;
      break;
  }
  double v15 = [(PHObject *)self photoLibrary];
  id v16 = [v15 librarySpecificFetchOptions];

  int v17 = (void *)MEMORY[0x1E4F28BA0];
  v23[0] = v6;
  v23[1] = v8;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  long long v19 = [v17 andPredicateWithSubpredicates:v18];
  [v16 setInternalPredicate:v19];

  [v16 setShouldPrefetchCount:1];
  [v16 setWantsIncrementalChangeDetails:0];
  long long v20 = +[PHAsset fetchAssetsWithOptions:v16];
  unint64_t v21 = [v20 count];

  return v21;
}

- (id)_predicateForVideos
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 1);
}

- (id)_predicateForLivePhotos
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d && %K.%K >= %f", @"kindSubtype", 2, @"mediaAnalysisAttributes", @"autoplaySuggestionScore", 0x3FD999999999999ALL);
}

- (id)_predicateForImages
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
}

- (unint64_t)_numberOfAssetsWithType:(unint64_t)a3 optionsValue:(id)a4 predicate:(id)a5
{
  if (a4) {
    return objc_msgSend(a4, "integerValue", a3);
  }
  else {
    return [(PHMemory *)self _fetchNumberOfAssetsWithType:a3 predicate:a5];
  }
}

- (id)fetchAssetsWithCurationOfLength:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  id v6 = [(PHMemory *)self curationOfLength:a3 options:a4 error:a5];
  if (v6)
  {
    uint64_t v7 = [(PHObject *)self photoLibrary];
    uint64_t v8 = [v7 librarySpecificFetchOptions];
    id v9 = +[PHAsset fetchAssetsWithUUIDs:v6 options:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)curationOfLength:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(PHObject *)self photoLibrary];
  uint64_t v10 = [v9 photoAnalysisClient];
  double v11 = [(PHObject *)self localIdentifier];
  uint64_t v12 = [v10 requestCurationOfLength:a3 forMemoryForLocalIdentifier:v11 withOptions:v8 error:a5];

  return v12;
}

- (unint64_t)currentCurationLengthWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [(PHObject *)self objectID];
  uint64_t v7 = [v5 predicateWithFormat:@"memoriesBeingCuratedAssets CONTAINS %@", v6];

  id v8 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionImageCountKey"];
  unint64_t v9 = [(PHMemory *)self _numberOfAssetsWithType:0 optionsValue:v8 predicate:v7];

  unint64_t v10 = [(PHMemory *)self _numberOfAssetsWithType:2 optionsValue:0 predicate:v7];
  double v11 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionVideoCountKey"];
  unint64_t v12 = [(PHMemory *)self _numberOfAssetsWithType:3 optionsValue:v11 predicate:v7];

  [(PHMemory *)self _evaluatedDurationWithNumberOfStillPhotos:v9 - v10 numberOfLivePhotos:v10 numberOfVideos:v12 options:v4];
  double v14 = v13;
  double v15 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionMinimumDurationForMediumCurationKey"];
  if (v15)
  {
    id v16 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionMinimumDurationForMediumCurationKey"];
    [v16 doubleValue];
    double v18 = v17;
  }
  else
  {
    double v18 = 45.0;
  }

  if (v14 < v18) {
    unint64_t v19 = 1;
  }
  else {
    unint64_t v19 = 2;
  }

  return v19;
}

- (unint64_t)availableCurationLengthsWithOptions:(id)a3
{
  id v4 = a3;
  [(PHMemory *)self photosGraphVersion];
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x301)
  {
    id v6 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v7 = [(PHObject *)self objectID];
    id v8 = [v6 predicateWithFormat:@"memoriesBeingExtendedCuratedAssets CONTAINS %@", v7];

    unint64_t v9 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionImageCountKey"];
    unint64_t v10 = [(PHMemory *)self _numberOfAssetsWithType:0 optionsValue:v9 predicate:v8];

    unint64_t v11 = [(PHMemory *)self _numberOfAssetsWithType:2 optionsValue:0 predicate:v8];
    unint64_t v12 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionVideoCountKey"];
    unint64_t v13 = [(PHMemory *)self _numberOfAssetsWithType:3 optionsValue:v12 predicate:v8];

    [(PHMemory *)self _evaluatedDurationWithNumberOfStillPhotos:v10 - v11 numberOfLivePhotos:v11 numberOfVideos:v13 options:v4];
    double v15 = v14;
    id v16 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionMinimumDurationForMediumCurationKey"];
    if (v16)
    {
      double v17 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionMinimumDurationForMediumCurationKey"];
      [v17 doubleValue];
      double v19 = v18;
    }
    else
    {
      double v19 = 45.0;
    }

    if (v15 >= v19)
    {
      long long v20 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionMinimumDurationForLongCurationKey"];
      if (v20)
      {
        unint64_t v21 = [v4 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionMinimumDurationForLongCurationKey"];
        [v21 doubleValue];
        double v23 = v22;
      }
      else
      {
        double v23 = 70.0;
      }

      if (v15 >= v23) {
        unint64_t v5 = 7;
      }
      else {
        unint64_t v5 = 3;
      }
    }
    else
    {
      unint64_t v5 = 1;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (double)_evaluatedDurationWithNumberOfStillPhotos:(unint64_t)a3 numberOfLivePhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 options:(id)a6
{
  id v9 = a6;
  unint64_t v10 = [v9 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionStillPhotoDurationKey"];
  if (v10)
  {
    unint64_t v11 = [v9 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionStillPhotoDurationKey"];
    [v11 doubleValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 2.0;
  }

  double v14 = [v9 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionLivePhotoDurationKey"];
  if (v14)
  {
    double v15 = [v9 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionLivePhotoDurationKey"];
    [v15 doubleValue];
    double v17 = v16;
  }
  else
  {
    double v17 = 3.0;
  }

  double v18 = [v9 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionVideoDurationKey"];
  if (v18)
  {
    double v19 = [v9 objectForKeyedSubscript:@"PHMemoryCurationAvailabilityOptionVideoDurationKey"];
    [v19 doubleValue];
    double v21 = v20;
  }
  else
  {
    double v21 = 6.0;
  }

  return v17 * (double)a4 + (double)a3 * v13 + (double)a5 * v21;
}

+ (id)filteredAndSortedPreviewAssetsByScoreFromAssets:(id)a3 targetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    id v52 = v6;
    uint64_t v7 = [a1 previewCandidatesFromAssets:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v58 objects:v77 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v59;
      double v13 = *MEMORY[0x1E4F1DB20];
      double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      double v17 = 0.0;
      double v18 = 0.0;
      double v19 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v59 != v12) {
            objc_enumerationMutation(v9);
          }
          double v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          *(void *)buf = 0;
          objc_msgSend(v21, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", buf, width, height, v13, v14, v15, v16);
          double v22 = [_PHCropInfo alloc];
          double v23 = [(_PHCropInfo *)v22 initWithAsset:v21 cropScore:*(double *)buf];
          [v8 addObject:v23];
          [v21 curationScore];
          double v19 = v19 + v24;
          [v21 overallAestheticScore];
          double v18 = v18 + v25;
          double v17 = v17 + *(double *)buf;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v58 objects:v77 count:16];
      }
      while (v11);
    }
    else
    {
      double v17 = 0.0;
      double v18 = 0.0;
      double v19 = 0.0;
    }

    v50 = v9;
    uint64_t v27 = [v9 count];
    id v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cropScore" ascending:0];
    v76[0] = v28;
    long long v29 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.uuid" ascending:0];
    v76[1] = v29;
    long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
    v51 = v8;
    unint64_t v31 = [v8 sortedArrayUsingDescriptors:v30];

    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v75 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      double v35 = (double)v27;
      double v36 = v19 / (double)v27;
      double v37 = v18 / (double)v27;
      uint64_t v38 = *(void *)v55;
      double v39 = v17 / v35;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v55 != v38) {
            objc_enumerationMutation(v32);
          }
          Class v41 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          uint64_t v42 = [v41 asset];
          [v26 addObject:v42];
          uint64_t v43 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            [v41 cropScore];
            uint64_t v45 = v44;
            [v42 curationScore];
            uint64_t v47 = v46;
            [v42 overallAestheticScore];
            *(_DWORD *)buf = 138413826;
            *(void *)&uint8_t buf[4] = v42;
            __int16 v63 = 2048;
            uint64_t v64 = v45;
            __int16 v65 = 2048;
            double v66 = v39;
            __int16 v67 = 2048;
            uint64_t v68 = v47;
            __int16 v69 = 2048;
            double v70 = v36;
            __int16 v71 = 2048;
            double v72 = v48;
            __int16 v73 = 2048;
            double v74 = v37;
            _os_log_impl(&dword_19B043000, v43, OS_LOG_TYPE_INFO, "[PNAssetCurationUtilities] Select preview asset:%@, cropScore:(%.4f, avg:%.4f), curationScore:(%.4f, avg:%.4f), aestheticScore:(%.4f, avg:%.4f)", buf, 0x48u);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v54 objects:v75 count:16];
      }
      while (v34);
    }

    id v6 = v52;
  }
  else
  {
    id v26 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v26;
}

+ (id)previewCandidatesFromAssets:(id)a3
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    uint64_t v33 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_22;
  }
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unint64_t v5 = [v4 persistentDomainForName:*MEMORY[0x1E4F283E0]];

  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  uint64_t v7 = [v3 fetchedObjects];
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"curationScore" ascending:0];
  v51[0] = v8;
  v51[1] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  uint64_t v10 = [v7 sortedArrayUsingDescriptors:v9];

  uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
  v50[0] = v11;
  v50[1] = v6;
  uint64_t v42 = (void *)v6;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  double v13 = [v7 sortedArrayUsingDescriptors:v12];

  uint64_t v14 = [v5 valueForKey:@"PHAssetPreviewCurationScorePercentileThresholdKey"];
  double v15 = (void *)v14;
  double v16 = &unk_1EEB26F40;
  if (v14) {
    double v16 = (void *)v14;
  }
  id v17 = v16;

  uint64_t v43 = v5;
  uint64_t v18 = [v5 valueForKey:@"PHAssetPreviewAestheticsScorePercentileThresholdKey"];
  double v19 = (void *)v18;
  double v20 = &unk_1EEB26F50;
  if (v18) {
    double v20 = (void *)v18;
  }
  id v21 = v20;

  unint64_t v22 = [v7 count];
  [v17 doubleValue];
  double v24 = v23 * (double)v22;
  if (v24 < 1.0) {
    double v24 = 1.0;
  }
  unint64_t v25 = (unint64_t)v24;
  Class v41 = v10;
  id v26 = objc_msgSend(v10, "subarrayWithRange:", 0, (unint64_t)v24);
  uint64_t v27 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v45 = (uint64_t)v17;
    __int16 v46 = 2048;
    unint64_t v47 = v25;
    __int16 v48 = 2048;
    unint64_t v49 = v22;
    _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_INFO, "[PHMemory+Curation] curationScorePercentile:%@, targetLength:(%lu/%lu)", buf, 0x20u);
  }

  [v21 doubleValue];
  double v29 = v28 * (double)v22;
  if (v29 < 1.0) {
    double v29 = 1.0;
  }
  unint64_t v30 = (unint64_t)v29;
  unint64_t v31 = objc_msgSend(v13, "subarrayWithRange:", 0, (unint64_t)v29, v13);
  id v32 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v45 = (uint64_t)v21;
    __int16 v46 = 2048;
    unint64_t v47 = v30;
    __int16 v48 = 2048;
    unint64_t v49 = v22;
    _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_INFO, "[PHMemory+Curation] aestheticScorePercentile:%@, targetLength:(%lu/%lu)", buf, 0x20u);
  }

  uint64_t v33 = [MEMORY[0x1E4F1CA80] setWithArray:v26];
  uint64_t v34 = [MEMORY[0x1E4F1CA80] setWithArray:v31];
  if ([v33 intersectsSet:v34])
  {
    [v33 intersectSet:v34];
    double v35 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = [v33 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v45 = v36;
      double v37 = "[PHMemory+Curation] Found curation/aesthetics overlap candidates:%lu";
LABEL_20:
      _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_INFO, v37, buf, 0xCu);
    }
  }
  else
  {
    double v35 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v38 = [v33 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v45 = v38;
      double v37 = "[PHMemory+Curation] No top curation/aesthetics overlap. Use topCurationAssets:%lu";
      goto LABEL_20;
    }
  }

LABEL_22:

  return v33;
}

- (id)transientMemoryStartDate
{
  return [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"startDate"];
}

- (id)rejectionCause
{
  return [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"rejectionCause"];
}

- (id)transientRepresentativeAndCuratedAssetIDs
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"assets"];

  if (!v3) {
    [(PHMemory *)self setupTransientMemory];
  }
  id v4 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"representativeAssets"];
  unint64_t v5 = [(PHObject *)self photoLibrary];
  uint64_t v6 = [v5 librarySpecificFetchOptions];

  v11[0] = @"PHAssetPropertySetIdentifier";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v6 setFetchPropertySets:v7];

  id v8 = +[PHAsset fetchAssetsWithLocalIdentifiers:v4 options:v6];
  id v9 = [v8 fetchedObjectIDs];

  return v9;
}

- (id)query
{
  id v3 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"assets"];

  if (!v3) {
    [(PHMemory *)self setupTransientMemory];
  }
  id v4 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"extendeduratedAssets"];
  unint64_t v5 = v4;
  if (v4 && [v4 count]
    || ([(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"assets"], v6 = objc_claimAutoreleasedReturnValue(), v5, (unint64_t v5 = (void *)v6) != 0))
  {
    uint64_t v7 = [(id)objc_opt_class() _fetchOptionsForTransientMemoryAssetsWithOptions:0];
    id v8 = +[PHQuery queryForAssetsWithLocalIdentifiers:v5 options:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)queryForKeyAssetWithOptions:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  transientMemoryProperties = self->_transientMemoryProperties;
  id v5 = a3;
  uint64_t v6 = [(NSDictionary *)transientMemoryProperties objectForKeyedSubscript:@"keyAsset"];

  if (!v6) {
    [(PHMemory *)self setupTransientMemory];
  }
  uint64_t v7 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"keyAsset"];
  id v8 = (void *)v7;
  if (v7)
  {
    v13[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v10 = [(id)objc_opt_class() _fetchOptionsForTransientMemoryAssetsWithOptions:v5];

  uint64_t v11 = +[PHQuery queryForAssetsWithLocalIdentifiers:v9 options:v10];

  return v11;
}

- (id)queryForCuratedAssetsWithOptions:(id)a3
{
  transientMemoryProperties = self->_transientMemoryProperties;
  id v5 = a3;
  uint64_t v6 = [(NSDictionary *)transientMemoryProperties objectForKeyedSubscript:@"curatedAssets"];

  if (!v6) {
    [(PHMemory *)self setupTransientMemory];
  }
  uint64_t v7 = [(id)objc_opt_class() _fetchOptionsForTransientMemoryAssetsWithOptions:v5];

  id v8 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"curatedAssets"];
  id v9 = +[PHQuery queryForAssetsWithLocalIdentifiers:v8 options:v7];

  return v9;
}

- (id)queryForExtendedCuratedAssetsWithOptions:(id)a3
{
  transientMemoryProperties = self->_transientMemoryProperties;
  id v5 = a3;
  uint64_t v6 = [(NSDictionary *)transientMemoryProperties objectForKeyedSubscript:@"extendeduratedAssets"];

  if (!v6) {
    [(PHMemory *)self setupTransientMemory];
  }
  uint64_t v7 = [(id)objc_opt_class() _fetchOptionsForTransientMemoryAssetsWithOptions:v5];

  id v8 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"extendeduratedAssets"];
  id v9 = +[PHQuery queryForAssetsWithLocalIdentifiers:v8 options:v7];

  return v9;
}

- (void)setupTransientMemory
{
  transientMemoryProperties = self->_transientMemoryProperties;
  self->_transientMemoryProperties = (NSDictionary *)MEMORY[0x1E4F1CC08];

  id v4 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"title"];
  title = self->_title;
  self->_title = v4;

  uint64_t v6 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"subtitle"];
  localizedSubtitle = self->_localizedSubtitle;
  self->_localizedSubtitle = v6;

  id v8 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"category"];
  uint64_t v9 = [v8 unsignedIntegerValue];
  unint64_t v10 = [(PHMemory *)self category];

  if (v9 != v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Transient Memory has different category before and after setup", buf, 2u);
  }
  uint64_t v11 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"subcategory"];
  uint64_t v12 = [v11 unsignedIntegerValue];
  unint64_t v13 = [(PHMemory *)self subcategory];

  if (v12 != v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v23 = 0;
    _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Transient Memory has different subcategory before and after setup", v23, 2u);
  }
  uint64_t v14 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"score"];
  [v14 doubleValue];
  double v16 = v15;
  [(PHMemory *)self score];
  double v18 = v17;

  if (v16 != v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v22 = 0;
    _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Transient Memory has different score before and after setup", v22, 2u);
  }
  double v19 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"photosgraphData"];
  photosGraphData = self->_photosGraphData;
  self->_photosGraphData = v19;

  id v21 = [(NSDictionary *)self->_transientMemoryProperties objectForKeyedSubscript:@"photosGraphVersion"];
  self->_photosGraphVersion = [v21 integerValue];
}

+ (id)_fetchOptionsForTransientMemoryAssetsWithOptions:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    id v5 = (void *)[v3 copy];
  }
  else
  {
    id v5 = objc_opt_new();
  }
  uint64_t v6 = [v5 sortDescriptors];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

    [v5 setSortDescriptors:v9];
  }

  return v5;
}

+ (id)transientMemoryWithInfo:(id)a3 photoLibrary:(id)a4
{
  id v5 = (NSDictionary *)a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = [v6 dictionary];
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  unint64_t v10 = [v9 UUIDString];
  [v8 setObject:v10 forKeyedSubscript:@"uuid"];

  uint64_t v11 = [(NSDictionary *)v5 objectForKeyedSubscript:@"category"];
  if (v11) {
    [v8 setObject:v11 forKeyedSubscript:@"category"];
  }
  uint64_t v12 = [(NSDictionary *)v5 objectForKeyedSubscript:@"subcategory"];
  if (v12) {
    [v8 setObject:v12 forKeyedSubscript:@"subcategory"];
  }
  unint64_t v13 = [(NSDictionary *)v5 objectForKeyedSubscript:@"title"];
  if (v13) {
    [v8 setObject:v13 forKeyedSubscript:@"title"];
  }
  uint64_t v14 = [(NSDictionary *)v5 objectForKeyedSubscript:@"subtitle"];
  if (v14) {
    [v8 setObject:v14 forKeyedSubscript:@"subtitle"];
  }
  double v15 = [(NSDictionary *)v5 objectForKeyedSubscript:@"creationDate"];
  if (v15) {
    [v8 setObject:v15 forKeyedSubscript:@"creationDate"];
  }
  double v16 = [(NSDictionary *)v5 objectForKeyedSubscript:@"score"];
  if (v16) {
    [v8 setObject:v16 forKeyedSubscript:@"score"];
  }
  double v17 = [[PHMemory alloc] initWithFetchDictionary:v8 propertyHint:2 photoLibrary:v7];

  transientMemoryProperties = v17->_transientMemoryProperties;
  v17->_transientMemoryProperties = v5;

  return v17;
}

@end