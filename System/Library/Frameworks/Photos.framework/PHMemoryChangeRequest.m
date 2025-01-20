@interface PHMemoryChangeRequest
+ (BOOL)_shouldAcceptProposedAttributes:(id)a3;
+ (id)_preferredAttributesForMemoryCreationFromObject:(id)a3 withSuccess:(BOOL)a4 title:(id)a5 subtitle:(id)a6 error:(id)a7 proposedAttributes:(id)a8;
+ (id)changeRequestForMemory:(id)a3;
+ (id)changeRequestForRemotelyViewedMemoryWithLocalIdentifier:(id)a3;
+ (id)creationRequestForMemoryWithTitle:(id)a3 subtitle:(id)a4 creationDate:(id)a5 category:(unint64_t)a6 subcategory:(unint64_t)a7 representativeAssetUUIDs:(id)a8 curatedAssetUUIDs:(id)a9 extendedCuratedAssetUUIDs:(id)a10 keyAssetUUID:(id)a11;
+ (id)creationRequestForMemoryWithTitle:(id)a3 subtitle:(id)a4 creationDate:(id)a5 category:(unint64_t)a6 subcategory:(unint64_t)a7 representativeAssets:(id)a8 curatedAssets:(id)a9 extendedCuratedAssets:(id)a10 keyAsset:(id)a11;
+ (id)preferredAttributesForMemoryCreationFromAssetCollection:(id)a3 proposedAttributes:(id)a4;
+ (id)preferredAttributesForMemoryCreationFromCollectionList:(id)a3 proposedAttributes:(id)a4;
+ (id)preferredAttributesForMemoryCreationFromPeople:(id)a3 proposedAttributes:(id)a4;
+ (id)validateMemoryTitle:(id)a3 error:(id *)a4;
+ (int64_t)_titleFormatForProposedAttributes:(id)a3;
+ (void)blockPerson:(id)a3;
+ (void)blockPerson:(id)a3 withAsset:(id)a4;
+ (void)deleteMemories:(id)a3;
+ (void)unblockPersonsInMemoriesWithBlockedPersonFeature:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)clientEntitledToMemoryMutation;
- (BOOL)isFavorite;
- (BOOL)isRejected;
- (BOOL)isUserCreated;
- (BOOL)isUserEdited;
- (BOOL)userEdited;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4;
- (NSData)movieData;
- (NSData)photosGraphData;
- (NSDate)creationDate;
- (NSDate)lastEnrichmentDate;
- (NSDate)lastMoviePlayedDate;
- (NSDate)lastViewedDate;
- (NSDictionary)movieAssetState;
- (NSManagedObjectID)sourceGeneratedMemoryID;
- (NSNumber)customMaximumNumberOfAssetsForUnitTesting;
- (NSString)description;
- (NSString)graphMemoryIdentifier;
- (NSString)managedEntityName;
- (NSString)storyTitleCategory;
- (NSString)subtitle;
- (NSString)title;
- (PHMemoryChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHMemoryChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHMemoryFeature)blacklistedFeature;
- (PHObjectPlaceholder)placeholderForCreatedMemory;
- (PHRelationshipChangeRequestHelper)curatedAssetsHelper;
- (PHRelationshipChangeRequestHelper)customUserAssetsHelper;
- (PHRelationshipChangeRequestHelper)extendedCuratedAssetsHelper;
- (PHRelationshipChangeRequestHelper)keyAssetHelper;
- (PHRelationshipChangeRequestHelper)movieCuratedAssetsHelper;
- (PHRelationshipChangeRequestHelper)representativeAssetsHelper;
- (PHRelationshipChangeRequestHelper)userCuratedAssetsHelper;
- (PHRelationshipChangeRequestHelper)userRemovedAssetsHelper;
- (PHUserFeedback)userFeedback;
- (double)score;
- (id)_mutableCuratedAssetObjectIDsAndUUIDs;
- (id)_mutableExtendedCuratedAssetObjectIDsAndUUIDs;
- (id)_mutableKeyAssetObjectIDsAndUUIDs;
- (id)_mutableRepresentativeAssetObjectIDsAndUUIDs;
- (id)_validateAssetCounts;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (int64_t)featuredState;
- (int64_t)photosGraphVersion;
- (int64_t)storyColorGradeKind;
- (int64_t)storySerializedTitleCategory;
- (unint64_t)category;
- (unint64_t)notificationState;
- (unint64_t)subcategory;
- (unsigned)creationType;
- (unsigned)pendingState;
- (void)_prepareAssetIDsIfNeeded;
- (void)_prepareCustomUserAssetIDsIfNeeded;
- (void)_prepareExistingUserRemovedAssetIDs;
- (void)_setBackingMemory:(id)a3;
- (void)addCustomUserAssets:(id)a3;
- (void)encodeToXPCDict:(id)a3;
- (void)incrementPlayCount;
- (void)incrementShareCount;
- (void)incrementViewCount;
- (void)insertCustomUserAssets:(id)a3 atIndexes:(id)a4;
- (void)moveCustomUserAssetsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeCustomUserAssets:(id)a3;
- (void)removeCustomUserAssetsAtIndexes:(id)a3;
- (void)removeUserAssets:(id)a3;
- (void)replaceCustomUserAssetsAtIndexes:(id)a3 withAssets:(id)a4;
- (void)setBlacklistedFeature:(id)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setCreationDate:(id)a3;
- (void)setCreationType:(unsigned __int16)a3;
- (void)setCustomMaximumNumberOfAssetsForUnitTesting:(id)a3;
- (void)setCustomUserAssets:(id)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setFeaturedState:(int64_t)a3;
- (void)setGraphMemoryIdentifier:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setKeyAssetUUID:(id)a3;
- (void)setLastEnrichmentDate:(id)a3;
- (void)setLastMoviePlayedDate:(id)a3;
- (void)setLastViewedDate:(id)a3;
- (void)setMovieCuratedAssets:(id)a3;
- (void)setMovieData:(id)a3;
- (void)setMovieStateData:(id)a3 forAsset:(id)a4;
- (void)setNotificationState:(unint64_t)a3;
- (void)setPendingState:(unsigned __int16)a3;
- (void)setPhotosGraphData:(id)a3;
- (void)setPhotosGraphVersion:(int64_t)a3;
- (void)setQueryHintObject:(id)a3;
- (void)setQueryHintObjects:(id)a3;
- (void)setRejected:(BOOL)a3;
- (void)setRepresentativeAssetUUIDs:(id)a3 curatedAssetUUIDs:(id)a4 extendedCuratedAssetUUIDs:(id)a5 keyAssetUUID:(id)a6;
- (void)setRepresentativeAssets:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 keyAsset:(id)a6;
- (void)setScore:(double)a3;
- (void)setSourceGeneratedMemoryID:(id)a3;
- (void)setStoryColorGradeKind:(int64_t)a3;
- (void)setStorySerializedTitleCategory:(int64_t)a3;
- (void)setStoryTitleCategory:(id)a3;
- (void)setSubcategory:(unint64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserCreated:(BOOL)a3;
- (void)setUserCuratedAssets:(id)a3;
- (void)setUserEdited:(BOOL)a3;
- (void)setUserFeedback:(id)a3;
- (void)setUserRemovedAssets:(id)a3;
- (void)undoUserRemoveForAssets:(id)a3;
@end

@implementation PHMemoryChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceGeneratedMemoryID, 0);
  objc_storeStrong((id *)&self->_userRemovedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_customUserAssetsHelper, 0);
  objc_storeStrong((id *)&self->_userCuratedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_movieCuratedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_curatedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_representativeAssetsHelper, 0);
  objc_storeStrong((id *)&self->_keyAssetHelper, 0);
  objc_storeStrong((id *)&self->_customMaximumNumberOfAssetsForUnitTesting, 0);
  objc_storeStrong((id *)&self->_userFeedback, 0);
  objc_storeStrong((id *)&self->_movieAssetState, 0);

  objc_storeStrong((id *)&self->_backingMemory, 0);
}

- (void)setSourceGeneratedMemoryID:(id)a3
{
}

- (NSManagedObjectID)sourceGeneratedMemoryID
{
  return self->_sourceGeneratedMemoryID;
}

- (PHRelationshipChangeRequestHelper)userRemovedAssetsHelper
{
  return self->_userRemovedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)customUserAssetsHelper
{
  return self->_customUserAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)userCuratedAssetsHelper
{
  return self->_userCuratedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)movieCuratedAssetsHelper
{
  return self->_movieCuratedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)extendedCuratedAssetsHelper
{
  return self->_extendedCuratedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)curatedAssetsHelper
{
  return self->_curatedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)representativeAssetsHelper
{
  return self->_representativeAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)keyAssetHelper
{
  return self->_keyAssetHelper;
}

- (void)setCustomMaximumNumberOfAssetsForUnitTesting:(id)a3
{
}

- (NSNumber)customMaximumNumberOfAssetsForUnitTesting
{
  return self->_customMaximumNumberOfAssetsForUnitTesting;
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (NSDictionary)movieAssetState
{
  return self->_movieAssetState;
}

- (BOOL)userEdited
{
  return self->_userEdited;
}

- (BOOL)clientEntitledToMemoryMutation
{
  return self->_clientEntitledToMemoryMutation;
}

- (NSString)description
{
  v19.receiver = self;
  v19.super_class = (Class)PHMemoryChangeRequest;
  v3 = [(PHMemoryChangeRequest *)&v19 description];
  v16 = [(PHMemoryChangeRequest *)self title];
  v18 = [(PHMemoryChangeRequest *)self representativeAssetsHelper];
  v17 = [v18 mutableObjectIDsAndUUIDs];
  uint64_t v15 = [v17 count];
  v4 = [(PHMemoryChangeRequest *)self curatedAssetsHelper];
  v5 = [v4 mutableObjectIDsAndUUIDs];
  uint64_t v6 = [v5 count];
  v7 = [(PHMemoryChangeRequest *)self extendedCuratedAssetsHelper];
  v8 = [v7 mutableObjectIDsAndUUIDs];
  uint64_t v9 = [v8 count];
  v10 = [(PHMemoryChangeRequest *)self keyAssetHelper];
  v11 = [v10 mutableObjectIDsAndUUIDs];
  v12 = [v11 firstObject];
  v13 = [v3 stringByAppendingFormat:@" title=%@ representativeAssets=%d curatedAssets=%d extendedCuratedAssets=%d keyAsset=%@", v16, v15, v6, v9, v12];

  return (NSString *)v13;
}

- (void)undoUserRemoveForAssets:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHMemoryChangeRequest *)self _prepareExistingUserRemovedAssetIDs];
    v4 = [(PHRelationshipChangeRequestHelper *)self->_userRemovedAssetsHelper mutableObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)removeUserAssets:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHMemoryChangeRequest *)self _prepareExistingUserRemovedAssetIDs];
    v4 = [(PHRelationshipChangeRequestHelper *)self->_userRemovedAssetsHelper mutableObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];
  }
}

- (void)setUserRemovedAssets:(id)a3
{
  id v8 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  uint64_t v4 = [v8 count];
  [(PHChangeRequestHelper *)self->super._helper didMutate];
  if (v4)
  {
    [(PHMemoryChangeRequest *)self _prepareExistingUserRemovedAssetIDs];
    userRemovedAssetsHelper = self->_userRemovedAssetsHelper;
    id v6 = (id)[v8 mutableCopy];
  }
  else
  {
    [(PHMemoryChangeRequest *)self _prepareCustomUserAssetIDsIfNeeded];
    userRemovedAssetsHelper = self->_userRemovedAssetsHelper;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v7 = v6;
  [(PHRelationshipChangeRequestHelper *)userRemovedAssetsHelper setMutableObjectIDsAndUUIDs:v6];
}

- (void)_prepareExistingUserRemovedAssetIDs
{
  v3 = self->_userRemovedAssetsHelper;
  uint64_t v4 = [(PHRelationshipChangeRequestHelper *)v3 originalObjectIDs];

  if (!v4)
  {
    if ([(PHChangeRequest *)self isNewRequest])
    {
      [(PHRelationshipChangeRequestHelper *)v3 setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
    }
    else
    {
      id v5 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
      id v6 = [v5 photoLibrary];

      v7 = [v6 managedObjectContext];
      id v8 = [MEMORY[0x1E4F1CA48] array];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__PHMemoryChangeRequest__prepareExistingUserRemovedAssetIDs__block_invoke;
      v14[3] = &unk_1E5848EC0;
      id v15 = v7;
      v16 = self;
      id v17 = v8;
      id v9 = v8;
      id v10 = v7;
      [v10 performBlockAndWait:v14];
      [(PHRelationshipChangeRequestHelper *)v3 setOriginalObjectIDs:v9];
    }
  }
  v11 = [(PHRelationshipChangeRequestHelper *)v3 mutableObjectIDsAndUUIDs];

  if (!v11)
  {
    v12 = [(PHRelationshipChangeRequestHelper *)v3 originalObjectIDs];
    v13 = (void *)[v12 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)v3 setMutableObjectIDsAndUUIDs:v13];
  }
}

void __60__PHMemoryChangeRequest__prepareExistingUserRemovedAssetIDs__block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  v3 = [*(id *)(a1[5] + 32) objectID];
  id v18 = 0;
  uint64_t v4 = [v2 existingObjectWithID:v3 error:&v18];
  id v5 = v18;

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = objc_msgSend(v4, "userRemovedAssets", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)a1[6];
          v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectID];
          [v11 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v23 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = [*(id *)(a1[5] + 32) objectID];
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Unable to load existing memory with id: %@, error: %@", buf, 0x16u);
    }
  }
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v161[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 managedObjectContext];
  uint64_t v9 = PLSafeEntityForNameInManagedObjectContext();

  if (v9)
  {
    id v10 = [v7 entity];
    int v11 = [v10 isKindOfEntity:v9];

    if (v11)
    {
      id v12 = 0;
    }
    else
    {
      long long v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v160 = *MEMORY[0x1E4F28568];
      long long v15 = [NSString stringWithFormat:@"Invalid collection type"];
      v161[0] = v15;
      long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v161 forKeys:&v160 count:1];
      objc_msgSend(v14, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v16);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (self->_userEdited && [v7 pendingState] == 2)
    {
      long long v17 = PLMemoriesGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(PHObject *)self->_backingMemory objectID];
        *(_DWORD *)buf = 138543362;
        *(void *)v159 = v18;
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEFAULT, "Promoting memory with id: %{public}@ to userEdit...", buf, 0xCu);
      }
      id v150 = 0;
      char v19 = [v7 promoteToUserEditedMemoryWithError:&v150];
      id v20 = v150;
      if ((v19 & 1) == 0)
      {
        __int16 v21 = PLMemoriesGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v159 = v20;
          _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Failed to promote with error: %@", buf, 0xCu);
        }

        int v11 = 0;
      }
    }
    id v22 = [(PHChangeRequest *)self helper];
    v23 = [v22 mutations];

    uint64_t v24 = [v23 objectForKey:@"updatedMovieAssetState"];
    uint64_t v25 = [v23 objectForKey:@"deletedMovieAssetState"];
    v26 = (void *)v25;
    if (!v11)
    {
      [(PHChangeRequest *)self isNewRequest];
      if (!a5)
      {
LABEL_75:
        BOOL v13 = 0;
        goto LABEL_76;
      }
LABEL_38:
      id v12 = v12;
      BOOL v13 = 0;
      *a5 = v12;
LABEL_76:

      goto LABEL_77;
    }
    v132 = (void *)v25;
    if (v24 | v25)
    {
      v27 = [v7 valueForKey:@"movieAssetState"];
      v28 = (void *)[v27 mutableCopy];

      if (!v28)
      {
        v28 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v148[0] = MEMORY[0x1E4F143A8];
      v148[1] = 3221225472;
      v148[2] = __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke;
      v148[3] = &unk_1E5843EF8;
      id v29 = v28;
      id v149 = v29;
      [(id)v24 enumerateKeysAndObjectsUsingBlock:v148];
      v146[0] = MEMORY[0x1E4F143A8];
      v146[1] = 3221225472;
      v146[2] = __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2;
      v146[3] = &unk_1E5843F20;
      id v147 = v29;
      id v30 = v29;
      [v132 enumerateObjectsUsingBlock:v146];
      [v7 setValue:v30 forKey:@"movieAssetState"];
      [v23 removeObjectForKey:@"updatedMovieAssetState"];
      [v23 removeObjectForKey:@"deletedMovieAssetState"];
    }
    uint64_t v131 = v24;
    BOOL v128 = [(PHChangeRequest *)self isNewRequest];
    v31 = [(PHChangeRequest *)self helper];
    id v145 = v12;
    int v32 = [v31 applyMutationsToManagedObject:v7 error:&v145];
    id v33 = v145;

    if (!v32)
    {
      id v12 = v33;
      uint64_t v24 = v131;
      goto LABEL_74;
    }
    v34 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      BOOL v35 = [(PHChangeRequest *)self isMutated];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v159 = v35;
      *(_WORD *)&v159[4] = 2112;
      *(void *)&v159[6] = v23;
      _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update", buf, 0x12u);
    }

    if (self->_incrementPlayCount) {
      objc_msgSend(v7, "setPendingPlayCount:", objc_msgSend(v7, "pendingPlayCount") + 1);
    }
    if (self->_incrementShareCount) {
      objc_msgSend(v7, "setPendingShareCount:", objc_msgSend(v7, "pendingShareCount") + 1);
    }
    if (self->_incrementViewCount) {
      objc_msgSend(v7, "setPendingViewCount:", objc_msgSend(v7, "pendingViewCount") + 1);
    }
    if (self->_didSetUserCreated)
    {
      v36 = v23;
      BOOL userCreated = self->_userCreated;
      uint64_t v38 = [v7 userActionOptions] & 0xFFFE | userCreated;
      v23 = v36;
      [v7 setUserActionOptions:v38];
    }
    if ([(PHMemoryChangeRequest *)self creationType] == 1) {
      [v7 recalculateUserActionOptionsBit];
    }
    v127 = [(PHMemoryChangeRequest *)self representativeAssetsHelper];
    v39 = [v127 mutableObjectIDsAndUUIDs];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      if (!v128)
      {
        v54 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v156 = *MEMORY[0x1E4F28568];
        v55 = [NSString stringWithFormat:@"Memories representative assets cannot be mutated"];
        v157 = v55;
        v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
        objc_msgSend(v54, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v56);
        id v45 = (id)objc_claimAutoreleasedReturnValue();

        v46 = [(PHMemoryChangeRequest *)self curatedAssetsHelper];
        goto LABEL_52;
      }
      id v41 = v7;
      [v127 setAllowsInsert:1];
      v42 = [MEMORY[0x1E4F8A950] entityName];
      [v127 setDestinationEntityName:v42];

      [v127 setIsDestinationObjectValid:&__block_literal_global_206];
      v43 = [v127 relationshipName];
      v44 = [v41 mutableSetValueForKey:v43];

      id v144 = v33;
      LODWORD(v43) = [v127 applyMutationsToManagedObject:v41 unorderedMutableChildren:v44 error:&v144];

      id v45 = v144;
      v46 = [(PHMemoryChangeRequest *)self curatedAssetsHelper];
      id v33 = v45;
      if (!v43) {
        goto LABEL_52;
      }
    }
    else
    {
      v46 = [(PHMemoryChangeRequest *)self curatedAssetsHelper];
    }
    v47 = [v46 mutableObjectIDsAndUUIDs];
    uint64_t v48 = [v47 count];

    if (!v48)
    {
      v53 = [(PHMemoryChangeRequest *)self extendedCuratedAssetsHelper];
      id v45 = v33;
      goto LABEL_47;
    }
    if (v128)
    {
      id v49 = v7;
      [v46 setAllowsInsert:1];
      v50 = [MEMORY[0x1E4F8A950] entityName];
      [v46 setDestinationEntityName:v50];

      [v46 setIsDestinationObjectValid:&__block_literal_global_212];
      v51 = [v46 relationshipName];
      v52 = [v49 mutableSetValueForKey:v51];

      id v143 = v33;
      LODWORD(v51) = [v46 applyMutationsToManagedObject:v49 unorderedMutableChildren:v52 error:&v143];

      id v45 = v143;
      v53 = [(PHMemoryChangeRequest *)self extendedCuratedAssetsHelper];
      if (!v51) {
        goto LABEL_53;
      }
LABEL_47:
      v120 = v45;
      v126 = v53;
      v57 = [v53 mutableObjectIDsAndUUIDs];
      uint64_t v58 = [v57 count];

      if (v58)
      {
        if (!v128)
        {
          v93 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v152 = *MEMORY[0x1E4F28568];
          v94 = [NSString stringWithFormat:@"Memories extended curated assets cannot be mutated"];
          v153 = v94;
          v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
          objc_msgSend(v93, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v95);
          id v45 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_54;
        }
        id v59 = v7;
        [v126 setAllowsInsert:1];
        v60 = [MEMORY[0x1E4F8A950] entityName];
        [v126 setDestinationEntityName:v60];

        [v126 setIsDestinationObjectValid:&__block_literal_global_217_13310];
        v61 = [v126 relationshipName];
        v62 = [v59 mutableSetValueForKey:v61];

        id v142 = v120;
        char v129 = [v126 applyMutationsToManagedObject:v59 unorderedMutableChildren:v62 error:&v142];

        id v12 = v142;
        v63 = [(PHMemoryChangeRequest *)self keyAssetHelper];
        if ((v129 & 1) == 0)
        {
LABEL_55:
          uint64_t v24 = v131;
          v124 = [(PHMemoryChangeRequest *)self movieCuratedAssetsHelper];
LABEL_56:
          v125 = v46;
          v122 = [(PHMemoryChangeRequest *)self userCuratedAssetsHelper];
LABEL_57:
          v130 = v63;
          v68 = [(PHMemoryChangeRequest *)self customUserAssetsHelper];
LABEL_58:
          v69 = [(PHMemoryChangeRequest *)self userRemovedAssetsHelper];
          int v70 = 0;
          goto LABEL_59;
        }
        v120 = v12;
      }
      else
      {
        v63 = [(PHMemoryChangeRequest *)self keyAssetHelper];
      }
      v89 = [v63 mutableObjectIDsAndUUIDs];
      uint64_t v90 = [v89 count];

      if (v90)
      {
        [v63 setAllowsInsert:1];
        uint64_t v91 = [MEMORY[0x1E4F8A950] entityName];
        [v63 setDestinationEntityName:v91];

        [v63 setIsDestinationObjectValid:&__block_literal_global_222];
        id v141 = v120;
        LOBYTE(v91) = [v63 applyMutationsToManagedObjectToOneRelationship:v7 error:&v141];
        id v12 = v141;

        v92 = [(PHMemoryChangeRequest *)self movieCuratedAssetsHelper];
        if ((v91 & 1) == 0)
        {
          v124 = v92;
          uint64_t v24 = v131;
          goto LABEL_56;
        }
        v120 = v12;
      }
      else
      {
        v92 = [(PHMemoryChangeRequest *)self movieCuratedAssetsHelper];
      }
      v96 = v92;
      v97 = [v92 mutableObjectIDsAndUUIDs];

      v124 = v96;
      v125 = v46;
      v130 = v63;
      if (v97)
      {
        id v98 = v7;
        [v96 setAllowsInsert:1];
        [v96 setAllowsRemove:1];
        v99 = [MEMORY[0x1E4F8A950] entityName];
        [v96 setDestinationEntityName:v99];

        [v96 setIsDestinationObjectValid:&__block_literal_global_224];
        v100 = [v96 relationshipName];
        v101 = [v98 mutableSetValueForKey:v100];

        id v140 = v120;
        char v123 = [v96 applyMutationsToManagedObject:v98 unorderedMutableChildren:v101 error:&v140];

        id v12 = v140;
        v102 = [(PHMemoryChangeRequest *)self userCuratedAssetsHelper];
        if ((v123 & 1) == 0)
        {
          v122 = v102;
          v63 = v130;
          uint64_t v24 = v131;
          goto LABEL_57;
        }
        v120 = v12;
      }
      else
      {
        v102 = [(PHMemoryChangeRequest *)self userCuratedAssetsHelper];
      }
      v103 = v102;
      v104 = [v102 mutableObjectIDsAndUUIDs];

      v122 = v103;
      if (v104)
      {
        id v105 = v7;
        [v103 setAllowsInsert:1];
        [v103 setAllowsRemove:1];
        v106 = [MEMORY[0x1E4F8A950] entityName];
        [v103 setDestinationEntityName:v106];

        [v103 setIsDestinationObjectValid:&__block_literal_global_226];
        uint64_t v107 = [v103 relationshipName];
        v108 = [v105 mutableSetValueForKey:v107];

        id v139 = v120;
        LOBYTE(v107) = [v103 applyMutationsToManagedObject:v105 unorderedMutableChildren:v108 error:&v139];

        id v12 = v139;
        v68 = [(PHMemoryChangeRequest *)self customUserAssetsHelper];
        if ((v107 & 1) == 0)
        {
          uint64_t v24 = v131;
          goto LABEL_58;
        }
        v120 = v12;
      }
      else
      {
        v68 = [(PHMemoryChangeRequest *)self customUserAssetsHelper];
      }
      v109 = [v68 mutableObjectIDsAndUUIDs];

      if (v109)
      {
        id v110 = v7;
        [v68 setAllowsInsert:1];
        [v68 setAllowsRemove:1];
        [v68 setAllowsMove:1];
        v111 = [MEMORY[0x1E4F8A950] entityName];
        [v68 setDestinationEntityName:v111];

        v112 = [v68 relationshipName];
        v113 = [v110 mutableOrderedSetValueForKey:v112];

        id v138 = v120;
        int v118 = [v68 applyMutationsToManagedObject:v110 orderedMutableChildren:v113 error:&v138];

        id v12 = v138;
        v69 = [(PHMemoryChangeRequest *)self userRemovedAssetsHelper];
        if (!v118)
        {
          int v70 = 0;
LABEL_103:
          uint64_t v24 = v131;
LABEL_59:

          if (v70)
          {
            id v71 = v7;
            v72 = v71;
            v121 = v23;
            if (self->_userFeedback)
            {
              v73 = (void *)MEMORY[0x1E4F8AC70];
              v74 = [v71 userFeedbacks];
              v75 = [v73 newestUserFeedbackInSet:v74];

              if (!v75)
              {
                v76 = (void *)MEMORY[0x1E4F8AC70];
                v77 = [v72 managedObjectContext];
                v78 = [(PHUserFeedback *)self->_userFeedback uuid];
                v75 = [v76 insertIntoManagedObjectContext:v77 withUUID:v78];

                [v75 setMemory:v72];
              }
              objc_msgSend(v75, "setType:", (__int16)-[PHUserFeedback type](self->_userFeedback, "type"));
              objc_msgSend(v75, "setFeature:", (__int16)-[PHUserFeedback feature](self->_userFeedback, "feature"));
              v79 = [(PHUserFeedback *)self->_userFeedback context];
              [v75 setContext:v79];

              v80 = [(PHUserFeedback *)self->_userFeedback lastModifiedDate];
              [v75 setLastModifiedDate:v80];

              uint64_t v24 = v131;
            }
            if (self->_didUnsetUserFeedback)
            {
              long long v135 = 0u;
              long long v136 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              v81 = [v72 userFeedbacks];
              uint64_t v82 = [v81 countByEnumeratingWithState:&v133 objects:v151 count:16];
              if (v82)
              {
                uint64_t v83 = v82;
                uint64_t v84 = *(void *)v134;
                do
                {
                  for (uint64_t i = 0; i != v83; ++i)
                  {
                    if (*(void *)v134 != v84) {
                      objc_enumerationMutation(v81);
                    }
                    uint64_t v86 = *(void *)(*((void *)&v133 + 1) + 8 * i);
                    v87 = [v72 managedObjectContext];
                    [v87 deleteObject:v86];
                  }
                  uint64_t v83 = [v81 countByEnumeratingWithState:&v133 objects:v151 count:16];
                }
                while (v83);
              }

              v23 = v121;
              uint64_t v24 = v131;
            }

            BOOL v13 = 1;
            v26 = v132;
            goto LABEL_76;
          }
LABEL_74:
          v26 = v132;
          if (!a5) {
            goto LABEL_75;
          }
          goto LABEL_38;
        }
        v120 = v12;
      }
      else
      {
        v69 = [(PHMemoryChangeRequest *)self userRemovedAssetsHelper];
      }
      v114 = [v69 mutableObjectIDsAndUUIDs];

      if (v114)
      {
        id v115 = v7;
        [v69 setAllowsInsert:1];
        [v69 setAllowsRemove:1];
        [v69 setAllowsMove:0];
        v116 = [MEMORY[0x1E4F8A950] entityName];
        [v69 setDestinationEntityName:v116];

        v117 = [v69 relationshipName];
        v119 = [v115 mutableSetValueForKey:v117];

        id v137 = v120;
        int v70 = [v69 applyMutationsToManagedObject:v115 unorderedMutableChildren:v119 error:&v137];

        id v12 = v137;
      }
      else
      {
        int v70 = 1;
        id v12 = v120;
      }
      goto LABEL_103;
    }
    v64 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v154 = *MEMORY[0x1E4F28568];
    v65 = [NSString stringWithFormat:@"Memories curated assets cannot be mutated"];
    v155 = v65;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
    v67 = v66 = v46;
    objc_msgSend(v64, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v67);
    id v45 = (id)objc_claimAutoreleasedReturnValue();

    v46 = v66;
LABEL_52:
    v53 = [(PHMemoryChangeRequest *)self extendedCuratedAssetsHelper];
LABEL_53:
    v126 = v53;
LABEL_54:
    v63 = [(PHMemoryChangeRequest *)self keyAssetHelper];
    id v12 = v45;
    goto LABEL_55;
  }
  BOOL v13 = 0;
LABEL_77:

  return v13;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForKey:a2];
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2_210(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_203(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  v23[21] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(PHMemoryChangeRequest *)self clientEntitledToMemoryMutation])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericEntitlementError");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (([v9 isEqualToString:@"updatedMovieAssetState"] & 1) == 0
    && ([v9 isEqualToString:@"deletedMovieAssetState"] & 1) == 0)
  {
    BOOL v13 = [(PHChangeRequest *)self helper];
    id v20 = 0;
    int v14 = [v13 allowMutationToManagedObject:v8 propertyKey:v9 error:&v20];
    id v10 = v20;

    if (v14) {
      goto LABEL_5;
    }
LABEL_9:
    BOOL v12 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  id v10 = 0;
LABEL_5:
  v23[0] = @"rejected";
  v23[1] = @"favorite";
  v23[2] = @"pendingState";
  v23[3] = @"movieData";
  v23[4] = @"score";
  v23[5] = @"photosGraphData";
  v23[6] = @"photosGraphVersion";
  v23[7] = @"lastViewedDate";
  v23[8] = @"lastMoviePlayedDate";
  v23[9] = @"lastEnrichmentDate";
  v23[10] = @"assetListPredicate";
  v23[11] = @"title";
  v23[12] = @"subtitle";
  v23[13] = @"graphMemoryIdentifier";
  v23[14] = @"storyColorGradeKind";
  v23[15] = @"storySerializedTitleCategory";
  v23[16] = @"notificationState";
  v23[17] = @"blacklistedFeature";
  v23[18] = @"featuredState";
  v23[19] = @"updatedMovieAssetState";
  v23[20] = @"deletedMovieAssetState";
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:21];
  if (-[PHChangeRequest isNewRequest](self, "isNewRequest") || ([v11 containsObject:v9] & 1) != 0)
  {
    BOOL v12 = 1;
  }
  else
  {
    long long v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    long long v16 = [NSString stringWithFormat:@"Invalid operation on property %@", v9];
    id v22 = v16;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v18 = objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v17);

    BOOL v12 = 0;
    id v10 = (id)v18;
  }

  if (a5)
  {
LABEL_15:
    if (!v12) {
      *a5 = v10;
    }
  }
LABEL_17:

  return v12;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHMemoryChangeRequest *)self creationDate];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v8 = (void *)MEMORY[0x1E4F8A9A0];
  id v9 = [v6 managedObjectContext];
  id v10 = [(PHChangeRequest *)self uuid];
  int v11 = [(PHMemoryChangeRequest *)self title];
  BOOL v12 = [(PHMemoryChangeRequest *)self subtitle];
  BOOL v13 = [v8 insertIntoContext:v9 withUUID:v10 title:v11 subtitle:v12 creationDate:v7];

  if (a4 && !v13)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PHChangeRequest *)self helper];
  id v17 = 0;
  int v8 = [v7 validateMutationsToManagedObject:v6 error:&v17];
  id v9 = v17;

  if (v8)
  {
    uint64_t v10 = [(PHMemoryChangeRequest *)self _validateAssetCounts];
    if (v10)
    {
      uint64_t v11 = v10;
    }
    else
    {
      if ([v6 pendingState] != 3 || self->_userEdited)
      {
        BOOL v12 = 1;
        goto LABEL_11;
      }
      int v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28228];
      uint64_t v15 = [NSString stringWithFormat:@"Change request for user edited memory requires 'userEdited' to be true."];
      v19[0] = v15;
      long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v11 = objc_msgSend(v14, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v16);

      id v9 = (id)v15;
    }

    id v9 = (id)v11;
  }
  if (a4)
  {
    id v9 = v9;
    BOOL v12 = 0;
    *a4 = v9;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_11:

  return v12;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  if (![(PHMemoryChangeRequest *)self clientEntitledToMemoryMutation])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericEntitlementError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v6 = [(PHMemoryChangeRequest *)self title];
  id v14 = 0;
  id v7 = [(id)objc_opt_class() validateMemoryTitle:v6 error:&v14];
  id v8 = v14;

  if (!v7) {
    goto LABEL_8;
  }
  id v9 = [(PHMemoryChangeRequest *)self _validateAssetCounts];
  uint64_t v10 = v9;
  BOOL v11 = v9 == 0;
  if (v9)
  {
    id v12 = v9;

    id v8 = v12;
  }

  if (a4)
  {
LABEL_9:
    if (!v11) {
      *a4 = v8;
    }
  }
LABEL_11:

  return v11;
}

- (id)_validateAssetCounts
{
  v32[1] = *MEMORY[0x1E4F143B8];
  customMaximumNumberOfAssetsForUnitTesting = self->_customMaximumNumberOfAssetsForUnitTesting;
  if (customMaximumNumberOfAssetsForUnitTesting)
  {
    unint64_t v4 = [(NSNumber *)customMaximumNumberOfAssetsForUnitTesting integerValue];
    unint64_t v5 = [(NSNumber *)self->_customMaximumNumberOfAssetsForUnitTesting integerValue];
  }
  else
  {
    unint64_t v5 = 5000;
    unint64_t v4 = 512;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = [(PHMemoryChangeRequest *)self representativeAssetsHelper];
  id v8 = [v7 mutableObjectIDsAndUUIDs];
  [v6 addObjectsFromArray:v8];

  id v9 = [(PHMemoryChangeRequest *)self curatedAssetsHelper];
  uint64_t v10 = [v9 mutableObjectIDsAndUUIDs];
  [v6 addObjectsFromArray:v10];

  BOOL v11 = [(PHMemoryChangeRequest *)self extendedCuratedAssetsHelper];
  id v12 = [v11 mutableObjectIDsAndUUIDs];
  [v6 addObjectsFromArray:v12];

  BOOL v13 = [(PHMemoryChangeRequest *)self userCuratedAssetsHelper];
  id v14 = [v13 mutableObjectIDsAndUUIDs];
  [v6 addObjectsFromArray:v14];

  uint64_t v15 = [(PHMemoryChangeRequest *)self movieCuratedAssetsHelper];
  long long v16 = [v15 mutableObjectIDsAndUUIDs];
  [v6 addObjectsFromArray:v16];

  if ([v6 count] > v4)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28228];
    uint64_t v18 = [NSString stringWithFormat:@"Invalid number of total assets, count of unique assets: %lu maximum limit: %lu", objc_msgSend(v6, "count"), v4];
    v32[0] = v18;
    char v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v20 = objc_msgSend(v17, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v19);
LABEL_8:

    goto LABEL_10;
  }
  uint64_t v21 = [(PHMemoryChangeRequest *)self customUserAssetsHelper];
  id v22 = [v21 mutableObjectIDsAndUUIDs];
  unint64_t v23 = [v22 count];

  if (v23 > v5)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28228];
    uint64_t v25 = NSString;
    uint64_t v18 = [(PHMemoryChangeRequest *)self customUserAssetsHelper];
    char v19 = [v18 mutableObjectIDsAndUUIDs];
    v26 = [v25 stringWithFormat:@"Invalid number of custom user assets, count of assets: %lu maximum limit: %lu", objc_msgSend(v19, "count"), v5];
    id v30 = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v20 = objc_msgSend(v24, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v27);

    goto LABEL_8;
  }
  id v20 = 0;
LABEL_10:

  return v20;
}

- (void)incrementViewCount
{
  self->_incrementViewCount = 1;
}

- (void)incrementShareCount
{
  self->_incrementShareCount = 1;
}

- (void)incrementPlayCount
{
  self->_incrementPlayCount = 1;
}

- (void)setUserFeedback:(id)a3
{
  unint64_t v4 = (PHUserFeedback *)a3;
  unint64_t v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  userFeedback = self->_userFeedback;
  self->_userFeedback = v4;

  if (!v4) {
    self->_didUnsetUserFeedback = 1;
  }
}

- (void)setBlacklistedFeature:(id)a3
{
  id v11 = a3;
  [(PHChangeRequest *)self didMutate];
  if (v11)
  {
    unint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
    unint64_t v5 = [(PHChangeRequest *)self helper];
    id v6 = [v5 mutations];
    [v6 setObject:v4 forKeyedSubscript:@"blacklistedFeature"];

    id v7 = [(PHChangeRequest *)self helper];
    id v8 = [v7 nilMutations];
    [v8 removeObject:@"blacklistedFeature"];
  }
  else
  {
    id v9 = [(PHChangeRequest *)self helper];
    uint64_t v10 = [v9 mutations];
    [v10 removeObjectForKey:@"blacklistedFeature"];

    unint64_t v4 = [(PHChangeRequest *)self helper];
    id v7 = [v4 nilMutations];
    [v7 addObject:@"blacklistedFeature"];
  }
}

- (PHMemoryFeature)blacklistedFeature
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  unint64_t v4 = [v3 mutations];
  unint64_t v5 = [v4 objectForKey:@"blacklistedFeature"];

  if (v5)
  {
    id v9 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v9];
    id v7 = v9;
    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v7;
    _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed unarchiving blacklisted feature, error %@", buf, 0xCu);
  }
  id v6 = 0;
LABEL_8:

  return (PHMemoryFeature *)v6;
}

- (void)setQueryHintObjects:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = +[PHMemory assetListPredicateFromQueryHintObjects:v4];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v6 = [(PHChangeRequest *)self helper];
    id v7 = [v6 mutations];
    [v7 setObject:v5 forKey:@"assetListPredicate"];
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Unsupported queryHintObject %@ as assetListPredicate", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)setQueryHintObject:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[PHMemoryChangeRequest setQueryHintObjects:](self, "setQueryHintObjects:", v6, v7, v8);
}

- (void)moveCustomUserAssetsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  id v10 = a3;
  if ([v10 count])
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHMemoryChangeRequest *)self _prepareCustomUserAssetIDsIfNeeded];
    id v6 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper mutableObjectIDsAndUUIDs];
    id v7 = [v6 objectsAtIndexes:v10];
    [v6 removeObjectsAtIndexes:v10];
    uint64_t v8 = [v10 count];
    id v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a4, v8);
    [v6 insertObjects:v7 atIndexes:v9];
  }
}

- (void)replaceCustomUserAssetsAtIndexes:(id)a3 withAssets:(id)a4
{
  id v8 = a3;
  id v6 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a4];
  if (v6)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHMemoryChangeRequest *)self _prepareCustomUserAssetIDsIfNeeded];
    id v7 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper mutableObjectIDsAndUUIDs];
    [v7 replaceObjectsAtIndexes:v8 withObjects:v6];
  }
}

- (void)removeCustomUserAssetsAtIndexes:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHMemoryChangeRequest *)self _prepareCustomUserAssetIDsIfNeeded];
    id v4 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper mutableObjectIDsAndUUIDs];
    [v4 removeObjectsAtIndexes:v5];
  }
}

- (void)removeCustomUserAssets:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHMemoryChangeRequest *)self _prepareCustomUserAssetIDsIfNeeded];
    id v4 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper mutableObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)insertCustomUserAssets:(id)a3 atIndexes:(id)a4
{
  id v8 = a4;
  id v6 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v6)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHMemoryChangeRequest *)self _prepareCustomUserAssetIDsIfNeeded];
    id v7 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper mutableObjectIDsAndUUIDs];
    [v7 insertObjects:v6 atIndexes:v8];
  }
}

- (void)addCustomUserAssets:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHMemoryChangeRequest *)self _prepareCustomUserAssetIDsIfNeeded];
    id v4 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper mutableObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];
  }
}

- (void)setCustomUserAssets:(id)a3
{
  id v8 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  uint64_t v4 = [v8 count];
  [(PHChangeRequestHelper *)self->super._helper didMutate];
  [(PHMemoryChangeRequest *)self _prepareCustomUserAssetIDsIfNeeded];
  customUserAssetsHelper = self->_customUserAssetsHelper;
  if (v4) {
    id v6 = (id)[v8 mutableCopy];
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v7 = v6;
  [(PHRelationshipChangeRequestHelper *)customUserAssetsHelper setMutableObjectIDsAndUUIDs:v6];
}

- (void)_prepareCustomUserAssetIDsIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper originalObjectIDs];
  if (!v3)
  {
    backingMemory = self->_backingMemory;
    if (!backingMemory) {
      goto LABEL_7;
    }
    id v5 = [(PHObject *)self->_backingMemory photoLibrary];
    id v6 = [v5 librarySpecificFetchOptions];
    v3 = +[PHQuery queryForCustomUserAssetsInMemory:backingMemory options:v6];

    id v7 = [v3 executeQuery];
    customUserAssetsHelper = self->_customUserAssetsHelper;
    id v9 = [v7 fetchedObjectIDs];
    [(PHRelationshipChangeRequestHelper *)customUserAssetsHelper setOriginalObjectIDs:v9];

    id v10 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper originalObjectIDs];

    if (!v10)
    {
      id v11 = self->_customUserAssetsHelper;
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(PHRelationshipChangeRequestHelper *)v11 setOriginalObjectIDs:v12];
    }
  }

LABEL_7:
  BOOL v13 = [(PHRelationshipChangeRequestHelper *)self->_customUserAssetsHelper mutableObjectIDsAndUUIDs];

  if (!v13)
  {
    id v14 = self->_customUserAssetsHelper;
    id v16 = [(PHRelationshipChangeRequestHelper *)v14 originalObjectIDs];
    uint64_t v15 = (void *)[v16 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)v14 setMutableObjectIDsAndUUIDs:v15];
  }
}

- (void)_setBackingMemory:(id)a3
{
}

- (void)setMovieStateData:(id)a3 forAsset:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [(PHChangeRequest *)self didMutate];
  id v7 = [(PHChangeRequest *)self helper];
  id v8 = [v7 mutations];

  if (v11)
  {
    id v9 = [v8 objectForKey:@"updatedMovieAssetState"];
    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      [v8 setObject:v9 forKey:@"updatedMovieAssetState"];
    }
    id v10 = [v6 uuid];
    [v9 setObject:v11 forKey:v10];
  }
  else
  {
    id v9 = [v8 objectForKey:@"deletedMovieAssetState"];
    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F1CA48] array];
      [v8 setObject:v9 forKey:@"deletedMovieAssetState"];
    }
    id v10 = [v6 uuid];
    [v9 addObject:v10];
  }
}

- (void)setUserCuratedAssets:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHRelationshipChangeRequestHelper *)self->_userCuratedAssetsHelper originalObjectIDs];
  if (!v5)
  {
    if (!self->_backingMemory) {
      goto LABEL_5;
    }
    id v6 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
    id v5 = [v6 librarySpecificFetchOptions];

    [v5 setIncludeGuestAssets:1];
    id v7 = +[PHQuery queryForUserCuratedAssetsInMemory:self->_backingMemory options:v5];
    id v8 = [v7 executeQuery];
    userCuratedAssetsHelper = self->_userCuratedAssetsHelper;
    id v10 = [v8 fetchedObjectIDs];
    [(PHRelationshipChangeRequestHelper *)userCuratedAssetsHelper setOriginalObjectIDs:v10];
  }
LABEL_5:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (!v14)
        {
          id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", (void)v21);
        }
        uint64_t v18 = PLObjectIDOrUUIDFromPHObject(v17);
        [v14 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }

  [(PHChangeRequest *)self didMutate];
  char v19 = self->_userCuratedAssetsHelper;
  if (v14)
  {
    [(PHRelationshipChangeRequestHelper *)v19 setMutableObjectIDsAndUUIDs:v14];
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1CA48] array];
    [(PHRelationshipChangeRequestHelper *)v19 setMutableObjectIDsAndUUIDs:v20];
  }
}

- (void)setMovieCuratedAssets:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHRelationshipChangeRequestHelper *)self->_movieCuratedAssetsHelper originalObjectIDs];
  if (!v5)
  {
    backingMemory = self->_backingMemory;
    if (!backingMemory) {
      goto LABEL_5;
    }
    id v5 = +[PHQuery queryForMovieCuratedAssetsInMemory:backingMemory options:0];
    id v7 = [v5 executeQuery];
    movieCuratedAssetsHelper = self->_movieCuratedAssetsHelper;
    id v9 = [v7 fetchedObjectIDs];
    [(PHRelationshipChangeRequestHelper *)movieCuratedAssetsHelper setOriginalObjectIDs:v9];
  }
LABEL_5:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (!v13)
        {
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", (void)v20);
        }
        id v17 = PLObjectIDOrUUIDFromPHObject(v16);
        [v13 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  [(PHChangeRequest *)self didMutate];
  uint64_t v18 = self->_movieCuratedAssetsHelper;
  if (v13)
  {
    [(PHRelationshipChangeRequestHelper *)v18 setMutableObjectIDsAndUUIDs:v13];
  }
  else
  {
    char v19 = [MEMORY[0x1E4F1CA48] array];
    [(PHRelationshipChangeRequestHelper *)v18 setMutableObjectIDsAndUUIDs:v19];
  }
}

- (void)setKeyAssetUUID:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    [(PHChangeRequest *)self didMutate];
    id v5 = [(PHMemoryChangeRequest *)self _mutableKeyAssetObjectIDsAndUUIDs];
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

    [v5 addObjectsFromArray:v6];
  }
}

- (void)setRepresentativeAssetUUIDs:(id)a3 curatedAssetUUIDs:(id)a4 extendedCuratedAssetUUIDs:(id)a5 keyAssetUUID:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v16 count])
  {
    [(PHChangeRequest *)self didMutate];
    uint64_t v13 = [(PHMemoryChangeRequest *)self _mutableRepresentativeAssetObjectIDsAndUUIDs];
    [v13 addObjectsFromArray:v16];
  }
  if ([v10 count])
  {
    [(PHChangeRequest *)self didMutate];
    uint64_t v14 = [(PHMemoryChangeRequest *)self _mutableCuratedAssetObjectIDsAndUUIDs];
    [v14 addObjectsFromArray:v10];
  }
  if ([v11 count])
  {
    [(PHChangeRequest *)self didMutate];
    uint64_t v15 = [(PHMemoryChangeRequest *)self _mutableExtendedCuratedAssetObjectIDsAndUUIDs];
    [v15 addObjectsFromArray:v11];
  }
  [(PHMemoryChangeRequest *)self setKeyAssetUUID:v12];
}

- (void)setKeyAsset:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = PLObjectIDOrUUIDFromPHObject(v7);
    [v4 addObject:v5];

    if (v4)
    {
      id v6 = [(PHMemoryChangeRequest *)self _mutableKeyAssetObjectIDsAndUUIDs];
      [v6 addObjectsFromArray:v4];
    }
  }
}

- (void)setRepresentativeAssets:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 keyAsset:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  id v12 = a6;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (!v15)
        {
          [(PHChangeRequest *)self didMutate];
          uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
        }
        char v19 = PLObjectIDOrUUIDFromPHObject(v18);
        [v15 addObject:v19];
      }
      uint64_t v14 = [v10 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v14);
    if (v15)
    {
      long long v20 = [(PHMemoryChangeRequest *)self _mutableRepresentativeAssetObjectIDsAndUUIDs];
      [v20 addObjectsFromArray:v15];
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v21 = v11;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
  long long v23 = v21;
  if (!v22) {
    goto LABEL_23;
  }
  uint64_t v24 = v22;
  long long v23 = 0;
  uint64_t v25 = *(void *)v46;
  do
  {
    for (uint64_t j = 0; j != v24; ++j)
    {
      if (*(void *)v46 != v25) {
        objc_enumerationMutation(v21);
      }
      v27 = *(void **)(*((void *)&v45 + 1) + 8 * j);
      if (!v23)
      {
        [(PHChangeRequest *)self didMutate];
        long long v23 = [MEMORY[0x1E4F1CA48] array];
      }
      v28 = PLObjectIDOrUUIDFromPHObject(v27);
      [v23 addObject:v28];
    }
    uint64_t v24 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
  }
  while (v24);

  if (v23)
  {
    uint64_t v29 = [(PHMemoryChangeRequest *)self _mutableCuratedAssetObjectIDsAndUUIDs];
    [v29 addObjectsFromArray:v23];

LABEL_23:
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v30 = v39;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v53 count:16];
  int v32 = v30;
  if (!v31)
  {
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v33 = v31;
  id v40 = v12;
  int v32 = 0;
  uint64_t v34 = *(void *)v42;
  do
  {
    for (uint64_t k = 0; k != v33; ++k)
    {
      if (*(void *)v42 != v34) {
        objc_enumerationMutation(v30);
      }
      v36 = *(void **)(*((void *)&v41 + 1) + 8 * k);
      if (!v32)
      {
        [(PHChangeRequest *)self didMutate];
        int v32 = [MEMORY[0x1E4F1CA48] array];
      }
      v37 = PLObjectIDOrUUIDFromPHObject(v36);
      [v32 addObject:v37];
    }
    uint64_t v33 = [v30 countByEnumeratingWithState:&v41 objects:v53 count:16];
  }
  while (v33);

  id v12 = v40;
  if (v32)
  {
    uint64_t v38 = [(PHMemoryChangeRequest *)self _mutableExtendedCuratedAssetObjectIDsAndUUIDs];
    [v38 addObjectsFromArray:v32];

    goto LABEL_35;
  }
LABEL_36:
  [(PHMemoryChangeRequest *)self setKeyAsset:v12];
}

- (id)_mutableKeyAssetObjectIDsAndUUIDs
{
  [(PHMemoryChangeRequest *)self _prepareAssetIDsIfNeeded];
  keyAssetHelper = self->_keyAssetHelper;

  return [(PHRelationshipChangeRequestHelper *)keyAssetHelper mutableObjectIDsAndUUIDs];
}

- (id)_mutableExtendedCuratedAssetObjectIDsAndUUIDs
{
  [(PHMemoryChangeRequest *)self _prepareAssetIDsIfNeeded];
  extendedCuratedAssetsHelper = self->_extendedCuratedAssetsHelper;

  return [(PHRelationshipChangeRequestHelper *)extendedCuratedAssetsHelper mutableObjectIDsAndUUIDs];
}

- (id)_mutableCuratedAssetObjectIDsAndUUIDs
{
  [(PHMemoryChangeRequest *)self _prepareAssetIDsIfNeeded];
  curatedAssetsHelper = self->_curatedAssetsHelper;

  return [(PHRelationshipChangeRequestHelper *)curatedAssetsHelper mutableObjectIDsAndUUIDs];
}

- (id)_mutableRepresentativeAssetObjectIDsAndUUIDs
{
  [(PHMemoryChangeRequest *)self _prepareAssetIDsIfNeeded];
  representativeAssetsHelper = self->_representativeAssetsHelper;

  return [(PHRelationshipChangeRequestHelper *)representativeAssetsHelper mutableObjectIDsAndUUIDs];
}

- (void)_prepareAssetIDsIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHRelationshipChangeRequestHelper *)self->_representativeAssetsHelper originalObjectIDs];

  if (!v3) {
    [(PHRelationshipChangeRequestHelper *)self->_representativeAssetsHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_representativeAssetsHelper mutableObjectIDsAndUUIDs];

  if (!v4)
  {
    representativeAssetsHelper = self->_representativeAssetsHelper;
    id v6 = [(PHRelationshipChangeRequestHelper *)representativeAssetsHelper originalObjectIDs];
    id v7 = (void *)[v6 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)representativeAssetsHelper setMutableObjectIDsAndUUIDs:v7];
  }
  id v8 = [(PHRelationshipChangeRequestHelper *)self->_curatedAssetsHelper originalObjectIDs];

  if (!v8) {
    [(PHRelationshipChangeRequestHelper *)self->_curatedAssetsHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  id v9 = [(PHRelationshipChangeRequestHelper *)self->_curatedAssetsHelper mutableObjectIDsAndUUIDs];

  if (!v9)
  {
    curatedAssetsHelper = self->_curatedAssetsHelper;
    id v11 = [(PHRelationshipChangeRequestHelper *)curatedAssetsHelper originalObjectIDs];
    id v12 = (void *)[v11 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)curatedAssetsHelper setMutableObjectIDsAndUUIDs:v12];
  }
  uint64_t v13 = [(PHRelationshipChangeRequestHelper *)self->_extendedCuratedAssetsHelper originalObjectIDs];

  if (!v13) {
    [(PHRelationshipChangeRequestHelper *)self->_extendedCuratedAssetsHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  uint64_t v14 = [(PHRelationshipChangeRequestHelper *)self->_extendedCuratedAssetsHelper mutableObjectIDsAndUUIDs];

  if (!v14)
  {
    extendedCuratedAssetsHelper = self->_extendedCuratedAssetsHelper;
    uint64_t v16 = [(PHRelationshipChangeRequestHelper *)extendedCuratedAssetsHelper originalObjectIDs];
    id v17 = (void *)[v16 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)extendedCuratedAssetsHelper setMutableObjectIDsAndUUIDs:v17];
  }
  uint64_t v18 = [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper originalObjectIDs];

  if (!v18) {
    [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  char v19 = [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper mutableObjectIDsAndUUIDs];

  if (!v19)
  {
    keyAssetHelper = self->_keyAssetHelper;
    id v22 = [(PHRelationshipChangeRequestHelper *)keyAssetHelper originalObjectIDs];
    id v21 = (void *)[v22 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)keyAssetHelper setMutableObjectIDsAndUUIDs:v21];
  }
}

- (void)setStoryTitleCategory:(id)a3
{
  uint64_t SerializedTitleCategory = PFStoryTitleCategoryGetSerializedTitleCategory();

  [(PHMemoryChangeRequest *)self setStorySerializedTitleCategory:SerializedTitleCategory];
}

- (NSString)storyTitleCategory
{
  [(PHMemoryChangeRequest *)self storySerializedTitleCategory];

  return (NSString *)PFStoryValidatedTitleCategory();
}

- (void)setUserEdited:(BOOL)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  self->_userEdited = a3;
  self->_didSetUserEdited = 1;
}

- (BOOL)isUserEdited
{
  return self->_userCreated;
}

- (void)setUserCreated:(BOOL)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  self->_BOOL userCreated = a3;
  self->_didSetUserCreated = 1;
}

- (BOOL)isUserCreated
{
  return self->_userCreated;
}

- (void)setFeaturedState:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  id v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"featuredState"];
}

- (int64_t)featuredState
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"featuredState"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setNotificationState:(unint64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"notificationState"];
}

- (unint64_t)notificationState
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"notificationState"];

  unint64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setLastEnrichmentDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  unint64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"lastEnrichmentDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"lastEnrichmentDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"lastEnrichmentDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"lastEnrichmentDate"];
  }
}

- (NSDate)lastEnrichmentDate
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"lastEnrichmentDate"];

  return (NSDate *)v5;
}

- (void)setLastMoviePlayedDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  unint64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"lastMoviePlayedDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"lastMoviePlayedDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"lastMoviePlayedDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"lastMoviePlayedDate"];
  }
}

- (NSDate)lastMoviePlayedDate
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"lastMoviePlayedDate"];

  return (NSDate *)v5;
}

- (void)setLastViewedDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  unint64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"lastViewedDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"lastViewedDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"lastViewedDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"lastViewedDate"];
  }
}

- (NSDate)lastViewedDate
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"lastViewedDate"];

  return (NSDate *)v5;
}

- (void)setPhotosGraphVersion:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithLongLong:a3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"photosGraphVersion"];
}

- (int64_t)photosGraphVersion
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"photosGraphVersion"];

  int64_t v6 = [v5 longLongValue];
  return v6;
}

- (void)setPhotosGraphData:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"photosGraphData"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"photosGraphData"];
  }
  else
  {
    [v6 removeObjectForKey:@"photosGraphData"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"photosGraphData"];
  }
}

- (NSData)photosGraphData
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"photosGraphData"];

  return (NSData *)v5;
}

- (void)setMovieData:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"movieData"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"movieData"];
  }
  else
  {
    [v6 removeObjectForKey:@"movieData"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"movieData"];
  }
}

- (NSData)movieData
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"movieData"];

  return (NSData *)v5;
}

- (void)setStorySerializedTitleCategory:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"storySerializedTitleCategory"];
}

- (int64_t)storySerializedTitleCategory
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"storySerializedTitleCategory"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setStoryColorGradeKind:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"storyColorGradeKind"];
}

- (int64_t)storyColorGradeKind
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"storyColorGradeKind"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setGraphMemoryIdentifier:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"graphMemoryIdentifier"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"graphMemoryIdentifier"];
  }
  else
  {
    [v6 removeObjectForKey:@"graphMemoryIdentifier"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"graphMemoryIdentifier"];
  }
}

- (NSString)graphMemoryIdentifier
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"graphMemoryIdentifier"];

  return (NSString *)v5;
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"subtitle"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"subtitle"];
  }
  else
  {
    [v6 removeObjectForKey:@"subtitle"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"subtitle"];
  }
}

- (NSString)subtitle
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"subtitle"];

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"title"];
  }
  else
  {
    [v6 removeObjectForKey:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"title"];
  }
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (void)setCreationDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"creationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"creationDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"creationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"creationDate"];
  }
}

- (NSDate)creationDate
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"creationDate"];

  return (NSDate *)v5;
}

- (void)setScore:(double)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"score"];
}

- (double)score
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"score"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setSubcategory:(unint64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"subcategory"];
}

- (unint64_t)subcategory
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"subcategory"];

  unint64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setCategory:(unint64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"category"];
}

- (unint64_t)category
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"category"];

  unint64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setCreationType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"creationType"];
}

- (unsigned)creationType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"creationType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setPendingState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"pendingState"];
}

- (unsigned)pendingState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"pendingState"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setFavorite:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"favorite"];
}

- (BOOL)isFavorite
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"favorite"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setRejected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"rejected"];
}

- (BOOL)isRejected
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"rejected"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (NSString)managedEntityName
{
  return (NSString *)@"Memory";
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  unint64_t v6 = [(PHMemoryChangeRequest *)self representativeAssetsHelper];
  [v6 encodeToXPCDict:v4];

  double v7 = [(PHMemoryChangeRequest *)self curatedAssetsHelper];
  [v7 encodeToXPCDict:v4];

  id v8 = [(PHMemoryChangeRequest *)self extendedCuratedAssetsHelper];
  [v8 encodeToXPCDict:v4];

  id v9 = [(PHMemoryChangeRequest *)self keyAssetHelper];
  [v9 encodeToXPCDict:v4];

  id v10 = [(PHMemoryChangeRequest *)self movieCuratedAssetsHelper];
  [v10 encodeToXPCDict:v4];

  id v11 = [(PHMemoryChangeRequest *)self userCuratedAssetsHelper];
  [v11 encodeToXPCDict:v4];

  id v12 = [(PHMemoryChangeRequest *)self customUserAssetsHelper];
  [v12 encodeToXPCDict:v4];

  uint64_t v13 = [(PHMemoryChangeRequest *)self userRemovedAssetsHelper];
  [v13 encodeToXPCDict:v4];

  if (self->_incrementPlayCount) {
    xpc_dictionary_set_BOOL(v4, "incrementPlayCount", 1);
  }
  if (self->_incrementShareCount) {
    xpc_dictionary_set_BOOL(v4, "incrementShareCount", 1);
  }
  if (self->_incrementViewCount) {
    xpc_dictionary_set_BOOL(v4, "incrementViewCount", 1);
  }
  userFeedbacuint64_t k = self->_userFeedback;
  if (userFeedback)
  {
    id v18 = 0;
    uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:userFeedback requiringSecureCoding:1 error:&v18];
    id v16 = v18;
    if (v15)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      id v17 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v16;
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEFAULT, "Failed to encode userFeedback object: %@", buf, 0xCu);
      }
    }
  }
  xpc_dictionary_set_BOOL(v4, "userFeedbackDataUnsetKey", self->_didUnsetUserFeedback);
  xpc_dictionary_set_BOOL(v4, "userCreatedKey", self->_userCreated);
  xpc_dictionary_set_BOOL(v4, "userCreatedDidSetKey", self->_userCreated);
  xpc_dictionary_set_BOOL(v4, "userEditedKey", self->_userEdited);
  xpc_dictionary_set_BOOL(v4, "userEditedDidSetKey", self->_userEdited);
  xpc_dictionary_set_int64(v4, "customMaximumNumberOfAssetsForUnitTesting", [(NSNumber *)self->_customMaximumNumberOfAssetsForUnitTesting integerValue]);
}

- (PHMemoryChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v50.receiver = self;
  v50.super_class = (Class)PHMemoryChangeRequest;
  id v11 = [(PHChangeRequest *)&v50 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      uint64_t v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"representativeAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      representativeAssetsHelper = v11->_representativeAssetsHelper;
      v11->_representativeAssetsHelper = v14;

      id v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"curatedAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      curatedAssetsHelper = v11->_curatedAssetsHelper;
      v11->_curatedAssetsHelper = v16;

      id v18 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"extendedCuratedAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      extendedCuratedAssetsHelper = v11->_extendedCuratedAssetsHelper;
      v11->_extendedCuratedAssetsHelper = v18;

      id v20 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAsset" xpcDict:v8 changeRequestHelper:v11->super._helper];
      keyAssetHelper = v11->_keyAssetHelper;
      v11->_keyAssetHelper = v20;

      id v22 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"movieCuratedAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      movieCuratedAssetsHelper = v11->_movieCuratedAssetsHelper;
      v11->_movieCuratedAssetsHelper = v22;

      uint64_t v24 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"userCuratedAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      userCuratedAssetsHelper = v11->_userCuratedAssetsHelper;
      v11->_userCuratedAssetsHelper = v24;

      uint64_t v26 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customUserAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      customUserAssetsHelper = v11->_customUserAssetsHelper;
      v11->_customUserAssetsHelper = v26;

      v11->_clientEntitledToMemoryMutation = [v10 photoKitEntitledFor:*MEMORY[0x1E4F8C5C0]];
      v28 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"userRemovedAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      userRemovedAssetsHelper = v11->_userRemovedAssetsHelper;
      v11->_userRemovedAssetsHelper = v28;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PHMemoryChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
      aBlock[3] = &unk_1E5848DF0;
      id v30 = v11;
      long long v48 = v30;
      id v49 = v9;
      uint64_t v31 = (void (**)(void))_Block_copy(aBlock);
      v30->_incrementPlayCount = xpc_dictionary_get_BOOL(v8, "incrementPlayCount");
      v30->_incrementShareCount = xpc_dictionary_get_BOOL(v8, "incrementShareCount");
      BOOL v32 = xpc_dictionary_get_BOOL(v8, "incrementViewCount");
      v30->_incrementViewCount = v32;
      if (v30->_incrementPlayCount || (v30->_incrementShareCount ? (int v33 = 1) : (int v33 = v32), v33 == 1)) {
        v31[2](v31);
      }
      uint64_t v34 = PLDataFromXPCDictionary();
      if (v34)
      {
        id v46 = 0;
        uint64_t v35 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v34 error:&v46];
        id v36 = v46;
        userFeedbacuint64_t k = v30->_userFeedback;
        v30->_userFeedbacuint64_t k = (PHUserFeedback *)v35;

        if (v30->_userFeedback)
        {
          v31[2](v31);
        }
        else
        {
          uint64_t v38 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v52 = v36;
            _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_DEFAULT, "Failed to decode userFeedback object: %@", buf, 0xCu);
          }
        }
      }
      BOOL v39 = xpc_dictionary_get_BOOL(v8, "userFeedbackDataUnsetKey");
      v30->_didUnsetUserFeedbacuint64_t k = v39;
      if (v39) {
        v31[2](v31);
      }
      BOOL v40 = xpc_dictionary_get_BOOL(v8, "userCreatedDidSetKey");
      v30->_didSetUserCreated = v40;
      if (v40)
      {
        v30->_BOOL userCreated = xpc_dictionary_get_BOOL(v8, "userCreatedKey");
        v31[2](v31);
      }
      BOOL v41 = xpc_dictionary_get_BOOL(v8, "userEditedDidSetKey");
      v30->_didSetUserEdited = v41;
      if (v41)
      {
        v30->_userEdited = xpc_dictionary_get_BOOL(v8, "userEditedKey");
        v31[2](v31);
      }
      int64_t int64 = xpc_dictionary_get_int64(v8, "customMaximumNumberOfAssetsForUnitTesting");
      if (int64 >= 1)
      {
        uint64_t v43 = [NSNumber numberWithLongLong:int64];
        customMaximumNumberOfAssetsForUnitTesting = v30->_customMaximumNumberOfAssetsForUnitTesting;
        v30->_customMaximumNumberOfAssetsForUnitTesting = (NSNumber *)v43;
      }
    }
  }

  return v11;
}

uint64_t __69__PHMemoryChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setMutated:1];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 recordUpdateRequest:v3];
}

- (PHMemoryChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHMemoryChangeRequest;
  id v8 = [(PHChangeRequest *)&v22 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    id v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAsset" changeRequestHelper:v8->super._helper];
    keyAssetHelper = v8->_keyAssetHelper;
    v8->_keyAssetHelper = v11;

    uint64_t v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"movieCuratedAssets" changeRequestHelper:v8->super._helper];
    movieCuratedAssetsHelper = v8->_movieCuratedAssetsHelper;
    v8->_movieCuratedAssetsHelper = v13;

    uint64_t v15 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"userCuratedAssets" changeRequestHelper:v8->super._helper];
    userCuratedAssetsHelper = v8->_userCuratedAssetsHelper;
    v8->_userCuratedAssetsHelper = v15;

    id v17 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customUserAssets" changeRequestHelper:v8->super._helper];
    customUserAssetsHelper = v8->_customUserAssetsHelper;
    v8->_customUserAssetsHelper = v17;

    char v19 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"userRemovedAssets" changeRequestHelper:v8->super._helper];
    userRemovedAssetsHelper = v8->_userRemovedAssetsHelper;
    v8->_userRemovedAssetsHelper = v19;
  }
  return v8;
}

- (id)initForNewObject
{
  v22.receiver = self;
  v22.super_class = (Class)PHMemoryChangeRequest;
  v2 = [(PHChangeRequest *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAsset" changeRequestHelper:v2->super._helper];
    keyAssetHelper = v2->_keyAssetHelper;
    v2->_keyAssetHelper = v5;

    id v7 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"representativeAssets" changeRequestHelper:v2->super._helper];
    representativeAssetsHelper = v2->_representativeAssetsHelper;
    v2->_representativeAssetsHelper = v7;

    id v9 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"curatedAssets" changeRequestHelper:v2->super._helper];
    curatedAssetsHelper = v2->_curatedAssetsHelper;
    v2->_curatedAssetsHelper = v9;

    id v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"extendedCuratedAssets" changeRequestHelper:v2->super._helper];
    extendedCuratedAssetsHelper = v2->_extendedCuratedAssetsHelper;
    v2->_extendedCuratedAssetsHelper = v11;

    uint64_t v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"movieCuratedAssets" changeRequestHelper:v2->super._helper];
    movieCuratedAssetsHelper = v2->_movieCuratedAssetsHelper;
    v2->_movieCuratedAssetsHelper = v13;

    uint64_t v15 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"userCuratedAssets" changeRequestHelper:v2->super._helper];
    userCuratedAssetsHelper = v2->_userCuratedAssetsHelper;
    v2->_userCuratedAssetsHelper = v15;

    id v17 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customUserAssets" changeRequestHelper:v2->super._helper];
    customUserAssetsHelper = v2->_customUserAssetsHelper;
    v2->_customUserAssetsHelper = v17;

    char v19 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"userRemovedAssets" changeRequestHelper:v2->super._helper];
    userRemovedAssetsHelper = v2->_userRemovedAssetsHelper;
    v2->_userRemovedAssetsHelper = v19;
  }
  return v2;
}

- (PHObjectPlaceholder)placeholderForCreatedMemory
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

+ (id)changeRequestForRemotelyViewedMemoryWithLocalIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setIncludePendingMemories:1];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier == %@", v3];
  [v4 setPredicate:v5];

  id v6 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v4];
  if ([v6 count])
  {
    id v7 = [v6 firstObject];
    id v8 = +[PHMemoryChangeRequest changeRequestForMemory:v7];
    [v8 incrementViewCount];
    if ([v7 pendingState] == 1) {
      [v8 setPendingState:0];
    }
    PLSAggregateDictionaryAddValueForScalarKey();
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    id v10 = [v8 clientName];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F8C198]];

    id v11 = +[PHMemory stringForCategory:](PHMemory, "stringForCategory:", [v7 category]);
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F8C1A0]];

    id v12 = +[PHMemory stringForSubcategory:](PHMemory, "stringForSubcategory:", [v7 subcategory]);
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F8C1A8]];

    PLSendCoreAnalyticEvent();
  }
  else
  {
    uint64_t v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "Cannot find memory for local identifier %@", buf, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

+ (void)unblockPersonsInMemoriesWithBlockedPersonFeature:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = [v11 blacklistedFeature];
        uint64_t v13 = [v12 type];

        if (v13 != 1)
        {
          uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2 object:a1 file:@"PHMemoryChangeRequest.m" lineNumber:987 description:@"Memory does not contain a blocked feature of type PHMemoryFeatureTypePeoplePerson."];
        }
        if ([v11 category] == 401)
        {
          [v5 addObject:v11];
        }
        else
        {
          uint64_t v14 = +[PHMemoryChangeRequest changeRequestForMemory:v11];
          [v14 setBlacklistedFeature:0];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [a1 deleteMemories:v5];
  }
}

+ (void)blockPerson:(id)a3 withAsset:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = [v5 photoLibrary];
    uint64_t v8 = [v7 librarySpecificFetchOptions];

    v24[0] = @"PHAssetPropertySetIdentifier";
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v8 setFetchPropertySets:v9];

    uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    long long v23 = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v8 setSortDescriptors:v11];

    [v8 setFetchLimit:10];
    id v12 = +[PHAsset fetchAssetsForPerson:v5 options:v8];
    uint64_t v13 = [v12 fetchedObjects];
    uint64_t v14 = v13;
    if (v6)
    {
      if (([v13 containsObject:v6] & 1) == 0)
      {
        uint64_t v15 = [v14 arrayByAddingObject:v6];

        uint64_t v14 = (void *)v15;
      }
    }
    else
    {
      uint64_t v16 = [v13 firstObject];
      if (!v16)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v5;
          _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed blocking person %@, no representative asset found", buf, 0xCu);
        }
        id v6 = 0;
        goto LABEL_8;
      }
      id v6 = (id)v16;
    }
    long long v17 = [MEMORY[0x1E4F1C9C8] date];
    long long v18 = +[PHMemoryChangeRequest creationRequestForMemoryWithTitle:@"_" subtitle:0 creationDate:v17 category:401 subcategory:204 representativeAssets:v14 curatedAssets:v14 extendedCuratedAssets:v14 keyAsset:v6];

    [v18 setUserCreated:1];
    [v18 setPendingState:0];
    [v18 setRejected:1];
    long long v19 = [v5 localIdentifier];
    long long v20 = +[PHMemoryFeature peopleMemoryFeatureWithPersonLocalIdentifier:v19];
    [v18 setBlacklistedFeature:v20];

LABEL_8:
  }
}

+ (void)blockPerson:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 photoLibrary];
    id v6 = [v5 librarySpecificFetchOptions];
    v15[0] = @"PHFacePropertySetIdentifier";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v6 setFetchPropertySets:v7];

    uint64_t v8 = +[PHFace fetchKeyFaceForPerson:v4 options:v6];
    uint64_t v9 = [v5 librarySpecificFetchOptions];
    uint64_t v14 = @"PHAssetPropertySetIdentifier";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v9 setFetchPropertySets:v10];

    [v9 setFetchLimit:1];
    id v11 = [v8 fetchedObjects];
    id v12 = +[PHAsset fetchAssetsForFaces:v11 options:v9];
    uint64_t v13 = [v12 firstObject];

    [a1 blockPerson:v4 withAsset:v13];
  }
}

+ (void)deleteMemories:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)validateMemoryTitle:(id)a3 error:(id *)a4
{
  uint64_t v5 = validateMemoryTitle_error__onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&validateMemoryTitle_error__onceToken, &__block_literal_global_13502);
  }
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:validateMemoryTitle_error__characterSet];

  if ([v7 length])
  {
    uint64_t v8 = 0;
    if (!a4) {
      goto LABEL_9;
    }
  }
  else
  {

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Empty title unsupported");
    uint64_t v7 = 0;
    if (!a4) {
      goto LABEL_9;
    }
  }
  if (!v7) {
    *a4 = v8;
  }
LABEL_9:

  return v7;
}

void __51__PHMemoryChangeRequest_validateMemoryTitle_error___block_invoke()
{
  id v2 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  [v2 removeCharactersInString:@" "];
  uint64_t v0 = [v2 copy];
  v1 = (void *)validateMemoryTitle_error__characterSet;
  validateMemoryTitle_error__characterSet = v0;
}

+ (id)changeRequestForMemory:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [PHMemoryChangeRequest alloc];
    uint64_t v5 = [v3 uuid];
    id v6 = [v3 objectID];
    uint64_t v7 = [(PHMemoryChangeRequest *)v4 initWithUUID:v5 objectID:v6];

    [(PHMemoryChangeRequest *)v7 _setBackingMemory:v3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_preferredAttributesForMemoryCreationFromObject:(id)a3 withSuccess:(BOOL)a4 title:(id)a5 subtitle:(id)a6 error:(id)a7 proposedAttributes:(id)a8
{
  BOOL v12 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  long long v18 = [v17 objectForKeyedSubscript:@"PHMemoryCreationAttributeTitleKey"];
  long long v19 = [v17 objectForKeyedSubscript:@"PHMemoryCreationAttributeTitleCategoryKey"];
  uint64_t v20 = [v19 integerValue];

  id v21 = [v17 objectForKeyedSubscript:@"PHMemoryCreationAttributeSubtitleKey"];

  if (v12)
  {
    if (!v18 || v20 == 5)
    {
      id v23 = v14;

      uint64_t v20 = 5;
      long long v18 = v23;
      if (v21) {
        goto LABEL_11;
      }
    }
    else if (v21)
    {
      goto LABEL_11;
    }
    id v21 = v15;
  }
  else
  {
    id v22 = PLMemoriesGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412546;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v16;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEFAULT, "Failed to request preferred attributes for memory creation from %@: %@", (uint8_t *)&v27, 0x16u);
    }
  }
LABEL_11:
  uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  [v24 setObject:v18 forKeyedSubscript:@"PHMemoryCreationAttributeTitleKey"];
  uint64_t v25 = [NSNumber numberWithInteger:v20];
  [v24 setObject:v25 forKeyedSubscript:@"PHMemoryCreationAttributeTitleCategoryKey"];

  [v24 setObject:v21 forKeyedSubscript:@"PHMemoryCreationAttributeSubtitleKey"];

  return v24;
}

+ (int64_t)_titleFormatForProposedAttributes:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"PHMemoryCreationAttributeTitleKey"];

  if (v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"PHMemoryCreationAttributeTitleCategoryKey"];
    if ([v5 integerValue] == 5) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 3;
    }
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

+ (BOOL)_shouldAcceptProposedAttributes:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"PHMemoryCreationAttributeTitleKey"];

  if (v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"PHMemoryCreationAttributeTitleCategoryKey"];
    uint64_t v6 = [v5 integerValue];

    if (v6 == 5)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      uint64_t v7 = [v3 objectForKeyedSubscript:@"PHMemoryCreationAttributeSubtitleKey"];
      LOBYTE(v4) = v7 != 0;
    }
  }

  return (char)v4;
}

+ (id)preferredAttributesForMemoryCreationFromPeople:(id)a3 proposedAttributes:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _shouldAcceptProposedAttributes:v7])
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = [a1 _titleFormatForProposedAttributes:v7];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (!v14)
          {
            id v14 = [*(id *)(*((void *)&v30 + 1) + 8 * i) photoLibrary];
          }
          long long v18 = objc_msgSend(v17, "localIdentifier", v26);
          [v10 addObject:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }
    else
    {
      id v14 = 0;
    }

    long long v19 = [v14 photoLibrary];
    uint64_t v20 = [v19 photoAnalysisClient];

    id v28 = 0;
    id v29 = 0;
    id v27 = 0;
    uint64_t v21 = [v20 requestTitleForPersonLocalIdentifiers:v10 format:v9 title:&v29 subtitle:&v28 error:&v27];
    id v22 = v29;
    id v23 = v28;
    id v24 = v27;
    id v8 = [a1 _preferredAttributesForMemoryCreationFromObject:v11 withSuccess:v21 title:v22 subtitle:v23 error:v24 proposedAttributes:v7];

    id v6 = v26;
  }

  return v8;
}

+ (id)preferredAttributesForMemoryCreationFromCollectionList:(id)a3 proposedAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _shouldAcceptProposedAttributes:v7])
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = [a1 _titleFormatForProposedAttributes:v7];
    uint64_t v10 = [v6 photoLibrary];
    id v11 = [v10 photoAnalysisClient];

    uint64_t v12 = [v6 localIdentifier];
    id v19 = 0;
    id v20 = 0;
    id v18 = 0;
    uint64_t v13 = [v11 requestTitleForCollectionMomentListWithLocalIdentifier:v12 format:v9 title:&v20 subtitle:&v19 error:&v18];
    id v14 = v20;
    id v15 = v19;
    id v16 = v18;

    id v8 = [a1 _preferredAttributesForMemoryCreationFromObject:v6 withSuccess:v13 title:v14 subtitle:v15 error:v16 proposedAttributes:v7];
  }

  return v8;
}

+ (id)preferredAttributesForMemoryCreationFromAssetCollection:(id)a3 proposedAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _shouldAcceptProposedAttributes:v7])
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = [a1 _titleFormatForProposedAttributes:v7];
    uint64_t v10 = [v6 photoLibrary];
    id v11 = [v10 photoLibrary];
    uint64_t v12 = [v11 photoAnalysisClient];

    uint64_t v13 = [v6 localIdentifier];
    id v20 = 0;
    id v21 = 0;
    id v19 = 0;
    uint64_t v14 = [v12 requestTitleForAssetCollectionWithLocalIdentifier:v13 format:v9 title:&v21 subtitle:&v20 error:&v19];
    id v15 = v21;
    id v16 = v20;
    id v17 = v19;

    id v8 = [a1 _preferredAttributesForMemoryCreationFromObject:v6 withSuccess:v14 title:v15 subtitle:v16 error:v17 proposedAttributes:v7];
  }

  return v8;
}

+ (id)creationRequestForMemoryWithTitle:(id)a3 subtitle:(id)a4 creationDate:(id)a5 category:(unint64_t)a6 subcategory:(unint64_t)a7 representativeAssetUUIDs:(id)a8 curatedAssetUUIDs:(id)a9 extendedCuratedAssetUUIDs:(id)a10 keyAssetUUID:(id)a11
{
  id v16 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [[PHMemoryChangeRequest alloc] initForNewObject];
  [v23 setTitle:v22];

  [v23 setSubtitle:v21];
  [v23 setCreationDate:v20];

  [v23 setCategory:a6];
  [v23 setSubcategory:a7];
  [v23 setRepresentativeAssetUUIDs:v19 curatedAssetUUIDs:v18 extendedCuratedAssetUUIDs:v17 keyAssetUUID:v16];

  return v23;
}

+ (id)creationRequestForMemoryWithTitle:(id)a3 subtitle:(id)a4 creationDate:(id)a5 category:(unint64_t)a6 subcategory:(unint64_t)a7 representativeAssets:(id)a8 curatedAssets:(id)a9 extendedCuratedAssets:(id)a10 keyAsset:(id)a11
{
  id v16 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [[PHMemoryChangeRequest alloc] initForNewObject];
  [v23 setTitle:v22];

  [v23 setSubtitle:v21];
  [v23 setCreationDate:v20];

  [v23 setCategory:a6];
  [v23 setSubcategory:a7];
  [v23 setRepresentativeAssets:v19 curatedAssets:v18 extendedCuratedAssets:v17 keyAsset:v16];

  return v23;
}

@end