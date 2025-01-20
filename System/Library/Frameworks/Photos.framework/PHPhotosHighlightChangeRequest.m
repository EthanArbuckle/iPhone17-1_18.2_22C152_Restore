@interface PHPhotosHighlightChangeRequest
+ (id)changeRequestForPhotosHighlight:(id)a3;
+ (void)deletePhotosHighlights:(id)a3;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (NSDate)lastEnrichmentDate;
- (NSDictionary)curationHelpersByCurationType;
- (NSString)dateDescription;
- (NSString)dateDescriptionMixed;
- (NSString)dateDescriptionShared;
- (NSString)managedEntityName;
- (NSString)smartDescription;
- (NSString)smartDescriptionMixed;
- (NSString)smartDescriptionShared;
- (NSString)verboseSmartDescription;
- (NSString)verboseSmartDescriptionMixed;
- (NSString)verboseSmartDescriptionShared;
- (NSString)verboseSmartDescriptionUserEdited;
- (PHPhotosHighlight)originalHighlight;
- (PHPhotosHighlightChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHPhotosHighlightChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHRelationshipChangeRequestHelper)dayGroupKeyAssetHelper;
- (PHRelationshipChangeRequestHelper)dayGroupKeyAssetSharedHelper;
- (PHRelationshipChangeRequestHelper)dayKeyAssetHelper;
- (PHRelationshipChangeRequestHelper)dayKeyAssetSharedHelper;
- (PHRelationshipChangeRequestHelper)monthKeyAssetHelper;
- (PHRelationshipChangeRequestHelper)monthKeyAssetSharedHelper;
- (PHRelationshipChangeRequestHelper)yearKeyAssetHelper;
- (PHRelationshipChangeRequestHelper)yearKeyAssetSharedHelper;
- (double)promotionScore;
- (id)_existentAssetObjectIDs;
- (id)_existentCuratedAssetObjectIDsForCurationType:(unsigned __int16)a3;
- (id)_mutableAssetObjectIDsAndUUIDsForCurationType:(unsigned __int16)a3;
- (id)_mutableKeyAssetObjectIDsAndUUIDsForShared:(BOOL)a3 userEdited:(BOOL)a4;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)placeholderForCreatedPhotosHighlight;
- (signed)enrichmentVersion;
- (unint64_t)mood;
- (unsigned)_externalCurationTypeForInternalCurationType:(unsigned __int16)a3;
- (unsigned)_internalCurationTypeForExternalCurationType:(unsigned __int16)a3;
- (unsigned)enrichmentState;
- (unsigned)kind;
- (unsigned)mixedSharingCompositionKeyAssetRelationship;
- (unsigned)visibilityState;
- (unsigned)visibilityStateMixed;
- (unsigned)visibilityStateShared;
- (void)_initializeCurationHelpersWithHelper:(id)a3 xpcDict:(id)a4;
- (void)clearCurationWithType:(unsigned __int16)a3;
- (void)didEnrichHighlight;
- (void)encodeToXPCDict:(id)a3;
- (void)setAssets:(id)a3 forCurationType:(unsigned __int16)a4;
- (void)setDateDescription:(id)a3;
- (void)setDateDescriptionMixed:(id)a3;
- (void)setDateDescriptionShared:(id)a3;
- (void)setEnrichmentState:(unsigned __int16)a3;
- (void)setEnrichmentVersion:(signed __int16)a3;
- (void)setKeyAssetPrivate:(id)a3;
- (void)setKeyAssetPrivate:(id)a3 userEdited:(BOOL)a4;
- (void)setKeyAssetShared:(id)a3;
- (void)setKeyAssetShared:(id)a3 userEdited:(BOOL)a4;
- (void)setKind:(unsigned __int16)a3;
- (void)setLastEnrichmentDate:(id)a3;
- (void)setMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3;
- (void)setMood:(unint64_t)a3;
- (void)setOriginalHighlight:(id)a3;
- (void)setPromotionScore:(double)a3;
- (void)setSmartDescription:(id)a3;
- (void)setSmartDescriptionMixed:(id)a3;
- (void)setSmartDescriptionShared:(id)a3;
- (void)setVerboseSmartDescription:(id)a3;
- (void)setVerboseSmartDescriptionMixed:(id)a3;
- (void)setVerboseSmartDescriptionShared:(id)a3;
- (void)setVerboseSmartDescriptionUserEdited:(id)a3;
- (void)setVisibilityState:(unsigned __int16)a3;
- (void)setVisibilityStateMixed:(unsigned __int16)a3;
- (void)setVisibilityStateShared:(unsigned __int16)a3;
@end

@implementation PHPhotosHighlightChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearKeyAssetSharedHelper, 0);
  objc_storeStrong((id *)&self->_dayKeyAssetSharedHelper, 0);
  objc_storeStrong((id *)&self->_monthKeyAssetSharedHelper, 0);
  objc_storeStrong((id *)&self->_dayGroupKeyAssetSharedHelper, 0);
  objc_storeStrong((id *)&self->_curationHelpersByCurationType, 0);
  objc_storeStrong((id *)&self->_originalHighlight, 0);
  objc_storeStrong((id *)&self->_dayGroupKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_yearKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_monthKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_dayKeyAssetHelper, 0);

  objc_storeStrong((id *)&self->_verboseSmartDescriptionUserEdited, 0);
}

- (PHRelationshipChangeRequestHelper)yearKeyAssetSharedHelper
{
  return self->_yearKeyAssetSharedHelper;
}

- (PHRelationshipChangeRequestHelper)dayKeyAssetSharedHelper
{
  return self->_dayKeyAssetSharedHelper;
}

- (PHRelationshipChangeRequestHelper)monthKeyAssetSharedHelper
{
  return self->_monthKeyAssetSharedHelper;
}

- (PHRelationshipChangeRequestHelper)dayGroupKeyAssetSharedHelper
{
  return self->_dayGroupKeyAssetSharedHelper;
}

- (NSDictionary)curationHelpersByCurationType
{
  return self->_curationHelpersByCurationType;
}

- (void)setOriginalHighlight:(id)a3
{
}

- (PHPhotosHighlight)originalHighlight
{
  return self->_originalHighlight;
}

- (PHRelationshipChangeRequestHelper)dayGroupKeyAssetHelper
{
  return self->_dayGroupKeyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)yearKeyAssetHelper
{
  return self->_yearKeyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)monthKeyAssetHelper
{
  return self->_monthKeyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)dayKeyAssetHelper
{
  return self->_dayKeyAssetHelper;
}

- (void)setVerboseSmartDescriptionUserEdited:(id)a3
{
}

- (NSString)verboseSmartDescriptionUserEdited
{
  return self->_verboseSmartDescriptionUserEdited;
}

- (id)_existentCuratedAssetObjectIDsForCurationType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 photoLibrary];
    v8 = [v7 librarySpecificFetchOptions];

    objc_msgSend(v8, "setHighlightCurationType:", -[PHPhotosHighlightChangeRequest _externalCurationTypeForInternalCurationType:](self, "_externalCurationTypeForInternalCurationType:", v3));
    [v8 setIncludeHiddenAssets:1];
    [v8 setIncludeTrashedAssets:1];
    v9 = +[PHQuery queryForCuratedAssetsInPhotosHighlight:v6 options:v8];
  }
  else
  {
    v9 = 0;
  }
  v10 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:v9];

  return v10;
}

- (id)_existentAssetObjectIDs
{
  v2 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [v2 photoLibrary];
    v5 = [v4 librarySpecificFetchOptions];

    [v5 setHighlightCurationType:0];
    v6 = +[PHQuery queryForAssetsInAssetCollection:v3 options:v5];
  }
  else
  {
    v6 = 0;
  }
  v7 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:v6];

  return v7;
}

- (id)_mutableAssetObjectIDsAndUUIDsForCurationType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHPhotosHighlightChangeRequest *)self curationHelpersByCurationType];
  v6 = [NSNumber numberWithUnsignedShort:v3];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [v7 originalObjectIDs];

    if (!v8)
    {
      v9 = [(PHPhotosHighlightChangeRequest *)self _existentCuratedAssetObjectIDsForCurationType:v3];
      [v7 setOriginalObjectIDs:v9];
    }
    v10 = [v7 mutableObjectIDsAndUUIDs];

    if (!v10)
    {
      v11 = [MEMORY[0x1E4F1CA48] array];
      [v7 setMutableObjectIDsAndUUIDs:v11];
    }
    v12 = [v7 mutableObjectIDsAndUUIDs];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_mutableKeyAssetObjectIDsAndUUIDsForShared:(BOOL)a3 userEdited:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
  if (v6)
  {
    v7 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
    int v8 = [v7 kind];
  }
  else
  {
    int v8 = [(PHPhotosHighlightChangeRequest *)self kind];
  }

  switch(v8)
  {
    case 0:
      v9 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__dayKeyAssetHelper;
      v10 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__dayKeyAssetSharedHelper;
      goto LABEL_10;
    case 1:
      v9 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__monthKeyAssetHelper;
      v10 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__monthKeyAssetSharedHelper;
      goto LABEL_10;
    case 2:
      v9 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__yearKeyAssetHelper;
      v10 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__yearKeyAssetSharedHelper;
      goto LABEL_10;
    case 3:
      v9 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__dayGroupKeyAssetHelper;
      v10 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__dayGroupKeyAssetSharedHelper;
LABEL_10:
      if (v4) {
        v9 = v10;
      }
      id v11 = *(id *)((char *)&self->super.super.isa + *v9);
      break;
    default:
      id v11 = 0;
      break;
  }
  v12 = [v11 originalObjectIDs];

  if (!v12) {
    [v11 setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  v13 = [v11 mutableObjectIDsAndUUIDs];

  if (!v13)
  {
    v14 = [v11 originalObjectIDs];
    v15 = (void *)[v14 mutableCopy];
    [v11 setMutableObjectIDsAndUUIDs:v15];
  }
  v16 = [v11 mutableObjectIDsAndUUIDs];

  return v16;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(PHChangeRequest *)self helper];
  id v71 = 0;
  int v11 = [v10 applyMutationsToManagedObject:v8 error:&v71];
  id v12 = v71;

  v13 = [(PHChangeRequest *)self helper];
  v14 = [v13 mutations];

  if (!v11)
  {
    BOOL v30 = 0;
    if (!a5) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  id v55 = v9;
  v56 = a5;
  v15 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    BOOL v16 = [(PHChangeRequest *)self isMutated];
    *(_DWORD *)buf = 67109378;
    BOOL v76 = v16;
    __int16 v77 = 2112;
    v78 = v14;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update", buf, 0x12u);
  }
  v58 = v14;

  id v57 = v8;
  id v17 = v8;
  v54 = self;
  v18 = [(PHPhotosHighlightChangeRequest *)self curationHelpersByCurationType];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = [v18 allKeys];
  uint64_t v19 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v68;
    char v22 = 1;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v68 != v21) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if ([v24 unsignedShortValue])
        {
          v25 = [v18 objectForKeyedSubscript:v24];
          [v25 setAllowsInsert:1];
          [v25 setAllowsRemove:1];
          v26 = [MEMORY[0x1E4F8A950] entityName];
          [v25 setDestinationEntityName:v26];

          [v25 setIsDestinationObjectValid:&__block_literal_global_144];
          v27 = [v25 relationshipName];
          v28 = [v17 mutableSetValueForKey:v27];

          id v66 = v12;
          char v22 = [v25 applyMutationsToManagedObject:v17 unorderedMutableChildren:v28 error:&v66];
          id v29 = v66;

          id v12 = v29;
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v20);
  }
  else
  {
    char v22 = 1;
  }

  v31 = [v58 objectForKey:@"enrichmentState"];
  if (v31)
  {
  }
  else
  {
    v32 = [v58 objectForKey:@"enrichmentVersion"];

    if (!v32) {
      goto LABEL_21;
    }
  }
  v33 = [v17 photoLibrary];
  v34 = [v33 libraryServicesManager];
  v35 = [v34 backgroundJobService];
  v36 = [v17 photoLibrary];
  [v35 signalBackgroundProcessingNeededOnLibrary:v36];

LABEL_21:
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obja = [(PHPhotosHighlightChangeRequest *)v54 dayKeyAssetHelper];
  v72[0] = obja;
  v53 = [(PHPhotosHighlightChangeRequest *)v54 dayKeyAssetSharedHelper];
  v72[1] = v53;
  v37 = [(PHPhotosHighlightChangeRequest *)v54 monthKeyAssetHelper];
  v72[2] = v37;
  v38 = [(PHPhotosHighlightChangeRequest *)v54 monthKeyAssetSharedHelper];
  v72[3] = v38;
  v39 = [(PHPhotosHighlightChangeRequest *)v54 yearKeyAssetHelper];
  v72[4] = v39;
  v40 = [(PHPhotosHighlightChangeRequest *)v54 yearKeyAssetSharedHelper];
  v72[5] = v40;
  v41 = [(PHPhotosHighlightChangeRequest *)v54 dayGroupKeyAssetHelper];
  v72[6] = v41;
  v42 = [(PHPhotosHighlightChangeRequest *)v54 dayGroupKeyAssetSharedHelper];
  v72[7] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:8];

  uint64_t v44 = [v43 countByEnumeratingWithState:&v62 objects:v73 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v63 != v46) {
          objc_enumerationMutation(v43);
        }
        if (v22)
        {
          v48 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          v49 = [v48 mutableObjectIDsAndUUIDs];

          if (v49)
          {
            [v48 setAllowsInsert:1];
            v50 = [MEMORY[0x1E4F8A950] entityName];
            [v48 setDestinationEntityName:v50];

            [v48 setIsDestinationObjectValid:&__block_literal_global_146];
            id v61 = v12;
            char v22 = [v48 applyMutationsToManagedObjectToOneRelationship:v17 error:&v61];
            id v51 = v61;

            id v12 = v51;
          }
        }
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v62 objects:v73 count:16];
    }
    while (v45);
  }

  BOOL v30 = v22 & 1;
  a5 = v56;
  id v8 = v57;
  id v9 = v55;
  v14 = v58;
  if (v56)
  {
LABEL_32:
    if (!v30) {
      *a5 = v12;
    }
  }
LABEL_34:

  return v30;
}

uint64_t __83__PHPhotosHighlightChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

uint64_t __83__PHPhotosHighlightChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

- (void)didEnrichHighlight
{
  uint64_t v3 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
  uint64_t v4 = [v3 highlightVersion];

  [(PHPhotosHighlightChangeRequest *)self setEnrichmentVersion:v4];
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F8AAB8];
  v7 = [a3 managedObjectContext];
  id v8 = [v6 insertNewPhotosHighlightInManagedObjectContext:v7 error:a4];

  id v9 = [(PHChangeRequest *)self uuid];
  [v8 setUuid:v9];

  v10 = [v8 managedObjectContext];
  v17[0] = v8;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v16 = 0;
  int v12 = [v10 obtainPermanentIDsForObjects:v11 error:&v16];
  id v13 = v16;

  if (v12)
  {
    id v14 = v8;
  }
  else
  {
    id v14 = 0;
    if (a4) {
      *a4 = v13;
    }
  }

  return v14;
}

- (id)placeholderForCreatedPhotosHighlight
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return v4;
}

- (void)setAssets:(id)a3 forCurationType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v12 = a3;
  uint64_t v6 = [(PHPhotosHighlightChangeRequest *)self _internalCurationTypeForExternalCurationType:v4];
  v7 = [(PHPhotosHighlightChangeRequest *)self curationHelpersByCurationType];
  id v8 = [NSNumber numberWithUnsignedShort:v6];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    v10 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:v12];
    if (v10)
    {
      [(PHChangeRequest *)self didMutate];
      int v11 = [(PHPhotosHighlightChangeRequest *)self _mutableAssetObjectIDsAndUUIDsForCurationType:v6];
      [v11 setArray:v10];
    }
  }
}

- (void)clearCurationWithType:(unsigned __int16)a3
{
  uint64_t v4 = [(PHPhotosHighlightChangeRequest *)self _internalCurationTypeForExternalCurationType:a3];
  v5 = [(PHPhotosHighlightChangeRequest *)self curationHelpersByCurationType];
  uint64_t v6 = [NSNumber numberWithUnsignedShort:v4];
  id v8 = [v5 objectForKeyedSubscript:v6];

  if (v8)
  {
    [(PHChangeRequest *)self didMutate];
    v7 = [(PHPhotosHighlightChangeRequest *)self _mutableAssetObjectIDsAndUUIDsForCurationType:v4];
    [v7 removeAllObjects];
  }
}

- (unsigned)_externalCurationTypeForInternalCurationType:(unsigned __int16)a3
{
  int v3 = a3;
  v5 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
  if (v5)
  {
    uint64_t v6 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
    unsigned int v7 = [v6 kind];
  }
  else
  {
    unsigned int v7 = [(PHPhotosHighlightChangeRequest *)self kind];
  }

  unsigned __int16 v8 = v3 == 5;
  if (v3 == 4) {
    unsigned __int16 v8 = 2;
  }
  if (v7 != 3) {
    unsigned __int16 v8 = 0;
  }
  if (v7 >= 3) {
    return v8;
  }
  else {
    return v3;
  }
}

- (unsigned)_internalCurationTypeForExternalCurationType:(unsigned __int16)a3
{
  int v3 = a3;
  v5 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
  if (v5)
  {
    uint64_t v6 = [(PHPhotosHighlightChangeRequest *)self originalHighlight];
    unsigned int v7 = [v6 kind];
  }
  else
  {
    unsigned int v7 = [(PHPhotosHighlightChangeRequest *)self kind];
  }

  if (v3 == 1) {
    unsigned __int16 v8 = 5;
  }
  else {
    unsigned __int16 v8 = 3;
  }
  if (v3 == 2) {
    unsigned __int16 v8 = 4;
  }
  if (v7 != 3) {
    unsigned __int16 v8 = 0;
  }
  if (v7 >= 3) {
    return v8;
  }
  else {
    return v3;
  }
}

- (void)setKeyAssetShared:(id)a3
{
}

- (void)setKeyAssetShared:(id)a3 userEdited:(BOOL)a4
{
  BOOL v4 = a4;
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = PLObjectIDOrUUIDFromPHObject(a3);
  unsigned int v7 = [(PHPhotosHighlightChangeRequest *)self _mutableKeyAssetObjectIDsAndUUIDsForShared:1 userEdited:v4];
  unsigned __int16 v8 = v7;
  if (v6)
  {
    v10[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v8 addObjectsFromArray:v9];
  }
  else
  {
    [v7 removeAllObjects];
  }
}

- (void)setKeyAssetPrivate:(id)a3
{
}

- (void)setKeyAssetPrivate:(id)a3 userEdited:(BOOL)a4
{
  BOOL v4 = a4;
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = PLObjectIDOrUUIDFromPHObject(a3);
  [(PHChangeRequest *)self didMutate];
  unsigned int v7 = [(PHPhotosHighlightChangeRequest *)self _mutableKeyAssetObjectIDsAndUUIDsForShared:0 userEdited:v4];
  unsigned __int16 v8 = v7;
  if (v6)
  {
    v10[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v8 addObjectsFromArray:v9];
  }
  else
  {
    [v7 removeAllObjects];
  }
}

- (void)setVisibilityStateMixed:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"visibilityStateMixed"];
}

- (unsigned)visibilityStateMixed
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"visibilityStateMixed"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setVisibilityStateShared:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"visibilityStateShared"];
}

- (unsigned)visibilityStateShared
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"visibilityStateShared"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"mixedSharingCompositionKeyAssetRelationship"];
}

- (unsigned)mixedSharingCompositionKeyAssetRelationship
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"mixedSharingCompositionKeyAssetRelationship"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setVerboseSmartDescriptionMixed:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  unsigned int v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"verboseSmartDescriptionMixed"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"verboseSmartDescriptionMixed"];
  }
  else
  {
    [v6 removeObjectForKey:@"verboseSmartDescriptionMixed"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"verboseSmartDescriptionMixed"];
  }
}

- (NSString)verboseSmartDescriptionMixed
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"verboseSmartDescriptionMixed"];

  return (NSString *)v5;
}

- (void)setVerboseSmartDescriptionShared:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  unsigned int v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"verboseSmartDescriptionShared"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"verboseSmartDescriptionShared"];
  }
  else
  {
    [v6 removeObjectForKey:@"verboseSmartDescriptionShared"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"verboseSmartDescriptionShared"];
  }
}

- (NSString)verboseSmartDescriptionShared
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"verboseSmartDescriptionShared"];

  return (NSString *)v5;
}

- (void)setSmartDescriptionMixed:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  unsigned int v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"subtitleMixed"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"subtitleMixed"];
  }
  else
  {
    [v6 removeObjectForKey:@"subtitleMixed"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"subtitleMixed"];
  }
}

- (NSString)smartDescriptionMixed
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"subtitleMixed"];

  return (NSString *)v5;
}

- (void)setSmartDescriptionShared:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  unsigned int v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"subtitleShared"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"subtitleShared"];
  }
  else
  {
    [v6 removeObjectForKey:@"subtitleShared"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"subtitleShared"];
  }
}

- (NSString)smartDescriptionShared
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"subtitleShared"];

  return (NSString *)v5;
}

- (void)setDateDescriptionMixed:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  unsigned int v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"titleMixed"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"titleMixed"];
  }
  else
  {
    [v6 removeObjectForKey:@"titleMixed"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"titleMixed"];
  }
}

- (NSString)dateDescriptionMixed
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"titleMixed"];

  return (NSString *)v5;
}

- (void)setDateDescriptionShared:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  unsigned int v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"titleShared"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"titleShared"];
  }
  else
  {
    [v6 removeObjectForKey:@"titleShared"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"titleShared"];
  }
}

- (NSString)dateDescriptionShared
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"titleShared"];

  return (NSString *)v5;
}

- (void)setKind:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"kind"];
}

- (unsigned)kind
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"kind"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setVisibilityState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"visibilityState"];
}

- (unsigned)visibilityState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"visibilityState"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setEnrichmentVersion:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"enrichmentVersion"];
}

- (signed)enrichmentVersion
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"enrichmentVersion"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setMood:(unint64_t)a3
{
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"mood"];
}

- (unint64_t)mood
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"mood"];

  unint64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setLastEnrichmentDate:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  unint64_t v6 = [v5 mutations];
  unsigned int v7 = v6;
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
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"lastEnrichmentDate"];

  return (NSDate *)v5;
}

- (void)setEnrichmentState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"enrichmentState"];
}

- (unsigned)enrichmentState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"enrichmentState"];

  LOWORD(v3) = [v5 shortValue];
  return (unsigned __int16)v3;
}

- (void)setPromotionScore:(double)a3
{
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  unsigned int v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"promotionScore"];
}

- (double)promotionScore
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"promotionScore"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setVerboseSmartDescription:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  double v6 = [v5 mutations];
  double v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"verboseSmartDescription"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"verboseSmartDescription"];
  }
  else
  {
    [v6 removeObjectForKey:@"verboseSmartDescription"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"verboseSmartDescription"];
  }
}

- (NSString)verboseSmartDescription
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"verboseSmartDescription"];

  return (NSString *)v5;
}

- (void)setSmartDescription:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  double v6 = [v5 mutations];
  double v7 = v6;
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

- (NSString)smartDescription
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"subtitle"];

  return (NSString *)v5;
}

- (void)setDateDescription:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  double v6 = [v5 mutations];
  double v7 = v6;
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

- (NSString)dateDescription
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (NSString)managedEntityName
{
  return (NSString *)@"PhotosHighlight";
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PHPhotosHighlightChangeRequest_encodeToXPCDict___block_invoke;
  aBlock[3] = &unk_1E5841B80;
  id v5 = v4;
  id v27 = v5;
  double v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  double v7 = [(PHChangeRequest *)self helper];
  [v7 encodeToXPCDict:v5];

  id v8 = [(PHPhotosHighlightChangeRequest *)self dayKeyAssetHelper];
  v6[2](v6, v8);

  id v9 = [(PHPhotosHighlightChangeRequest *)self monthKeyAssetHelper];
  v6[2](v6, v9);

  id v10 = [(PHPhotosHighlightChangeRequest *)self yearKeyAssetHelper];
  v6[2](v6, v10);

  int v11 = [(PHPhotosHighlightChangeRequest *)self dayGroupKeyAssetHelper];
  v6[2](v6, v11);

  id v12 = [(PHPhotosHighlightChangeRequest *)self dayKeyAssetSharedHelper];
  v6[2](v6, v12);

  id v13 = [(PHPhotosHighlightChangeRequest *)self monthKeyAssetSharedHelper];
  v6[2](v6, v13);

  id v14 = [(PHPhotosHighlightChangeRequest *)self yearKeyAssetSharedHelper];
  v6[2](v6, v14);

  v15 = [(PHPhotosHighlightChangeRequest *)self dayGroupKeyAssetSharedHelper];
  v6[2](v6, v15);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = [(PHPhotosHighlightChangeRequest *)self curationHelpersByCurationType];
  id v17 = [v16 allValues];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        v6[2](v6, *(void **)(*((void *)&v22 + 1) + 8 * v21++));
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v19);
  }
}

uint64_t __50__PHPhotosHighlightChangeRequest_encodeToXPCDict___block_invoke(uint64_t a1, void *a2)
{
  return [a2 encodeToXPCDict:*(void *)(a1 + 32)];
}

- (PHPhotosHighlightChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PHPhotosHighlightChangeRequest;
  int v11 = [(PHChangeRequest *)&v31 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      id v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssetPrivate" xpcDict:v8 changeRequestHelper:v11->super._helper];
      dayKeyAssetHelper = v11->_dayKeyAssetHelper;
      v11->_dayKeyAssetHelper = v14;

      id v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"monthKeyAssetPrivate" xpcDict:v8 changeRequestHelper:v11->super._helper];
      monthKeyAssetHelper = v11->_monthKeyAssetHelper;
      v11->_monthKeyAssetHelper = v16;

      uint64_t v18 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"yearKeyAssetPrivate" xpcDict:v8 changeRequestHelper:v11->super._helper];
      yearKeyAssetHelper = v11->_yearKeyAssetHelper;
      v11->_yearKeyAssetHelper = v18;

      uint64_t v20 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupKeyAssetPrivate" xpcDict:v8 changeRequestHelper:v11->super._helper];
      dayGroupKeyAssetHelper = v11->_dayGroupKeyAssetHelper;
      v11->_dayGroupKeyAssetHelper = v20;

      long long v22 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssetShared" xpcDict:v8 changeRequestHelper:v11->super._helper];
      dayKeyAssetSharedHelper = v11->_dayKeyAssetSharedHelper;
      v11->_dayKeyAssetSharedHelper = v22;

      long long v24 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"monthKeyAssetShared" xpcDict:v8 changeRequestHelper:v11->super._helper];
      monthKeyAssetSharedHelper = v11->_monthKeyAssetSharedHelper;
      v11->_monthKeyAssetSharedHelper = v24;

      v26 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"yearKeyAssetShared" xpcDict:v8 changeRequestHelper:v11->super._helper];
      yearKeyAssetSharedHelper = v11->_yearKeyAssetSharedHelper;
      v11->_yearKeyAssetSharedHelper = v26;

      v28 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupKeyAssetShared" xpcDict:v8 changeRequestHelper:v11->super._helper];
      dayGroupKeyAssetSharedHelper = v11->_dayGroupKeyAssetSharedHelper;
      v11->_dayGroupKeyAssetSharedHelper = v28;

      [(PHPhotosHighlightChangeRequest *)v11 _initializeCurationHelpersWithHelper:v11->super._helper xpcDict:v8];
    }
  }

  return v11;
}

- (PHPhotosHighlightChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHPhotosHighlightChangeRequest;
  id v8 = [(PHChangeRequest *)&v28 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    int v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssetPrivate" changeRequestHelper:v8->super._helper];
    dayKeyAssetHelper = v8->_dayKeyAssetHelper;
    v8->_dayKeyAssetHelper = v11;

    id v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"monthKeyAssetPrivate" changeRequestHelper:v8->super._helper];
    monthKeyAssetHelper = v8->_monthKeyAssetHelper;
    v8->_monthKeyAssetHelper = v13;

    v15 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"yearKeyAssetPrivate" changeRequestHelper:v8->super._helper];
    yearKeyAssetHelper = v8->_yearKeyAssetHelper;
    v8->_yearKeyAssetHelper = v15;

    id v17 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupKeyAssetPrivate" changeRequestHelper:v8->super._helper];
    dayGroupKeyAssetHelper = v8->_dayGroupKeyAssetHelper;
    v8->_dayGroupKeyAssetHelper = v17;

    uint64_t v19 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssetShared" changeRequestHelper:v8->super._helper];
    dayKeyAssetSharedHelper = v8->_dayKeyAssetSharedHelper;
    v8->_dayKeyAssetSharedHelper = v19;

    uint64_t v21 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"monthKeyAssetShared" changeRequestHelper:v8->super._helper];
    monthKeyAssetSharedHelper = v8->_monthKeyAssetSharedHelper;
    v8->_monthKeyAssetSharedHelper = v21;

    long long v23 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"yearKeyAssetShared" changeRequestHelper:v8->super._helper];
    yearKeyAssetSharedHelper = v8->_yearKeyAssetSharedHelper;
    v8->_yearKeyAssetSharedHelper = v23;

    long long v25 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupKeyAssetShared" changeRequestHelper:v8->super._helper];
    dayGroupKeyAssetSharedHelper = v8->_dayGroupKeyAssetSharedHelper;
    v8->_dayGroupKeyAssetSharedHelper = v25;

    [(PHPhotosHighlightChangeRequest *)v8 _initializeCurationHelpersWithHelper:v8->super._helper xpcDict:0];
  }

  return v8;
}

- (id)initForNewObject
{
  v22.receiver = self;
  v22.super_class = (Class)PHPhotosHighlightChangeRequest;
  v2 = [(PHChangeRequest *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssetPrivate" changeRequestHelper:v2->super._helper];
    dayKeyAssetHelper = v2->_dayKeyAssetHelper;
    v2->_dayKeyAssetHelper = v5;

    id v7 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"monthKeyAssetPrivate" changeRequestHelper:v2->super._helper];
    monthKeyAssetHelper = v2->_monthKeyAssetHelper;
    v2->_monthKeyAssetHelper = v7;

    id v9 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"yearKeyAssetPrivate" changeRequestHelper:v2->super._helper];
    yearKeyAssetHelper = v2->_yearKeyAssetHelper;
    v2->_yearKeyAssetHelper = v9;

    int v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupKeyAssetPrivate" changeRequestHelper:v2->super._helper];
    dayGroupKeyAssetHelper = v2->_dayGroupKeyAssetHelper;
    v2->_dayGroupKeyAssetHelper = v11;

    id v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"yearKeyAssetShared" changeRequestHelper:v2->super._helper];
    yearKeyAssetSharedHelper = v2->_yearKeyAssetSharedHelper;
    v2->_yearKeyAssetSharedHelper = v13;

    v15 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyAssetShared" changeRequestHelper:v2->super._helper];
    dayKeyAssetSharedHelper = v2->_dayKeyAssetSharedHelper;
    v2->_dayKeyAssetSharedHelper = v15;

    id v17 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"monthKeyAssetShared" changeRequestHelper:v2->super._helper];
    monthKeyAssetSharedHelper = v2->_monthKeyAssetSharedHelper;
    v2->_monthKeyAssetSharedHelper = v17;

    uint64_t v19 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupKeyAssetShared" changeRequestHelper:v2->super._helper];
    dayGroupKeyAssetSharedHelper = v2->_dayGroupKeyAssetSharedHelper;
    v2->_dayGroupKeyAssetSharedHelper = v19;

    [(PHPhotosHighlightChangeRequest *)v2 _initializeCurationHelpersWithHelper:v2->super._helper xpcDict:0];
  }
  return v2;
}

- (void)_initializeCurationHelpersWithHelper:(id)a3 xpcDict:(id)a4
{
  id v21 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = (NSDictionary *)objc_alloc_init(v6);
  id v9 = [PHRelationshipChangeRequestHelper alloc];
  if (v21)
  {
    id v10 = [(PHRelationshipChangeRequestHelper *)v9 initWithRelationshipName:@"summaryAssets" xpcDict:v21 changeRequestHelper:v7];
    [(NSDictionary *)v8 setObject:v10 forKeyedSubscript:&unk_1EEB24888];

    int v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"extendedAssets" xpcDict:v21 changeRequestHelper:v7];
    [(NSDictionary *)v8 setObject:v11 forKeyedSubscript:&unk_1EEB248A0];

    id v12 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupAssets" xpcDict:v21 changeRequestHelper:v7];
    [(NSDictionary *)v8 setObject:v12 forKeyedSubscript:&unk_1EEB248B8];

    id v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupExtendedAssets" xpcDict:v21 changeRequestHelper:v7];
    [(NSDictionary *)v8 setObject:v13 forKeyedSubscript:&unk_1EEB248D0];

    id v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupSummaryAssets" xpcDict:v21 changeRequestHelper:v7];
  }
  else
  {
    v15 = [(PHRelationshipChangeRequestHelper *)v9 initWithRelationshipName:@"summaryAssets" changeRequestHelper:v7];
    [(NSDictionary *)v8 setObject:v15 forKeyedSubscript:&unk_1EEB24888];

    id v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"extendedAssets" changeRequestHelper:v7];
    [(NSDictionary *)v8 setObject:v16 forKeyedSubscript:&unk_1EEB248A0];

    id v17 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupAssets" changeRequestHelper:v7];
    [(NSDictionary *)v8 setObject:v17 forKeyedSubscript:&unk_1EEB248B8];

    uint64_t v18 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupExtendedAssets" changeRequestHelper:v7];
    [(NSDictionary *)v8 setObject:v18 forKeyedSubscript:&unk_1EEB248D0];

    id v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"dayGroupSummaryAssets" changeRequestHelper:v7];
  }
  uint64_t v19 = v14;

  [(NSDictionary *)v8 setObject:v19 forKeyedSubscript:&unk_1EEB248E8];
  curationHelpersByCurationType = self->_curationHelpersByCurationType;
  self->_curationHelpersByCurationType = v8;
}

+ (void)deletePhotosHighlights:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)changeRequestForPhotosHighlight:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [PHPhotosHighlightChangeRequest alloc];
    id v5 = [v3 uuid];
    id v6 = [v3 objectID];
    id v7 = [(PHPhotosHighlightChangeRequest *)v4 initWithUUID:v5 objectID:v6];

    [(PHPhotosHighlightChangeRequest *)v7 setOriginalHighlight:v3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end