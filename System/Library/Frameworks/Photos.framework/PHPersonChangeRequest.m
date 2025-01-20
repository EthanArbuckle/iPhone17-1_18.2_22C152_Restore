@interface PHPersonChangeRequest
+ (BOOL)_allPersonsAreGraphPersons:(id)a3;
+ (id)changeRequestForDedupingGraphPersons:(id)a3;
+ (id)changeRequestForDedupingGraphPersons:(id)a3 withUserVerifiedPerson:(id)a4;
+ (id)changeRequestForMergingPersons:(id)a3;
+ (id)changeRequestForMergingPersons:(id)a3 nominalTargetIdentifier:(id)a4;
+ (id)changeRequestForPerson:(id)a3;
+ (id)changeRequestsForMergeCandidatePersons:(id)a3;
+ (id)creationRequestForPerson;
+ (void)deletePersons:(id)a3;
- (BOOL)_containsUserMutations;
- (BOOL)_ensureModelConsistencyForVerifiedTypePromotion:(id)a3 originalVerifiedType:(int)a4 error:(id *)a5;
- (BOOL)_hasMutationForVerifiedType:(int *)a3;
- (BOOL)_removeObjects:(id)a3 fromArray:(id)a4;
- (BOOL)_shouldPromotePerson:(id)a3 toVerifiedType:(int *)a4;
- (BOOL)_validateMergePerson:(id)a3 withPersonUUIDs:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)isInPersonNamingModel;
- (BOOL)isVerified;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4;
- (NSDictionary)contactMatchingDictionary;
- (NSSet)autonamingUserFeedbacks;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)managedEntityName;
- (NSString)mdID;
- (NSString)name;
- (NSString)personUri;
- (PHObjectPlaceholder)placeholderForCreatedPerson;
- (PHPerson)targetPerson;
- (PHPersonChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHPersonChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHRelationshipChangeRequestHelper)detectedFacesHelper;
- (PHRelationshipChangeRequestHelper)invalidMergeCandidatesHelper;
- (PHRelationshipChangeRequestHelper)keyFaceHelper;
- (PHRelationshipChangeRequestHelper)mergeCandidatesHelper;
- (PHRelationshipChangeRequestHelper)mergeCandidatesWithConfidenceHelper;
- (PHRelationshipChangeRequestHelper)rejectedFacesHelper;
- (PHRelationshipChangeRequestHelper)temporalFacesHelper;
- (PHUserFeedback)userFeedback;
- (double)mergeCandidateConfidence;
- (id)_existentFaceObjectIDs;
- (id)_existentInvalidMergeCandidateObjectIDs;
- (id)_existentMergeCandidateObjectIDs;
- (id)_existentMergeCandidateWithConfidenceObjectIDs;
- (id)_existentRejectedFaceObjectIDs;
- (id)_existentTemporalFaceObjectIDs;
- (id)_mutableFaceObjectIDsAndUUIDs;
- (id)_mutableInvalidMergeCandidateObjectIDsAndUUIDs;
- (id)_mutableKeyFaceObjectIDsAndUUIDs;
- (id)_mutableMergeCandidateObjectIDsAndUUIDs;
- (id)_mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs;
- (id)_mutableRejectedFacesObjectIDsAndUUIDs;
- (id)_mutableRequiringFaceCropGenerationFacesUUIDs;
- (id)_mutableRequiringNewUnverifiedPersonFacesUUIDs;
- (id)_mutableTemporalFaceObjectIDsAndUUIDs;
- (id)_noLimitsPersonFetchOptions;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)personUUID;
- (int64_t)assetSortOrder;
- (int64_t)type;
- (int64_t)verifiedType;
- (signed)detectionType;
- (signed)keyFacePickSource;
- (unint64_t)manualOrder;
- (unsigned)ageType;
- (unsigned)genderType;
- (unsigned)questionType;
- (unsigned)sexType;
- (unsigned)suggestedForClientType;
- (void)_addObjectIDsOfFaces:(id)a3 toFaceIDs:(id)a4 temporalIDs:(id)a5;
- (void)_prepareKeyFaceHelperIfNeeded;
- (void)_setGraphDedupePersons:(id)a3;
- (void)_setKeyFace:(id)a3 forCluster:(BOOL)a4 pickSource:(signed __int16)a5;
- (void)_setNominalMergeTargetUUID:(id)a3;
- (void)addFaces:(id)a3;
- (void)addInvalidMergeCandidatePersons:(id)a3;
- (void)addMergeCandidatePersons:(id)a3;
- (void)addMergeCandidateWithConfidencePersons:(id)a3;
- (void)addRejectedFaces:(id)a3;
- (void)addRejectedFaces:(id)a3 forCluster:(BOOL)a4;
- (void)addSearchEntityPersonRelationWithType:(signed __int16)a3 label:(id)a4 confidence:(double)a5 toPerson:(id)a6;
- (void)addTemporalFaces:(id)a3;
- (void)encodeToXPCDict:(id)a3;
- (void)mergePersons:(id)a3;
- (void)persistSuggestionForClient:(unint64_t)a3;
- (void)rejectMergeCandidatePersons:(id)a3;
- (void)removeFaces:(id)a3;
- (void)removeMergeCandidatePersons:(id)a3;
- (void)removeMergeCandidateWithConfidencePersons:(id)a3;
- (void)removeRejectedFaces:(id)a3;
- (void)removeSearchEntityPersonRelationType:(signed __int16)a3 toPerson:(id)a4;
- (void)removeTemporalFaces:(id)a3;
- (void)setAgeType:(unsigned __int16)a3;
- (void)setAssetSortOrder:(int64_t)a3;
- (void)setAutonamingUserFeedbacks:(id)a3;
- (void)setContactMatchingDictionary:(id)a3;
- (void)setDetectionType:(signed __int16)a3;
- (void)setDisplayName:(id)a3;
- (void)setGenderType:(unsigned __int16)a3;
- (void)setIdentifier:(id)a3;
- (void)setInPersonNamingModel:(BOOL)a3;
- (void)setKeyFace:(id)a3 forCluster:(BOOL)a4;
- (void)setKeyFaceForUserPick:(id)a3;
- (void)setKeyFaceForUserPick:(id)a3 forCluster:(BOOL)a4;
- (void)setKeyFacePickSource:(signed __int16)a3;
- (void)setManualOrder:(unint64_t)a3;
- (void)setManualOrder:(unint64_t)a3 verified:(BOOL)a4;
- (void)setMdID:(id)a3;
- (void)setMergeCandidateConfidence:(double)a3;
- (void)setName:(id)a3;
- (void)setPersonUUID:(id)a3;
- (void)setPersonUri:(id)a3;
- (void)setQuestionType:(unsigned __int16)a3;
- (void)setSexType:(unsigned __int16)a3;
- (void)setSuggestedForClientType:(unsigned __int16)a3;
- (void)setTargetPerson:(id)a3;
- (void)setTemporalFaces:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUserFeedback:(id)a3;
- (void)setVerified:(BOOL)a3;
- (void)setVerifiedType:(int64_t)a3;
@end

@implementation PHPersonChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidMergeCandidatesHelper, 0);
  objc_storeStrong((id *)&self->_mergeCandidatesWithConfidenceHelper, 0);
  objc_storeStrong((id *)&self->_mergeCandidatesHelper, 0);
  objc_storeStrong((id *)&self->_rejectedFacesHelper, 0);
  objc_storeStrong((id *)&self->_keyFaceHelper, 0);
  objc_storeStrong((id *)&self->_temporalFacesHelper, 0);
  objc_storeStrong((id *)&self->_detectedFacesHelper, 0);
  objc_storeStrong((id *)&self->_autonamingUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_userFeedback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_targetPerson, 0);
  objc_storeStrong((id *)&self->_searchEntityRelationsToRemove, 0);
  objc_storeStrong((id *)&self->_searchEntityRelationsToSet, 0);
  objc_storeStrong((id *)&self->_faceUUIDsRequiringNewUnverifiedPerson, 0);
  objc_storeStrong((id *)&self->_graphDedupePersonUUIDs, 0);
  objc_storeStrong((id *)&self->_rejectedMergeCandidatePersonUUIDs, 0);
  objc_storeStrong((id *)&self->_faceUUIDsRequiringFaceCropGeneration, 0);
  objc_storeStrong((id *)&self->_nominalMergeTargetUUID, 0);

  objc_storeStrong((id *)&self->_personUUIDsToMerge, 0);
}

- (PHRelationshipChangeRequestHelper)invalidMergeCandidatesHelper
{
  return self->_invalidMergeCandidatesHelper;
}

- (PHRelationshipChangeRequestHelper)mergeCandidatesWithConfidenceHelper
{
  return self->_mergeCandidatesWithConfidenceHelper;
}

- (PHRelationshipChangeRequestHelper)mergeCandidatesHelper
{
  return self->_mergeCandidatesHelper;
}

- (PHRelationshipChangeRequestHelper)rejectedFacesHelper
{
  return self->_rejectedFacesHelper;
}

- (PHRelationshipChangeRequestHelper)keyFaceHelper
{
  return self->_keyFaceHelper;
}

- (PHRelationshipChangeRequestHelper)temporalFacesHelper
{
  return self->_temporalFacesHelper;
}

- (PHRelationshipChangeRequestHelper)detectedFacesHelper
{
  return self->_detectedFacesHelper;
}

- (NSSet)autonamingUserFeedbacks
{
  return self->_autonamingUserFeedbacks;
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setTargetPerson:(id)a3
{
}

- (PHPerson)targetPerson
{
  return self->_targetPerson;
}

- (void)removeSearchEntityPersonRelationType:(signed __int16)a3 toPerson:(id)a4
{
  uint64_t v4 = a3;
  v7 = (PHPersonChangeRequest *)a4;
  v13 = v7;
  if (v4)
  {
    if (v7) {
      goto LABEL_4;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHPersonChangeRequest.m", 1417, @"Invalid parameter not satisfying: %@", @"relationType" object file lineNumber description];

    v7 = v13;
    if (v13)
    {
LABEL_4:
      v8 = (void *)MEMORY[0x1E4F8AB90];
      if (v7) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  if ((unsigned __int16)(v4 - 3) > 0xFFFDu) {
    goto LABEL_4;
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"PHPersonChangeRequest.m", 1418, @"Invalid parameter not satisfying: %@", @"relatedPerson || (relationType == PLSearchEntityPersonRelationTypeMe || relationType == PLSearchEntityPersonRelationTypeSelf)" object file lineNumber description];

  v8 = (void *)MEMORY[0x1E4F8AB90];
LABEL_5:
  v7 = self;
LABEL_6:
  v9 = [(PHChangeRequest *)v7 uuid];
  v10 = [v8 personRelationDictionaryForRelationWithType:v4 label:0 confidence:v9 relatedPersonUUID:0.0];

  [(NSMutableArray *)self->_searchEntityRelationsToRemove addObject:v10];
  [(PHChangeRequest *)self didMutate];
}

- (void)addSearchEntityPersonRelationWithType:(signed __int16)a3 label:(id)a4 confidence:(double)a5 toPerson:(id)a6
{
  uint64_t v8 = a3;
  id v19 = a4;
  v11 = (PHPersonChangeRequest *)a6;
  if (a5 == 0.0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHPersonChangeRequest.m", 1408, @"Invalid parameter not satisfying: %@", @"confidence" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_8:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PHPersonChangeRequest.m", 1409, @"Invalid parameter not satisfying: %@", @"relationType" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  if ((unsigned __int16)(v8 - 3) > 0xFFFDu || v11)
  {
    v12 = (void *)MEMORY[0x1E4F8AB90];
    if (v11)
    {
      v13 = v11;
      goto LABEL_11;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PHPersonChangeRequest.m", 1410, @"Invalid parameter not satisfying: %@", @"relatedPerson || (relationType == PLSearchEntityPersonRelationTypeMe || relationType == PLSearchEntityPersonRelationTypeSelf)" object file lineNumber description];

    v12 = (void *)MEMORY[0x1E4F8AB90];
  }
  v13 = self;
LABEL_11:
  v17 = [(PHChangeRequest *)v13 uuid];
  v18 = [v12 personRelationDictionaryForRelationWithType:v8 label:v19 confidence:v17 relatedPersonUUID:a5];

  [(NSMutableArray *)self->_searchEntityRelationsToSet addObject:v18];
  [(PHChangeRequest *)self didMutate];
}

- (void)_setGraphDedupePersons:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  graphDedupePersonUUIDs = self->_graphDedupePersonUUIDs;
  if (!graphDedupePersonUUIDs)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v7 = self->_graphDedupePersonUUIDs;
    self->_graphDedupePersonUUIDs = v6;

    graphDedupePersonUUIDs = self->_graphDedupePersonUUIDs;
  }
  [(NSMutableSet *)graphDedupePersonUUIDs removeAllObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = self->_graphDedupePersonUUIDs;
        v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "uuid", (void)v15);
        [(NSMutableSet *)v13 addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ([(NSMutableSet *)self->_graphDedupePersonUUIDs count]) {
    [(PHChangeRequest *)self didMutate];
  }
}

- (void)addInvalidMergeCandidatePersons:(id)a3
{
  id v4 = a3;
  [(PHPersonChangeRequest *)self removeMergeCandidatePersons:v4];
  id v6 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:v4];

  if (v6)
  {
    [(PHChangeRequest *)self didMutate];
    v5 = [(PHPersonChangeRequest *)self _mutableInvalidMergeCandidateObjectIDsAndUUIDs];
    [v5 addObjectsFromArray:v6];
  }
}

- (void)removeMergeCandidateWithConfidencePersons:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHPersonChangeRequest *)self _mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)addMergeCandidateWithConfidencePersons:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHPersonChangeRequest *)self _mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];
  }
}

- (void)rejectMergeCandidatePersons:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PHPersonChangeRequest *)self addInvalidMergeCandidatePersons:v4];
  if (!self->_rejectedMergeCandidatePersonUUIDs)
  {
    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    rejectedMergeCandidatePersonUUIDs = self->_rejectedMergeCandidatePersonUUIDs;
    self->_rejectedMergeCandidatePersonUUIDs = v5;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = self->_rejectedMergeCandidatePersonUUIDs;
        v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "uuid", (void)v14);
        [(NSMutableSet *)v12 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)removeMergeCandidatePersons:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHPersonChangeRequest *)self _mutableMergeCandidateObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)addMergeCandidatePersons:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHPersonChangeRequest *)self _mutableMergeCandidateObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];
  }
}

- (void)mergePersons:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_personUUIDsToMerge)
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    personUUIDsToMerge = self->_personUUIDsToMerge;
    self->_personUUIDsToMerge = v5;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = self->_personUUIDsToMerge;
        v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "uuid", (void)v14);
        [(NSMutableArray *)v12 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(PHPersonChangeRequest *)self setVerified:1];
  [(PHChangeRequest *)self didMutate];
}

- (void)_setNominalMergeTargetUUID:(id)a3
{
}

- (void)persistSuggestionForClient:(unint64_t)a3
{
  if (a3 != 1)
  {
    if (a3 - 2 < 4)
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Invalid PHPeopleSuggestionClient enum chosen to persist", 0, v3, v4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
    a3 = 0;
  }
  [(PHPersonChangeRequest *)self setSuggestedForClientType:a3];
}

- (void)removeRejectedFaces:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:v4];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    id v6 = [(PHPersonChangeRequest *)self _mutableRejectedFacesObjectIDsAndUUIDs];
    [v6 removeObjectsInArray:v5];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        v13 = [(PHPersonChangeRequest *)self _mutableRequiringFaceCropGenerationFacesUUIDs];
        long long v14 = [v12 uuid];
        [v13 removeObject:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)addRejectedFaces:(id)a3
{
}

- (void)addRejectedFaces:(id)a3 forCluster:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:v6];
  if (v7)
  {
    [(PHChangeRequest *)self didMutate];
    uint64_t v8 = [(PHPersonChangeRequest *)self _mutableRejectedFacesObjectIDsAndUUIDs];
    [v8 addObjectsFromArray:v7];
  }
  v32 = (void *)v7;
  [(PHPersonChangeRequest *)self removeFaces:v6];
  if (v4)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v15 = [(PHPersonChangeRequest *)self _mutableRequiringFaceCropGenerationFacesUUIDs];
          long long v16 = [v14 uuid];
          [v15 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v11);
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    id v33 = v17;
    v34 = self;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v22;
          if ([v23 isTorsoOnly])
          {
            v24 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v25 = [v23 uuid];
              v26 = [(PHPersonChangeRequest *)v34 targetPerson];
              v27 = [v26 uuid];
              [MEMORY[0x1E4F29060] callStackSymbols];
              v29 = uint64_t v28 = v20;
              *(_DWORD *)buf = 138543874;
              v44 = v25;
              __int16 v45 = 2114;
              v46 = v27;
              __int16 v47 = 2112;
              v48 = v29;
              _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_ERROR, "Warning: rejecting torso-only face %{public}@ for person %{public}@ is not cloud-syncable. Call stack: %@", buf, 0x20u);

              uint64_t v20 = v28;
              id v17 = v33;
              self = v34;
            }
          }
        }
        v30 = [(PHPersonChangeRequest *)self _mutableRequiringNewUnverifiedPersonFacesUUIDs];
        v31 = [v22 uuid];
        [v30 addObject:v31];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v19);
  }
}

- (void)setKeyFace:(id)a3 forCluster:(BOOL)a4
{
}

- (void)setKeyFaceForUserPick:(id)a3 forCluster:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PHPersonChangeRequest *)self setVerifiedType:1];
  [(PHPersonChangeRequest *)self _setKeyFace:v6 forCluster:v4 pickSource:1];
}

- (void)setKeyFaceForUserPick:(id)a3
{
}

- (void)_setKeyFace:(id)a3 forCluster:(BOOL)a4 pickSource:(signed __int16)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PHPersonChangeRequest.m", 1081, @"keyFace has incorrect class: %@", v9 object file lineNumber description];

    if (!v9) {
      goto LABEL_10;
    }
  }
  [(PHChangeRequest *)self didMutate];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = PLObjectIDOrUUIDFromPHObject(v9);
  [v10 addObject:v11];
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA80];
  v13 = [(PHPersonChangeRequest *)self _existentFaceObjectIDs];
  long long v14 = [v12 setWithArray:v13];

  long long v15 = [(PHRelationshipChangeRequestHelper *)self->_detectedFacesHelper mutableObjectIDsAndUUIDs];
  if ([v15 count])
  {
    long long v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    [v14 unionSet:v16];
  }
  if (([v14 containsObject:v11] & 1) == 0)
  {
    v22[0] = v9;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [(PHPersonChangeRequest *)self addFaces:v17];
  }
  if (v10)
  {
    uint64_t v18 = [(PHPersonChangeRequest *)self _mutableKeyFaceObjectIDsAndUUIDs];
    [v18 addObjectsFromArray:v10];
  }
LABEL_10:
  if (v6)
  {
    uint64_t v19 = [(PHPersonChangeRequest *)self _mutableRequiringFaceCropGenerationFacesUUIDs];
    uint64_t v20 = [v9 uuid];
    [v19 addObject:v20];
  }
  [(PHPersonChangeRequest *)self setKeyFacePickSource:v5];
}

- (void)setTemporalFaces:(id)a3
{
  uint64_t v4 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (!v4) {
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
  }
  id v9 = (id)v4;
  [(PHChangeRequest *)self didMutate];
  temporalFacesHelper = self->_temporalFacesHelper;
  BOOL v6 = [(PHPersonChangeRequest *)self _existentTemporalFaceObjectIDs];
  [(PHRelationshipChangeRequestHelper *)temporalFacesHelper prepareIfNeededWithExistentObjectIDs:v6];

  uint64_t v7 = self->_temporalFacesHelper;
  uint64_t v8 = (void *)[v9 mutableCopy];
  [(PHRelationshipChangeRequestHelper *)v7 setMutableObjectIDsAndUUIDs:v8];
}

- (void)removeTemporalFaces:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    uint64_t v4 = [(PHPersonChangeRequest *)self _mutableTemporalFaceObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)addTemporalFaces:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequest *)self didMutate];
    uint64_t v4 = [(PHPersonChangeRequest *)self _mutableTemporalFaceObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];
  }
}

- (void)removeFaces:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PHPersonChangeRequest *)self _addObjectIDsOfFaces:v5 toFaceIDs:v6 temporalIDs:v7];

  if ([v6 count])
  {
    uint64_t v8 = [(PHPersonChangeRequest *)self _mutableFaceObjectIDsAndUUIDs];
    BOOL v9 = [(PHPersonChangeRequest *)self _removeObjects:v6 fromArray:v8];
  }
  else
  {
    BOOL v9 = 0;
  }
  if ([v7 count])
  {
    uint64_t v10 = [(PHPersonChangeRequest *)self _mutableTemporalFaceObjectIDsAndUUIDs];
    BOOL v11 = [(PHPersonChangeRequest *)self _removeObjects:v7 fromArray:v10];
  }
  else
  {
    BOOL v11 = 0;
  }
  if (!v9 && !v11)
  {
    uint64_t v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "PHPersonChangeRequest removeFaces: nothing removed", v13, 2u);
    }
  }
}

- (BOOL)_removeObjects:(id)a3 fromArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count]
    && (unint64_t v8 = [v7 count], objc_msgSend(v7, "removeObjectsInArray:", v6), objc_msgSend(v7, "count") < v8))
  {
    [(PHChangeRequest *)self didMutate];
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)addFaces:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v9 = objc_alloc_init(v4);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PHPersonChangeRequest *)self _addObjectIDsOfFaces:v5 toFaceIDs:v9 temporalIDs:v6];

  if ([v9 count])
  {
    [(PHChangeRequest *)self didMutate];
    id v7 = [(PHPersonChangeRequest *)self _mutableFaceObjectIDsAndUUIDs];
    [v7 addObjectsFromArray:v9];
  }
  if ([v6 count])
  {
    [(PHChangeRequest *)self didMutate];
    unint64_t v8 = [(PHPersonChangeRequest *)self _mutableTemporalFaceObjectIDsAndUUIDs];
    [v8 addObjectsFromArray:v6];
  }
}

- (void)_addObjectIDsOfFaces:(id)a3 toFaceIDs:(id)a4 temporalIDs:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v23;
    *(void *)&long long v11 = 138543362;
    long long v21 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v7);
        }
        long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v16 = PLObjectIDOrUUIDFromPHObject(v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v15 duration];
          if (v17 <= 0.0) {
            uint64_t v18 = v8;
          }
          else {
            uint64_t v18 = v9;
          }
        }
        else
        {
          uint64_t v19 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = [v16 description];
            *(_DWORD *)buf = v21;
            v27 = v20;
            _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEFAULT, "PHPersonChangeRequest assuming object is a normal face: %{public}@", buf, 0xCu);
          }
          uint64_t v18 = v8;
        }
        objc_msgSend(v18, "addObject:", v16, v21);
      }
      uint64_t v12 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v12);
  }
}

- (id)_mutableRequiringNewUnverifiedPersonFacesUUIDs
{
  faceUUIDsRequiringNewUnverifiedPerson = self->_faceUUIDsRequiringNewUnverifiedPerson;
  if (!faceUUIDsRequiringNewUnverifiedPerson)
  {
    uint64_t v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = self->_faceUUIDsRequiringNewUnverifiedPerson;
    self->_faceUUIDsRequiringNewUnverifiedPerson = v4;

    faceUUIDsRequiringNewUnverifiedPerson = self->_faceUUIDsRequiringNewUnverifiedPerson;
  }

  return faceUUIDsRequiringNewUnverifiedPerson;
}

- (id)_mutableRequiringFaceCropGenerationFacesUUIDs
{
  faceUUIDsRequiringFaceCropGeneration = self->_faceUUIDsRequiringFaceCropGeneration;
  if (!faceUUIDsRequiringFaceCropGeneration)
  {
    uint64_t v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = self->_faceUUIDsRequiringFaceCropGeneration;
    self->_faceUUIDsRequiringFaceCropGeneration = v4;

    faceUUIDsRequiringFaceCropGeneration = self->_faceUUIDsRequiringFaceCropGeneration;
  }

  return faceUUIDsRequiringFaceCropGeneration;
}

- (id)_mutableInvalidMergeCandidateObjectIDsAndUUIDs
{
  invalidMergeCandidatesHelper = self->_invalidMergeCandidatesHelper;
  uint64_t v4 = [(PHPersonChangeRequest *)self _existentInvalidMergeCandidateObjectIDs];
  [(PHRelationshipChangeRequestHelper *)invalidMergeCandidatesHelper prepareIfNeededWithExistentObjectIDs:v4];

  id v5 = self->_invalidMergeCandidatesHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (id)_mutableMergeCandidateWithConfidenceObjectIDsAndUUIDs
{
  mergeCandidatesWithConfidenceHelper = self->_mergeCandidatesWithConfidenceHelper;
  uint64_t v4 = [(PHPersonChangeRequest *)self _existentMergeCandidateWithConfidenceObjectIDs];
  [(PHRelationshipChangeRequestHelper *)mergeCandidatesWithConfidenceHelper prepareIfNeededWithExistentObjectIDs:v4];

  id v5 = self->_mergeCandidatesWithConfidenceHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (id)_mutableMergeCandidateObjectIDsAndUUIDs
{
  mergeCandidatesHelper = self->_mergeCandidatesHelper;
  uint64_t v4 = [(PHPersonChangeRequest *)self _existentMergeCandidateObjectIDs];
  [(PHRelationshipChangeRequestHelper *)mergeCandidatesHelper prepareIfNeededWithExistentObjectIDs:v4];

  id v5 = self->_mergeCandidatesHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (id)_mutableRejectedFacesObjectIDsAndUUIDs
{
  rejectedFacesHelper = self->_rejectedFacesHelper;
  uint64_t v4 = [(PHPersonChangeRequest *)self _existentRejectedFaceObjectIDs];
  [(PHRelationshipChangeRequestHelper *)rejectedFacesHelper prepareIfNeededWithExistentObjectIDs:v4];

  id v5 = self->_rejectedFacesHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (id)_mutableKeyFaceObjectIDsAndUUIDs
{
  [(PHPersonChangeRequest *)self _prepareKeyFaceHelperIfNeeded];
  keyFaceHelper = self->_keyFaceHelper;

  return [(PHRelationshipChangeRequestHelper *)keyFaceHelper mutableObjectIDsAndUUIDs];
}

- (id)_mutableTemporalFaceObjectIDsAndUUIDs
{
  temporalFacesHelper = self->_temporalFacesHelper;
  uint64_t v4 = [(PHPersonChangeRequest *)self _existentTemporalFaceObjectIDs];
  [(PHRelationshipChangeRequestHelper *)temporalFacesHelper prepareIfNeededWithExistentObjectIDs:v4];

  id v5 = self->_temporalFacesHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (id)_mutableFaceObjectIDsAndUUIDs
{
  detectedFacesHelper = self->_detectedFacesHelper;
  uint64_t v4 = [(PHPersonChangeRequest *)self _existentFaceObjectIDs];
  [(PHRelationshipChangeRequestHelper *)detectedFacesHelper prepareIfNeededWithExistentObjectIDs:v4];

  id v5 = self->_detectedFacesHelper;

  return [(PHRelationshipChangeRequestHelper *)v5 mutableObjectIDsAndUUIDs];
}

- (void)_prepareKeyFaceHelperIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHRelationshipChangeRequestHelper *)self->_keyFaceHelper originalObjectIDs];

  if (!v3) {
    [(PHRelationshipChangeRequestHelper *)self->_keyFaceHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  uint64_t v4 = [(PHRelationshipChangeRequestHelper *)self->_keyFaceHelper mutableObjectIDsAndUUIDs];

  if (!v4)
  {
    keyFaceHelper = self->_keyFaceHelper;
    id v7 = [(PHRelationshipChangeRequestHelper *)keyFaceHelper originalObjectIDs];
    id v6 = (void *)[v7 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)keyFaceHelper setMutableObjectIDsAndUUIDs:v6];
  }
}

- (id)_existentInvalidMergeCandidateObjectIDs
{
  uint64_t v3 = [(PHPersonChangeRequest *)self targetPerson];
  if (v3)
  {
    uint64_t v4 = [(PHPersonChangeRequest *)self targetPerson];
    id v5 = [(PHPersonChangeRequest *)self _noLimitsPersonFetchOptions];
    id v6 = +[PHQuery queryForInvalidMergeCandidatePersonsForPerson:v4 options:v5];
  }
  else
  {
    id v6 = 0;
  }

  id v7 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:v6];

  return v7;
}

- (id)_existentMergeCandidateWithConfidenceObjectIDs
{
  uint64_t v3 = [(PHPersonChangeRequest *)self targetPerson];
  if (v3)
  {
    uint64_t v4 = [(PHPersonChangeRequest *)self targetPerson];
    id v5 = [(PHPersonChangeRequest *)self _noLimitsPersonFetchOptions];
    id v6 = +[PHQuery queryForMergeCandidateWithConfidencePersonsForPerson:v4 options:v5];
  }
  else
  {
    id v6 = 0;
  }

  id v7 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:v6];

  return v7;
}

- (id)_existentMergeCandidateObjectIDs
{
  uint64_t v3 = [(PHPersonChangeRequest *)self targetPerson];
  if (v3)
  {
    uint64_t v4 = [(PHPersonChangeRequest *)self targetPerson];
    id v5 = [(PHPersonChangeRequest *)self _noLimitsPersonFetchOptions];
    id v6 = +[PHQuery queryForMergeCandidatePersonsForPerson:v4 options:v5];
  }
  else
  {
    id v6 = 0;
  }

  id v7 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:v6];

  return v7;
}

- (id)_noLimitsPersonFetchOptions
{
  v2 = [(PHChangeRequest *)self photoLibrary];
  uint64_t v3 = [v2 librarySpecificFetchOptions];

  [v3 setMinimumUnverifiedFaceCount:0];
  [v3 setMinimumVerifiedFaceCount:0];
  [v3 setIncludedDetectionTypes:&unk_1EEB26AD8];

  return v3;
}

- (id)_existentRejectedFaceObjectIDs
{
  uint64_t v3 = [(PHPersonChangeRequest *)self targetPerson];

  if (v3)
  {
    uint64_t v4 = [(PHChangeRequest *)self photoLibrary];
    id v5 = [v4 librarySpecificFetchOptions];

    [v5 setIsExclusivePredicate:1];
    [v5 setIncludeTorsoAndFaceDetectionData:1];
    id v6 = [(PHPersonChangeRequest *)self targetPerson];
    id v7 = +[PHQuery queryForRejectedFacesOnPerson:v6 options:v5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:v7];

  return v8;
}

- (id)_existentTemporalFaceObjectIDs
{
  uint64_t v3 = [(PHPersonChangeRequest *)self targetPerson];

  if (v3)
  {
    uint64_t v4 = [(PHChangeRequest *)self photoLibrary];
    id v5 = [v4 librarySpecificFetchOptions];

    [v5 setIsExclusivePredicate:1];
    [v5 setIncludeMediaAnalysisProcessingRangeTypes:2];
    [v5 setIncludeTorsoAndFaceDetectionData:1];
    id v6 = [(PHPersonChangeRequest *)self targetPerson];
    id v7 = +[PHQuery queryForFacesForPerson:v6 options:v5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:v7];

  return v8;
}

- (id)_existentFaceObjectIDs
{
  uint64_t v3 = [(PHPersonChangeRequest *)self targetPerson];

  if (v3)
  {
    uint64_t v4 = [(PHChangeRequest *)self photoLibrary];
    id v5 = [v4 librarySpecificFetchOptions];

    [v5 setIsExclusivePredicate:1];
    [v5 setIncludeTorsoAndFaceDetectionData:1];
    id v6 = [(PHPersonChangeRequest *)self targetPerson];
    id v7 = +[PHQuery queryForFacesForPerson:v6 options:v5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:v7];

  return v8;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PHChangeRequest *)self helper];
  id v8 = [v7 mutations];
  id v9 = [v8 objectForKey:@"verifiedType"];

  if (v9) {
    uint64_t v10 = [v9 intValue];
  }
  else {
    uint64_t v10 = 0;
  }
  long long v11 = (void *)MEMORY[0x1E4F8AA10];
  uint64_t v12 = [v6 managedObjectContext];
  uint64_t v13 = [(PHChangeRequest *)self uuid];
  long long v14 = [v11 insertIntoManagedObjectContext:v12 withPersonUUID:v13 fullName:&stru_1EEAC1950 verifiedType:v10];

  if (a4 && !v14)
  {
    long long v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    long long v16 = [NSString stringWithFormat:@"Failed to create person"];
    v20[0] = v16;
    double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = [(PHPersonChangeRequest *)self detectionType];
  int v6 = v5;
  if (a4 && v5 == 2)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28228];
    v11[0] = @"PHDetectionTypePet is not a valid value to assign to PHPerson.detectionType";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3111, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 != 2;
}

- (BOOL)_ensureModelConsistencyForVerifiedTypePromotion:(id)a3 originalVerifiedType:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 keyFace];
  if (v8)
  {
    if (!v6) {
      [v7 disconnectFaceGroup];
    }
    if ([v7 verifiedType] == 2)
    {
      [v8 setEffectiveNameSource:5];
      [v8 setConfirmedFaceCropGenerationState:1];
    }
    else if ([v7 verifiedType] == 1)
    {
      [v7 setKeyFacePickSource:1];
      if ([v8 nameSource] != 1)
      {
        [v8 setEffectiveNameSource:1];
        [v8 setConfirmedFaceCropGenerationState:1];
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v19 = [v7 detectedFaces];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if ([v24 nameSource] == 5) {
              [v24 setEffectiveNameSource:0];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v21);
      }

      long long v25 = [v7 managedObjectContext];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v26 = [v7 faceCrops];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v34 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if ([v31 type] == 5) {
              [v25 deleteObject:v31];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v28);
      }
    }
  }
  else
  {
    id v9 = NSString;
    uint64_t v10 = [v7 personUUID];
    long long v11 = [v9 stringWithFormat:@"keyFace is nil for person %@ being promoted from %d to %d. Unable to request face crop generation.", v10, v6, objc_msgSend(v7, "verifiedType")];

    uint64_t v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    uint64_t v43 = *MEMORY[0x1E4F28228];
    v44 = v11;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    long long v16 = [v13 errorWithDomain:v14 code:73001 userInfo:v15];

    double v17 = PHErrorFromPLError(v16);
    uint64_t v18 = v17;
    if (a5) {
      *a5 = v17;
    }
  }
  return v8 != 0;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v261 = *MEMORY[0x1E4F143B8];
  id v8 = (NSMutableArray *)a3;
  id v9 = a4;
  uint64_t v10 = [(NSMutableArray *)v8 photoLibrary];
  long long v11 = [v10 managedObjectContext];

  unsigned int v12 = [(NSMutableArray *)v8 verifiedType];
  unsigned int v249 = 0;
  BOOL v13 = [(PHPersonChangeRequest *)self _shouldPromotePerson:v8 toVerifiedType:&v249];
  if (v13) {
    [(NSMutableArray *)v8 setEffectiveVerifiedType:v249];
  }
  uint64_t v14 = [(PHChangeRequest *)self helper];
  id v248 = 0;
  int v15 = [v14 applyMutationsToManagedObject:v8 error:&v248];
  id v16 = v248;

  if (!v15) {
    goto LABEL_77;
  }
  BOOL v194 = v13;
  unsigned int v192 = v12;
  double v17 = [(NSMutableArray *)v8 keyFace];
  uint64_t v18 = [(PHPersonChangeRequest *)self keyFaceHelper];
  uint64_t v19 = [v18 mutableObjectIDsAndUUIDs];

  if (v19)
  {
    [v18 setAllowsInsert:1];
    uint64_t v20 = [MEMORY[0x1E4F8A7B0] entityName];
    [v18 setDestinationEntityName:v20];

    id v247 = v16;
    uint64_t v21 = v18;
    int v22 = [v18 applyMutationsToManagedObjectToOneRelationship:v8 error:&v247];
    id v23 = v247;

    int v193 = v22;
    char v24 = v22;
    long long v25 = v23;
  }
  else
  {
    uint64_t v21 = v18;
    long long v25 = v16;
    int v193 = 0;
    char v24 = 1;
  }
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v26 = [(PHPersonChangeRequest *)self detectedFacesHelper];
  v209 = self;
  v210 = v8;
  v202 = a5;
  v205 = v26;
  v206 = v21;
  if ((v24 & 1) == 0)
  {
    long long v41 = [(PHPersonChangeRequest *)self temporalFacesHelper];
    long long v42 = v25;
    goto LABEL_21;
  }
  uint64_t v27 = v26;
  uint64_t v28 = [v26 mutableObjectIDsAndUUIDs];

  v201 = v17;
  if (!v28)
  {
    long long v41 = [(PHPersonChangeRequest *)self temporalFacesHelper];
    long long v42 = v25;
    goto LABEL_82;
  }
  [v27 setAllowsInsert:1];
  [v27 setAllowsMove:0];
  [v27 setAllowsRemove:1];
  uint64_t v29 = [MEMORY[0x1E4F8A7B0] entityName];
  [v27 setDestinationEntityName:v29];

  v30 = [(NSMutableArray *)v8 mutableFaces];
  id v246 = v25;
  int v31 = [v27 applyMutationsToManagedObject:v8 unorderedMutableChildren:v30 error:&v246];
  id v32 = v246;

  if (v31)
  {
    long long v33 = [v30 allObjects];
    [obj addObjectsFromArray:v33];
  }
  uint64_t v34 = [(NSMutableArray *)v8 keyFace];
  long long v35 = v8;
  if (v34)
  {
    long long v36 = (void *)v34;
    long long v37 = [(NSMutableArray *)v8 keyFace];
    char v38 = [v30 containsObject:v37];

    if ((v38 & 1) == 0)
    {
      if ([(NSMutableArray *)v35 keyFacePickSource] == 1)
      {
        long long v39 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          long long v40 = [(NSMutableArray *)v35 personUUID];
          *(_DWORD *)buf = 138543362;
          v256 = v40;
          _os_log_impl(&dword_19B043000, v39, OS_LOG_TYPE_ERROR, "Resetting user-picked keyFace on person %{public}@ because it's not in the list of faces", buf, 0xCu);
        }
      }
      [(NSMutableArray *)v35 setKeyFace:0 pickSource:0];
    }
  }

  self = v209;
  long long v41 = [(PHPersonChangeRequest *)v209 temporalFacesHelper];
  id v8 = v35;
  long long v42 = v32;
  double v17 = v201;
  if ((v31 & 1) == 0)
  {
LABEL_21:
    v204 = v41;
    uint64_t v43 = [(PHPersonChangeRequest *)self rejectedFacesHelper];
    id v44 = v42;
    goto LABEL_22;
  }
LABEL_82:
  v103 = v41;
  v104 = [v41 mutableObjectIDsAndUUIDs];

  v204 = v103;
  if (v104)
  {
    [v103 setAllowsInsert:1];
    [v103 setAllowsMove:0];
    [v103 setAllowsRemove:1];
    v105 = [MEMORY[0x1E4F8A7B0] entityName];
    [v103 setDestinationEntityName:v105];

    v106 = [(NSMutableArray *)v8 mutableTemporalFaces];
    id v245 = v42;
    int v107 = [v103 applyMutationsToManagedObject:v8 unorderedMutableChildren:v106 error:&v245];
    id v44 = v245;

    if (v107)
    {
      v108 = [v106 allObjects];
      [obj addObjectsFromArray:v108];

      self = v209;
    }

    uint64_t v43 = [(PHPersonChangeRequest *)self rejectedFacesHelper];
    if (v107)
    {
      long long v42 = v44;
      double v17 = v201;
      goto LABEL_88;
    }
    double v17 = v201;
LABEL_22:
    v203 = v43;
    __int16 v45 = [(PHPersonChangeRequest *)self mergeCandidatesHelper];
    goto LABEL_23;
  }
  uint64_t v43 = [(PHPersonChangeRequest *)self rejectedFacesHelper];
LABEL_88:
  v109 = [v43 mutableObjectIDsAndUUIDs];

  id v200 = v9;
  v203 = v43;
  if (v109)
  {
    v190 = v11;
    [v43 setAllowsInsert:1];
    [v43 setAllowsMove:0];
    [v43 setAllowsRemove:1];
    v110 = [MEMORY[0x1E4F8A7B0] entityName];
    [v43 setDestinationEntityName:v110];

    v111 = [(NSMutableArray *)v8 mutableRejectedFaces];
    id v244 = v42;
    char v187 = [v43 applyMutationsToManagedObject:v8 unorderedMutableChildren:v111 error:&v244];
    id v44 = v244;

    uint64_t v112 = [(NSMutableArray *)v8 keyFace];
    v113 = v8;
    if (v112)
    {
      v114 = (void *)v112;
      v115 = [(NSMutableArray *)v8 keyFace];
      int v116 = [v111 containsObject:v115];

      if (v116)
      {
        if ([(NSMutableArray *)v113 keyFacePickSource] == 1)
        {
          v117 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
          {
            v118 = [(NSMutableArray *)v113 personUUID];
            *(_DWORD *)buf = 138543362;
            v256 = v118;
            _os_log_impl(&dword_19B043000, v117, OS_LOG_TYPE_ERROR, "Resetting user-picked keyFace on person %{public}@ because it's in the list of rejected faces", buf, 0xCu);
          }
        }
        [(NSMutableArray *)v113 setKeyFace:0 pickSource:0];
      }
    }
    v196 = v111;
    long long v242 = 0u;
    long long v243 = 0u;
    long long v240 = 0u;
    long long v241 = 0u;
    v119 = [(NSMutableArray *)v113 rejectedFaces];
    uint64_t v120 = [v119 countByEnumeratingWithState:&v240 objects:v260 count:16];
    if (v120)
    {
      uint64_t v121 = v120;
      uint64_t v122 = *(void *)v241;
      do
      {
        for (uint64_t i = 0; i != v121; ++i)
        {
          if (*(void *)v241 != v122) {
            objc_enumerationMutation(v119);
          }
          v124 = *(void **)(*((void *)&v240 + 1) + 8 * i);
          v125 = [(PHPersonChangeRequest *)v209 _mutableRequiringFaceCropGenerationFacesUUIDs];
          v126 = [v124 uuid];
          int v127 = [v125 containsObject:v126];

          if (v127)
          {
            [v124 addRejectedPersonNeedingFaceCrops:v210];
            [v124 addClusterRejectedPerson:v210];
          }
          v128 = [(PHPersonChangeRequest *)v209 _mutableRejectedFacesObjectIDsAndUUIDs];
          v129 = [v124 uuid];
          int v130 = [v128 containsObject:v129];

          if (v130)
          {
            v131 = [v124 associatedAssetForFaceOrTorso:0 orTemporal:0];
            v132 = [MEMORY[0x1E4F1C9C8] date];
            [v131 setModificationDate:v132];
          }
        }
        uint64_t v121 = [v119 countByEnumeratingWithState:&v240 objects:v260 count:16];
      }
      while (v121);
    }

    self = v209;
    uint64_t v133 = [(PHPersonChangeRequest *)v209 mergeCandidatesHelper];
    __int16 v45 = (void *)v133;
    if (v187)
    {
      long long v42 = v44;
      id v8 = v210;
      id v9 = v200;
      double v17 = v201;
      long long v11 = v190;
      v134 = (void *)v133;
      goto LABEL_111;
    }
    id v9 = v200;
    double v17 = v201;
    long long v11 = v190;
LABEL_23:
    v46 = [(PHPersonChangeRequest *)self mergeCandidatesWithConfidenceHelper];
    goto LABEL_24;
  }
  v134 = [(PHPersonChangeRequest *)self mergeCandidatesHelper];
LABEL_111:
  v135 = [v134 mutableObjectIDsAndUUIDs];

  if (v135)
  {
    [v134 setAllowsInsert:1];
    [v134 setAllowsMove:0];
    [v134 setAllowsRemove:1];
    v136 = [MEMORY[0x1E4F8AA10] entityName];
    [v134 setDestinationEntityName:v136];

    v137 = [(NSMutableArray *)v8 mutableMergeCandidates];
    id v239 = v42;
    __int16 v45 = v134;
    char v138 = [v134 applyMutationsToManagedObject:v8 unorderedMutableChildren:v137 error:&v239];
    id v44 = v239;

    v46 = [(PHPersonChangeRequest *)self mergeCandidatesWithConfidenceHelper];
    if (v138)
    {
      long long v42 = v44;
      goto LABEL_116;
    }
LABEL_24:
    uint64_t v47 = [(PHPersonChangeRequest *)self invalidMergeCandidatesHelper];
    LODWORD(v48) = 0;
    id v16 = v44;
    goto LABEL_25;
  }
  __int16 v45 = v134;
  v46 = [(PHPersonChangeRequest *)self mergeCandidatesWithConfidenceHelper];
LABEL_116:
  v139 = [v46 mutableObjectIDsAndUUIDs];

  if (v139)
  {
    [v46 setAllowsInsert:1];
    [v46 setAllowsMove:0];
    [v46 setAllowsRemove:1];
    v140 = [MEMORY[0x1E4F8AA10] entityName];
    [v46 setDestinationEntityName:v140];

    v141 = [(NSMutableArray *)v8 mutableMergeCandidatesWithConfidence];
    id v238 = v42;
    int v142 = [v46 applyMutationsToManagedObject:v8 unorderedMutableChildren:v141 error:&v238];
    id v143 = v238;

    uint64_t v47 = [(PHPersonChangeRequest *)self invalidMergeCandidatesHelper];
    if (!v142)
    {
      LODWORD(v48) = 0;
      id v16 = v143;
      id v9 = v200;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v47 = [(PHPersonChangeRequest *)self invalidMergeCandidatesHelper];
    id v143 = v42;
  }
  v144 = [v47 mutableObjectIDsAndUUIDs];

  if (v144)
  {
    [v47 setAllowsInsert:1];
    [v47 setAllowsMove:0];
    [v47 setAllowsRemove:1];
    v145 = [MEMORY[0x1E4F8AA10] entityName];
    [v47 setDestinationEntityName:v145];

    v146 = [(NSMutableArray *)v210 mutableInvalidMergeCandidates];
    id v237 = v143;
    int v147 = [v47 applyMutationsToManagedObject:v210 unorderedMutableChildren:v146 error:&v237];
    id v16 = v237;

    if (!v147)
    {
LABEL_181:
      LODWORD(v48) = 0;
      id v9 = v200;
      double v17 = v201;
      self = v209;
      goto LABEL_25;
    }
  }
  else
  {
    id v16 = v143;
  }
  v197 = v16;
  self = v209;
  if ([(NSMutableSet *)v209->_rejectedMergeCandidatePersonUUIDs count])
  {
    [MEMORY[0x1E4F8AA10] personsWithUUIDs:v209->_rejectedMergeCandidatePersonUUIDs inManagedObjectContext:v11];
    long long v233 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    id v148 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v149 = [v148 countByEnumeratingWithState:&v233 objects:v259 count:16];
    if (v149)
    {
      uint64_t v150 = v149;
      uint64_t v151 = *(void *)v234;
      do
      {
        for (uint64_t j = 0; j != v150; ++j)
        {
          if (*(void *)v234 != v151) {
            objc_enumerationMutation(v148);
          }
          v153 = *(void **)(*((void *)&v233 + 1) + 8 * j);
          v154 = [v153 keyFace];
          [(NSMutableArray *)v210 rejectFaceIfPossible:v154 shouldCreateFaceCrop:1];

          v155 = [(NSMutableArray *)v210 keyFace];
          [v153 rejectFaceIfPossible:v155 shouldCreateFaceCrop:1];
        }
        uint64_t v150 = [v148 countByEnumeratingWithState:&v233 objects:v259 count:16];
      }
      while (v150);
    }

    self = v209;
  }
  id v9 = v200;
  v188 = v45;
  if ([(NSMutableArray *)self->_personUUIDsToMerge count])
  {
    v48 = [MEMORY[0x1E4F8AA10] personsWithUUIDs:self->_personUUIDsToMerge inManagedObjectContext:v11];
    if (!v48)
    {
      id v16 = v197;
      double v17 = v201;
      goto LABEL_25;
    }
    v156 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
    {
      personUUIDsToMerge = self->_personUUIDsToMerge;
      nominalMergeTargetUUID = self->_nominalMergeTargetUUID;
      *(_DWORD *)buf = 138412546;
      v256 = personUUIDsToMerge;
      __int16 v257 = 2112;
      v258 = nominalMergeTargetUUID;
      _os_log_impl(&dword_19B043000, v156, OS_LOG_TYPE_DEFAULT, "Merging persons with UUIDs %@ and nominalMergeTargetUUID %@", buf, 0x16u);
    }

    v186 = v48;
    if (self->_nominalMergeTargetUUID)
    {
      long long v231 = 0u;
      long long v232 = 0u;
      long long v229 = 0u;
      long long v230 = 0u;
      id v159 = v48;
      v160 = (NSMutableArray *)[v159 countByEnumeratingWithState:&v229 objects:v254 count:16];
      if (v160)
      {
        v191 = v11;
        uint64_t v161 = *(void *)v230;
        while (2)
        {
          for (k = 0; k != v160; k = (NSMutableArray *)((char *)k + 1))
          {
            if (*(void *)v230 != v161) {
              objc_enumerationMutation(v159);
            }
            v163 = *(void **)(*((void *)&v229 + 1) + 8 * (void)k);
            v164 = [v163 personUUID];
            int v165 = [v164 isEqualToString:v209->_nominalMergeTargetUUID];

            if (v165)
            {
              v160 = v163;
              goto LABEL_149;
            }
          }
          v160 = (NSMutableArray *)[v159 countByEnumeratingWithState:&v229 objects:v254 count:16];
          if (v160) {
            continue;
          }
          break;
        }
LABEL_149:
        id v9 = v200;
        long long v11 = v191;
      }

      v166 = [(NSMutableArray *)v210 personUUID];
      int v167 = [v166 isEqualToString:v209->_nominalMergeTargetUUID];

      if (v167)
      {
        v168 = v210;

        v160 = v168;
      }
      v169 = PLPhotoKitGetLog();
      v170 = v169;
      self = v209;
      if (v160)
      {
        if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v256 = v160;
          _os_log_impl(&dword_19B043000, v170, OS_LOG_TYPE_DEFAULT, "Found nominal target %@ for merging", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
        {
          v171 = v209->_nominalMergeTargetUUID;
          *(_DWORD *)buf = 138412290;
          v256 = (NSMutableArray *)v171;
          _os_log_impl(&dword_19B043000, v170, OS_LOG_TYPE_ERROR, "Attempting to merge persons with a nominal target identifier (%@) that does not match any of the persons being merged", buf, 0xCu);
        }
        v160 = 0;
      }
    }
    else
    {
      v160 = 0;
    }
    __int16 v45 = v188;
    [(NSMutableArray *)v210 prepareForUserInitiatedMergeWithPersons:v186];
    v172 = [(NSMutableArray *)v210 pickOptimalStateForUserInitiatedMergeWithPersons:v186 nominalTarget:v160];
    [(NSMutableArray *)v210 mergePersons:v186 withOptimalState:v172];
  }
  if ([(NSMutableSet *)self->_graphDedupePersonUUIDs count])
  {
    v173 = [MEMORY[0x1E4F8AA10] personsWithUUIDs:self->_graphDedupePersonUUIDs inManagedObjectContext:v11];
    v174 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v256 = v210;
      __int16 v257 = 2112;
      v258 = v173;
      _os_log_impl(&dword_19B043000, v174, OS_LOG_TYPE_DEFAULT, "Deduping graph persons with target %@, dedupe persons %@", buf, 0x16u);
    }

    id v228 = 0;
    int v175 = [(NSMutableArray *)v210 dedupeGraphPersons:v173 error:&v228];
    id v176 = v228;
    v177 = v176;
    if (!v175)
    {
      v184 = [v176 localizedDescription];
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"%@", v184);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      v185 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v256 = v184;
        _os_log_impl(&dword_19B043000, v185, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      goto LABEL_181;
    }
  }
  [(NSMutableArray *)v210 createUnverifiedPersonForRejectedFaceUUIDs:self->_faceUUIDsRequiringNewUnverifiedPerson inManagedObjectContext:v11];
  if (v194)
  {
    id v227 = v197;
    LODWORD(v48) = [(PHPersonChangeRequest *)self _ensureModelConsistencyForVerifiedTypePromotion:v210 originalVerifiedType:v192 error:&v227];
    id v16 = v227;
  }
  else
  {
    LODWORD(v48) = 1;
    id v16 = v197;
  }
  double v17 = v201;
  if ((v48 & v193) == 1)
  {
    v178 = [(NSMutableArray *)v210 keyFace];
    v179 = [(PHPersonChangeRequest *)self _mutableRequiringFaceCropGenerationFacesUUIDs];
    v198 = v178;
    v180 = [v178 uuid];
    if ([v179 containsObject:v180])
    {
      int v181 = [(NSMutableArray *)v210 verifiedType];

      BOOL v182 = v181 == 1;
      id v9 = v200;
      double v17 = v201;
      __int16 v45 = v188;
      v183 = v198;
      if (v182)
      {
        [(NSMutableArray *)v210 setKeyFacePickSource:1];
        if ([v198 nameSource] != 1)
        {
          [v198 setEffectiveNameSource:1];
          [v198 setConfirmedFaceCropGenerationState:1];
        }
        if ([v201 nameSource] != 1)
        {
          [v201 setEffectiveNameSource:1];
          [v201 setConfirmedFaceCropGenerationState:1];
        }
      }
    }
    else
    {

      v183 = v198;
      id v9 = v200;
      __int16 v45 = v188;
    }

    LODWORD(v48) = 1;
  }
  else
  {
    __int16 v45 = v188;
  }
LABEL_25:

  if (!v48)
  {
    id v8 = v210;
    a5 = v202;
LABEL_77:
    if (a5)
    {
      id v16 = v16;
      BOOL v101 = 0;
      *a5 = v16;
    }
    else
    {
      BOOL v101 = 0;
    }
    goto LABEL_80;
  }
  id v195 = v16;
  id v8 = v210;
  if (self->_userFeedback)
  {
    v49 = [(NSMutableArray *)v210 userFeedbacks];
    v50 = objc_msgSend(v49, "_pl_filter:", &__block_literal_global_24094);

    uint64_t v51 = [MEMORY[0x1E4F8AC70] newestUserFeedbackInSet:v50];
    if (!v51)
    {
      v52 = (void *)MEMORY[0x1E4F8AC70];
      v53 = [(NSMutableArray *)v210 photoLibrary];
      v54 = [v53 managedObjectContext];
      [(PHUserFeedback *)self->_userFeedback uuid];
      v56 = v55 = v11;
      uint64_t v51 = [v52 insertIntoManagedObjectContext:v54 withUUID:v56];

      long long v11 = v55;
      [v51 setPerson:v210];
    }
    objc_msgSend(v51, "setType:", (__int16)-[PHUserFeedback type](self->_userFeedback, "type"));
    objc_msgSend(v51, "setFeature:", (__int16)-[PHUserFeedback feature](self->_userFeedback, "feature"));
    v57 = [(PHUserFeedback *)self->_userFeedback context];
    [v51 setContext:v57];

    v58 = [(PHUserFeedback *)self->_userFeedback lastModifiedDate];
    [v51 setLastModifiedDate:v58];
  }
  if (self->_didUnsetUserFeedback)
  {
    long long v225 = 0u;
    long long v226 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    v59 = [(NSMutableArray *)v210 userFeedbacks];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v223 objects:v253 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v224;
      do
      {
        for (uint64_t m = 0; m != v61; ++m)
        {
          if (*(void *)v224 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = *(void **)(*((void *)&v223 + 1) + 8 * m);
          if (![v64 feature])
          {
            v65 = [(NSMutableArray *)v210 managedObjectContext];
            [v65 deleteObject:v64];
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v223 objects:v253 count:16];
      }
      while (v61);
    }
  }
  if (self->_autonamingUserFeedbacks)
  {
    v189 = v11;
    id v199 = v9;
    v66 = [(NSMutableArray *)v210 userFeedbacks];
    v67 = objc_msgSend(v66, "_pl_filter:", &__block_literal_global_163);
    v68 = (void *)[v67 mutableCopy];

    long long v221 = 0u;
    long long v222 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    obja = self->_autonamingUserFeedbacks;
    uint64_t v69 = [(NSSet *)obja countByEnumeratingWithState:&v219 objects:v252 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v220;
      do
      {
        for (uint64_t n = 0; n != v70; ++n)
        {
          if (*(void *)v220 != v71) {
            objc_enumerationMutation(obja);
          }
          v73 = *(void **)(*((void *)&v219 + 1) + 8 * n);
          v74 = (void *)MEMORY[0x1E4F8AC70];
          v75 = [v73 uuid];
          v76 = [(NSMutableArray *)v8 photoLibrary];
          v77 = [v76 managedObjectContext];
          v78 = [v74 userFeedbackWithUUID:v75 inManagedObjectContext:v77];

          id v8 = v210;
          if (!v78)
          {
            v79 = (void *)MEMORY[0x1E4F8AC70];
            v80 = [(NSMutableArray *)v210 photoLibrary];
            v81 = [v80 managedObjectContext];
            v82 = [v73 uuid];
            v78 = [v79 insertIntoManagedObjectContext:v81 withUUID:v82];

            id v8 = v210;
            [v78 setPerson:v210];
          }
          objc_msgSend(v78, "setType:", (__int16)objc_msgSend(v73, "type"));
          objc_msgSend(v78, "setFeature:", (__int16)objc_msgSend(v73, "feature"));
          v83 = [v73 context];
          [v78 setContext:v83];

          v84 = [v73 lastModifiedDate];
          [v78 setLastModifiedDate:v84];

          [v68 removeObject:v78];
        }
        uint64_t v70 = [(NSSet *)obja countByEnumeratingWithState:&v219 objects:v252 count:16];
      }
      while (v70);
    }

    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v85 = v68;
    uint64_t v86 = [v85 countByEnumeratingWithState:&v215 objects:v251 count:16];
    id v9 = v199;
    long long v11 = v189;
    if (v86)
    {
      uint64_t v87 = v86;
      uint64_t v88 = *(void *)v216;
      do
      {
        for (iuint64_t i = 0; ii != v87; ++ii)
        {
          if (*(void *)v216 != v88) {
            objc_enumerationMutation(v85);
          }
          uint64_t v90 = *(void *)(*((void *)&v215 + 1) + 8 * ii);
          v91 = [(NSMutableArray *)v8 managedObjectContext];
          [v91 deleteObject:v90];
        }
        uint64_t v87 = [v85 countByEnumeratingWithState:&v215 objects:v251 count:16];
      }
      while (v87);
    }

    self = v209;
  }
  if (self->_didUnsetAutonamingUserFeedbacks)
  {
    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    v92 = [(NSMutableArray *)v8 userFeedbacks];
    uint64_t v93 = [v92 countByEnumeratingWithState:&v211 objects:v250 count:16];
    if (v93)
    {
      uint64_t v94 = v93;
      uint64_t v95 = *(void *)v212;
      do
      {
        for (juint64_t j = 0; jj != v94; ++jj)
        {
          if (*(void *)v212 != v95) {
            objc_enumerationMutation(v92);
          }
          v97 = *(void **)(*((void *)&v211 + 1) + 8 * jj);
          if ([v97 feature] == 1 || objc_msgSend(v97, "feature") == 2)
          {
            v98 = [(NSMutableArray *)v8 managedObjectContext];
            [v98 deleteObject:v97];
          }
        }
        uint64_t v94 = [v92 countByEnumeratingWithState:&v211 objects:v250 count:16];
      }
      while (v94);
    }

    self = v209;
  }
  searchEntityRelationsToSet = self->_searchEntityRelationsToSet;
  if (searchEntityRelationsToSet) {
    [MEMORY[0x1E4F8AB90] setPersonRelationsFromDictionaries:searchEntityRelationsToSet onPerson:v8];
  }
  searchEntityRelationsToRemove = self->_searchEntityRelationsToRemove;
  if (searchEntityRelationsToRemove) {
    [MEMORY[0x1E4F8AB90] removePersonRelationsMatchingDictionaries:searchEntityRelationsToRemove onPerson:v8];
  }
  BOOL v101 = 1;
  id v16 = v195;
LABEL_80:

  return v101;
}

BOOL __74__PHPersonChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 feature] == 1 || objc_msgSend(v2, "feature") == 2;

  return v3;
}

BOOL __74__PHPersonChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 feature] == 0;
}

- (BOOL)_shouldPromotePerson:(id)a3 toVerifiedType:(int *)a4
{
  id v6 = a3;
  if ([v6 verifiedType] == 1) {
    goto LABEL_9;
  }
  int v12 = 0;
  if (![(PHPersonChangeRequest *)self _containsUserMutations])
  {
    if ([(PHPersonChangeRequest *)self _hasMutationForVerifiedType:&v12])
    {
      int v7 = v12;
      goto LABEL_6;
    }
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  int v7 = 1;
  int v12 = 1;
LABEL_6:
  int v8 = [v6 verifiedType];
  BOOL v9 = v7 == v8;
  BOOL v10 = v7 != v8;
  if (a4 && !v9)
  {
    *a4 = v12;
    BOOL v10 = 1;
  }
LABEL_10:

  return v10;
}

- (BOOL)_validateMergePerson:(id)a3 withPersonUUIDs:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (![a4 count])
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PHPersonChangeRequest.m", 448, @"Invalid parameter not satisfying: %@", @"personUUIDs.count > 0" object file lineNumber description];
  }
  BOOL v10 = (void *)MEMORY[0x1E4F1C0D0];
  long long v11 = [MEMORY[0x1E4F8AA10] entityName];
  int v12 = [v10 fetchRequestWithEntityName:v11];

  BOOL v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"personUUID", self->_personUUIDsToMerge];
  [v12 setPredicate:v13];

  v22[0] = @"detectionType";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v12 setPropertiesToFetch:v14];

  int v15 = [v9 managedObjectContext];
  id v21 = 0;
  id v16 = [v15 executeFetchRequest:v12 error:&v21];
  id v17 = v21;

  if (v16)
  {
    char v18 = [v9 validateDetectionTypesForMergingWithPersons:v16 error:a5];
  }
  else
  {
    char v18 = 0;
    if (a5) {
      *a5 = v17;
    }
  }

  return v18;
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(PHChangeRequest *)self helper];
  id v42 = 0;
  int v8 = [v7 validateMutationsToManagedObject:v6 error:&v42];
  id v9 = v42;

  if (!v8)
  {
    LOBYTE(v10) = 0;
    if (!a4) {
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  *(_DWORD *)buf = 0;
  if ([(PHPersonChangeRequest *)self _hasMutationForVerifiedType:buf])
  {
    if ([(PHPersonChangeRequest *)self _containsUserMutations] && *(_DWORD *)buf != 1)
    {
      uint64_t v10 = MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28228];
      v52[0] = @"Persons with user mutations cannot be set to a type other than PLPersonVerifiedTypeUser";
      long long v11 = (void *)MEMORY[0x1E4F1C9E8];
      int v12 = (__CFString **)v52;
      BOOL v13 = &v51;
LABEL_11:
      uint64_t v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
      uint64_t v15 = objc_msgSend((id)v10, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v14);

      LOBYTE(v10) = 0;
      goto LABEL_26;
    }
    if ([v6 verifiedType] == 1 && *(_DWORD *)buf != 1)
    {
      uint64_t v10 = MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28228];
      v50 = @"Persons with type PLPersonVerifiedTypeUser cannot be changed";
      long long v11 = (void *)MEMORY[0x1E4F1C9E8];
      int v12 = &v50;
      BOOL v13 = &v49;
      goto LABEL_11;
    }
  }
  id v16 = [(PHChangeRequest *)self helper];
  id v17 = [v16 mutations];
  char v18 = [v17 objectForKeyedSubscript:@"detectionType"];
  int v19 = [v18 isEqual:&unk_1EEB25AB8];

  if (v19)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28228];
    v48 = @"PHDetectionTypePet is not a valid value to assign to Person.detectionType";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v21 = objc_msgSend(v20, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3111, v10);

    LOBYTE(v10) = 0;
    id v9 = (id)v21;
    if (!a4) {
      goto LABEL_31;
    }
LABEL_27:
    if ((v10 & 1) == 0)
    {
      long long v37 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        char v38 = [v9 userInfo];
        long long v39 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
        *(_DWORD *)buf = 138543362;
        id v44 = v39;
        _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_ERROR, "Person change request validation failed: %{public}@", buf, 0xCu);
      }
      id v9 = v9;
      LOBYTE(v10) = 0;
      *a4 = v9;
    }
    goto LABEL_31;
  }
  if ([(NSMutableArray *)self->_personUUIDsToMerge count])
  {
    personUUIDsToMerge = self->_personUUIDsToMerge;
    id v41 = 0;
    LODWORD(v10) = [(PHPersonChangeRequest *)self _validateMergePerson:v6 withPersonUUIDs:personUUIDsToMerge error:&v41];
    id v23 = v41;
    uint64_t v15 = (uint64_t)v23;
    if (!v10)
    {

LABEL_26:
      id v9 = (id)v15;
      if (!a4) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
  }
  if ([v6 keyFacePickSource] != 1)
  {
    LOBYTE(v10) = 1;
    goto LABEL_31;
  }
  char v24 = [(PHChangeRequest *)self helper];
  long long v25 = [v24 mutations];
  v26 = [v25 objectForKey:@"keyFacePickSource"];

  if (!v26) {
    goto LABEL_32;
  }
  if ([v26 shortValue] == 1) {
    goto LABEL_32;
  }
  uint64_t v27 = [v6 keyFace];
  if (!v27) {
    goto LABEL_32;
  }
  uint64_t v28 = (void *)v27;
  uint64_t v29 = [v6 keyFace];
  int v30 = [v29 assetVisible];

  if (v30)
  {
    uint64_t v10 = MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F8C500];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    id v32 = NSString;
    long long v33 = [v6 personUUID];
    uint64_t v34 = [v32 stringWithFormat:@"Attempt to change user-picked keyFacePickSource on person %@", v33];
    v46 = v34;
    long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    uint64_t v36 = [(id)v10 errorWithDomain:v31 code:41005 userInfo:v35];

    LOBYTE(v10) = 0;
    id v9 = (id)v36;
  }
  else
  {
LABEL_32:
    LOBYTE(v10) = 1;
  }

  if (a4) {
    goto LABEL_27;
  }
LABEL_31:

  return v10;
}

- (BOOL)_hasMutationForVerifiedType:(int *)a3
{
  uint64_t v4 = [(PHChangeRequest *)self helper];
  int v5 = [v4 mutations];
  id v6 = [v5 objectForKey:@"verifiedType"];

  if (a3 && v6) {
    *a3 = [v6 intValue];
  }

  return v6 != 0;
}

- (BOOL)_containsUserMutations
{
  BOOL v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];

  int v5 = [v4 objectForKey:@"fullName"];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    int v7 = [v4 objectForKey:@"personUri"];
    if (v7)
    {
      BOOL v6 = 1;
    }
    else
    {
      int v8 = [v4 objectForKey:@"type"];
      if (v8)
      {
        BOOL v6 = 1;
      }
      else
      {
        id v9 = [v4 objectForKey:@"displayName"];
        if (v9)
        {
          BOOL v6 = 1;
        }
        else
        {
          uint64_t v10 = [(PHPersonChangeRequest *)self rejectedFacesHelper];
          long long v11 = [v10 mutableObjectIDsAndUUIDs];
          BOOL v6 = [v11 count] != 0;
        }
      }
    }
  }

  return v6;
}

- (NSString)managedEntityName
{
  return (NSString *)@"Person";
}

- (void)setAutonamingUserFeedbacks:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 feature] != 1 && objc_msgSend(v10, "feature") != 2)
        {
          long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
          [v11 handleFailureInMethod:a2 object:self file:@"PHPersonChangeRequest.m" lineNumber:349 description:@"-setAutonamingUserFeedbacks should only be used for PHUserFeedbacks with feature set to PHUserFeedbackPersonFeatureAutonamingSuggestionWithName or PHUserFeedbackPersonFeatureAutonamingSuggestionWithContactID"];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  int v12 = [(PHChangeRequest *)self helper];
  [v12 didMutate];

  BOOL v13 = (NSSet *)[v5 copy];
  autonamingUserFeedbacks = self->_autonamingUserFeedbacks;
  self->_autonamingUserFeedbacks = v13;

  if (![v5 count]) {
    self->_didUnsetAutonamingUserFeedbacks = 1;
  }
}

- (void)setUserFeedback:(id)a3
{
  id v5 = (PHUserFeedback *)a3;
  if ([(PHUserFeedback *)v5 feature])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PHPersonChangeRequest.m" lineNumber:339 description:@"-setUserFeedback should only be used for PHUserFeedbacks with feature set to PHUserFeedbackPersonFeatureNone"];
  }
  uint64_t v6 = [(PHChangeRequest *)self helper];
  [v6 didMutate];

  userFeedback = self->_userFeedback;
  self->_userFeedback = v5;

  if (!v5) {
    self->_didUnsetUserFeedback = 1;
  }
}

- (BOOL)isVerified
{
  return [(PHPersonChangeRequest *)self verifiedType] == 1;
}

- (void)setVerified:(BOOL)a3
{
}

- (void)setSexType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"genderType"];
}

- (unsigned)sexType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"genderType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setManualOrder:(unint64_t)a3 verified:(BOOL)a4
{
  BOOL v4 = a4;
  [(PHPersonChangeRequest *)self setManualOrder:a3];
  if (v4)
  {
    [(PHPersonChangeRequest *)self setVerified:1];
  }
}

- (void)setAssetSortOrder:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"assetSortOrder"];
}

- (int64_t)assetSortOrder
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"assetSortOrder"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setMdID:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"mdID"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"mdID"];
  }
  else
  {
    [v6 removeObjectForKey:@"mdID"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"mdID"];
  }
}

- (NSString)mdID
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"mdID"];

  return (NSString *)v5;
}

- (void)setDetectionType:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"detectionType"];
}

- (signed)detectionType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"detectionType"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setSuggestedForClientType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"suggestedForClientType"];
}

- (unsigned)suggestedForClientType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"suggestedForClientType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setKeyFacePickSource:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"keyFacePickSource"];
}

- (signed)keyFacePickSource
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"keyFacePickSource"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setContactMatchingDictionary:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"contactMatchingDictionary"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"contactMatchingDictionary"];
  }
  else
  {
    [v6 removeObjectForKey:@"contactMatchingDictionary"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"contactMatchingDictionary"];
  }
}

- (NSDictionary)contactMatchingDictionary
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"contactMatchingDictionary"];

  return (NSDictionary *)v5;
}

- (void)setGenderType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"genderType"];
}

- (unsigned)genderType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"genderType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setAgeType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"ageType"];
}

- (unsigned)ageType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"ageType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setQuestionType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"questionType"];
}

- (unsigned)questionType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"questionType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setVerifiedType:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"verifiedType"];
}

- (int64_t)verifiedType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"verifiedType"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setInPersonNamingModel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"inPersonNamingModel"];
}

- (BOOL)isInPersonNamingModel
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"inPersonNamingModel"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setPersonUri:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"personUri"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"personUri"];
  }
  else
  {
    [v6 removeObjectForKey:@"personUri"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"personUri"];
  }
}

- (NSString)personUri
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"personUri"];

  return (NSString *)v5;
}

- (void)setPersonUUID:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"personUUID"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"personUUID"];
  }
  else
  {
    [v6 removeObjectForKey:@"personUUID"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"personUUID"];
  }
}

- (id)personUUID
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"personUUID"];

  return v5;
}

- (void)setDisplayName:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"displayName"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"displayName"];
  }
  else
  {
    [v6 removeObjectForKey:@"displayName"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"displayName"];
  }
}

- (NSString)displayName
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"displayName"];

  return (NSString *)v5;
}

- (void)setName:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"fullName"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"fullName"];
  }
  else
  {
    [v6 removeObjectForKey:@"fullName"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"fullName"];
  }
}

- (NSString)name
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"fullName"];

  return (NSString *)v5;
}

- (void)setMergeCandidateConfidence:(double)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"mergeCandidateConfidence"];
}

- (double)mergeCandidateConfidence
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"mergeCandidateConfidence"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setManualOrder:(unint64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"manualOrder"];
}

- (unint64_t)manualOrder
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"manualOrder"];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

- (void)setType:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  unint64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"type"];
}

- (int64_t)type
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"type"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (PHObjectPlaceholder)placeholderForCreatedPerson
{
  BOOL v3 = [(PHChangeRequest *)self helper];
  BOOL v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  int64_t v6 = [(PHPersonChangeRequest *)self detectedFacesHelper];
  [v6 encodeToXPCDict:v4];

  double v7 = [(PHPersonChangeRequest *)self temporalFacesHelper];
  [v7 encodeToXPCDict:v4];

  id v8 = [(PHPersonChangeRequest *)self keyFaceHelper];
  [v8 encodeToXPCDict:v4];

  id v9 = [(PHPersonChangeRequest *)self rejectedFacesHelper];
  [v9 encodeToXPCDict:v4];

  id v10 = [(PHPersonChangeRequest *)self mergeCandidatesHelper];
  [v10 encodeToXPCDict:v4];

  long long v11 = [(PHPersonChangeRequest *)self mergeCandidatesWithConfidenceHelper];
  [v11 encodeToXPCDict:v4];

  int v12 = [(PHPersonChangeRequest *)self invalidMergeCandidatesHelper];
  [v12 encodeToXPCDict:v4];

  PLXPCDictionarySetArray();
  BOOL v13 = [(NSMutableSet *)self->_faceUUIDsRequiringFaceCropGeneration allObjects];
  PLXPCDictionarySetArray();

  uint64_t v14 = [(NSMutableSet *)self->_faceUUIDsRequiringNewUnverifiedPerson allObjects];
  PLXPCDictionarySetArray();

  PLXPCDictionarySetString();
  long long v15 = [(NSMutableSet *)self->_rejectedMergeCandidatePersonUUIDs allObjects];
  PLXPCDictionarySetArray();

  long long v16 = [(NSMutableSet *)self->_graphDedupePersonUUIDs allObjects];
  PLXPCDictionarySetArray();

  userFeedback = self->_userFeedback;
  if (userFeedback)
  {
    id v26 = 0;
    long long v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:userFeedback requiringSecureCoding:1 error:&v26];
    id v19 = v26;
    if (v18)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      uint64_t v20 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v19;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEFAULT, "Failed to encode userFeedback object: %@", buf, 0xCu);
      }
    }
  }
  autonamingUserFeedbacks = self->_autonamingUserFeedbacks;
  if (autonamingUserFeedbacks)
  {
    id v25 = 0;
    int v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:autonamingUserFeedbacks requiringSecureCoding:1 error:&v25];
    id v23 = v25;
    if (v22)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      char v24 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v23;
        _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEFAULT, "Failed to encode userFeedback object: %@", buf, 0xCu);
      }
    }
  }
  xpc_dictionary_set_BOOL(v4, "userFeedbackDataUnsetKey", self->_didUnsetUserFeedback);
  xpc_dictionary_set_BOOL(v4, "autonamingUserFeedbackDataUnsetKey", self->_didUnsetAutonamingUserFeedbacks);
  if (self->_searchEntityRelationsToSet) {
    PLXPCDictionarySetArray();
  }
  if (self->_searchEntityRelationsToRemove) {
    PLXPCDictionarySetArray();
  }
}

- (PHPersonChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v81.receiver = self;
  v81.super_class = (Class)PHPersonChangeRequest;
  long long v11 = [(PHChangeRequest *)&v81 init];
  if (v11)
  {
    int v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      id v75 = v10;
      uint64_t v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"detectedFaces" xpcDict:v8 changeRequestHelper:v11->super._helper];
      detectedFacesHelper = v11->_detectedFacesHelper;
      v11->_detectedFacesHelper = v14;

      long long v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"temporalDetectedFaces" xpcDict:v8 changeRequestHelper:v11->super._helper];
      temporalFacesHelper = v11->_temporalFacesHelper;
      v11->_temporalFacesHelper = v16;

      long long v18 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyFace" xpcDict:v8 changeRequestHelper:v11->super._helper];
      keyFaceHelper = v11->_keyFaceHelper;
      v11->_keyFaceHelper = v18;

      uint64_t v20 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"rejectedFaces" xpcDict:v8 changeRequestHelper:v11->super._helper];
      rejectedFacesHelper = v11->_rejectedFacesHelper;
      v11->_rejectedFacesHelper = v20;

      int v22 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"mergeCandidates" xpcDict:v8 changeRequestHelper:v11->super._helper];
      mergeCandidatesHelper = v11->_mergeCandidatesHelper;
      v11->_mergeCandidatesHelper = v22;

      char v24 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"mergeCandidatesWithConfidence" xpcDict:v8 changeRequestHelper:v11->super._helper];
      mergeCandidatesWithConfidenceHelper = v11->_mergeCandidatesWithConfidenceHelper;
      v11->_mergeCandidatesWithConfidenceHelper = v24;

      id v26 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"invalidMergeCandidates" xpcDict:v8 changeRequestHelper:v11->super._helper];
      invalidMergeCandidatesHelper = v11->_invalidMergeCandidatesHelper;
      v11->_invalidMergeCandidatesHelper = v26;

      id v28 = PLArrayFromXPCDictionary();
      uint64_t v29 = [v28 mutableCopy];
      personUUIDsToMerge = v11->_personUUIDsToMerge;
      v11->_personUUIDsToMerge = (NSMutableArray *)v29;

      uint64_t v31 = (void *)MEMORY[0x1E4F1CA80];
      id v32 = PLArrayFromXPCDictionary();
      uint64_t v33 = [v31 setWithArray:v32];
      faceUUIDsRequiringFaceCropGeneratiouint64_t n = v11->_faceUUIDsRequiringFaceCropGeneration;
      v11->_faceUUIDsRequiringFaceCropGeneratiouint64_t n = (NSMutableSet *)v33;

      long long v35 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v36 = PLArrayFromXPCDictionary();
      uint64_t v37 = [v35 setWithArray:v36];
      faceUUIDsRequiringNewUnverifiedPersouint64_t n = v11->_faceUUIDsRequiringNewUnverifiedPerson;
      v11->_faceUUIDsRequiringNewUnverifiedPersouint64_t n = (NSMutableSet *)v37;

      uint64_t v39 = PLStringFromXPCDictionary();
      nominalMergeTargetUUID = v11->_nominalMergeTargetUUID;
      v11->_nominalMergeTargetUUID = (NSString *)v39;

      id v41 = (void *)MEMORY[0x1E4F1CA80];
      id v42 = PLArrayFromXPCDictionary();
      uint64_t v43 = [v41 setWithArray:v42];
      rejectedMergeCandidatePersonUUIDs = v11->_rejectedMergeCandidatePersonUUIDs;
      v11->_rejectedMergeCandidatePersonUUIDs = (NSMutableSet *)v43;

      uint64_t v45 = (void *)MEMORY[0x1E4F1CA80];
      v46 = PLArrayFromXPCDictionary();
      uint64_t v47 = [v45 setWithArray:v46];
      graphDedupePersonUUIDs = v11->_graphDedupePersonUUIDs;
      v11->_graphDedupePersonUUIDs = (NSMutableSet *)v47;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PHPersonChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
      aBlock[3] = &unk_1E5848DF0;
      uint64_t v49 = v11;
      v79 = v49;
      id v80 = v9;
      v50 = (void (**)(void))_Block_copy(aBlock);
      if ([(NSMutableArray *)v11->_personUUIDsToMerge count]
        || [(NSMutableSet *)v11->_rejectedMergeCandidatePersonUUIDs count]
        || [(NSMutableSet *)v11->_graphDedupePersonUUIDs count])
      {
        v50[2](v50);
      }
      uint64_t v51 = PLDataFromXPCDictionary();
      if (v51)
      {
        id v77 = 0;
        uint64_t v52 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v51 error:&v77];
        id v53 = v77;
        userFeedback = v49->_userFeedback;
        v49->_userFeedback = (PHUserFeedback *)v52;

        if (v49->_userFeedback)
        {
          v50[2](v50);
        }
        else
        {
          v55 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v83 = v53;
            _os_log_impl(&dword_19B043000, v55, OS_LOG_TYPE_DEFAULT, "Failed to decode userFeedback object: %@", buf, 0xCu);
          }
        }
      }
      v56 = PLDataFromXPCDictionary();
      if (v56)
      {
        v57 = (void *)MEMORY[0x1E4F28DC0];
        v58 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v59 = objc_opt_class();
        uint64_t v60 = objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
        id v76 = 0;
        uint64_t v61 = [v57 unarchivedObjectOfClasses:v60 fromData:v56 error:&v76];
        id v62 = v76;
        autonamingUserFeedbacks = v49->_autonamingUserFeedbacks;
        v49->_autonamingUserFeedbacks = (NSSet *)v61;

        if (v49->_autonamingUserFeedbacks)
        {
          v50[2](v50);
        }
        else
        {
          v64 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v83 = v62;
            _os_log_impl(&dword_19B043000, v64, OS_LOG_TYPE_DEFAULT, "Failed to decode autonamingUserFeedback object: %@", buf, 0xCu);
          }
        }
      }
      BOOL v65 = xpc_dictionary_get_BOOL(v8, "userFeedbackDataUnsetKey");
      v49->_didUnsetUserFeedback = v65;
      if (v65) {
        v50[2](v50);
      }
      BOOL v66 = xpc_dictionary_get_BOOL(v8, "autonamingUserFeedbackDataUnsetKey");
      v49->_didUnsetAutonamingUserFeedbacks = v66;
      if (v66) {
        v50[2](v50);
      }
      v67 = PLArrayFromXPCDictionary();
      if ([v67 count])
      {
        uint64_t v68 = [v67 mutableCopy];
        searchEntityRelationsToSet = v49->_searchEntityRelationsToSet;
        v49->_searchEntityRelationsToSet = (NSMutableArray *)v68;

        v50[2](v50);
      }
      uint64_t v70 = PLArrayFromXPCDictionary();
      uint64_t v71 = (void *)[v70 mutableCopy];

      if ([v71 count])
      {
        uint64_t v72 = [v71 mutableCopy];
        searchEntityRelationsToRemove = v49->_searchEntityRelationsToRemove;
        v49->_searchEntityRelationsToRemove = (NSMutableArray *)v72;

        v50[2](v50);
      }

      id v10 = v75;
    }
  }

  return v11;
}

uint64_t __69__PHPersonChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setMutated:1];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);

  return [v2 recordUpdateRequest:v3];
}

- (PHPersonChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PHPersonChangeRequest;
  id v8 = [(PHChangeRequest *)&v30 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    long long v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"detectedFaces" changeRequestHelper:v8->super._helper];
    detectedFacesHelper = v8->_detectedFacesHelper;
    v8->_detectedFacesHelper = v11;

    BOOL v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"temporalDetectedFaces" changeRequestHelper:v8->super._helper];
    temporalFacesHelper = v8->_temporalFacesHelper;
    v8->_temporalFacesHelper = v13;

    long long v15 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyFace" changeRequestHelper:v8->super._helper];
    keyFaceHelper = v8->_keyFaceHelper;
    v8->_keyFaceHelper = v15;

    long long v17 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"rejectedFaces" changeRequestHelper:v8->super._helper];
    rejectedFacesHelper = v8->_rejectedFacesHelper;
    v8->_rejectedFacesHelper = v17;

    id v19 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"mergeCandidates" changeRequestHelper:v8->super._helper];
    mergeCandidatesHelper = v8->_mergeCandidatesHelper;
    v8->_mergeCandidatesHelper = v19;

    uint64_t v21 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"mergeCandidatesWithConfidence" changeRequestHelper:v8->super._helper];
    mergeCandidatesWithConfidenceHelper = v8->_mergeCandidatesWithConfidenceHelper;
    v8->_mergeCandidatesWithConfidenceHelper = v21;

    id v23 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"invalidMergeCandidates" changeRequestHelper:v8->super._helper];
    invalidMergeCandidatesHelper = v8->_invalidMergeCandidatesHelper;
    v8->_invalidMergeCandidatesHelper = v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    searchEntityRelationsToSet = v8->_searchEntityRelationsToSet;
    v8->_searchEntityRelationsToSet = (NSMutableArray *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    searchEntityRelationsToRemove = v8->_searchEntityRelationsToRemove;
    v8->_searchEntityRelationsToRemove = (NSMutableArray *)v27;
  }
  return v8;
}

- (id)initForNewObject
{
  v24.receiver = self;
  v24.super_class = (Class)PHPersonChangeRequest;
  id v2 = [(PHChangeRequest *)&v24 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"detectedFaces" changeRequestHelper:v2->super._helper];
    detectedFacesHelper = v2->_detectedFacesHelper;
    v2->_detectedFacesHelper = v5;

    id v7 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"temporalDetectedFaces" changeRequestHelper:v2->super._helper];
    temporalFacesHelper = v2->_temporalFacesHelper;
    v2->_temporalFacesHelper = v7;

    id v9 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyFace" changeRequestHelper:v2->super._helper];
    keyFaceHelper = v2->_keyFaceHelper;
    v2->_keyFaceHelper = v9;

    long long v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"rejectedFaces" changeRequestHelper:v2->super._helper];
    rejectedFacesHelper = v2->_rejectedFacesHelper;
    v2->_rejectedFacesHelper = v11;

    BOOL v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"mergeCandidates" changeRequestHelper:v2->super._helper];
    mergeCandidatesHelper = v2->_mergeCandidatesHelper;
    v2->_mergeCandidatesHelper = v13;

    long long v15 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"mergeCandidatesWithConfidence" changeRequestHelper:v2->super._helper];
    mergeCandidatesWithConfidenceHelper = v2->_mergeCandidatesWithConfidenceHelper;
    v2->_mergeCandidatesWithConfidenceHelper = v15;

    long long v17 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"invalidMergeCandidates" changeRequestHelper:v2->super._helper];
    invalidMergeCandidatesHelper = v2->_invalidMergeCandidatesHelper;
    v2->_invalidMergeCandidatesHelper = v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    searchEntityRelationsToSet = v2->_searchEntityRelationsToSet;
    v2->_searchEntityRelationsToSet = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    searchEntityRelationsToRemove = v2->_searchEntityRelationsToRemove;
    v2->_searchEntityRelationsToRemove = (NSMutableArray *)v21;
  }
  return v2;
}

+ (BOOL)_allPersonsAreGraphPersons:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (!v4)
  {
    BOOL v9 = 1;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v14;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "found non-PHPerson in collection", buf, 2u);
        }
        goto LABEL_16;
      }
      if (objc_msgSend(v8, "verifiedType", (void)v13) != 2)
      {
        id v10 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          long long v11 = [v8 uuid];
          *(_DWORD *)buf = 138543362;
          long long v18 = v11;
          _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "found non-graph-verified PHPerson %{public}@ in collection", buf, 0xCu);
        }
LABEL_16:

        BOOL v9 = 0;
        goto LABEL_17;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    BOOL v9 = 1;
    if (v5) {
      continue;
    }
    break;
  }
LABEL_17:

  return v9;
}

+ (id)changeRequestForDedupingGraphPersons:(id)a3 withUserVerifiedPerson:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _allPersonsAreGraphPersons:v6])
  {
    if ([v7 verifiedType] == 1)
    {
      id v8 = [a1 changeRequestForPerson:v7];
      [v8 _setGraphDedupePersons:v6];
      goto LABEL_8;
    }
    BOOL v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v7 uuid];
      int v12 = 138543618;
      long long v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [v7 verifiedType];
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Expected user-verified person for deduping but got person %{public}@ verifiedType %td", (uint8_t *)&v12, 0x16u);
    }
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

+ (id)changeRequestForDedupingGraphPersons:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 _allPersonsAreGraphPersons:v4])
  {
    uint64_t v5 = +[PHPerson personToKeepForCloudConsistencyFromPersons:v4];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          if (v5 != *(void **)(*((void *)&v14 + 1) + 8 * i)) {
            [v6 addObject:(void)v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    int v12 = [a1 changeRequestForPerson:v5];
    [v12 _setGraphDedupePersons:v6];
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

+ (id)changeRequestsForMergeCandidatePersons:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        long long v17 = +[PHPersonChangeRequest changeRequestForPerson:](PHPersonChangeRequest, "changeRequestForPerson:", v16, (void)v22);
        long long v18 = (void *)[v11 mutableCopy];
        [v18 removeObject:v16];
        [v17 addMergeCandidatePersons:v18];
        [v4 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }

  if ([v4 count]) {
    uint64_t v19 = v4;
  }
  else {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v20 = v19;

  return v20;
}

+ (id)changeRequestForMergingPersons:(id)a3 nominalTargetIdentifier:(id)a4
{
  id v25 = a1;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v28 = +[PHPerson personToKeepForCloudConsistencyFromPersons:v5];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "localIdentifier", v25);
        id v14 = v6;
        char v15 = [v13 isEqualToString:v6];

        uint64_t v16 = [v12 localIdentifier];
        long long v17 = [v28 localIdentifier];
        char v18 = [v16 isEqual:v17];

        if ((v18 & 1) == 0) {
          [v26 addObject:v12];
        }
        v9 |= v15;
        id v6 = v14;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  if (v6 && (v9 & 1) == 0)
  {
    uint64_t v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Attempting to merge persons with a nominal target identifier (%@) that does not match any of the persons being merged", buf, 0xCu);
    }
  }
  if (v28 && [v26 count])
  {
    id v20 = [v25 changeRequestForPerson:v28];
    uint64_t v21 = v20;
    if (v6)
    {
      long long v22 = +[PHObject uuidFromLocalIdentifier:v6];
      [v21 _setNominalMergeTargetUUID:v22];
    }
    else
    {
      [v20 _setNominalMergeTargetUUID:0];
    }
    objc_msgSend(v21, "mergePersons:", v26, v25);
  }
  else
  {
    long long v23 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = obj;
      _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Merging persons requires a valid merge target and at least 1 person to merge: %@", buf, 0xCu);
    }

    uint64_t v21 = 0;
  }

  return v21;
}

+ (id)changeRequestForMergingPersons:(id)a3
{
  return (id)[a1 changeRequestForMergingPersons:a3 nominalTargetIdentifier:0];
}

+ (void)deletePersons:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)changeRequestForPerson:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[PHChangeRequestHelper changeRequestForObject:v3];
    [v4 setTargetPerson:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)creationRequestForPerson
{
  id v2 = [[PHPersonChangeRequest alloc] initForNewObject];

  return v2;
}

@end