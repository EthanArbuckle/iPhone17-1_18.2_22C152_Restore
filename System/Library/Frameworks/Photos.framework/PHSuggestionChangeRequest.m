@interface PHSuggestionChangeRequest
+ (id)changeRequestForSuggestion:(id)a3;
+ (id)creationRequestForSuggestion;
+ (id)creationRequestForSuggestionWithType:(unsigned __int16)a3 subtype:(unsigned __int16)a4 keyAssets:(id)a5 representativeAssets:(id)a6 creationDate:(id)a7 relevantUntilDate:(id)a8 version:(int64_t)a9;
+ (void)deleteSuggestions:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4;
- (NSString)context;
- (NSString)managedEntityName;
- (NSString)relatedCollectionUUID;
- (NSString)subtitle;
- (NSString)title;
- (PHObjectPlaceholder)placeholderForCreatedSuggestion;
- (PHRelationshipChangeRequestHelper)keyAssetsHelper;
- (PHRelationshipChangeRequestHelper)representativeAssetsHelper;
- (PHSuggestionChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHSuggestionChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (id)actionData;
- (id)activationDate;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)creationDate;
- (id)endDate;
- (id)expungeDate;
- (id)featuresData;
- (id)initForNewObject;
- (id)relevantUntilDate;
- (id)startDate;
- (id)validateMutationsToManagedObject:(id)a3;
- (int64_t)version;
- (unint64_t)availableFeatures;
- (unsigned)featuredState;
- (unsigned)notificationState;
- (unsigned)state;
- (unsigned)subtype;
- (unsigned)type;
- (void)_calculateAndSetExpungeDate;
- (void)encodeToXPCDict:(id)a3;
- (void)markAccepted;
- (void)markActive;
- (void)markDeclined;
- (void)markReactivated;
- (void)markRetired;
- (void)performTransactionCompletionHandlingInPhotoLibrary:(id)a3;
- (void)setActionData:(id)a3;
- (void)setActionProperties:(id)a3;
- (void)setActivationDate:(id)a3;
- (void)setAvailableFeatures:(unint64_t)a3;
- (void)setContext:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setExpungeDate:(id)a3;
- (void)setFeaturedState:(unsigned __int16)a3;
- (void)setFeaturesData:(id)a3;
- (void)setFeaturesProperties:(id)a3;
- (void)setKeyAssets:(id)a3;
- (void)setNotificationState:(unsigned __int16)a3;
- (void)setRelatedCollectionUUID:(id)a3;
- (void)setRelevantUntilDate:(id)a3;
- (void)setRepresentativeAssets:(id)a3;
- (void)setStartAndEndDatesWithKeyAssets:(id)a3 representativeAssets:(id)a4;
- (void)setStartDate:(id)a3;
- (void)setState:(unsigned __int16)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtype:(unsigned __int16)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unsigned __int16)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PHSuggestionChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeAssetsHelper, 0);

  objc_storeStrong((id *)&self->_keyAssetsHelper, 0);
}

- (PHRelationshipChangeRequestHelper)representativeAssetsHelper
{
  return self->_representativeAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)keyAssetsHelper
{
  return self->_keyAssetsHelper;
}

- (void)_calculateAndSetExpungeDate
{
  +[PHSuggestion lifetimeAfterBecomingActive];
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:v3];
  [(PHSuggestionChangeRequest *)self setExpungeDate:v4];
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [(PHChangeRequest *)self helper];
  id v30 = 0;
  int v9 = [v8 applyMutationsToManagedObject:v7 error:&v30];
  id v10 = v30;

  v11 = [(PHChangeRequest *)self helper];
  v12 = [v11 mutations];

  if (v9)
  {
    v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = [(PHChangeRequest *)self isMutated];
      *(_DWORD *)buf = 67109378;
      BOOL v32 = v14;
      __int16 v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update", buf, 0x12u);
    }

    id v15 = v7;
    v16 = [(PHSuggestionChangeRequest *)self keyAssetsHelper];
    v17 = [v16 mutableObjectIDsAndUUIDs];

    unint64_t v18 = 0x1E4F8A000uLL;
    if (v17)
    {
      [v16 setAllowsInsert:1];
      [v16 setAllowsRemove:1];
      v19 = [MEMORY[0x1E4F8A950] entityName];
      [v16 setDestinationEntityName:v19];

      [v16 setIsDestinationObjectValid:&__block_literal_global_35536];
      uint64_t v21 = [v16 relationshipName];
      v20 = [v15 mutableSetValueForKey:v21];

      id v29 = v10;
      LODWORD(v21) = [v16 applyMutationsToManagedObject:v15 unorderedMutableChildren:v20 error:&v29];
      id v22 = v29;

      v23 = [(PHSuggestionChangeRequest *)self representativeAssetsHelper];
      if (!v21) {
        goto LABEL_13;
      }
      id v10 = v22;
      unint64_t v18 = 0x1E4F8A000;
    }
    else
    {
      v23 = [(PHSuggestionChangeRequest *)self representativeAssetsHelper];
    }
    v24 = [v23 mutableObjectIDsAndUUIDs];

    if (v24)
    {
      [v23 setAllowsInsert:1];
      [v23 setAllowsRemove:1];
      v25 = [*(id *)(v18 + 2384) entityName];
      [v23 setDestinationEntityName:v25];

      [v23 setIsDestinationObjectValid:&__block_literal_global_125];
      uint64_t v21 = [v23 relationshipName];
      v26 = [v15 mutableSetValueForKey:v21];

      id v28 = v10;
      LOBYTE(v21) = [v23 applyMutationsToManagedObject:v15 unorderedMutableChildren:v26 error:&v28];
      id v22 = v28;
    }
    else
    {
      LOBYTE(v21) = 1;
      id v22 = v10;
    }
LABEL_13:

    id v10 = v22;
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  LOBYTE(v21) = 0;
  if (!a5) {
    goto LABEL_16;
  }
LABEL_14:
  if ((v21 & 1) == 0) {
    *a5 = v10;
  }
LABEL_16:

  return v21;
}

uint64_t __78__PHSuggestionChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

uint64_t __78__PHSuggestionChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

- (void)markReactivated
{
}

- (void)markRetired
{
}

- (void)markDeclined
{
}

- (void)markAccepted
{
}

- (void)markActive
{
  [(PHSuggestionChangeRequest *)self setState:1];
  double v3 = [MEMORY[0x1E4F1C9C8] date];
  [(PHSuggestionChangeRequest *)self setActivationDate:v3];

  [(PHSuggestionChangeRequest *)self _calculateAndSetExpungeDate];
}

- (void)setStartAndEndDatesWithKeyAssets:(id)a3 representativeAssets:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    v11 = 0;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v6);
        }
        BOOL v14 = [*(id *)(*((void *)&v29 + 1) + 8 * i) creationDate];
        if (!v11 || [v11 compare:v14] == 1)
        {
          id v15 = v14;

          v11 = v15;
        }
        if (!v10 || [v10 compare:v14] == -1)
        {
          id v16 = v14;

          id v10 = v16;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
    v11 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "creationDate", (void)v25);
        if (!v11 || [v11 compare:v22] == 1)
        {
          id v23 = v22;

          v11 = v23;
        }
        if (!v10 || [v10 compare:v22] == -1)
        {
          id v24 = v22;

          id v10 = v24;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  [(PHSuggestionChangeRequest *)self setStartDate:v11];
  [(PHSuggestionChangeRequest *)self setEndDate:v10];
}

- (void)setFeaturesProperties:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  id v5 = v6;
  if (v4)
  {
    [(PHSuggestionChangeRequest *)self setFeaturesData:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error archiving featuresProperties for Suggestion: %@", buf, 0xCu);
  }
}

- (void)setActionProperties:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  id v5 = v6;
  if (v4)
  {
    [(PHSuggestionChangeRequest *)self setActionData:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error archiving actionProperties for Suggestion: %@", buf, 0xCu);
  }
}

- (void)setRepresentativeAssets:(id)a3
{
  id v6 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v6)
  {
    [(PHChangeRequest *)self didMutate];
    representativeAssetsHelper = self->_representativeAssetsHelper;
    id v5 = (void *)[v6 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)representativeAssetsHelper setMutableObjectIDsAndUUIDs:v5];
  }
}

- (void)setKeyAssets:(id)a3
{
  id v6 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v6)
  {
    [(PHChangeRequest *)self didMutate];
    keyAssetsHelper = self->_keyAssetsHelper;
    id v5 = (void *)[v6 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)keyAssetsHelper setMutableObjectIDsAndUUIDs:v5];
  }
}

- (void)setRelatedCollectionUUID:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"relatedCollectionUUID"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"relatedCollectionUUID"];
  }
  else
  {
    [v6 removeObjectForKey:@"relatedCollectionUUID"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"relatedCollectionUUID"];
  }
}

- (NSString)relatedCollectionUUID
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"relatedCollectionUUID"];

  return (NSString *)v5;
}

- (void)setContext:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"suggestionContext"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"suggestionContext"];
  }
  else
  {
    [v6 removeObjectForKey:@"suggestionContext"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"suggestionContext"];
  }
}

- (NSString)context
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"suggestionContext"];

  return (NSString *)v5;
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"subtitle"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"subtitle"];
  }
  else
  {
    [v6 removeObjectForKey:@"subtitle"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"subtitle"];
  }
}

- (NSString)subtitle
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
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
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"title"];
  }
  else
  {
    [v6 removeObjectForKey:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"title"];
  }
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (void)setFeaturesData:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"featuresData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"featuresData"];
  }
  else
  {
    [v6 removeObjectForKey:@"featuresData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"featuresData"];
  }
}

- (id)featuresData
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"featuresData"];

  return v5;
}

- (void)setActionData:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"actionData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"actionData"];
  }
  else
  {
    [v6 removeObjectForKey:@"actionData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"actionData"];
  }
}

- (id)actionData
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"actionData"];

  return v5;
}

- (void)setExpungeDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"expungeDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"expungeDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"expungeDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"expungeDate"];
  }
}

- (id)expungeDate
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"expungeDate"];

  return v5;
}

- (void)setRelevantUntilDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"relevantUntilDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"relevantUntilDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"relevantUntilDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"relevantUntilDate"];
  }
}

- (id)relevantUntilDate
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"relevantUntilDate"];

  return v5;
}

- (void)setActivationDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"activationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"activationDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"activationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"activationDate"];
  }
}

- (id)activationDate
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"activationDate"];

  return v5;
}

- (void)setEndDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"endDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"endDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"endDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"endDate"];
  }
}

- (id)endDate
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"endDate"];

  return v5;
}

- (void)setStartDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"startDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"startDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"startDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"startDate"];
  }
}

- (id)startDate
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"startDate"];

  return v5;
}

- (void)setCreationDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"creationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"creationDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"creationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"creationDate"];
  }
}

- (id)creationDate
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"creationDate"];

  return v5;
}

- (void)setAvailableFeatures:(unint64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"availableFeatures"];
}

- (unint64_t)availableFeatures
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"availableFeatures"];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

- (void)setVersion:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"version"];
}

- (int64_t)version
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"version"];

  int64_t v6 = (int)[v5 shortValue];
  return v6;
}

- (void)setFeaturedState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"featuredState"];
}

- (unsigned)featuredState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"featuredState"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setNotificationState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"notificationState"];
}

- (unsigned)notificationState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"notificationState"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"state"];
}

- (unsigned)state
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"state"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setSubtype:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"subtype"];
}

- (unsigned)subtype
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"subtype"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"type"];
}

- (unsigned)type
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"type"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int64_t v6 = (void *)MEMORY[0x1E4F8AC28];
  id v7 = a3;
  id v8 = [(PHChangeRequest *)self uuid];
  uint64_t v9 = [v6 insertIntoPhotoLibrary:v7 withUUID:v8];

  if (a4 && !v9)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v11 = [NSString stringWithFormat:@"Failed to create suggestion"];
    v15[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)performTransactionCompletionHandlingInPhotoLibrary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PHSuggestionChangeRequest_performTransactionCompletionHandlingInPhotoLibrary___block_invoke;
  v6[3] = &unk_1E5848DF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performTransactionAndWait:v6];
}

void __80__PHSuggestionChangeRequest_performTransactionCompletionHandlingInPhotoLibrary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  id v6 = +[PHObject uuidFromLocalIdentifier:v2];

  uint64_t v3 = [MEMORY[0x1E4F8AC28] suggestionWithUUID:v6 inPhotoLibrary:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 photoLibrary];
    [v4 updateCachedCounts:v5];
  }
}

- (NSString)managedEntityName
{
  return (NSString *)@"Suggestion";
}

- (id)validateMutationsToManagedObject:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PHChangeRequest *)self helper];
  if (!v6)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PHSuggestionChangeRequest.m" lineNumber:137 description:@"PHChangeRequestHelper is unexpectedly nil"];
  }
  id v7 = [v6 validateMutationsToManagedObject:v5];
  if ([v7 isSuccess]
    && [(PHSuggestionChangeRequest *)self featuredState] == 1
    && [v5 type] != 3
    && [v5 type] != 5
    && [v5 type] != 4
    && [v5 type] != 7
    && [v5 type] != 6
    && [v5 type] != 10)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"FeaturedState can only be set on RecentInterest|Outstander|SmallMemory|Widget|Wallpaper type Suggestion";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v10 = objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v9);

    uint64_t v11 = +[PHChangeRequest sanitizedFailureWithError:v10];

    id v7 = (void *)v11;
  }
  if ([v7 isSuccess])
  {
    uint64_t v12 = [v6 mutations];
    v13 = [v12 objectForKeyedSubscript:@"relatedCollectionUUID"];

    if (v13)
    {
      unsigned int v14 = [(PHSuggestionChangeRequest *)self type];
      if (v14 < 0xA || v14 == 11)
      {
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28568];
        id v16 = objc_msgSend(NSString, "stringWithFormat:", @"RelatedCollection isn't supported by type: %hu", -[PHSuggestionChangeRequest type](self, "type"));
        id v23 = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        uint64_t v18 = objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v17);

        uint64_t v19 = +[PHChangeRequest sanitizedFailureWithError:v18];

        id v7 = (void *)v19;
      }
    }
  }

  return v7;
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v5 = [(PHSuggestionChangeRequest *)self validateMutationsToManagedObject:a3];
  id v6 = [v5 resultWithError:a4];
  LOBYTE(a4) = v6 != 0;

  return (char)a4;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHChangeRequest *)self helper];
  id v14 = 0;
  char v11 = [v10 allowMutationToManagedObject:v9 propertyKey:v8 error:&v14];

  id v12 = v14;
  if (a5 && (v11 & 1) == 0) {
    *a5 = v12;
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v5 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 encodeToXPCDict:v5];

  [(PHRelationshipChangeRequestHelper *)self->_keyAssetsHelper encodeToXPCDict:v5];
  [(PHRelationshipChangeRequestHelper *)self->_representativeAssetsHelper encodeToXPCDict:v5];
}

- (PHSuggestionChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHSuggestionChangeRequest;
  char v11 = [(PHChangeRequest *)&v19 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      id v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      keyAssetsHelper = v11->_keyAssetsHelper;
      v11->_keyAssetsHelper = v14;

      id v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"representativeAssets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      representativeAssetsHelper = v11->_representativeAssetsHelper;
      v11->_representativeAssetsHelper = v16;
    }
  }

  return v11;
}

- (PHSuggestionChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHSuggestionChangeRequest;
  id v8 = [(PHChangeRequest *)&v16 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    char v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssets" changeRequestHelper:v8->super._helper];
    keyAssetsHelper = v8->_keyAssetsHelper;
    v8->_keyAssetsHelper = v11;

    v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"representativeAssets" changeRequestHelper:v8->super._helper];
    representativeAssetsHelper = v8->_representativeAssetsHelper;
    v8->_representativeAssetsHelper = v13;
  }
  return v8;
}

- (id)initForNewObject
{
  v10.receiver = self;
  v10.super_class = (Class)PHSuggestionChangeRequest;
  v2 = [(PHChangeRequest *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssets" changeRequestHelper:v2->super._helper];
    keyAssetsHelper = v2->_keyAssetsHelper;
    v2->_keyAssetsHelper = v5;

    id v7 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"representativeAssets" changeRequestHelper:v2->super._helper];
    representativeAssetsHelper = v2->_representativeAssetsHelper;
    v2->_representativeAssetsHelper = v7;
  }
  return v2;
}

- (PHObjectPlaceholder)placeholderForCreatedSuggestion
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

+ (void)deleteSuggestions:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)changeRequestForSuggestion:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [PHSuggestionChangeRequest alloc];
    id v5 = [v3 uuid];
    id v6 = [v3 objectID];
    id v7 = [(PHSuggestionChangeRequest *)v4 initWithUUID:v5 objectID:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)creationRequestForSuggestion
{
  id v2 = [[PHSuggestionChangeRequest alloc] initForNewObject];

  return v2;
}

+ (id)creationRequestForSuggestionWithType:(unsigned __int16)a3 subtype:(unsigned __int16)a4 keyAssets:(id)a5 representativeAssets:(id)a6 creationDate:(id)a7 relevantUntilDate:(id)a8 version:(int64_t)a9
{
  uint64_t v12 = a4;
  uint64_t v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = [[PHSuggestionChangeRequest alloc] initForNewObject];
  [v18 setState:0];
  [v18 setType:v13];
  [v18 setSubtype:v12];
  [v18 setVersion:a9];
  [v18 setNotificationState:0];
  [v18 setFeaturedState:0];
  [v18 setCreationDate:v15];

  [v18 setRelevantUntilDate:v14];
  [v18 setKeyAssets:v17];
  [v18 setRepresentativeAssets:v16];
  [v18 setStartAndEndDatesWithKeyAssets:v17 representativeAssets:v16];

  return v18;
}

@end