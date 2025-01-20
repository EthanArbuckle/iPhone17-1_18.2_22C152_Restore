@interface PHPerson
+ (BOOL)managedObjectSupportsCustomUUIDKey;
+ (BOOL)managedObjectSupportsDetectionType;
+ (BOOL)managedObjectSupportsKeyFaces;
+ (BOOL)managedObjectSupportsPersonFilters;
+ (BOOL)managedObjectSupportsTorsoOnly;
+ (Class)propertySetClassForPropertySet:(id)a3;
+ (id)_assetLocalIdentifiersForAssetCollection:(id)a3;
+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3;
+ (id)_convertToPersonSuggestion:(id)a3 photoLibrary:(id)a4;
+ (id)_fetchSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4;
+ (id)_fetchSuggestedPersonsForRecipients:(id)a3 options:(id)a4 photoLibrary:(id)a5;
+ (id)_fetchSuggestedRecipientsForFocusedAssetCollection:(id)a3 assetCollection:(id)a4 options:(id)a5 client:(unint64_t)a6;
+ (id)_momentLocalIdentifiersForAssetCollection:(id)a3;
+ (id)_packageSuggestionList:(id)a3 photoLibrary:(id)a4;
+ (id)_personSuggestionMarkedAsConfirmed:(BOOL)a3 fromPersonSuggestion:(id)a4;
+ (id)_requestSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4;
+ (id)batchFetchContactInferencesForPersons:(id)a3 queryOptions:(unint64_t)a4;
+ (id)batchFetchRelationshipInferencesForPersons:(id)a3;
+ (id)batchFetchSuggestedRecipientsForAssets:(id)a3 options:(id)a4;
+ (id)corePropertiesToFetch;
+ (id)displayNameFromContact:(id)a3;
+ (id)entityKeyMap;
+ (id)fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups:(id)a3 options:(id)a4;
+ (id)fetchFinalMergeTargetPersonsForPersonWithUUID:(id)a3 options:(id)a4;
+ (id)fetchInvalidMergeCandidatePersonsForPerson:(id)a3 options:(id)a4;
+ (id)fetchMePersonWithOptions:(id)a3;
+ (id)fetchMergeCandidatePersonsForPerson:(id)a3 options:(id)a4;
+ (id)fetchMergeCandidateWithConfidencePersonsForPerson:(id)a3 options:(id)a4;
+ (id)fetchPersonAssociatedWithFaceGroup:(id)a3 options:(id)a4;
+ (id)fetchPersonCountGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4;
+ (id)fetchPersonForFaceCrop:(id)a3 options:(id)a4;
+ (id)fetchPersonForShareParticipant:(id)a3 options:(id)a4;
+ (id)fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4;
+ (id)fetchPersonWithFace:(id)a3 options:(id)a4;
+ (id)fetchPersonsForAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchPersonsForContactIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchPersonsForContacts:(id)a3 options:(id)a4;
+ (id)fetchPersonsForReferences:(id)a3 photoLibrary:(id)a4;
+ (id)fetchPersonsGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4;
+ (id)fetchPersonsInAsset:(id)a3 options:(id)a4;
+ (id)fetchPersonsInAssets:(id)a3 options:(id)a4;
+ (id)fetchPersonsInAssetsFetchResult:(id)a3 options:(id)a4;
+ (id)fetchPersonsInSocialGroup:(id)a3 option:(id)a4;
+ (id)fetchPersonsWithAutonamingSuggestionFeatureUserFeedbackWithOptions:(id)a3;
+ (id)fetchPersonsWithFaces:(id)a3 options:(id)a4;
+ (id)fetchPersonsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchPersonsWithMdIDs:(id)a3 options:(id)a4;
+ (id)fetchPersonsWithObjectIDs:(id)a3 options:(id)a4;
+ (id)fetchPersonsWithOptions:(id)a3;
+ (id)fetchPersonsWithQuestionType:(unsigned __int16)a3 options:(id)a4;
+ (id)fetchPersonsWithType:(int64_t)a3 options:(id)a4;
+ (id)fetchPersonsWithUserFeedbackOfAllTypesWithOptions:(id)a3;
+ (id)fetchPersonsWithUserFeedbackWithOptions:(id)a3;
+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4;
+ (id)fetchRejectedPersonsForFace:(id)a3 options:(id)a4;
+ (id)fetchSuggestedPersonsForAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4;
+ (id)fetchSuggestedPersonsForFocusedAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchSuggestedRecipientsForAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchSuggestedRecipientsForFocusedAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4;
+ (id)fullNameFromContact:(id)a3;
+ (id)identifierCode;
+ (id)identifierPropertiesToFetch;
+ (id)localIdentifierExpressionForFetchRequests;
+ (id)managedEntityName;
+ (id)momentCountsByPersonUUIDForPersonsWithUUIDs:(id)a3 afterDate:(id)a4 photoLibrary:(id)a5;
+ (id)personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5;
+ (id)personToKeepForCloudConsistencyFromPersons:(id)a3;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)propertySetAccessorsByPropertySet;
+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (int64_t)_personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5 fromClient:(id)a6 completion:(id)a7;
+ (int64_t)personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5 completion:(id)a6;
+ (int64_t)updateKeyFacesOfPersons:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3;
- (BOOL)isInPersonNamingModel;
- (BOOL)isMe;
- (BOOL)isVerified;
- (Class)changeRequestClass;
- (NSDictionary)contactMatchingDictionary;
- (NSString)displayName;
- (NSString)mdID;
- (NSString)name;
- (NSString)personUri;
- (PHPerson)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (double)isMeConfidence;
- (double)mergeCandidateConfidence;
- (id)_createPropertyObjectOfClass:(Class)a3;
- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)linkedContactWithKeysToFetch:(id)a3;
- (id)objectReference;
- (id)userFeedbackProperties;
- (int64_t)assetSortOrder;
- (int64_t)faceCount;
- (int64_t)type;
- (int64_t)verifiedType;
- (signed)detectionType;
- (signed)keyFacePickSource;
- (unint64_t)manualOrder;
- (unint64_t)persistedSuggestionForClient;
- (unsigned)ageType;
- (unsigned)genderType;
- (unsigned)questionType;
- (unsigned)sexType;
- (void)markAsNeedingKeyFace;
@end

@implementation PHPerson

+ (id)managedEntityName
{
  return @"Person";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_26706 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_26706, &__block_literal_global_26707);
  }
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__26386;
  v9 = __Block_byref_object_dispose__26387;
  id v10 = 0;
  pl_dispatch_sync();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (PHPerson)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PHPerson;
  v9 = [(PHObject *)&v42 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"fullName"];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:@"displayName"];
    displayName = v9->_displayName;
    v9->_displayName = (NSString *)v12;

    uint64_t v14 = [v8 objectForKeyedSubscript:@"personUUID"];
    uuid = v9->super._uuid;
    v9->super._uuid = (NSString *)v14;

    v16 = [v8 objectForKeyedSubscript:@"detectionType"];
    v9->_detectionType = [v16 integerValue];

    v17 = [v8 objectForKeyedSubscript:@"type"];
    v9->_type = [v17 integerValue];

    v18 = [v8 objectForKeyedSubscript:@"manualOrder"];
    v9->_manualOrder = [v18 integerValue];

    v19 = [v8 objectForKeyedSubscript:@"mergeCandidateConfidence"];
    [v19 doubleValue];
    v9->_mergeCandidateConfidence = v20;

    uint64_t v21 = [v8 objectForKeyedSubscript:@"personUri"];
    personUri = v9->_personUri;
    v9->_personUri = (NSString *)v21;

    v23 = [v8 objectForKeyedSubscript:@"inPersonNamingModel"];
    v9->_inPersonNamingModel = [v23 BOOLValue];

    v24 = [v8 objectForKeyedSubscript:@"faceCount"];
    v9->_faceCount = [v24 integerValue];

    v25 = [v8 objectForKeyedSubscript:@"verifiedType"];
    v9->_verifiedType = [v25 integerValue];

    v26 = [v8 objectForKeyedSubscript:@"questionType"];
    v9->_questionType = [v26 integerValue];

    v27 = [v8 objectForKeyedSubscript:@"ageType"];
    v9->_ageType = [v27 integerValue];

    v28 = [v8 objectForKeyedSubscript:@"genderType"];
    v9->_genderType = [v28 integerValue];

    v29 = [v8 objectForKeyedSubscript:@"genderType"];
    v9->_sexType = [v29 integerValue];

    v30 = [v8 objectForKeyedSubscript:@"assetSortOrder"];
    v9->_assetSortOrder = [v30 integerValue];

    uint64_t v31 = [v8 objectForKeyedSubscript:@"contactMatchingDictionary"];
    contactMatchingDictionary = v9->_contactMatchingDictionary;
    v9->_contactMatchingDictionary = (NSDictionary *)v31;

    v33 = [v8 objectForKeyedSubscript:@"keyFacePickSource"];
    v9->_keyFacePickSource = [v33 integerValue];

    v34 = [v8 objectForKeyedSubscript:@"isMeConfidence"];
    [v34 doubleValue];
    v9->_isMeConfidence = v35;

    v36 = [v8 objectForKeyedSubscript:@"suggestedForClientType"];
    unsigned __int16 v37 = [v36 integerValue];

    if (v37 == 1)
    {
      unint64_t v38 = v37;
    }
    else
    {
      if (v37)
      {
LABEL_7:
        uint64_t v39 = [v8 objectForKeyedSubscript:@"mdID"];
        mdID = v9->_mdID;
        v9->_mdID = (NSString *)v39;

        goto LABEL_8;
      }
      unint64_t v38 = 0;
    }
    v9->_persistedSuggestionForClient = v38;
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

+ (BOOL)managedObjectSupportsTorsoOnly
{
  return 1;
}

+ (BOOL)managedObjectSupportsPersonFilters
{
  return 1;
}

+ (BOOL)managedObjectSupportsKeyFaces
{
  return 1;
}

+ (BOOL)managedObjectSupportsDetectionType
{
  return 1;
}

+ (id)identifierCode
{
  return @"070";
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)type
{
  return self->_type;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (NSDictionary)contactMatchingDictionary
{
  return self->_contactMatchingDictionary;
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    uint64_t v7 = [a1 identifierPropertiesToFetch];
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
  id v8 = [a1 corePropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v8];

  if ((v3 & 4) != 0) {
LABEL_4:
  }
    [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
LABEL_5:

  return v5;
}

+ (id)identifierPropertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)identifierPropertiesToFetch_array;

  return v2;
}

+ (id)corePropertiesToFetch
{
  if (corePropertiesToFetch_onceToken_26703 != -1) {
    dispatch_once(&corePropertiesToFetch_onceToken_26703, &__block_literal_global_169);
  }
  v2 = (void *)corePropertiesToFetch_array_26704;

  return v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_1;

  return v2;
}

- (NSString)name
{
  return self->_name;
}

+ (id)fetchPersonsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_210];
}

id __36__PHPerson_fetchPersonsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForPersonsWithOptions:a2];
  char v3 = [v2 executeQuery];

  return v3;
}

void __38__PHPerson_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_26709;
  propertiesToFetchWithHint__propertiesToFetchByHint_26709 = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.personpropertyhints", 0);
  char v3 = (void *)propertiesToFetchWithHint__propertyQueue_26708;
  propertiesToFetchWithHint__propertyQueue_26708 = (uint64_t)v2;
}

void __39__PHPerson_identifierPropertiesToFetch__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"personUUID";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  dispatch_queue_t v2 = (void *)identifierPropertiesToFetch_array;
  identifierPropertiesToFetch_array = v1;
}

void __33__PHPerson_corePropertiesToFetch__block_invoke()
{
  v3[20] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"fullName";
  v3[2] = @"displayName";
  void v3[3] = @"detectionType";
  v3[4] = @"type";
  v3[5] = @"manualOrder";
  v3[6] = @"mergeCandidateConfidence";
  v3[7] = @"personUri";
  v3[8] = @"inPersonNamingModel";
  v3[9] = @"faceCount";
  v3[10] = @"verifiedType";
  v3[11] = @"questionType";
  v3[12] = @"ageType";
  v3[13] = @"genderType";
  v3[14] = @"contactMatchingDictionary";
  v3[15] = @"suggestedForClientType";
  v3[16] = @"mdID";
  v3[17] = @"assetSortOrder";
  v3[18] = @"keyFacePickSource";
  v3[19] = @"isMeConfidence";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:20];
  dispatch_queue_t v2 = (void *)corePropertiesToFetch_array_26704;
  corePropertiesToFetch_array_26704 = v1;
}

void __24__PHPerson_entityKeyMap__block_invoke()
{
  v47[21] = *MEMORY[0x1E4F143B8];
  v19 = [PHEntityKeyMap alloc];
  v45 = @"uuid";
  v46[0] = @"personUUID";
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v47[0] = v24;
  v46[1] = @"detectionType";
  v44 = @"detectionType";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v47[1] = v23;
  v46[2] = @"fullName";
  v43 = @"name";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v47[2] = v22;
  v46[3] = @"displayName";
  objc_super v42 = @"displayName";
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v47[3] = v21;
  v46[4] = @"type";
  v41 = @"type";
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v47[4] = v20;
  v46[5] = @"manualOrder";
  v40 = @"manualOrder";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v47[5] = v18;
  v46[6] = @"mergeCandidateConfidence";
  uint64_t v39 = @"mergeCandidateConfidence";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v47[6] = v17;
  v46[7] = @"personUri";
  unint64_t v38 = @"personUri";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v47[7] = v16;
  v46[8] = @"inPersonNamingModel";
  unsigned __int16 v37 = @"inPersonNamingModel";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v47[8] = v15;
  v46[9] = @"faceCount";
  v36 = @"faceCount";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v47[9] = v14;
  v46[10] = @"verifiedType";
  double v35 = @"verifiedType";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v47[10] = v13;
  v46[11] = @"questionType";
  v34 = @"questionType";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v47[11] = v12;
  v46[12] = @"ageType";
  v33 = @"ageType";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v47[12] = v0;
  v46[13] = @"genderType";
  v32 = @"genderType";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v47[13] = v1;
  v46[14] = @"genderType";
  uint64_t v31 = @"sexType";
  dispatch_queue_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v47[14] = v2;
  v46[15] = @"contactMatchingDictionary";
  v30 = @"contactMatchingDictionary";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v47[15] = v3;
  v46[16] = @"suggestedForClientType";
  v29 = @"persistedSuggestionForClient";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v47[16] = v4;
  v46[17] = @"mdID";
  v28 = @"mdID";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v47[17] = v5;
  v46[18] = @"assetSortOrder";
  v27 = @"assetSortOrder";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v47[18] = v6;
  v46[19] = @"keyFacePickSource";
  v26 = @"keyFacePickSource";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v47[19] = v7;
  v46[20] = @"isMeConfidence";
  v25 = @"isMeConfidence";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v47[20] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:21];
  uint64_t v10 = [(PHEntityKeyMap *)v19 initWithPropertyKeysByEntityKey:v9];
  v11 = (void *)entityKeyMap_pl_once_object_1;
  entityKeyMap_pl_once_object_1 = v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdID, 0);
  objc_storeStrong((id *)&self->_contactMatchingDictionary, 0);
  objc_storeStrong((id *)&self->_personUri, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)mdID
{
  return self->_mdID;
}

- (unint64_t)persistedSuggestionForClient
{
  return self->_persistedSuggestionForClient;
}

- (double)isMeConfidence
{
  return self->_isMeConfidence;
}

- (signed)keyFacePickSource
{
  return self->_keyFacePickSource;
}

- (int64_t)assetSortOrder
{
  return self->_assetSortOrder;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (unsigned)genderType
{
  return self->_genderType;
}

- (unsigned)ageType
{
  return self->_ageType;
}

- (unsigned)questionType
{
  return self->_questionType;
}

- (int64_t)verifiedType
{
  return self->_verifiedType;
}

- (int64_t)faceCount
{
  return self->_faceCount;
}

- (BOOL)isInPersonNamingModel
{
  return self->_inPersonNamingModel;
}

- (NSString)personUri
{
  return self->_personUri;
}

- (double)mergeCandidateConfidence
{
  return self->_mergeCandidateConfidence;
}

- (unint64_t)manualOrder
{
  return self->_manualOrder;
}

- (id)userFeedbackProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:4];
  uint64_t v3 = objc_opt_class();

  return [(PHPerson *)self _createPropertyObjectOfClass:v3];
}

- (id)_createPropertyObjectOfClass:(Class)a3
{
  return [(PHPerson *)self _createPropertyObjectOfClass:a3 preFetchedProperties:0];
}

- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  id v6 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__26386;
  v46 = __Block_byref_object_dispose__26387;
  ph_objc_getAssociatedObject(self, a3);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)v43[5];
  if (!v7)
  {
    id v8 = [(objc_class *)a3 keyPathToPrimaryObject];
    if (v6)
    {
      uint64_t v9 = [[a3 alloc] initWithFetchDictionary:v6 person:self prefetched:1];
      uint64_t v10 = (__CFString *)v43[5];
      v43[5] = v9;
    }
    else
    {
      uint64_t v11 = [(objc_class *)a3 entityName];
      uint64_t v12 = (void *)v11;
      v13 = @"Person";
      if (v11) {
        v13 = (__CFString *)v11;
      }
      uint64_t v14 = v13;

      v15 = (void *)MEMORY[0x1E4F28F60];
      v16 = [(PHObject *)self objectID];
      if (v8) {
        [v15 predicateWithFormat:@"%K == %@", v8, v16];
      }
      else {
      uint64_t v17 = [v15 predicateWithFormat:@"self == %@", v16];
      }

      v18 = [(objc_class *)a3 propertiesToFetch];
      if (objc_opt_respondsToSelector())
      {
        v32 = [(objc_class *)a3 propertiesToSortBy];
        v19 = (void *)v17;
        double v20 = v14;
      }
      else
      {
        v19 = (void *)v17;
        double v20 = v14;
        v32 = 0;
      }
      uint64_t v21 = [(PHObject *)self photoLibrary];
      v22 = [(objc_class *)a3 propertySetName];
      v23 = [v21 objectFetchingManagedObjectContextForObject:self propertySet:v22];

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __62__PHPerson__createPropertyObjectOfClass_preFetchedProperties___block_invoke;
      v33[3] = &unk_1E5845E20;
      uint64_t v10 = v20;
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
    v29 = (void *)v43[5];
    v43[5] = v28;

    uint64_t v7 = (void *)v43[5];
  }
  id v30 = v7;
  _Block_object_dispose(&v42, 8);

  return v30;
}

void __62__PHPerson__createPropertyObjectOfClass_preFetchedProperties___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  [v2 setPredicate:*(void *)(a1 + 40)];
  [v2 setPropertiesToFetch:*(void *)(a1 + 48)];
  [v2 setResultType:2];
  if ([*(id *)(a1 + 56) count]) {
    [v2 setSortDescriptors:*(void *)(a1 + 56)];
  }
  uint64_t v3 = *(void **)(a1 + 64);
  id v13 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v13];
  id v5 = v13;
  if (!v4)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 88) description];
      id v8 = [*(id *)(a1 + 72) uuid];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      v19 = v8;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);
    }
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 88) isToMany])
  {
    uint64_t v14 = @"fetchedResults";
    v15 = v4;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  }
  else
  {
    [v4 firstObject];
  uint64_t v9 = };
  if (!v9) {
LABEL_11:
  }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  uint64_t v10 = [objc_alloc(*(Class *)(a1 + 88)) initWithFetchDictionary:v9 person:*(void *)(a1 + 72) prefetched:0];
  uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)debugDescription
{
  v15.receiver = self;
  v15.super_class = (Class)PHPerson;
  uint64_t v3 = [(PHObject *)&v15 description];
  uint64_t v14 = [(PHPerson *)self name];
  v4 = [(PHPerson *)self displayName];
  id v5 = [(PHObject *)self uuid];
  int64_t v6 = [(PHPerson *)self type];
  int v7 = [(PHPerson *)self detectionType];
  unint64_t v8 = [(PHPerson *)self manualOrder];
  [(PHPerson *)self mergeCandidateConfidence];
  uint64_t v10 = v9;
  uint64_t v11 = [(PHPerson *)self personUri];
  uint64_t v12 = [v3 stringByAppendingFormat:@" name=%@, displayName=%@, identifier=%@, type=%d, detectionType=%d, manualOrder=%d, mergeCandidateConfidence=%lf, personUri=%@, inPersonNamingModel=%d, faceCount=%d, verified=%d", v14, v4, v5, v6, v7, v8, v10, v11, -[PHPerson isInPersonNamingModel](self, "isInPersonNamingModel"), -[PHPerson faceCount](self, "faceCount"), -[PHPerson isVerified](self, "isVerified")];

  return v12;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PHPerson;
  dispatch_queue_t v2 = [(PHObject *)&v4 description];

  return v2;
}

- (id)linkedContactWithKeysToFetch:(id)a3
{
  id v4 = a3;
  id v5 = [(PHObject *)self photoLibrary];
  int64_t v6 = [(id)objc_opt_class() sharedContactStore];

  int v7 = [(PHPerson *)self personUri];
  unint64_t v8 = [v6 unifiedContactWithIdentifier:v7 keysToFetch:v4 error:0];

  if (!v8)
  {
    unint64_t v8 = [MEMORY[0x1E4F8A768] contactWithMatchingDictionary:self->_contactMatchingDictionary keysToFetch:v4 contactStore:v6];
  }

  return v8;
}

- (void)markAsNeedingKeyFace
{
  id v6 = [(PHObject *)self photoLibrary];
  uint64_t v3 = [v6 assetsdClient];
  id v4 = [v3 libraryInternalClient];
  id v5 = [(PHObject *)self uuid];
  [v4 markPersonAsNeedingKeyFace:v5 completionHandler:&__block_literal_global_291];
}

void __32__PHPerson_markAsNeedingKeyFace__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "Error marking person as needing key face: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)isMe
{
  return self->_isMeConfidence > 0.0;
}

- (BOOL)isVerified
{
  return self->_verifiedType != 0;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  char v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [@"PHPersonPropertySetIdentifier" length];
  if ((v3 & 1) != 0 && v5) {
    [v4 addObject:@"PHPersonPropertySetIdentifier"];
  }
  uint64_t v6 = [@"PHPersonPropertySetCore" length];
  if ((v3 & 2) != 0 && v6) {
    [v4 addObject:@"PHPersonPropertySetCore"];
  }
  uint64_t v7 = [@"PHPersonPropertySetUserFeedback" length];
  if ((v3 & 4) != 0 && v7) {
    [v4 addObject:@"PHPersonPropertySetUserFeedback"];
  }
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithSet:v4];

  return v8;
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v3 = a3;
  if ([@"PHPersonPropertySetIdentifier" length]) {
    unint64_t v4 = [v3 containsObject:@"PHPersonPropertySetIdentifier"];
  }
  else {
    unint64_t v4 = 0;
  }
  if ([@"PHPersonPropertySetCore" length]
    && [v3 containsObject:@"PHPersonPropertySetCore"])
  {
    v4 |= 2uLL;
  }
  if ([@"PHPersonPropertySetUserFeedback" length]
    && [v3 containsObject:@"PHPersonPropertySetUserFeedback"])
  {
    v4 |= 4uLL;
  }
  if (![v3 containsObject:@"PHPersonPropertySetIdentifier"]) {
    v4 |= 2uLL;
  }

  return v4;
}

+ (id)propertySetAccessorsByPropertySet
{
  if (propertySetAccessorsByPropertySet_onceToken_26547 != -1) {
    dispatch_once(&propertySetAccessorsByPropertySet_onceToken_26547, &__block_literal_global_327);
  }
  dispatch_queue_t v2 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_26548;

  return v2;
}

void __45__PHPerson_propertySetAccessorsByPropertySet__block_invoke()
{
  void v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHPersonPropertySetIdentifier";
  v2[1] = @"PHPersonPropertySetCore";
  v3[0] = @"self";
  v3[1] = @"self";
  v2[2] = @"PHPersonPropertySetUserFeedback";
  v3[2] = @"userFeedbackProperties";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  uint64_t v1 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_26548;
  propertySetAccessorsByPropertySet_accessorByPropertySetName_26548 = v0;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  uint64_t v3 = propertySetClassForPropertySet__onceToken_26555;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&propertySetClassForPropertySet__onceToken_26555, &__block_literal_global_325);
  }
  uint64_t v5 = [(id)propertySetClassForPropertySet__propertySetClassByPropertySetName_26556 objectForKey:v4];

  return (Class)v5;
}

void __43__PHPerson_propertySetClassForPropertySet___block_invoke()
{
  void v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHPersonPropertySetIdentifier";
  v3[0] = objc_opt_class();
  v2[1] = @"PHPersonPropertySetCore";
  v3[1] = objc_opt_class();
  v2[2] = @"PHPersonPropertySetUserFeedback";
  v3[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  uint64_t v1 = (void *)propertySetClassForPropertySet__propertySetClassByPropertySetName_26556;
  propertySetClassForPropertySet__propertySetClassByPropertySetName_26556 = v0;
}

+ (id)fetchPersonsWithUserFeedbackOfAllTypesWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_315];
}

id __62__PHPerson_fetchPersonsWithUserFeedbackOfAllTypesWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsExclusivePredicate:1];
  uint64_t v3 = +[PHQuery queryForPersonsWithNonNilUserFeedbackWithTypes:&unk_1EEB26B20 options:v2];

  id v4 = [v3 executeQuery];

  return v4;
}

+ (id)fetchPersonsWithAutonamingSuggestionFeatureUserFeedbackWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_306];
}

id __79__PHPerson_fetchPersonsWithAutonamingSuggestionFeatureUserFeedbackWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsExclusivePredicate:1];
  uint64_t v3 = +[PHQuery queryForPersonsWithNonNilUserFeedbackWithTypes:&unk_1EEB26B08 options:v2];

  id v4 = [v3 executeQuery];

  return v4;
}

+ (id)fetchPersonsWithUserFeedbackWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_302];
}

id __52__PHPerson_fetchPersonsWithUserFeedbackWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsExclusivePredicate:1];
  uint64_t v3 = +[PHQuery queryForPersonsWithNonNilUserFeedbackWithTypes:&unk_1EEB26AF0 options:v2];

  id v4 = [v3 executeQuery];

  return v4;
}

+ (id)_fetchSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [v7 photoLibrary];
  if (!v8)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:a1 file:@"PHPerson.m" lineNumber:1272 description:@"Caller need to set a PHPhotoLibrary on options."];
  }
  uint64_t v9 = (void *)[v7 copy];
  [v9 setPersonContext:1];
  [v9 setShouldPrefetchCount:1];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"suggestedForClientType == %d || type == %d", a3, 1);
  [v9 setInternalPredicate:v10];

  uint64_t v11 = +[PHPerson fetchPersonsWithOptions:v9];
  if ((unint64_t)[v11 count] < 0x14)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA80] setWithCapacity:20];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v12 = v11;
    uint64_t v15 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(v12);
          }
          v19 = [*(id *)(*((void *)&v42 + 1) + 8 * i) localIdentifier];
          [v14 addObject:v19];
        }
        uint64_t v16 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v16);
    }

    id v37 = v8;
    __int16 v20 = [v8 librarySpecificFetchOptions];
    [v20 setPersonContext:1];
    [v20 setShouldPrefetchCount:1];
    id v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
    v49[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v49[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    [v20 setSortDescriptors:v23];

    +[PHPerson fetchPersonsWithOptions:v20];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v39;
LABEL_14:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [*(id *)(*((void *)&v38 + 1) + 8 * v28) localIdentifier];
        [v14 addObject:v29];

        if ((unint64_t)[v14 count] > 0x13) {
          break;
        }
        if (v26 == ++v28)
        {
          uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v48 count:16];
          if (v26) {
            goto LABEL_14;
          }
          break;
        }
      }
    }

    uint64_t v8 = v37;
    if ([v14 count] || (uint64_t v32 = objc_msgSend(v37, "countOfUnclusteredFaces")) == 0)
    {
      id v30 = [v14 allObjects];
      uint64_t v31 = +[PHPerson fetchPersonsWithLocalIdentifiers:v30 options:v7];

      id v12 = v31;
      id v13 = v12;
    }
    else
    {
      uint64_t v33 = v32;
      v34 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v47 = v33;
        _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEFAULT, "No persons returned in people home, returning nil fetch result as the library is not analyzed yet; countOfUncl"
          "usteredFaces: %lu",
          buf,
          0xCu);
      }

      id v13 = 0;
    }
  }
  else
  {
    id v12 = v11;
    id v13 = v12;
  }

  return v13;
}

+ (id)_requestSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [v7 photoLibrary];
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"PHPerson.m" lineNumber:1249 description:@"Caller need to set a PHPhotoLibrary on options."];
  }
  id v21 = @"PHPeopleSuggestionClientKey";
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
  v22[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

  uint64_t v11 = [v8 photoAnalysisClient];
  id v18 = 0;
  id v12 = [v11 requestSuggestedPersonsWithOptions:v10 error:&v18];
  id v13 = v18;

  if (v12)
  {
    uint64_t v14 = [a1 _fetchSuggestedPersonsForRecipients:v12 options:v7 photoLibrary:v8];
  }
  else
  {
    uint64_t v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Error requesting suggested persons for client: %@", buf, 0xCu);
    }

    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)fetchSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4
{
  id v6 = a4;
  if (a3 - 4 < 2)
  {
    uint64_t v7 = [a1 _requestSuggestedPersonsForClient:a3 options:v6];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    uint64_t v7 = [a1 _fetchSuggestedPersonsForClient:1 options:v6];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

+ (id)batchFetchContactInferencesForPersons:(id)a3 queryOptions:(unint64_t)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)batchFetchRelationshipInferencesForPersons:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 localIdentifier];
        if (v12) {
          [v4 addObject:v12];
        }
        if (!v8)
        {
          uint64_t v8 = [v11 photoLibrary];

          if (v8)
          {
            uint64_t v8 = [v11 photoLibrary];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  if (![v4 count])
  {
    uint64_t v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "[Person Knowledge] personLocalIdentifiers.count == 0, not requesting contact inferences";
LABEL_25:
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
LABEL_26:
    uint64_t v14 = 0;
    goto LABEL_27;
  }
  if (!v8)
  {
    uint64_t v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "[Person Knowledge] No photo library found for persons";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  id v13 = [v8 photoAnalysisClient];
  id v19 = 0;
  uint64_t v14 = [v13 requestRelationshipInferencesForPersonLocalIdentifiers:v4 error:&v19];
  uint64_t v15 = v19;

  if (v15)
  {
    uint64_t v16 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v15;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "[Person Knowledge] Error requesting relationship inferences for persons: %@", buf, 0xCu);
    }
  }
LABEL_27:

  return v14;
}

+ (id)fetchPersonsForContactIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__PHPerson_fetchPersonsForContactIdentifiers_options___block_invoke;
  v11[3] = &unk_1E58481C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  uint64_t v9 = +[PHObject authorizationAwareFetchResultWithOptions:v7 fetchBlock:v11];

  return v9;
}

id __54__PHPerson_fetchPersonsForContactIdentifiers_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForPersonsWithContactIdentifiers:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  id v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchPersonsForContacts:(id)a3 options:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "identifier", (void)v17);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [a1 fetchPersonsForContactIdentifiers:v8 options:v7];

  return v15;
}

+ (id)displayNameFromContact:(id)a3
{
  return (id)[MEMORY[0x1E4F8AA10] displayNameFromContact:a3];
}

+ (id)fullNameFromContact:(id)a3
{
  return (id)[MEMORY[0x1E4F8AA10] fullNameFromContact:a3];
}

+ (id)personToKeepForCloudConsistencyFromPersons:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v6)
        {
          uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) uuid];
          uint64_t v11 = [v6 uuid];
          uint64_t v12 = [v10 compare:v11];

          if (v12 != -1) {
            continue;
          }
        }
        id v13 = v9;

        id v6 = v13;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)fetchPersonCountGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v16 = [v15 uuid];
        [v8 addObject:v16];

        if (!v12) {
          id v12 = v15;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v11);

    if (v12)
    {
      if (v7)
      {
        long long v17 = +[PHQuery queryForPersonsWithOptions:v7];
        long long v18 = [v17 fetchRequest];
      }
      else
      {
        long long v18 = 0;
      }
      uint64_t v22 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v12];
      long long v23 = [v22 photoLibrary];
      id v24 = (void *)MEMORY[0x1E4F8AA10];
      v34 = v18;
      uint64_t v25 = [v18 predicate];
      uint64_t v26 = [v7 includedDetectionTypes];
      id v37 = 0;
      uint64_t v27 = [v24 fetchPersonCountByAssetUUIDForAssetUUIDs:v8 predicate:v25 includedDetectionTypes:v26 library:v23 error:&v37];
      id v28 = v37;

      if (v27)
      {
        v29 = v28;
        id v30 = [MEMORY[0x1E4F1CA60] dictionary];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __75__PHPerson_fetchPersonCountGroupedByAssetLocalIdentifierForAssets_options___block_invoke;
        v35[3] = &unk_1E5845DD8;
        uint64_t v31 = v30;
        id v36 = v31;
        [v27 enumerateKeysAndObjectsUsingBlock:v35];
        uint64_t v32 = v36;
      }
      else
      {
        uint64_t v32 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v28;
          id v43 = v28;
          _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "Error fetching person counts by asset: %@", buf, 0xCu);
        }
        else
        {
          v29 = v28;
        }
        uint64_t v31 = 0;
      }

      long long v19 = v31;
      long long v21 = v19;
      goto LABEL_25;
    }
  }
  else
  {
  }
  long long v19 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v43 = v20;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Cannot run without assets %@", buf, 0xCu);
  }
  long long v21 = MEMORY[0x1E4F1CC08];
LABEL_25:

  return v21;
}

void __75__PHPerson_fetchPersonCountGroupedByAssetLocalIdentifierForAssets_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = +[PHObject localIdentifierWithUUID:a2];
  [v4 setObject:v5 forKeyedSubscript:v6];
}

+ (id)fetchPersonsGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = __Block_byref_object_copy__26386;
  long long v41 = __Block_byref_object_dispose__26387;
  id v42 = 0;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v11)
  {
    id v28 = a1;
    id v12 = 0;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "uuid", v28);
        [v9 addObject:v16];

        if (!v12) {
          id v12 = v15;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v11);

    if (v12)
    {
      if (v8)
      {
        long long v17 = +[PHQuery queryForPersonsWithOptions:v8];
        long long v18 = [v17 fetchRequest];
      }
      else
      {
        long long v18 = 0;
      }
      long long v21 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v8 object:v12];
      uint64_t v22 = (void *)MEMORY[0x1E4F8AA10];
      long long v23 = [v18 predicate];
      id v24 = [v8 includedDetectionTypes];
      uint64_t v25 = [v21 photoLibrary];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __71__PHPerson_fetchPersonsGroupedByAssetLocalIdentifierForAssets_options___block_invoke;
      v29[3] = &unk_1E5845DB0;
      uint64_t v31 = &v37;
      id v26 = v21;
      id v30 = v26;
      id v32 = v28;
      [v22 batchFetchPersonsByAssetUUIDWithAssetUUIDs:v9 predicate:v23 includedDetectionTypes:v24 library:v25 completion:v29];

      id v20 = (id)v38[5];
      goto LABEL_19;
    }
  }
  else
  {
  }
  id v12 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    long long v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    long long v44 = v19;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Cannot run without assets %@", buf, 0xCu);
  }
  id v20 = (id)MEMORY[0x1E4F1CC08];
LABEL_19:

  _Block_object_dispose(&v37, 8);

  return v20;
}

void __71__PHPerson_fetchPersonsGroupedByAssetLocalIdentifierForAssets_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__PHPerson_fetchPersonsGroupedByAssetLocalIdentifierForAssets_options___block_invoke_2;
    v11[3] = &unk_1E5845D88;
    id v12 = *(id *)(a1 + 32);
    long long v13 = *(_OWORD *)(a1 + 40);
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
    id v10 = v12;
  }
  else
  {
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Error batch fetching person groups by asset: %@", buf, 0xCu);
    }
  }
}

void __71__PHPerson_fetchPersonsGroupedByAssetLocalIdentifierForAssets_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[PHObject localIdentifierWithUUID:a2];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
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
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
        uint64_t v14 = [PHPersonPLAdapter alloc];
        id v15 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:](v14, "initWithPLManagedObject:photoLibrary:", v13, *(void *)(a1 + 32), (void)v18);
        uint64_t v16 = (void *)[objc_alloc(*(Class *)(a1 + 48)) initWithFetchDictionary:v15 propertyHint:2 photoLibrary:*(void *)(a1 + 32)];
        [v7 addObject:v16];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  long long v17 = [[PHManualFetchResult alloc] initWithObjects:v7 photoLibrary:*(void *)(a1 + 32) fetchType:@"PHPerson" fetchPropertySets:0 identifier:0 registerIfNeeded:1];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v17 forKeyedSubscript:v6];
}

+ (id)fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K != %d) && (%K >= 1)", @"personForFace.verifiedType", 0, @"personForFace.faceCount");
    uint64_t v9 = [v7 internalPredicate];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
      v16[0] = v8;
      v16[1] = v9;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      id v13 = [v11 andPredicateWithSubpredicates:v12];
    }
    else
    {
      id v13 = v8;
    }
    [v7 setInternalPredicate:v13];
    uint64_t v14 = [a1 fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v6 options:v7];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v14;
}

+ (id)fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__26386;
  uint64_t v22 = __Block_byref_object_dispose__26387;
  id v23 = 0;
  id v8 = [v7 photoLibrary];
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F8AA10];
    uint64_t v10 = [v7 internalPredicate];
    uint64_t v11 = [v7 includedDetectionTypes];
    uint64_t v12 = [v8 managedObjectContextForCurrentQueueQoS];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__PHPerson_fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs_options___block_invoke;
    v17[3] = &unk_1E5845D60;
    v17[4] = &v18;
    [v9 batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:v6 predicate:v10 includedDetectionTypes:v11 inManagedObjectContext:v12 completion:v17];

    id v13 = (id)v19[5];
  }
  else
  {
    uint64_t v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v15;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "No photo library in %@", buf, 0xCu);
    }
    id v13 = 0;
  }

  _Block_object_dispose(&v18, 8);

  return v13;
}

void __68__PHPerson_fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (v6)
  {
    uint64_t v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching person uuids groups by assets: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

+ (id)momentCountsByPersonUUIDForPersonsWithUUIDs:(id)a3 afterDate:(id)a4 photoLibrary:(id)a5
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a4;
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v9 = [MEMORY[0x1E4F8A7B0] entityName];
  int v10 = [v8 fetchRequestWithEntityName:v9];

  [v10 setResultType:2];
  uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K IN %@", @"personForFace", @"personUUID", v28];
  uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K.%K > %@", @"assetForFace", @"moment", @"startDate", v27];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  v41[0] = v26;
  v41[1] = v25;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  id v13 = [v11 andPredicateWithSubpredicates:v12];
  [v10 setPredicate:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v14 setName:@"personUUID"];
  id v15 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionWithFormat:", @"%K.%K", @"personForFace", @"personUUID");
  [v14 setExpression:v15];

  [v14 setExpressionResultType:700];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v16 setName:@"momentUUID"];
  long long v17 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionWithFormat:", @"%K.%K.uuid", @"assetForFace", @"moment");
  [v16 setExpression:v17];

  [v16 setExpressionResultType:700];
  v40[0] = v14;
  v40[1] = v16;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  [v10 setPropertiesToGroupBy:v18];

  v39[0] = v14;
  v39[1] = v16;
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [v10 setPropertiesToFetch:v19];

  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__26386;
  uint64_t v37 = __Block_byref_object_dispose__26387;
  id v38 = 0;
  uint64_t v20 = [v7 photoLibrary];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __79__PHPerson_momentCountsByPersonUUIDForPersonsWithUUIDs_afterDate_photoLibrary___block_invoke;
  v29[3] = &unk_1E5848318;
  id v21 = v7;
  id v30 = v21;
  id v22 = v10;
  id v31 = v22;
  id v32 = &v33;
  [v20 performBlockAndWait:v29];

  id v23 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v23;
}

void __79__PHPerson_momentCountsByPersonUUIDForPersonsWithUUIDs_afterDate_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = [v2 managedObjectContext];
  uint64_t v4 = *(void *)(a1 + 40);
  id v37 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v37];
  id v6 = v37;

  if (v5)
  {
    id v27 = v6;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    int v10 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v28 = v5;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v17 = objc_msgSend(v16, "objectForKeyedSubscript:", @"personUUID", v27);
          if (v17)
          {
            uint64_t v18 = [v16 objectForKeyedSubscript:@"momentUUID"];

            if (v18) {
              [v10 addObject:v17];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v13);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v19 = [v10 allObjects];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          uint64_t v25 = -[NSObject countForObject:](v10, "countForObject:", v24, v27);
          if (v25)
          {
            uint64_t v26 = [NSNumber numberWithUnsignedInteger:v25];
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v26 forKeyedSubscript:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v40 count:16];
      }
      while (v21);
    }

    id v6 = v27;
    id v5 = v28;
  }
  else
  {
    int v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v6;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Error batch fetching moment counts by person uuids: %@", buf, 0xCu);
    }
  }
}

+ (id)_fetchSuggestedRecipientsForFocusedAssetCollection:(id)a3 assetCollection:(id)a4 options:(id)a5 client:(unint64_t)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v10;
  }
  long long v33 = [v13 photoLibrary];
  long long v32 = [v33 photoAnalysisClient];
  uint64_t v14 = (void *)MEMORY[0x1E4F1CA60];
  id v15 = [NSNumber numberWithUnsignedInteger:a6];
  id v16 = [v14 dictionaryWithObject:v15 forKey:@"PHPeopleSuggestionClientKey"];

  if (v12)
  {
    uint64_t v17 = [v12 sharingStream];
    if (v17)
    {
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:v17];
      [v16 setObject:v18 forKey:@"PHSuggestedRecipientsSharingStreamKey"];
    }
  }
  if (v10)
  {
    long long v19 = [a1 _assetLocalIdentifiersForAssetCollection:v10];
LABEL_11:
    uint64_t v20 = [a1 _momentLocalIdentifiersForAssetCollection:v13];
    *(void *)uint64_t v47 = 0;
    v48 = v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__26386;
    uint64_t v51 = __Block_byref_object_dispose__26387;
    id v52 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3032000000;
    long long v44 = __Block_byref_object_copy__26386;
    uint64_t v45 = __Block_byref_object_dispose__26387;
    id v46 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PHPerson__fetchSuggestedRecipientsForFocusedAssetCollection_assetCollection_options_client___block_invoke;
    block[3] = &unk_1E5845D38;
    id v39 = &v41;
    id v35 = v32;
    id v21 = v19;
    id v36 = v21;
    uint64_t v22 = v20;
    id v37 = v22;
    id v38 = v16;
    long long v40 = v47;
    dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
    uint64_t v24 = dispatch_get_global_queue(21, 0);
    dispatch_async(v24, v23);

    if (qos_class_self() < 0x16) {
      dispatch_time_t v25 = -1;
    }
    else {
      dispatch_time_t v25 = dispatch_time(0, 150000000);
    }
    uint64_t v26 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      dispatch_time_t v54 = v25;
      _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEFAULT, "Calling requestSuggestedRecipientsForAssetLocalIdentifiers with timeout %llu", buf, 0xCu);
    }

    if (dispatch_block_wait(v23, v25))
    {
      id v27 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        dispatch_time_t v54 = (dispatch_time_t)v22;
        _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "Timeout while requesting suggested recipients for moment identifier %@", buf, 0xCu);
      }
    }
    if (*((void *)v48 + 5))
    {
      id v28 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = *((void *)v48 + 5);
        *(_DWORD *)buf = 138412546;
        dispatch_time_t v54 = (dispatch_time_t)v22;
        __int16 v55 = 2112;
        uint64_t v56 = v29;
        _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_ERROR, "Can't request suggested recipients for moment identifier %@: %@", buf, 0x16u);
      }
    }
    id v30 = (id)v42[5];

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(v47, 8);

    goto LABEL_25;
  }
  if (v11)
  {
    long long v19 = 0;
    uint64_t v13 = v11;
    goto LABEL_11;
  }
  uint64_t v22 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Can't suggest recipients without valid input collection.", v47, 2u);
  }
  id v30 = 0;
LABEL_25:

  return v30;
}

void __94__PHPerson__fetchSuggestedRecipientsForFocusedAssetCollection_assetCollection_options_client___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[9] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  uint64_t v7 = [v2 requestSuggestedRecipientsForAssetLocalIdentifiers:v3 momentLocalIdentifiers:v4 options:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[8] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

+ (id)_fetchSuggestedPersonsForRecipients:(id)a3 options:(id)a4 photoLibrary:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v34 + 1) + 8 * i) objectForKeyedSubscript:@"localIdentifier"];
          if ([v16 length]) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v13);
    }

    uint64_t v17 = +[PHPerson fetchPersonsWithLocalIdentifiers:v10 options:v8];
    uint64_t v18 = [v17 fetchedObjects];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__PHPerson__fetchSuggestedPersonsForRecipients_options_photoLibrary___block_invoke;
    v32[3] = &unk_1E5845CE8;
    id v33 = v10;
    id v19 = v10;
    uint64_t v20 = [v18 sortedArrayUsingComparator:v32];
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __69__PHPerson__fetchSuggestedPersonsForRecipients_options_photoLibrary___block_invoke_2;
    id v30 = &unk_1E5845D10;
    id v31 = v21;
    id v22 = v21;
    [v20 enumerateObjectsUsingBlock:&v27];
    dispatch_block_t v23 = [PHManualFetchResult alloc];
    uint64_t v24 = objc_msgSend(v8, "fetchPropertySetsAsSet", v27, v28, v29, v30);
    dispatch_time_t v25 = [(PHManualFetchResult *)v23 initWithOids:v22 photoLibrary:v9 fetchType:@"PHPerson" fetchPropertySets:v24 identifier:0 registerIfNeeded:1];
  }
  else
  {
    dispatch_time_t v25 = 0;
  }

  return v25;
}

uint64_t __69__PHPerson__fetchSuggestedPersonsForRecipients_options_photoLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 localIdentifier];
  id v7 = [v5 localIdentifier];

  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];
  unint64_t v9 = [*(id *)(a1 + 32) indexOfObject:v7];
  if (v8 < v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = v8 > v9;
  }

  return v10;
}

void __69__PHPerson__fetchSuggestedPersonsForRecipients_options_photoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectID];
  [v2 addObject:v3];
}

+ (id)batchFetchSuggestedRecipientsForAssets:(id)a3 options:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PHMoment fetchMomentUUIDByAssetUUIDForAssets:v5 options:0];
  if ([v7 count])
  {
    unint64_t v8 = [v6 photoLibrary];
    unint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:&unk_1EEB25AE8 forKey:@"PHPeopleSuggestionClientKey"];
    if (v6)
    {
      uint64_t v10 = [v6 sharingStream];
      if (v10)
      {
        id v11 = [NSNumber numberWithUnsignedInteger:v10];
        [v9 setObject:v11 forKey:@"PHSuggestedRecipientsSharingStreamKey"];
      }
    }
    if (!v8)
    {
      memset(v19, 0, sizeof(v19));
      id v12 = v5;
      if ([v12 countByEnumeratingWithState:v19 objects:v24 count:16])
      {
        unint64_t v8 = [**((id **)&v19[0] + 1) photoLibrary];
      }
      else
      {
        unint64_t v8 = 0;
      }
    }
    uint64_t v14 = [v8 photoAnalysisClient];
    id v18 = 0;
    uint64_t v13 = [v14 requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:v7 options:v9 error:&v18];
    id v15 = v18;
    if (v15)
    {
      id v16 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v7;
        __int16 v22 = 2112;
        id v23 = v15;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Can't request suggested recipients for momentUUIDByAssetUUID %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    unint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Can't suggest recipients without valid input: %@", buf, 0xCu);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)fetchSuggestedRecipientsForFocusedAssetCollection:(id)a3 options:(id)a4
{
  return (id)[a1 _fetchSuggestedRecipientsForFocusedAssetCollection:a3 assetCollection:0 options:a4 client:2];
}

+ (id)fetchSuggestedRecipientsForAssetCollection:(id)a3 options:(id)a4
{
  return (id)[a1 _fetchSuggestedRecipientsForFocusedAssetCollection:0 assetCollection:a3 options:a4 client:2];
}

+ (id)fetchSuggestedPersonsForFocusedAssetCollection:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [a1 _fetchSuggestedRecipientsForFocusedAssetCollection:v6 assetCollection:0 options:v7 client:3];
  if (v8)
  {
    unint64_t v9 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v6];
    uint64_t v10 = [a1 _fetchSuggestedPersonsForRecipients:v8 options:v7 photoLibrary:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)fetchSuggestedPersonsForAssetCollection:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [a1 _fetchSuggestedRecipientsForFocusedAssetCollection:0 assetCollection:v6 options:v7 client:3];
  if (v8)
  {
    unint64_t v9 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v6];
    uint64_t v10 = [a1 _fetchSuggestedPersonsForRecipients:v8 options:v7 photoLibrary:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_momentLocalIdentifiersForAssetCollection:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 assetCollectionType] != 3)
  {
    if ([v3 assetCollectionType] == 5)
    {
      id v5 = [v3 momentLocalIdentifiers];
      goto LABEL_21;
    }
    id v6 = [v3 photoLibrary];
    uint64_t v4 = [v6 librarySpecificFetchOptions];

    id v23 = @"PHAssetPropertySetIdentifier";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v4 setFetchPropertySets:v7];

    [v4 setWantsIncrementalChangeDetails:0];
    [v4 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
    [v4 setChunkSizeForFetch:2000];
    if ([v3 assetCollectionType] == 6)
    {
      uint64_t v8 = +[PHAssetCollection fetchMomentsInHighlight:v3 options:v4];
    }
    else if ([v3 assetCollectionType] == 4)
    {
      uint64_t v8 = +[PHAssetCollection fetchMomentsBackingMemory:v3 options:v4];
    }
    else
    {
      if ([v3 assetCollectionType] != 8)
      {
        uint64_t v17 = +[PHAsset fetchAssetsInAssetCollection:v3 options:v4];
        unint64_t v9 = +[PHAssetCollection fetchAssetCollectionsContainingAssets:v17 withType:3 options:v4];

        goto LABEL_12;
      }
      uint64_t v8 = +[PHAssetCollection fetchMomentsBackingSuggestion:v3 options:v4];
    }
    unint64_t v9 = (void *)v8;
LABEL_12:
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "localIdentifier", (void)v18);
          [v5 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    goto LABEL_20;
  }
  uint64_t v4 = [v3 localIdentifier];
  v24[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
LABEL_20:

LABEL_21:

  return v5;
}

+ (id)_assetLocalIdentifiersForAssetCollection:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 photoLibrary];
  id v5 = [v4 librarySpecificFetchOptions];

  v21[0] = @"PHAssetPropertySetIdentifier";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v5 setFetchPropertySets:v6];

  [v5 setWantsIncrementalChangeDetails:0];
  [v5 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
  [v5 setChunkSizeForFetch:2000];
  id v7 = +[PHAsset fetchAssetsInAssetCollection:v3 options:v5];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "localIdentifier", (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)fetchFinalMergeTargetPersonsForPersonWithUUID:(id)a3 options:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__26386;
  uint64_t v28 = __Block_byref_object_dispose__26387;
  id v29 = 0;
  uint64_t v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:0];
  id v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 managedObjectContextForCurrentQueueQoS];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__PHPerson_fetchFinalMergeTargetPersonsForPersonWithUUID_options___block_invoke;
    v17[3] = &unk_1E5848138;
    id v18 = v6;
    id v11 = v10;
    id v19 = v11;
    id v20 = v7;
    id v21 = v9;
    __int16 v22 = &v24;
    id v23 = a1;
    [v11 performBlockAndWait:v17];
  }
  if (v25[5])
  {
    v30[0] = v25[5];
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v13 = [PHManualFetchResult alloc];
  uint64_t v14 = [v7 fetchPropertySetsAsSet];
  id v15 = [(PHManualFetchResult *)v13 initWithObjects:v12 photoLibrary:v9 fetchType:@"PHPerson" fetchPropertySets:v14 identifier:0 registerIfNeeded:1];

  _Block_object_dispose(&v24, 8);

  return v15;
}

void __66__PHPerson_fetchFinalMergeTargetPersonsForPersonWithUUID_options___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F8AA10];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) predicate];
  id v11 = [v2 fetchFinalMergeTargetPersonForPersonWithUUID:v3 context:v4 predicate:v5];

  if (v11)
  {
    id v6 = [(PHObjectPLAdapter *)[PHPersonPLAdapter alloc] initWithPLManagedObject:v11 photoLibrary:*(void *)(a1 + 56)];
    id v7 = [*(id *)(a1 + 48) fetchPropertySetsAsSet];
    uint64_t v8 = objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithFetchDictionary:propertyHint:photoLibrary:", v6, +[PHPerson propertyFetchHintsForPropertySets:](PHPerson, "propertyFetchHintsForPropertySets:", v7), *(void *)(a1 + 56));
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

+ (id)fetchInvalidMergeCandidatePersonsForPerson:(id)a3 options:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHQuery queryForInvalidMergeCandidatePersonsForPerson:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fetchMergeCandidateWithConfidencePersonsForPerson:(id)a3 options:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHQuery queryForMergeCandidateWithConfidencePersonsForPerson:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fetchMergeCandidatePersonsForPerson:(id)a3 options:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHQuery queryForMergeCandidatePersonsForPerson:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups:(id)a3 options:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a4;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__26386;
  uint64_t v39 = __Block_byref_object_dispose__26387;
  id v40 = 0;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v45 count:16];
  id v23 = a1;
  id v9 = 0;
  if (v8)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (!v9) {
          id v9 = v12;
        }
        uint64_t v13 = objc_msgSend(v12, "localIdentifier", v23);
        uint64_t v14 = +[PHObject uuidFromLocalIdentifier:v13];
        if (v14)
        {
          [v7 addObject:v14];
        }
        else
        {
          id v15 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v42 = v12;
            __int16 v43 = 2112;
            long long v44 = v13;
            _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Cannot have uuid == nil for a PHFaceGroup. Skipping faceGroup: %@ with localIdentifier: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v45 count:16];
    }
    while (v8);
  }

  long long v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v24 object:v9];
  long long v17 = (void *)MEMORY[0x1E4F8AA10];
  id v18 = [v16 photoLibrary];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__PHPerson_fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups_options___block_invoke;
  v26[3] = &unk_1E5845CC0;
  id v29 = &v35;
  id v19 = v16;
  id v27 = v19;
  id v20 = v24;
  id v28 = v20;
  id v30 = v23;
  [v17 batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs:v7 predicate:0 library:v18 completion:v26];

  id v21 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v21;
}

void __89__PHPerson_fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__PHPerson_fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups_options___block_invoke_2;
    v11[3] = &unk_1E5845C98;
    uint64_t v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    long long v14 = *(_OWORD *)(a1 + 48);
    [v5 enumerateKeysAndObjectsUsingBlock:v11];

    uint64_t v10 = v12;
  }
  else
  {
    uint64_t v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Error batch fetching associated person by face group: %@", buf, 0xCu);
    }
  }
}

void __89__PHPerson_fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[PHObject localIdentifierWithUUID:a2];
  uint64_t v7 = [(PHObjectPLAdapter *)[PHPersonPLAdapter alloc] initWithPLManagedObject:v5 photoLibrary:*(void *)(a1 + 32)];

  uint64_t v8 = [*(id *)(a1 + 40) fetchPropertySetsAsSet];
  id v9 = objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithFetchDictionary:propertyHint:photoLibrary:", v7, +[PHPerson propertyFetchHintsForPropertySets:](PHPerson, "propertyFetchHintsForPropertySets:", v8), *(void *)(a1 + 32));
  uint64_t v10 = [PHManualFetchResult alloc];
  v13[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v12 = [(PHManualFetchResult *)v10 initWithObjects:v11 photoLibrary:*(void *)(a1 + 32) fetchType:@"PHPerson" fetchPropertySets:v8 identifier:0 registerIfNeeded:1];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v6];
}

+ (id)fetchPersonAssociatedWithFaceGroup:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PHPerson_fetchPersonAssociatedWithFaceGroup_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __55__PHPerson_fetchPersonAssociatedWithFaceGroup_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForAssociatedPersonForFaceGroup:*(void *)(a1 + 32) withOptions:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchPersonForFaceCrop:(id)a3 options:(id)a4
{
  uint64_t v4 = +[PHQuery queryForPersonForFaceCrop:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchRejectedPersonsForFace:(id)a3 options:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHQuery queryForRejectedPersonsForFace:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fetchPersonsWithFaces:(id)a3 options:(id)a4
{
  uint64_t v4 = +[PHQuery queryForPersonsWithFaces:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchPersonWithFace:(id)a3 options:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHQuery queryForPersonWithFace:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fetchPersonForShareParticipant:(id)a3 options:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHQuery queryForPersonWithShareParticipant:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fetchPersonsInSocialGroup:(id)a3 option:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHGraphQuery graphQueryForPersonsInSocialGroup:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fetchPersonsForAssetCollection:(id)a3 options:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = [v5 photoLibrary];
    uint64_t v8 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v7 orObject:v6];

    id v9 = +[PHAsset fetchAssetsInAssetCollection:v6 options:v8];

    if ([v9 count])
    {
      id v10 = +[PHQuery queryForPersonsInAssetsFetchResult:v9 withOptions:v5];
      id v11 = [v10 executeQuery];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)fetchPersonsInAssetsFetchResult:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = +[PHQuery queryForPersonsInAssetsFetchResult:v5 withOptions:v6];
    uint64_t v8 = [v7 executeQuery];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)fetchPersonsInAssets:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = +[PHQuery queryForPersonsInAssets:v5 withOptions:v6];
    uint64_t v8 = [v7 executeQuery];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)fetchPersonsInAsset:(id)a3 options:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHQuery queryForPersonsInAsset:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fetchPersonsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PHPerson_fetchPersonsWithObjectIDs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __46__PHPerson_fetchPersonsWithObjectIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForPersonsWithObjectIDs:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchPersonsWithMdIDs:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 photoLibrary];

  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PHPerson.m", 473, @"Invalid parameter not satisfying: %@", @"options.photoLibrary" object file lineNumber description];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__PHPerson_fetchPersonsWithMdIDs_options___block_invoke;
  v14[3] = &unk_1E5849048;
  id v15 = v7;
  id v10 = v7;
  id v11 = +[PHObject authorizationAwareFetchResultWithOptions:v8 fetchBlock:v14];

  return v11;
}

id __42__PHPerson_fetchPersonsWithMdIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForPersonsWithMdIDs:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchPersonsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PHPerson_fetchPersonsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __53__PHPerson_fetchPersonsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForPersonsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchPersonsWithQuestionType:(unsigned __int16)a3 options:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PHPerson_fetchPersonsWithQuestionType_options___block_invoke;
  v6[3] = &__block_descriptor_34_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  unsigned __int16 v7 = a3;
  uint64_t v4 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v6];

  return v4;
}

id __49__PHPerson_fetchPersonsWithQuestionType_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForPersonsWithQuestionType:*(unsigned __int16 *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchPersonsWithType:(int64_t)a3 options:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PHPerson_fetchPersonsWithType_options___block_invoke;
  v6[3] = &__block_descriptor_40_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  void v6[4] = a3;
  uint64_t v4 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v6];

  return v4;
}

id __41__PHPerson_fetchPersonsWithType_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForPersonsWithType:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchMePersonWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_206_26676];
}

id __37__PHPerson_fetchMePersonWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F8AA10];
  id v3 = a2;
  uint64_t v4 = [v2 predicateForMePerson];
  [v3 setPredicate:v4];

  id v5 = +[PHQuery queryForPersonsWithOptions:v3];

  id v6 = [v5 executeQuery];

  return v6;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___PHPerson;
  unsigned __int16 v7 = objc_msgSendSuper2(&v21, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  if (!v7)
  {
    id v8 = [v6 leftExpression];
    id v9 = [v6 rightExpression];
    if ([v8 expressionType] == 3)
    {
      id v10 = [v8 keyPath];
    }
    else
    {
      id v10 = 0;
    }
    if ([v10 isEqualToString:@"verified"] && !objc_msgSend(v9, "expressionType"))
    {
      long long v14 = [v9 constantValue];
      if ([v14 BOOLValue]) {
        id v15 = @"verifiedType != %d";
      }
      else {
        id v15 = @"noindex:(verifiedType) == %d";
      }
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v15, 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    if ([v10 isEqualToString:@"verifiedType"])
    {
      if ([v9 expressionType])
      {
        id v11 = 0;
      }
      else
      {
        id v16 = [v9 constantValue];
        id v11 = v16;
        if (v16 && ![v16 intValue])
        {
          uint64_t v17 = (void *)MEMORY[0x1E4F28C68];
          v22[0] = v8;
          id v18 = (void *)MEMORY[0x1E4F1C978];
          id v19 = v8;
          id v20 = [v18 arrayWithObjects:v22 count:1];
          id v8 = [v17 expressionForFunction:@"noindex:" arguments:v20];
        }
      }
      unsigned __int16 v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B98]), "initWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, objc_msgSend(v6, "comparisonPredicateModifier"), objc_msgSend(v6, "predicateOperatorType"), objc_msgSend(v6, "options"));
    }
    else
    {
      unsigned __int16 v7 = 0;
    }
  }
  id v12 = v7;
LABEL_14:

  return v12;
}

+ (id)localIdentifierExpressionForFetchRequests
{
  return (id)[MEMORY[0x1E4F28C68] expressionForKeyPath:@"personUUID"];
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PHPerson_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_26691 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_26691, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_26692 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __48__PHPerson_transformValueExpression_forKeyPath___block_invoke()
{
  v4[14] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"name";
  v4[1] = @"displayName";
  v4[2] = @"uuid";
  v4[3] = @"detectionType";
  v4[4] = @"type";
  v4[5] = @"manualOrder";
  v4[6] = @"mergeCandidateConfidence";
  v4[7] = @"personUri";
  v4[8] = @"inPersonNamingModel";
  v4[9] = @"faceCount";
  v4[10] = @"contactMatchingDictionary";
  v4[11] = @"persistedSuggestionForClient";
  v4[12] = @"keyFacePickSource";
  v4[13] = @"isMeConfidence";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:14];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_26692;
  transformValueExpression_forKeyPath___passThroughSet_26692 = v2;
}

+ (BOOL)managedObjectSupportsCustomUUIDKey
{
  return 1;
}

void __38__PHPerson_propertiesToFetchWithHint___block_invoke_162(uint64_t a1)
{
  uint64_t v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_26709;
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 48) _composePropertiesToFetchWithHint:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_26709;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    id v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v10 setObject:v12 forKey:v11];
  }
}

+ (id)fetchType
{
  uint64_t v2 = @"PHPerson";
  return @"PHPerson";
}

- (id)objectReference
{
  return +[PHObjectReference referenceForObject:self];
}

+ (id)fetchPersonsForReferences:(id)a3 photoLibrary:(id)a4
{
  id v5 = a4;
  id v6 = PHLocalIdentifierForObjectReferencesAndLibrary((uint64_t)a3, (uint64_t)v5);
  uint64_t v7 = [v5 librarySpecificFetchOptions];

  [v7 setPersonContext:5];
  uint64_t v8 = +[PHPerson fetchPersonsWithLocalIdentifiers:v6 options:v7];

  return v8;
}

+ (int64_t)updateKeyFacesOfPersons:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 firstObject];
  id v10 = [v9 photoLibrary];
  id v11 = [v10 photoAnalysisClient];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [*(id *)(*((void *)&v23 + 1) + 8 * v17) localIdentifier];
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __74__PHPerson_VisionService__updateKeyFacesOfPersons_forceUpdate_completion___block_invoke;
    v21[3] = &unk_1E5848410;
    id v22 = v8;
    int64_t v19 = [v11 updateKeyFacesOfPersonsWithLocalIdentifiers:v12 forceUpdate:v6 completion:v21];
  }
  else
  {
    int64_t v19 = 0;
  }

  return v19;
}

uint64_t __74__PHPerson_VisionService__updateKeyFacesOfPersons_forceUpdate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_convertToPersonSuggestion:(id)a3 photoLibrary:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 librarySpecificFetchOptions];
  [v7 setMinimumUnverifiedFaceCount:1];
  v24[0] = @"PHPersonPropertySetUserFeedback";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v7 setFetchPropertySets:v8];

  id v9 = [v5 personLocalIdentifier];
  long long v23 = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  id v11 = +[PHPerson fetchPersonsWithLocalIdentifiers:v10 options:v7];

  id v12 = [v11 firstObject];
  if (v12)
  {
    id v13 = [v5 keyFaceLocalIdentifier];
    id v22 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    uint64_t v15 = [v6 librarySpecificFetchOptions];
    uint64_t v16 = +[PHFace fetchFacesWithLocalIdentifiers:v14 options:v15];

    uint64_t v17 = [v16 firstObject];
    if (v17)
    {
      uint64_t v18 = [v5 confirmed];
      int64_t v19 = [PHPersonSuggestion alloc];
      [v5 similarityScore];
      id v20 = -[PHPersonSuggestion initWithKeyFace:person:confirmed:similarityScore:](v19, "initWithKeyFace:person:confirmed:similarityScore:", v17, v12, v18);
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

+ (id)_packageSuggestionList:(id)a3 photoLibrary:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(a1, "_convertToPersonSuggestion:photoLibrary:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)_personSuggestionMarkedAsConfirmed:(BOOL)a3 fromPersonSuggestion:(id)a4
{
  BOOL v4 = a3;
  v22[6] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    id v6 = (void *)MEMORY[0x19F389B10]();
    id v7 = [v5 keyFace];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 localIdentifier];
      uint64_t v10 = [v5 person];
      uint64_t v11 = v10;
      if (v10)
      {
        id v20 = [v10 localIdentifier];
        v21[0] = @"faceCSN";
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "clusterSequenceNumber"));
        v22[0] = v12;
        v22[1] = v9;
        v21[1] = @"faceIdentifier";
        void v21[2] = @"personIdentifier";
        void v22[2] = v20;
        v21[3] = @"personFaceCount";
        id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "faceCount"));
        v22[3] = v13;
        void v21[4] = @"confirmed";
        uint64_t v14 = [NSNumber numberWithBool:v4];
        v22[4] = v14;
        v21[5] = @"similarityScore";
        uint64_t v15 = NSNumber;
        [v5 similarityScore];
        long long v16 = objc_msgSend(v15, "numberWithDouble:");
        v22[5] = v16;
        long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];

        long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F8AA28]) initWithSuggestionDictionary:v17];
      }
      else
      {
        long long v18 = 0;
      }
    }
    else
    {
      long long v18 = 0;
    }
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

+ (int64_t)_personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5 fromClient:(id)a6 completion:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v36 = a6;
  id v34 = a7;
  uint64_t v35 = [v12 localIdentifier];
  long long v33 = [v12 photoLibrary];
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v16 = v13;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v46;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [a1 _personSuggestionMarkedAsConfirmed:1 fromPersonSuggestion:*(void *)(*((void *)&v45 + 1) + 8 * v20)];
        if (v21) {
          [v15 addObject:v21];
        }

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v18);
  }

  id v22 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v23 = v14;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v42;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = [a1 _personSuggestionMarkedAsConfirmed:0 fromPersonSuggestion:*(void *)(*((void *)&v41 + 1) + 8 * v27)];
        if (v28) {
          [v22 addObject:v28];
        }

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v25);
  }

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __130__PHPerson_VisionService___personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions_fromClient_completion___block_invoke;
  v37[3] = &unk_1E58483E0;
  id v38 = v33;
  id v39 = v34;
  id v40 = a1;
  id v29 = v34;
  id v30 = v33;
  int64_t v31 = [v36 suggestedPersonsForPersonWithLocalIdentifier:v35 toBeConfirmedPersonSuggestions:v15 toBeRejectedPersonSuggestions:v22 completion:v37];

  return v31;
}

void __130__PHPerson_VisionService___personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions_fromClient_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = 0;
  id v8 = v6;
  if (a2 && !v6)
  {
    id v7 = [*(id *)(a1 + 48) _packageSuggestionList:a2 photoLibrary:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (int64_t)personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 photoLibrary];
  uint64_t v15 = [v14 photoAnalysisClient];

  if (v15)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __118__PHPerson_VisionService__personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions_completion___block_invoke;
    v18[3] = &unk_1E58483B8;
    id v19 = v13;
    int64_t v16 = [a1 _personSuggestionsForPerson:v10 confirmedPersonSuggestions:v11 rejectedPersonSuggestions:v12 fromClient:v15 completion:v18];
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

uint64_t __118__PHPerson_VisionService__personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__46079;
  id v22 = __Block_byref_object_dispose__46080;
  id v23 = (id)MEMORY[0x1E4F1CBF0];
  dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_46081);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __107__PHPerson_VisionService__personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions___block_invoke_2;
  v15[3] = &unk_1E5848390;
  uint64_t v17 = &v18;
  id v12 = v11;
  id v16 = v12;
  [a1 personSuggestionsForPerson:v8 confirmedPersonSuggestions:v9 rejectedPersonSuggestions:v10 completion:v15];
  dispatch_block_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  id v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v13;
}

void __107__PHPerson_VisionService__personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end