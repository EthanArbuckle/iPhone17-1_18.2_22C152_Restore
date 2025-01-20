@interface PHQuery
+ (BOOL)_isKindOfMomentOrAlbumEntity:(id)a3;
+ (BOOL)_validateLocalIdentifiers:(id)a3 compatibilityWithFetchType:(id)a4;
+ (id)_assetIDsFromAssets:(id)a3 anyAsset:(id *)a4;
+ (id)_containerIdentifierForFetchType:(id)a3 predicate:(id)a4 outRelationship:(id *)a5;
+ (id)_defaultFetchOptionsForIdentifiedAssetsQueryInPhotoLibrary:(id)a3;
+ (id)_fetchOptionsForFetchingAssetsFromAssetCollection:(id)a3 options:(id)a4 changeDetectionCriteria:(id)a5;
+ (id)_fetchOptionsForFetchingAssetsFromImportSessions:(id)a3 options:(id)a4;
+ (id)_fetchTypeForLocalIdentifiers:(id)a3;
+ (id)_filterPredicateFromFetchOptionsPredicate:(id)a3 options:(id)a4 phClass:(Class)a5;
+ (id)_guestAssetOnlyPredicate;
+ (id)_queryForAssetsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)_queryForPersonsInAssetsWithObjectIDs:(id)a3 withOptions:(id)a4;
+ (id)_queryForPersonsWithFaceRelationshipPredicate:(id)a3 options:(id)a4;
+ (id)_queryForRootCollectionListWithRootFolder:(id)a3 options:(id)a4;
+ (id)_relationshipForFetchType:(id)a3 predicate:(id)a4;
+ (id)_transformedSortDescriptors:(id)a3 forFetchType:(id)a4;
+ (id)combinedFetchRequestForQueries:(id)a3;
+ (id)defaultSortDescriptorForFetchType:(id)a3 predicate:(id)a4 ascending:(BOOL)a5;
+ (id)fetchRootFolderIDForAlbumKind:(int)a3 photoLibrary:(id)a4;
+ (id)identificationBlockForAlbumSortKey:(unsigned int)a3;
+ (id)identificationBlockForAssetCollectionType:(int64_t)a3;
+ (id)identificationBlockForSmartAlbumKind:(int)a3;
+ (id)queryForActiveLibraryScopeWithOptions:(id)a3;
+ (id)queryForAllAssetsAssociatedWithMemory:(id)a3 options:(id)a4;
+ (id)queryForAllAssetsInYearRepresentedByYearHighlight:(id)a3 options:(id)a4;
+ (id)queryForAllTripHighlightsContainingAssetUUIDs:(id)a3 options:(id)a4;
+ (id)queryForAnsweredQuestionsWithOptions:(id)a3;
+ (id)queryForAnsweredYesOrNoQuestionsWithOptions:(id)a3;
+ (id)queryForAnyCinematicVideosNeedingDeferredProcessingWithOtions:(id)a3;
+ (id)queryForAssetCollectionsContainingAsset:(id)a3 withType:(int64_t)a4 options:(id)a5;
+ (id)queryForAssetCollectionsContainingAssets:(id)a3 withType:(int64_t)a4 options:(id)a5;
+ (id)queryForAssetCollectionsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForAssetCollectionsWithObjectIDs:(id)a3 options:(id)a4;
+ (id)queryForAssetCollectionsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5;
+ (id)queryForAssetCollectionsWithType:(int64_t)a3 subtype:(int64_t)a4 options:(id)a5;
+ (id)queryForAssetsAssociatedWithMomentsOfMemory:(id)a3 options:(id)a4;
+ (id)queryForAssetsCaptured:(BOOL)a3 orEdited:(BOOL)a4 onThisCameraSinceDate:(id)a5 options:(id)a6;
+ (id)queryForAssetsCapturedOnThisCameraSinceDate:(id)a3 options:(id)a4;
+ (id)queryForAssetsEditedOnThisCameraSinceDate:(id)a3 options:(id)a4;
+ (id)queryForAssetsForBehavioralCurationWithOptions:(id)a3;
+ (id)queryForAssetsForComment:(id)a3 options:(id)a4;
+ (id)queryForAssetsForFaceGroups:(id)a3 options:(id)a4;
+ (id)queryForAssetsForFaces:(id)a3 options:(id)a4;
+ (id)queryForAssetsForKeywords:(id)a3 options:(id)a4;
+ (id)queryForAssetsForPTPWithOptions:(id)a3;
+ (id)queryForAssetsForPersons:(id)a3 options:(id)a4;
+ (id)queryForAssetsFromCameraSinceDate:(id)a3 options:(id)a4;
+ (id)queryForAssetsInAssetCollection:(id)a3 options:(id)a4;
+ (id)queryForAssetsInBoundingBoxWithTopLeftLocation:(id)a3 bottomRightLocation:(id)a4 options:(id)a5;
+ (id)queryForAssetsInImportSessions:(id)a3 options:(id)a4;
+ (id)queryForAssetsInLibraryScope:(id)a3 options:(id)a4;
+ (id)queryForAssetsInPreviewStateInLibraryScope:(id)a3 options:(id)a4;
+ (id)queryForAssetsInPreviewStateWithSuggestedByClientTypes:(id)a3 options:(id)a4;
+ (id)queryForAssetsInUtilityCollectionWithType:(unsigned __int16)a3 options:(id)a4;
+ (id)queryForAssetsUsingSearchIndexLookupIdentifier:(id)a3 options:(id)a4;
+ (id)queryForAssetsWithBurstIdentifier:(id)a3 options:(id)a4;
+ (id)queryForAssetsWithCloudIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForAssetsWithCurrentUserAsLibraryScopeContributor:(BOOL)a3 inLibraryScope:(id)a4 options:(id)a5;
+ (id)queryForAssetsWithMediaType:(int64_t)a3 options:(id)a4;
+ (id)queryForAssetsWithObjectIDs:(id)a3 options:(id)a4;
+ (id)queryForAssetsWithOptions:(id)a3;
+ (id)queryForAssociatedPersonForFaceGroup:(id)a3 withOptions:(id)a4;
+ (id)queryForChildrenDayGroupHighlightsForPhotosHighlight:(id)a3 options:(id)a4;
+ (id)queryForChildrenHighlightsForPhotosHighlight:(id)a3 options:(id)a4;
+ (id)queryForCloudSharedAlbumInvitationRecordsForCloudSharedAlbum:(id)a3 options:(id)a4;
+ (id)queryForCloudSharedAlbumInvitationRecordsWithOptions:(id)a3;
+ (id)queryForCloudSharedAlbumsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForCollageAssetsInDayHighlight:(id)a3 options:(id)a4;
+ (id)queryForCollectionListContainingCollection:(id)a3 options:(id)a4;
+ (id)queryForCollectionListsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5;
+ (id)queryForCollectionListsWithType:(int64_t)a3 subtype:(int64_t)a4 options:(id)a5;
+ (id)queryForCollectionsInCollectionList:(id)a3 options:(id)a4;
+ (id)queryForCommentsForAsset:(id)a3 options:(id)a4;
+ (id)queryForCuratedAssetsInMemory:(id)a3 options:(id)a4;
+ (id)queryForCuratedAssetsInMomentShare:(id)a3 options:(id)a4;
+ (id)queryForCuratedAssetsInPhotosHighlight:(id)a3 options:(id)a4;
+ (id)queryForCustomUserAssetsInMemory:(id)a3 options:(id)a4;
+ (id)queryForEmptyFaceGroupsWithOptions:(id)a3;
+ (id)queryForExtendedCuratedAssetsInMemory:(id)a3 options:(id)a4;
+ (id)queryForFaceCropsForPerson:(id)a3 options:(id)a4;
+ (id)queryForFaceCropsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForFaceCropsWithOptions:(id)a3;
+ (id)queryForFaceGroupsForPerson:(id)a3 options:(id)a4;
+ (id)queryForFaceGroupsWithFace:(id)a3 options:(id)a4;
+ (id)queryForFaceGroupsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForFaceGroupsWithOptions:(id)a3;
+ (id)queryForFacesForPerson:(id)a3 options:(id)a4;
+ (id)queryForFacesInAsset:(id)a3 options:(id)a4;
+ (id)queryForFacesInAssets:(id)a3 options:(id)a4;
+ (id)queryForFacesInFaceGroup:(id)a3 options:(id)a4;
+ (id)queryForFacesOnAssetWithFace:(id)a3 options:(id)a4;
+ (id)queryForFacesOnFaceCrop:(id)a3 options:(id)a4;
+ (id)queryForFacesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForFacesWithOptions:(id)a3;
+ (id)queryForFacesWithVuObservationIDs:(id)a3 options:(id)a4;
+ (id)queryForGuestAssetsInCollectionContainingAsset:(id)a3 options:(id)a4;
+ (id)queryForGuestAssetsWithOptions:(id)a3;
+ (id)queryForImportSessionsWithOptions:(id)a3;
+ (id)queryForInvalidMergeCandidatePersonsForPerson:(id)a3 options:(id)a4;
+ (id)queryForKeyAssetForPerson:(id)a3 options:(id)a4;
+ (id)queryForKeyAssetInMemory:(id)a3 options:(id)a4;
+ (id)queryForKeyAssetInPhotosHighlight:(id)a3 options:(id)a4;
+ (id)queryForKeyAssetsInAssetCollection:(id)a3 options:(id)a4;
+ (id)queryForKeyAssetsInMomentShare:(id)a3 options:(id)a4;
+ (id)queryForKeyAssetsInSuggestion:(id)a3 options:(id)a4;
+ (id)queryForKeyFaceForFaceGroup:(id)a3 options:(id)a4;
+ (id)queryForKeyFaceOnPerson:(id)a3 options:(id)a4;
+ (id)queryForKeySharingSuggestionAssetsInHighlight:(id)a3 options:(id)a4;
+ (id)queryForKeywordsForAsset:(id)a3 options:(id)a4;
+ (id)queryForKeywordsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForKeywordsWithOptions:(id)a3;
+ (id)queryForKeywordsWithTitles:(id)a3 options:(id)a4;
+ (id)queryForLibraryScopesWithOptions:(id)a3;
+ (id)queryForLikesForAsset:(id)a3 options:(id)a4;
+ (id)queryForMemoriesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForMergeCandidatePersonsForPerson:(id)a3 options:(id)a4;
+ (id)queryForMergeCandidateWithConfidencePersonsForPerson:(id)a3 options:(id)a4;
+ (id)queryForMomentListsWithSubType:(int64_t)a3 containingMoment:(id)a4;
+ (id)queryForMomentListsWithSubType:(int64_t)a3 options:(id)a4;
+ (id)queryForMomentsBackingMemory:(id)a3;
+ (id)queryForMomentsBackingSuggestion:(id)a3;
+ (id)queryForMomentsContainingAssetsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForMomentsContainingAssetsWithOIDs:(id)a3 options:(id)a4;
+ (id)queryForMomentsForFacesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForMomentsForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForMomentsInMomentList:(id)a3 options:(id)a4;
+ (id)queryForMomentsInPhotosHighlight:(id)a3;
+ (id)queryForMomentsWithOptions:(id)a3;
+ (id)queryForMovieCuratedAssetsInMemory:(id)a3 options:(id)a4;
+ (id)queryForParentDayGroupHighlightForPhotosHighlight:(id)a3 options:(id)a4;
+ (id)queryForParentHighlightForPhotosHighlight:(id)a3 options:(id)a4;
+ (id)queryForParentHighlightsForPhotosHighlights:(id)a3 options:(id)a4;
+ (id)queryForPendingLibraryScopeInvitationWithOptions:(id)a3;
+ (id)queryForPersonForFaceCrop:(id)a3 options:(id)a4;
+ (id)queryForPersonWithFace:(id)a3 options:(id)a4;
+ (id)queryForPersonWithShareParticipant:(id)a3 options:(id)a4;
+ (id)queryForPersonsInAsset:(id)a3 options:(id)a4;
+ (id)queryForPersonsInAssets:(id)a3 withOptions:(id)a4;
+ (id)queryForPersonsInAssetsFetchResult:(id)a3 withOptions:(id)a4;
+ (id)queryForPersonsWithContactIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForPersonsWithFaces:(id)a3 options:(id)a4;
+ (id)queryForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForPersonsWithMdIDs:(id)a3 options:(id)a4;
+ (id)queryForPersonsWithNonNilUserFeedbackWithTypes:(id)a3 options:(id)a4;
+ (id)queryForPersonsWithObjectIDs:(id)a3 options:(id)a4;
+ (id)queryForPersonsWithOptions:(id)a3;
+ (id)queryForPersonsWithQuestionType:(unsigned __int16)a3 options:(id)a4;
+ (id)queryForPersonsWithType:(int64_t)a3 options:(id)a4;
+ (id)queryForPhotosHighlightsContainingMoments:(id)a3;
+ (id)queryForPreviewLibraryScopeWithOptions:(id)a3;
+ (id)queryForProjectsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForQuestionsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForQuestionsWithOptions:(id)a3;
+ (id)queryForQuestionsWithState:(unsigned __int16)a3 options:(id)a4;
+ (id)queryForReferencedAssetsWithOptions:(id)a3;
+ (id)queryForRejectedFacesOnPerson:(id)a3 options:(id)a4;
+ (id)queryForRejectedPersonsForFace:(id)a3 options:(id)a4;
+ (id)queryForRepresentativeAssetsInMemory:(id)a3 options:(id)a4;
+ (id)queryForRepresentativeAssetsInSuggestion:(id)a3 options:(id)a4;
+ (id)queryForRootAlbumCollectionListWithOptions:(id)a3;
+ (id)queryForRootProjectCollectionListWithOptions:(id)a3;
+ (id)queryForShareParticipantWithPerson:(id)a3 options:(id)a4;
+ (id)queryForShareParticipantsInShare:(id)a3 options:(id)a4;
+ (id)queryForShareParticipantsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)queryForSingletonFacesWithOptions:(id)a3;
+ (id)queryForSuggestionsWithFeaturedState:(unsigned __int16)a3 types:(id)a4 options:(id)a5;
+ (id)queryForSuggestionsWithOptions:(id)a3;
+ (id)queryForSuggestionsWithState:(unsigned __int16)a3 options:(id)a4;
+ (id)queryForSuggestionsWithState:(unsigned __int16)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 options:(id)a6;
+ (id)queryForSuggestionsWithTypes:(id)a3 options:(id)a4;
+ (id)queryForTopLevelCollectionsMatchingPredicate:(id)a3 options:(id)a4;
+ (id)queryForTopLevelUserCollectionsWithOptions:(id)a3;
+ (id)queryForType:(id)a3 withBasePredicate:(id)a4 inLibrary:(id)a5;
+ (id)queryForType:(id)a3 withBasePredicate:(id)a4 seedOIDs:(id)a5 inLibrary:(id)a6;
+ (id)queryForType:(id)a3 withIdentifiers:(id)a4 identifierKeyPath:(id)a5 options:(id)a6;
+ (id)queryForType:(id)a3 withLocalIdentifiers:(id)a4 options:(id)a5;
+ (id)queryForUserCuratedAssetsInMemory:(id)a3 options:(id)a4;
+ (id)queryForVisibleAssetsWithObjectIDs:(id)a3 options:(id)a4;
+ (id)queryforLibraryScopesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (signed)_participationStateFromLibraryScope:(id)a3;
+ (unint64_t)maxKeyAssets;
+ (unsigned)_excludeMaskForUserLibraryWithFetchOptions:(id)a3;
+ (void)_setLibraryScopeDefaultSortDescriptor:(id)a3;
+ (void)photoLibraryWasAccessed;
- (BOOL)_includesCameraRoll;
- (BOOL)_isAlbumContentSort;
- (BOOL)_isAlbumContentTitleSort;
- (BOOL)_isUserSmartAlbum;
- (BOOL)evaluateWithObject:(id)a3;
- (BOOL)overrideResultClassWithFetchType;
- (BOOL)requiresFullRefetchForChange:(id)a3;
- (NSArray)propertiesToFetchWhenGrouping;
- (NSArray)propertiesToGroupBy;
- (NSArray)seedOIDs;
- (NSDictionary)filteringRelationshipsIndexValueByBaseEntityName;
- (NSFetchRequest)fetchRequest;
- (NSManagedObjectID)combinedQuerySeparatingIdentifier;
- (NSPredicate)basePredicate;
- (NSPredicate)filterPredicate;
- (NSRelationshipDescription)containerRelationship;
- (NSSet)filteringKeys;
- (NSSet)filteringOids;
- (NSString)combinedQueryKeyPath;
- (NSString)fetchType;
- (NSString)searchIndexLookupIdentifier;
- (NSString)shortDescription;
- (PHFetchOptions)fetchOptions;
- (PHPhotoLibrary)photoLibrary;
- (id)_createFetchRequestIncludingBasePredicate:(BOOL)a3;
- (id)_effectiveDefaultSortDescriptorReversingOrder:(BOOL)a3;
- (id)_effectiveSortDescriptors;
- (id)_globalPredicatesForPHClass:(Class)a3;
- (id)_substitutedChangeTrackingKeyPathFromKeyPath:(id)a3;
- (id)changeHandlingContainerIdentifier;
- (id)combinedQueryGroupKey;
- (id)containerIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectivePredicateForPHClass:(Class)a3 includingBasePredicate:(BOOL)a4;
- (id)executeQuery;
- (id)initForType:(id)a3 withBasePredicate:(id)a4 inLibrary:(id)a5;
- (id)initForType:(id)a3 withBasePredicate:(id)a4 seedOIDs:(id)a5 inLibrary:(id)a6;
- (id)updatedQueryWithChange:(id)a3;
- (int64_t)collectionFetchType;
- (unint64_t)containerSortingAttributesIndexValue;
- (unint64_t)containerToObjectRelationshipIndexValue;
- (unint64_t)containerUserQueryIndexValue;
- (unint64_t)filteringAttributesIndexValue;
- (unint64_t)filteringRelationshipsIndexValue;
- (unint64_t)objectToContainerRelationshipIndexValue;
- (unint64_t)possibleChangesForChange:(id)a3;
- (unint64_t)sortingAttributesIndexValue;
- (void)_prepareCombinedQueryKeys;
- (void)_prepareContainerInfo;
- (void)_prepareFilteringAttributes;
- (void)_setBasePredicate:(id)a3;
- (void)_setCollectionFetchType:(int64_t)a3;
- (void)_setContainerCollection:(id)a3;
- (void)_setIdentificationBlock:(id)a3;
- (void)_setIncludesCameraRoll:(BOOL)a3;
- (void)setFetchOptions:(id)a3;
- (void)setPropertiesToFetchWhenGrouping:(id)a3;
- (void)setPropertiesToGroupBy:(id)a3;
- (void)visitPredicate:(id)a3;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation PHQuery

- (NSRelationshipDescription)containerRelationship
{
  [(PHQuery *)self _prepareContainerInfo];
  containerRelationship = self->_containerRelationship;

  return containerRelationship;
}

+ (id)_containerIdentifierForFetchType:(id)a3 predicate:(id)a4 outRelationship:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  v9 = [v8 leftExpression];
  if ([v9 expressionType] != 3)
  {
    v16 = 0;
    v10 = 0;
    goto LABEL_15;
  }
  v10 = [v9 keyPath];

  if (!v10)
  {
    v16 = 0;
LABEL_9:
    v19 = 0;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v11 = [(objc_class *)+[PHPhotoLibrary classForFetchType:v7] managedEntityName];
  v12 = [MEMORY[0x1E4F8A980] managedObjectModel];
  v13 = [v12 entitiesByName];
  v14 = [v13 objectForKey:v11];

  v15 = [v14 relationshipsByName];
  v16 = [v15 objectForKey:v10];

  if (!v16) {
    goto LABEL_9;
  }
  v9 = [v8 rightExpression];
  if (![v9 expressionType])
  {
    v17 = [v9 constantValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v19 = [v9 constantValue];
      goto LABEL_16;
    }
  }
LABEL_15:
  v19 = 0;
LABEL_16:

  if (a5) {
LABEL_10:
  }
    *a5 = v16;
LABEL_11:

  return v19;
}

+ (id)_relationshipForFetchType:(id)a3 predicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = 0;
    goto LABEL_7;
  }
  id v7 = [v6 leftExpression];
  if ([v7 expressionType] == 3)
  {
    id v8 = [v7 keyPath];
    goto LABEL_4;
  }
  if ([v7 expressionType] == 4)
  {
    v9 = [v7 function];
    v11 = [v9 lowercaseString];
    if (![v11 isEqualToString:@"noindex:"])
    {
      id v8 = 0;
      v13 = 0;
      goto LABEL_15;
    }
    v14 = [v7 arguments];
    uint64_t v15 = [v14 count];

    if (v15 == 1)
    {
      v16 = [v7 arguments];
      v17 = [v16 firstObject];

      if ([v17 expressionType] == 3)
      {
        id v8 = [v17 keyPath];
      }
      else
      {
        id v8 = 0;
      }

LABEL_4:
      if (v8)
      {
        id v7 = [(objc_class *)+[PHPhotoLibrary classForFetchType:v5] managedEntityName];
        v9 = [MEMORY[0x1E4F8A980] managedObjectModel];
        v10 = [v9 entitiesByName];
        v11 = [v10 objectForKey:v7];

        v12 = [v11 relationshipsByName];
        v13 = [v12 objectForKey:v8];

LABEL_15:
        goto LABEL_16;
      }
LABEL_7:
      v13 = 0;
      goto LABEL_17;
    }
  }
  id v8 = 0;
  v13 = 0;
LABEL_16:

LABEL_17:

  return v13;
}

- (id)effectivePredicateForPHClass:(Class)a3 includingBasePredicate:(BOOL)a4
{
  BOOL v4 = a4;
  v71[2] = *MEMORY[0x1E4F143B8];
  id v7 = [(PHQuery *)self photoLibrary];
  id v8 = [v7 managedObjectContextForCurrentQueueQoS];

  v9 = [(PHQuery *)self filterPredicate];
  v10 = [(PHQuery *)self fetchOptions];
  v11 = [v10 internalPredicate];

  v12 = [(PHQuery *)self fetchOptions];
  v13 = [v12 internalInclusionPredicate];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = 0;
  basePredicate = self->_basePredicate;
  if (basePredicate && v4)
  {
    uint64_t v15 = basePredicate;
    [v14 addObject:v15];
  }
  v17 = v9;
  if (v9 || (v17 = v11) != 0) {
    [v14 addObject:v17];
  }
  v18 = [(PHQuery *)self fetchOptions];
  char v19 = [v18 isExclusivePredicate];

  if ((v19 & 1) == 0)
  {
    v20 = [(PHQuery *)self _globalPredicatesForPHClass:a3];
    [v14 addObjectsFromArray:v20];
  }
  v21 = [(objc_class *)a3 managedEntityName];
  v22 = PLSafeEntityForNameInManagedObjectContext();

  if (v22)
  {
    v23 = [MEMORY[0x1E4F8A848] entityName];
    v24 = PLSafeEntityForNameInManagedObjectContext();

    if (v24)
    {
      v25 = PLSafeEntityForNameInManagedObjectContext();
      if (v25)
      {
        v69 = v13;
        if ([v22 isKindOfEntity:v24]
          && ![(PHQuery *)self _includesCameraRoll])
        {
          v65 = v25;
          v26 = [(PHQuery *)self fetchOptions];
          if (!v26)
          {
            v26 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
          }
          v27 = [v26 photoLibrary];

          if (!v27) {
            [v26 setPhotoLibrary:self->_photoLibrary];
          }
          v28 = [v26 photoLibrary];
          photoLibrary = self->_photoLibrary;

          if (v28 != photoLibrary)
          {
            v30 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_FAULT, "fetchOptions passed to PHQuery has a photoLibrary set that does not match _photoLibrary", buf, 2u);
            }
          }
          id v31 = v26;
          v32 = [v31 photoLibrary];

          if (!v32)
          {
            v63 = [MEMORY[0x1E4F28B00] currentHandler];
            v64 = [NSString stringWithUTF8String:"NSPredicate *_predicateForFilteringCollections(PHFetchOptions *__strong)"];
            [v63 handleFailureInFunction:v64, @"PHQuery.m", 2889, @"Invalid parameter not satisfying: %@", @"fetchOptions.photoLibrary != nil" file lineNumber description];
          }
          v33 = (void *)MEMORY[0x1E4F8A848];
          [v31 photoLibrary];
          v35 = v34 = v31;
          v36 = objc_msgSend(v33, "defaultAlbumKindsForFetchingWithCPLEnabled:", objc_msgSend(v35, "isCloudPhotoLibraryEnabled"));

          v67 = v34;
          if ([v34 includeFavoriteMemoriesCollectionList])
          {
            uint64_t v37 = [v36 arrayByAddingObject:&unk_1EEB25CB0];

            v36 = (void *)v37;
            v34 = v67;
          }
          v25 = v65;
          if ([v34 includePlacesSmartAlbum])
          {
            uint64_t v38 = [v36 arrayByAddingObject:&unk_1EEB25CE0];

            v36 = (void *)v38;
            v34 = v67;
          }
          if ([v34 includeUserSmartAlbums])
          {
            uint64_t v39 = [v36 arrayByAddingObject:&unk_1EEB25CF8];

            v36 = (void *)v39;
            v34 = v67;
          }
          if ([v34 includeRecentlyEditedSmartAlbum])
          {
            uint64_t v40 = [v36 arrayByAddingObject:&unk_1EEB25D10];

            v36 = (void *)v40;
            v34 = v67;
          }
          if ([v34 includeScreenRecordingsSmartAlbum])
          {
            uint64_t v41 = [v36 arrayByAddingObject:&unk_1EEB25D28];

            v36 = (void *)v41;
            v34 = v67;
          }
          if ([v34 includeSharedLibrarySharingSuggestionsSmartAlbum])
          {
            uint64_t v42 = [v36 arrayByAddingObject:&unk_1EEB25D40];

            v36 = (void *)v42;
            v34 = v67;
          }
          if ([v34 includeAllPhotosSmartAlbum])
          {
            uint64_t v43 = [v36 arrayByAddingObject:&unk_1EEB25D58];

            v36 = (void *)v43;
            v34 = v67;
          }
          if ([v34 includeActionCamVideoSmartAlbum])
          {
            uint64_t v44 = [v36 arrayByAddingObject:&unk_1EEB25D70];

            v36 = (void *)v44;
            v34 = v67;
          }
          if ([v34 includeProResSmartAlbum])
          {
            uint64_t v45 = [v36 arrayByAddingObject:&unk_1EEB25D88];

            v36 = (void *)v45;
            v34 = v67;
          }
          if ([v34 includeDuplicatesAlbums])
          {
            v46 = [v36 arrayByAddingObject:&unk_1EEB25DA0];

            v36 = [v46 arrayByAddingObject:&unk_1EEB25DB8];
          }
          v47 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"kind IN %@", v36];

          [v14 addObject:v47];
        }
        v68 = v11;
        if ([v22 isKindOfEntity:v25])
        {
          v48 = [v9 description];
          char v49 = [v48 containsString:@"cloudRelationshipState"];

          if ((v49 & 1) == 0)
          {
            v50 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudRelationshipState != %d", 1);
            [v14 addObject:v50];
          }
        }
        v66 = v24;
        if (![v14 count])
        {
          v51 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
          [v14 addObject:v51];
        }
        uint64_t v52 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v14];
        v53 = (void *)v52;
        v13 = v69;
        if (v69)
        {
          v54 = (void *)MEMORY[0x1E4F28BA0];
          v71[0] = v52;
          v71[1] = v69;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
          v55 = v22;
          v56 = v9;
          v57 = v8;
          v58 = v15;
          v60 = v59 = v25;
          uint64_t v61 = [v54 orPredicateWithSubpredicates:v60];

          v25 = v59;
          uint64_t v15 = v58;
          id v8 = v57;
          v9 = v56;
          v22 = v55;
          v53 = (void *)v61;
        }
        v24 = v66;
        v11 = v68;
      }
      else
      {
        v53 = 0;
      }
    }
    else
    {
      v53 = 0;
    }
  }
  else
  {
    v53 = 0;
  }

  return v53;
}

- (NSPredicate)filterPredicate
{
  v3 = [(PHQuery *)self fetchOptions];
  BOOL v4 = [v3 predicate];
  if (v4 != self->_cachedFetchOptionsPredicate)
  {
    objc_storeStrong((id *)&self->_cachedFetchOptionsPredicate, v4);
    if (self->_cachedFetchOptionsPredicate)
    {
      objc_msgSend((id)objc_opt_class(), "_filterPredicateFromFetchOptionsPredicate:options:phClass:", self->_cachedFetchOptionsPredicate, v3, +[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", self->_fetchType));
      id v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      filterPredicate = self->_filterPredicate;
      self->_filterPredicate = v5;
    }
    else
    {
      filterPredicate = self->_filterPredicate;
      self->_filterPredicate = 0;
    }
  }
  id v7 = self->_filterPredicate;

  return v7;
}

- (NSString)fetchType
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (id)containerIdentifier
{
  [(PHQuery *)self _prepareContainerInfo];
  containerIdentifier = self->_containerIdentifier;

  return containerIdentifier;
}

- (void)_prepareContainerInfo
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_preparedContainerInfo)
  {
    if ([(PHQuery *)v2 collectionFetchType] == 3)
    {
      v3 = objc_opt_class();
      fetchType = v2->_fetchType;
      basePredicate = v2->_basePredicate;
      id v11 = 0;
      uint64_t v6 = [v3 _containerIdentifierForFetchType:fetchType predicate:basePredicate outRelationship:&v11];
      id v7 = (NSRelationshipDescription *)v11;
      containerIdentifier = v2->_containerIdentifier;
      v2->_containerIdentifier = (NSManagedObjectID *)v6;

      containerRelationship = v2->_containerRelationship;
      v2->_containerRelationship = v7;
    }
    else
    {
      if (![(PHQuery *)v2 _isUserSmartAlbum])
      {
LABEL_7:
        v2->_preparedContainerInfo = 1;
        goto LABEL_8;
      }
      uint64_t v10 = [(PHObject *)v2->_containerCollection objectID];
      containerRelationship = v2->_containerIdentifier;
      v2->_containerIdentifier = (NSManagedObjectID *)v10;
    }

    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v2);
}

- (NSFetchRequest)fetchRequest
{
  if (self->_searchIndexLookupIdentifier)
  {
    v2 = 0;
  }
  else
  {
    fetchRequest = self->_fetchRequest;
    if (!fetchRequest)
    {
      id v5 = [(PHQuery *)self _createFetchRequestIncludingBasePredicate:1];
      uint64_t v6 = self->_fetchRequest;
      self->_fetchRequest = v5;

      fetchRequest = self->_fetchRequest;
    }
    v2 = fetchRequest;
  }

  return v2;
}

- (id)_effectiveSortDescriptors
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PHQuery *)self fetchOptions];
  BOOL v4 = [v3 sortDescriptors];

  id v5 = [(PHQuery *)self fetchOptions];
  uint64_t v6 = [v5 internalSortDescriptors];

  if (v4)
  {
    id v7 = [(id)objc_opt_class() _transformedSortDescriptors:v4 forFetchType:self->_fetchType];
LABEL_5:
    id v8 = v7;
    goto LABEL_6;
  }
  if (v6)
  {
    id v7 = v6;
    goto LABEL_5;
  }
  if (![(PHCollection *)self->_containerCollection isUserSmartAlbum])
  {
    id v8 = [(PHCollection *)self->_containerCollection effectiveCustomSortDescriptors];
    v24 = [(PHQuery *)self fetchOptions];
    v23 = -[PHQuery _effectiveDefaultSortDescriptorReversingOrder:](self, "_effectiveDefaultSortDescriptorReversingOrder:", [v24 reverseDefaultSortDescriptors]);

    if (v23 && v8)
    {
      uint64_t v25 = [v8 arrayByAddingObject:v23];

      id v8 = (void *)v25;
    }
    else if (v23 && !v8)
    {
      v32[0] = v23;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    }
    goto LABEL_30;
  }
  char v19 = [MEMORY[0x1E4F8A810] sortDescriptorsForAlbumKind:1507];
  id v8 = (void *)[v19 mutableCopy];

  if ([(PHCollection *)self->_containerCollection customSortKey] == 5
    || [(PHCollection *)self->_containerCollection customSortKey] == 101)
  {
    v20 = (void *)MEMORY[0x1E4F29008];
    v21 = @"additionalAttributes.title";
    BOOL v22 = 1;
LABEL_23:
    v23 = [v20 sortDescriptorWithKey:v21 ascending:v22];
    [v8 insertObject:v23 atIndex:0];
LABEL_30:

    goto LABEL_6;
  }
  if ([(PHCollection *)self->_containerCollection customSortKey] == 1)
  {
    v26 = (void *)MEMORY[0x1E4F29008];
    BOOL v22 = [(PHCollection *)self->_containerCollection customSortAscending];
    v21 = @"dateCreated";
    v20 = v26;
    goto LABEL_23;
  }
LABEL_6:
  v9 = [(PHQuery *)self fetchOptions];
  int v10 = [v9 reverseSortOrder];

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "reversedSortDescriptor", (void)v27);
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (PHFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

+ (id)queryForType:(id)a3 withBasePredicate:(id)a4 inLibrary:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initForType:v10 withBasePredicate:v9 inLibrary:v8];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (id *)[objc_alloc((Class)objc_opt_class()) initForType:self->_fetchType withBasePredicate:self->_basePredicate inLibrary:self->_photoLibrary];
  id v5 = [(PHQuery *)self fetchOptions];
  [v4 setFetchOptions:v5];

  objc_msgSend(v4, "_setIncludesCameraRoll:", -[PHQuery _includesCameraRoll](self, "_includesCameraRoll"));
  uint64_t v6 = (void *)[(PHCollection *)self->_containerCollection copy];
  [v4 _setContainerCollection:v6];

  objc_msgSend(v4, "_setCollectionFetchType:", -[PHQuery collectionFetchType](self, "collectionFetchType"));
  [v4 _setIdentificationBlock:self->_identificationBlock];
  id v7 = [(PHQuery *)self propertiesToGroupBy];
  [v4 setPropertiesToGroupBy:v7];

  id v8 = [(PHQuery *)self propertiesToFetchWhenGrouping];
  [v4 setPropertiesToFetchWhenGrouping:v8];

  objc_storeStrong(v4 + 34, self->_searchIndexLookupIdentifier);
  return v4;
}

- (id)initForType:(id)a3 withBasePredicate:(id)a4 seedOIDs:(id)a5 inLibrary:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PHQuery;
  uint64_t v15 = [(PHQuery *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fetchType, a3);
    objc_storeStrong((id *)&v16->_basePredicate, a4);
    objc_storeStrong((id *)&v16->_seedOIDs, a5);
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
    uint64_t v17 = [(PHPhotoLibrary *)v16->_photoLibrary librarySpecificFetchOptions];
    fetchOptions = v16->_fetchOptions;
    v16->_fetchOptions = (PHFetchOptions *)v17;

    if (v11)
    {
      if (v14) {
        goto LABEL_4;
      }
      v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = *MEMORY[0x1E4F1C3C8];
      BOOL v22 = @"PHQuery requires a library";
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = *MEMORY[0x1E4F1C3C8];
      BOOL v22 = @"PHQuery requires a type";
    }
    id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
LABEL_4:

  return v16;
}

- (id)initForType:(id)a3 withBasePredicate:(id)a4 inLibrary:(id)a5
{
  return [(PHQuery *)self initForType:a3 withBasePredicate:a4 seedOIDs:0 inLibrary:a5];
}

- (NSArray)propertiesToGroupBy
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (int64_t)collectionFetchType
{
  int64_t result = self->_collectionFetchType;
  if (!result)
  {
    BOOL v4 = [(id)objc_opt_class() _relationshipForFetchType:self->_fetchType predicate:self->_basePredicate];
    int64_t v5 = 2;
    if (v4) {
      int64_t v5 = 3;
    }
    self->_collectionFetchType = v5;

    return self->_collectionFetchType;
  }
  return result;
}

- (void)_setContainerCollection:(id)a3
{
}

- (void)_setIdentificationBlock:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  id identificationBlock = self->_identificationBlock;
  self->_id identificationBlock = v4;
}

- (BOOL)_includesCameraRoll
{
  return self->__includesCameraRoll;
}

- (void)_setCollectionFetchType:(int64_t)a3
{
  self->_collectionFetchType = a3;
}

- (void)setPropertiesToGroupBy:(id)a3
{
}

- (void)setPropertiesToFetchWhenGrouping:(id)a3
{
}

- (NSArray)propertiesToFetchWhenGrouping
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)_setIncludesCameraRoll:(BOOL)a3
{
  self->__includesCameraRoll = a3;
}

- (id)_createFetchRequestIncludingBasePredicate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(PHQuery *)self fetchOptions];
  uint64_t v6 = [v5 relatedEntityName];

  id v7 = +[PHPhotoLibrary classForFetchType:self->_fetchType];
  id v8 = [(objc_class *)v7 managedEntityName];
  if (v6)
  {
    id v9 = [v5 relatedRelationshipProperty];

    if (v9)
    {
      uint64_t v10 = [v5 relatedEntityName];

      id v8 = (void *)v10;
    }
    else
    {
      id v11 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v5;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "fetchOptions.relatedEntityName supplied without a .relatedRelationshipProperty: %@", buf, 0xCu);
      }
    }
  }
  id v12 = [(PHQuery *)self photoLibrary];
  id v13 = [v12 managedObjectContextForCurrentQueueQoS];
  id v14 = PLSafeEntityForNameInManagedObjectContext();
  if (v14)
  {
    uint64_t v15 = objc_opt_new();
    [v15 setEntity:v14];
    v16 = [(PHQuery *)self effectivePredicateForPHClass:v7 includingBasePredicate:v3];
    if (v16) {
      [v15 setPredicate:v16];
    }
    uint64_t v17 = [(PHQuery *)self propertiesToGroupBy];
    if ([v17 count])
    {
      v35 = v16;
      uint64_t v38 = v12;
      [v15 setResultType:2];
      v36 = v17;
      [v15 setPropertiesToGroupBy:v17];
      id v18 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
      [v18 setName:@"objectID"];
      char v19 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
      [v18 setExpression:v19];

      [v18 setExpressionResultType:2000];
      id v41 = v18;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      uint64_t v21 = [(PHQuery *)self propertiesToFetchWhenGrouping];
      uint64_t v22 = [v21 count];

      if (v22)
      {
        id v23 = [(PHQuery *)self propertiesToFetchWhenGrouping];
        uint64_t v24 = [v20 arrayByAddingObjectsFromArray:v23];

        v20 = (void *)v24;
      }
      [v15 setPropertiesToFetch:v20];

      uint64_t v17 = v36;
      id v12 = v38;
      v16 = v35;
    }
    else if (v6)
    {
      [v15 setResultType:2];
      id v25 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
      [v25 setName:@"objectID"];
      uint64_t v39 = v12;
      v26 = (void *)MEMORY[0x1E4F28C68];
      [v5 relatedRelationshipProperty];
      uint64_t v37 = v17;
      v28 = long long v27 = v16;
      long long v29 = [v26 expressionForKeyPath:v28];
      [v25 setExpression:v29];

      v16 = v27;
      uint64_t v17 = v37;
      [v25 setExpressionResultType:2000];
      id v40 = v25;
      long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      [v15 setPropertiesToFetch:v30];

      id v12 = v39;
    }
    else
    {
      [v15 setResultType:1];
    }
    [v15 setIncludesPropertyValues:0];
    [v15 setIncludesPendingChanges:0];
    id v31 = [(PHQuery *)self _effectiveSortDescriptors];
    [v15 setSortDescriptors:v31];
    uint64_t v32 = [v5 fetchLimit];
    if (v32) {
      [v15 setFetchLimit:v32];
    }
    uint64_t v33 = [v5 fetchOffset];
    if (v33) {
      [v15 setFetchOffset:v33];
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)overrideResultClassWithFetchType
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"PHMomentList";
  v6[1] = @"PHSocialGroup";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  BOOL v4 = [(PHQuery *)self fetchType];
  LOBYTE(self) = [v3 containsObject:v4];

  return (char)self;
}

- (id)_effectiveDefaultSortDescriptorReversingOrder:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(PHQuery *)self basePredicate];

  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v6 = objc_opt_class();
  id v7 = [(PHQuery *)self fetchType];
  id v8 = [(PHQuery *)self basePredicate];
  id v9 = [v6 defaultSortDescriptorForFetchType:v7 predicate:v8 ascending:!v3];

  if (!v9)
  {
LABEL_3:
    id v9 = [(PHCollection *)self->_containerCollection defaultSortDescriptor];
  }

  return v9;
}

- (NSPredicate)basePredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 16, 1);
}

+ (id)defaultSortDescriptorForFetchType:(id)a3 predicate:(id)a4 ascending:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = [a1 _relationshipForFetchType:a3 predicate:a4];
  id v7 = [v6 inverseRelationship];
  id v8 = v7;
  if (v7 && [v7 isToMany] && objc_msgSend(v8, "isOrdered"))
  {
    id v9 = (void *)MEMORY[0x1E4F29008];
    uint64_t v10 = [v6 name];
    id v11 = [v9 sortDescriptorWithKey:v10 ascending:v5];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)changeHandlingContainerIdentifier
{
  return 0;
}

- (BOOL)_isUserSmartAlbum
{
  return [(PHCollection *)self->_containerCollection isUserSmartAlbum];
}

- (NSString)searchIndexLookupIdentifier
{
  return self->_searchIndexLookupIdentifier;
}

+ (id)queryForAssetsInAssetCollection:(id)a3 options:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v6];
  if ([v6 assetCollectionType] == 3)
  {
    id v9 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v10 = [v6 objectID];
    id v11 = [v9 predicateWithFormat:@"moment = %@", v10];

    id v12 = (const void *)PHQueryForAssetsInMoment;
LABEL_7:
    uint64_t v15 = (uint64_t)_Block_copy(v12);
LABEL_8:
    v16 = (void *)v15;
LABEL_9:
    id v17 = 0;
    goto LABEL_10;
  }
  if ([v6 assetCollectionType] == 7)
  {
    id v13 = (void *)MEMORY[0x1E4F28F60];
    id v14 = [v6 objectID];
    id v11 = [v13 predicateWithFormat:@"momentShare = %@", v14];

    id v12 = (const void *)PHQueryForAssetsInMomentShare;
    goto LABEL_7;
  }
  if ([v6 assetCollectionType] == 4)
  {
    id v11 = [v6 predicateForAllAssetsWithLibrary:v8];
    id v12 = (const void *)PHQueryForAssetsInMemory;
    goto LABEL_7;
  }
  if ([v6 assetCollectionType] == 2)
  {
    uint64_t v22 = [v6 plAlbumKind];
    if (v22 == 1507)
    {
      id v23 = [v6 userQuery];
      id v17 = objc_alloc_init(MEMORY[0x1E4F8AB00]);
      uint64_t v24 = (void *)MEMORY[0x1E4F8AB08];
      id v25 = [v6 photoLibrary];
      v26 = [v25 photoLibrary];
      id v11 = [v24 predicateForQuery:v23 inLibrary:v26 changeDetectionCriteria:v17];

      v16 = _Block_copy((const void *)PHQueryForAssetsInUserSmartAlbum);
    }
    else
    {
      uint64_t v27 = v22;
      id v11 = objc_msgSend(MEMORY[0x1E4F8A810], "predicateForAlbumKind:includeGuest:", v22, objc_msgSend(v7, "includeGuestAssets"));
      v16 = [a1 identificationBlockForSmartAlbumKind:v27];
      if ([v7 hasAnySortDescriptors]) {
        goto LABEL_9;
      }
      long long v28 = [v6 photoLibrary];
      long long v29 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v28];

      long long v30 = [MEMORY[0x1E4F8A810] sortDescriptorsForAlbumKind:v27];
      [v29 setInternalSortDescriptors:v30];

      id v17 = 0;
      id v7 = v29;
    }
  }
  else
  {
    if ([v6 assetCollectionType] == 6 && objc_msgSend(v6, "isSharingSuggestion"))
    {
      id v11 = _predicateForAssetsInSharedLibrarySharingSuggestionWithOptions(v6);
      id v12 = (const void *)PHQueryForAssetsInSharedLibrarySuggestion;
      goto LABEL_7;
    }
    if ([v6 assetCollectionType] == 6)
    {
      id v11 = _predicateForAssetsInPhotosHighlightWithOptions(v6, v7);
      id v12 = (const void *)PHQueryForAssetsInPhotosHighlight;
      goto LABEL_7;
    }
    if ([v6 assetCollectionType] == 8)
    {
      id v11 = [v6 predicateForAllAssets];
      id v12 = (const void *)PHQueryForAssetsInSuggestion;
      goto LABEL_7;
    }
    if ([v6 assetCollectionType] == 9)
    {
      id v31 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v32 = [v6 objectID];
      id v11 = [v31 predicateWithFormat:@"%K = %@", @"importSession", v32];

      id v12 = (const void *)PHQueryForAssetsInImportSession;
      goto LABEL_7;
    }
    if ([v6 assetCollectionSubtype] != 1000000601
      || [v7 sharingFilter] == 2)
    {
      uint64_t v33 = (void *)MEMORY[0x1E4F28F60];
      v34 = [v6 objectID];
      id v11 = [v33 predicateWithFormat:@"albums CONTAINS %@", v34];

      uint64_t v15 = objc_msgSend(a1, "identificationBlockForAlbumSortKey:", objc_msgSend(v6, "customSortKey"));
      goto LABEL_8;
    }
    id v11 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    id v17 = 0;
    v16 = 0;
  }
LABEL_10:
  id v18 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v8];
  char v19 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v6 options:v7 changeDetectionCriteria:v17];

  [v18 _setContainerCollection:v6];
  if (!v16)
  {
    v20 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v6;
      __int16 v37 = 2112;
      uint64_t v38 = v19;
      _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "Missing identification block for asset collection: %@ with options: %@", buf, 0x16u);
    }
  }
  [v18 _setIdentificationBlock:v16];
  if (v19) {
    [v18 setFetchOptions:v19];
  }

  return v18;
}

+ (id)_fetchOptionsForFetchingAssetsFromAssetCollection:(id)a3 options:(id)a4 changeDetectionCriteria:(id)a5
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 photoLibrary];
  if (v12) {
    goto LABEL_2;
  }
  id v13 = [v10 photoLibrary];

  if (!v13)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PHQuery.m", 1496, @"Invalid parameter not satisfying: %@", @"assetCollection.photoLibrary || options.photoLibrary" object file lineNumber description];
LABEL_2:
  }
  if ([v9 assetCollectionType] == 1)
  {
    if ([v9 assetCollectionSubtype] == 100)
    {
      id v14 = [v9 photoLibrary];
      uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v14];

      if (([v15 hasAnySortDescriptors] & 1) == 0)
      {
        v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
        v40[0] = v16;
        id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:1];
        v40[1] = v17;
        id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];

        [v15 setInternalSortDescriptors:v18];
      }
      [v15 setIncludeDuplicateAssets:1];
      goto LABEL_36;
    }
LABEL_35:
    uint64_t v15 = v10;
    goto LABEL_36;
  }
  if ([v9 assetCollectionType] == 2)
  {
    if ([v9 assetCollectionSubtype] == 205)
    {
      char v19 = [v9 photoLibrary];
      uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v19];

      [v15 setIncludeHiddenAssets:1];
      goto LABEL_36;
    }
    if ([v9 assetCollectionSubtype] == 1000000201)
    {
      id v23 = [v9 photoLibrary];
      uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v23];

      [v15 setIncludeHiddenAssets:1];
LABEL_20:
      [v15 setIncludeTrashedAssets:1];
      goto LABEL_36;
    }
    if ([v9 assetCollectionSubtype] != 1000000204)
    {
      if ([v9 assetCollectionSubtype] == 1000000219)
      {
        long long v30 = [v9 photoLibrary];
        uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v30];

        [v15 setIsExclusivePredicate:1];
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    uint64_t v24 = [v9 userQuery];
    id v25 = [v9 photoLibrary];
    uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v25];

    objc_msgSend(v15, "setIncludeHiddenAssets:", objc_msgSend(MEMORY[0x1E4F8AB08], "includesHiddenAssetsKeyInQuery:", v24));
    goto LABEL_34;
  }
  if ([v9 assetCollectionType] != 4
    && [v9 assetCollectionType] != 7
    && [v9 assetCollectionType] != 8)
  {
    if ([v9 assetCollectionType] == 9)
    {
      v26 = [v9 photoLibrary];
      uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v26];

      if ([v15 hasAnySortDescriptors]) {
        goto LABEL_36;
      }
      uint64_t v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
      uint64_t v38 = v27;
      long long v28 = (void *)MEMORY[0x1E4F1C978];
      long long v29 = &v38;
    }
    else
    {
      if ([v9 assetCollectionType] == 3)
      {
        id v31 = [v9 photoLibrary];
        uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v31];

        goto LABEL_20;
      }
      if ([v9 assetCollectionType] != 6) {
        goto LABEL_35;
      }
      uint64_t v32 = [v9 photoLibrary];
      uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v32];

      if ([v15 hasAnySortDescriptors]) {
        goto LABEL_36;
      }
      uint64_t v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
      __int16 v37 = v27;
      long long v28 = (void *)MEMORY[0x1E4F1C978];
      long long v29 = &v37;
    }
    uint64_t v24 = [v28 arrayWithObjects:v29 count:1];

    [v15 setInternalSortDescriptors:v24];
LABEL_34:

    goto LABEL_36;
  }
  v20 = [v9 photoLibrary];
  uint64_t v15 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v20];

  if (([v15 hasAnySortDescriptors] & 1) == 0)
  {
    uint64_t v21 = +[PHObject internalSortDescriptorForPropertyKey:@"creationDate" ascending:1];
    uint64_t v39 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    [v15 setInternalSortDescriptors:v22];
  }
LABEL_36:
  if (v11)
  {
    uint64_t v33 = [[PHQueryChangeDetectionCriteria alloc] initWithPLQueryChangeDetectionCriteria:v11];
    if (v33)
    {
      v34 = [v9 photoLibrary];
      v35 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v15 photoLibrary:v34];

      [v35 setChangeDetectionCriteria:v33];
      uint64_t v15 = v35;
    }
  }

  return v15;
}

- (void)setFetchOptions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    BOOL v5 = (PHFetchOptions *)[v4 copy];
    fetchOptions = self->_fetchOptions;
    self->_fetchOptions = v5;

    id v7 = [v10 photoLibrary];

    id v4 = v10;
    if (v7)
    {
      id v8 = [v10 photoLibrary];
      photoLibrary = self->_photoLibrary;
      self->_photoLibrary = v8;

      id v4 = v10;
    }
  }
}

- (id)_globalPredicatesForPHClass:(Class)a3
{
  v87[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(PHQuery *)self fetchOptions];
  char v7 = [v6 includeTrashedAssets];
  if ([(objc_class *)a3 managedObjectSupportsTrashedState]
    && (v7 & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F8A950] predicateToExcludeTrashedAssets];
    [v5 addObject:v8];
  }
  char v9 = [v6 includeHiddenAssets];
  if ([(objc_class *)a3 managedObjectSupportsHiddenState]
    && (v9 & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F8A950] predicateToExcludeHiddenAssets];
    [v5 addObject:v10];
  }
  char v11 = [v6 includeTrashedShares];
  if ([(objc_class *)a3 managedObjectSupportsShareTrashedState]
    && (v11 & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F8ABD0] predicateToExcludeTrashedShares];
    [v5 addObject:v12];
  }
  char v13 = [v6 includeExpiredShares];
  if ([(objc_class *)a3 managedObjectSupportsShareExpiredState]
    && (v13 & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F8ABD0] predicateToExcludeExpiredShares];
    [v5 addObject:v14];
  }
  char v15 = [v6 includeExitingShares];
  if ([(objc_class *)a3 managedObjectSupportsShareExitingState]
    && (v15 & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F8A8D8] predicateToExcludeExitingLibraryScopes];
    [v5 addObject:v16];
  }
  int v17 = [v6 includeOnlyAssetsAllowedForAnalysis];
  if ([(objc_class *)a3 managedObjectSupportsAllowedForAnalysis]&& v17)
  {
    id v18 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyAllowedForAnalysisAssets];
    [v5 addObject:v18];
  }
  int v19 = [v6 includeOnlyContentContributedByCurrentUser];
  int v20 = [v6 includeBothPrivateAssetsAndSharedContentContributedByCurrentUser];
  if ([(objc_class *)a3 managedObjectSupportsContributor])
  {
    if (v19)
    {
      uint64_t v21 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyContentContributedByCurrentUser];
LABEL_36:
      uint64_t v27 = (void *)v21;
      [v5 addObject:v21];

      goto LABEL_37;
    }
    if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F8A950] predicateToIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser];
      goto LABEL_36;
    }
    uint64_t v22 = [v6 useNoIndexOnSharingFilter];
    if ([v6 sharingFilter] != 2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = self->_containerCollection;
        if ([(PHCollection *)v23 assetCollectionType] == 2)
        {
          if ([(PHCollection *)v23 assetCollectionSubtype] == 209) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = v22;
          }
        }
      }
    }
    int v24 = [v6 sharingFilter];
    if (v24 == 1)
    {
      id v25 = (void *)MEMORY[0x1E4F8A950];
      uint64_t v26 = 1;
      goto LABEL_35;
    }
    if (!v24)
    {
      id v25 = (void *)MEMORY[0x1E4F8A950];
      uint64_t v26 = 0;
LABEL_35:
      uint64_t v21 = [v25 predicateForAssetSharingFilter:v26 noindex:v22];
      goto LABEL_36;
    }
  }
LABEL_37:
  if ([(objc_class *)a3 managedObjectSupportsVisibilityState])
  {
    if (([v6 includeDuplicateAssets] & 1) == 0)
    {
      long long v28 = [(PHQuery *)self photoLibrary];
      char v29 = [v28 isCloudPhotoLibraryEnabled];

      if ((v29 & 1) == 0)
      {
        long long v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(visibilityState) = %d", 0);
        id v31 = (void *)MEMORY[0x1E4F28BA0];
        v87[0] = v30;
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
        uint64_t v33 = objc_msgSend(MEMORY[0x1E4F8BA10], "subpredicatesForExcludeMask:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPhotoStreamAsset"));
        v34 = [v32 arrayByAddingObjectsFromArray:v33];
        v35 = [v31 orPredicateWithSubpredicates:v34];

        [v5 addObject:v35];
      }
    }
  }
  if (-[objc_class managedObjectSupportsDuplicateVisibilityState](a3, "managedObjectSupportsDuplicateVisibilityState")&& [v6 excludeDuplicateAssetVisibilityStateHidden])
  {
    id v36 = [MEMORY[0x1E4F8A950] predicateToExcludeDuplicateAssetVisibilityStateHidden];
    [v5 addObject:v36];
  }
  if (-[objc_class managedObjectSupportsDuplicateVisibilityState](a3, "managedObjectSupportsDuplicateVisibilityState")&& [v6 includeDuplicateAssetVisibilityStateMostRelevant])
  {
    __int16 v37 = [MEMORY[0x1E4F8A950] predicateToIncludeDuplicateAssetVisibilityStateMostRelevant];
    [v5 addObject:v37];
  }
  if ([(objc_class *)a3 managedObjectSupportsAssetStacks]
    && [v6 excludeNonVisibleStackedAssets])
  {
    uint64_t v38 = [MEMORY[0x1E4F8A950] predicateToExcludeNonVisibleStackedAssets];
    [v5 addObject:v38];
  }
  if ([(objc_class *)a3 managedObjectSupportsPendingState]
    && ([v6 includePendingMemories] & 1) == 0)
  {
    uint64_t v39 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(pendingState) != %d", 1);
    [v5 addObject:v39];
  }
  if ([(objc_class *)a3 managedObjectSupportsPendingState]
    && ([v6 includeLocalMemories] & 1) == 0)
  {
    id v40 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(pendingState) != %d", 2);
    [v5 addObject:v40];
  }
  if ([(objc_class *)a3 managedObjectSupportsCreationType]
    && ([v6 includeStoryMemories] & 1) == 0)
  {
    id v41 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(creationType) != %d", 1);
    [v5 addObject:v41];
  }
  if ([(objc_class *)a3 managedObjectSupportsPendingState]
    && ([v6 includeSourceMemories] & 1) == 0)
  {
    uint64_t v42 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == nil", @"targetUserEditedMemory");
    [v5 addObject:v42];
  }
  if ([(objc_class *)a3 managedObjectSupportsRejectedState]
    && ([v6 includeRejectedMemories] & 1) == 0)
  {
    uint64_t v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(rejected) == NO"];
    [v5 addObject:v43];
  }
  if ([(objc_class *)a3 managedObjectSupportsPersonFilters])
  {
    uint64_t v44 = +[PHQueryPersonContext subpredicatesForFetchOptions:v6];
    [v5 addObjectsFromArray:v44];
  }
  if ([(objc_class *)a3 managedObjectSupportsKeyFaces]
    && [v6 includeOnlyPersonsWithVisibleKeyFaces])
  {
    uint64_t v45 = [MEMORY[0x1E4F8AA10] predicateForVisibleKeyFace];
    [v5 addObject:v45];
  }
  if ([(objc_class *)a3 managedObjectSupportsMontage]
    && [v6 excludeMontageAssets])
  {
    v46 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(additionalAttributes.montage) == nil"];
    [v5 addObject:v46];
  }
  if ([(objc_class *)a3 managedObjectSupportsScreenshot]
    && [v6 excludeScreenshotAssets])
  {
    v47 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == NO", @"isDetectedScreenshot");
    [v5 addObject:v47];
  }
  if ([(objc_class *)a3 managedObjectSupportsBursts]
    && ([v6 includeAllBurstAssets] & 1) == 0)
  {
    v48 = [(PHQuery *)self containerIdentifier];
    if (!v48) {
      goto LABEL_81;
    }
    char v49 = objc_opt_class();
    v50 = [v48 entity];
    LODWORD(v49) = [v49 _isKindOfMomentOrAlbumEntity:v50];

    if (!v49) {
      goto LABEL_81;
    }
    v51 = [(PHQuery *)self containerRelationship];
    uint64_t v52 = [v51 inverseRelationship];

    v53 = [v52 name];
    char v54 = [v53 isEqualToString:@"assets"];

    if ((v54 & 1) == 0)
    {
LABEL_81:
      v55 = [MEMORY[0x1E4F8A950] predicateToExcludeNonvisibleBurstAssets];
      [v5 addObject:v55];
    }
  }
  int v56 = [(objc_class *)a3 managedObjectSupportsFaceState];
  if (v6 && v56 && ([v6 includeNonvisibleFaces] & 1) == 0)
  {
    v57 = [MEMORY[0x1E4F8A7B0] predicatesToExcludeNonVisibleFaces];
    [v5 addObjectsFromArray:v57];
  }
  if ([(objc_class *)a3 managedObjectSupportsFaceState]
    && [v6 includeOnlyFacesNeedingFaceCrop])
  {
    v58 = [MEMORY[0x1E4F8A7B0] predicatesForFacesNeedingFaceCropGeneration];
    [v5 addObjectsFromArray:v58];
  }
  if ([(objc_class *)a3 managedObjectSupportsFaceState]
    && [v6 includeOnlyFacesWithFaceprints])
  {
    v59 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(faceprint) != nil"];
    [v5 addObject:v59];
  }
  if ([(objc_class *)a3 managedObjectSupportsFaceState]
    && [v6 includeOnlyFacesInFaceGroups])
  {
    v60 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(faceGroup) != nil"];
    [v5 addObject:v60];
  }
  if ([(objc_class *)a3 managedObjectSupportsSavedAssetType])
  {
    uint64_t v61 = [(PHQuery *)self photoLibrary];
    int v62 = [v61 isCloudPhotoLibraryEnabled];

    if (v62)
    {
      v63 = objc_msgSend(MEMORY[0x1E4F8BA10], "subpredicatesForExcludeMask:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPhotoStreamAsset"));
      [v5 addObjectsFromArray:v63];
    }
  }
  if ([(objc_class *)a3 managedObjectSupportsAdjustments]
    && [v6 includeRecentlyEditedSmartAlbum])
  {
    v64 = [MEMORY[0x1E4F8A950] predicateToExcludeCameraAutoAdjustments];
    [v5 addObject:v64];
  }
  if (_globalPredicatesForPHClass__onceToken != -1) {
    dispatch_once(&_globalPredicatesForPHClass__onceToken, &__block_literal_global_145);
  }
  v65 = [v6 photoLibrary];
  int v66 = [v65 type];

  if (v66)
  {
    v67 = [v6 photoLibrary];
    int v68 = [v67 type];

    if (v68 == 1)
    {
      char v69 = [v6 includePlaceholderAssets];
      if ([(objc_class *)a3 managedObjectSupportsSavedAssetType])
      {
        LOWORD(v86) = 257;
        HIDWORD(v85) = 16843009;
        BYTE3(v85) = v69 ^ 1;
        BYTE2(v85) = 0;
        LOWORD(v85) = 257;
        uint64_t v70 = objc_msgSend(MEMORY[0x1E4F8BA10], "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 1, 1, v85, v86);
LABEL_111:
        v71 = [MEMORY[0x1E4F8BA10] subpredicatesForExcludeMask:v70];
        [v5 addObjectsFromArray:v71];
      }
    }
  }
  else if ([(objc_class *)a3 managedObjectSupportsSavedAssetType] {
         && !_globalPredicatesForPHClass__linkedOnOrBefore8_0)
  }
  {
    uint64_t v70 = +[PHQuery _excludeMaskForUserLibraryWithFetchOptions:v6];
    goto LABEL_111;
  }
  if (![(objc_class *)a3 managedObjectSupportsDetectionType]) {
    goto LABEL_123;
  }
  v72 = [v6 includedDetectionTypes];
  v73 = v72;
  if (v72)
  {
    id v74 = v72;
  }
  else
  {
    id v74 = +[PHFetchOptions defaultDetectionTypes];
  }
  if ((Class)objc_opt_class() == a3)
  {
    v75 = (id *)0x1E4F8A7B0;
LABEL_120:
    uint64_t v76 = [*v75 predicateForIncludedDetectionTypes:v74];
    if (v76)
    {
      v77 = (void *)v76;
      [v5 addObject:v76];
    }
    goto LABEL_122;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v75 = (id *)0x1E4F8AA10;
    goto LABEL_120;
  }
LABEL_122:

LABEL_123:
  if ([(objc_class *)a3 managedObjectSupportsBodyDetection])
  {
    int64_t v78 = +[PHFace faceFetchTypeForOptions:v6];
    v79 = [MEMORY[0x1E4F8A7B0] predicateForFetchType:v78];
    objc_msgSend(v5, "_pl_addNonNilObject:", v79);
  }
  if ([(objc_class *)a3 managedObjectSupportsTorsoOnly]
    && (!v6 || ([v6 includeTorsoOnlyPerson] & 1) == 0))
  {
    v80 = [MEMORY[0x1E4F8AA10] predicateToExcludeTorsoOnlyPerson];
    [v5 addObject:v80];
  }
  int v81 = [(objc_class *)a3 managedObjectSupportsSharingComposition];
  if (v6 && v81 && [v6 sharingFilter] != 2)
  {
    v82 = -[objc_class fetchPredicateForSharingFilter:](a3, "fetchPredicateForSharingFilter:", [v6 sharingFilter]);
    if (v82) {
      [v5 addObject:v82];
    }
  }
  id v83 = v5;

  return v83;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 264, 1);
}

+ (unsigned)_excludeMaskForUserLibraryWithFetchOptions:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 includeAssetSourceTypes];
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = (v5 & 2) == 0 && v5 != 0;
  BOOL v7 = (v5 & 4) == 0 && v5 != 0;
  if (v4) {
    char v8 = [v4 includeGuestAssets] ^ 1;
  }
  else {
    char v8 = 1;
  }
  BYTE1(v12) = v7;
  LOBYTE(v12) = 1;
  HIBYTE(v11) = (v5 & 0x40) == 0;
  BYTE6(v11) = v8;
  BYTE5(v11) = (v5 & 0x10) == 0;
  BYTE4(v11) = 0;
  LODWORD(v11) = 16842752;
  unsigned int v9 = objc_msgSend(MEMORY[0x1E4F8BA10], "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, v6, 0, v11, v12);
  if (v5 && (v5 & 1) == 0) {
    v9 |= [MEMORY[0x1E4F8BA10] maskForUserLibrary];
  }

  return v9;
}

+ (BOOL)_isKindOfMomentOrAlbumEntity:(id)a3
{
  id v3 = a3;
  if (_isKindOfMomentOrAlbumEntity__onceToken != -1) {
    dispatch_once(&_isKindOfMomentOrAlbumEntity__onceToken, &__block_literal_global_34804);
  }
  if ([v3 isKindOfEntity:_isKindOfMomentOrAlbumEntity__momentEntity]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isKindOfEntity:_isKindOfMomentOrAlbumEntity__albumEntity];
  }

  return v4;
}

+ (id)queryForKeyAssetInPhotosHighlight:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1750 description:@"Expected input collection to be a PhotosHighlight"];
  }
  unsigned int v9 = +[PHPhotosHighlight keyAssetInverseRelationshipPredicateForHighlight:forHighlightFilter:](PHPhotosHighlight, "keyAssetInverseRelationshipPredicateForHighlight:forHighlightFilter:", v8, [v7 sharingFilter]);
  id v10 = [v8 photoLibrary];
  uint64_t v11 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v9 inLibrary:v10];
  uint64_t v12 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v12 setSortDescriptors:0];
  [v12 setInternalSortDescriptors:0];
  [v11 _setContainerCollection:v8];

  [v11 setFetchOptions:v12];

  return v11;
}

+ (id)identificationBlockForAlbumSortKey:(unsigned int)a3
{
  id v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyManual;
  switch(a3)
  {
    case 0u:
      goto LABEL_9;
    case 1u:
      id v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyCreationDate;
      goto LABEL_9;
    case 2u:
      id v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyLastModifiedDate;
      goto LABEL_9;
    case 3u:
      id v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyImportDate;
      goto LABEL_9;
    case 4u:
      id v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyTrashDate;
      goto LABEL_9;
    case 5u:
      id v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyTitle;
      goto LABEL_9;
    default:
      if (a3 == 101)
      {
        id v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyContentTitle;
LABEL_9:
        char v4 = _Block_copy(*v3);
      }
      else
      {
        char v4 = 0;
      }
      if (v4) {
        uint64_t v5 = v4;
      }
      else {
        uint64_t v5 = (const void *)PHQueryForAssetsAlbum_SortKeyOther;
      }
      BOOL v6 = _Block_copy(v5);

      id v7 = _Block_copy(v6);
      return v7;
  }
}

+ (id)identificationBlockForSmartAlbumKind:(int)a3
{
  id v3 = 0;
  if (a3 <= 1549)
  {
    if (a3 <= 999)
    {
      if (a3 > 14)
      {
        if (a3 == 15)
        {
          char v4 = (const void *)PHQueryForAssetInAlbumKind_LegacyFaces;
        }
        else
        {
          if (a3 != 16) {
            goto LABEL_90;
          }
          char v4 = (const void *)PHQueryForAssetInAlbumKind_Places;
        }
      }
      else if (a3 == 2)
      {
        char v4 = (const void *)PHQueryForAssetInAlbumKind_Regular;
      }
      else
      {
        if (a3 != 12) {
          goto LABEL_90;
        }
        char v4 = (const void *)PHQueryForAssetInAlbumKind_Event;
      }
    }
    else
    {
      switch(a3)
      {
        case 1500:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_PhotoStream;
          break;
        case 1501:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_Wallpaper_UNUSED;
          break;
        case 1502:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_PictureFrame;
          break;
        case 1503:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_CameraSession;
          break;
        case 1504:
          goto LABEL_90;
        case 1505:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_CloudSharedAlbum;
          break;
        case 1506:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_ImportSessionAlbum;
          break;
        case 1507:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_UserSmartAlbum;
          break;
        case 1508:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_Project;
          break;
        case 1509:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_ConversationAlbum;
          break;
        case 1510:
          char v4 = (const void *)PHQueryForAssetInAlbumKind_Duplicate;
          break;
        default:
          if (a3 == 1000)
          {
            char v4 = (const void *)PHQueryForAssetInAlbumKind_SavedPhotos;
          }
          else
          {
            if (a3 != 1100) {
              goto LABEL_90;
            }
            char v4 = (const void *)PHQueryForAssetInAlbumKind_1stSpecial;
          }
          break;
      }
    }
  }
  else if (a3 > 3571)
  {
    switch(a3)
    {
      case 3998:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_ProjectAlbumRootFolder;
        break;
      case 3999:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_RootFolder;
        break;
      case 4000:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_Folder;
        break;
      case 4001:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_FacesStandIn;
        break;
      case 4002:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_EventsStandIn;
        break;
      case 4003:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_ImportStandIn;
        break;
      case 4004:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_EventsSmartFolder;
        break;
      case 4005:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_FacesSmartFolder;
        break;
      case 4006:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_FavoriteMemoriesSmartFolder;
        break;
      default:
        if (a3 == 3572)
        {
          char v4 = (const void *)PHQueryForAssetInAlbumKind_OTARestoreProgressAlbum;
        }
        else
        {
          if (a3 != 3573) {
            goto LABEL_90;
          }
          char v4 = (const void *)PHQueryForAssetInAlbumKind_FilesystemImportProgressAlbum;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1550:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_1WaySyncAlbum;
        break;
      case 1551:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_1WaySyncEvent;
        break;
      case 1552:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_1WaySyncLibraryAlbum;
        break;
      case 1553:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_1WaySyncFolder;
        break;
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1633:
      case 1638:
        goto LABEL_90;
      case 1600:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_AllAssetsAlbum;
        break;
      case 1601:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_AllNonPhotoStreamAssetsAlbum;
        break;
      case 1602:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_AllPhotoStream;
        break;
      case 1603:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_LastImportAlbum;
        break;
      case 1604:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_AllImportedAlbum;
        break;
      case 1605:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_PanoramasAlbum;
        break;
      case 1606:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_VideosAlbum;
        break;
      case 1607:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_VerticalPanoramasAlbum;
        break;
      case 1608:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_HorizontalPanoramasAlbum;
        break;
      case 1609:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_FavoritesAlbum;
        break;
      case 1610:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_TimelapsesAlbum;
        break;
      case 1611:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_AllHiddenAlbum;
        break;
      case 1612:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_TrashBinAlbum;
        break;
      case 1613:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_UserLibraryAlbum;
        break;
      case 1614:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_BurstsAlbum;
        break;
      case 1615:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_SlomoVideosAlbum;
        break;
      case 1616:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_RecentlyAddedAlbum;
        break;
      case 1617:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_SelfPortraitsAlbum;
        break;
      case 1618:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_ScreenshotsAlbum;
        break;
      case 1619:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_PlacesSmartAlbum;
        break;
      case 1620:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_DepthEffectAlbum;
        break;
      case 1621:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_LivePhotosAlbum;
        break;
      case 1622:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_AnimatedAlbum;
        break;
      case 1623:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_LongExposuresAlbum;
        break;
      case 1624:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_UnableToUploadAlbum;
        break;
      case 1625:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_RecentsAlbum_DEPRECATED;
        break;
      case 1626:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_RecentlyEditedAlbum;
        break;
      case 1627:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_ScreenRecordingsAlbum;
        break;
      case 1628:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_AllPhotosAlbum;
        break;
      case 1629:
        id v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:4752 description:@"Unreachable Code: Attempting to get id for DEPRECATED Shared Library Album"];

        id v3 = 0;
        goto LABEL_90;
      case 1630:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_RAWAlbum;
        break;
      case 1631:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_CinematicVideoAlbum;
        break;
      case 1632:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_ProResAlbum;
        break;
      case 1634:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_AllLibraryDuplicatesAlbum;
        break;
      case 1635:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_NotUploadedAlbum_DEPRECATED;
        break;
      case 1636:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_SharedLibrarySharingSuggestionsAlbum;
        break;
      case 1637:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_ActionCamVideoAlbum;
        break;
      case 1639:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_SpatialAlbum;
        break;
      case 1640:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_RecentlySavedAlbum;
        break;
      case 1641:
        char v4 = (const void *)PHQueryForAssetInAlbumKind_RecoveredAlbum;
        break;
      default:
        if (a3 != 3571) {
          goto LABEL_90;
        }
        char v4 = (const void *)PHQueryForAssetInAlbumKind_SyncProgressAlbum;
        break;
    }
  }
  id v3 = _Block_copy(v4);
LABEL_90:
  if (v3) {
    id v8 = v3;
  }
  else {
    id v8 = (const void *)PHQueryForAssetsInOtherSmartAlbum;
  }
  unsigned int v9 = _Block_copy(v8);

  id v10 = _Block_copy(v9);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIndexLookupIdentifier, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_seedOIDs, 0);
  objc_storeStrong((id *)&self->_fetchType, 0);
  objc_storeStrong((id *)&self->_propertiesToFetchWhenGrouping, 0);
  objc_storeStrong((id *)&self->_propertiesToGroupBy, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong(&self->_identificationBlock, 0);
  objc_storeStrong((id *)&self->_filteringRelationshipsIndexValueByBaseEntityName, 0);
  objc_storeStrong((id *)&self->_filteringObjectKeyPaths, 0);
  objc_storeStrong((id *)&self->_filteringOids, 0);
  objc_storeStrong((id *)&self->_filteringKeys, 0);
  objc_storeStrong((id *)&self->_combinedQuerySeparatingIdentifier, 0);
  objc_storeStrong((id *)&self->_combinedQueryKeyPath, 0);
  objc_storeStrong(&self->_combinedQueryGroupKey, 0);
  objc_storeStrong((id *)&self->_containerCollection, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_containerRelationship, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_basePredicate, 0);

  objc_storeStrong((id *)&self->_cachedFetchOptionsPredicate, 0);
}

+ (id)queryForKeyAssetForPerson:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectID];
  unsigned int v9 = [v5 predicateWithFormat:@"ANY %K.%K = %@", @"detectedFaces", @"personBeingKeyFace", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v9 inLibrary:v10];

  return v11;
}

PHFetchResult *__23__PHQuery_executeQuery__block_invoke(uint64_t a1)
{
  v1 = [[PHFetchResult alloc] initWithQuery:*(void *)(a1 + 32)];

  return v1;
}

- (id)executeQuery
{
  id identificationBlock = (void (**)(id, void *))self->_identificationBlock;
  if (identificationBlock)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __23__PHQuery_executeQuery__block_invoke;
    v10[3] = &unk_1E5846C98;
    v10[4] = self;
    identificationBlock[2](identificationBlock, v10);
    char v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v4 = [[PHFetchResult alloc] initWithQuery:self];
  }
  uint64_t v5 = v4;
  if (MEMORY[0x19F38A090]())
  {
    id v6 = [(PHFetchResult *)v5 query];
    id v7 = [v6 fetchType];
    if (v7 == @"PHAsset")
    {
      uint64_t v8 = [(PHFetchResult *)v5 count];

      if (v8) {
        plslogGreenTeaReadingPhotosOrVideos();
      }
    }
    else
    {
    }
  }
  +[PHQuery photoLibraryWasAccessed];

  return v5;
}

- (NSArray)seedOIDs
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

+ (void)photoLibraryWasAccessed
{
  if (PLPlatformPhotosAccessLoggingSupported())
  {
    id v2 = [MEMORY[0x1E4F8B998] sharedInstance];
    [v2 logPhotosAccessWithSelfAuditToken];
  }
}

+ (id)queryForKeyAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 assetCollectionType] == 8)
  {
    id v7 = +[PHQuery queryForKeyAssetsInSuggestion:v5 options:v6];
    uint64_t v8 = v7;
    uint64_t v9 = PHQueryForKeyAssetsInSuggestion;
  }
  else if ([v5 assetCollectionType] == 7)
  {
    id v7 = +[PHQuery queryForKeyAssetsInMomentShare:v5 options:v6];
    uint64_t v8 = v7;
    uint64_t v9 = PHQueryForKeyAssetsInMomentShare;
  }
  else
  {
    if ([v5 assetCollectionType] != 6
      || [v5 assetCollectionSubtype] != 1000000302
      || ![v5 isSharingSuggestion])
    {
      if ([v5 canContainCustomKeyAssets])
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v12 = [v5 objectID];
        char v13 = [v11 predicateWithFormat:@"%K CONTAINS %@", @"albumsBeingKeyAssets", v12];

        id v14 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
        uint64_t v8 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v13 inLibrary:v14];

        char v15 = [v5 photoLibrary];
        v16 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v15];

        [v8 setFetchOptions:v16];
        [v8 _setIdentificationBlock:PHQueryForKeyAssetsInAssetCollection];
      }
      else if ([v5 assetCollectionType] == 3)
      {
        uint64_t v8 = 0;
      }
      else
      {
        int v17 = [v5 photoLibrary];
        id v18 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v17];

        unint64_t v19 = [v18 fetchLimit];
        unint64_t v20 = +[PHQuery maxKeyAssets];
        if (v19 >= v20) {
          unint64_t v21 = v20;
        }
        else {
          unint64_t v21 = v19;
        }
        if (v19) {
          unint64_t v22 = v21;
        }
        else {
          unint64_t v22 = v20;
        }
        [v18 setFetchLimit:v22];
        objc_msgSend(v18, "setReverseSortOrder:", objc_msgSend(v18, "reverseSortOrder") ^ objc_msgSend(v5, "keyAssetsAtEnd"));
        uint64_t v8 = +[PHQuery queryForAssetsInAssetCollection:v5 options:v18];
        id v6 = v18;
      }
      goto LABEL_6;
    }
    id v7 = +[PHQuery queryForKeySharingSuggestionAssetsInHighlight:v5 options:v6];
    uint64_t v8 = v7;
    uint64_t v9 = PHQueryForKeySharingSuggestionAssetsInHighlight;
  }
  [v7 _setIdentificationBlock:v9];
LABEL_6:

  return v8;
}

+ (id)queryForCollageAssetsInDayHighlight:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 kind])
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = +[PHPhotosHighlight collageAssetsInverseRelationshipPredicateForDayHighlight:forHighlightFilter:](PHPhotosHighlight, "collageAssetsInverseRelationshipPredicateForDayHighlight:forHighlightFilter:", v5, [v6 sharingFilter]);
    uint64_t v9 = [v5 photoLibrary];
    id v7 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v8 inLibrary:v9];

    [v6 setUseNoIndexOnSharingFilter:1];
    [v7 _setContainerCollection:v5];
    [v7 setFetchOptions:v6];
  }

  return v7;
}

+ (id)queryForAssetCollectionsWithType:(int64_t)a3 subtype:(int64_t)a4 options:(id)a5
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = _fetchTypeForAssetCollectionTypeAndSubtype(a3, a4);
  uint64_t v9 = &off_1E5840000;
  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:0];
  if (v8)
  {
    id v11 = v7;
    int v12 = dyld_program_sdk_at_least();
    char v13 = 0;
    if (a4) {
      int v14 = 1;
    }
    else {
      int v14 = v12;
    }
    if (v14) {
      int64_t v15 = a4;
    }
    else {
      int64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    switch(a3)
    {
      case 1:
        if (v15 <= 99)
        {
          switch(v15)
          {
            case 2:
              goto LABEL_70;
            case 3:
              uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
              uint64_t v28 = 1551;
              goto LABEL_82;
            case 4:
              uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
              uint64_t v28 = 15;
              goto LABEL_82;
            case 5:
              uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
              uint64_t v28 = 1550;
              goto LABEL_82;
            case 6:
              uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
              uint64_t v28 = 12;
              goto LABEL_82;
            default:
              goto LABEL_84;
          }
        }
        if (v15 <= 1000000000)
        {
          if (v15 == 100)
          {
            uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
            uint64_t v28 = 1500;
          }
          else
          {
            if (v15 != 101) {
              goto LABEL_84;
            }
            uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
            uint64_t v28 = 1505;
          }
        }
        else
        {
          switch(v15)
          {
            case 0x3B9ACA01:
              uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
              uint64_t v28 = 1000;
              break;
            case 0x3B9ACC59:
              uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
              uint64_t v28 = 1510;
              break;
            case 0x7FFFFFFFFFFFFFFFLL:
              goto LABEL_115;
            default:
LABEL_84:
              uint64_t v43 = PLPhotoKitGetLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = 1;
                __int16 v59 = 1024;
                int v60 = v15;
                _os_log_impl(&dword_19B043000, v43, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d", buf, 0xEu);
              }

              if (!dyld_program_sdk_at_least()) {
                goto LABEL_115;
              }
LABEL_120:
              v16 = (void *)MEMORY[0x1E4F28F60];
              uint64_t v17 = 0;
LABEL_10:
              uint64_t v18 = [v16 predicateWithValue:v17];
LABEL_11:
              char v13 = (void *)v18;
LABEL_12:

              unint64_t v19 = +[PHQuery queryForType:v8 withBasePredicate:v13 inLibrary:v10];

              unint64_t v20 = +[PHQuery identificationBlockForAssetCollectionType:a3];
              if (a3 == 1 && a4 == 1000000001)
              {
                [v19 _setIncludesCameraRoll:1];
LABEL_38:
                uint64_t v26 = 0;
                goto LABEL_39;
              }
              switch(a3)
              {
                case 9:
                  id v23 = (void *)MEMORY[0x1E4F29008];
                  int v24 = @"startDate";
                  break;
                case 2:
                  if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_38;
                  }
                  id v23 = (void *)MEMORY[0x1E4F29008];
                  int v24 = @"parentFolder";
                  break;
                case 1:
                  if ((unint64_t)(a4 - 3) >= 2)
                  {
                    if (a4 != 101) {
                      goto LABEL_38;
                    }
                    id v23 = (void *)MEMORY[0x1E4F29008];
                    int v24 = @"cloudLastInterestingChangeDate";
                    uint64_t v25 = 0;
LABEL_27:
                    uint64_t v26 = [v23 sortDescriptorWithKey:v24 ascending:v25];
LABEL_39:
                    if (([v11 hasAnySortDescriptors] & 1) == 0 && v26)
                    {
                      [v9[143] fetchOptionsCopyFromNullableFetchOptions:v11 photoLibrary:v10];
                      v32 = id v31 = v9;

                      v57 = v26;
                      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
                      [v32 setInternalSortDescriptors:v33];

                      id v11 = v32;
                      uint64_t v9 = v31;
                    }
                    id v34 = v11;
                    id v7 = v34;
                    if (a3 != 6)
                    {
                      if (a3 == 2 && a4 == 219)
                      {
                        *(void *)buf = @"PHAssetPropertySetSpatialMedia";
                        v35 = (__CFString **)buf;
                        goto LABEL_53;
                      }
LABEL_50:

LABEL_55:
                      [v19 setFetchOptions:v7];

                      goto LABEL_56;
                    }
                    int v36 = [v34 sharingFilter];
                    if (v36 == 2)
                    {
                      uint64_t v61 = @"PHPhotosHighlightPropertySetPrivateOrShared";
                      v35 = &v61;
                    }
                    else if (v36 == 1)
                    {
                      int v62 = @"PHPhotosHighlightPropertySetOnlyShared";
                      v35 = &v62;
                    }
                    else
                    {
                      if (v36) {
                        goto LABEL_50;
                      }
                      v63[0] = @"PHPhotosHighlightPropertySetOnlyPrivate";
                      v35 = (__CFString **)v63;
                    }
LABEL_53:
                    __int16 v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];

                    if (v37)
                    {
                      uint64_t v38 = [v9[143] fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v10];

                      [v38 addFetchPropertySets:v37];
                      id v7 = v38;
                    }
                    goto LABEL_55;
                  }
                  id v23 = (void *)MEMORY[0x1E4F29008];
                  int v24 = @"syncEventOrderKey";
                  break;
                default:
                  goto LABEL_38;
              }
              uint64_t v25 = 1;
              goto LABEL_27;
          }
        }
LABEL_82:
        objc_msgSend(v27, "predicateWithFormat:", @"kind = %d", v28);
        uint64_t v18 = LABEL_83:;
        goto LABEL_11;
      case 2:
        char v29 = +[PHSmartAlbum albumKindFromSmartAlbumSubtype:v15];
        uint64_t v30 = [v29 integerValue];

        if ((unint64_t)(v15 - 200) >= 0x14)
        {
          switch(v15)
          {
            case 1000000201:
              id v40 = (void *)MEMORY[0x1E4F28F60];
              uint64_t v41 = 1612;
              goto LABEL_93;
            case 1000000202:
            case 1000000208:
            case 1000000209:
            case 1000000210:
            case 1000000213:
            case 1000000216:
            case 1000000217:
              goto LABEL_112;
            case 1000000203:
              if ([v11 includePlacesSmartAlbum])
              {
                id v40 = (void *)MEMORY[0x1E4F28F60];
                uint64_t v41 = 1619;
LABEL_93:
                objc_msgSend(v40, "predicateWithFormat:", @"kind = %d", v41);
                goto LABEL_33;
              }
              uint64_t v45 = PLPhotoKitGetLog();
              uint64_t v9 = &off_1E5840000;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = 2;
                __int16 v59 = 1024;
                int v60 = 1000000203;
LABEL_118:
                _os_log_impl(&dword_19B043000, v45, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d", buf, 0xEu);
              }
LABEL_119:

              goto LABEL_120;
            case 1000000204:
            case 1000000212:
            case 1000000218:
            case 1000000219:
              goto LABEL_32;
            case 1000000205:
              if ([v11 includeAllPhotosSmartAlbum]) {
                goto LABEL_32;
              }
              uint64_t v45 = PLPhotoKitGetLog();
              uint64_t v9 = &off_1E5840000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                goto LABEL_119;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 2;
              __int16 v59 = 1024;
              int v60 = 1000000205;
              goto LABEL_118;
            case 1000000206:
              if ([v11 includeRecentlyEditedSmartAlbum]) {
                goto LABEL_32;
              }
              uint64_t v45 = PLPhotoKitGetLog();
              uint64_t v9 = &off_1E5840000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                goto LABEL_119;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 2;
              __int16 v59 = 1024;
              int v60 = 1000000206;
              goto LABEL_118;
            case 1000000207:
              if ([v11 includeScreenRecordingsSmartAlbum]) {
                goto LABEL_32;
              }
              uint64_t v45 = PLPhotoKitGetLog();
              uint64_t v9 = &off_1E5840000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                goto LABEL_119;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 2;
              __int16 v59 = 1024;
              int v60 = 1000000207;
              goto LABEL_118;
            case 1000000211:
              if ([v11 includeProResSmartAlbum]) {
                goto LABEL_32;
              }
              uint64_t v45 = PLPhotoKitGetLog();
              uint64_t v9 = &off_1E5840000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                goto LABEL_119;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 2;
              __int16 v59 = 1024;
              int v60 = 1000000211;
              goto LABEL_118;
            case 1000000214:
              if ([v11 includeSharedLibrarySharingSuggestionsSmartAlbum]) {
                goto LABEL_32;
              }
              uint64_t v45 = PLPhotoKitGetLog();
              uint64_t v9 = &off_1E5840000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                goto LABEL_119;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 2;
              __int16 v59 = 1024;
              int v60 = 1000000214;
              goto LABEL_118;
            case 1000000215:
              if ([v11 includeActionCamVideoSmartAlbum]) {
                goto LABEL_32;
              }
              uint64_t v45 = PLPhotoKitGetLog();
              uint64_t v9 = &off_1E5840000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                goto LABEL_119;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 2;
              __int16 v59 = 1024;
              int v60 = 1000000215;
              goto LABEL_118;
            default:
              if (v15 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (_os_feature_enabled_impl())
                {
                  uint64_t v44 = [&unk_1EEB26BE0 arrayByAddingObject:&unk_1EEB25F98];
                }
                else
                {
                  uint64_t v44 = &unk_1EEB26BE0;
                }
                uint64_t v9 = &off_1E5840000;
                if ([v11 includePlacesSmartAlbum])
                {
                  uint64_t v47 = [v44 arrayByAddingObject:&unk_1EEB25CE0];

                  uint64_t v44 = (void *)v47;
                }
                if ([v11 includeUserSmartAlbums])
                {
                  uint64_t v48 = [v44 arrayByAddingObject:&unk_1EEB25CF8];

                  uint64_t v44 = (void *)v48;
                }
                if ([v11 includeRecentlyEditedSmartAlbum])
                {
                  uint64_t v49 = [v44 arrayByAddingObject:&unk_1EEB25D10];

                  uint64_t v44 = (void *)v49;
                }
                if ([v11 includeScreenRecordingsSmartAlbum])
                {
                  uint64_t v50 = [v44 arrayByAddingObject:&unk_1EEB25D28];

                  uint64_t v44 = (void *)v50;
                }
                if ([v11 includeSharedLibrarySharingSuggestionsSmartAlbum])
                {
                  uint64_t v51 = [v44 arrayByAddingObject:&unk_1EEB25D40];

                  uint64_t v44 = (void *)v51;
                }
                if ([v11 includeActionCamVideoSmartAlbum])
                {
                  uint64_t v52 = [v44 arrayByAddingObject:&unk_1EEB25D70];

                  uint64_t v44 = (void *)v52;
                }
                if ([v11 includeProResSmartAlbum])
                {
                  uint64_t v53 = [v44 arrayByAddingObject:&unk_1EEB25D88];

                  uint64_t v44 = (void *)v53;
                }
                if ([v11 includeAllPhotosSmartAlbum])
                {
                  uint64_t v54 = [v44 arrayByAddingObject:&unk_1EEB25D58];

                  uint64_t v44 = (void *)v54;
                }
                if ([v11 includeTrashBinAlbum])
                {
                  uint64_t v55 = [v44 arrayByAddingObject:&unk_1EEB25FB0];

                  uint64_t v44 = (void *)v55;
                }
                if ([v11 includeDuplicatesAlbums])
                {
                  uint64_t v56 = [v44 arrayByAddingObject:&unk_1EEB25DA0];

                  uint64_t v44 = (void *)v56;
                }
                char v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"kind IN %@", v44];

                goto LABEL_12;
              }
LABEL_112:
              v46 = PLPhotoKitGetLog();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = 2;
                __int16 v59 = 1024;
                int v60 = v15;
                _os_log_impl(&dword_19B043000, v46, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d", buf, 0xEu);
              }

              uint64_t v9 = &off_1E5840000;
              if (dyld_program_sdk_at_least()) {
                goto LABEL_120;
              }
              break;
          }
LABEL_115:
          char v13 = 0;
        }
        else
        {
LABEL_32:
          objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d", v30);
          char v13 = LABEL_33:;
          uint64_t v9 = &off_1E5840000;
        }
        goto LABEL_12;
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
LABEL_9:
        v16 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v17 = 1;
        goto LABEL_10;
      case 6:
        switch(v15)
        {
          case 1000000301:
            objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d", 0);
            goto LABEL_83;
          case 1000000302:
            uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
            uint64_t v28 = 1;
            goto LABEL_82;
          case 1000000303:
LABEL_70:
            uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
            uint64_t v28 = 2;
            goto LABEL_82;
          case 1000000304:
            uint64_t v27 = (void *)MEMORY[0x1E4F28F60];
            uint64_t v28 = 3;
            goto LABEL_82;
          default:
            if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_9;
            }
            uint64_t v42 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 6;
              __int16 v59 = 1024;
              int v60 = v15;
              _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d", buf, 0xEu);
            }

            break;
        }
        goto LABEL_120;
      default:
        goto LABEL_12;
    }
  }
  unint64_t v21 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = a3;
    __int16 v59 = 1024;
    int v60 = a4;
    _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d (no fetch type)", buf, 0xEu);
  }

  unint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  unint64_t v19 = +[PHQuery queryForType:@"PHAssetCollection" withBasePredicate:v22 inLibrary:v10];

  unint64_t v20 = _Block_copy((const void *)PHQueryForAssetCollectionType_NoFetchType);
LABEL_56:
  [v19 _setIdentificationBlock:v20];

  return v19;
}

+ (id)identificationBlockForAssetCollectionType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xB) {
    id v3 = 0;
  }
  else {
    id v3 = _Block_copy(*off_1E5846E70[a3]);
  }
  if (v3) {
    char v4 = v3;
  }
  else {
    char v4 = (const void *)PHQueryForAssetCollectionType_Other;
  }
  id v5 = _Block_copy(v4);

  id v6 = _Block_copy(v5);

  return v6;
}

+ (unint64_t)maxKeyAssets
{
  return 5;
}

+ (id)queryForKeyAssetInMemory:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 4)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1641 description:@"Fetching for curated assets is only supported in a memory"];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v8 objectID];
  id v11 = [v9 predicateWithFormat:@"memoriesBeingKeyAsset CONTAINS %@", v10];

  int v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  char v13 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v12];

  int v14 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v13 _setContainerCollection:v8];
  [v13 setFetchOptions:v14];

  return v13;
}

+ (id)fetchRootFolderIDForAlbumKind:(int)a3 photoLibrary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 photoLibraryForCurrentQueueQoS];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = [MEMORY[0x1E4F8A968] entityName];
  uint64_t v9 = [v7 fetchRequestWithEntityName:v8];

  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d", v4);
  [v9 setIncludesPropertyValues:0];
  [v9 setResultType:1];
  [v9 setFetchLimit:1];
  [v9 setPredicate:v10];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__34436;
  uint64_t v33 = __Block_byref_object_dispose__34437;
  id v34 = 0;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__34436;
  uint64_t v27 = __Block_byref_object_dispose__34437;
  id v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__PHQuery_fetchRootFolderIDForAlbumKind_photoLibrary___block_invoke;
  v18[3] = &unk_1E5847CB0;
  unint64_t v21 = &v29;
  id v11 = v6;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  unint64_t v22 = &v23;
  [v11 performBlockAndWait:v18];
  char v13 = (void *)v30[5];
  if (v13)
  {
    int v14 = [v13 firstObject];
  }
  else
  {
    int64_t v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v24[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v16;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch root folder %@", buf, 0xCu);
    }

    int v14 = 0;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

+ (id)queryForAssetsInUtilityCollectionWithType:(unsigned __int16)a3 options:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = +[PHUtilityCollection searchLookupIdentifierForUtilityCollectionType:v4];
  if (v7)
  {
    id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
    uint64_t v9 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v8];

    id v10 = [a1 queryForAssetsUsingSearchIndexLookupIdentifier:v7 options:v9];
    [v10 setFetchOptions:v9];

    id v6 = (id)v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)queryForAssetsUsingSearchIndexLookupIdentifier:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:a4 object:0];
  id v8 = [a1 queryForType:@"PHAsset" withBasePredicate:0 inLibrary:v7];

  uint64_t v9 = (void *)v8[34];
  v8[34] = v6;

  return v8;
}

+ (id)_transformedSortDescriptors:(id)a3 forFetchType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[v6 mutableCopy];
  id v8 = +[PHPhotoLibrary classForFetchType:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PHQuery__transformedSortDescriptors_forFetchType___block_invoke;
  v11[3] = &unk_1E5846C68;
  char v13 = v8;
  id v9 = v7;
  id v12 = v9;
  [v6 enumerateObjectsUsingBlock:v11];

  return v9;
}

+ (id)queryForAssetsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v6];

  id v9 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v8 seedOIDs:0 inLibrary:v7];

  id v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v5 photoLibrary:v7];

  [v10 setIncludeTrashedAssets:1];
  [v10 setIncludeAllBurstAssets:1];
  [v10 setIncludeHiddenAssets:1];
  [v9 setFetchOptions:v10];

  return v9;
}

+ (id)queryForType:(id)a3 withBasePredicate:(id)a4 seedOIDs:(id)a5 inLibrary:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int v14 = (void *)[objc_alloc((Class)a1) initForType:v13 withBasePredicate:v12 seedOIDs:v11 inLibrary:v10];

  return v14;
}

+ (id)queryForType:(id)a3 withIdentifiers:(id)a4 identifierKeyPath:(id)a5 options:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        if (v19) {
          [v13 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  id v20 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    id v20 = v13;
  }
  unint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@)", v11, v20, (void)v25];
  unint64_t v22 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v12 object:0];
  uint64_t v23 = +[PHQuery queryForType:v9 withBasePredicate:v21 inLibrary:v22];

  [v23 setFetchOptions:v12];

  return v23;
}

+ (id)_defaultFetchOptionsForIdentifiedAssetsQueryInPhotoLibrary:(id)a3
{
  id v3 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:a3 orObject:0];
  [v3 setIncludeDuplicateAssets:1];
  [v3 setIncludeHiddenAssets:1];

  return v3;
}

+ (id)_filterPredicateFromFetchOptionsPredicate:(id)a3 options:(id)a4 phClass:(Class)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    id v11 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v25 = v10;
    id v12 = [v10 subpredicates];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [a1 _filterPredicateFromFetchOptionsPredicate:*(void *)(*((void *)&v26 + 1) + 8 * i) options:v9 phClass:a5];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v14);
    }

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v25, "compoundPredicateType"), v11);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    uint64_t v18 = [(objc_class *)a5 fetchPredicateFromComparisonPredicate:v8 options:v9];
  }
  if (!v18)
  {
LABEL_16:
    uint64_t v30 = @"predicate";
    id v31 = v8;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    unint64_t v21 = NSString;
    unint64_t v22 = [v8 predicateFormat];
    uint64_t v23 = [v21 stringWithFormat:@"Unsupported predicate in fetch options: %@", v22];

    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:v20];
    objc_exception_throw(v24);
  }

  return v18;
}

void __52__PHQuery__transformedSortDescriptors_forFetchType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v5 = [v14 key];
  id v6 = [*(id *)(a1 + 40) entityKeyForPropertyKey:v5];
  if (!v6)
  {
    uint64_t v15 = @"sortDescriptor";
    v16[0] = v14;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v10 = NSString;
    id v11 = [v14 description];
    uint64_t v12 = [v10 stringWithFormat:@"Unsupported sort descriptor in fetch options: %@", v11];

    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:v9];
    objc_exception_throw(v13);
  }
  id v7 = v6;
  if (([v6 isEqualToString:v5] & 1) == 0)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", v7, objc_msgSend(v14, "ascending"));
    [*(id *)(a1 + 32) replaceObjectAtIndex:a3 withObject:v8];
  }
}

+ (id)queryForAssetsWithOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v5 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:0 inLibrary:v4];
  if (!v3 || ![v3 includeAssetSourceTypes])
  {
    id v6 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v3 photoLibrary:v4];

    [v6 setIncludeAssetSourceTypes:1];
    id v3 = v6;
  }
  [v5 setFetchOptions:v3];

  return v5;
}

+ (id)queryForFacesInAsset:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v6 || ([v6 includeMediaAnalysisProcessingRangeTypes] & 1) != 0)
  {
    id v8 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [v5 objectID];
    id v10 = [v8 predicateWithFormat:@"%K = %@", @"assetForFace", v9];
    [v7 addObject:v10];
  }
  if (([v6 includeMediaAnalysisProcessingRangeTypes] & 2) != 0)
  {
    id v11 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v12 = [v5 objectID];
    id v13 = [v11 predicateWithFormat:@"%K = %@", @"assetForTemporalDetectedFaces", v12];
    [v7 addObject:v13];
  }
  id v14 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v7];
  uint64_t v15 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
  uint64_t v16 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v14 inLibrary:v15];

  [v16 setFetchOptions:v6];

  return v16;
}

+ (id)queryForSuggestionsWithOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v5 = +[PHQuery queryForType:@"PHSuggestion" withBasePredicate:0 inLibrary:v4];

  [v5 setFetchOptions:v3];

  return v5;
}

+ (id)queryForPreviewLibraryScopeWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v6 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v4 photoLibrary:v5];

  [a1 _setLibraryScopeDefaultSortDescriptor:v6];
  id v7 = [MEMORY[0x1E4F8A8D8] predicateForPreviewLibraryScope];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = [a1 queryForType:@"PHLibraryScope" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForPendingLibraryScopeInvitationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v6 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v4 photoLibrary:v5];

  [a1 _setLibraryScopeDefaultSortDescriptor:v6];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ && %K == %d && %K == %d && %K == %d", @"scopeType", &unk_1EEB25CC8, @"status", 2, @"localPublishState", 2, @"previewState", 0];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = [a1 queryForType:@"PHLibraryScope" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForActiveLibraryScopeWithOptions:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v6 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v4 photoLibrary:v5];

  [a1 _setLibraryScopeDefaultSortDescriptor:v6];
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = [MEMORY[0x1E4F8A8D8] predicateForActiveLibraryScope];
  v15[0] = v8;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"status", 1, @"status", 3);
  v15[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v11 = [v7 andPredicateWithSubpredicates:v10];

  uint64_t v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  id v13 = [a1 queryForType:@"PHLibraryScope" withBasePredicate:v11 inLibrary:v12];

  [v13 setFetchOptions:v6];

  return v13;
}

+ (void)_setLibraryScopeDefaultSortDescriptor:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 hasAnySortDescriptors] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v6[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

    [v3 setSortDescriptors:v5];
  }
}

uint64_t __39__PHQuery__globalPredicatesForPHClass___block_invoke()
{
  uint64_t result = dyld_get_program_sdk_version();
  _globalPredicatesForPHClass__linkedOnOrBefore8_0 = result <= 0x80000;
  return result;
}

+ (id)queryForPersonsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v5 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:0 inLibrary:v4];

  [v5 setFetchOptions:v3];

  return v5;
}

+ (id)queryForTopLevelUserCollectionsWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[PHCollection predicateForUserCollections];
  id v6 = [a1 queryForTopLevelCollectionsMatchingPredicate:v5 options:v4];

  return v6;
}

+ (id)queryForTopLevelCollectionsMatchingPredicate:(id)a3 options:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  id v8 = [v7 albumRootFolderObjectID];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"parentFolder", v8];
  id v10 = (void *)MEMORY[0x1E4F28BA0];
  v19[0] = v9;
  v19[1] = v5;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v12 = [v10 andPredicateWithSubpredicates:v11];

  id v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"parentFolder" ascending:1];
  if (([v6 hasAnySortDescriptors] & 1) == 0 && v13)
  {
    id v14 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v7];

    uint64_t v18 = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [v14 setInternalSortDescriptors:v15];

    id v6 = v14;
  }
  uint64_t v16 = +[PHQuery queryForType:@"PHCollection" withBasePredicate:v12 inLibrary:v7];
  [v16 setFetchOptions:v6];

  return v16;
}

+ (id)queryForKeyFaceOnPerson:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 photoLibrary];
  id v8 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v5 photoLibrary:v7];

  [v8 setIncludeNonvisibleFaces:0];
  uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v6 objectID];
  id v11 = [v9 predicateWithFormat:@"%K == %@", @"personBeingKeyFace", v10];

  uint64_t v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:v6];

  id v13 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v11 inLibrary:v12];

  [v13 setFetchOptions:v8];

  return v13;
}

+ (id)queryForAssetsForFaces:(id)a3 options:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v14 objectID];
        [v7 addObject:v15];

        if (!v11) {
          id v11 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@", @"detectedFaces", v7, (void)v20];
  uint64_t v17 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v11];
  uint64_t v18 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v16 inLibrary:v17];

  [v18 setFetchOptions:v6];
  [v18 _setCollectionFetchType:2];

  return v18;
}

void __54__PHQuery_fetchRootFolderIDForAlbumKind_photoLibrary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __40__PHQuery__isKindOfMomentOrAlbumEntity___block_invoke()
{
  v0 = [MEMORY[0x1E4F8A980] managedObjectModel];
  id v7 = [v0 entitiesByName];

  v1 = [MEMORY[0x1E4F8A9B8] entityName];
  uint64_t v2 = [v7 objectForKeyedSubscript:v1];
  uint64_t v3 = (void *)_isKindOfMomentOrAlbumEntity__momentEntity;
  _isKindOfMomentOrAlbumEntity__momentEntity = v2;

  uint64_t v4 = [MEMORY[0x1E4F8A940] entityName];
  uint64_t v5 = [v7 objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)_isKindOfMomentOrAlbumEntity__albumEntity;
  _isKindOfMomentOrAlbumEntity__albumEntity = v5;
}

+ (id)queryForQuestionsWithOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  uint64_t v5 = +[PHQuery queryForType:@"PHQuestion" withBasePredicate:0 inLibrary:v4];
  [v5 setFetchOptions:v3];

  return v5;
}

- (NSString)shortDescription
{
  v10.receiver = self;
  v10.super_class = (Class)PHQuery;
  id v3 = [(PHQuery *)&v10 description];
  uint64_t v4 = [(PHQuery *)self fetchOptions];
  uint64_t v5 = [v4 shortDescription];
  uint64_t v6 = [(PHQuery *)self fetchType];
  id v7 = [(PHQuery *)self basePredicate];
  id v8 = [v3 stringByAppendingFormat:@" opts=%@, type=%@, base=%@", v5, v6, objc_opt_class()];

  return (NSString *)v8;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PHQuery;
  uint64_t v2 = [(PHQuery *)&v4 description];

  return v2;
}

- (void)visitPredicateExpression:(id)a3
{
  id v13 = a3;
  unint64_t v4 = [v13 expressionType];
  if (v4 > 0x14) {
    goto LABEL_11;
  }
  if (((1 << v4) & 0x1048F7) == 0)
  {
    if (((1 << v4) & 0x408) != 0)
    {
      id v7 = [v13 keyPath];
      uint64_t v8 = [v7 length];
      BOOL v5 = v8 == 0;
      if (v8)
      {
        uint64_t v9 = [(PHQuery *)self _substitutedChangeTrackingKeyPathFromKeyPath:v7];
        if ([v9 rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
        {
          [(NSMutableSet *)self->_filteringKeys addObject:v9];
          BOOL v10 = 0;
        }
        else
        {
          BOOL v10 = v9 != 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }

      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
LABEL_11:
    filteringKeys = self->_filteringKeys;
    self->_filteringKeys = 0;

    goto LABEL_12;
  }
  BOOL v5 = 0;
LABEL_4:
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v6 = self->_filteringKeys;
  self->_filteringKeys = 0;

  if (v5)
  {
LABEL_12:
    filteringOids = self->_filteringOids;
    self->_filteringOids = 0;
  }
LABEL_13:
}

- (void)visitPredicate:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 leftExpression];
    id v7 = [v5 rightExpression];
    if (([v6 expressionType] == 10 || objc_msgSend(v6, "expressionType") == 3)
      && ![v7 expressionType])
    {
      uint64_t v8 = [v6 keyPath];
      if ([v8 length])
      {
        uint64_t v9 = [(PHQuery *)self _substitutedChangeTrackingKeyPathFromKeyPath:v8];
        BOOL v10 = v9;
        if (!v9 || [v9 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!self->_filteringOids)
          {
            id v11 = [MEMORY[0x1E4F1CA80] set];
            filteringOids = self->_filteringOids;
            self->_filteringOids = v11;

            id v13 = [MEMORY[0x1E4F1CA80] set];
            filteringObjectKeyPaths = self->_filteringObjectKeyPaths;
            self->_filteringObjectKeyPaths = v13;
          }
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __26__PHQuery_visitPredicate___block_invoke;
          aBlock[3] = &unk_1E5846CC8;
          aBlock[4] = self;
          id v32 = v10;
          uint64_t v15 = (void (**)(void *, void *))_Block_copy(aBlock);
          if (v10)
          {
            uint64_t v16 = [v7 constantValue];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15[2](v15, v16);
            }
            else if ([v16 conformsToProtocol:&unk_1EEB2F3E0])
            {
              id v24 = v10;
              uint64_t v25 = v8;
              long long v26 = v7;
              long long v29 = 0u;
              long long v30 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              long long v23 = v16;
              id v17 = v16;
              uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v28;
                do
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v28 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    long long v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      v15[2](v15, v22);
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
                }
                while (v19);
              }

              id v7 = v26;
              BOOL v10 = v24;
              uint64_t v8 = v25;
              uint64_t v16 = v23;
            }
          }
        }
      }
    }
  }
}

void __26__PHQuery_visitPredicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 192);
  id v5 = a2;
  [v4 addObject:v3];
  [*(id *)(*(void *)(a1 + 32) + 184) addObject:v5];
}

- (id)_substitutedChangeTrackingKeyPathFromKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F389B10]();
  uint64_t v6 = [(NSFetchRequest *)self->_fetchRequest entity];
  id v7 = [v4 componentsSeparatedByString:@"."];
  id v8 = v4;
  if ([v7 count] == 2)
  {
    uint64_t v9 = [v6 name];
    BOOL v10 = [MEMORY[0x1E4F8A950] entityName];
    int v11 = [v9 isEqualToString:v10];

    id v8 = v4;
    if (v11)
    {
      uint64_t v12 = [v7 objectAtIndexedSubscript:0];
      uint64_t v13 = [v7 objectAtIndexedSubscript:1];
      id v14 = [v6 relationshipsByName];
      long long v28 = (void *)v12;
      uint64_t v15 = [v14 objectForKeyedSubscript:v12];

      uint64_t v16 = [v15 destinationEntity];
      id v17 = [v16 propertiesByName];
      long long v27 = (void *)v13;
      uint64_t v18 = [v17 objectForKeyedSubscript:v13];

      uint64_t v19 = [v18 userInfo];
      uint64_t v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F8AE08]];
      LODWORD(v12) = [v20 BOOLValue];

      long long v21 = [v18 userInfo];
      long long v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F8ACE0]];

      if (v12)
      {

        id v8 = 0;
      }
      else
      {
        id v8 = v4;
        if (v22)
        {
          long long v23 = [v6 propertiesByName];
          id v24 = [v23 objectForKeyedSubscript:v22];

          if (v24)
          {
            id v8 = v22;
          }
          else
          {
            uint64_t v25 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "Unable to find target property defined by userInfo key PHQueryChangeTrackingFilteringAssetAttributesSubstituteProperty.", buf, 2u);
            }

            id v8 = v4;
          }
        }
      }
    }
  }

  return v8;
}

- (void)_prepareFilteringAttributes
{
  v72[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_preparedFilteringAttributes)
  {
    v2->_preparedFilteringAttributes = 1;
    __int16 v59 = v2;
    v57 = [(PHQuery *)v2 fetchRequest];
    uint64_t v54 = [v57 entityName];
    uint64_t v53 = [(PHQuery *)v2 containerRelationship];
    uint64_t v3 = [v53 name];
    uint64_t v49 = (void *)v3;
    if (v3)
    {
      v72[0] = v3;
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
    }
    else
    {
      uint64_t v4 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v50 = (void *)v4;
    v2->_objectToContainerRelationshipIndexValue = objc_msgSend(MEMORY[0x1E4F8AAF8], "indexValueForRelationshipNames:entity:");
    uint64_t v52 = [v53 inverseRelationship];
    id v5 = [v52 entity];
    uint64_t v51 = [v5 name];

    uint64_t v6 = [v52 name];
    uint64_t v47 = (void *)v6;
    if (v6)
    {
      uint64_t v71 = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v48 = (void *)v7;
    v59->_containerToObjectRelationshipIndexValue = objc_msgSend(MEMORY[0x1E4F8AAF8], "indexValueForRelationshipNames:entity:");
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    filteringKeys = v59->_filteringKeys;
    v59->_filteringKeys = (NSMutableSet *)v8;

    BOOL v10 = [v57 predicate];
    [v10 acceptVisitor:v59 flags:1];

    if (v59->_filteringOids && v59->_filteringObjectKeyPaths)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      filteringRelationshipsIndexValueByBaseEntityName = v59->_filteringRelationshipsIndexValueByBaseEntityName;
      v59->_filteringRelationshipsIndexValueByBaseEntityName = (NSMutableDictionary *)v11;

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v59->_filteringObjectKeyPaths;
      uint64_t v13 = [(NSMutableSet *)obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v13)
      {
        uint64_t v56 = *(void *)v65;
        do
        {
          uint64_t v58 = v13;
          for (uint64_t i = 0; i != v58; ++i)
          {
            if (*(void *)v65 != v56) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            uint64_t v16 = [v57 entity];
            id v17 = objc_msgSend(v16, "ph_relationshipDescriptionsForKeyPath:", v15);

            uint64_t v18 = [v17 lastObject];
            uint64_t v19 = [v18 inverseRelationship];

            if (v19)
            {
              uint64_t v20 = [v19 entity];
              long long v21 = [v20 name];

              uint64_t v22 = [v19 name];
              long long v23 = (void *)v22;
              if (v22)
              {
                uint64_t v69 = v22;
                id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
              }
              else
              {
                id v24 = (void *)MEMORY[0x1E4F1CBF0];
              }
              uint64_t v25 = [MEMORY[0x1E4F8AAF8] indexValueForRelationshipNames:v24 entity:v21];
              long long v26 = [v19 entity];
              long long v27 = objc_msgSend(v26, "ph_baseEntity");
              long long v28 = [v27 name];

              long long v29 = [(NSMutableDictionary *)v59->_filteringRelationshipsIndexValueByBaseEntityName objectForKeyedSubscript:v28];
              uint64_t v30 = [v29 unsignedLongLongValue];

              id v31 = [NSNumber numberWithUnsignedLongLong:v30 | v25];
              [(NSMutableDictionary *)v59->_filteringRelationshipsIndexValueByBaseEntityName setObject:v31 forKeyedSubscript:v28];
            }
          }
          uint64_t v13 = [(NSMutableSet *)obj countByEnumeratingWithState:&v64 objects:v70 count:16];
        }
        while (v13);
      }
    }
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v33 = v59;
    if (!v59->_filteringKeys) {
      goto LABEL_37;
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v34 = [v57 sortDescriptors];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v61;
      while (2)
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v61 != v36) {
            objc_enumerationMutation(v34);
          }
          uint64_t v38 = [*(id *)(*((void *)&v60 + 1) + 8 * j) key];
          if (![v38 length] || objc_msgSend(v38, "rangeOfString:", @".") != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v39 = v59->_filteringKeys;
            v59->_filteringKeys = 0;

            goto LABEL_35;
          }
          [(NSMutableSet *)v59->_filteringKeys addObject:v38];
          [v32 addObject:v38];
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v68 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }
LABEL_35:

    uint64_t v33 = v59;
    id v40 = v59->_filteringKeys;
    if (v40)
    {
      uint64_t v41 = [(NSMutableSet *)v40 allObjects];
      v59->_filteringAttributesIndexValue = [MEMORY[0x1E4F8AAF8] indexValueForAttributeNames:v41 entity:v54];
      v59->_filteringRelationshipsIndexValue = [MEMORY[0x1E4F8AAF8] indexValueForRelationshipNames:v41 entity:v54];
      uint64_t v42 = (void *)MEMORY[0x1E4F8AAF8];
      uint64_t v43 = [v32 allObjects];
      v59->_sortingAttributesIndexValue = [v42 indexValueForRelationshipNames:v43 entity:v54];

      uint64_t v33 = v59;
    }
    else
    {
LABEL_37:
      v33->_filteringRelationshipsIndexValue = -1;
      v33->_sortingAttributesIndexValue = -1;
      v33->_filteringAttributesIndexValue = -1;
    }
    containerIdentifier = v33->_containerIdentifier;
    if (containerIdentifier)
    {
      uint64_t v45 = [(NSManagedObjectID *)containerIdentifier entity];
      v46 = [v45 name];

      v59->_containerSortingAttributesIndexValue = [MEMORY[0x1E4F8AAF8] indexValueForAttributeNames:&unk_1EEB26B50 entity:v46];
      v59->_containerUserQueryIndexValue = [MEMORY[0x1E4F8AAF8] indexValueForAttributeNames:&unk_1EEB26B68 entity:v46];
    }
    uint64_t v2 = v59;
  }
  objc_sync_exit(v2);
}

- (NSDictionary)filteringRelationshipsIndexValueByBaseEntityName
{
  [(PHQuery *)self _prepareFilteringAttributes];
  filteringRelationshipsIndexValueByBaseEntityName = self->_filteringRelationshipsIndexValueByBaseEntityName;

  return (NSDictionary *)filteringRelationshipsIndexValueByBaseEntityName;
}

- (NSSet)filteringOids
{
  [(PHQuery *)self _prepareFilteringAttributes];
  filteringOids = self->_filteringOids;

  return (NSSet *)filteringOids;
}

- (unint64_t)containerUserQueryIndexValue
{
  return self->_containerUserQueryIndexValue;
}

- (unint64_t)containerToObjectRelationshipIndexValue
{
  return self->_containerToObjectRelationshipIndexValue;
}

- (unint64_t)objectToContainerRelationshipIndexValue
{
  return self->_objectToContainerRelationshipIndexValue;
}

- (unint64_t)sortingAttributesIndexValue
{
  return self->_sortingAttributesIndexValue;
}

- (unint64_t)filteringRelationshipsIndexValue
{
  return self->_filteringRelationshipsIndexValue;
}

- (unint64_t)filteringAttributesIndexValue
{
  return self->_filteringAttributesIndexValue;
}

- (unint64_t)containerSortingAttributesIndexValue
{
  return self->_containerSortingAttributesIndexValue;
}

- (NSSet)filteringKeys
{
  [(PHQuery *)self _prepareFilteringAttributes];
  uint64_t v3 = (void *)[(NSMutableSet *)self->_filteringKeys copy];

  return (NSSet *)v3;
}

- (NSManagedObjectID)combinedQuerySeparatingIdentifier
{
  [(PHQuery *)self _prepareCombinedQueryKeys];
  combinedQuerySeparatingIdentifier = self->_combinedQuerySeparatingIdentifier;

  return combinedQuerySeparatingIdentifier;
}

- (NSString)combinedQueryKeyPath
{
  [(PHQuery *)self _prepareCombinedQueryKeys];
  combinedQueryKeyPath = self->_combinedQueryKeyPath;

  return combinedQueryKeyPath;
}

- (id)combinedQueryGroupKey
{
  [(PHQuery *)self _prepareCombinedQueryKeys];
  id combinedQueryGroupKey = self->_combinedQueryGroupKey;

  return combinedQueryGroupKey;
}

- (void)_prepareCombinedQueryKeys
{
  v25[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_preparedCombinedQueryKeys)
  {
    v2->_preparedCombinedQueryKeys = 1;
    containerCollection = v2->_containerCollection;
    if ((!containerCollection || [(PHCollection *)containerCollection collectionHasFixedOrder])&& !v2->_seedOIDs)
    {
      uint64_t v4 = [(PHQuery *)v2 basePredicate];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_22:

        goto LABEL_28;
      }
      id v5 = [(PHQuery *)v2 fetchOptions];
      uint64_t v6 = [v5 fetchLimit];

      if (!v6)
      {
        uint64_t v4 = [(PHQuery *)v2 basePredicate];
        if ([v4 predicateOperatorType] != 4 || objc_msgSend(v4, "comparisonPredicateModifier")) {
          goto LABEL_27;
        }
        uint64_t v7 = [v4 leftExpression];
        uint64_t v8 = [v4 rightExpression];
        if ([v7 expressionType] != 3 || objc_msgSend(v8, "expressionType"))
        {
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        uint64_t v9 = [v8 constantValue];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v10 = [v8 constantValue];
        }
        else
        {
          BOOL v10 = 0;
        }

        uint64_t v11 = [v7 keyPath];
        uint64_t v12 = [(id)objc_opt_class() _relationshipForFetchType:v2->_fetchType predicate:v4];
        if (!v10 || ![v11 length] || !v12 || (objc_msgSend(v12, "isToMany") & 1) != 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v13 = [(PHQuery *)v2 _createFetchRequestIncludingBasePredicate:0];
        if (v13)
        {
          id v14 = (void *)MEMORY[0x1E4F28F60];
          uint64_t v15 = [v11 stringByAppendingString:@" == %@"];
          id v24 = objc_msgSend(v14, "predicateWithFormat:", v15, MEMORY[0x1E4F1CC38]);

          uint64_t v16 = [v13 predicate];
          if (v16)
          {
            uint64_t v22 = (void *)MEMORY[0x1E4F28BA0];
            v25[0] = v24;
            long long v21 = [v13 predicate];
            v25[1] = v21;
            id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
            id v23 = [v22 andPredicateWithSubpredicates:v17];
          }
          else
          {
            id v23 = v24;
          }

          [v13 setPredicate:v23];
          uint64_t v18 = [[_PHFetchRequestWrapper alloc] initWithFetchRequest:v13 containerIdentifier:0 fetchPropertySets:0];
          id combinedQueryGroupKey = v2->_combinedQueryGroupKey;
          v2->_id combinedQueryGroupKey = v18;
          uint64_t v20 = v18;

          objc_storeStrong((id *)&v2->_combinedQueryKeyPath, v11);
          objc_storeStrong((id *)&v2->_combinedQuerySeparatingIdentifier, v10);

          goto LABEL_25;
        }

        goto LABEL_22;
      }
    }
  }
LABEL_28:
  objc_sync_exit(v2);
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4 = a3;
  id v5 = [(PHQuery *)self fetchRequest];
  uint64_t v6 = [v5 predicate];

  LOBYTE(v5) = [v6 evaluateWithObject:v4];
  return (char)v5;
}

- (void)_setBasePredicate:(id)a3
{
}

- (BOOL)_isAlbumContentTitleSort
{
  return [(PHCollection *)self->_containerCollection isAlbumContentTitleSort];
}

- (BOOL)_isAlbumContentSort
{
  return [(PHCollection *)self->_containerCollection isAlbumContentSort];
}

- (BOOL)requiresFullRefetchForChange:(id)a3
{
  return 0;
}

- (unint64_t)possibleChangesForChange:(id)a3
{
  return 0;
}

- (id)updatedQueryWithChange:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_containerCollection) {
    goto LABEL_14;
  }
  uint64_t v6 = objc_msgSend(v4, "changeDetailsForObject:");
  uint64_t v7 = [(id)v6 objectAfterChanges];
  if (!(v6 | v7))
  {
    uint64_t v8 = [(PHQuery *)self fetchOptions];
    uint64_t v9 = [v8 changeDetectionCriteria];
    BOOL v10 = [(PHQuery *)self photoLibrary];
    uint64_t v11 = [v10 managedObjectContext];
    int v12 = [v5 intersectsWithDetectionCriteria:v9 managedObjectContext:v11];

    if (!v12)
    {
LABEL_13:

LABEL_14:
      uint64_t v13 = self;
      goto LABEL_15;
    }
    uint64_t v7 = self->_containerCollection;
  }
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v13 = (PHQuery *)[(PHQuery *)self copy];
  [(PHQuery *)v13 _setContainerCollection:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = (void *)v7;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  if ([v15 plAlbumKind] == 1507)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F8AB00]);
    long long v28 = (void *)MEMORY[0x1E4F8AB08];
    long long v29 = v16;
    id v17 = [v15 userQuery];
    uint64_t v18 = [v15 photoLibrary];
    uint64_t v19 = [v18 photoLibrary];
    uint64_t v20 = [v28 predicateForQuery:v17 inLibrary:v19 changeDetectionCriteria:v16];
    [(PHQuery *)v13 _setBasePredicate:v20];

    long long v21 = (void *)MEMORY[0x1E4F8AB08];
    uint64_t v22 = [v15 userQuery];
    uint64_t v23 = [v21 includesHiddenAssetsInQuery:v22];

    id v24 = [(PHQuery *)v13 fetchOptions];
    [v24 setIncludeHiddenAssets:v23];

    uint64_t v25 = [[PHQueryChangeDetectionCriteria alloc] initWithPLQueryChangeDetectionCriteria:v29];
    long long v26 = [(PHQuery *)v13 fetchOptions];
    [v26 setChangeDetectionCriteria:v25];
  }
  if (!v13) {
    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

+ (id)queryForLibraryScopesWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  uint64_t v6 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v4 photoLibrary:v5];

  [a1 _setLibraryScopeDefaultSortDescriptor:v6];
  uint64_t v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v8 = [a1 queryForType:@"PHLibraryScope" withBasePredicate:0 inLibrary:v7];

  [v8 setFetchOptions:v6];

  return v8;
}

+ (id)queryforLibraryScopesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v8];

  [a1 _setLibraryScopeDefaultSortDescriptor:v9];
  BOOL v10 = [a1 queryForType:@"PHLibraryScope" withLocalIdentifiers:v7 options:v9];

  [v10 setFetchOptions:v9];

  return v10;
}

+ (id)queryForLikesForAsset:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectID];
  uint64_t v9 = [v5 predicateWithFormat:@"%K == %@", @"likedAsset", v8];

  BOOL v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHAssetComment" withBasePredicate:v9 inLibrary:v10];
  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForCommentsForAsset:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectID];
  uint64_t v9 = [v5 predicateWithFormat:@"%K == %@", @"commentedAsset", v8];

  BOOL v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHAssetComment" withBasePredicate:v9 inLibrary:v10];
  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForQuestionsWithState:(unsigned __int16)a3 options:(id)a4
{
  unsigned int v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = objc_msgSend(v5, "predicateWithFormat:", @"state = %d", v4);
  uint64_t v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHQuestion" withBasePredicate:v7 inLibrary:v8];
  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForAnsweredQuestionsWithOptions:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "predicateWithFormat:", @"state = %d OR state = %d OR state = %d", 2, 3, 1);
  id v6 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v7 = +[PHQuery queryForType:@"PHQuestion" withBasePredicate:v5 inLibrary:v6];
  [v7 setFetchOptions:v4];

  return v7;
}

+ (id)queryForAnsweredYesOrNoQuestionsWithOptions:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "predicateWithFormat:", @"state = %d OR state = %d", 2, 3);
  id v6 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v7 = +[PHQuery queryForType:@"PHQuestion" withBasePredicate:v5 inLibrary:v6];
  [v7 setFetchOptions:v4];

  return v7;
}

+ (id)queryForQuestionsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"uuid IN (%@)", a3];
  uint64_t v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHQuestion" withBasePredicate:v7 inLibrary:v8];
  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForKeywordsForAsset:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectID];
  uint64_t v9 = [v5 predicateWithFormat:@"ANY assetAttributes.asset = %@", v8];

  BOOL v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHKeyword" withBasePredicate:v9 inLibrary:v10];
  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForKeywordsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryForType:@"PHKeyword" withLocalIdentifiers:a3 options:v6];
  [v7 setFetchOptions:v6];

  return v7;
}

+ (id)queryForKeywordsWithTitles:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"%K IN %@", @"title", a3];
  uint64_t v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHKeyword" withBasePredicate:v7 inLibrary:v8];
  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForKeywordsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v5 = +[PHQuery queryForType:@"PHKeyword" withBasePredicate:0 inLibrary:v4];
  [v5 setFetchOptions:v3];

  return v5;
}

+ (id)queryForProjectsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = +[PHQuery queryForAssetCollectionsWithType:10 localIdentifiers:a3 options:v5];
  [v6 setFetchOptions:v5];

  return v6;
}

+ (id)queryForImportSessionsWithOptions:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  if (([v3 hasAnySortDescriptors] & 1) == 0 && v4)
  {
    if (v3)
    {
      uint64_t v5 = [v3 copy];

      id v3 = (id)v5;
    }
    else
    {
      id v3 = (id)objc_opt_new();
    }
    v10[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setInternalSortDescriptors:v6];
  }
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  uint64_t v8 = +[PHQuery queryForType:@"PHImportSession" withBasePredicate:0 inLibrary:v7];

  [v8 setFetchOptions:v3];

  return v8;
}

+ (id)queryForSuggestionsWithFeaturedState:(unsigned __int16)a3 types:(id)a4 options:(id)a5
{
  unsigned int v6 = a3;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a5;
  id v9 = a4;
  BOOL v10 = objc_msgSend(v7, "predicateWithFormat:", @"%K = %d", @"featuredState", v6);
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"type", v9];

  int v12 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v10;
  v18[1] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v14 = [v12 andPredicateWithSubpredicates:v13];
  id v15 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:0];
  id v16 = +[PHQuery queryForType:@"PHSuggestion" withBasePredicate:v14 inLibrary:v15];

  [v16 setFetchOptions:v8];

  return v16;
}

+ (id)queryForSuggestionsWithTypes:(id)a3 options:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"%K IN %@", @"type", a3];
  id v8 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  BOOL v10 = [v8 andPredicateWithSubpredicates:v9];
  uint64_t v11 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  int v12 = +[PHQuery queryForType:@"PHSuggestion" withBasePredicate:v10 inLibrary:v11];

  [v12 setFetchOptions:v6];

  return v12;
}

+ (id)queryForSuggestionsWithState:(unsigned __int16)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 options:(id)a6
{
  unsigned int v6 = a5;
  unsigned int v7 = a4;
  unsigned int v8 = a3;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = a6;
  uint64_t v11 = objc_msgSend(v9, "predicateWithFormat:", @"%K = %d", @"state", v8);
  int v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"type", v7);
  v20[0] = v11;
  v20[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  if (v6)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"subtype", v6);
    uint64_t v15 = [v13 arrayByAddingObject:v14];

    uint64_t v13 = (void *)v15;
  }
  id v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
  id v17 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v10 object:0];
  uint64_t v18 = +[PHQuery queryForType:@"PHSuggestion" withBasePredicate:v16 inLibrary:v17];

  [v18 setFetchOptions:v10];

  return v18;
}

+ (id)queryForSuggestionsWithState:(unsigned __int16)a3 options:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  unsigned int v7 = objc_msgSend(v5, "predicateWithFormat:", @"state = %d", v4);
  unsigned int v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  id v9 = +[PHQuery queryForType:@"PHSuggestion" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForShareParticipantWithPerson:(id)a3 options:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  v16[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v10 = [v5 predicateWithFormat:@"%K IN %@", @"person", v9];

  uint64_t v11 = [v7 photoLibrary];

  int v12 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v11];

  uint64_t v13 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v12 object:0];
  id v14 = +[PHQuery queryForType:@"PHShareParticipant" withBasePredicate:v10 inLibrary:v13];

  [v14 setFetchOptions:v12];

  return v14;
}

+ (id)queryForShareParticipantsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryForType:@"PHShareParticipant" withLocalIdentifiers:a3 options:v6];
  [v7 setFetchOptions:v6];

  return v7;
}

+ (id)queryForShareParticipantsInShare:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  id v9 = [v5 predicateWithFormat:@"%K == %@", @"share", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHShareParticipant" withBasePredicate:v9 inLibrary:v10];
  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForPersonsWithNonNilUserFeedbackWithTypes:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"ANY userFeedbacks.feature IN %@", a3];
  unsigned int v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  id v9 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];
  [v9 _setCollectionFetchType:2];

  return v9;
}

+ (id)queryForFaceCropsForPerson:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  id v9 = [v5 predicateWithFormat:@"%K == %@", @"person", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHFaceCrop" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForFaceCropsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryForType:@"PHFaceCrop" withLocalIdentifiers:a3 options:v6];
  [v7 setFetchOptions:v6];

  return v7;
}

+ (id)queryForFaceCropsWithOptions:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  uint64_t v5 = +[PHQuery queryForType:@"PHFaceCrop" withBasePredicate:0 inLibrary:v4];

  [v5 setFetchOptions:v3];

  return v5;
}

+ (id)queryForInvalidMergeCandidatePersonsForPerson:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  id v9 = [v5 predicateWithFormat:@"invalidMergeCandidates CONTAINS %@", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];
  [v11 _setCollectionFetchType:2];

  return v11;
}

+ (id)queryForMergeCandidateWithConfidencePersonsForPerson:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  id v9 = [v5 predicateWithFormat:@"%K CONTAINS %@", @"mergeCandidatesWithConfidence", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];
  [v11 _setCollectionFetchType:2];

  return v11;
}

+ (id)queryForMergeCandidatePersonsForPerson:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  id v9 = [v5 predicateWithFormat:@"mergeCandidates CONTAINS %@", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];
  [v11 _setCollectionFetchType:2];

  return v11;
}

+ (id)queryForAssociatedPersonForFaceGroup:(id)a3 withOptions:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  id v9 = [v5 predicateWithFormat:@"associatedFaceGroup = %@", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];
  [v11 _setCollectionFetchType:2];

  return v11;
}

+ (id)queryForEmptyFaceGroupsWithOptions:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "predicateWithFormat:", @"%K.@count == 0", @"detectedFaces");
  id v6 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v7 = +[PHQuery queryForType:@"PHFaceGroup" withBasePredicate:v5 inLibrary:v6];

  [v7 setFetchOptions:v4];

  return v7;
}

+ (id)queryForFaceGroupsWithFace:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  id v9 = [v5 predicateWithFormat:@"%K CONTAINS %@", @"detectedFaces", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHFaceGroup" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];
  [v11 _setCollectionFetchType:2];

  return v11;
}

+ (id)queryForFaceGroupsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryForType:@"PHFaceGroup" withLocalIdentifiers:a3 options:v6];
  [v7 setFetchOptions:v6];

  return v7;
}

+ (id)queryForFaceGroupsForPerson:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 objectID];
  id v9 = [v5 predicateWithFormat:@"ANY %K.%K = %@", @"detectedFaces", @"personForFace", v8];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHFaceGroup" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];
  [v11 _setCollectionFetchType:2];

  return v11;
}

+ (id)queryForFaceGroupsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  uint64_t v5 = +[PHQuery queryForType:@"PHFaceGroup" withBasePredicate:0 inLibrary:v4];

  [v5 setFetchOptions:v3];

  return v5;
}

+ (id)queryForAssetsForFaceGroups:(id)a3 options:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v35 + 1) + 8 * i) objectID];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"faceGroup", v7];
  uint64_t v15 = [v8 firstObject];
  id v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v15];

  long long v29 = (void *)v14;
  id v17 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v14 inLibrary:v16];
  uint64_t v30 = v6;
  [v17 setFetchOptions:v6];
  [v17 _setCollectionFetchType:2];
  uint64_t v18 = [v17 executeQuery];
  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [*(id *)(*((void *)&v31 + 1) + 8 * j) objectID];
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }

  long long v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@", @"detectedFaces", v19];
  long long v27 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v26 inLibrary:v16];
  [v27 setFetchOptions:v30];
  [v27 _setCollectionFetchType:2];

  return v27;
}

+ (id)queryForAssetsForPersons:(id)a3 options:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v14 objectID];
        [v7 addObject:v15];

        if (!v11) {
          id v11 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  id v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K.%K IN %@", @"detectedFaces", @"personForFace", v7];
  id v17 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v11];
  uint64_t v18 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v16 inLibrary:v17];

  [v18 setFetchOptions:v6];
  [v18 _setCollectionFetchType:2];

  return v18;
}

+ (id)queryForPersonForFaceCrop:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v5 predicateWithFormat:@"faceCrops CONTAINS %@", v8];

  uint64_t v10 = [v7 photoLibrary];

  id v11 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v10];

  [v11 setMinimumVerifiedFaceCount:0];
  [v11 setMinimumUnverifiedFaceCount:0];
  uint64_t v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v11 object:0];
  uint64_t v13 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v9 inLibrary:v12];

  [v13 setFetchOptions:v11];
  [v13 _setCollectionFetchType:2];

  return v13;
}

+ (id)queryForRejectedPersonsForFace:(id)a3 options:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 objectID];
  uint64_t v10 = [v6 predicateWithFormat:@"rejectedFaces CONTAINS %@", v9];

  id v11 = [v8 photoLibrary];

  uint64_t v12 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v11];

  [v12 setMinimumVerifiedFaceCount:0];
  [v12 setMinimumUnverifiedFaceCount:0];
  uint64_t v13 = [a1 _queryForPersonsWithFaceRelationshipPredicate:v10 options:v12];

  return v13;
}

+ (id)queryForPersonsWithFaces:(id)a3 options:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x19F389B10]();
        id v16 = [v14 objectID];
        [v8 addObject:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@", @"detectedFaces", v8, (void)v23];
  uint64_t v18 = [v9 firstObject];
  uint64_t v19 = [v18 photoLibrary];
  long long v20 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v19];

  long long v21 = [a1 _queryForPersonsWithFaceRelationshipPredicate:v17 options:v20];

  return v21;
}

+ (id)queryForPersonWithFace:(id)a3 options:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 objectID];
  uint64_t v10 = [v6 predicateWithFormat:@"%K CONTAINS %@", @"detectedFaces", v9];

  uint64_t v11 = [v8 photoLibrary];

  uint64_t v12 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v11];

  uint64_t v13 = [a1 _queryForPersonsWithFaceRelationshipPredicate:v10 options:v12];

  return v13;
}

+ (id)queryForPersonWithShareParticipant:(id)a3 options:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectID];
  v16[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v10 = [v5 predicateWithFormat:@"%K IN %@", @"shareParticipant", v9];

  uint64_t v11 = [v7 photoLibrary];

  uint64_t v12 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v11];

  uint64_t v13 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v12 object:0];
  uint64_t v14 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v10 inLibrary:v13];

  [v14 setFetchOptions:v12];

  return v14;
}

+ (id)queryForPersonsWithContactIdentifiers:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"personUri IN (%@)", a3];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  id v9 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)_queryForPersonsWithFaceRelationshipPredicate:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  id v8 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v6 inLibrary:v7];

  [v8 setFetchOptions:v5];
  [v8 _setCollectionFetchType:2];

  return v8;
}

+ (id)queryForPersonsWithMdIDs:(id)a3 options:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = (void *)MEMORY[0x1E4F28BA0];
    id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"mdID");
    v15[0] = v8;
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@)", @"mdID", v5];
    v15[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v11 = [v7 andPredicateWithSubpredicates:v10];

    uint64_t v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
    uint64_t v13 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v11 inLibrary:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v13 setFetchOptions:v6];

  return v13;
}

+ (id)queryForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@)", @"personUUID", v7, (void)v18];
    uint64_t v15 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
    id v16 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v14 inLibrary:v15];
  }
  else
  {
    id v16 = 0;
  }
  [v16 setFetchOptions:v6];

  return v16;
}

+ (id)_queryForPersonsInAssetsWithObjectIDs:(id)a3 withOptions:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"ANY %K.%K IN %@", @"detectedFaces", @"assetForFace", a3];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];
  [v9 _setCollectionFetchType:2];

  return v9;
}

+ (id)queryForPersonsInAssetsFetchResult:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 firstObject];
  uint64_t v9 = [v8 photoLibrary];
  uint64_t v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v9];

  uint64_t v11 = [a1 _assetIDsFromAssets:v7 anyAsset:0];

  uint64_t v12 = [a1 _queryForPersonsInAssetsWithObjectIDs:v11 withOptions:v10];

  return v12;
}

+ (id)queryForPersonsInAssets:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 firstObject];
  uint64_t v9 = [v8 photoLibrary];
  uint64_t v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v9];

  uint64_t v11 = objc_msgSend(v7, "_pl_map:", &__block_literal_global_668);

  uint64_t v12 = [a1 _queryForPersonsInAssetsWithObjectIDs:v11 withOptions:v10];

  return v12;
}

uint64_t __47__PHQuery_queryForPersonsInAssets_withOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

+ (id)queryForPersonsInAsset:(id)a3 options:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v12 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [v6 arrayWithObjects:&v12 count:1];

    uint64_t v10 = objc_msgSend(a1, "queryForPersonsInAssets:withOptions:", v9, v7, v12, v13);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)queryForPersonsWithObjectIDs:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:0];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v6];
  uint64_t v10 = [a1 queryForType:@"PHPerson" withBasePredicate:v9 seedOIDs:0 inLibrary:v8];

  [v10 setFetchOptions:v7];

  return v10;
}

+ (id)queryForPersonsWithQuestionType:(unsigned __int16)a3 options:(id)a4
{
  unsigned int v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = objc_msgSend(v5, "predicateWithFormat:", @"questionType == %d", v4);
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForPersonsWithType:(int64_t)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  if (a3) {
    objc_msgSend(v5, "predicateWithFormat:", @"type == %d", a3);
  }
  else {
  id v7 = objc_msgSend(v5, "predicateWithFormat:", @"noindex:(type) == %d", 0);
  }
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHPerson" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForRejectedFacesOnPerson:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v5 predicateWithFormat:@"rejectedPersons CONTAINS %@", v8];

  uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForFacesOnFaceCrop:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v5 predicateWithFormat:@"faceCrop == %@", v8];

  uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];
  [v11 _setCollectionFetchType:2];

  return v11;
}

+ (id)queryForFacesOnAssetWithFace:(id)a3 options:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v9 = [v5 objectID];
  uint64_t v10 = [v8 predicateWithFormat:@"%K CONTAINS %@", @"assetForFace.detectedFaces", v9];
  v30[0] = v10;
  uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
  id v12 = [v5 objectID];
  uint64_t v13 = [v11 predicateWithFormat:@"%K CONTAINS %@", @"assetForTemporalDetectedFaces.temporalDetectedFaces", v12];
  v30[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v15 = [v7 orPredicateWithSubpredicates:v14];

  if (v6) {
    int v16 = [v6 includeMediaAnalysisProcessingRangeTypes] & 1;
  }
  else {
    int v16 = 1;
  }
  char v17 = [v6 includeMediaAnalysisProcessingRangeTypes];
  if (v16 && (v17 & 2) != 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    goto LABEL_12;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 0", @"duration");
    uint64_t v18 = LABEL_11:;
LABEL_12:
    long long v19 = (void *)v18;
    if (v18) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  if ((v17 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0", @"duration");
    goto LABEL_11;
  }
LABEL_16:
  long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"PHQuery.m", 3824, @"Invalid parameter not satisfying: %@", @"durationPredicate != nil" object file lineNumber description];

  long long v19 = 0;
LABEL_13:
  long long v20 = (void *)MEMORY[0x1E4F28BA0];
  v29[0] = v15;
  v29[1] = v19;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  long long v22 = [v20 andPredicateWithSubpredicates:v21];

  uint64_t v23 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
  long long v24 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v22 inLibrary:v23];

  [v24 setFetchOptions:v6];
  [v24 _setCollectionFetchType:2];

  return v24;
}

+ (id)queryForFacesWithVuObservationIDs:(id)a3 options:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"%K IN %@", @"vuObservationID", a3];
  uint64_t v9 = [v7 photoLibrary];
  uint64_t v10 = [a1 queryForType:@"PHFace" withBasePredicate:v8 inLibrary:v9];

  [v10 setFetchOptions:v7];

  return v10;
}

+ (id)queryForFacesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryForType:@"PHFace" withLocalIdentifiers:a3 options:v6];
  [v7 setFetchOptions:v6];

  return v7;
}

+ (id)queryForKeyFaceForFaceGroup:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v5 predicateWithFormat:@"faceGroupBeingKeyFace == %@", v8];

  uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForFacesInFaceGroup:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v5 predicateWithFormat:@"faceGroup = %@", v8];

  uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForFacesForPerson:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![v6 includeMediaAnalysisProcessingRangeTypes]
    || ([v6 includeMediaAnalysisProcessingRangeTypes] & 1) != 0)
  {
    id v8 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [v5 objectID];
    uint64_t v10 = [v8 predicateWithFormat:@"%K = %@", @"personForFace", v9];
    [v7 addObject:v10];
  }
  if (([v6 includeMediaAnalysisProcessingRangeTypes] & 2) != 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
    id v12 = [v5 objectID];
    uint64_t v13 = [v11 predicateWithFormat:@"%K = %@", @"personForTemporalDetectedFaces", v12];
    [v7 addObject:v13];
  }
  uint64_t v14 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v7];
  uint64_t v15 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
  int v16 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v14 inLibrary:v15];

  [v16 setFetchOptions:v6];

  return v16;
}

+ (id)queryForFacesInAssets:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = [a3 fetchedObjectIDs];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v5 || ([v5 includeMediaAnalysisProcessingRangeTypes] & 1) != 0)
  {
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"assetForFace", v6];
    [v7 addObject:v8];
  }
  if (([v5 includeMediaAnalysisProcessingRangeTypes] & 2) != 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"assetForTemporalDetectedFaces", v6];
    [v7 addObject:v9];
  }
  uint64_t v10 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v7];
  uint64_t v11 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  id v12 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v10 inLibrary:v11];

  [v12 setFetchOptions:v5];

  return v12;
}

+ (id)queryForSingletonFacesWithOptions:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  unsigned int v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "predicateWithFormat:", @"%K == NULL", @"faceGroup");
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NULL", @"personForFace", v6);
  v13[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v9 = [v3 andPredicateWithSubpredicates:v8];

  uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  uint64_t v11 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v5];
  [v11 _setCollectionFetchType:2];

  return v11;
}

+ (id)queryForFacesWithOptions:(id)a3
{
  id v3 = a3;
  if ([v3 includeMediaAnalysisProcessingRangeTypes] == 1)
  {
    unsigned int v4 = @"%K == 0.0";
LABEL_5:
    id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v4, @"duration");
    goto LABEL_7;
  }
  if ([v3 includeMediaAnalysisProcessingRangeTypes] == 2)
  {
    unsigned int v4 = @"%K > 0.0";
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:
  id v6 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v7 = +[PHQuery queryForType:@"PHFace" withBasePredicate:v5 inLibrary:v6];

  [v7 setFetchOptions:v3];

  return v7;
}

+ (id)queryForMomentListsWithSubType:(int64_t)a3 options:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  switch(a3)
  {
    case 1:
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 1);
      id v8 = +[PHQuery queryForType:@"PHMomentList" withBasePredicate:v11 inLibrary:v6];

      uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
      v19[0] = v9;
      uint64_t v10 = (void **)v19;
      break;
    case 2:
      id v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 2);
      id v8 = +[PHQuery queryForType:@"PHMomentList" withBasePredicate:v12 inLibrary:v6];

      uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
      uint64_t v18 = v9;
      uint64_t v10 = &v18;
      break;
    case 0x7FFFFFFFFFFFFFFFLL:
      id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d OR kind == %d", 2, 1);
      id v8 = +[PHQuery queryForType:@"PHMomentList" withBasePredicate:v7 inLibrary:v6];

      uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
      char v17 = v9;
      uint64_t v10 = &v17;
      break;
    default:
      [v5 hasAnySortDescriptors];
      uint64_t v13 = 0;
      id v8 = 0;
      goto LABEL_11;
  }
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  if (([v5 hasAnySortDescriptors] & 1) == 0 && v13)
  {
    uint64_t v14 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v5 photoLibrary:v6];

    [v14 setInternalSortDescriptors:v13];
    id v5 = v14;
  }
LABEL_11:
  [v8 setFetchOptions:v5];
  id v15 = v8;

  return v15;
}

+ (id)queryForMomentListsWithSubType:(int64_t)a3 containingMoment:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v13 = [v5 objectID];
    uint64_t v9 = [v12 predicateWithFormat:@"(kind == %d) AND (moments CONTAINS %@)", 1, v13];

    uint64_t v14 = (void *)MEMORY[0x1E4F28F60];
    id v15 = [v6 objectID];
    int v16 = [v14 predicateWithFormat:@"(kind == %d) AND (moments CONTAINS %@)", 2, v15];

    char v17 = (void *)MEMORY[0x1E4F28BA0];
    v26[0] = v9;
    v26[1] = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    long long v19 = [v17 orPredicateWithSubpredicates:v18];
    long long v20 = [v6 photoLibrary];
    uint64_t v11 = +[PHQuery queryForType:@"PHMomentList" withBasePredicate:v19 inLibrary:v20];
  }
  else if (a3 == 2)
  {
    long long v21 = (void *)MEMORY[0x1E4F28F60];
    long long v22 = [v5 objectID];
    int v16 = [v21 predicateWithFormat:@"(kind == %d) AND (SUBQUERY(childPhotosHighlights, $cph, SUBQUERY($cph.childPhotosHighlights, $ccph, ANY $ccph.moments == %@).@count > 0).@count > 0)", 2, v22];

    uint64_t v23 = [v6 photoLibrary];
    uint64_t v11 = +[PHQuery queryForType:@"PHMomentList" withBasePredicate:v16 inLibrary:v23];

    uint64_t v9 = 0;
  }
  else
  {
    if (a3 == 1)
    {
      id v7 = (void *)MEMORY[0x1E4F28F60];
      id v8 = [v5 objectID];
      uint64_t v9 = [v7 predicateWithFormat:@"(kind == %d) AND (SUBQUERY(childPhotosHighlights, $cph, ANY $cph.moments == %@).@count > 0)", 1, v8];

      uint64_t v10 = [v6 photoLibrary];
      uint64_t v11 = +[PHQuery queryForType:@"PHMomentList" withBasePredicate:v9 inLibrary:v10];
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v9 = 0;
    }
    int v16 = 0;
  }
  id v24 = v11;

  return v24;
}

+ (id)_queryForRootCollectionListWithRootFolder:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"self = %@", a3];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHCollectionList" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForRootProjectCollectionListWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v6 = [v5 projectAlbumRootFolderObjectID];

  id v7 = [a1 _queryForRootCollectionListWithRootFolder:v6 options:v4];

  return v7;
}

+ (id)queryForRootAlbumCollectionListWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v6 = [v5 albumRootFolderObjectID];

  id v7 = [a1 _queryForRootCollectionListWithRootFolder:v6 options:v4];

  return v7;
}

+ (id)queryForCollectionListsWithType:(int64_t)a3 subtype:(int64_t)a4 options:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = _fetchTypeForCollectionListTypeAndSubtype(a3);
  uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:0];
  if (a3 == 3)
  {
    switch(a4)
    {
      case 0x7FFFFFFFFFFFFFFFLL:
        if ([v8 includeFavoriteMemoriesCollectionList])
        {
          id v15 = [&unk_1EEB26BC8 arrayByAddingObject:&unk_1EEB25CB0];
        }
        else
        {
          id v15 = &unk_1EEB26BC8;
        }
        uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"kind IN %@", v15];

        goto LABEL_19;
      case 0xC9:
        uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v14 = 4005;
        break;
      case 0xC8:
        uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v14 = 4004;
        break;
      default:
        int v16 = [v8 includeFavoriteMemoriesCollectionList];
        if (a4 != 1000000202 || !v16)
        {
          uint64_t v23 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            int v26 = 3;
            __int16 v27 = 1024;
            int v28 = a4;
            _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Unsupported fetch for collections with type %d and subtype %d", buf, 0xEu);
          }

          uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
          goto LABEL_16;
        }
        uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v14 = 4006;
        break;
    }
    uint64_t v17 = objc_msgSend(v13, "predicateWithFormat:", @"kind = %d", v14);
LABEL_16:
    uint64_t v11 = (void *)v17;
LABEL_19:
    uint64_t v18 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:0];
    id v12 = +[PHQuery queryForType:v9 withBasePredicate:v11 inLibrary:v18];

    long long v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"kind" ascending:1];
    if (([v8 hasAnySortDescriptors] & 1) == 0 && v19)
    {
      long long v20 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v8 photoLibrary:v10];

      id v24 = v19;
      long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      [v20 setInternalSortDescriptors:v21];

      id v8 = v20;
    }
    [v12 setFetchOptions:v8];

    goto LABEL_23;
  }
  if (a3 != 2)
  {
    id v12 = [a1 queryForMomentListsWithSubType:a4 options:v8];
    goto LABEL_24;
  }
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"kind IN %@", &unk_1EEB26BB0];
  id v12 = +[PHQuery queryForType:v9 withBasePredicate:v11 inLibrary:v10];
  [v12 setFetchOptions:v8];
LABEL_23:

LABEL_24:

  return v12;
}

+ (id)queryForCollectionListsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = _fetchTypeForCollectionListTypeAndSubtype(a3);
  uint64_t v11 = [a1 queryForType:v10 withLocalIdentifiers:v9 options:v8];

  return v11;
}

+ (id)queryForCollectionListContainingCollection:(id)a3 options:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 assetCollectionType] == 3)
  {
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = [v5 objectID];
    id v9 = [v7 predicateWithFormat:@"SUBQUERY(childPhotosHighlights, $cph, ANY $cph.moments == %@).@count > 0", v8];

    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = [v5 objectID];
    id v12 = [v10 predicateWithFormat:@"SUBQUERY(childPhotosHighlights, $cph, SUBQUERY($cph.childPhotosHighlights, $ccph, ANY $ccph.moments == %@).@count > 0).@count > 0", v11];

    uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
    v28[0] = v9;
    v28[1] = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    id v15 = [v13 orPredicateWithSubpredicates:v14];
    int v16 = [v5 photoLibrary];
    uint64_t v17 = +[PHQuery queryForType:@"PHMomentList" withBasePredicate:v15 inLibrary:v16];

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v20 = (void *)MEMORY[0x1E4F28F60];
    long long v21 = [v5 objectID];
    id v9 = [v20 predicateWithFormat:@"childCollections CONTAINS %@", v21];

    if (([v6 includeRootFolder] & 1) == 0)
    {
      long long v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT kind IN %@", &unk_1EEB26B98];
      uint64_t v23 = (void *)MEMORY[0x1E4F28BA0];
      v27[0] = v9;
      v27[1] = v22;
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      uint64_t v25 = [v23 andPredicateWithSubpredicates:v24];

      id v9 = (void *)v25;
    }
    id v12 = [v5 photoLibrary];
    uint64_t v17 = +[PHQuery queryForType:@"PHCollectionList" withBasePredicate:v9 inLibrary:v12];
LABEL_10:

    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  long long v19 = [v5 photoLibrary];
  uint64_t v17 = +[PHQuery queryForType:@"PHCollectionList" withBasePredicate:v18 inLibrary:v19];

  if (v6) {
LABEL_11:
  }
    [v17 setFetchOptions:v6];
LABEL_12:

  return v17;
}

+ (id)queryForCollectionsInCollectionList:(id)a3 options:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 collectionListType] == 1)
  {
    id v7 = +[PHQuery queryForMomentsInMomentList:v5 options:v6];
    id v8 = (const void *)PHQueryForCollectionsInMomentList;
LABEL_9:
    id v9 = _Block_copy(v8);
    goto LABEL_10;
  }
  if ([v5 collectionListType] == 3 && objc_msgSend(v5, "collectionListSubtype") == 200)
  {
    id v7 = +[PHQuery queryForAssetCollectionsWithType:1 subtype:3 options:v6];
    id v8 = (const void *)PHQueryForCollectionsInSmartFolderEvents;
    goto LABEL_9;
  }
  if ([v5 collectionListType] == 3 && objc_msgSend(v5, "collectionListSubtype") == 201)
  {
    id v7 = +[PHQuery queryForAssetCollectionsWithType:1 subtype:4 options:v6];
    id v8 = (const void *)PHQueryForCollectionsInSmartFolderFaces;
    goto LABEL_9;
  }
  if ([v5 collectionListType] == 3 && objc_msgSend(v5, "collectionListSubtype") == 1000000202)
  {
    uint64_t v11 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"favorite != 0 AND rejected == 0"];
    int v13 = [v6 sharingFilter];
    if (v13 == 2)
    {
      uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    else
    {
      if (v13 == 1)
      {
        objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"sharingComposition", 1);
      }
      else
      {
        if (v13)
        {
          long long v19 = 0;
          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"sharingComposition", 0);
      uint64_t v18 = };
    }
    long long v19 = (void *)v18;
LABEL_29:
    long long v20 = (void *)MEMORY[0x1E4F28BA0];
    v28[0] = v12;
    v28[1] = v19;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    long long v22 = [v20 andPredicateWithSubpredicates:v21];

    id v7 = +[PHQuery queryForType:@"PHMemory" withBasePredicate:v22 inLibrary:v11];
    if (([v6 hasAnySortDescriptors] & 1) == 0)
    {
      uint64_t v23 = [v5 photoLibrary];
      id v24 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v23];

      uint64_t v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      __int16 v27 = v25;
      int v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];

      [v24 setInternalSortDescriptors:v26];
      id v6 = v24;
    }
    [v7 setFetchOptions:v6];
    id v9 = _Block_copy((const void *)PHQueryForCollectionsInSmartFolderFavoriteMemories);

LABEL_10:
    uint64_t v10 = 0;
    if (v7) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F28F60];
  id v15 = [v5 objectID];
  uint64_t v10 = [v14 predicateWithFormat:@"parentFolder = %@", v15];

  id v9 = _Block_copy((const void *)PHQueryForCollectionsInFolder);
LABEL_19:
  int v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
  id v7 = +[PHQuery queryForType:@"PHCollection" withBasePredicate:v10 inLibrary:v16];

  if (v6) {
    [v7 setFetchOptions:v6];
  }
LABEL_21:
  [v7 _setContainerCollection:v5];
  [v7 _setIdentificationBlock:v9];

  return v7;
}

+ (id)queryForMomentsContainingAssetsWithOIDs:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = [v5 predicateWithFormat:@"ANY assets IN %@", a3];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  id v9 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForMomentsContainingAssetsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets.uuid IN %@", v7];
  id v15 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  int v16 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v14 inLibrary:v15];

  [v16 setFetchOptions:v6];

  return v16;
}

+ (id)queryForMomentsForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  if (!v6)
  {
    id v6 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:0 photoLibrary:v7];
  }
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__34436;
  uint64_t v25 = __Block_byref_object_dispose__34437;
  id v26 = 0;
  id v8 = [v7 photoLibrary];
  uint64_t v9 = [v8 managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __65__PHQuery_queryForMomentsForPersonsWithLocalIdentifiers_options___block_invoke;
  v16[3] = &unk_1E58480A0;
  id v10 = v5;
  id v17 = v10;
  id v11 = v6;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  long long v20 = &v21;
  [v8 performBlockAndWait:v16];
  if (v22[5])
  {
    int v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v22[5]];
    uint64_t v14 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v13 inLibrary:v7];

    [v14 setFetchOptions:v11];
    [v14 _setCollectionFetchType:2];
  }
  else
  {
    uint64_t v14 = 0;
  }

  _Block_object_dispose(&v21, 8);

  return v14;
}

void __65__PHQuery_queryForMomentsForPersonsWithLocalIdentifiers_options___block_invoke(uint64_t a1)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_pl_map:", &__block_literal_global_505);
  id v3 = [MEMORY[0x1E4F8AA10] fetchRequest];
  [v3 setResultType:1];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"personUUID", v2];
  [v3 setPredicate:v4];

  id v5 = [*(id *)(a1 + 40) verifiedPersonTypes];
  if ([v5 count])
  {
    id v6 = (void *)MEMORY[0x1E4F28BA0];
    id v7 = [v3 predicate];
    v22[0] = v7;
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"verifiedType", v5];
    v22[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    id v10 = [v6 andPredicateWithSubpredicates:v9];
    [v3 setPredicate:v10];
  }
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = *(void **)(a1 + 48);
  id v19 = 0;
  int v13 = [v12 executeFetchRequest:v3 error:&v19];
  id v14 = v19;
  id v15 = [v11 setWithArray:v13];

  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F8A9B8] momentIDsWithPersonIDs:v15 inContext:*(void *)(a1 + 48)];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v18 = *(NSObject **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  else
  {
    id v18 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "Failed queryForMomentsForPersonsWithLocalIdentifiers, error fetching person IDs: %@", buf, 0xCu);
    }
  }
}

id __65__PHQuery_queryForMomentsForPersonsWithLocalIdentifiers_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PHObject uuidFromLocalIdentifier:a2];
}

+ (id)queryForMomentsForFacesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v14 = [v6 verifiedPersonTypes];
  if (v14) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(assets, $a, SUBQUERY($a.%K, $f, $f.%K IN %@ AND $f.%K IN %@).@count != 0).@count != 0", @"detectedFaces", @"uuid", v7, @"personForFace.verifiedType", v14];
  }
  else {
  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(assets, $a, SUBQUERY($a.%K, $f, $f.%K IN %@).@count != 0).@count != 0", @"detectedFaces", @"uuid", v7, v19, v20];
  }
  uint64_t v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v17 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v15 inLibrary:v16];

  [v17 setFetchOptions:v6];
  [v17 _setCollectionFetchType:2];

  return v17;
}

+ (id)queryForMomentsInMomentList:(id)a3 options:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
  if ([v5 collectionListSubtype] == 1)
  {
    id v8 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [v5 objectID];
    [v8 predicateWithFormat:@"highlight.parentPhotosHighlight == %@", v9];
    goto LABEL_5;
  }
  if ([v5 collectionListSubtype] == 2)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [v5 objectID];
    [v10 predicateWithFormat:@"highlight.parentPhotosHighlight.parentPhotosHighlight == %@", v9];
    uint64_t v11 = LABEL_5:;
    id v12 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v11 inLibrary:v7];

    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported collectionListSubtype: %li for querying moments within a moment list.", objc_msgSend(v5, "collectionListSubtype"));
  id v15 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v14;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v12 = 0;
  if (v6) {
LABEL_6:
  }
    [v12 setFetchOptions:v6];
LABEL_7:

  return v12;
}

+ (id)queryForMomentsInPhotosHighlight:(id)a3
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 photoLibrary];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [v3 objectID];
  id v7 = [v5 predicateWithFormat:@"highlight = %@", v6];

  LODWORD(v6) = [v3 isSharingSuggestion];
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F28BA0];
    v14[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets.%K IN %@", @"libraryScopeShareState", &unk_1EEB26B80];
    v14[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v11 = [v8 andPredicateWithSubpredicates:v10];

    id v7 = (void *)v11;
  }
  id v12 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v7 inLibrary:v4];

  return v12;
}

+ (id)queryForChildrenDayGroupHighlightsForPhotosHighlight:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v6 predicateWithFormat:@"parentDayGroupPhotosHighlight = %@", v8];
  uint64_t v10 = [v7 photoLibrary];

  uint64_t v11 = +[PHQuery queryForType:@"PHPhotosHighlight" withBasePredicate:v9 inLibrary:v10];

  if (v5) {
    [v11 setFetchOptions:v5];
  }

  return v11;
}

+ (id)queryForParentDayGroupHighlightForPhotosHighlight:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v6 predicateWithFormat:@"ANY childDayGroupPhotosHighlights = %@", v8];
  uint64_t v10 = [v7 photoLibrary];

  uint64_t v11 = +[PHQuery queryForType:@"PHPhotosHighlight" withBasePredicate:v9 inLibrary:v10];

  if (v5) {
    [v11 setFetchOptions:v5];
  }

  return v11;
}

+ (id)queryForChildrenHighlightsForPhotosHighlight:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v6 predicateWithFormat:@"parentPhotosHighlight = %@", v8];
  uint64_t v10 = [v7 photoLibrary];

  uint64_t v11 = +[PHQuery queryForType:@"PHPhotosHighlight" withBasePredicate:v9 inLibrary:v10];

  if (v5) {
    [v11 setFetchOptions:v5];
  }

  return v11;
}

+ (id)queryForParentHighlightsForPhotosHighlights:(id)a3 options:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [v6 photoLibrary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (!v8)
        {
          id v8 = [*(id *)(*((void *)&v19 + 1) + 8 * i) photoLibrary];
        }
        id v15 = [v14 objectID];
        [v7 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY childPhotosHighlights IN %@", v7];
  uint64_t v17 = +[PHQuery queryForType:@"PHPhotosHighlight" withBasePredicate:v16 inLibrary:v8];

  if (v6) {
    [v17 setFetchOptions:v6];
  }

  return v17;
}

+ (id)queryForParentHighlightForPhotosHighlight:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = [v7 objectID];
  id v9 = [v6 predicateWithFormat:@"ANY childPhotosHighlights = %@", v8];
  uint64_t v10 = [v7 photoLibrary];

  uint64_t v11 = +[PHQuery queryForType:@"PHPhotosHighlight" withBasePredicate:v9 inLibrary:v10];

  if (v5) {
    [v11 setFetchOptions:v5];
  }

  return v11;
}

+ (id)queryForPhotosHighlightsContainingMoments:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 objectID];
        [v4 addObject:v12];

        if (!v8)
        {
          id v8 = [v11 photoLibrary];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  int v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY moments IN %@", v4];
  id v14 = +[PHQuery queryForType:@"PHPhotosHighlight" withBasePredicate:v13 inLibrary:v8];

  return v14;
}

+ (id)queryForMomentsBackingSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 photoLibrary];
  id v5 = [v3 predicateForAllMomentsFromRepresentativeAssets];

  uint64_t v6 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v5 inLibrary:v4];

  [v6 _setCollectionFetchType:2];

  return v6;
}

+ (id)queryForMomentsBackingMemory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 photoLibrary];
  id v5 = [v3 predicateForAllMomentsFromRepresentativeAssets];

  uint64_t v6 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v5 inLibrary:v4];

  [v6 _setCollectionFetchType:2];

  return v6;
}

+ (id)queryForMomentsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v5 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:0 inLibrary:v4];

  if (v3) {
    [v5 setFetchOptions:v3];
  }

  return v5;
}

+ (id)queryForAssetCollectionsWithObjectIDs:(id)a3 options:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", a3];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = [a1 queryForType:@"PHAssetCollection" withBasePredicate:v7 inLibrary:v8];

  if (v6) {
    [v9 setFetchOptions:v6];
  }

  return v9;
}

+ (id)queryForAssetCollectionsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = _fetchTypeForAssetCollectionTypeAndSubtype(a3, 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v11 = [a1 queryForType:v10 withLocalIdentifiers:v9 options:v8];

  return v11;
}

+ (id)_fetchTypeForLocalIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = @"PHAssetCollection";
  id v5 = @"PHAssetCollection";
  if ([v3 count])
  {
    id v6 = [v3 objectAtIndexedSubscript:0];
    uint64_t v7 = +[PHObject identifierCodeFromLocalIdentifier:v6];

    if (v7)
    {
      id v8 = v7;
      pl_dispatch_once();
      id v4 = [(id)_fetchTypeForLocalIdentifierCode_pl_once_object_26 objectForKeyedSubscript:v8];

      if (!v4)
      {
        id v4 = @"PHAssetCollection";
        id v9 = @"PHAssetCollection";
      }
    }
    else
    {
      id v4 = @"PHAssetCollection";
    }
  }

  return v4;
}

+ (id)queryForAssetCollectionsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _fetchTypeForLocalIdentifiers:v7];
  id v9 = [a1 queryForType:v8 withLocalIdentifiers:v7 options:v6];

  return v9;
}

+ (BOOL)_validateLocalIdentifiers:(id)a3 compatibilityWithFetchType:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v21;
    char v11 = 1;
    *(void *)&long long v8 = 138412546;
    long long v18 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v14 = +[PHObject identifierCodeFromLocalIdentifier:](PHObject, "identifierCodeFromLocalIdentifier:", v13, v18);
        id v15 = +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:v14];
        if (([v15 isEqualToString:v6] & 1) == 0)
        {
          long long v16 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            uint64_t v25 = v13;
            __int16 v26 = 2112;
            id v27 = v6;
            _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Invalid localIdentifier %@ passed to query for %@", buf, 0x16u);
          }

          char v11 = 0;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);
  }
  else
  {
    char v11 = 1;
  }

  return v11 & 1;
}

+ (id)queryForAssetCollectionsContainingAssets:(id)a3 withType:(int64_t)a4 options:(id)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v22 = 0;
  uint64_t v9 = [a1 _assetIDsFromAssets:a3 anyAsset:&v22];
  id v10 = v22;
  char v11 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:v10];
  if ([v9 count])
  {
    switch(a4)
    {
      case 1:
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets IN %@", v9];
        uint64_t v13 = @"PHAlbum";
        goto LABEL_13;
      case 3:
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets IN %@", v9];
        uint64_t v13 = @"PHMoment";
        goto LABEL_13;
      case 4:
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY extendedCuratedAssets IN %@", v9];
        uint64_t v13 = @"PHMemory";
        goto LABEL_13;
      case 6:
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets IN %@", v9];
        uint64_t v13 = @"PHPhotosHighlight";
        goto LABEL_13;
      case 7:
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets IN %@", v9];
        id v15 = +[PHPhotoLibrary sharedMomentSharePhotoLibrary];
        id v14 = +[PHQuery queryForType:@"PHMoment" withBasePredicate:v12 inLibrary:v15];
        goto LABEL_11;
      case 8:
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY keyAssets IN %@", v9];
        id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY representativeAssets IN %@", v9];
        long long v16 = (void *)MEMORY[0x1E4F28BA0];
        v25[0] = v12;
        v25[1] = v15;
        long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
        long long v18 = [v16 orPredicateWithSubpredicates:v17];

        id v14 = +[PHQuery queryForType:@"PHSuggestion" withBasePredicate:v18 inLibrary:v11];

LABEL_11:
        break;
      case 9:
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@", @"assets", v9];
        uint64_t v13 = @"PHImportSession";
LABEL_13:
        id v14 = +[PHQuery queryForType:v13 withBasePredicate:v12 inLibrary:v11];
        break;
      default:
        if (queryForAssetCollectionsContainingAssets_withType_options__didLog) {
          goto LABEL_5;
        }
        queryForAssetCollectionsContainingAssets_withType_options__didLog = 1;
        uint64_t v12 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)a4 > 0xB) {
            long long v20 = 0;
          }
          else {
            long long v20 = off_1E5846DF8[a4];
          }
          long long v21 = v20;
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v21;
          _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "Fetching for asset collection type %@ containing an asset is not supported", buf, 0xCu);
        }
        id v14 = 0;
        break;
    }
  }
  else
  {
LABEL_5:
    id v14 = 0;
  }
  [v14 setFetchOptions:v8];

  return v14;
}

+ (id)queryForAllTripHighlightsContainingAssetUUIDs:(id)a3 options:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  uint64_t v7 = [v5 predicateWithFormat:@"ANY %K.%K IN %@", @"dayGroupAssets", @"uuid", a3];
  id v8 = [MEMORY[0x1E4F8AAB8] predicateForAllTripHighlights];
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  v15[0] = v7;
  v15[1] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  char v11 = [v9 andPredicateWithSubpredicates:v10];

  uint64_t v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v13 = +[PHQuery queryForType:@"PHPhotosHighlight" withBasePredicate:v11 inLibrary:v12];
  [v13 setFetchOptions:v6];

  return v13;
}

+ (id)queryForAssetCollectionsContainingAsset:(id)a3 withType:(int64_t)a4 options:(id)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 objectID];

  if (v9)
  {
    id v10 = [v7 photoLibrary];
    switch(a4)
    {
      case 1:
        long long v16 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v12 = [v7 objectID];
        uint64_t v13 = [v16 predicateWithFormat:@"assets CONTAINS %@", v12];
        id v14 = @"PHAlbum";
        goto LABEL_13;
      case 3:
      case 7:
        char v11 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v12 = [v7 objectID];
        uint64_t v13 = [v11 predicateWithFormat:@"assets CONTAINS %@", v12];
        id v14 = @"PHMoment";
        goto LABEL_13;
      case 6:
        long long v19 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v12 = [v7 objectID];
        uint64_t v13 = [v19 predicateWithFormat:@"assets CONTAINS %@", v12];
        id v14 = @"PHPhotosHighlight";
        goto LABEL_13;
      case 8:
        long long v20 = (void *)MEMORY[0x1E4F28F60];
        long long v21 = [v7 objectID];
        id v22 = [v20 predicateWithFormat:@"keyAssets CONTAINS %@", v21];

        long long v23 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v24 = [v7 objectID];
        uint64_t v25 = [v23 predicateWithFormat:@"representativeAssets CONTAINS %@", v24];

        __int16 v26 = (void *)MEMORY[0x1E4F28BA0];
        v34[0] = v22;
        v34[1] = v25;
        id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
        int v28 = [v26 orPredicateWithSubpredicates:v27];

        id v15 = +[PHQuery queryForType:@"PHSuggestion" withBasePredicate:v28 inLibrary:v10];

        break;
      case 9:
        uint64_t v29 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v12 = [v7 objectID];
        uint64_t v13 = [v29 predicateWithFormat:@"%K CONTAINS %@", @"assets", v12];
        id v14 = @"PHImportSession";
LABEL_13:
        id v15 = +[PHQuery queryForType:v14 withBasePredicate:v13 inLibrary:v10];

        break;
      default:
        if ((queryForAssetCollectionsContainingAsset_withType_options__didLog & 1) == 0)
        {
          queryForAssetCollectionsContainingAsset_withType_options__didLog = 1;
          long long v17 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            if ((unint64_t)a4 > 0xB) {
              long long v18 = 0;
            }
            else {
              long long v18 = off_1E5846DF8[a4];
            }
            long long v31 = v18;
            *(_DWORD *)buf = 138412290;
            long long v33 = v31;
            _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEFAULT, "Fetching for asset collection type %@ containing an asset is not supported", buf, 0xCu);
          }
        }
        id v15 = 0;
        break;
    }
  }
  else
  {
    id v15 = 0;
  }
  [v15 setFetchOptions:v8];

  return v15;
}

+ (id)queryForAssetsForComment:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectID];
  uint64_t v9 = [v7 objectID];
  id v10 = [v5 predicateWithFormat:@"%K CONTAINS %@ OR %K CONTAINS %@", @"likeComments", v8, @"cloudComments", v9];

  char v11 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v12 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v10 inLibrary:v11];
  [v12 setFetchOptions:v6];

  return v12;
}

+ (id)queryForAssetsInPreviewStateWithSuggestedByClientTypes:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "integerValue", (void)v18);
        uint64_t v13 = PLManagedAssetPredicateToFetchAllAssetsInLibraryScopePreviewStateWithSuggestedByClientType();
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v14 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v7];
  id v15 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  long long v16 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v14 inLibrary:v15];

  [v16 setFetchOptions:v6];

  return v16;
}

+ (id)queryForAssetsInPreviewStateInLibraryScope:(id)a3 options:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int v8 = [a1 _participationStateFromLibraryScope:v7];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activeLibraryScopeParticipationState", v8);
  uint64_t v10 = PLManagedAssetPredicateToFetchAllAssetsInLibraryScopePreviewState();
  uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v9;
  v17[1] = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v13 = [v11 andPredicateWithSubpredicates:v12];

  id v14 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  id v15 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v13 inLibrary:v14];

  [v15 setFetchOptions:v6];

  return v15;
}

+ (id)queryForAssetsWithCurrentUserAsLibraryScopeContributor:(BOOL)a3 inLibraryScope:(id)a4 options:(id)a5
{
  BOOL v6 = a3;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a5;
  uint64_t v9 = [a4 objectID];
  uint64_t v10 = [v7 predicateWithFormat:@"libraryScope == %@", v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
  if (v6)
  {
    v20[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyContentContributedByCurrentUser];
    v20[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v14 = [v11 andPredicateWithSubpredicates:v13];
  }
  else
  {
    v19[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyContentContributedByCurrentUser];
    uint64_t v13 = [v11 notPredicateWithSubpredicate:v12];
    v19[1] = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v14 = [v11 andPredicateWithSubpredicates:v15];

    uint64_t v10 = (void *)v15;
  }

  long long v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:0];
  long long v17 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v14 inLibrary:v16];

  [v17 setFetchOptions:v8];

  return v17;
}

+ (id)queryForAssetsInLibraryScope:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [a1 _participationStateFromLibraryScope:v7];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activeLibraryScopeParticipationState", v8);
  uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

  uint64_t v11 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v6];

  return v11;
}

+ (id)queryForAssetsCaptured:(BOOL)a3 orEdited:(BOOL)a4 onThisCameraSinceDate:(id)a5 options:(id)a6
{
  int v7 = a4;
  int v8 = a3;
  v33[4] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    int v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PHQuery.m", 2314, @"Invalid parameter not satisfying: %@", @"date != nil" object file lineNumber description];
  }
  uint64_t v13 = [v12 photoLibrary];

  if (!v13)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PHQuery.m", 2315, @"Invalid parameter not satisfying: %@", @"options.photoLibrary != nil" object file lineNumber description];
  }
  [v11 timeIntervalSinceNow];
  if (v14 >= 0.0)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PHQuery.m", 2316, @"Invalid parameter not satisfying: %@", @"date.timeIntervalSinceNow < 0" object file lineNumber description];
  }
  uint64_t v15 = [v12 internalPredicate];

  if (v15)
  {
    long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"PHQuery.m", 2317, @"Invalid parameter not satisfying: %@", @"options.internalPredicate == nil" object file lineNumber description];
  }
  if (v8 == v7)
  {
    long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"PHQuery.m", 2318, @"Invalid parameter not satisfying: %@", @"captured != edited" object file lineNumber description];
  }
  long long v16 = (void *)[v12 copy];
  if (!v8)
  {
    long long v18 = 0;
    long long v17 = 0;
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  long long v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"dateCreated", v11];
  long long v18 = [MEMORY[0x1E4F8A950] predicateForUnadjustedAssetsWithKeyPathToAsset:0];
  if (v7)
  {
LABEL_15:
    uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"adjustmentTimestamp", v11];

    uint64_t v20 = [MEMORY[0x1E4F8A950] predicateForAdjustedAssetsWithKeyPathToAsset:0];

    long long v18 = (void *)v20;
    long long v17 = (void *)v19;
  }
LABEL_16:
  long long v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %d", @"currentSleetCast", 0);
  id v22 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCameraAsset"), 1);
  uint64_t v23 = (void *)MEMORY[0x1E4F28BA0];
  v33[0] = v17;
  v33[1] = v18;
  v33[2] = v21;
  v33[3] = v22;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  uint64_t v25 = [v23 andPredicateWithSubpredicates:v24];

  [v16 setInternalPredicate:v25];
  __int16 v26 = [a1 queryForAssetsWithOptions:v16];

  return v26;
}

+ (id)queryForAssetsEditedOnThisCameraSinceDate:(id)a3 options:(id)a4
{
  return (id)[a1 queryForAssetsCaptured:0 orEdited:1 onThisCameraSinceDate:a3 options:a4];
}

+ (id)queryForAssetsCapturedOnThisCameraSinceDate:(id)a3 options:(id)a4
{
  return (id)[a1 queryForAssetsCaptured:1 orEdited:0 onThisCameraSinceDate:a3 options:a4];
}

+ (id)queryForAssetsFromCameraSinceDate:(id)a3 options:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PHQuery.m", 2283, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  if (+[PHPhotoLibrary isMultiLibraryModeEnabled])
  {
    uint64_t v9 = [v8 photoLibrary];

    if (!v9)
    {
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, a1, @"PHQuery.m", 2285, @"Invalid parameter not satisfying: %@", @"options.photoLibrary" object file lineNumber description];
    }
  }
  uint64_t v10 = (void *)[v8 copy];

  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"addedDate", v7];
  id v12 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCameraAsset"), 1);
  uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
  v26[0] = v11;
  v26[1] = v12;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

  uint64_t v16 = [v10 internalPredicate];
  long long v17 = (void *)v16;
  if (v16)
  {
    long long v18 = (void *)MEMORY[0x1E4F28BA0];
    v25[0] = v16;
    v25[1] = v15;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v20 = [v18 andPredicateWithSubpredicates:v19];
    [v10 setInternalPredicate:v20];
  }
  else
  {
    [v10 setInternalPredicate:v15];
  }
  long long v21 = [a1 queryForAssetsWithOptions:v10];

  return v21;
}

+ (id)queryForAssetsForBehavioralCurationWithOptions:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F8A950];
  id v4 = a3;
  id v5 = [v3 predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToSceneVersion:0];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"faceAdjustmentVersion");
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v5;
  v13[1] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v9 = [v7 andPredicateWithSubpredicates:v8];

  uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v11 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v9 inLibrary:v10];

  [v11 setFetchOptions:v4];

  return v11;
}

+ (id)queryForAllAssetsInYearRepresentedByYearHighlight:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 kind] == 2)
  {
    id v8 = [v6 photoLibrary];
    uint64_t v9 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v8];

    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    id v11 = [v6 objectID];
    id v12 = [v10 predicateWithFormat:@"highlightBeingAssets.parentPhotosHighlight.parentPhotosHighlight = %@", v11];
    [v9 setInternalPredicate:v12];

    uint64_t v13 = [a1 queryForAssetsWithOptions:v9];
    id v7 = v9;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)queryForReferencedAssetsWithOptions:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F8B9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v6 setComparator:1];
  [v6 setKey:6];
  [v5 addSingleQueries:v6];
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v8 = objc_alloc_init(MEMORY[0x1E4F8AB00]);
  uint64_t v9 = (void *)MEMORY[0x1E4F8AB08];
  uint64_t v10 = [v7 photoLibrary];
  id v11 = [v9 predicateForQuery:v5 inLibrary:v10 changeDetectionCriteria:v8];

  id v12 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v7];
  [v12 setFetchOptions:v4];

  uint64_t v13 = [[PHQueryChangeDetectionCriteria alloc] initWithPLQueryChangeDetectionCriteria:v8];
  if (v13)
  {
    double v14 = [v12 fetchOptions];
    [v14 setChangeDetectionCriteria:v13];
  }

  return v12;
}

+ (id)queryForAssetsForKeywords:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(a3, "_pl_map:", &__block_literal_global_351_34634);
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@", @"additionalAttributes.keywords", v6];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v5];

  return v9;
}

uint64_t __45__PHQuery_queryForAssetsForKeywords_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

+ (id)queryForKeySharingSuggestionAssetsInHighlight:(id)a3 options:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 assetCollectionSubtype] == 1000000302)
  {
    id v7 = [v5 photoLibrary];
    id v8 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v7];

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    id v11 = [v5 objectID];
    id v12 = [v10 predicateWithFormat:@"highlightBeingAssets.parentPhotosHighlight == %@", v11];
    [v9 addObject:v12];

    uint64_t v13 = PLManagedAssetPredicateToFetchAssetsSuggestedForSharing();
    [v9 addObject:v13];

    double v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v9];
    [v8 setInternalPredicate:v14];

    [v8 setSharingFilter:0];
    uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
    v19[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v8 setInternalSortDescriptors:v16];

    long long v17 = +[PHQuery queryForAssetsWithOptions:v8];

    id v6 = v8;
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

+ (id)queryForKeyAssetsInMomentShare:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 preview];
  id v8 = [v7 keyAssetIdentifier];
  if (v8)
  {
    uint64_t v9 = [v5 photoLibrary];
    uint64_t v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v9];

    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@ OR cloudAssetGUID == %@", v8, v8];
    [v10 setInternalPredicate:v11];
    id v12 = +[PHQuery queryForAssetsInAssetCollection:v5 options:v10];

    id v6 = v10;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)queryForAssetsWithBurstIdentifier:(id)a3 options:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F8A950];
  id v6 = a4;
  id v7 = [v5 predicateForBurstAssetsWithBurstUUID:a3];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  uint64_t v9 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v7 inLibrary:v8];

  [v9 setFetchOptions:v6];

  return v9;
}

+ (id)queryForVisibleAssetsWithObjectIDs:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:0];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v6];
  uint64_t v10 = [a1 queryForType:@"PHAsset" withBasePredicate:v9 seedOIDs:0 inLibrary:v8];

  id v11 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v8];

  [v10 setFetchOptions:v11];

  return v10;
}

+ (id)queryForGuestAssetsInCollectionContainingAsset:(id)a3 options:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  [v6 fetchPropertySetsIfNeeded];
  id v7 = [v6 curationProperties];

  id v8 = [v7 syndicationIdentifier];

  uint64_t v9 = PLSearchableIdentifierFromMessagesSyndicationID();
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"additionalAttributes.syndicationIdentifier CONTAINS %@", v9];
  id v11 = [v5 internalPredicate];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v13 = [v5 internalPredicate];
    v18[0] = v13;
    v18[1] = v10;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v15 = [v12 andPredicateWithSubpredicates:v14];
    [v5 setInternalPredicate:v15];
  }
  else
  {
    [v5 setInternalPredicate:v10];
  }
  uint64_t v16 = +[PHQuery queryForGuestAssetsWithOptions:v5];

  return v16;
}

+ (id)queryForGuestAssetsWithOptions:(id)a3
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = [a1 _guestAssetOnlyPredicate];
  v14[0] = v7;
  id v8 = +[PHAsset filterPredicateToExcludeNoSyndicationAssets];
  v14[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v10 = [v6 andPredicateWithSubpredicates:v9];

  id v11 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v10 inLibrary:v5];
  if (!v4 || ![v4 includeAssetSourceTypes])
  {
    id v12 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v4 photoLibrary:v5];

    [v12 setIncludeAssetSourceTypes:1];
    id v4 = v12;
  }
  [v11 setFetchOptions:v4];

  return v11;
}

+ (id)queryForAnyCinematicVideosNeedingDeferredProcessingWithOtions:(id)a3
{
  id v3 = a3;
  id v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d AND %K = %d", @"depthType", 2, @"deferredProcessingNeeded", 2);
  id v6 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v5 inLibrary:v4];
  if (!v3)
  {
    id v3 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:0 photoLibrary:v4];
  }
  [v3 setFetchLimit:1];
  [v6 setFetchOptions:v3];

  return v6;
}

+ (id)queryForAssetsForPTPWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v5 = [v4 photoLibrary];
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__34436;
  uint64_t v20 = __Block_byref_object_dispose__34437;
  id v21 = 0;
  id v6 = [v5 managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__PHQuery_queryForAssetsForPTPWithOptions___block_invoke;
  v12[3] = &unk_1E5848318;
  uint64_t v15 = &v16;
  id v7 = v6;
  id v13 = v7;
  id v8 = v4;
  id v14 = v8;
  [v7 performBlockAndWait:v12];
  uint64_t v9 = [MEMORY[0x1E4F8A9E8] predicateForAssetsExposedByPHPTPExcludingObjectIDs:v17[5]];
  uint64_t v10 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v9 inLibrary:v8];
  if (!v3)
  {
    id v3 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:0 photoLibrary:v8];
  }
  [v3 setIncludeAllBurstAssets:1];
  [v3 setIncludeHiddenAssets:1];
  [v10 setFetchOptions:v3];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __43__PHQuery_queryForAssetsForPTPWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F8A9E8], "fetchAssetIdsToExcludeFromPTPInContext:isCloudPhotoLibraryEnabled:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "isCloudPhotoLibraryEnabled"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)queryForCloudSharedAlbumInvitationRecordsForCloudSharedAlbum:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:v6];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v9 = [v6 cloudGUID];

  uint64_t v10 = [v8 predicateWithFormat:@"%K = %@", @"albumGUID", v9];

  id v11 = +[PHQuery queryForType:@"PHCloudSharedAlbumInvitationRecord" withBasePredicate:v10 inLibrary:v7];
  if (!v5)
  {
    id v5 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:0 photoLibrary:v7];
  }
  [v11 setFetchOptions:v5];

  return v11;
}

+ (id)queryForCloudSharedAlbumInvitationRecordsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  id v5 = +[PHQuery queryForType:@"PHCloudSharedAlbumInvitationRecord" withBasePredicate:0 inLibrary:v4];
  if (!v3)
  {
    id v3 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:0 photoLibrary:v4];
  }
  [v5 setFetchOptions:v3];

  return v5;
}

+ (id)queryForCloudSharedAlbumsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryForType:@"PHCloudSharedAlbum" withLocalIdentifiers:a3 options:v6];
  [v7 setFetchOptions:v6];

  return v7;
}

+ (id)queryForAssetsWithCloudIdentifiers:(id)a3 options:(id)a4
{
  return (id)[a1 queryForType:@"PHAsset" withIdentifiers:a3 identifierKeyPath:@"cloudAssetGUID" options:a4];
}

+ (id)_queryForAssetsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryForType:@"PHAsset" withLocalIdentifiers:a3 options:v6];
  id v8 = objc_opt_class();
  uint64_t v9 = [v6 photoLibrary];
  uint64_t v10 = [v8 _defaultFetchOptionsForIdentifiedAssetsQueryInPhotoLibrary:v9];

  if (v6) {
    [v10 mergeWithFetchOptions:v6];
  }
  [v7 setFetchOptions:v10];

  return v7;
}

+ (id)queryForType:(id)a3 withLocalIdentifiers:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v10 isEqualToString:@"PHPerson"]) {
    id v11 = @"personUUID";
  }
  else {
    id v11 = @"uuid";
  }
  id v12 = [a1 queryForType:v10 withIdentifiers:v9 identifierKeyPath:v11 options:v8];

  return v12;
}

+ (id)queryForAssetsWithMediaType:(int64_t)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  if ((unint64_t)a3 >= 4) {
    unint64_t v7 = 3;
  }
  else {
    unint64_t v7 = (0x2000100000003uLL >> (16 * a3)) & 3;
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d", v7);
  id v9 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v8 inLibrary:v6];

  if (!v5 || ![v5 includeAssetSourceTypes])
  {
    id v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v5 photoLibrary:v6];

    [v10 setIncludeAssetSourceTypes:1];
    id v5 = v10;
  }
  [v9 setFetchOptions:v5];

  return v9;
}

+ (id)queryForCustomUserAssetsInMemory:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 4)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1922 description:@"Fetching for user curated assets is only supported in a memory"];
  }
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v8 objectID];
  id v11 = [v9 predicateWithFormat:@"%K CONTAINS %@", @"memoriesBeingCustomUserAssets", v10];

  id v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  id v13 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v12];

  [v13 _setContainerCollection:v8];
  [v13 setFetchOptions:v7];

  return v13;
}

+ (id)queryForUserCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 4)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1909 description:@"Fetching for user curated assets is only supported in a memory"];
  }
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v8 objectID];
  id v11 = [v9 predicateWithFormat:@"memoriesBeingUserCuratedAssets CONTAINS %@", v10];

  id v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  id v13 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v12];

  id v14 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v13 _setContainerCollection:v8];
  [v13 setFetchOptions:v14];

  return v13;
}

+ (id)queryForMovieCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 4)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1895 description:@"Fetching for movie curated assets is only supported in a memory"];
  }
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v8 objectID];
  id v11 = [v9 predicateWithFormat:@"memoriesBeingMovieCuratedAssets CONTAINS %@", v10];

  id v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  id v13 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v12];

  id v14 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v13 _setContainerCollection:v8];
  [v13 setFetchOptions:v14];

  return v13;
}

+ (id)queryForAssetsInImportSessions:(id)a3 options:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectID];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"importSession IN %@", v8];
  uint64_t v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:0];
  long long v17 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v15 inLibrary:v16];
  uint64_t v18 = [a1 _fetchOptionsForFetchingAssetsFromImportSessions:v9 options:v7];

  [v17 _setContainerCollection:0];
  [v17 setFetchOptions:v18];

  return v17;
}

+ (id)_guestAssetOnlyPredicate
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8BA10];
  uint64_t v3 = [MEMORY[0x1E4F8BA10] maskForGuestAsset];

  return (id)[v2 predicateForIncludeMask:v3 useIndex:1];
}

+ (id)queryForAssetsInBoundingBoxWithTopLeftLocation:(id)a3 bottomRightLocation:(id)a4 options:(id)a5
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F28C68];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v7 expressionForKeyPath:@"boundedByRect"];
  uint64_t v12 = (void *)MEMORY[0x1E4F28C68];
  v19[0] = v10;
  v19[1] = v9;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v14 = [v12 expressionForConstantValue:v13];

  uint64_t v15 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v11 rightExpression:v14 modifier:0 type:2000 options:0];
  uint64_t v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:0];
  long long v17 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v15 inLibrary:v16];

  [v17 setFetchOptions:v8];

  return v17;
}

+ (id)queryForCuratedAssetsInMomentShare:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 preview];
  id v8 = [v7 curatedAssetIdentifiers];
  if ([v8 count])
  {
    id v9 = [v5 photoLibrary];
    id v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v9];

    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@ OR cloudAssetGUID IN %@", v8, v8];
    [v10 setInternalPredicate:v11];
    uint64_t v12 = +[PHQuery queryForAssetsInAssetCollection:v5 options:v10];

    id v6 = v10;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)queryForCuratedAssetsInPhotosHighlight:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _predicateForAssetsInPhotosHighlightWithOptions(v6, v7);
  if (v8)
  {
    id v9 = [v6 photoLibrary];
    id v10 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v8 inLibrary:v9];
    uint64_t v11 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v6 options:v7 changeDetectionCriteria:0];

    [v10 _setContainerCollection:v6];
    [v10 setFetchOptions:v11];

    id v7 = (id)v11;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)queryForRepresentativeAssetsInMemory:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 4)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1706 description:@"Fetching for representative assets is only supported in a memory"];
  }
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v8 objectID];
  uint64_t v11 = [v9 predicateWithFormat:@"memoriesBeingRepresentativeAssets CONTAINS %@", v10];

  uint64_t v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  id v13 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v12];

  id v14 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v13 _setContainerCollection:v8];
  [v13 setFetchOptions:v14];

  return v13;
}

+ (id)queryForRepresentativeAssetsInSuggestion:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 8)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1692 description:@"Fetching for representative assets by suggestionsBeingRepresentativeAssets is only supported in a suggestion"];
  }
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v8 objectID];
  uint64_t v11 = [v9 predicateWithFormat:@"suggestionsBeingRepresentativeAssets CONTAINS %@", v10];

  uint64_t v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  id v13 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v12];

  id v14 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v13 _setContainerCollection:v8];
  [v13 setFetchOptions:v14];

  return v13;
}

+ (id)queryForKeyAssetsInSuggestion:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 8)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1678 description:@"Fetching for key assets by suggestionsBeingKeyAssets is only supported in a suggestion"];
  }
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v8 objectID];
  uint64_t v11 = [v9 predicateWithFormat:@"suggestionsBeingKeyAssets CONTAINS %@", v10];

  uint64_t v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  id v13 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v11 inLibrary:v12];

  id v14 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v13 _setContainerCollection:v8];
  [v13 setFetchOptions:v14];

  return v13;
}

+ (id)queryForAssetsAssociatedWithMomentsOfMemory:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 4)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1666 description:@"queryForAssetsAssociatedWithMomentsOfMemory is only supported for a memory"];
  }
  id v9 = [v8 predicateForAssetsContainedInMomentsFromRepresentativeAssets];
  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  uint64_t v11 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v9 inLibrary:v10];

  uint64_t v12 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v11 _setContainerCollection:v8];
  [v11 setFetchOptions:v12];

  return v11;
}

+ (id)queryForAllAssetsAssociatedWithMemory:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 assetCollectionType] != 4)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1654 description:@"Fetching for all associated assets for a memory is only supported for a memory"];
  }
  id v9 = [v8 objectID];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K CONTAINS %@ OR %K CONTAINS %@", @"memoriesBeingExtendedCuratedAssets", v9, @"memoriesBeingRepresentativeAssets", v9];
  uint64_t v11 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v8];
  uint64_t v12 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v10 inLibrary:v11];

  id v13 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v8 options:v7 changeDetectionCriteria:0];

  [v12 _setContainerCollection:v8];
  [v12 setFetchOptions:v13];

  return v12;
}

+ (id)queryForExtendedCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 assetCollectionType] != 4)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1621 description:@"Fetching for curated assets is only supported in a memory"];
  }
  if ([v7 isTransient])
  {
    id v9 = [v7 queryForExtendedCuratedAssetsWithOptions:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = [v7 objectID];
    uint64_t v12 = [v10 predicateWithFormat:@"memoriesBeingExtendedCuratedAssets CONTAINS %@", v11];

    id v13 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:v7];
    id v9 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v12 inLibrary:v13];

    uint64_t v14 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v7 options:v8 changeDetectionCriteria:0];

    [v9 _setContainerCollection:v7];
    [v9 setFetchOptions:v14];

    id v8 = (id)v14;
  }

  return v9;
}

+ (id)queryForCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 assetCollectionType] != 4)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHQuery.m" lineNumber:1601 description:@"Fetching for curated assets is only supported in a memory"];
  }
  if ([v7 isTransient])
  {
    id v9 = [v7 queryForCuratedAssetsWithOptions:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = [v7 objectID];
    uint64_t v12 = [v10 predicateWithFormat:@"memoriesBeingCuratedAssets CONTAINS %@", v11];

    id v13 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:v7];
    id v9 = +[PHQuery queryForType:@"PHAsset" withBasePredicate:v12 inLibrary:v13];

    uint64_t v14 = [a1 _fetchOptionsForFetchingAssetsFromAssetCollection:v7 options:v8 changeDetectionCriteria:0];

    [v9 _setContainerCollection:v7];
    [v9 setFetchOptions:v14];

    id v8 = (id)v14;
  }

  return v9;
}

+ (id)queryForMemoriesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryForType:@"PHMemory" withLocalIdentifiers:a3 options:v6];
  [v7 setFetchOptions:v6];

  return v7;
}

+ (id)_assetIDsFromAssets:(id)a3 anyAsset:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 fetchedObjectIDs];
  }
  else
  {
    id v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !v6)
  {
    id v7 = [v5 objectIDs];
    id v6 = [v7 array];
  }
  if (v6)
  {
    if (a4)
    {
      memset(v18, 0, sizeof(v18));
      if ([v5 countByEnumeratingWithState:v18 objects:v23 count:16]) {
        *a4 = **((id **)&v18[0] + 1);
      }
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v15 = [v14 objectID];

          if (v15)
          {
            uint64_t v16 = [v14 objectID];
            [v6 addObject:v16];

            if (!((a4 == 0) | v11 & 1))
            {
              *a4 = v14;
              char v11 = 1;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }
  }

  return v6;
}

+ (id)_fetchOptionsForFetchingAssetsFromImportSessions:(id)a3 options:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 firstObject];
  id v7 = [v6 photoLibrary];
  id v8 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v5 photoLibrary:v7];

  if (([v8 hasAnySortDescriptors] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
    v12[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

    [v8 setInternalSortDescriptors:v10];
  }

  return v8;
}

+ (id)combinedFetchRequestForQueries:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 fetchType];
  id v6 = +[PHPhotoLibrary classForFetchType:v5];

  uint64_t v7 = [(objc_class *)v6 managedEntityName];
  id v8 = [v4 photoLibrary];
  uint64_t v9 = [v8 managedObjectContextForCurrentQueueQoS];
  id v40 = (void *)v7;
  uint64_t v10 = PLSafeEntityForNameInManagedObjectContext();

  char v11 = objc_opt_new();
  uint64_t v39 = (void *)v10;
  [v11 setEntity:v10];
  uint64_t v12 = [v4 combinedQueryKeyPath];
  id v13 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = [*(id *)(*((void *)&v41 + 1) + 8 * i) combinedQuerySeparatingIdentifier];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v16);
  }

  long long v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@)", v12, v13];
  uint64_t v21 = [v4 effectivePredicateForPHClass:v6 includingBasePredicate:0];
  long long v22 = (void *)v21;
  if (v21)
  {
    long long v23 = (void *)MEMORY[0x1E4F28BA0];
    long long v38 = v20;
    v47[0] = v20;
    v47[1] = v21;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    uint64_t v25 = [v23 andPredicateWithSubpredicates:v24];

    long long v37 = (void *)v25;
    [v11 setPredicate:v25];
    [v11 setIncludesPendingChanges:0];
    [v11 setResultType:2];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v26 setName:@"objectID"];
    id v27 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
    [v26 setExpression:v27];

    [v26 setExpressionResultType:2000];
    id v28 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v28 setName:v12];
    uint64_t v29 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v12];
    [v28 setExpression:v29];

    [v28 setExpressionResultType:2000];
    v46[0] = v26;
    v46[1] = v28;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    [v11 setPropertiesToFetch:v30];

    long long v31 = [v4 _effectiveSortDescriptors];
    [v11 setSortDescriptors:v31];
    if ([v4 _isAlbumContentSort]
      && [v4 _isAlbumContentTitleSort])
    {
      long long v32 = [v11 relationshipKeyPathsForPrefetching];
      if (([v32 containsObject:@"additionalAttributes.title"] & 1) == 0)
      {
        long long v36 = v32;
        if ([v32 count])
        {
          [v32 arrayByAddingObject:@"additionalAttributes.title"];
        }
        else
        {
          uint64_t v45 = @"additionalAttributes.title";
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
        long long v34 = };
        [v11 setRelationshipKeyPathsForPrefetching:v34];

        long long v32 = v36;
      }
    }
    id v33 = v11;

    long long v20 = v38;
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

+ (signed)_participationStateFromLibraryScope:(id)a3
{
  return a3 != 0;
}

@end