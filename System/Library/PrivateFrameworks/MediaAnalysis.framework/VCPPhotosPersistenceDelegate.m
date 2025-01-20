@interface VCPPhotosPersistenceDelegate
+ (CGSize)faceTileSizeAdjustingForImageAspectRatio:(CGSize)result imgWidth:(double)a4 imgHeight:(double)a5;
+ (id)newAllFacesFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)newAllPersonsFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)newAssetFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)newFacesDeterministicSortDescriptors;
+ (id)newVerifiedPersonsFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)newVerifiedPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)newVisibleFacesFetchOptionsWithPhotoLibrary:(id)a3;
+ (void)enumerateFetchResult:(id)a3 withBatchSize:(unint64_t)a4 handler:(id)a5;
- (BOOL)_cleanupMergeCandidatesForVerifiedPersons:(id)a3 minimumFaceGroupSize:(unint64_t)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)_completePersonBuildingWithPersonsToUpdate:(id)a3 facesToRemoveByPerson:(id)a4 facesToAddByPerson:(id)a5 updateFaceGroup:(id)a6 newMergeCandidatePairs:(id)a7 newInvalidMergeCandidatePairs:(id)a8 faceInFaceGroupByCSN:(id)a9 personCache:(id)a10 keyFaceUpdateBlock:(id)a11 cancelOrExtendTimeoutBlock:(id)a12 context:(id)a13 error:(id *)a14;
- (BOOL)_resetFaceClusterSequenceNumberOfFacesInFetchResult:(id)a3 inPhotoLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)_ungroupFaceClusterSequenceNumbers:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5;
- (BOOL)cleanupGroupedFacesWithClusterSequenceNumberSetToZero:(id)a3 error:(id *)a4;
- (BOOL)cleanupMergeCandidatesWithMinimumFaceGroupSize:(unint64_t)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5;
- (BOOL)cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:(id)a3 error:(id *)a4;
- (BOOL)deleteEmptyGroupsAndReturnError:(id *)a3;
- (BOOL)needsPersonBuilding;
- (BOOL)persistChangesToAlgorithmicFaceGroups:(id)a3 l1ClustersByFaceCSNRepresentingFaceGroup:(id)a4 l0ClustersByFaceCSNRepresentingFaceGroup:(id)a5 faceCSNByLocalIdentifierForNewlyClusteredFaces:(id)a6 faceCSNsOfUnclusteredFaces:(id)a7 localIdentifiersOfUnclusteredFaces:(id)a8 persistenceCompletionBlock:(id)a9 cancelOrExtendTimeoutBlock:(id)a10 error:(id *)a11;
- (BOOL)personBuilderMergeCandidatesDisabled;
- (BOOL)removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5;
- (BOOL)resetLibraryClustersWithCancelOrExtendTimeoutBlock:(id)a3 error:(id *)a4;
- (BOOL)ungroupFaceClusterSequenceNumbers:(id)a3 batchSizeForUnclusteringFaces:(unint64_t)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (VCPPhotosPersistenceDelegate)initWithPhotoLibrary:(id)a3;
- (double)_keyFacePortraitFactorCoefficient;
- (double)_keyFaceSunglassesFactorCoefficient;
- (double)_keyFaceWeightingFactorCoefficient;
- (id)_bestVURepresentativeFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 candidateFaces:(id)a5 cancelOrExtendTimeoutBlock:(id)a6;
- (id)_duplicateFaceCSNsOnAssetForPerson:(id)a3 faceCSNsOnPerson:(id)a4 faceByCSNCache:(id)a5;
- (id)_faceToFaceCountMapForFaces:(id)a3;
- (id)_facesFromFaceGroupWithMostNumberOfFacesOnPerson:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_fetchResultForGroupedFacesWithClusterSequenceNumberSetToZeroInPhotoLibrary:(id)a3;
- (id)_fetchResultForUngroupedFacesWithNonZeroClusterSequenceNumberInPhotoLibrary:(id)a3;
- (id)_localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
- (id)_representativenessByFaceCSNFromFaces:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
- (id)_updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:(id)a3 fetchLimit:(unint64_t)a4;
- (id)bestRepresentativeFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 candidateFaces:(id)a5 cancelOrExtendTimeoutBlock:(id)a6;
- (id)densityClusteringForObjects:(id)a3 maximumDistance:(double)a4 minimumNumberOfObjects:(unint64_t)a5 withDistanceBlock:(id)a6;
- (id)deterministicallyOrderedFaceIdentifiersWithLocalIdentifiers:(id)a3 faceprintVersion:(int)a4;
- (id)facesForClusteringWithLocalIdentifiers:(id)a3 faceprintVersion:(int)a4 groupingIdentifiers:(id)a5;
- (id)fetchFaceWithClusterSequenceNumber:(id)a3 error:(id *)a4;
- (id)fetchFaceWithLocalIdentifier:(id)a3 error:(id *)a4;
- (id)fetchPersonWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:(unint64_t)a3 error:(id *)a4;
- (id)identifyConflictingL0Clusters:(id)a3 csnToRejectedPersonForNewlyClusteredFaces:(id)a4 csnToConfirmedPersonForNewlyClusteredFaces:(id)a5;
- (id)invalidFaceClusterSequenceNumbersInClusterSequenceNumbers:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5;
- (id)keyFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 updateBlock:(id)a5;
- (id)otherFacesOnAssetWithFace:(id)a3 options:(id)a4;
- (id)performSocialGroupsIdentifiersWithPersonClusterManager:(id)a3 forPersons:(id)a4 overTheYearsComputation:(BOOL)a5 updateBlock:(id)a6;
- (id)suggestedMeIdentifierWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5;
- (id)unclusteredClusteringEligibleFaceLocalIdentifiers:(id *)a3;
- (unint64_t)_level0ClusterIdForFaceCSN:(unint64_t)a3 level0Clusters:(id)a4;
- (unint64_t)countOfClusteredFaces;
- (unint64_t)countOfClusteringEligibleFaces;
- (unint64_t)countOfFaces;
- (unint64_t)countOfUnclusteredClusteringEligibleFaces;
- (void)_adjustConfirmingAndRejectionWithFaces:(id)a3 faceCrops:(id)a4 cancelOrExtendTimeoutBlock:(id)a5;
- (void)_buildPersonsFromUpdatedFaceGroups:(id)a3 faceClusterer:(id)a4 keyFaceUpdateBlock:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 context:(id)a7;
- (void)_categorizeGroupedFacesInFetchResult:(id)a3 intoFaceLocalIdentifiersByFaceGroup:(id)a4 ungroupedFaceLocalIdentifiers:(id *)a5 cancelOrExtendTimeoutBlock:(id)a6 photoLibrary:(id)a7;
- (void)_detectDuplicationInExistingFaceCrops:(id)a3 withFetchedFaces:(id)a4 faceCropFaceIdentifiersToEvaluate:(id)a5 duplicationResults:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7;
- (void)_enumeratePersonsWithLocalIdentifiers:(id)a3 fetchOptions:(id)a4 personCache:(id)a5 usingBlock:(id)a6;
- (void)_getMergeCandidates:(id)a3 invalidMergeCandidates:(id)a4 forPersonsWithLocalIdentifiers:(id)a5;
- (void)_getRejectedTrainingFaceCSNs:(id *)a3 rejectedFaceCSNs:(id *)a4 rejectedPersonLocalIdentifiers:(id *)a5 forPerson:(id)a6 faceInFaceGroupByCSN:(id)a7;
- (void)_getTrainingFacesByPerson:(id *)a3 confirmedFaceCSNs:(id *)a4 faceCSNsByPerson:(id *)a5 faceCSNsByMigratedPerson:(id *)a6 faceCSNsByQuickClassificationPerson:(id *)a7 mergeCandidates:(id *)a8 invalidMergeCandidates:(id *)a9 rejectedPersonsByPerson:(id *)a10 faceInFaceGroupByCSN:(id *)a11 inFaces:(id)a12 personCache:(id)a13 cancelOrExtendTimeoutBlock:(id)a14;
- (void)_processNewlyClusteredFaceCropsInFaceGroups:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
- (void)_updateFaceCSNsToAddByPerson:(id)a3 faceCSNsToRemoveByPerson:(id)a4 faceInFaceGroupByCSN:(id)a5 faceCSNsByPersonLocalIdentifier:(id)a6 faceCSNsByMigratedPersonLocalIdentifier:(id)a7 personsToUpdate:(id)a8;
- (void)buildPersonWithFaceClusterer:(id)a3 keyFaceUpdateBlock:(id)a4 context:(id)a5 cancelOrExtendTimeoutBlock:(id)a6;
- (void)dedupeGraphVerifiedPersonsInFaceGroup:(id)a3 personCache:(id)a4;
- (void)setPersonBuilderMergeCandidatesDisabled:(BOOL)a3;
@end

@implementation VCPPhotosPersistenceDelegate

- (VCPPhotosPersistenceDelegate)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VCPPhotosPersistenceDelegate;
  v5 = [(VCPPhotosPersistenceDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
  }

  return v6;
}

+ (id)newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  [v3 setMinimumUnverifiedFaceCount:1];
  [v3 setMinimumVerifiedFaceCount:1];
  [v3 setIncludedDetectionTypes:&unk_1F15EE160];
  return v3;
}

+ (id)newAssetFetchOptionsWithPhotoLibrary:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 librarySpecificFetchOptions];
  v6[0] = *MEMORY[0x1E4F39478];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 setFetchPropertySets:v4];

  return v3;
}

+ (id)newAllFacesFetchOptionsWithPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  [v3 setIncludeNonvisibleFaces:1];
  [v3 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v3 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  [v3 setIncludedDetectionTypes:&unk_1F15EE178];
  return v3;
}

+ (id)newVisibleFacesFetchOptionsWithPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  [v3 setIncludeNonvisibleFaces:0];
  [v3 setIncludeTorsoOnlyDetectionData:0];
  [v3 setIncludedDetectionTypes:&unk_1F15EE190];
  return v3;
}

+ (id)newFacesDeterministicSortDescriptors
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newAllPersonsFetchOptionsWithPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  [v3 setMinimumUnverifiedFaceCount:0];
  [v3 setMinimumVerifiedFaceCount:0];
  [v3 setIncludeTorsoOnlyPerson:1];
  [v3 setIncludedDetectionTypes:&unk_1F15EE1A8];
  return v3;
}

+ (id)newVerifiedPersonsFetchOptionsWithPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(verifiedType = %d) OR (verifiedType = %d)", 1, 2);
  [v3 setPredicate:v4];

  [v3 setMinimumVerifiedFaceCount:0];
  [v3 setIncludeTorsoOnlyPerson:1];
  [v3 setIncludedDetectionTypes:&unk_1F15EE1C0];
  return v3;
}

- (unint64_t)countOfFaces
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v5 = (void *)[v3 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  [v5 setShouldPrefetchCount:1];
  v10[0] = *MEMORY[0x1E4F39630];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 setFetchPropertySets:v6];

  v7 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v5];
  unint64_t v8 = [v7 count];

  return v8;
}

- (unint64_t)countOfClusteringEligibleFaces
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  p_photoLibrary = &self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v6 = (void *)[v3 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  [v6 setIncludeOnlyFacesWithFaceprints:1];
  v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = objc_loadWeakRetained((id *)p_photoLibrary);
  v9 = objc_msgSend(v7, "predicateWithFormat:", @"(faceAlgorithmVersion = %d) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))", objc_msgSend(v8, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  [v6 setInternalPredicate:v9];

  [v6 setShouldPrefetchCount:1];
  v14[0] = *MEMORY[0x1E4F39630];
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v6 setFetchPropertySets:v10];

  v11 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v6];
  unint64_t v12 = [v11 count];

  return v12;
}

- (unint64_t)countOfUnclusteredClusteringEligibleFaces
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  unint64_t v3 = objc_msgSend(WeakRetained, "mad_countOfUnclusteredFaces");

  return v3;
}

- (unint64_t)countOfClusteredFaces
{
  v11[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v5 = (void *)[v3 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  [v5 setShouldPrefetchCount:1];
  v11[0] = *MEMORY[0x1E4F39630];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v5 setFetchPropertySets:v6];

  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(clusterSequenceNumber > 0)"];
  [v5 setPredicate:v7];

  id v8 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v5];
  unint64_t v9 = [v8 count];

  return v9;
}

- (id)unclusteredClusteringEligibleFaceLocalIdentifiers:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1C186D320](self, a2, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v6 = objc_msgSend(WeakRetained, "mad_unclusteredFacesFetchOptions");

  v15[0] = *MEMORY[0x1E4F39630];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v6 setFetchPropertySets:v7];

  id v8 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v6];
  unint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
  for (unint64_t i = 0; i < [v8 count]; ++i)
  {
    v11 = (void *)MEMORY[0x1C186D320]();
    unint64_t v12 = [v8 objectAtIndexedSubscript:i];
    v13 = [v12 localIdentifier];
    [v9 addObject:v13];
  }

  return v9;
}

- (id)deterministicallyOrderedFaceIdentifiersWithLocalIdentifiers:(id)a3 faceprintVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  unint64_t v9 = (void *)[v7 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  v10 = (void *)[(id)objc_opt_class() newFacesDeterministicSortDescriptors];
  [v9 setInternalSortDescriptors:v10];

  v20[0] = *MEMORY[0x1E4F39630];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v9 setFetchPropertySets:v11];

  unint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(manual == 0) AND (faceAlgorithmVersion = %d)", v4);
  [v9 setInternalPredicate:v12];

  v13 = [MEMORY[0x1E4F39048] fetchFacesWithLocalIdentifiers:v6 options:v9];
  v14 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; i < [v13 count]; ++i)
  {
    v16 = (void *)MEMORY[0x1C186D320]();
    v17 = [v13 objectAtIndexedSubscript:i];
    v18 = [v17 localIdentifier];
    [v14 addObject:v18];
  }

  return v14;
}

- (id)facesForClusteringWithLocalIdentifiers:(id)a3 faceprintVersion:(int)a4 groupingIdentifiers:(id)a5
{
  v40[4] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v36 = a5;
  p_photoLibrary = &self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v35 = objc_msgSend(WeakRetained, "mad_unclusteredFacesFetchOptions");

  unint64_t v9 = (void *)[(id)objc_opt_class() newFacesDeterministicSortDescriptors];
  [v35 setInternalSortDescriptors:v9];

  uint64_t v10 = *MEMORY[0x1E4F39620];
  v40[0] = *MEMORY[0x1E4F39630];
  v40[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F39638];
  v40[2] = *MEMORY[0x1E4F39610];
  v40[3] = v11;
  unint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  [v35 setFetchPropertySets:v12];

  v13 = [MEMORY[0x1E4F39048] fetchFacesWithLocalIdentifiers:v34 options:v35];
  if ([v13 count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    v39 = [MEMORY[0x1E4F38EC0] fetchAssetsGroupedByFaceUUIDForFaces:v13];
    id v14 = objc_loadWeakRetained((id *)p_photoLibrary);
    v33 = [v14 librarySpecificFetchOptions];

    v15 = (void *)MEMORY[0x1E4F39198];
    v16 = [v39 allValues];
    v38 = [v15 fetchMomentUUIDByAssetUUIDForAssets:v16 options:v33];

    for (unint64_t i = 0; i < objc_msgSend(v13, "count", v33); ++i)
    {
      v18 = (void *)MEMORY[0x1C186D320]();
      v19 = [v13 objectAtIndexedSubscript:i];
      v20 = [v19 faceClusteringProperties];
      v21 = [v20 faceprint];
      BOOL v22 = v21 == 0;

      if (!v22)
      {
        v23 = +[VCPPhotosFace faceFromPHFace:v19 copyOption:3];
        v24 = (void *)MEMORY[0x1E4F391C8];
        v25 = [v19 localIdentifier];
        v26 = [v24 uuidFromLocalIdentifier:v25];

        v27 = [v39 valueForKey:v26];
        v28 = [v27 uuid];
        v29 = [v38 objectForKey:v28];

        v30 = [MEMORY[0x1E4F45718] nonGroupedGroupID];
        if (v29)
        {
          uint64_t v31 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v29];

          v30 = (void *)v31;
        }
        if (v23)
        {
          [v37 addObject:v23];
          [v36 addObject:v30];
        }
      }
    }
  }
  else
  {
    id v37 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v37;
}

- (id)invalidFaceClusterSequenceNumbersInClusterSequenceNumbers:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 1;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__25;
    v33 = __Block_byref_object_dispose__25;
    id v34 = 0;
    uint64_t v11 = (void *)[v8 mutableCopy];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    BOOL v22 = __123__VCPPhotosPersistenceDelegate_invalidFaceClusterSequenceNumbersInClusterSequenceNumbers_cancelOrExtendTimeoutBlock_error___block_invoke;
    v23 = &unk_1E6299220;
    v27 = &v35;
    v28 = &v29;
    id v26 = v9;
    v24 = self;
    id v12 = v11;
    id v25 = v12;
    v13 = _Block_copy(&v20);
    id v14 = objc_msgSend(v8, "allObjects", v20, v21, v22, v23, v24);
    objc_msgSend(v14, "persistenceDelegate_enumerateInChunksOfSize:withOverageAllowance:usingBlock:", 200, 25, v13);

    if (*((unsigned char *)v36 + 24))
    {
      id v15 = v12;
    }
    else
    {
      id v15 = 0;
      if (a5) {
        *a5 = (id) v30[5];
      }
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    if (a5)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v17 = [NSString stringWithFormat:@"Could not access the library"];
      v40[0] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      *a5 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v18];
    }
    id v15 = 0;
  }

  return v15;
}

void __123__VCPPhotosPersistenceDelegate_invalidFaceClusterSequenceNumbersInClusterSequenceNumbers_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 48);
  if (!v8)
  {
LABEL_6:
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v17 + 40);
    uint64_t v10 = [WeakRetained faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers:v7 error:&obj];
    objc_storeStrong((id *)(v17 + 40), obj);

    [*(id *)(a1 + 40) minusSet:v10];
    goto LABEL_7;
  }
  if (!(*(unsigned int (**)(void))(v8 + 16))())
  {
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
    goto LABEL_6;
  }
  *a5 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  id v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F28568];
  uint64_t v10 = [NSString stringWithFormat:@"Canceled operation to get CSNs of faces missing from the library"];
  v20[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v12 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

LABEL_7:
}

- (void)_categorizeGroupedFacesInFetchResult:(id)a3 intoFaceLocalIdentifiersByFaceGroup:(id)a4 ungroupedFaceLocalIdentifiers:(id *)a5 cancelOrExtendTimeoutBlock:(id)a6 photoLibrary:(id)a7
{
  id v21 = a3;
  id v11 = a4;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  id v14 = [WeakRetained librarySpecificFetchOptions];

  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  v16 = objc_opt_class();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __175__VCPPhotosPersistenceDelegate__categorizeGroupedFacesInFetchResult_intoFaceLocalIdentifiersByFaceGroup_ungroupedFaceLocalIdentifiers_cancelOrExtendTimeoutBlock_photoLibrary___block_invoke;
  v22[3] = &unk_1E6299270;
  id v17 = v12;
  id v26 = v17;
  id v18 = v14;
  id v23 = v18;
  id v19 = v11;
  id v24 = v19;
  id v20 = v15;
  id v25 = v20;
  [v16 enumerateFetchResult:v21 withBatchSize:100 handler:v22];
  if (a5) {
    *a5 = v20;
  }
}

void __175__VCPPhotosPersistenceDelegate__categorizeGroupedFacesInFetchResult_intoFaceLocalIdentifiersByFaceGroup_ungroupedFaceLocalIdentifiers_cancelOrExtendTimeoutBlock_photoLibrary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8 && (*(unsigned int (**)(void))(v8 + 16))())
  {
    *a5 = 1;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F39080] fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces:v7 options:*(void *)(a1 + 32)];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __175__VCPPhotosPersistenceDelegate__categorizeGroupedFacesInFetchResult_intoFaceLocalIdentifiersByFaceGroup_ungroupedFaceLocalIdentifiers_cancelOrExtendTimeoutBlock_photoLibrary___block_invoke_2;
    aBlock[3] = &unk_1E6299248;
    id v14 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    uint64_t v10 = _Block_copy(aBlock);
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __175__VCPPhotosPersistenceDelegate__categorizeGroupedFacesInFetchResult_intoFaceLocalIdentifiersByFaceGroup_ungroupedFaceLocalIdentifiers_cancelOrExtendTimeoutBlock_photoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8 && (*(unsigned int (**)(void))(v8 + 16))())
  {
    *a4 = 1;
  }
  else
  {
    id v9 = [v7 firstObject];
    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) objectForKey:v9];
      if (!v10)
      {
        uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:");
      }
      [v10 addObject:v11];
    }
    else
    {
      [*(id *)(a1 + 40) addObject:v11];
    }
  }
}

- (BOOL)ungroupFaceClusterSequenceNumbers:(id)a3 batchSizeForUnclusteringFaces:(unint64_t)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v27 = a5;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__25;
  v42 = __Block_byref_object_dispose__25;
  id v43 = 0;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v8);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v35;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v35 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * v12);
      id v14 = (void *)MEMORY[0x1C186D320]();
      [v9 unionSet:v13];
      if ([v9 count] <= a4) {
        goto LABEL_11;
      }
      [v9 removeObject:&unk_1F15EBC88];
      uint64_t v15 = [v9 allObjects];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __129__VCPPhotosPersistenceDelegate_ungroupFaceClusterSequenceNumbers_batchSizeForUnclusteringFaces_cancelOrExtendTimeoutBlock_error___block_invoke;
      v30[3] = &unk_1E6299298;
      v32 = &v44;
      v30[4] = self;
      id v31 = v27;
      v33 = &v38;
      objc_msgSend(v15, "persistenceDelegate_enumerateInChunksOfSize:withOverageAllowance:usingBlock:", a4, 0, v30);
      int v16 = *((unsigned __int8 *)v45 + 24);
      if (*((unsigned char *)v45 + 24))
      {
        [v9 removeAllObjects];
        int v17 = 0;
      }
      else
      {
        int v17 = 4;
      }

      if (v16) {
LABEL_11:
      }
        int v17 = 0;
      if (v17) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v18 = v45;
  if (*((unsigned char *)v45 + 24))
  {
    if (![v9 count])
    {
LABEL_25:
      id v18 = v45;
      goto LABEL_26;
    }
    [v9 removeObject:&unk_1F15EBC88];
    id v19 = (id *)(v39 + 5);
    id v29 = (id)v39[5];
    BOOL v20 = [(VCPPhotosPersistenceDelegate *)self _ungroupFaceClusterSequenceNumbers:v9 cancelOrExtendTimeoutBlock:v27 error:&v29];
    objc_storeStrong(v19, v29);
    id v18 = v45;
    *((unsigned char *)v45 + 24) = v20;
    if (a6) {
      char v21 = v20;
    }
    else {
      char v21 = 1;
    }
    if ((v21 & 1) == 0)
    {
      id v22 = (id) v39[5];
LABEL_24:
      *a6 = v22;
      goto LABEL_25;
    }
  }
  else if (a6)
  {
    id v22 = (id) v39[5];
    goto LABEL_24;
  }
LABEL_26:
  BOOL v23 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v23;
}

void __129__VCPPhotosPersistenceDelegate_ungroupFaceClusterSequenceNumbers_batchSizeForUnclusteringFaces_cancelOrExtendTimeoutBlock_error___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  id v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v10 + 40);
  char v11 = [v8 _ungroupFaceClusterSequenceNumbers:v7 cancelOrExtendTimeoutBlock:v9 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v11;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *a5 = 1;
  }
}

- (BOOL)_ungroupFaceClusterSequenceNumbers:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v7 = (unsigned int (**)(void))a4;
  v61 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v8 = objc_opt_class();
  location = (id *)&self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  uint64_t v10 = (void *)[v8 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  uint64_t v11 = *MEMORY[0x1E4F39630];
  v84[0] = *MEMORY[0x1E4F39630];
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
  [v10 setFetchPropertySets:v12];

  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(clusterSequenceNumber in %@)", v53];
  [v10 setPredicate:v13];

  v54 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v10];
  id v73 = 0;
  id v14 = objc_loadWeakRetained((id *)&self->_photoLibrary);
  [(VCPPhotosPersistenceDelegate *)self _categorizeGroupedFacesInFetchResult:v54 intoFaceLocalIdentifiersByFaceGroup:v61 ungroupedFaceLocalIdentifiers:&v73 cancelOrExtendTimeoutBlock:v7 photoLibrary:v14];
  id v55 = v73;

  if (v7 && v7[2](v7))
  {
    if (a5)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v82 = *MEMORY[0x1E4F28568];
      int v16 = [NSString stringWithFormat:@"Canceled operation to ungroup faces"];
      v83 = v16;
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      *a5 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v17];
    }
    id v18 = 0;
    goto LABEL_40;
  }
  id v19 = objc_opt_class();
  id v20 = objc_loadWeakRetained(location);
  v60 = (void *)[v19 newAllFacesFetchOptionsWithPhotoLibrary:v20];

  uint64_t v81 = v11;
  char v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  [v60 setFetchPropertySets:v21];

  if ([v55 count])
  {
    id v22 = [MEMORY[0x1E4F39048] fetchFacesWithLocalIdentifiers:v55 options:v60];
    id v23 = objc_loadWeakRetained(location);
    id v72 = 0;
    BOOL v24 = [(VCPPhotosPersistenceDelegate *)self _resetFaceClusterSequenceNumberOfFacesInFetchResult:v22 inPhotoLibrary:v23 cancelOrExtendTimeoutBlock:v7 error:&v72];
    id v18 = v72;

    if (v24) {
      goto LABEL_10;
    }
    uint64_t v10 = v60;
    if (!a5)
    {
LABEL_40:
      char v28 = 0;
      goto LABEL_50;
    }
    uint64_t v44 = [v18 domain];
    if ([v44 isEqualToString:*MEMORY[0x1E4F397F8]])
    {
      BOOL v45 = [v18 code] == 3072;

      if (v45)
      {
        uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v79 = *MEMORY[0x1E4F28568];
        char v47 = [NSString stringWithFormat:@"Canceled operation to ungroup faces"];
        v80 = v47;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        *a5 = [v46 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v48];

LABEL_35:
        char v28 = 0;
LABEL_49:
        uint64_t v10 = v60;
        goto LABEL_50;
      }
    }
    else
    {
    }
    id v49 = v18;
LABEL_48:
    id v18 = v49;
    char v28 = 0;
    *a5 = v49;
    goto LABEL_49;
  }
  id v18 = 0;
LABEL_10:
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v25 = [v61 keyEnumerator];
  id obj = v25;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (!v26)
  {
    char v28 = 1;
    goto LABEL_42;
  }
  uint64_t v27 = *(void *)v69;
  uint64_t v51 = *MEMORY[0x1E4F28760];
  uint64_t v52 = *MEMORY[0x1E4F28568];
  uint64_t v56 = *MEMORY[0x1E4F397F8];
  char v28 = 1;
  while (2)
  {
    uint64_t v29 = 0;
    do
    {
      if (*(void *)v69 != v27) {
        objc_enumerationMutation(obj);
      }
      uint64_t v30 = *(void *)(*((void *)&v68 + 1) + 8 * v29);
      id v31 = (void *)MEMORY[0x1C186D320]();
      if (!v7 || !v7[2](v7))
      {
        id v36 = objc_loadWeakRetained(location);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __100__VCPPhotosPersistenceDelegate__ungroupFaceClusterSequenceNumbers_cancelOrExtendTimeoutBlock_error___block_invoke;
        v63[3] = &unk_1E62992C0;
        id v64 = v61;
        uint64_t v65 = v30;
        id v66 = v60;
        v67 = v7;
        id v62 = v18;
        char v28 = [v36 performCancellableChangesAndWait:v63 error:&v62];
        id v37 = v62;

        if (v28)
        {
          int v35 = 0;
LABEL_26:

          v33 = v64;
          id v18 = v37;
          goto LABEL_27;
        }
        uint64_t v38 = [v37 domain];
        if ([v38 isEqualToString:v56])
        {
          BOOL v39 = [v37 code] == 3072;

          if (!v39)
          {
LABEL_25:
            int v35 = 2;
            goto LABEL_26;
          }
          uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v74 = v52;
          uint64_t v38 = [NSString stringWithFormat:@"Canceled operation to uncluster faces"];
          v75 = v38;
          v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          uint64_t v42 = [v40 errorWithDomain:v51 code:-128 userInfo:v41];

          id v37 = (id)v42;
        }

        goto LABEL_25;
      }
      if (a5)
      {
        v32 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v76 = v52;
        v33 = [NSString stringWithFormat:@"Canceled operation to ungroup faces"];
        v77 = v33;
        long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        *a5 = [v32 errorWithDomain:v51 code:-128 userInfo:v34];

        int v35 = 1;
LABEL_27:

        goto LABEL_28;
      }
      int v35 = 1;
LABEL_28:
      if (v35)
      {

        if (v35 == 2) {
          goto LABEL_43;
        }
        goto LABEL_35;
      }
      ++v29;
    }
    while (v26 != v29);
    id v25 = obj;
    uint64_t v43 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    uint64_t v26 = v43;
    if (v43) {
      continue;
    }
    break;
  }
LABEL_42:

LABEL_43:
  uint64_t v10 = v60;
  if (a5 && (v28 & 1) == 0)
  {
    id v49 = v18;
    goto LABEL_48;
  }
LABEL_50:

  return v28 & 1;
}

void __100__VCPPhotosPersistenceDelegate__ungroupFaceClusterSequenceNumbers_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, unsigned char *a2)
{
  id v13 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesWithLocalIdentifiers:options:");
  unint64_t v5 = 0;
  while (v5 < [v4 count])
  {
    id v6 = (void *)MEMORY[0x1C186D320]();
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7 && (*(unsigned int (**)(void))(v7 + 16))())
    {
      char v8 = 0;
      *a2 = 1;
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F39058];
      uint64_t v10 = [v4 objectAtIndexedSubscript:v5];
      uint64_t v11 = [v9 changeRequestForFace:v10];

      [v11 setClusterSequenceNumber:0];
      char v8 = 1;
    }
    ++v5;
    if ((v8 & 1) == 0) {
      goto LABEL_10;
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F39088] changeRequestForFaceGroup:*(void *)(a1 + 40)];
  [v12 removeFaces:v4];

LABEL_10:
}

- (id)_fetchResultForGroupedFacesWithClusterSequenceNumberSetToZeroInPhotoLibrary:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[(id)objc_opt_class() newAllFacesFetchOptionsWithPhotoLibrary:v3];
  v9[0] = *MEMORY[0x1E4F39630];
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v4 setFetchPropertySets:v5];

  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(clusterSequenceNumber = 0)"];
  [v4 setPredicate:v6];

  [v4 setIncludeOnlyFacesInFaceGroups:1];
  uint64_t v7 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v4];

  return v7;
}

- (id)_fetchResultForUngroupedFacesWithNonZeroClusterSequenceNumberInPhotoLibrary:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[(id)objc_opt_class() newAllFacesFetchOptionsWithPhotoLibrary:v3];
  v9[0] = *MEMORY[0x1E4F39630];
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v4 setFetchPropertySets:v5];

  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"((clusterSequenceNumber > 0) AND (faceGroup = nil))"];
  [v4 setInternalPredicate:v6];

  uint64_t v7 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v4];

  return v7;
}

- (BOOL)_resetFaceClusterSequenceNumberOfFacesInFetchResult:(id)a3 inPhotoLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v12 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __132__VCPPhotosPersistenceDelegate__resetFaceClusterSequenceNumberOfFacesInFetchResult_inPhotoLibrary_cancelOrExtendTimeoutBlock_error___block_invoke;
  v16[3] = &unk_1E6299310;
  id v13 = v11;
  id v18 = v13;
  id v19 = &v21;
  id v14 = v10;
  id v17 = v14;
  id v20 = a6;
  [v12 enumerateFetchResult:v9 withBatchSize:100 handler:v16];
  LOBYTE(v10) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)v10;
}

void __132__VCPPhotosPersistenceDelegate__resetFaceClusterSequenceNumberOfFacesInFetchResult_inPhotoLibrary_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  id v9 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __132__VCPPhotosPersistenceDelegate__resetFaceClusterSequenceNumberOfFacesInFetchResult_inPhotoLibrary_cancelOrExtendTimeoutBlock_error___block_invoke_2;
  v16[3] = &unk_1E62992E8;
  id v10 = v7;
  id v17 = v10;
  id v18 = *(id *)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v9 performCancellableChangesAndWait:v16 error:*(void *)(a1 + 56)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (uint64_t v15 = *(void *)(a1 + 40)) != 0
    && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 16))(v15, v11, v12, v13, v14))
  {
    *a5 = 1;
  }
}

void __132__VCPPhotosPersistenceDelegate__resetFaceClusterSequenceNumberOfFacesInFetchResult_inPhotoLibrary_cancelOrExtendTimeoutBlock_error___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = *(void *)(a1 + 40);
        if (v9 && (*(unsigned int (**)(uint64_t))(v9 + 16))(v9))
        {
          *a2 = 1;
          goto LABEL_12;
        }
        id v10 = objc_msgSend(MEMORY[0x1E4F39058], "changeRequestForFace:", v8, (void)v11);
        [v10 setClusterSequenceNumber:0];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (BOOL)cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    uint64_t v8 = (void *)MEMORY[0x1C186D320]();
    id v9 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    id v10 = [(VCPPhotosPersistenceDelegate *)self _fetchResultForUngroupedFacesWithNonZeroClusterSequenceNumberInPhotoLibrary:v9];

    if ([v10 count])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        long long v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = [v10 count];
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "Found %lu faces with CSN > 0 but not in any face groups", buf, 0xCu);
        }
      }
      *(void *)buf = 0;
      id v12 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      BOOL v13 = [(VCPPhotosPersistenceDelegate *)self _resetFaceClusterSequenceNumberOfFacesInFetchResult:v10 inPhotoLibrary:v12 cancelOrExtendTimeoutBlock:v6 error:buf];

      id v14 = *(id *)buf;
    }
    else
    {
      id v14 = 0;
      BOOL v13 = 1;
    }

    if (a4) {
      char v17 = v13;
    }
    else {
      char v17 = 1;
    }
    if (v17) {
      goto LABEL_20;
    }
    id v18 = [v14 domain];
    if ([v18 isEqualToString:*MEMORY[0x1E4F397F8]])
    {
      BOOL v19 = [v14 code] == 3072;

      if (v19)
      {
        id v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Canceled operation to uncluster faces", *MEMORY[0x1E4F28568]);
        id v25 = v21;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        *a4 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v22];

        goto LABEL_20;
      }
    }
    else
    {
    }
    id v14 = v14;
    *a4 = v14;
    goto LABEL_20;
  }
  if (!a4)
  {
    BOOL v13 = 0;
    goto LABEL_21;
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v27 = *MEMORY[0x1E4F28568];
  id v14 = [NSString stringWithFormat:@"could not access the library"];
  v28[0] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  *a4 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];

  BOOL v13 = 0;
LABEL_20:

LABEL_21:
  return v13;
}

- (BOOL)cleanupGroupedFacesWithClusterSequenceNumberSetToZero:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x1E4F143B8];
  v48 = (unsigned int (**)(void))a3;
  p_photoLibrary = &self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (!WeakRetained)
  {
    if (a4)
    {
      int v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = *MEMORY[0x1E4F28568];
      uint64_t v16 = [NSString stringWithFormat:@"could not access the library"];
      v65[0] = v16;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
      v40 = BOOL v39 = a4;
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    BOOL v37 = 0;
    goto LABEL_33;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_photoLibrary);
  id v9 = [(VCPPhotosPersistenceDelegate *)self _fetchResultForGroupedFacesWithClusterSequenceNumberSetToZeroInPhotoLibrary:v8];

  uint64_t v40 = v9;
  if (![v9 count])
  {
    uint64_t v16 = 0;
    BOOL v37 = 1;
    goto LABEL_32;
  }
  id v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v11 = objc_loadWeakRetained((id *)&self->_photoLibrary);
  uint64_t v46 = v10;
  [(VCPPhotosPersistenceDelegate *)self _categorizeGroupedFacesInFetchResult:v40 intoFaceLocalIdentifiersByFaceGroup:v10 ungroupedFaceLocalIdentifiers:0 cancelOrExtendTimeoutBlock:v48 photoLibrary:v11];

  id v12 = objc_opt_class();
  id v13 = objc_loadWeakRetained((id *)p_photoLibrary);
  char v47 = (void *)[v12 newAllFacesFetchOptionsWithPhotoLibrary:v13];

  uint64_t v63 = *MEMORY[0x1E4F39630];
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  location = (id *)p_photoLibrary;
  BOOL v39 = a4;
  [v47 setFetchPropertySets:v14];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v15 = [v10 keyEnumerator];
  id obj = v15;
  uint64_t v16 = 0;
  uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (!v17)
  {
    int v26 = 1;
    goto LABEL_28;
  }
  uint64_t v18 = *(void *)v55;
  uint64_t v42 = *MEMORY[0x1E4F28760];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  uint64_t v41 = *MEMORY[0x1E4F397F8];
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v55 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(*((void *)&v54 + 1) + 8 * i);
      uint64_t v21 = (void *)MEMORY[0x1C186D320]();
      if (v48 && v48[2]())
      {
        id v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v60 = v43;
        uint64_t v23 = [NSString stringWithFormat:@"Canceled operation to cleanup grouped faces with CSN=0"];
        v61 = v23;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        uint64_t v25 = [v22 errorWithDomain:v42 code:-128 userInfo:v24];

        int v26 = 0;
        int v27 = 2;
        uint64_t v16 = (void *)v25;
        goto LABEL_19;
      }
      id v28 = objc_loadWeakRetained(location);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __92__VCPPhotosPersistenceDelegate_cleanupGroupedFacesWithClusterSequenceNumberSetToZero_error___block_invoke;
      v50[3] = &unk_1E6299338;
      id v51 = v46;
      uint64_t v52 = v20;
      id v53 = v47;
      id v49 = v16;
      int v26 = [v28 performChangesAndWait:v50 error:&v49];
      id v29 = v49;

      if ((v26 & 1) == 0)
      {
        uint64_t v30 = [v29 domain];
        if ([v30 isEqualToString:v41])
        {
          BOOL v31 = [v29 code] == 3072;

          if (!v31)
          {
LABEL_17:
            int v27 = 2;
            goto LABEL_18;
          }
          v32 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v58 = v43;
          uint64_t v30 = [NSString stringWithFormat:@"Canceled operation to cleanup grouped faces with CSN=0"];
          v59 = v30;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          uint64_t v34 = [v32 errorWithDomain:v42 code:-128 userInfo:v33];

          id v29 = (id)v34;
        }

        goto LABEL_17;
      }
      int v27 = 0;
LABEL_18:

      uint64_t v23 = v51;
      uint64_t v16 = v29;
LABEL_19:

      if (v27)
      {
        uint64_t v15 = obj;
        goto LABEL_28;
      }
    }
    uint64_t v15 = obj;
    uint64_t v17 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_28:

  BOOL v37 = v26 != 0;
  if (v39 && !v26)
  {
    id v36 = v16;
    uint64_t v16 = v36;
LABEL_31:
    BOOL v37 = 0;
    id *v39 = v36;
  }
LABEL_32:

LABEL_33:
  return v37;
}

void __92__VCPPhotosPersistenceDelegate_cleanupGroupedFacesWithClusterSequenceNumberSetToZero_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  v2 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesWithLocalIdentifiers:options:");
  id v3 = [MEMORY[0x1E4F39088] changeRequestForFaceGroup:*(void *)(a1 + 40)];
  [v3 removeFaces:v2];
}

- (id)_facesFromFaceGroupWithMostNumberOfFacesOnPerson:(id)a3 options:(id)a4 error:(id *)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v40 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  id v9 = [WeakRetained librarySpecificFetchOptions];

  id v10 = [MEMORY[0x1E4F39080] fetchFaceGroupsForPerson:v7 options:v9];
  uint64_t v38 = v9;
  if ([v10 count])
  {
    if ([v10 count] == 1)
    {
      id v11 = [MEMORY[0x1E4F39048] fetchFacesForPerson:v7 options:v40];
      id v39 = [v11 fetchedObjects];
    }
    else
    {
      id v39 = 0;
      unint64_t v41 = 0;
      unint64_t v17 = 0;
      BOOL v37 = v10;
      while (v17 < [v10 count])
      {
        uint64_t v18 = MEMORY[0x1C186D320]();
        uint64_t v43 = [v10 objectAtIndexedSubscript:v17];
        BOOL v19 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:v43 options:v40];
        uint64_t v42 = (void *)v18;
        unint64_t v20 = v17;
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
        for (unint64_t i = 0; i < [v19 count]; ++i)
        {
          uint64_t v23 = (void *)MEMORY[0x1C186D320]();
          uint64_t v24 = [v19 objectAtIndexedSubscript:i];
          uint64_t v25 = [v24 personLocalIdentifier];
          int v26 = [v7 localIdentifier];
          int v27 = [v25 isEqualToString:v26];

          if (v27) {
            [v21 addObject:v24];
          }
        }
        unint64_t v28 = [v21 count];
        if (v28 > v41)
        {
          id v29 = v21;

          id v39 = v29;
          unint64_t v41 = v28;
        }

        id v10 = v37;
        id v9 = v38;
        unint64_t v17 = v20 + 1;
      }
      if (a5 && !v39)
      {
        uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        BOOL v31 = NSString;
        v32 = [v7 localIdentifier];
        v33 = [v31 stringWithFormat:@"Failed to fetch faces from the faceGroup that contributed the most number of face to person with localIdentifier '%@'", v32];
        BOOL v45 = v33;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        *a5 = [v30 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v34];
      }
    }
  }
  else
  {
    if (a5)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      id v13 = NSString;
      id v14 = [v7 localIdentifier];
      uint64_t v15 = [v13 stringWithFormat:@"No faceGroups found for person with localIdentifier '%@'", v14];
      v47[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      *a5 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];
    }
    id v39 = 0;
  }

  return v39;
}

- (id)_localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = (uint64_t (**)(void))a4;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  if (v6 && v6[2](v6))
  {
    id v8 = v7;
  }
  else
  {
    id v9 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    id v11 = (void *)[v9 newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:WeakRetained];

    [v11 setMinimumUnverifiedFaceCount:0];
    [v11 setIncludeTorsoOnlyPerson:1];
    [MEMORY[0x1E4F391F8] fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups:v23 options:v11];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    id v22 = v25 = 0u;
    id v12 = [v22 objectEnumerator];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) firstObject];
          unint64_t v17 = v16;
          if (v16)
          {
            uint64_t v18 = [v16 localIdentifier];
            [v7 addObject:v18];
          }
          if (v6 && (v6[2](v6) & 1) != 0)
          {
            id v20 = v7;

            goto LABEL_17;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v19 = v7;
LABEL_17:
  }
  return v7;
}

- (id)identifyConflictingL0Clusters:(id)a3 csnToRejectedPersonForNewlyClusteredFaces:(id)a4 csnToConfirmedPersonForNewlyClusteredFaces:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  id v9 = a5;
  id v36 = v9;
  if ((unint64_t)[v8 count] > 1)
  {
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = [v9 allKeys];
    uint64_t v14 = [v12 setWithArray:v13];

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = [v37 allKeys];
    unint64_t v17 = [v15 setWithArray:v16];

    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke;
    v45[3] = &unk_1E6299400;
    id v19 = v34;
    id v46 = v19;
    id v20 = v18;
    id v47 = v20;
    id v10 = v14;
    v48 = v10;
    id v49 = v36;
    id v21 = v17;
    id v50 = v21;
    id v51 = v37;
    uint64_t v52 = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v45];
    int v35 = v21;
    id v22 = [MEMORY[0x1E4F1CA80] set];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_4;
    v43[3] = &unk_1E6299428;
    id v23 = v22;
    id v44 = v23;
    [v19 enumerateKeysAndObjectsUsingBlock:v43];
    long long v24 = [MEMORY[0x1E4F1CA80] set];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_5;
    v41[3] = &unk_1E6299428;
    id v25 = v24;
    id v42 = v25;
    [v20 enumerateKeysAndObjectsUsingBlock:v41];
    id v26 = v23;
    [v26 intersectSet:v25];
    if ([v26 count])
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        long long v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = [v26 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v54 = v28;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_INFO, "[VisionFgMapping] Vision Cluster contains %lu conflicting people", buf, 0xCu);
        }
      }
      [v26 enumerateObjectsUsingBlock:&__block_literal_global_39];
      uint64_t v29 = [MEMORY[0x1E4F1CA80] set];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_451;
      v38[3] = &unk_1E6299450;
      id v39 = v26;
      id v30 = v29;
      id v40 = v30;
      [v20 enumerateKeysAndObjectsUsingBlock:v38];
      BOOL v31 = v40;
      v32 = v30;

      id v11 = v32;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 7)
      {
        id v11 = 0;
        goto LABEL_18;
      }
      v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Vision Cluster does not have conflicting l0clusters", buf, 2u);
      }
      id v11 = 0;
    }

LABEL_18:
    goto LABEL_19;
  }
  if ((int)MediaAnalysisLogLevel() < 7)
  {
    id v11 = 0;
    goto LABEL_20;
  }
  id v10 = VCPLogInstance();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Vision Cluster with single l0clusters; skip de-conflict",
      buf,
      2u);
  }
  id v11 = 0;
LABEL_19:

LABEL_20:
  return v11;
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void v45[4] = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  id v5 = a3;
  context = (void *)MEMORY[0x1C186D320]();
  id v6 = [MEMORY[0x1E4F1CA80] set];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v29];

  id v7 = [MEMORY[0x1E4F1CA80] set];
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v29];

  long long v27 = (void *)[v5 mutableCopy];
  [v27 intersectSet:*(void *)(a1 + 48)];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_2;
  v41[3] = &unk_1E6299360;
  id v42 = *(id *)(a1 + 56);
  id v43 = *(id *)(a1 + 32);
  id v8 = v29;
  id v44 = v8;
  [v27 enumerateObjectsUsingBlock:v41];
  id v9 = (void *)[v5 mutableCopy];
  [v9 intersectSet:*(void *)(a1 + 64)];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_3;
  v37[3] = &unk_1E6299360;
  id v38 = *(id *)(a1 + 72);
  id v39 = *(id *)(a1 + 40);
  id v10 = v8;
  id v40 = v10;
  [v9 enumerateObjectsUsingBlock:v37];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 80) + 8));
  id v12 = [WeakRetained librarySpecificFetchOptions];

  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EE1D8];
  [v12 setVerifiedPersonTypes:v13];

  uint64_t v14 = objc_opt_class();
  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 80) + 8));
  uint64_t v16 = (void *)[v14 newAllFacesFetchOptionsWithPhotoLibrary:v15];

  uint64_t v17 = *MEMORY[0x1E4F39610];
  v45[0] = *MEMORY[0x1E4F39620];
  v45[1] = v17;
  uint64_t v18 = *MEMORY[0x1E4F39630];
  v45[2] = *MEMORY[0x1E4F39638];
  v45[3] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
  [v16 setFetchPropertySets:v19];

  id v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(clusterSequenceNumber in %@) AND (trainingType = %d OR trainingType = %d OR trainingType = %d)", v5, 3, 1, 5];
  [v16 setPredicate:v20];

  id v21 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v16];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_439;
  v34[3] = &unk_1E6299388;
  id v35 = *(id *)(a1 + 32);
  id v22 = v10;
  id v36 = v22;
  [v21 enumerateObjectsUsingBlock:v34];
  id v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(clusterSequenceNumber in %@) AND (trainingType = %d OR trainingType = %d)", v5, 4, 2];
  [v16 setPredicate:v23];

  long long v24 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v16];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_2_444;
  v30[3] = &unk_1E62993D8;
  id v25 = v12;
  id v31 = v25;
  id v32 = *(id *)(a1 + 40);
  id v26 = v22;
  id v33 = v26;
  [v24 enumerateObjectsUsingBlock:v30];
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v3)
  {
    id v5 = v3;
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
    [v4 addObject:v5];

    id v3 = v5;
  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if ([v4 count])
  {
    id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
    [v3 addObjectsFromArray:v4];
  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_439(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 personLocalIdentifier];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v5 = [v6 personLocalIdentifier];
    [v4 addObject:v5];
  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_2_444(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F391F8] fetchRejectedPersonsForFace:a2 options:*(void *)(a1 + 32)];
  if ([v3 count])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_3_445;
    v4[3] = &unk_1E62993B0;
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    [v3 enumerateObjectsUsingBlock:v4];
  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_3_445(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 localIdentifier];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v5 = [v6 localIdentifier];
    [v4 addObject:v5];
  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allObjects];
  objc_msgSend(v3, "addObjectsFromArray:");
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allObjects];
  objc_msgSend(v3, "addObjectsFromArray:");
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_449(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Conflicting person %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_451(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 intersectsSet:*(void *)(a1 + 32)])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 138412290;
        id v9 = v5;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Vision Cluster has conflicting l0cluster %@", (uint8_t *)&v8, 0xCu);
      }
    }
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (BOOL)persistChangesToAlgorithmicFaceGroups:(id)a3 l1ClustersByFaceCSNRepresentingFaceGroup:(id)a4 l0ClustersByFaceCSNRepresentingFaceGroup:(id)a5 faceCSNByLocalIdentifierForNewlyClusteredFaces:(id)a6 faceCSNsOfUnclusteredFaces:(id)a7 localIdentifiersOfUnclusteredFaces:(id)a8 persistenceCompletionBlock:(id)a9 cancelOrExtendTimeoutBlock:(id)a10 error:(id *)a11
{
  v202[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v142 = a4;
  id v143 = a5;
  id v146 = a6;
  id v140 = a7;
  id v141 = a8;
  v139 = (void (**)(void))a9;
  v147 = (void (**)(void))a10;
  v152 = self;
  location = (id *)&self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    uint64_t v153 = mach_absolute_time();
    id v19 = VCPSignPostLog();
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    id v21 = VCPSignPostLog();
    id v22 = v21;
    os_signpost_id_t spid = v20;
    unint64_t v144 = v20 - 1;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VisionFgMapping_Process", "", buf, 2u);
    }

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        long long v24 = [v17 allKeys];
        uint64_t v25 = [v24 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v200 = v25;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Persisting %ld Vision Clusters to Photos FaceGroup", buf, 0xCu);
      }
    }
    id v26 = objc_loadWeakRetained(location);
    v138 = [v26 librarySpecificFetchOptions];

    long long v27 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EE1F0];
    [v138 setVerifiedPersonTypes:v27];

    uint64_t v28 = objc_opt_class();
    id v29 = objc_loadWeakRetained(location);
    v151 = (void *)[v28 newAllFacesFetchOptionsWithPhotoLibrary:v29];

    uint64_t v30 = *MEMORY[0x1E4F39610];
    v196[0] = *MEMORY[0x1E4F39620];
    v196[1] = v30;
    uint64_t v32 = *MEMORY[0x1E4F39630];
    v197 = (void *)*MEMORY[0x1E4F39638];
    id v31 = v197;
    uint64_t v198 = v32;
    id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:4];
    context = v31;
    uint64_t v132 = v30;
    [v151 setFetchPropertySets:v33];

    uint64_t v34 = mach_absolute_time();
    id v35 = VCPSignPostLog();
    os_signpost_id_t v36 = os_signpost_id_generate(v35);

    id v37 = VCPSignPostLog();
    id v38 = v37;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VisionFgMapping_LookingAfterNewClusteredFace", "", buf, 2u);
    }

    v125 = [MEMORY[0x1E4F1CA60] dictionary];
    v124 = [MEMORY[0x1E4F1CA60] dictionary];
    id v39 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"trainingType != %d", 0);
    [v151 setPredicate:v39];

    id v40 = (void *)MEMORY[0x1E4F39048];
    unint64_t v41 = [v146 allKeys];
    v137 = [v40 fetchFacesWithLocalIdentifiers:v41 options:v151];

    [v151 setPredicate:0];
    v186[0] = MEMORY[0x1E4F143A8];
    v186[1] = 3221225472;
    v186[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke;
    v186[3] = &unk_1E6299478;
    id v42 = v146;
    id v187 = v42;
    id v128 = v138;
    id v188 = v128;
    id v43 = v125;
    id v189 = v43;
    id v44 = v124;
    id v190 = v44;
    [v137 enumerateObjectsUsingBlock:v186];
    BOOL v45 = VCPSignPostLog();
    id v46 = v45;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v46, OS_SIGNPOST_INTERVAL_END, v36, "VisionFgMapping_LookingAfterNewClusteredFace", "", buf, 2u);
    }

    if (v34)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    uint64_t v47 = mach_absolute_time();
    v48 = VCPSignPostLog();
    os_signpost_id_t v49 = os_signpost_id_generate(v48);

    id v50 = VCPSignPostLog();
    id v51 = v50;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "VisionFgMapping_ResolveConflictL0Clusters", "", buf, 2u);
    }

    uint64_t v52 = [MEMORY[0x1E4F1CA60] dictionary];
    v180[0] = MEMORY[0x1E4F143A8];
    v180[1] = 3221225472;
    v180[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_463;
    v180[3] = &unk_1E6299530;
    v180[4] = v152;
    id v119 = v43;
    id v181 = v119;
    id v120 = v44;
    id v182 = v120;
    id v183 = v142;
    id v123 = v52;
    id v184 = v123;
    id v53 = v17;
    id v185 = v53;
    [v143 enumerateKeysAndObjectsUsingBlock:v180];
    uint64_t v54 = VCPSignPostLog();
    uint64_t v55 = v54;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v55, OS_SIGNPOST_INTERVAL_END, v49, "VisionFgMapping_ResolveConflictL0Clusters", "", buf, 2u);
    }

    if (v47)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    id v148 = v123;

    long long v56 = VCPSignPostLog();
    long long v57 = v56;
    if (v144 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v57, OS_SIGNPOST_INTERVAL_END, spid, "VisionFgMapping_Process", "", buf, 2u);
    }

    if (v153)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if (v147) {
      v147[2]();
    }
    spida = [v148 allKeys];
    v121 = [MEMORY[0x1E4F1CA80] set];
    v122 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v58 = objc_opt_class();
    id v59 = objc_loadWeakRetained(location);
    v145 = (void *)[v58 newAllFacesFetchOptionsWithPhotoLibrary:v59];

    v195[0] = v32;
    v195[1] = context;
    v195[2] = v132;
    uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:3];
    [v145 setFetchPropertySets:v60];

    uint64_t v61 = [v42 count];
    v154 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v61];
    if (v61)
    {
      id v62 = [v42 allKeys];
      uint64_t v63 = [MEMORY[0x1E4F39048] fetchFacesWithLocalIdentifiers:v62 options:v145];
      for (unint64_t i = 0; i < [v63 count]; ++i)
      {
        uint64_t v65 = (void *)MEMORY[0x1C186D320]();
        id v66 = [v63 objectAtIndexedSubscript:i];
        v67 = [v66 localIdentifier];
        long long v68 = [v42 objectForKeyedSubscript:v67];

        if (v68) {
          [v154 setObject:v66 forKeyedSubscript:v68];
        }
      }
    }
    long long v69 = [MEMORY[0x1E4F1CA60] dictionary];
    contexta = (void *)MEMORY[0x1C186D320]();
    long long v70 = [MEMORY[0x1E4F1CA80] setWithArray:spida];
    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v71 = [v148 objectEnumerator];
    uint64_t v72 = [v71 countByEnumeratingWithState:&v176 objects:v194 count:16];
    if (v72)
    {
      uint64_t v73 = *(void *)v177;
      do
      {
        for (uint64_t j = 0; j != v72; ++j)
        {
          if (*(void *)v177 != v73) {
            objc_enumerationMutation(v71);
          }
          [v70 unionSet:*(void *)(*((void *)&v176 + 1) + 8 * j)];
        }
        uint64_t v72 = [v71 countByEnumeratingWithState:&v176 objects:v194 count:16];
      }
      while (v72);
    }

    v75 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v76 = [v154 allKeys];
    v133 = [v75 setWithArray:v76];

    [v70 minusSet:v133];
    if ([v70 count])
    {
      v77 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"clusterSequenceNumber IN %@", v70];
      [v145 setPredicate:v77];

      [MEMORY[0x1E4F39048] fetchFacesWithOptions:v145];
      long long v174 = 0u;
      long long v175 = 0u;
      long long v172 = 0u;
      long long v173 = 0u;
      id v78 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v79 = [v78 countByEnumeratingWithState:&v172 objects:v193 count:16];
      if (v79)
      {
        uint64_t v80 = *(void *)v173;
        do
        {
          for (uint64_t k = 0; k != v79; ++k)
          {
            if (*(void *)v173 != v80) {
              objc_enumerationMutation(v78);
            }
            uint64_t v82 = *(void **)(*((void *)&v172 + 1) + 8 * k);
            v83 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v82, "clusterSequenceNumber"));
            [v69 setObject:v82 forKeyedSubscript:v83];
          }
          uint64_t v79 = [v78 countByEnumeratingWithState:&v172 objects:v193 count:16];
        }
        while (v79);
      }
    }
    id v84 = objc_loadWeakRetained(location);
    contextb = [v84 librarySpecificFetchOptions];

    v117 = [v69 allValues];
    v118 = objc_msgSend(MEMORY[0x1E4F39080], "fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces:options:");
    v85 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_485;
    aBlock[3] = &unk_1E62995A8;
    id v159 = v42;
    id v114 = spida;
    id v160 = v114;
    v86 = v147;
    v171 = v86;
    id v17 = v148;
    id v161 = v17;
    id v115 = v154;
    id v162 = v115;
    id v116 = v69;
    id v163 = v116;
    id v164 = v140;
    id v165 = v141;
    id v87 = v118;
    id v166 = v87;
    id v126 = v85;
    id v167 = v126;
    v168 = v152;
    id v88 = v121;
    id v169 = v88;
    id v89 = v122;
    id v170 = v89;
    v134 = _Block_copy(aBlock);
    v90 = (void *)MEMORY[0x1C186D320]();
    id v91 = objc_loadWeakRetained(location);
    id v157 = 0;
    char locationa = [v91 performCancellableChangesAndWait:v134 error:&v157];
    id v127 = v157;

    if (locationa)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v92 = VCPLogInstance();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v200 = (uint64_t)v126;
          _os_log_impl(&dword_1BBEDA000, v92, OS_LOG_TYPE_DEBUG, "PersistFaceGroups: Set personBuilderState of faceGroups: %@", buf, 0xCu);
        }
      }
      if (v139) {
        v139[2]();
      }
      id v156 = 0;
      BOOL v93 = [(VCPPhotosPersistenceDelegate *)v152 deleteEmptyGroupsAndReturnError:&v156];
      id v94 = v156;
      if (!v93 && (int)MediaAnalysisLogLevel() >= 4)
      {
        v95 = VCPLogInstance();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v200 = (uint64_t)v94;
          _os_log_impl(&dword_1BBEDA000, v95, OS_LOG_TYPE_DEFAULT, "PersistFaceGroups: Failed to delete empty face groups with error: %@", buf, 0xCu);
        }
      }
      v96 = [MEMORY[0x1E4F1CA80] set];
      if ([v89 count])
      {
        v97 = [(VCPPhotosPersistenceDelegate *)v152 _localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:v89 cancelOrExtendTimeoutBlock:v86];
        [v96 unionSet:v97];
      }
      if ([v88 count])
      {
        v98 = [(VCPPhotosPersistenceDelegate *)v152 _localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:v88 cancelOrExtendTimeoutBlock:v86];
        [v96 unionSet:v98];
      }
      if (![v96 count]) {
        goto LABEL_93;
      }

      v99 = [v96 allObjects];
      id v155 = 0;
      BOOL v100 = [(VCPPhotosPersistenceDelegate *)v152 updateKeyFacesOfPersonsWithLocalIdentifiers:v99 forceUpdate:1 cancelOrExtendTimeoutBlock:v86 error:&v155];
      id v94 = v155;

      if (v100) {
        goto LABEL_93;
      }
      v101 = [v94 domain];
      if ([v101 isEqualToString:*MEMORY[0x1E4F397F8]])
      {
        BOOL v102 = [v94 code] == 3072;

        if (v102)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v103 = VCPLogInstance();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v104 = "PersistFaceGroups: Canceled updating key faces unverified persons after persisting face groups.";
              v105 = v103;
              uint32_t v106 = 2;
LABEL_91:
              _os_log_impl(&dword_1BBEDA000, v105, OS_LOG_TYPE_DEFAULT, v104, buf, v106);
              goto LABEL_92;
            }
            goto LABEL_92;
          }
          goto LABEL_93;
        }
      }
      else
      {
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v103 = VCPLogInstance();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v200 = (uint64_t)v94;
          v104 = "PersistFaceGroups: Failed to update key faces unverified persons after persisting face groups. Error: %@";
          v105 = v103;
          uint32_t v106 = 12;
          goto LABEL_91;
        }
LABEL_92:
      }
LABEL_93:

      goto LABEL_94;
    }
    if (a11)
    {
      v108 = [v127 domain];
      if ([v108 isEqualToString:*MEMORY[0x1E4F397F8]])
      {
        BOOL v109 = [v127 code] == 3072;

        if (v109)
        {
          v110 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v191 = *MEMORY[0x1E4F28568];
          v111 = [NSString stringWithFormat:@"Saving clustering results cancelled"];
          v192 = v111;
          v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v192 forKeys:&v191 count:1];
          *a11 = [v110 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v112];

          goto LABEL_94;
        }
      }
      else
      {
      }
      *a11 = v127;
    }
LABEL_94:

    goto LABEL_95;
  }
  if (a11)
  {
    v107 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v201 = *MEMORY[0x1E4F28568];
    id v128 = [NSString stringWithFormat:@"photoLibrary is nil"];
    v202[0] = v128;
    v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v202 forKeys:&v201 count:1];
    objc_msgSend(v107, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
    char locationa = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_95:

    goto LABEL_96;
  }
  char locationa = 0;
LABEL_96:

  return locationa;
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v5 = [v3 localIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6 && [v6 longValue])
  {
    if ([v3 trainingType] == 2 || objc_msgSend(v3, "trainingType") == 4)
    {
      id v7 = [MEMORY[0x1E4F391F8] fetchRejectedPersonsForFace:v3 options:*(void *)(a1 + 40)];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_461;
      v11[3] = &unk_1E62993B0;
      id v12 = *(id *)(a1 + 48);
      id v13 = v6;
      [v7 enumerateObjectsUsingBlock:v11];
    }
    else
    {
      uint64_t v10 = [v3 personLocalIdentifier];
      [*(id *)(a1 + 56) setObject:v10 forKeyedSubscript:v6];
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v3 localIdentifier];
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[VisionFgMapping] Invalid csn (%@) for newly clustered face %@", buf, 0x16u);
    }
  }
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_461(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    int v4 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = [v7 localIdentifier];
  [v5 addObject:v6];
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_463(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = mach_absolute_time();
  int v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = VCPSignPostLog();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VisionFgMapping_LookingForConflictingCluster", "", buf, 2u);
  }

  id v12 = [*(id *)(a1 + 32) identifyConflictingL0Clusters:v6 csnToRejectedPersonForNewlyClusteredFaces:*(void *)(a1 + 40) csnToConfirmedPersonForNewlyClusteredFaces:*(void *)(a1 + 48)];
  id v13 = VCPSignPostLog();
  uint64_t v14 = v13;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v9, "VisionFgMapping_LookingForConflictingCluster", "", buf, 2u);
  }

  if (v7)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ([v12 count])
  {
    uint64_t v15 = mach_absolute_time();
    __int16 v16 = VCPSignPostLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    uint64_t v18 = VCPSignPostLog();
    id v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VisionFgMapping_ResolveConflictingCluster", "", buf, 2u);
    }

    os_signpost_id_t v20 = (void *)MEMORY[0x1E4F1CA80];
    id v21 = [*(id *)(a1 + 56) objectForKeyedSubscript:v5];
    id v22 = [v20 setWithSet:v21];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_465;
    v36[3] = &unk_1E62994C0;
    id v37 = v6;
    id v38 = *(id *)(a1 + 64);
    id v23 = v22;
    id v39 = v23;
    id v24 = v5;
    id v40 = v24;
    [v12 enumerateObjectsUsingBlock:v36];
    if ([v23 count])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v48 = __Block_byref_object_copy__25;
      os_signpost_id_t v49 = __Block_byref_object_dispose__25;
      id v50 = [v23 anyObject];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_470;
      v35[3] = &unk_1E62994E8;
      v35[4] = buf;
      [v23 enumerateObjectsUsingBlock:v35];
      [*(id *)(a1 + 64) setObject:v23 forKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          id v34 = v6;
          uint64_t v26 = *(void *)(*(void *)&buf[8] + 40);
          uint64_t v27 = [v23 count];
          *(_DWORD *)unint64_t v41 = 138412802;
          id v42 = v24;
          __int16 v43 = 2112;
          uint64_t v44 = v26;
          __int16 v45 = 2048;
          uint64_t v46 = v27;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Output (remaining) Cluster %@ -> %@ with %ld faces", v41, 0x20u);
          id v6 = v34;
        }
      }
      [v23 enumerateObjectsUsingBlock:&__block_literal_global_473];
      _Block_object_dispose(buf, 8);
    }
    uint64_t v28 = VCPSignPostLog();
    id v29 = v28;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_END, v17, "VisionFgMapping_ResolveConflictingCluster", "", buf, 2u);
    }

    if (v15)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
  }
  else
  {
    uint64_t v30 = [*(id *)(a1 + 72) objectForKeyedSubscript:v5];
    [*(id *)(a1 + 64) setObject:v30 forKeyedSubscript:v5];

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v31 = VCPLogInstance();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = [*(id *)(a1 + 72) objectForKeyedSubscript:v5];
        uint64_t v33 = [v32 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v33;
        _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Output (no-touch) Cluster %@ with %ld faces", buf, 0x16u);
      }
    }
    id v23 = [*(id *)(a1 + 72) objectForKeyedSubscript:v5];
    [v23 enumerateObjectsUsingBlock:&__block_literal_global_477];
  }
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_465(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    uint64_t v7 = [v6 set];

    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v3];
    [*(id *)(a1 + 48) minusSet:v7];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        os_signpost_id_t v9 = *(void **)(a1 + 56);
        uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
        int v13 = 138412802;
        id v14 = v9;
        __int16 v15 = 2048;
        uint64_t v16 = [v10 count];
        __int16 v17 = 2112;
        id v18 = v3;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "[VisionFgMapping] Split Cluster %@ with %ld faces with representing face csn %@", (uint8_t *)&v13, 0x20u);
      }
    }
    id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    [v11 enumerateObjectsUsingBlock:&__block_literal_global_469];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_8;
    }
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 56);
      int v13 = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[VisionFgMapping] Cannot exclude invalid l0RepresentingCSN %@ in l1Cluster %@", (uint8_t *)&v13, 0x16u);
    }
  }

LABEL_8:
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_466(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 134217984;
      uint64_t v5 = [v2 longValue];
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] \t csn: %ld ", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_470(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v4 = [v5 unsignedIntegerValue];
  if (v4 < [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) unsignedIntegerValue]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_471(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 134217984;
      uint64_t v5 = [v2 longValue];
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] \t csn: %ld ", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_475(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 134217984;
      uint64_t v5 = [v2 longValue];
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] \t csn: %ld ", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_485(uint64_t a1, unsigned char *a2)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  int v4 = [*(id *)(a1 + 32) allValues];
  id v88 = [v3 setWithArray:v4];

  unint64_t v83 = 0;
  uint64_t v70 = *MEMORY[0x1E4F39630];
  while (v83 < [*(id *)(a1 + 40) count])
  {
    context = (void *)MEMORY[0x1C186D320]();
    uint64_t v5 = *(void *)(a1 + 128);
    if (v5 && (*(unsigned int (**)(void))(v5 + 16))())
    {
      int v6 = 1;
      *a2 = 1;
    }
    else
    {
      uint64_t v80 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v83];
      id v78 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:");
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_2;
      aBlock[3] = &unk_1E6299558;
      id v102 = *(id *)(a1 + 56);
      id v103 = *(id *)(a1 + 64);
      uint64_t v7 = (void (**)(void *, void *))_Block_copy(aBlock);
      int v8 = v7[2](v7, v80);
      v75 = v8;
      if (v8)
      {
        os_signpost_id_t v9 = *(void **)(a1 + 88);
        uint64_t v10 = [v8 localIdentifier];
        id v11 = [v9 objectForKeyedSubscript:v10];
        uint64_t v82 = [v11 firstObject];

        int v79 = [v78 containsObject:v80];
        if (v79)
        {
          uint64_t v12 = [MEMORY[0x1E4F39088] creationRequestForFaceGroup];
          int v13 = [v12 placeholderForCreatedFaceGroup];
          id v14 = *(void **)(a1 + 96);
          __int16 v15 = [v13 localIdentifier];
          [v14 addObject:v15];
          uint64_t v74 = v13;
        }
        else
        {
          if (!v82)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              uint64_t v65 = VCPLogInstance();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_INFO, "PersistFaceGroups: We should not get here! If we did, then we have a previously clustered face without a face group!", buf, 2u);
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              id v66 = VCPLogInstance();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_INFO, "PersistFaceGroups: Failed to create a face group change request to add faces!", buf, 2u);
              }
            }
            int v6 = 1;
            *a2 = 1;
            goto LABEL_86;
          }
          uint64_t v29 = objc_msgSend(MEMORY[0x1E4F39088], "changeRequestForFaceGroup:");
          uint64_t v30 = *(void **)(a1 + 96);
          __int16 v15 = [v82 localIdentifier];
          [v30 addObject:v15];
          uint64_t v74 = 0;
          uint64_t v12 = (void *)v29;
        }

        if (!v12)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            uint64_t v64 = VCPLogInstance();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v64, OS_LOG_TYPE_INFO, "PersistFaceGroups: Failed to create a face group change request to add faces!", buf, 2u);
            }
          }
          *a2 = 1;

          int v6 = 1;
          goto LABEL_86;
        }
        uint64_t v73 = v12;
        long long v69 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
        id v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_487;
        v91[3] = &unk_1E6299580;
        id v92 = *(id *)(a1 + 56);
        id v71 = v31;
        id v93 = v71;
        id v94 = *(id *)(a1 + 64);
        id v85 = v69;
        id v95 = v85;
        id v96 = *(id *)(a1 + 72);
        [v78 enumerateObjectsUsingBlock:v91];
        uint64_t v32 = objc_opt_class();
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 104) + 8));
        uint64_t v72 = (void *)[v32 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

        uint64_t v109 = v70;
        id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
        [v72 setFetchPropertySets:v34];

        v86 = 0;
        unint64_t v87 = 0;
        while (2)
        {
          if (v87 >= [v85 count])
          {
            uint64_t v61 = [MEMORY[0x1E4F1CA48] arrayWithArray:v85];
            [v61 addObjectsFromArray:v71];
            uint64_t v62 = [v61 count];
            if (v62)
            {
              [v73 addFaces:v61];
              if (v74)
              {
                if (v62 == 1)
                {
                  uint64_t v63 = [v61 firstObject];
                  [v73 setKeyFace:v63];
                  goto LABEL_82;
                }
                [*(id *)(a1 + 120) addObject:v74];
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 7)
            {
              uint64_t v63 = VCPLogInstance();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v63, OS_LOG_TYPE_DEBUG, "PersistFaceGroups: No faces added to face groups!", buf, 2u);
              }
LABEL_82:
            }
            [v73 setPersonBuilderState:1];

            int v6 = 0;
LABEL_85:

LABEL_86:
            goto LABEL_87;
          }
          id v35 = (void *)MEMORY[0x1C186D320]();
          uint64_t v36 = *(void *)(a1 + 128);
          if (v36 && (*(unsigned int (**)(void))(v36 + 16))())
          {
            int v6 = 1;
            *a2 = 1;
            goto LABEL_57;
          }
          id v37 = [v85 objectAtIndexedSubscript:v87];
          id v38 = *(void **)(a1 + 88);
          id v39 = v37;
          id v40 = [v37 localIdentifier];
          unint64_t v41 = [v38 objectForKeyedSubscript:v40];
          id v42 = [v41 firstObject];

          if (v42)
          {
            if ((v79 & 1) == 0)
            {
              __int16 v43 = [v82 localIdentifier];
              uint64_t v44 = [v42 localIdentifier];
              char v45 = [v43 isEqualToString:v44];

              if (v45)
              {
                int v6 = 0;
LABEL_56:

LABEL_57:
                if (v6 != 21 && v6) {
                  goto LABEL_85;
                }
                ++v87;
                continue;
              }
            }
            uint64_t v46 = objc_opt_class();
            id v47 = objc_loadWeakRetained((id *)(*(void *)(a1 + 104) + 8));
            id v84 = (void *)[v46 newAllFacesFetchOptionsWithPhotoLibrary:v47];

            uint64_t v81 = [MEMORY[0x1E4F39048] fetchKeyFaceForFaceGroup:v42 options:v84];
            v48 = [v81 firstObject];
            os_signpost_id_t v49 = v48;
            if (v48)
            {
              id v50 = [v48 localIdentifier];
              uint64_t v51 = [v39 localIdentifier];
              int v52 = [v50 isEqualToString:v51];
            }
            else
            {
              int v52 = 1;
            }
            long long v57 = [MEMORY[0x1E4F39088] changeRequestForFaceGroup:v42];

            v104 = v39;
            uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
            [v57 removeFaces:v58];

            [v57 setPersonBuilderState:1];
            id v59 = *(void **)(a1 + 96);
            uint64_t v60 = [v42 localIdentifier];
            [v59 addObject:v60];

            if (v52) {
              [*(id *)(a1 + 112) addObject:v42];
            }

            int v6 = 0;
            v86 = v57;
          }
          else
          {
            id v84 = [v39 localIdentifier];
            uint64_t v53 = [v39 clusterSequenceNumber];
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              uint64_t v54 = VCPLogInstance();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint32_t v106 = v84;
                __int16 v107 = 1024;
                int v108 = v53;
                _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_DEFAULT, "PersistFaceGroups: Failed to find a faceGroup for face '%@' with CSN: %d", buf, 0x12u);
              }
            }
            uint64_t v55 = *(void **)(a1 + 72);
            long long v56 = [NSNumber numberWithInteger:v53];
            [v55 addObject:v56];

            [*(id *)(a1 + 80) addObject:v84];
            int v6 = 21;
          }
          break;
        }

        goto LABEL_56;
      }
      [*(id *)(a1 + 72) addObject:v80];
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v16 = v78;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v97 objects:v110 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v98;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v98 != v18) {
              objc_enumerationMutation(v16);
            }
            os_signpost_id_t v20 = *(void **)(*((void *)&v97 + 1) + 8 * i);
            id v21 = v7[2](v7, v20);
            if (v21)
            {
              if ([v88 containsObject:v20])
              {
                [*(id *)(a1 + 72) addObject:v20];
                id v22 = *(void **)(a1 + 80);
                id v23 = [v21 localIdentifier];
                [v22 addObject:v23];
              }
            }
            else
            {
              [*(id *)(a1 + 72) addObject:v20];
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v97 objects:v110 count:16];
        }
        while (v17);
      }

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v24 = VCPLogInstance();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint32_t v106 = v80;
          _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_INFO, "PersistFaceGroups: Photo library is missing a face with CSN = %@", buf, 0xCu);
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = *(void **)(a1 + 72);
          *(_DWORD *)buf = 138412290;
          uint32_t v106 = v26;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_INFO, "PersistFaceGroups: Faces with these CSNs will be removed from the cluster cache: %@", buf, 0xCu);
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v27 = VCPLogInstance();
        uint64_t v82 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = *(void **)(a1 + 80);
          *(_DWORD *)buf = 138412290;
          uint32_t v106 = v28;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_INFO, "PersistFaceGroups: Faces with these localIdentifiers will be re-clustered: %@", buf, 0xCu);
        }
        int v6 = 4;
        goto LABEL_86;
      }
      int v6 = 4;
LABEL_87:
    }
    if (v6 && v6 != 4) {
      goto LABEL_93;
    }
    ++v83;
  }
  v67 = (void *)[*(id *)(a1 + 32) mutableCopy];
  long long v68 = [*(id *)(a1 + 80) allObjects];
  [v67 removeObjectsForKeys:v68];

  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_488;
  v89[3] = &unk_1E6298C90;
  id v90 = *(id *)(a1 + 56);
  [v67 enumerateKeysAndObjectsUsingBlock:v89];

LABEL_93:
}

id __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    int v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  }

  return v4;
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_487(id *a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(a1[4], "objectForKeyedSubscript:");
  if (v3)
  {
    [a1[5] addObject:v3];
  }
  else
  {
    uint64_t v4 = [a1[6] objectForKeyedSubscript:v5];
    if (v4)
    {
      id v3 = (void *)v4;
      objc_msgSend(a1[7], "addObject:");
    }
    else
    {
      id v3 = 0;
      [a1[8] addObject:v5];
    }
  }
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_488(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (v7)
  {
    int v8 = [MEMORY[0x1E4F39058] changeRequestForFace:v7];
    objc_msgSend(v8, "setClusterSequenceNumber:", objc_msgSend(v6, "integerValue"));
  }
  else if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_signpost_id_t v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "PersistFaceGroups: Failed to find face with localIdentier: %@. Could not set its CSN to %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

+ (void)enumerateFetchResult:(id)a3 withBatchSize:(unint64_t)a4 handler:(id)a5
{
  id v7 = a3;
  int v8 = (void (**)(id, void *, unint64_t, unint64_t, unsigned char *))a5;
  unint64_t v9 = 0;
  char v15 = 0;
  do
  {
    if (v9 >= [v7 count]) {
      break;
    }
    uint64_t v10 = [v7 count];
    unint64_t v11 = v10 - v9 >= a4 ? a4 : v10 - v9;
    __int16 v12 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v9, v11);
    id v13 = [v7 objectsAtIndexes:v12];
    if (v8)
    {
      uint64_t v14 = (void *)MEMORY[0x1C186D320]();
      v8[2](v8, v13, v9, v11, &v15);
    }
    v9 += v11;
  }
  while (!v15);
}

- (BOOL)resetLibraryClustersWithCancelOrExtendTimeoutBlock:(id)a3 error:(id *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a3;
  uint64_t v36 = self;
  p_photoLibrary = &self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_photoLibrary);
    uint64_t v32 = [v9 librarySpecificFetchOptions];

    uint64_t v10 = objc_opt_class();
    id v11 = objc_loadWeakRetained((id *)p_photoLibrary);
    id v35 = (void *)[v10 newAllFacesFetchOptionsWithPhotoLibrary:v11];

    uint64_t v44 = *MEMORY[0x1E4F39630];
    __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    location = (id *)p_photoLibrary;
    uint64_t v29 = a4;
    [v35 setFetchPropertySets:v12];

    id v13 = [MEMORY[0x1E4F39080] fetchFaceGroupsWithOptions:v32];
    id v14 = 0;
    unint64_t v15 = 0;
    uint64_t v33 = *MEMORY[0x1E4F397F8];
    uint64_t v30 = *MEMORY[0x1E4F28760];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    while (1)
    {
      if (v15 >= [v13 count])
      {
        BOOL v26 = [(VCPPhotosPersistenceDelegate *)v36 cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:v6 error:v29];
        goto LABEL_21;
      }
      id v16 = (void *)MEMORY[0x1C186D320]();
      if (v6) {
        v6[2](v6);
      }
      uint64_t v17 = [v13 objectAtIndexedSubscript:v15];
      id v18 = objc_loadWeakRetained(location);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __89__VCPPhotosPersistenceDelegate_resetLibraryClustersWithCancelOrExtendTimeoutBlock_error___block_invoke;
      v38[3] = &unk_1E62992C0;
      void v38[4] = v36;
      id v19 = v17;
      id v39 = v19;
      id v40 = v35;
      unint64_t v41 = v6;
      id v37 = v14;
      char v20 = [v18 performCancellableChangesAndWait:v38 error:&v37];
      id v21 = v37;

      if ((v20 & 1) == 0)
      {
        id v22 = [v21 domain];
        if (![v22 isEqualToString:v33])
        {
          id v14 = v21;
          goto LABEL_12;
        }
        BOOL v23 = [v21 code] == 3072;

        if (v23)
        {
          id v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v42 = v31;
          id v22 = [NSString stringWithFormat:@"Canceled operation to reset library clusters"];
          __int16 v43 = v22;
          uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          id v14 = [v24 errorWithDomain:v30 code:-128 userInfo:v25];

LABEL_12:
          goto LABEL_13;
        }
      }
      id v14 = v21;
LABEL_13:

      ++v15;
      if ((v20 & 1) == 0)
      {
        if (v29)
        {
          id v14 = v14;
          BOOL v26 = 0;
          id *v29 = v14;
        }
        else
        {
          BOOL v26 = 0;
        }
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
  }
  if (a4)
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"could not access the library"];
    v46[0] = v14;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
    BOOL v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  BOOL v26 = 0;
LABEL_23:

  return v26;
}

void __89__VCPPhotosPersistenceDelegate_resetLibraryClustersWithCancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, unsigned char *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __89__VCPPhotosPersistenceDelegate_resetLibraryClustersWithCancelOrExtendTimeoutBlock_error___block_invoke_2;
  v9[3] = &unk_1E62995D0;
  id v10 = *(id *)(a1 + 56);
  [v4 enumerateFetchResult:v5 withBatchSize:100 handler:v9];

  uint64_t v6 = *(void *)(a1 + 56);
  if (v6 && (*(unsigned int (**)(void))(v6 + 16))())
  {
    *a2 = 1;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F39088];
    v11[0] = *(void *)(a1 + 40);
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v7 deleteFaceGroups:v8];
  }
}

void __89__VCPPhotosPersistenceDelegate_resetLibraryClustersWithCancelOrExtendTimeoutBlock_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a2;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = objc_msgSend(MEMORY[0x1E4F39058], "changeRequestForFace:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        [v11 setClusterSequenceNumber:0];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12 && (*(unsigned int (**)(void))(v12 + 16))()) {
    *a5 = 1;
  }
}

- (BOOL)deleteEmptyGroupsAndReturnError:(id *)a3
{
  p_photoLibrary = &self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  uint64_t v6 = [WeakRetained librarySpecificFetchOptions];

  id v7 = [MEMORY[0x1E4F39080] fetchEmptyFaceGroupsWithOptions:v6];
  if ([v7 count])
  {
    uint64_t v8 = [v7 fetchedObjects];
    id v9 = objc_loadWeakRetained((id *)p_photoLibrary);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__VCPPhotosPersistenceDelegate_deleteEmptyGroupsAndReturnError___block_invoke;
    v13[3] = &unk_1E6296FF8;
    id v14 = v8;
    id v10 = v8;
    char v11 = [v9 performChangesAndWait:v13 error:a3];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

uint64_t __64__VCPPhotosPersistenceDelegate_deleteEmptyGroupsAndReturnError___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F39088] deleteFaceGroups:*(void *)(a1 + 32)];
}

- (BOOL)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v9 = (unsigned int (**)(void))a5;
  id v10 = objc_opt_class();
  location = (id *)&self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  id v47 = (void *)[v10 newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:WeakRetained];

  if (!a4)
  {
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"keyFace == nil"];
    [v47 setInternalPredicate:v12];
  }
  if ([v51 count]) {
    [MEMORY[0x1E4F391F8] fetchPersonsWithLocalIdentifiers:v51 options:v47];
  }
  else {
  uint64_t v46 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v47];
  }
  id v50 = [v46 fetchedObjects];
  if ([v51 count] && !objc_msgSend(v50, "count"))
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v78 = *MEMORY[0x1E4F28568];
    uint64_t v30 = [NSString stringWithFormat:@"[UpdateKeyFaces] Failed to find persons %@", v51];
    v79[0] = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
    id v56 = [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v31];

    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[VCPPhotosPersistenceDelegate updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:cancelOrExtendTimeoutBlock:error:]";
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v56;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
      }
    }
    if (!a6)
    {
      char v28 = 0;
      goto LABEL_53;
    }
    id v57 = v56;
    char v28 = 0;
    *a6 = v57;

LABEL_54:
    id v14 = v50;
  }
  else
  {
    uint64_t v55 = self;
    if (a4)
    {
LABEL_11:
      id v56 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      int v52 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v50;
      uint64_t v15 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (!v15)
      {

        goto LABEL_40;
      }
      id v54 = 0;
      uint64_t v16 = *(void *)v65;
      uint64_t v48 = *MEMORY[0x1E4F28760];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      while (1)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v65 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          id v19 = (void *)MEMORY[0x1C186D320]();
          if (v9 && v9[2](v9))
          {
            char v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v71 = v49;
            id v21 = [NSString stringWithFormat:@"[UpdateKeyFaces] Operation canceled"];
            uint64_t v72 = v21;
            id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
            uint64_t v23 = [v20 errorWithDomain:v48 code:-128 userInfo:v22];

            int v24 = 0;
            id v54 = (id)v23;
LABEL_25:

            goto LABEL_27;
          }
          id v21 = [(VCPPhotosPersistenceDelegate *)v55 bestRepresentativeFaceForPerson:v18 qualityMeasureByFace:v56 candidateFaces:0 cancelOrExtendTimeoutBlock:v9];
          if (v21)
          {
            [v52 setObject:v21 forKey:v18];
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v22 = VCPLogInstance();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = [v18 localIdentifier];
              uint64_t v26 = [v18 verifiedType];
              *(_DWORD *)buf = 138412546;
              v75 = v25;
              __int16 v76 = 2048;
              uint64_t v77 = v26;
              _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[UpdateKeyFaces] Failed to find a representing face for Person %@ (verified type %ld)", buf, 0x16u);
            }
            int v24 = 1;
            goto LABEL_25;
          }
          int v24 = 1;
LABEL_27:

          if (!v24) {
            goto LABEL_30;
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (!v15)
        {
LABEL_30:

          if (v54)
          {
            if (a6)
            {
              id v27 = v54;
              char v28 = 0;
              *a6 = v27;
            }
            else
            {
              char v28 = 0;
              id v27 = v54;
            }
LABEL_52:

            id v50 = obj;
LABEL_53:

            goto LABEL_54;
          }
LABEL_40:
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __121__VCPPhotosPersistenceDelegate_updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_cancelOrExtendTimeoutBlock_error___block_invoke_506;
          aBlock[3] = &unk_1E6299620;
          id v60 = v52;
          uint64_t v63 = v9;
          uint64_t v61 = v55;
          id v62 = v56;
          uint64_t v33 = _Block_copy(aBlock);
          id v34 = (void *)MEMORY[0x1C186D320]();
          id v35 = objc_loadWeakRetained(location);
          id v58 = 0;
          char v28 = [v35 performCancellableChangesAndWait:v33 error:&v58];
          id v36 = v58;

          if ((v28 & 1) == 0)
          {
            id v37 = [v36 domain];
            if (![v37 isEqualToString:*MEMORY[0x1E4F397F8]]) {
              goto LABEL_44;
            }
            BOOL v38 = [v36 code] == 3072;

            if (v38)
            {
              id v39 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v69 = *MEMORY[0x1E4F28568];
              id v37 = [NSString stringWithFormat:@"[UpdateKeyFaces] Operation canceled"];
              uint64_t v70 = v37;
              id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
              uint64_t v41 = [v39 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v40];

              id v36 = (id)v41;
LABEL_44:
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              uint64_t v42 = VCPLogInstance();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v75 = (const char *)v36;
                _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_ERROR, "[UpdateKeyFaces] Failed to persist key face - %@", buf, 0xCu);
              }
            }
            if (a6)
            {
              id v36 = v36;
              *a6 = v36;
            }
          }

          id v27 = 0;
          goto LABEL_52;
        }
      }
    }
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __121__VCPPhotosPersistenceDelegate_updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_cancelOrExtendTimeoutBlock_error___block_invoke;
    v68[3] = &unk_1E62995F8;
    v68[4] = self;
    long long v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:v68];
    id v14 = [v50 filteredArrayUsingPredicate:v13];

    if ([v14 count])
    {
      id v50 = v14;
      goto LABEL_11;
    }
    char v28 = 1;
  }

  return v28;
}

BOOL __121__VCPPhotosPersistenceDelegate_updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v6 = (void *)[v4 newVisibleFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  [v6 setWantsIncrementalChangeDetails:0];
  [v6 setFetchLimit:1];
  v15[0] = *MEMORY[0x1E4F39630];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v6 setFetchPropertySets:v7];

  [v6 setShouldPrefetchCount:1];
  uint64_t v8 = [MEMORY[0x1E4F39048] fetchKeyFaceForPerson:v3 options:v6];
  uint64_t v9 = [v8 count];

  if (v9 && (int)MediaAnalysisLogLevel() >= 7)
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      char v11 = [v3 localIdentifier];
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[UpdateKeyFaces] Person %@ already has a keyface; skipping",
        (uint8_t *)&v13,
        0xCu);
    }
  }

  return v9 == 0;
}

void __121__VCPPhotosPersistenceDelegate_updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_cancelOrExtendTimeoutBlock_error___block_invoke_506(uint64_t a1, unsigned char *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = [*(id *)(a1 + 32) keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v4)
  {
    uint64_t v31 = *(void *)v37;
    *(void *)&long long v5 = 134217984;
    long long v29 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v36 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 56);
        if (v8 && ((*(uint64_t (**)(void))(v8 + 16))() & 1) != 0)
        {
          *a2 = 1;
          goto LABEL_35;
        }
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, v29);
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v10 = VCPLogInstance();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            char v11 = [v7 localIdentifier];
            uint64_t v12 = [v7 verifiedType];
            int v13 = [v9 localIdentifier];
            *(_DWORD *)buf = 138412802;
            uint64_t v42 = (uint64_t)v11;
            __int16 v43 = 2048;
            uint64_t v44 = v12;
            __int16 v45 = 2112;
            uint64_t v46 = v13;
            _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_INFO, "[UpdateKeyFaces] Updating Person %@ (verified type %ld) with key face %@", buf, 0x20u);
          }
        }
        if ([v7 verifiedType] == 1
          || [v7 verifiedType] == 2
          || (id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8)),
              int v15 = objc_msgSend(WeakRetained, "mad_useVUGallery"),
              WeakRetained,
              v15))
        {
          uint64_t v16 = [MEMORY[0x1E4F39208] changeRequestForPerson:v7];
          [v16 setKeyFace:v9 forCluster:0];
          goto LABEL_16;
        }
        id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
        uint64_t v16 = [v17 librarySpecificFetchOptions];

        uint64_t v18 = [MEMORY[0x1E4F39080] fetchFaceGroupsForPerson:v7 options:v16];
        if ([v18 count] == 1)
        {
          id v19 = [v18 firstObject];
          char v20 = [MEMORY[0x1E4F39088] changeRequestForFaceGroup:v19];
          [v20 setKeyFace:v9];

LABEL_23:
          goto LABEL_24;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = [v18 count];
            *(_DWORD *)buf = v29;
            uint64_t v42 = v21;
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[UpdateKeyFaces] Found %lu face groups for unverified person)", buf, 0xCu);
          }
          goto LABEL_23;
        }
LABEL_24:

LABEL_16:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v22 = [v3 countByEnumeratingWithState:&v36 objects:v47 count:16];
      uint64_t v4 = v22;
    }
    while (v22);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = [*(id *)(a1 + 48) keyEnumerator];
  uint64_t v23 = [v3 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v3);
        }
        uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v27 = [MEMORY[0x1E4F39058] changeRequestForFace:v26];
        char v28 = [*(id *)(a1 + 48) objectForKey:v26];
        objc_msgSend(v27, "setQualityMeasure:", objc_msgSend(v28, "integerValue"));
      }
      uint64_t v23 = [v3 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v23);
  }
LABEL_35:
}

- (double)_keyFaceWeightingFactorCoefficient
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 persistentDomainForName:@"com.apple.mediaanalysis"];

  uint64_t v4 = [v3 objectForKey:@"KeyFaceCoefficient"];
  long long v5 = v4;
  if (!v4)
  {
    if ((int)MediaAnalysisLogLevel() < 7)
    {
      double v7 = 0.8;
      goto LABEL_11;
    }
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    double v7 = 0.8;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    int v12 = 134217984;
    uint64_t v13 = 0x3FE999999999999ALL;
    id v10 = "[UpdateKeyFaces] Default key face coefficient - %.2f";
    goto LABEL_8;
  }
  [v4 doubleValue];
  double v7 = v6;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_11;
    }
    int v12 = 138412290;
    uint64_t v13 = (uint64_t)v5;
    id v10 = "[UpdateKeyFaces] Overwriting key face coefficient - %@";
LABEL_8:
    _os_log_impl(&dword_1BBEDA000, v8, v9, v10, (uint8_t *)&v12, 0xCu);
    goto LABEL_9;
  }
LABEL_11:

  return v7;
}

- (double)_keyFaceSunglassesFactorCoefficient
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 persistentDomainForName:@"com.apple.mediaanalysis"];

  uint64_t v4 = [v3 objectForKey:@"KeyFaceSunglassesCoefficient"];
  long long v5 = v4;
  if (!v4)
  {
    if ((int)MediaAnalysisLogLevel() < 7)
    {
      double v7 = 0.1;
      goto LABEL_11;
    }
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    double v7 = 0.1;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    int v12 = 134217984;
    uint64_t v13 = 0x3FB999999999999ALL;
    id v10 = "[UpdateKeyFaces] Default key face sunglasses coefficient - %.2f";
    goto LABEL_8;
  }
  [v4 doubleValue];
  double v7 = v6;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_11;
    }
    int v12 = 138412290;
    uint64_t v13 = (uint64_t)v5;
    id v10 = "[UpdateKeyFaces] Overwriting key face sunglasses coefficient - %@";
LABEL_8:
    _os_log_impl(&dword_1BBEDA000, v8, v9, v10, (uint8_t *)&v12, 0xCu);
    goto LABEL_9;
  }
LABEL_11:

  return v7;
}

- (double)_keyFacePortraitFactorCoefficient
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 persistentDomainForName:@"com.apple.mediaanalysis"];

  uint64_t v4 = [v3 objectForKey:@"KeyFacePortraitCoefficient"];
  long long v5 = v4;
  if (!v4)
  {
    if ((int)MediaAnalysisLogLevel() < 7)
    {
      double v7 = 0.1;
      goto LABEL_11;
    }
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    double v7 = 0.1;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    int v12 = 134217984;
    uint64_t v13 = 0x3FB999999999999ALL;
    id v10 = "[UpdateKeyFaces] Default key face portrait coefficient - %.2f";
    goto LABEL_8;
  }
  [v4 doubleValue];
  double v7 = v6;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_11;
    }
    int v12 = 138412290;
    uint64_t v13 = (uint64_t)v5;
    id v10 = "[UpdateKeyFaces] Overwriting key face portrait coefficient - %@";
LABEL_8:
    _os_log_impl(&dword_1BBEDA000, v8, v9, v10, (uint8_t *)&v12, 0xCu);
    goto LABEL_9;
  }
LABEL_11:

  return v7;
}

- (id)_bestVURepresentativeFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 candidateFaces:(id)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  v319[1] = *MEMORY[0x1E4F143B8];
  id v262 = a3;
  id v242 = a4;
  id v249 = a5;
  v264 = (uint64_t (**)(void))a6;
  if (v264 && (v264[2]() & 1) != 0)
  {
    id v256 = 0;
    goto LABEL_282;
  }
  [(VCPPhotosPersistenceDelegate *)self _keyFaceWeightingFactorCoefficient];
  double v238 = v10;
  [(VCPPhotosPersistenceDelegate *)self _keyFaceSunglassesFactorCoefficient];
  double v233 = v11;
  [(VCPPhotosPersistenceDelegate *)self _keyFacePortraitFactorCoefficient];
  double v234 = v12;
  int v13 = [v262 detectionType];
  uint64_t v14 = NSString;
  int v250 = v13;
  if (v13 == 1) {
    int v15 = @"Human";
  }
  else {
    int v15 = @"Pet";
  }
  uint64_t v16 = [v262 localIdentifier];
  id v17 = [v262 mdID];
  uint64_t v18 = [v14 stringWithFormat:@"[UpdateKeyFacesVU][%@][%@][%@]", v15, v16, v17];

  id v19 = [v262 mdID];
  v232 = self;
  char v20 = [v19 substringFromIndex:3];

  v224 = v20;
  if (v20)
  {
    double v244 = COERCE_DOUBLE([v20 integerValue]);
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_17;
    }
    uint64_t v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v288 = v18;
      __int16 v289 = 2048;
      double v290 = v244;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "%@ Querying key observations with mdID:%ld", buf, 0x16u);
    }
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = [v262 mdID];
      *(_DWORD *)buf = 138412546;
      v288 = v18;
      __int16 v289 = 2112;
      double v290 = v22;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "%@ Person does not have valid mdID: %@", buf, 0x16u);
    }
    double v244 = 0.0;
LABEL_15:

    goto LABEL_17;
  }
  double v244 = 0.0;
LABEL_17:
  uint64_t v23 = NSString;
  uint64_t v24 = [v262 localIdentifier];
  v253 = [v23 stringWithFormat:@"[UpdateKeyFacesVU][%@][%@][%ld]", v15, v24, *(void *)&v244];

  location = (id *)&self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v245 = +[MADVUGalleryReader sharedGalleryWithPhotoLibrary:WeakRetained];

  if (!v245 && (int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v26 = VCPLogInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEFAULT, "Failed to initialize VU Gallery Reader. Will fallback to use top quality faces from photos DB", buf, 2u);
    }
  }
  id v27 = objc_loadWeakRetained(location);
  v272 = objc_msgSend(v27, "mad_allFacesFetchOptions");

  [v272 setIncludeNonvisibleFaces:0];
  [v272 setIncludeTorsoOnlyDetectionData:0];
  v252 = (void *)[v272 copy];
  uint64_t v28 = *MEMORY[0x1E4F39630];
  v319[0] = *MEMORY[0x1E4F39630];
  long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v319 count:1];
  [v252 setFetchPropertySets:v29];

  v259 = [MEMORY[0x1E4F1CA80] set];
  id v30 = objc_loadWeakRetained(location);
  v231 = objc_msgSend(v30, "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:", 0, &unk_1F15EE208);

  v265 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v231];
  unint64_t v31 = 0;
  long long v32 = v272;
  while (v31 < [v265 count])
  {
    long long v33 = (void *)MEMORY[0x1C186D320]();
    long long v34 = [v265 objectAtIndexedSubscript:v31];
    long long v35 = [v262 localIdentifier];
    long long v36 = [v34 localIdentifier];
    if (([v35 isEqualToString:v36] & 1) == 0)
    {
      BOOL v37 = [v34 keyFacePickSource] == 1;

      if (!v37) {
        goto LABEL_34;
      }
      long long v38 = [MEMORY[0x1E4F39048] fetchKeyFaceForPerson:v34 options:v252];
      long long v35 = [v38 firstObject];

      if (v35)
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          long long v39 = VCPLogInstance();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            double v40 = [v35 localIdentifier];
            uint64_t v41 = [v34 localIdentifier];
            *(_DWORD *)buf = 138412802;
            v288 = v253;
            __int16 v289 = 2112;
            double v290 = v40;
            __int16 v291 = 2112;
            double v292 = *(double *)&v41;
            _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEBUG, "%@ keyFace %@ is picked by user for %@", buf, 0x20u);
          }
        }
        long long v36 = [v35 localIdentifier];
        [v259 addObject:v36];
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_33;
        }
        long long v36 = VCPLogInstance();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          double v42 = [v34 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v288 = v253;
          __int16 v289 = 2112;
          double v290 = v42;
          _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_ERROR, "%@ keyFace picked by user for %@, but NO keyface fetched!", buf, 0x16u);
        }
      }
    }

LABEL_33:
LABEL_34:

    long long v32 = v272;
    ++v31;
  }
  v237 = (void *)[v32 copy];
  uint64_t v318 = v28;
  __int16 v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v318 count:1];
  [v237 setFetchPropertySets:v43];

  v229 = [MEMORY[0x1E4F39048] fetchFacesForPerson:v262 options:v237];
  if ([v229 count] == 1)
  {
    uint64_t v44 = [v229 firstObject];
    __int16 v45 = [v44 localIdentifier];
    int v46 = [v259 containsObject:v45];

    if (v46)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v47 = VCPLogInstance();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          double v48 = [v44 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v288 = v253;
          __int16 v289 = 2112;
          double v290 = v48;
          _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_ERROR, "%@ Face %@ is already picked by user as keyFace of another person", buf, 0x16u);
        }
      }
      id v256 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v221 = VCPLogInstance();
        if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
        {
          double v222 = [v44 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v288 = v253;
          __int16 v289 = 2112;
          double v290 = v222;
          _os_log_impl(&dword_1BBEDA000, v221, OS_LOG_TYPE_INFO, "%@ Person only has 1 face %@ - return that face as key face", buf, 0x16u);
        }
      }
      id v256 = v44;
    }

    v251 = 0;
    v236 = 0;
    uint64_t v49 = 0;
  }
  else
  {
    v251 = 0;
    v236 = 0;
    uint64_t v49 = 0;
    uint64_t v258 = 0;
    int v51 = v244 != 0.0 && v245 != 0;
    int v246 = v51;
    uint64_t v228 = *MEMORY[0x1E4F39478];
    uint64_t v227 = *MEMORY[0x1E4F39460];
    uint64_t v226 = *MEMORY[0x1E4F394D8];
    double v235 = 1.0 - v238;
    double v255 = 0.0;
    double v230 = 0.6;
    double v225 = 0.0;
    double v239 = 0.0;
    do
    {
      v261 = v49;
      v257 = (void *)MEMORY[0x1C186D320]();
      int v52 = v272;
      if (v264 && (v264[2]() & 1) != 0)
      {
        id v256 = 0;
        int v53 = 1;
      }
      else
      {
        if (v246)
        {
          id v54 = [v245 queryKeyObservationsFor:*(void *)&v244 limit:200 offset:200 * v258];
        }
        else
        {
          id v54 = 0;
        }
        v260 = v54;
        if ([v54 count]) {
          goto LABEL_291;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v58 = VCPLogInstance();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v288 = v253;
            _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_INFO, "%@ End of key observations from VU", buf, 0xCu);
          }

          int v52 = v272;
        }
        if (v258 <= 0)
        {
LABEL_291:
          if (!v258)
          {
            if ([v260 count])
            {
              id v59 = [v260 firstObject];
              id v60 = [v59 allValues];
              uint64_t v61 = [v60 firstObject];
              [v61 doubleValue];
              double v63 = v62;

              int v52 = v272;
              double v230 = v63 * 0.85;
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                long long v64 = VCPLogInstance();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v288 = v253;
                  __int16 v289 = 2048;
                  double v290 = v63 * 0.85;
                  _os_log_impl(&dword_1BBEDA000, v64, OS_LOG_TYPE_INFO, "%@ Setting preferred density quality threshold %.2f", buf, 0x16u);
                }

                int v52 = v272;
              }
            }
          }
          ++v258;
          if (v264 && (v264[2]() & 1) != 0)
          {
            id v256 = 0;
            int v53 = 1;
          }
          else
          {
            v254 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v260, "count"));
            if ([v260 count])
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                uint64_t v55 = VCPLogInstance();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v288 = v253;
                  _os_log_impl(&dword_1BBEDA000, v55, OS_LOG_TYPE_DEBUG, "%@ Fetching key observations from Photos DB ...", buf, 0xCu);
                }

                int v52 = v272;
              }
              id v56 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v260, "count"));
              v281[0] = MEMORY[0x1E4F143A8];
              v281[1] = 3221225472;
              v281[2] = __130__VCPPhotosPersistenceDelegate__bestVURepresentativeFaceForPerson_qualityMeasureByFace_candidateFaces_cancelOrExtendTimeoutBlock___block_invoke;
              v281[3] = &unk_1E6299648;
              id v282 = v253;
              id v57 = v56;
              id v283 = v57;
              id v284 = v254;
              [v260 enumerateObjectsUsingBlock:v281];
              v263 = [MEMORY[0x1E4F39048] fetchFacesWithVuObservationIDs:v57 options:v52];
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                long long v65 = VCPLogInstance();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v288 = v253;
                  _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_DEBUG, "%@ Fetching top quality faces from Photos DB ...", buf, 0xCu);
                }

                int v52 = v272;
              }
              id v57 = (id)[v52 copy];
              long long v66 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"quality" ascending:0];
              v317 = v66;
              long long v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v317 count:1];
              [v57 setSortDescriptors:v67];

              [v57 setFetchLimit:200];
              v263 = [MEMORY[0x1E4F39048] fetchFacesForPerson:v262 options:v57];
            }

            if ([v263 count])
            {
              if ((unint64_t)[v260 count] <= 1 && objc_msgSend(v263, "count") == 1)
              {
                if ((int)MediaAnalysisLogLevel() >= 6)
                {
                  long long v68 = VCPLogInstance();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v69 = [v263 firstObject];
                    double v70 = [v69 localIdentifier];
                    *(_DWORD *)buf = 138412546;
                    v288 = v253;
                    __int16 v289 = 2112;
                    double v290 = v70;
                    _os_log_impl(&dword_1BBEDA000, v68, OS_LOG_TYPE_INFO, "%@ Returning sole key face %@", buf, 0x16u);
                  }
                }
                id v256 = [v263 firstObject];
                int v53 = 1;
                goto LABEL_268;
              }
              uint64_t v71 = [MEMORY[0x1E4F1CA60] dictionary];
              uint64_t v72 = [MEMORY[0x1E4F1CA60] dictionary];
              id v73 = objc_loadWeakRetained(location);
              v243 = [v73 librarySpecificFetchOptions];

              v316[0] = v228;
              v316[1] = v227;
              v316[2] = v226;
              uint64_t v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v316 count:3];
              [v243 setFetchPropertySets:v74];

              v75 = (void *)MEMORY[0x1E4F38EC0];
              __int16 v76 = [v263 fetchedObjects];
              v271 = [v75 fetchAssetsForFaces:v76 options:v243];

              for (unint64_t i = 0; i < [v271 count]; ++i)
              {
                context = (void *)MEMORY[0x1C186D320]();
                uint64_t v77 = [v271 objectAtIndexedSubscript:i];
                uint64_t v78 = [MEMORY[0x1E4F39048] fetchFacesInAsset:v77 options:v272];
                long long v279 = 0u;
                long long v280 = 0u;
                long long v277 = 0u;
                long long v278 = 0u;
                id v79 = v78;
                uint64_t v80 = [v79 countByEnumeratingWithState:&v277 objects:v315 count:16];
                if (v80)
                {
                  uint64_t v81 = *(void *)v278;
                  do
                  {
                    for (uint64_t j = 0; j != v80; ++j)
                    {
                      if (*(void *)v278 != v81) {
                        objc_enumerationMutation(v79);
                      }
                      unint64_t v83 = *(void **)(*((void *)&v277 + 1) + 8 * j);
                      id v84 = [v83 localIdentifier];
                      id v85 = [v72 objectForKeyedSubscript:v84];
                      BOOL v86 = v85 == 0;

                      if (v86)
                      {
                        unint64_t v87 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v79, "count"));
                        id v88 = [v83 localIdentifier];
                        [v72 setObject:v87 forKeyedSubscript:v88];
                      }
                      id v89 = [v83 localIdentifier];
                      id v90 = [v71 objectForKeyedSubscript:v89];
                      BOOL v91 = v90 == 0;

                      if (v91)
                      {
                        id v92 = [v83 localIdentifier];
                        [v71 setObject:v77 forKeyedSubscript:v92];
                      }
                    }
                    uint64_t v80 = [v79 countByEnumeratingWithState:&v277 objects:v315 count:16];
                  }
                  while (v80);
                }
              }
              unint64_t v93 = 0;
              while (2)
              {
                if (v93 >= [v263 count])
                {
                  if (v261)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      v218 = VCPLogInstance();
                      if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
                      {
                        double v219 = [v261 localIdentifier];
                        *(_DWORD *)buf = 138412546;
                        v288 = v253;
                        __int16 v289 = 2112;
                        double v290 = v219;
                        _os_log_impl(&dword_1BBEDA000, v218, OS_LOG_TYPE_INFO, "%@ Returning preferred key face %@", buf, 0x16u);
                      }
                    }
                    int v53 = 20;
                  }
                  else
                  {
                    v261 = 0;
                    int v53 = 0;
                  }
LABEL_266:

LABEL_267:
                  goto LABEL_268;
                }
                id v94 = (void *)MEMORY[0x1C186D320]();
                if (v264 && (v264[2]() & 1) != 0)
                {
                  id v256 = 0;
                  int v53 = 1;
                  goto LABEL_200;
                }
                id v95 = [v263 objectAtIndexedSubscript:v93];
                id v96 = [v95 localIdentifier];
                int v97 = [v259 containsObject:v96];

                if (v97)
                {
                  if ((int)MediaAnalysisLogLevel() >= 5)
                  {
                    long long v98 = VCPLogInstance();
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                    {
                      double v99 = [v95 localIdentifier];
                      *(_DWORD *)buf = 138412546;
                      v288 = v253;
                      __int16 v289 = 2112;
                      double v290 = v99;
                      _os_log_impl(&dword_1BBEDA000, v98, OS_LOG_TYPE_DEFAULT, "%@ Skip user picked keyFace %@", buf, 0x16u);
                    }
                    goto LABEL_197;
                  }
LABEL_198:
                  int v53 = 40;
LABEL_199:

LABEL_200:
                  if (v53 != 40 && v53) {
                    goto LABEL_266;
                  }
                  ++v93;
                  continue;
                }
                break;
              }
              [v95 quality];
              if (v100 > v255)
              {
                [v95 quality];
                double v255 = v101;
                id v102 = v95;

                v251 = v102;
              }
              if (v250 == 1)
              {
                [v95 roll];
                if (fabs(v103) > 0.785398163) {
                  goto LABEL_198;
                }
                v104 = (void *)MEMORY[0x1E4F8CCE8];
                [v95 size];
                double v106 = v105;
                uint64_t v107 = [v95 sourceWidth];
                uint64_t v108 = [v95 sourceHeight];
                [v95 centerX];
                double v110 = v109;
                [v95 centerY];
                if ([v104 getCropRectForPortraitImage:v276 size:v106 imgWidth:(double)v107 imgHeight:(double)v108 centerX:v110 centerY:v111])double v112 = 1.0; {
                else
                }
                  double v112 = v234;
                if ([v95 glassesType] == 2) {
                  double v113 = v233;
                }
                else {
                  double v113 = 1.0;
                }
                id v114 = [v95 localIdentifier];
                id v115 = [v72 objectForKeyedSubscript:v114];
                uint64_t v116 = [v115 integerValue];

                if (v116)
                {
                  double v117 = 1.0;
                  if (v116 == 2) {
                    double v117 = 0.5;
                  }
                  if (v116 <= 2) {
                    double v118 = v117;
                  }
                  else {
                    double v118 = 0.25;
                  }
                  id v119 = objc_msgSend(v95, "localIdentifier", v117);
                  v274 = [v71 objectForKeyedSubscript:v119];

                  if (v274)
                  {
                    int v120 = [v274 mediaSubtypes];
                    v121 = [v274 creationDate];
                    if (v121)
                    {
                      id v122 = [v274 creationDate];
                      id contexta = v122;
                    }
                    else
                    {
                      id v122 = [v274 curationProperties];
                      id contexta = [v122 addedDate];
                    }
                    uint64_t v186 = *(void *)&v120 & 0x80004;

                    if ((*(void *)&v120 & 0x80004) != 0)
                    {
                      id v187 = [MEMORY[0x1E4F1C9C8] distantPast];
                    }
                    else
                    {
                      id v187 = contexta;
                    }
                    contextd = v187;
                    [v187 timeIntervalSinceNow];
                    double v189 = fmax(v188 / 31557600.0 * 0.05 + 1.0, 0.2);
                    if (v189 <= 1.0) {
                      double v190 = v189;
                    }
                    else {
                      double v190 = 1.0;
                    }
                    double v191 = 1.0;
                    if ([v95 poseType] != 1)
                    {
                      if ([v95 poseType]) {
                        double v191 = 0.1;
                      }
                      else {
                        double v191 = 0.5;
                      }
                    }
                    v192 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v95, "vuObservationID"));
                    v248 = [v254 objectForKeyedSubscript:v192];

                    if (v248) {
                      [v248 doubleValue];
                    }
                    else {
                      [v95 quality];
                    }
                    double v194 = v193;
                    double v195 = v235 * (v112 * v113 * v118 * v190 * v191) + v238 * v193;
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      v196 = VCPLogInstance();
                      if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
                      {
                        double v197 = [v95 localIdentifier];
                        char v198 = [v274 mediaSubtypes];
                        uint64_t v199 = [v274 mediaSubtypes];
                        uint64_t v200 = @"Yes";
                        if ((v198 & 4) != 0) {
                          uint64_t v201 = @"Yes";
                        }
                        else {
                          uint64_t v201 = @"No";
                        }
                        *(_DWORD *)buf = 138414850;
                        if ((v199 & 0x80000) == 0) {
                          uint64_t v200 = @"No";
                        }
                        v288 = v253;
                        __int16 v289 = 2112;
                        double v290 = v197;
                        __int16 v291 = 2048;
                        double v292 = v195;
                        __int16 v293 = 2048;
                        double v294 = v194;
                        __int16 v295 = 2048;
                        double v296 = v112;
                        __int16 v297 = 2048;
                        double v298 = v113;
                        __int16 v299 = 2048;
                        double v300 = v118;
                        __int16 v301 = 2048;
                        double v302 = v190;
                        __int16 v303 = 2048;
                        double v304 = v191;
                        __int16 v305 = 2112;
                        double v306 = *(double *)&v201;
                        __int16 v307 = 2112;
                        double v308 = *(double *)&v200;
                        _os_log_impl(&dword_1BBEDA000, v196, OS_LOG_TYPE_DEBUG, "%@ Face %@ score: %.3f (vu-%.3f, a-%.3f, b-%.3f, c-%.3f, d-%.3f, e-%.3f,ScreenShot-%@, ScreenRecording-%@)", buf, 0x70u);
                      }
                    }
                    if (v112 == 1.0 && v191 == 1.0 && v118 == 1.0 && v113 == 1.0 && !v186 && v194 > v230)
                    {
                      if (v195 > v239
                        || v195 == v239
                        && ([v95 quality], double v203 = v202, objc_msgSend(v261, "quality"), v203 > v204))
                      {
                        if ((int)MediaAnalysisLogLevel() >= 7)
                        {
                          v205 = VCPLogInstance();
                          if (os_log_type_enabled(v205, OS_LOG_TYPE_DEBUG))
                          {
                            double v206 = [v95 localIdentifier];
                            *(_DWORD *)buf = 138412546;
                            v288 = v253;
                            __int16 v289 = 2112;
                            double v290 = v206;
                            _os_log_impl(&dword_1BBEDA000, v205, OS_LOG_TYPE_DEBUG, "%@ Find a better preferred key face candidate %@", buf, 0x16u);
                          }
                        }
                        id v207 = v95;

                        v261 = v207;
                        double v239 = v195;
                      }
                    }
                    if (v195 > v225
                      || v195 == v225
                      && ([v95 quality], double v209 = v208, objc_msgSend(v236, "quality"), v209 > v210))
                    {
                      if ((int)MediaAnalysisLogLevel() >= 7)
                      {
                        v211 = VCPLogInstance();
                        if (os_log_type_enabled(v211, OS_LOG_TYPE_DEBUG))
                        {
                          double v212 = [v95 localIdentifier];
                          *(_DWORD *)buf = 138412546;
                          v288 = v253;
                          __int16 v289 = 2112;
                          double v290 = v212;
                          _os_log_impl(&dword_1BBEDA000, v211, OS_LOG_TYPE_DEBUG, "%@ Find a better key face candidate %@", buf, 0x16u);
                        }
                      }
                      id v213 = v95;

                      v236 = v213;
                      double v225 = v195;
                    }
                    v214 = [NSNumber numberWithInteger:(uint64_t)(v195 * 1000.0)];
                    if (v242) {
                      [v242 setObject:v214 forKey:v95];
                    }
                    if (v249)
                    {
                      v313[0] = @"localIdentifier";
                      v215 = [v95 photosFaceRepresentationLocalIdentifier];
                      v314[0] = v215;
                      v314[1] = v214;
                      v313[1] = @"qualityMeasure";
                      v313[2] = @"quality";
                      v216 = [NSNumber numberWithDouble:v194];
                      v314[2] = v216;
                      v217 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v314 forKeys:v313 count:3];

                      [v249 addObject:v217];
                    }

LABEL_253:
                    int v53 = 0;
                    goto LABEL_199;
                  }
                  if ((int)MediaAnalysisLogLevel() < 3) {
                    goto LABEL_198;
                  }
                  long long v98 = VCPLogInstance();
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                  {
                    double v185 = [v95 localIdentifier];
                    *(_DWORD *)buf = 138412546;
                    v288 = v253;
                    __int16 v289 = 2112;
                    double v290 = v185;
                    _os_log_impl(&dword_1BBEDA000, v98, OS_LOG_TYPE_ERROR, "%@ No asset found for face %@; skipping",
                      buf,
                      0x16u);
                  }
                }
                else
                {
                  if ((int)MediaAnalysisLogLevel() < 3) {
                    goto LABEL_198;
                  }
                  long long v98 = VCPLogInstance();
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                  {
                    double v137 = [v95 localIdentifier];
                    *(_DWORD *)buf = 138412546;
                    v288 = v253;
                    __int16 v289 = 2112;
                    double v290 = v137;
                    _os_log_impl(&dword_1BBEDA000, v98, OS_LOG_TYPE_ERROR, "%@ No asset found for face %@; skipping",
                      buf,
                      0x16u);
                  }
                }
LABEL_197:

                goto LABEL_198;
              }
              id v123 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v95, "vuObservationID"));
              v275 = [v254 objectForKeyedSubscript:v123];

              if (v275)
              {
                [v275 doubleValue];
                double v125 = v124;
                if (v124 < 0.8) {
                  goto LABEL_138;
                }
              }
              else
              {
                double v125 = 1.0;
              }
              id v126 = [v95 localIdentifier];
              id v127 = [v72 objectForKeyedSubscript:v126];
              double v247 = v125;
              uint64_t v128 = [v127 integerValue];

              double v129 = 1.0;
              if (v128 > 2) {
                double v129 = 0.25;
              }
              if (v128 == 2) {
                double v129 = 0.5;
              }
              double v241 = v129;
              v130 = [v95 localIdentifier];
              v131 = [v71 objectForKeyedSubscript:v130];

              if (v131)
              {
                int v132 = [v131 mediaSubtypes];
                v133 = [v131 creationDate];
                if (v133)
                {
                  id v134 = [v131 creationDate];
                  id contextb = v134;
                }
                else
                {
                  id v134 = [v131 curationProperties];
                  id contextb = [v134 addedDate];
                }
                if ((*(void *)&v132 & 0x80004) != 0)
                {
                  uint64_t v138 = [MEMORY[0x1E4F1C9C8] distantPast];

                  v139 = (void *)v138;
                }
                else
                {
                  v139 = contextb;
                }
                contextc = v139;
                [v139 timeIntervalSinceNow];
                if (v140 >= 0.0) {
                  double v141 = v140;
                }
                else {
                  double v141 = -v140;
                }
                uint64_t v142 = [v95 sourceHeight];
                int64_t v143 = [v95 sourceWidth];
                if (v142 < v143) {
                  int64_t v143 = v142;
                }
                float v144 = VCPPFResolutionQuality(v143);
                [v95 size];
                *(float *)&double v145 = v145;
                float v146 = VCPPFFaceAreaQuality(*(float *)&v145);
                v147 = [v131 mediaAnalysisProperties];
                [v147 wallpaperScore];
                float v149 = v148;

                v150 = [v131 mediaAnalysisProperties];
                double v151 = 1.0;
                if ((int)[v150 probableRotationDirection] >= 2)
                {
                  v152 = [v131 mediaAnalysisProperties];
                  [v152 probableRotationDirectionConfidence];
                  if (v153 < 0.1) {
                    double v151 = 1.0;
                  }
                  else {
                    double v151 = 0.1;
                  }
                }
                v154 = (void *)MEMORY[0x1E4F8CCE8];
                [v95 size];
                double v156 = v155;
                uint64_t v157 = [v95 sourceWidth];
                uint64_t v158 = [v95 sourceHeight];
                [v95 centerX];
                double v160 = v159;
                [v95 centerY];
                char v162 = [v154 getCropRectForPortraitImage:v276 size:v156 imgWidth:(double)v157 imgHeight:(double)v158 centerX:v160 centerY:v161];
                double v163 = 1.0;
                if ((v162 & 1) == 0)
                {
                  [(VCPPhotosPersistenceDelegate *)v232 _keyFacePortraitFactorCoefficient];
                  double v163 = v164;
                }
                double v165 = fmax(v141 / 31557600.0 * -0.05 + 1.0, 0.8);
                double v166 = v144;
                double v167 = v146;
                double v168 = v235 * (v241 * v165 * v166 * v146 * v149 * v151 * v163) + v238 * v247;
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  id v169 = VCPLogInstance();
                  if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
                  {
                    double v170 = [v95 localIdentifier];
                    char v171 = [v131 mediaSubtypes];
                    uint64_t v172 = [v131 mediaSubtypes];
                    long long v173 = @"Yes";
                    if ((v171 & 4) != 0) {
                      long long v174 = @"Yes";
                    }
                    else {
                      long long v174 = @"No";
                    }
                    *(_DWORD *)buf = 138415362;
                    if ((v172 & 0x80000) == 0) {
                      long long v173 = @"No";
                    }
                    v288 = v253;
                    __int16 v289 = 2112;
                    double v290 = v170;
                    __int16 v291 = 2048;
                    double v292 = v168;
                    __int16 v293 = 2048;
                    double v294 = v247;
                    __int16 v295 = 2048;
                    double v296 = v241;
                    __int16 v297 = 2048;
                    double v298 = v165;
                    __int16 v299 = 2048;
                    double v300 = v166;
                    __int16 v301 = 2048;
                    double v302 = v167;
                    __int16 v303 = 2048;
                    double v304 = v149;
                    __int16 v305 = 2048;
                    double v306 = v151;
                    __int16 v307 = 2048;
                    double v308 = v163;
                    __int16 v309 = 2112;
                    v310 = v174;
                    __int16 v311 = 2112;
                    v312 = v173;
                    _os_log_impl(&dword_1BBEDA000, v169, OS_LOG_TYPE_DEBUG, "%@ Face %@ score: %.3f (vu-%.3f, a-%.3f, b-%.3f, c-%.3f, d-%.3f, e-%.3f, f-%.3f, g-%.3f, ScreenShot-%@, ScreenRecording-%@)", buf, 0x84u);
                  }
                }
                if (v168 > v239
                  || v168 == v239
                  && ([v95 quality], double v176 = v175, objc_msgSend(v261, "quality"), v176 > v177))
                {
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    long long v178 = VCPLogInstance();
                    if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
                    {
                      double v179 = [v95 localIdentifier];
                      *(_DWORD *)buf = 138412546;
                      v288 = v253;
                      __int16 v289 = 2112;
                      double v290 = v179;
                      _os_log_impl(&dword_1BBEDA000, v178, OS_LOG_TYPE_DEBUG, "%@ Find a better key face candidate %@", buf, 0x16u);
                    }
                  }
                  id v180 = v95;

                  v261 = v180;
                  double v239 = v168;
                }
                id v181 = [NSNumber numberWithInteger:(uint64_t)(v168 * 1000.0)];
                if (v242) {
                  [v242 setObject:v181 forKey:v95];
                }
                if (v249)
                {
                  v285[0] = @"localIdentifier";
                  id v182 = [v95 photosFaceRepresentationLocalIdentifier];
                  v286[0] = v182;
                  v286[1] = v181;
                  v285[1] = @"qualityMeasure";
                  v285[2] = @"quality";
                  id v183 = [NSNumber numberWithDouble:v247];
                  v286[2] = v183;
                  id v184 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v286 forKeys:v285 count:3];

                  [v249 addObject:v184];
                }

                goto LABEL_253;
              }
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v135 = VCPLogInstance();
                if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
                {
                  double v136 = [v95 localIdentifier];
                  *(_DWORD *)buf = 138412546;
                  v288 = v253;
                  __int16 v289 = 2112;
                  double v290 = v136;
                  _os_log_impl(&dword_1BBEDA000, v135, OS_LOG_TYPE_ERROR, "%@ No asset found for pet face %@; skipping",
                    buf,
                    0x16u);
                }
              }
LABEL_138:

              goto LABEL_198;
            }
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              uint64_t v71 = VCPLogInstance();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v288 = v253;
                _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_INFO, "%@ No visible face from the batch", buf, 0xCu);
              }
              int v53 = 19;
              goto LABEL_267;
            }
            int v53 = 19;
LABEL_268:
          }
        }
        else
        {
          int v53 = 20;
        }

        uint64_t v49 = v261;
      }
    }
    while (!v53 || v53 == 19);
    if (v53 == 20)
    {
      if (v49)
      {
        id v220 = v49;
        uint64_t v49 = v220;
      }
      else if (v236)
      {
        id v220 = v236;
        uint64_t v49 = 0;
        v236 = v220;
      }
      else
      {
        id v220 = v251;
        v236 = 0;
        uint64_t v49 = 0;
        v251 = v220;
      }
      id v256 = v220;
    }
  }

LABEL_282:
  return v256;
}

void __130__VCPPhotosPersistenceDelegate__bestVURepresentativeFaceForPerson_qualityMeasureByFace_candidateFaces_cancelOrExtendTimeoutBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = a1[4];
      double v6 = [v3 allKeys];
      double v7 = [v6 firstObject];
      uint64_t v8 = [v3 allValues];
      os_log_type_t v9 = [v8 firstObject];
      int v18 = 138412802;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "%@ Receiving key observation %@ with score %@", (uint8_t *)&v18, 0x20u);
    }
  }
  double v10 = (void *)a1[5];
  double v11 = [v3 allKeys];
  double v12 = [v11 firstObject];
  [v10 addObject:v12];

  int v13 = [v3 allValues];
  uint64_t v14 = [v13 firstObject];
  int v15 = (void *)a1[6];
  uint64_t v16 = [v3 allKeys];
  id v17 = [v16 firstObject];
  [v15 setObject:v14 forKeyedSubscript:v17];
}

- (id)bestRepresentativeFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 candidateFaces:(id)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v42 = a4;
  id v37 = a5;
  os_log_type_t v9 = (uint64_t (**)(void))a6;
  double v10 = v9;
  if (v9 && (v9[2](v9) & 1) != 0)
  {
    double v11 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    int v13 = objc_msgSend(WeakRetained, "mad_useVUGallery");

    if (v13)
    {
      double v11 = [(VCPPhotosPersistenceDelegate *)self _bestVURepresentativeFaceForPerson:v38 qualityMeasureByFace:v42 candidateFaces:v37 cancelOrExtendTimeoutBlock:v10];
    }
    else
    {
      uint64_t v14 = objc_opt_class();
      id v15 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      long long v34 = (void *)[v14 newVisibleFacesFetchOptionsWithPhotoLibrary:v15];

      v49[0] = *MEMORY[0x1E4F39610];
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
      [v34 setFetchPropertySets:v16];

      long long v35 = [(VCPPhotosPersistenceDelegate *)self _facesFromFaceGroupWithMostNumberOfFacesOnPerson:v38 options:v34 error:0];
      if (!v35)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "[UpdateKeyFaces] None of the faces on the person are clustered - just fetch faces for the person", buf, 2u);
          }
        }
        int v18 = [MEMORY[0x1E4F39048] fetchFacesForPerson:v38 options:v34];
        long long v35 = [v18 fetchedObjects];
      }
      if (v10 && (v10[2](v10) & 1) != 0)
      {
        double v11 = 0;
      }
      else
      {
        long long v36 = [(VCPPhotosPersistenceDelegate *)self _faceToFaceCountMapForFaces:v35];
        uint64_t v41 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id obj = v35;
        uint64_t v19 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v44;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v44 != v20) {
                objc_enumerationMutation(obj);
              }
              __int16 v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              uint64_t v23 = (void *)MEMORY[0x1C186D320]();
              if (v10 && (v10[2](v10) & 1) != 0)
              {
                int v24 = 0;
              }
              else
              {
                uint64_t v25 = [v22 qualityMeasure];
                uint64_t v26 = [v22 localIdentifier];
                if (!v25)
                {
                  id v27 = [v36 valueForKey:v26];
                  unint64_t v28 = [v27 integerValue];

                  uint64_t v29 = v28 <= 1 ? 1 : v28;
                  uint64_t v25 = [MEMORY[0x1E4F8CCE8] qualityMeasureForFace:v22 countOfFacesOnAsset:v29];
                  if (v42)
                  {
                    id v30 = [NSNumber numberWithInteger:v25];
                    [v42 setObject:v30 forKey:v22];
                  }
                }
                unint64_t v31 = [NSNumber numberWithInteger:v25];
                [v41 setObject:v31 forKey:v26];

                int v24 = 1;
              }
              if (!v24)
              {
                double v11 = 0;
                long long v32 = obj;
                goto LABEL_35;
              }
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        long long v32 = [(VCPPhotosPersistenceDelegate *)self _representativenessByFaceCSNFromFaces:obj cancelOrExtendTimeoutBlock:v10];
        double v11 = [MEMORY[0x1E4F8CCE8] selectRepresentativeFromFaces:obj qualityMeasureByLocalIdentifier:v41 representativenessByCSN:v32 candidateFaces:v37];
LABEL_35:
      }
    }
  }

  return v11;
}

- (id)_representativenessByFaceCSNFromFaces:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = (uint64_t (**)(void))a4;
  long long v33 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (!v7) {
    goto LABEL_40;
  }
  uint64_t v8 = *(void *)v38;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v38 != v8) {
        objc_enumerationMutation(obj);
      }
      double v10 = *(NSObject **)(*((void *)&v37 + 1) + 8 * i);
      double v11 = (void *)MEMORY[0x1C186D320]();
      if (!v6 || (v6[2](v6) & 1) == 0)
      {
        if ([v10 detectionType] == 1)
        {
          int v13 = [v10 faceClusteringProperties];
          uint64_t v14 = [v13 faceprint];
          id v15 = [v14 faceprintData];

          if (v15)
          {
            uint64_t v16 = [v10 clusterSequenceNumber];
            if (v16 >= 1)
            {
              id v36 = 0;
              id v17 = +[VCPVNImageprintWrapper generateVNImageprintWithType:0 archiveData:v15 andError:&v36];
              int v18 = v36;
              if (v17)
              {
                uint64_t v19 = [v17 faceprint];
                BOOL v20 = v19 == 0;

                if (!v20)
                {
                  id v21 = objc_alloc_init(MEMORY[0x1E4F457F8]);
                  [v21 setFaceId:v16];
                  [v21 setFaceTorsoprint:v17];
                  __int16 v22 = [v17 faceprint];
                  [v21 setFaceprint:v22];

                  [v33 addObject:v21];
                  int v12 = 0;
LABEL_34:

                  goto LABEL_35;
                }
                if ((int)MediaAnalysisLogLevel() < 4) {
                  goto LABEL_32;
                }
                int v24 = VCPLogInstance();
                if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_31;
                }
                *(_WORD *)buf = 0;
                uint64_t v25 = v24;
                uint64_t v26 = "representativeness selection receives a torso-only print; ignoring";
                uint32_t v27 = 2;
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() < 4)
                {
LABEL_32:

LABEL_33:
                  int v12 = 3;
                  goto LABEL_34;
                }
                int v24 = VCPLogInstance();
                if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
LABEL_31:

                  goto LABEL_32;
                }
                *(_DWORD *)buf = 138412290;
                id v42 = v18;
                uint64_t v25 = v24;
                uint64_t v26 = "Failed to get VNFaceTorsoprint from faceprint data - %@";
                uint32_t v27 = 12;
              }
              _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
              goto LABEL_31;
            }
            int v12 = 0;
LABEL_35:

            goto LABEL_36;
          }
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            int v18 = VCPLogInstance();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v42 = v10;
              _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEFAULT, "Warning: Couldn't get faceprint data for face: %@; ignoring",
                buf,
                0xCu);
            }
            goto LABEL_33;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 4)
          {
            int v12 = 3;
            goto LABEL_36;
          }
          id v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = [v10 detectionType];
            *(_DWORD *)buf = 67109120;
            LODWORD(v42) = v23;
            _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "Warning: cannot handle representativeness with imageprint type %d; ignoring",
              buf,
              8u);
          }
        }
        int v12 = 3;
        goto LABEL_35;
      }
      int v12 = 1;
LABEL_36:
      if (v12 != 3 && v12)
      {
        id v28 = (id)MEMORY[0x1E4F1CC08];
        uint64_t v29 = obj;
        goto LABEL_53;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_40:

  if (![v33 count] || v6 && (v6[2](v6) & 1) != 0)
  {
    id v28 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    id v35 = 0;
    id v30 = [MEMORY[0x1E4F45718] representativenessForFaces:v33 error:&v35];
    uint64_t v29 = v35;
    if (v30)
    {
      id v28 = v30;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        unint64_t v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v29;
          _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "Warning: Could not get representativeness for faces, error: %@", buf, 0xCu);
        }
      }
      id v28 = (id)MEMORY[0x1E4F1CC08];
    }

LABEL_53:
  }

  return v28;
}

- (id)_faceToFaceCountMapForFaces:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  uint64_t v7 = [v5 newAssetFetchOptionsWithPhotoLibrary:WeakRetained];

  int v24 = (void *)v7;
  id v28 = [MEMORY[0x1E4F38EC0] fetchAssetsForFaces:v25 options:v7];
  unint64_t v30 = 0;
  uint64_t v26 = *MEMORY[0x1E4F39630];
  while (v30 < [v28 count])
  {
    context = (void *)MEMORY[0x1C186D320]();
    uint64_t v29 = [v28 objectAtIndexedSubscript:v30];
    uint64_t v8 = objc_opt_class();
    id v9 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    double v10 = (void *)[v8 newAllFacesFetchOptionsWithPhotoLibrary:v9];

    v36[0] = v26;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    [v10 setFetchPropertySets:v11];

    int v12 = [MEMORY[0x1E4F39048] fetchFacesInAsset:v29 options:v10];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          int v18 = [v17 localIdentifier];
          uint64_t v19 = [v4 valueForKey:v18];
          BOOL v20 = v19 == 0;

          if (v20)
          {
            id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
            __int16 v22 = [v17 localIdentifier];
            [v4 setValue:v21 forKey:v22];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }

    ++v30;
  }

  return v4;
}

+ (CGSize)faceTileSizeAdjustingForImageAspectRatio:(CGSize)result imgWidth:(double)a4 imgHeight:(double)a5
{
  if (a4 <= a5) {
    result.width = result.height * (a5 / a4);
  }
  else {
    result.height = result.width * (a4 / a5);
  }
  if (result.width > 1.0)
  {
    result.height = result.height * (1.0 / result.width);
    result.width = 1.0;
  }
  if (result.height > 1.0)
  {
    result.width = result.width * (1.0 / result.height);
    result.height = 1.0;
  }
  return result;
}

- (id)groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:(unint64_t)a3 error:(id *)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F39080];
  p_photoLibrary = &self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  uint64_t v7 = [WeakRetained librarySpecificFetchOptions];
  uint64_t v8 = [v4 fetchFaceGroupsWithOptions:v7];

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = objc_opt_class();
  id v10 = objc_loadWeakRetained((id *)p_photoLibrary);
  id v25 = (void *)[v9 newAllFacesFetchOptionsWithPhotoLibrary:v10];

  uint64_t v11 = *MEMORY[0x1E4F39638];
  v26[0] = *MEMORY[0x1E4F39630];
  v26[1] = v11;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v25 setFetchPropertySets:v12];

  for (unint64_t i = 0; i < [v8 count]; ++i)
  {
    uint64_t v14 = (void *)MEMORY[0x1C186D320]();
    uint64_t v15 = [v8 objectAtIndexedSubscript:i];
    uint64_t v16 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:v15 options:v25];
    if ([v16 count] >= a3)
    {
      id v17 = [MEMORY[0x1E4F28BD0] set];
      for (unint64_t j = 0; j < [v16 count]; ++j)
      {
        uint64_t v19 = (void *)MEMORY[0x1C186D320]();
        BOOL v20 = [v16 objectAtIndexedSubscript:j];
        id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "clusterSequenceNumber"));
        [v17 addObject:v21];
      }
      [v23 addObject:v17];
    }
  }

  return v23;
}

- (BOOL)needsPersonBuilding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  id v3 = [WeakRetained librarySpecificFetchOptions];

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(personBuilderState = %ld)", 1);
  [v3 setShouldPrefetchCount:1];
  [v3 setInternalPredicate:v4];
  [v3 setFetchLimit:1];
  id v5 = [MEMORY[0x1E4F39080] fetchFaceGroupsWithOptions:v3];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)_cleanupMergeCandidatesForVerifiedPersons:(id)a3 minimumFaceGroupSize:(unint64_t)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v54 = (unsigned int (**)(void))a5;
  uint64_t v8 = objc_opt_class();
  location = (id *)&self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  int v52 = (void *)[v8 newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:WeakRetained];

  uint64_t v61 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  double v48 = self;
  id v60 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v58 = 0;
  uint64_t v49 = *MEMORY[0x1E4F28760];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  while (v58 < [v55 count])
  {
    context = (void *)MEMORY[0x1C186D320]();
    if (v54 && v54[2]())
    {
      if (!a6)
      {
        char v13 = 0;
        goto LABEL_18;
      }
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v88 = v50;
      uint64_t v11 = [NSString stringWithFormat:@"Canceled cleaning up merge candidates of verified persons"];
      v89[0] = v11;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v49, -128);
      char v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = [v55 objectAtIndexedSubscript:v58];
      int v53 = [MEMORY[0x1E4F391F8] fetchMergeCandidatePersonsForPerson:v11 options:v52];
      if ([v53 count])
      {
        uint64_t v14 = [v11 localIdentifier];
        [v61 setObject:v11 forKey:v14];

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v12 = v53;
        uint64_t v15 = [v12 countByEnumeratingWithState:&v78 objects:v87 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v79;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v79 != v16) {
                objc_enumerationMutation(v12);
              }
              int v18 = *(void **)(*((void *)&v78 + 1) + 8 * i);
              uint64_t v19 = [v18 localIdentifier];
              [v61 setObject:v18 forKey:v19];

              BOOL v20 = [v11 localIdentifier];
              BOOL v86 = v20;
              id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
              __int16 v22 = [v18 localIdentifier];
              AddMergeCandidatePersonsForPerson(v60, v21, v22, &stru_1F15A0D70);
            }
            uint64_t v15 = [v12 countByEnumeratingWithState:&v78 objects:v87 count:16];
          }
          while (v15);
        }

        char v13 = 1;
      }
      else
      {
        char v13 = 1;
        id v12 = v53;
      }
    }

LABEL_18:
    ++v58;
    if ((v13 & 1) == 0)
    {
      char v36 = 0;
      goto LABEL_41;
    }
  }
  if (![v60 count])
  {
    char v36 = 1;
    goto LABEL_41;
  }
  id contexta = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v23 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke;
  aBlock[3] = &unk_1E6299670;
  void aBlock[4] = v48;
  id v24 = contexta;
  id v76 = v24;
  id v25 = v23;
  id v77 = v25;
  id v59 = _Block_copy(aBlock);
  uint64_t v26 = [MEMORY[0x1E4F1CA80] set];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_2;
  v67[3] = &unk_1E6299698;
  uint32_t v27 = v54;
  uint64_t v72 = v27;
  id v28 = v61;
  id v68 = v28;
  uint64_t v69 = v48;
  id v29 = v59;
  id v73 = v29;
  id v30 = v25;
  id v70 = v30;
  unint64_t v74 = a4;
  id v31 = v26;
  id v71 = v31;
  [v60 enumerateObjectsUsingBlock:v67];
  if (!v54 || !((unsigned int (*)(unsigned int (**)(void)))v54[2])(v27))
  {
    [v60 minusSet:v31];
    id v35 = v30;
    if (![v60 count])
    {
      char v36 = 1;
      goto LABEL_40;
    }
    long long v37 = (void *)MEMORY[0x1C186D320]();
    id v38 = objc_loadWeakRetained(location);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_3;
    v63[3] = &unk_1E62996E8;
    id v64 = v60;
    long long v66 = v27;
    id v65 = v28;
    id v62 = 0;
    char v36 = [v38 performCancellableChangesAndWait:v63 error:&v62];
    id v33 = v62;

    if (a6) {
      char v39 = v36;
    }
    else {
      char v39 = 1;
    }
    if (v39) {
      goto LABEL_39;
    }
    long long v40 = [v33 domain];
    if ([v40 isEqualToString:*MEMORY[0x1E4F397F8]])
    {
      BOOL v41 = [v33 code] == 3072;

      if (v41)
      {
        id v42 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v82 = v50;
        long long v43 = [NSString stringWithFormat:@"Canceled cleaning up merge candidates"];
        unint64_t v83 = v43;
        uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        *a6 = [v42 errorWithDomain:v49 code:-128 userInfo:v44];

LABEL_39:
        goto LABEL_40;
      }
    }
    else
    {
    }
    id v33 = v33;
    *a6 = v33;
    goto LABEL_39;
  }
  if (a6)
  {
    long long v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v84 = v50;
    id v33 = [NSString stringWithFormat:@"Canceled cleaning up merge candidates of verified persons"];
    id v85 = v33;
    long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    id v35 = v30;
    *a6 = [v32 errorWithDomain:v49 code:-128 userInfo:v34];

    char v36 = 0;
    goto LABEL_39;
  }
  id v35 = v30;
  char v36 = 0;
LABEL_40:

LABEL_41:
  return v36;
}

void __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v5 = a3;
  BOOL v6 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  BOOL v20 = (void *)[v6 newVisibleFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  v26[0] = *MEMORY[0x1E4F39630];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v20 setFetchPropertySets:v8];

  [v20 setShouldPrefetchCount:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v18;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        char v13 = [v12 localIdentifier];
        [v5 addObject:v13];
        [*(id *)(a1 + 40) setObject:v12 forKey:v13];
        uint64_t v14 = [*(id *)(a1 + 48) objectForKey:v13];
        if (v14)
        {
          uint64_t v15 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:v12 options:v20];
          uint64_t v16 = *(void **)(a1 + 48);
          id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
          [v16 setObject:v17 forKey:v13];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

void __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  context = (void *)MEMORY[0x1C186D320]();
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6 && (*(unsigned int (**)(void))(v6 + 16))())
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v5 person1LocalIdentifier];
    long long v24 = [v7 objectForKey:v8];

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v5 person2LocalIdentifier];
    long long v22 = [v9 objectForKey:v10];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v12 = [WeakRetained librarySpecificFetchOptions];

    long long v21 = [MEMORY[0x1E4F39080] fetchFaceGroupsForPerson:v24 options:v12];
    long long v23 = [MEMORY[0x1E4F39080] fetchFaceGroupsForPerson:v22 options:v12];
    char v13 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    [v13 intersectSet:v14];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = [*(id *)(a1 + 48) objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          if ((unint64_t)[v19 unsignedIntegerValue] >= *(void *)(a1 + 80))
          {
            [*(id *)(a1 + 56) addObject:v5];

            goto LABEL_14;
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

void __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_3(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_4;
  v9[3] = &unk_1E62996C0;
  id v11 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  [v4 enumerateObjectsUsingBlock:v9];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8 && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v5, v6, v7)) {
    *a2 = 1;
  }
}

void __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 && (*(unsigned int (**)(void))(v6 + 16))())
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v5 person1LocalIdentifier];
    uint64_t v9 = [v7 objectForKey:v8];

    id v10 = *(void **)(a1 + 32);
    id v11 = [v5 person2LocalIdentifier];
    id v12 = [v10 objectForKey:v11];

    if (v9 && v12)
    {
      char v13 = [MEMORY[0x1E4F39208] changeRequestForPerson:v9];
      v15[0] = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v13 removeMergeCandidatePersons:v14];
    }
  }
}

- (BOOL)cleanupMergeCandidatesWithMinimumFaceGroupSize:(unint64_t)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    id v10 = objc_opt_class();
    id v11 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    id v12 = (void *)[v10 newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:v11];

    char v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(verifiedType = %d) OR (verifiedType = %d)", 1, 2);
    [v12 setPredicate:v13];

    uint64_t v14 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v12];
    if ([v14 count]) {
      LOBYTE(a5) = [(VCPPhotosPersistenceDelegate *)self _cleanupMergeCandidatesForVerifiedPersons:v14 minimumFaceGroupSize:a3 cancelOrExtendTimeoutBlock:v8 error:a5];
    }
    else {
      LOBYTE(a5) = 1;
    }
  }
  else if (a5)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v16 = [NSString stringWithFormat:@"could not access the library"];
    v20[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a5 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (id)_updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:(id)a3 fetchLimit:(unint64_t)a4
{
  uint64_t v6 = (uint64_t (**)(void))a3;
  uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  uint64_t v9 = [WeakRetained librarySpecificFetchOptions];

  if (a4) {
    [v9 setFetchLimit:a4];
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(personBuilderState = %ld)", 1);
  [v9 setInternalPredicate:v10];

  id v11 = [MEMORY[0x1E4F39080] fetchFaceGroupsWithOptions:v9];
  unint64_t v12 = 0;
  do
  {
    if (v12 >= [v11 count]) {
      break;
    }
    char v13 = (void *)MEMORY[0x1C186D320]();
    if (v6 && (v6[2](v6) & 1) != 0)
    {
      char v14 = 0;
    }
    else
    {
      id v15 = [v11 objectAtIndexedSubscript:v12];
      uint64_t v16 = [v15 localIdentifier];
      uint64_t v17 = [v7 objectForKey:v16];

      if (!v17)
      {
        id v18 = [v15 localIdentifier];
        [v7 setObject:v15 forKey:v18];
      }
      char v14 = 1;
    }
    ++v12;
  }
  while ((v14 & 1) != 0);
  if (v6 && v6[2](v6))
  {
    id v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  }
  else
  {
    id v19 = v7;
  }
  BOOL v20 = v19;

  return v20;
}

- (void)_enumeratePersonsWithLocalIdentifiers:(id)a3 fetchOptions:(id)a4 personCache:(id)a5 usingBlock:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v29 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a6;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v17 = [v11 objectForKeyedSubscript:v16];
        id v18 = v17;
        if (v17)
        {
          uint64_t v19 = [v17 verifiedType];
          if ((v19 & 0x8000000000000000) == 0)
          {
            unint64_t v20 = v19 ? [v10 minimumVerifiedFaceCount] : objc_msgSend(v10, "minimumUnverifiedFaceCount");
            if ([v18 faceCount] >= v20)
            {
              long long v21 = [v10 predicate];
              long long v22 = v21;
              if (!v21 || [v21 evaluateWithObject:v18])
              {
                unsigned __int8 v31 = 0;
                v29[2](v29, v18, v16, &v31);
                if (v31)
                {

                  long long v23 = v12;
                  goto LABEL_25;
                }
              }
            }
          }
        }
        else
        {
          [v30 addObject:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if ([v30 count])
  {
    long long v23 = [MEMORY[0x1E4F391F8] fetchPersonsWithLocalIdentifiers:v30 options:v10];
    unint64_t v24 = 0;
    do
    {
      if (v24 >= [v23 count]) {
        break;
      }
      long long v25 = (void *)MEMORY[0x1C186D320]();
      long long v26 = [v23 objectAtIndexedSubscript:v24];
      long long v27 = [v26 localIdentifier];
      [v11 setObject:v26 forKeyedSubscript:v27];

      unsigned __int8 v31 = 0;
      long long v28 = [v26 localIdentifier];
      v29[2](v29, v26, (uint64_t)v28, &v31);

      LODWORD(v28) = v31;
      ++v24;
    }
    while (!v28);
LABEL_25:
  }
}

- (void)dedupeGraphVerifiedPersonsInFaceGroup:(id)a3 personCache:(id)a4
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v41 = a4;
  uint64_t v6 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  id v8 = (void *)[v6 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  long long v40 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(trainingType = %d) || (trainingType = %d)", 1, 5);
  [v8 setInternalPredicate:v40];
  uint64_t v9 = *MEMORY[0x1E4F39638];
  v61[0] = *MEMORY[0x1E4F39630];
  v61[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  [v8 setFetchPropertySets:v10];

  id v11 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:v42 options:v8];
  if ([v11 count])
  {
    char v39 = v11;
    id v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v11, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v53 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v18 = [v17 personLocalIdentifier];
          BOOL v19 = v18 == 0;

          if (!v19)
          {
            unint64_t v20 = [v17 personLocalIdentifier];
            [v12 addObject:v20];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v14);
    }

    if (![v12 count]) {
      goto LABEL_33;
    }
    long long v21 = [MEMORY[0x1E4F1CA48] array];
    id v38 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = objc_opt_class();
    id v23 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    unint64_t v24 = (void *)[v22 newAllPersonsFetchOptionsWithPhotoLibrary:v23];

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke;
    void v49[3] = &unk_1E6299710;
    id v25 = v21;
    id v50 = v25;
    id v26 = v38;
    id v51 = v26;
    [(VCPPhotosPersistenceDelegate *)self _enumeratePersonsWithLocalIdentifiers:v12 fetchOptions:v24 personCache:v41 usingBlock:v49];
    if ([v25 count])
    {
      if ([v26 count])
      {
        id v27 = objc_loadWeakRetained((id *)&self->_photoLibrary);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        void v47[2] = __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke_2;
        v47[3] = &unk_1E6296FF8;
        id v28 = v26;
        id v48 = v28;
        id v46 = 0;
        int v29 = [v27 performChangesAndWait:v47 error:&v46];
        id v37 = v46;

        id v30 = &v48;
        if (v29)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            unsigned __int8 v31 = VCPLogInstance();
            os_log_type_t v32 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v57 = v28;
              __int16 v58 = 2112;
              id v59 = v42;
              long long v33 = "PersonBuilder: Deleted duplicate graph-verified persons '%@' from face group %@";
LABEL_29:
              _os_log_impl(&dword_1BBEDA000, v31, v32, v33, buf, 0x16u);
              goto LABEL_30;
            }
            goto LABEL_30;
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          unsigned __int8 v31 = VCPLogInstance();
          os_log_type_t v32 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v57 = v28;
            __int16 v58 = 2112;
            id v59 = v42;
            long long v33 = "PersonBuilder: Failed to delete duplicate graph-verified persons '%@' from face group %@";
            goto LABEL_29;
          }
          goto LABEL_30;
        }
        goto LABEL_31;
      }
    }
    else if ((unint64_t)[v26 count] >= 2)
    {
      id v34 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke_574;
      v44[3] = &unk_1E6296FF8;
      id v35 = v26;
      id v45 = v35;
      id v43 = 0;
      int v36 = [v34 performChangesAndWait:v44 error:&v43];
      id v37 = v43;

      id v30 = &v45;
      if (v36)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          unsigned __int8 v31 = VCPLogInstance();
          os_log_type_t v32 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v57 = v35;
            __int16 v58 = 2112;
            id v59 = v42;
            long long v33 = "PersonBuilder: Deduped graph-verified persons '%@' from face group %@";
            goto LABEL_29;
          }
LABEL_30:
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        unsigned __int8 v31 = VCPLogInstance();
        os_log_type_t v32 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v57 = v35;
          __int16 v58 = 2112;
          id v59 = v42;
          long long v33 = "PersonBuilder: Failed to dedupe graph-verified persons '%@' from face group %@";
          goto LABEL_29;
        }
        goto LABEL_30;
      }
LABEL_31:
    }
LABEL_33:

    id v11 = v39;
  }
}

void __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 verifiedType];
  if (v3 == 2)
  {
    uint64_t v4 = (id *)(a1 + 40);
  }
  else
  {
    if (v3 != 1) {
      goto LABEL_6;
    }
    uint64_t v4 = (id *)(a1 + 32);
  }
  [*v4 addObject:v5];
LABEL_6:
}

uint64_t __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F39208] deletePersons:*(void *)(a1 + 32)];
}

id __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke_574(uint64_t a1)
{
  return (id)[MEMORY[0x1E4F39208] changeRequestForDedupingGraphPersons:*(void *)(a1 + 32)];
}

- (void)_getMergeCandidates:(id)a3 invalidMergeCandidates:(id)a4 forPersonsWithLocalIdentifiers:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v32 = a4;
  id v8 = a5;
  if ([v8 count])
  {
    uint64_t v9 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    int v36 = (void *)[v9 newAllPersonsFetchOptionsWithPhotoLibrary:WeakRetained];

    id v11 = (void *)MEMORY[0x1E4F391F8];
    id v12 = [v8 allObjects];
    id v35 = [v11 fetchPersonsWithLocalIdentifiers:v12 options:v36];

    for (unint64_t i = 0; i < objc_msgSend(v35, "count", v32); ++i)
    {
      context = (void *)MEMORY[0x1C186D320]();
      char v39 = [v35 objectAtIndexedSubscript:i];
      long long v40 = [v39 localIdentifier];
      id v38 = [MEMORY[0x1E4F391F8] fetchMergeCandidatePersonsForPerson:v39 options:v36];
      if ([v38 count])
      {
        id v13 = [v33 objectForKey:v40];
        if (!v13)
        {
          id v13 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
        }
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v14 = v38;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v47 != v16) {
                objc_enumerationMutation(v14);
              }
              id v18 = *(void **)(*((void *)&v46 + 1) + 8 * j);
              if ([v18 verifiedType] != 1 && objc_msgSend(v18, "verifiedType") != 2)
              {
                BOOL v19 = [v18 localIdentifier];
                int v20 = [v8 containsObject:v19];

                if (!v20) {
                  continue;
                }
              }
              long long v21 = [v18 localIdentifier];
              [v13 addObject:v21];
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v15);
        }

        if ([v13 count]) {
          [v33 setObject:v13 forKey:v40];
        }
      }
      id v37 = [MEMORY[0x1E4F391F8] fetchInvalidMergeCandidatePersonsForPerson:v39 options:v36];
      if ([v37 count])
      {
        long long v22 = [v32 objectForKey:v40];
        if (!v22)
        {
          long long v22 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v23 = v37;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v43;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v43 != v25) {
                objc_enumerationMutation(v23);
              }
              id v27 = *(void **)(*((void *)&v42 + 1) + 8 * k);
              id v28 = (void *)MEMORY[0x1C186D320]();
              if ([v27 verifiedType] == 1
                || [v27 verifiedType] == 2
                || ([v27 localIdentifier],
                    int v29 = objc_claimAutoreleasedReturnValue(),
                    int v30 = [v8 containsObject:v29],
                    v29,
                    v30))
              {
                unsigned __int8 v31 = [v27 localIdentifier];
                [v22 addObject:v31];
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v24);
        }

        if ([v22 count]) {
          [v32 setObject:v22 forKey:v40];
        }
      }
    }
  }
}

- (void)_getTrainingFacesByPerson:(id *)a3 confirmedFaceCSNs:(id *)a4 faceCSNsByPerson:(id *)a5 faceCSNsByMigratedPerson:(id *)a6 faceCSNsByQuickClassificationPerson:(id *)a7 mergeCandidates:(id *)a8 invalidMergeCandidates:(id *)a9 rejectedPersonsByPerson:(id *)a10 faceInFaceGroupByCSN:(id *)a11 inFaces:(id)a12 personCache:(id)a13 cancelOrExtendTimeoutBlock:(id)a14
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v60 = a12;
  id v14 = a13;
  id v59 = (uint64_t (**)(void))a14;
  id v45 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v55 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v54 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v46 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v56 = [MEMORY[0x1E4F1CA80] set];
  id v48 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v49 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v50 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v47 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  for (unint64_t i = 0; i < [v60 count]; ++i)
  {
    uint64_t v15 = (void *)MEMORY[0x1C186D320]();
    if (v59 && (v59[2]() & 1) != 0)
    {
      int v16 = 1;
      goto LABEL_46;
    }
    uint64_t v17 = [v60 objectAtIndexedSubscript:i];
    __int16 v58 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "clusterSequenceNumber"));
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v17);
    uint64_t v61 = [v17 personLocalIdentifier];
    if (!v61)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        long long v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v17 localIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v69 = v23;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "personLocalIdentifier for PHFace %@ is null; skip processing",
            buf,
            0xCu);
        }
      }
      int v16 = 4;
      goto LABEL_45;
    }
    uint64_t v18 = [v17 nameSource];
    unsigned int v19 = [v17 trainingType];
    BOOL v20 = v18 == 5;
    if ((v18 | 4) == 5) {
      int v21 = [v17 isConfirmedFaceCropGenerationPending];
    }
    else {
      int v21 = 0;
    }
    if ((v18 | 2) == 3) {
      BOOL v20 = 1;
    }
    if ((v19 & 0xFFFFFFFB) == 1) {
      int v24 = 1;
    }
    else {
      int v24 = v21;
    }
    if (v24 == 1)
    {
      uint64_t v25 = [v55 objectForKey:v61];
      if (!v25)
      {
        uint64_t v25 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
        [v55 setObject:v25 forKey:v61];
      }
      [v25 addObject:v17];
    }
    if (v20)
    {
      id v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "clusterSequenceNumber"));
      id v27 = [v54 objectForKey:v61];
      if (!v27)
      {
        id v27 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
        [v54 setObject:v27 forKey:v61];
      }
      [v27 addObject:v26];
    }
    else
    {
      if (v19 <= 5 && ((1 << v19) & 0x2A) != 0) {
        goto LABEL_44;
      }
      if (v18 == 6)
      {
        id v26 = [v47 objectForKey:v61];
        if (!v26)
        {
          id v26 = [MEMORY[0x1E4F1CA80] set];
          [v47 setObject:v26 forKey:v61];
        }
      }
      else if (v18 == 4)
      {
        id v26 = [v46 objectForKey:v61];
        if (!v26)
        {
          id v26 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
          [v46 setObject:v26 forKey:v61];
        }
      }
      else
      {
        id v26 = [v45 objectForKey:v61];
        if (!v26)
        {
          id v26 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
          [v45 setObject:v26 forKey:v61];
        }
      }
      id v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "clusterSequenceNumber"));
      [v26 addObject:v27];
    }

    if (v19 == 2)
    {
      id v28 = objc_opt_class();
      id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
      long long v53 = (void *)[v28 newVerifiedPersonsFetchOptionsWithPhotoLibrary:WeakRetained];

      uint64_t v52 = [MEMORY[0x1E4F391F8] fetchRejectedPersonsForFace:v17 options:v53];
      if ([v52 count])
      {
        int v30 = [v50 objectForKey:v61];
        if (!v30)
        {
          int v30 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v52, "count"));
          [v50 setObject:v30 forKey:v61];
        }
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v31 = v52;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v67 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v64 != v33) {
                objc_enumerationMutation(v31);
              }
              id v35 = *(void **)(*((void *)&v63 + 1) + 8 * j);
              int v36 = [v35 localIdentifier];
              [v14 setObject:v35 forKeyedSubscript:v36];

              id v37 = [v35 localIdentifier];
              [v30 addObject:v37];
            }
            uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v67 count:16];
          }
          while (v32);
        }

        goto LABEL_40;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v38 = [v17 localIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v69 = v38;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "Found no persons rejected for a rejection training face: %@", buf, 0xCu);
        }
LABEL_40:
      }
    }
LABEL_44:
    [v56 addObject:v61];
    int v16 = 0;
LABEL_45:

LABEL_46:
    if ((v16 | 4) != 4) {
      goto LABEL_63;
    }
  }
  [(VCPPhotosPersistenceDelegate *)self _getMergeCandidates:v48 invalidMergeCandidates:v49 forPersonsWithLocalIdentifiers:v56];
  *a3 = v55;
  *a4 = v54;
  *a5 = v45;
  *a6 = v46;
  *a7 = v47;
  *a8 = v48;
  *a9 = v49;
  *a10 = v50;
  *a11 = v57;
LABEL_63:
}

- (void)_getRejectedTrainingFaceCSNs:(id *)a3 rejectedFaceCSNs:(id *)a4 rejectedPersonLocalIdentifiers:(id *)a5 forPerson:(id)a6 faceInFaceGroupByCSN:(id)a7
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v35 = a6;
  id v33 = a7;
  if ([v33 count])
  {
    id v11 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    id v34 = (void *)[v11 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

    uint64_t v13 = *MEMORY[0x1E4F39638];
    v42[0] = *MEMORY[0x1E4F39630];
    v42[1] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    int v29 = a5;
    int v30 = a3;
    [v34 setFetchPropertySets:v14];

    id v31 = [MEMORY[0x1E4F39048] fetchRejectedFacesForPerson:v35 options:v34];
    if ([v31 count])
    {
      uint64_t v15 = [v33 allKeys];
      int v16 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
      uint64_t v17 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
      id v36 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = v31;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v38 != v20) {
              objc_enumerationMutation(v18);
            }
            long long v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "clusterSequenceNumber"));
            if ([v15 containsObject:v23])
            {
              if ([v22 trainingType] == 2) {
                int v24 = v16;
              }
              else {
                int v24 = v17;
              }
              [v24 addObject:v23];
            }
            else if ([v22 trainingType] == 2)
            {
              uint64_t v25 = [v22 personLocalIdentifier];
              if (v25) {
                [v36 addObject:v25];
              }
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v19);
      }

      id v26 = v16;
      id *v30 = v26;
      id v27 = v17;
      *a4 = v27;
      id v28 = v36;
      id *v29 = v28;
    }
    else
    {
      *a3 = [MEMORY[0x1E4F1CAD0] set];
      *a4 = [MEMORY[0x1E4F1CAD0] set];
      *a5 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    *a3 = [MEMORY[0x1E4F1CAD0] set];
    *a4 = [MEMORY[0x1E4F1CAD0] set];
  }
}

- (BOOL)_completePersonBuildingWithPersonsToUpdate:(id)a3 facesToRemoveByPerson:(id)a4 facesToAddByPerson:(id)a5 updateFaceGroup:(id)a6 newMergeCandidatePairs:(id)a7 newInvalidMergeCandidatePairs:(id)a8 faceInFaceGroupByCSN:(id)a9 personCache:(id)a10 keyFaceUpdateBlock:(id)a11 cancelOrExtendTimeoutBlock:(id)a12 context:(id)a13 error:(id *)a14
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v67 = a4;
  id v66 = a5;
  id v68 = a6;
  id v81 = a7;
  id v69 = a8;
  uint64_t v20 = self;
  id v70 = a9;
  id v83 = a10;
  long long v79 = (void (**)(id, id))a11;
  id v71 = a12;
  id v72 = a13;
  int v21 = objc_opt_class();
  p_photoLibrary = &self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  uint64_t v82 = (void *)[v21 newAllPersonsFetchOptionsWithPhotoLibrary:WeakRetained];

  int v24 = [MEMORY[0x1E4F1CA80] set];
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke;
  v110[3] = &unk_1E6299738;
  id v25 = v24;
  id v111 = v25;
  long long v78 = v25;
  [(VCPPhotosPersistenceDelegate *)self _enumeratePersonsWithLocalIdentifiers:v80 fetchOptions:v82 personCache:v83 usingBlock:v110];
  uint64_t v26 = [v25 count];
  if (v26)
  {
    id v73 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v26];
  }
  else
  {
    id v73 = 0;
  }
  if ([v81 count])
  {
    unint64_t v74 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v76 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v27 = [MEMORY[0x1E4F1CA80] set];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v28 = v81;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v106 objects:v116 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v107 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          id v33 = [v32 person1LocalIdentifier];
          [v27 addObject:v33];

          id v34 = [v32 person2LocalIdentifier];
          [v27 addObject:v34];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v106 objects:v116 count:16];
      }
      while (v29);
    }

    if ([v78 count]) {
      [v27 minusSet:v78];
    }
    id v35 = (void *)[v27 copy];
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_2;
    v104[3] = &unk_1E6299738;
    id v36 = v27;
    id v105 = v36;
    [(VCPPhotosPersistenceDelegate *)v20 _enumeratePersonsWithLocalIdentifiers:v35 fetchOptions:v82 personCache:v83 usingBlock:v104];

    if ([v36 count] && (int)MediaAnalysisLogLevel() >= 7)
    {
      long long v37 = VCPLogInstance();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v115 = v36;
        _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_DEBUG, "PersonBuilder: Did not find merge candidate persons with local identifiers: '%@'", buf, 0xCu);
      }
    }
    long long v38 = (void *)MEMORY[0x1E4F28F60];
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_576;
    v99[3] = &unk_1E6299760;
    id v100 = v83;
    id v39 = v74;
    id v101 = v39;
    id v102 = v82;
    id v40 = v76;
    id v103 = v40;
    id v41 = [v38 predicateWithBlock:v99];
    [v28 filterUsingPredicate:v41];
  }
  long long v42 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_578;
  aBlock[3] = &unk_1E62997A8;
  id v75 = v68;
  id v86 = v75;
  id v43 = v78;
  id v87 = v43;
  id v64 = v83;
  id v88 = v64;
  id v65 = v71;
  id v98 = v65;
  id v44 = v73;
  id v89 = v44;
  id v60 = v67;
  id v90 = v60;
  id v61 = v66;
  id v91 = v61;
  id v63 = v70;
  id v92 = v63;
  unint64_t v93 = v20;
  id v45 = v72;
  id v94 = v45;
  id v62 = v81;
  id v95 = v62;
  id v77 = v42;
  id v96 = v77;
  id v46 = v69;
  id v97 = v46;
  id v47 = _Block_copy(aBlock);
  id v48 = (void *)MEMORY[0x1C186D320]();
  id v49 = objc_loadWeakRetained((id *)p_photoLibrary);
  id v84 = 0;
  char v50 = [v49 performCancellableChangesAndWait:v47 error:&v84];
  id v51 = v84;

  if (v50)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v52 = VCPLogInstance();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        long long v53 = [v75 localIdentifier];
        *(_DWORD *)buf = 138412290;
        id v115 = v53;
        _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_DEBUG, "PersonBuilder: Cleared personBuilderState of faceGroup: '%@'", buf, 0xCu);
      }
    }
    if (v79) {
      v79[2](v79, v77);
    }
  }
  else if (a14)
  {
    id v54 = [v51 domain];
    if ([v54 isEqualToString:*MEMORY[0x1E4F397F8]])
    {
      BOOL v55 = [v51 code] == 3072;

      if (v55)
      {
        id v59 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v112 = *MEMORY[0x1E4F28568];
        id v56 = [NSString stringWithFormat:@"Person building cancelled"];
        double v113 = v56;
        id v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
        *a14 = [v59 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v57];

        goto LABEL_33;
      }
    }
    else
    {
    }
    *a14 = v51;
  }
LABEL_33:

  return v50;
}

uint64_t __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:");
}

uint64_t __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_576(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 person1LocalIdentifier];
  id v5 = [v3 person2LocalIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v4];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v5];
  id v8 = (void *)v7;
  uint64_t v9 = 0;
  if (v6 && v7)
  {
    if (([v6 verifiedType] & 0x8000000000000000) == 0
      && ([v8 verifiedType] & 0x8000000000000000) == 0)
    {
      id v10 = [*(id *)(a1 + 40) objectForKey:v4];
      if (!v10)
      {
        id v11 = [MEMORY[0x1E4F391F8] fetchInvalidMergeCandidatePersonsForPerson:v6 options:*(void *)(a1 + 48)];
        uint64_t v12 = [v11 fetchedObjects];

        [*(id *)(a1 + 40) setObject:v12 forKey:v4];
        id v10 = (void *)v12;
      }
      uint64_t v13 = [*(id *)(a1 + 56) objectForKey:v4];
      if (!v13)
      {
        id v14 = [MEMORY[0x1E4F391F8] fetchMergeCandidatePersonsForPerson:v6 options:*(void *)(a1 + 48)];
        uint64_t v13 = [v14 fetchedObjects];

        [*(id *)(a1 + 56) setObject:v13 forKey:v4];
      }
      if ([v10 containsObject:v8])
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 138412546;
            uint64_t v19 = v4;
            __int16 v20 = 2112;
            int v21 = v5;
            int v16 = "PersonBuilder: Found invalid merge candidate pair ['%@' : '%@']";
LABEL_18:
            _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v18, 0x16u);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else
      {
        if (![v13 containsObject:v8])
        {
          uint64_t v9 = 1;
          goto LABEL_22;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 138412546;
            uint64_t v19 = v4;
            __int16 v20 = 2112;
            int v21 = v5;
            int v16 = "PersonBuilder: Already found merge candidate pair ['%@' : '%@']";
            goto LABEL_18;
          }
LABEL_19:
        }
      }
      uint64_t v9 = 0;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v9 = 0;
  }
LABEL_23:

  return v9;
}

void __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_578(uint64_t a1, unsigned char *a2)
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [*(id *)(a1 + 32) localIdentifier];
      *(_DWORD *)buf = 138412290;
      double v145 = v4;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "PersonBuilder: persist results for facegroup %@", buf, 0xCu);
    }
  }
  id v98 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v137 objects:v156 count:16];
  if (v5)
  {
    uint64_t v101 = *(void *)v138;
    uint64_t v99 = *MEMORY[0x1E4F39630];
    do
    {
      uint64_t v6 = 0;
      uint64_t v103 = v5;
      do
      {
        if (*(void *)v138 != v101) {
          objc_enumerationMutation(obj);
        }
        uint64_t v105 = v6;
        uint64_t v7 = *(void *)(*((void *)&v137 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1C186D320]();
        long long v106 = [*(id *)(a1 + 48) objectForKey:v7];
        if (v106)
        {
          uint64_t v8 = *(void *)(a1 + 128);
          if (v8 && (*(unsigned int (**)(void))(v8 + 16))())
          {
            int v9 = 1;
            *a2 = 1;
          }
          else
          {
            [*(id *)(a1 + 56) becomeCurrentWithPendingUnitCount:1];
            id v110 = [*(id *)(a1 + 64) objectForKey:v7];
            id v10 = [*(id *)(a1 + 72) objectForKey:v7];
            if (v10) {
              [v110 minusSet:v10];
            }
            type = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v110, "count"));
            id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
            long long v135 = 0u;
            long long v136 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            uint64_t v12 = (void *)[v10 copy];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v133 objects:v155 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v134;
LABEL_18:
              uint64_t v15 = 0;
              while (1)
              {
                if (*(void *)v134 != v14) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v16 = *(void *)(*((void *)&v133 + 1) + 8 * v15);
                uint64_t v17 = *(void *)(a1 + 128);
                if (v17)
                {
                  if ((*(uint64_t (**)(void))(v17 + 16))()) {
                    break;
                  }
                }
                int v18 = [*(id *)(a1 + 80) objectForKey:v16];
                if (v18)
                {
                  [v11 addObject:v18];
                  [v10 removeObject:v16];
                }

                if (v13 == ++v15)
                {
                  uint64_t v13 = [v12 countByEnumeratingWithState:&v133 objects:v155 count:16];
                  if (v13) {
                    goto LABEL_18;
                  }
                  break;
                }
              }
            }

            uint64_t v19 = *(void *)(a1 + 128);
            if (v19 && (*(unsigned int (**)(void))(v19 + 16))()) {
              goto LABEL_42;
            }
            long long v131 = 0u;
            long long v132 = 0u;
            long long v129 = 0u;
            long long v130 = 0u;
            __int16 v20 = (void *)[v110 copy];
            uint64_t v21 = [v20 countByEnumeratingWithState:&v129 objects:v154 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v130;
LABEL_31:
              uint64_t v23 = 0;
              while (1)
              {
                if (*(void *)v130 != v22) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v24 = *(void *)(*((void *)&v129 + 1) + 8 * v23);
                uint64_t v25 = *(void *)(a1 + 128);
                if (v25)
                {
                  if ((*(uint64_t (**)(void))(v25 + 16))()) {
                    break;
                  }
                }
                uint64_t v26 = [*(id *)(a1 + 80) objectForKey:v24];
                if (v26)
                {
                  [type addObject:v26];
                  [v110 removeObject:v24];
                }

                if (v21 == ++v23)
                {
                  uint64_t v21 = [v20 countByEnumeratingWithState:&v129 objects:v154 count:16];
                  if (v21) {
                    goto LABEL_31;
                  }
                  break;
                }
              }
            }

            uint64_t v27 = *(void *)(a1 + 128);
            if (v27 && (*(unsigned int (**)(void))(v27 + 16))())
            {
LABEL_42:
              int v9 = 1;
              *a2 = 1;
            }
            else
            {
              if ([v110 count])
              {
                id v28 = objc_opt_class();
                id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 88) + 8));
                uint64_t v30 = (void *)[v28 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

                id v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(clusterSequenceNumber IN %@)", v110];
                [v30 setPredicate:v31];

                uint64_t v153 = v99;
                uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v153 count:1];
                [v30 setFetchPropertySets:v32];

                id v33 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v30];
                id v34 = [v33 fetchedObjects];
                [type addObjectsFromArray:v34];
              }
              long long v127 = 0u;
              long long v128 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              id v35 = type;
              uint64_t v36 = [v35 countByEnumeratingWithState:&v125 objects:v152 count:16];
              if (v36)
              {
                uint64_t v37 = *(void *)v126;
                while (2)
                {
                  for (uint64_t i = 0; i != v36; ++i)
                  {
                    if (*(void *)v126 != v37) {
                      objc_enumerationMutation(v35);
                    }
                    uint64_t v39 = *(void *)(*((void *)&v125 + 1) + 8 * i);
                    id v40 = (void *)MEMORY[0x1C186D320]();
                    uint64_t v41 = *(void *)(a1 + 128);
                    if (v41 && (*(unsigned int (**)(void))(v41 + 16))())
                    {
                      int v42 = 0;
                      *a2 = 1;
                    }
                    else
                    {
                      id v43 = [MEMORY[0x1E4F39058] changeRequestForFace:v39];
                      [v43 setNameSource:0];

                      int v42 = 1;
                    }
                    if (!v42)
                    {

LABEL_81:
                      int v9 = 1;
                      goto LABEL_82;
                    }
                  }
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v125 objects:v152 count:16];
                  if (v36) {
                    continue;
                  }
                  break;
                }
              }

              if ([v10 count])
              {
                id v44 = objc_opt_class();
                id v45 = objc_loadWeakRetained((id *)(*(void *)(a1 + 88) + 8));
                id v46 = (void *)[v44 newAllFacesFetchOptionsWithPhotoLibrary:v45];

                id v47 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(clusterSequenceNumber IN %@)", v10];
                [v46 setPredicate:v47];

                uint64_t v151 = v99;
                id v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v151 count:1];
                [v46 setFetchPropertySets:v48];

                id v49 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v46];
                char v50 = [v49 fetchedObjects];
                [v11 addObjectsFromArray:v50];
              }
              long long v123 = 0u;
              long long v124 = 0u;
              long long v121 = 0u;
              long long v122 = 0u;
              id v102 = v11;
              uint64_t v51 = [v102 countByEnumeratingWithState:&v121 objects:v150 count:16];
              if (v51)
              {
                uint64_t v52 = *(void *)v122;
                while (2)
                {
                  for (uint64_t j = 0; j != v51; ++j)
                  {
                    if (*(void *)v122 != v52) {
                      objc_enumerationMutation(v102);
                    }
                    uint64_t v54 = *(void *)(*((void *)&v121 + 1) + 8 * j);
                    BOOL v55 = (void *)MEMORY[0x1C186D320]();
                    uint64_t v56 = *(void *)(a1 + 128);
                    if (v56 && (*(unsigned int (**)(void))(v56 + 16))())
                    {
                      int v57 = 0;
                      *a2 = 1;
                    }
                    else
                    {
                      __int16 v58 = [MEMORY[0x1E4F39058] changeRequestForFace:v54];
                      [v58 setNameSource:2];

                      int v57 = 1;
                    }
                    if (!v57)
                    {

                      goto LABEL_81;
                    }
                  }
                  uint64_t v51 = [v102 countByEnumeratingWithState:&v121 objects:v150 count:16];
                  if (v51) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v59 = [v35 count];
              uint64_t v60 = [v102 count];
              if (v59 | v60)
              {
                id v61 = [MEMORY[0x1E4F39208] changeRequestForPerson:v106];
                [v98 setObject:v61 forKey:v7];
                if (v59) {
                  [v61 removeFaces:v35];
                }
                if (v60) {
                  [v61 addFaces:v102];
                }
              }
              int v9 = 0;
            }
LABEL_82:

            [*(id *)(a1 + 56) resignCurrent];
          }
        }
        else
        {
          int v9 = 5;
        }

        if (v9 != 5 && v9)
        {

          goto LABEL_94;
        }
        uint64_t v6 = v105 + 1;
      }
      while (v105 + 1 != v103);
      uint64_t v5 = [obj countByEnumeratingWithState:&v137 objects:v156 count:16];
    }
    while (v5);
  }

  if (*(unsigned char *)(*(void *)(a1 + 88) + 16)
    || ([*(id *)(a1 + 96) personBuilderMergeCandidatesDisabled] & 1) != 0)
  {
    goto LABEL_89;
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v111 = *(id *)(a1 + 104);
  uint64_t v64 = [v111 countByEnumeratingWithState:&v117 objects:v149 count:16];
  if (v64)
  {
    uint64_t v65 = *(void *)v118;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v118 != v65) {
          objc_enumerationMutation(v111);
        }
        id v67 = *(void **)(*((void *)&v117 + 1) + 8 * k);
        uint64_t v68 = *(void *)(a1 + 128);
        if (v68 && (*(unsigned int (**)(void))(v68 + 16))())
        {
          *a2 = 1;

          goto LABEL_94;
        }
        id v69 = [v67 person1LocalIdentifier];
        id v70 = [v67 person2LocalIdentifier];
        id v71 = [v98 objectForKey:v69];
        if (v71)
        {
          id v72 = [*(id *)(a1 + 48) objectForKey:v70];
        }
        else
        {
          uint64_t v73 = [v98 objectForKey:v70];
          [*(id *)(a1 + 48) objectForKey:v69];
          if (v73) {
            id v72 = {;
          }
            id v71 = (void *)v73;
          }
          else {
            unint64_t v74 = {;
          }
            id v71 = [MEMORY[0x1E4F39208] changeRequestForPerson:v74];
            id v72 = [*(id *)(a1 + 48) objectForKey:v70];
          }
        }
        if (v71) {
          BOOL v75 = v72 == 0;
        }
        else {
          BOOL v75 = 1;
        }
        if (v75)
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_116;
          }
          long long v78 = VCPLogInstance();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            double v145 = v69;
            __int16 v146 = 2112;
            v147 = v70;
            _os_log_impl(&dword_1BBEDA000, v78, OS_LOG_TYPE_ERROR, "PersonBuilder: Could not create merge candidate pair '%@' : '%@'", buf, 0x16u);
          }
        }
        else
        {
          float v148 = v72;
          id v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v148 count:1];
          [v71 addMergeCandidatePersons:v76];

          id v77 = *(void **)(a1 + 112);
          long long v78 = [v72 localIdentifier];
          [v77 addObject:v78];
        }

LABEL_116:
      }
      uint64_t v64 = [v111 countByEnumeratingWithState:&v117 objects:v149 count:16];
    }
    while (v64);
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id typea = *(id *)(a1 + 120);
  uint64_t v79 = [typea countByEnumeratingWithState:&v113 objects:v143 count:16];
  if (!v79) {
    goto LABEL_141;
  }
  id v112 = *(id *)v114;
  do
  {
    uint64_t v80 = 0;
    do
    {
      if (*(id *)v114 != v112) {
        objc_enumerationMutation(typea);
      }
      id v81 = *(void **)(*((void *)&v113 + 1) + 8 * v80);
      uint64_t v82 = *(void *)(a1 + 128);
      if (v82 && (*(unsigned int (**)(void))(v82 + 16))())
      {
        *a2 = 1;

        goto LABEL_94;
      }
      id v83 = [v81 person1LocalIdentifier];
      id v84 = [v81 person2LocalIdentifier];
      id v85 = [v98 objectForKey:v83];
      id v86 = objc_opt_class();
      id v87 = objc_loadWeakRetained((id *)(*(void *)(a1 + 88) + 8));
      id v88 = (void *)[v86 newAllPersonsFetchOptionsWithPhotoLibrary:v87];

      id v89 = *(void **)(a1 + 88);
      v142[0] = v83;
      v142[1] = v84;
      id v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:2];
      [v89 _enumeratePersonsWithLocalIdentifiers:v90 fetchOptions:v88 personCache:*(void *)(a1 + 48) usingBlock:&__block_literal_global_584];

      if (v85)
      {
        uint64_t v91 = [*(id *)(a1 + 48) objectForKey:v84];
      }
      else
      {
        uint64_t v92 = [v98 objectForKey:v84];
        unint64_t v93 = *(void **)(a1 + 48);
        if (!v92)
        {
          id v96 = [v93 objectForKey:v83];
          id v85 = [MEMORY[0x1E4F39208] changeRequestForPerson:v96];
          id v94 = [*(id *)(a1 + 48) objectForKey:v84];

          goto LABEL_130;
        }
        uint64_t v91 = [v93 objectForKey:v83];
        id v85 = (void *)v92;
      }
      id v94 = (void *)v91;
LABEL_130:
      if (v85 && v94)
      {
        double v141 = v94;
        id v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
        [v85 addInvalidMergeCandidatePersons:v95];
LABEL_133:

        goto LABEL_137;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v95 = VCPLogInstance();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          double v145 = v83;
          __int16 v146 = 2112;
          v147 = v84;
          _os_log_impl(&dword_1BBEDA000, v95, OS_LOG_TYPE_ERROR, "PersonBuilder: Could not create invalid merge candidate pair '%@' : '%@'", buf, 0x16u);
        }
        goto LABEL_133;
      }
LABEL_137:

      ++v80;
    }
    while (v79 != v80);
    uint64_t v97 = [typea countByEnumeratingWithState:&v113 objects:v143 count:16];
    uint64_t v79 = v97;
  }
  while (v97);
LABEL_141:

LABEL_89:
  uint64_t v62 = *(void *)(a1 + 128);
  if (v62 && (*(unsigned int (**)(void))(v62 + 16))())
  {
    *a2 = 1;
  }
  else
  {
    id v63 = [MEMORY[0x1E4F39088] changeRequestForFaceGroup:*(void *)(a1 + 32)];
    [v63 setPersonBuilderState:0];
  }
LABEL_94:
}

- (unint64_t)_level0ClusterIdForFaceCSN:(unint64_t)a3 level0Clusters:(id)a4
{
  id v5 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __74__VCPPhotosPersistenceDelegate__level0ClusterIdForFaceCSN_level0Clusters___block_invoke;
  v10[3] = &unk_1E62997D0;
  id v11 = v6;
  uint64_t v12 = &v13;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  unint64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __74__VCPPhotosPersistenceDelegate__level0ClusterIdForFaceCSN_level0Clusters___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([v7 containsObject:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 unsignedIntegerValue];
    *a4 = 1;
  }
}

- (id)otherFacesOnAssetWithFace:(id)a3 options:(id)a4
{
  uint64_t v4 = [MEMORY[0x1E4F39048] fetchFacesOnAssetWithFace:a3 options:a4];
  id v5 = [v4 fetchedObjects];

  return v5;
}

- (id)_duplicateFaceCSNsOnAssetForPerson:(id)a3 faceCSNsOnPerson:(id)a4 faceByCSNCache:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v8 = a4;
  id v35 = a5;
  id v33 = v8;
  int v9 = [MEMORY[0x1E4F1CA80] set];
  if ([v8 count])
  {
    id v10 = (void *)MEMORY[0x1E4F1CA48];
    id v11 = [v33 allObjects];
    uint64_t v12 = [v10 arrayWithArray:v11];

    uint64_t v13 = MEMORY[0x1C186D320]();
    uint64_t v14 = objc_opt_class();
    context = (void *)v13;
    id v34 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    uint64_t v36 = (void *)[v14 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

    while (1)
    {
      if (![v12 count])
      {

        goto LABEL_24;
      }
      long long v38 = [v12 objectAtIndexedSubscript:0];
      [v12 removeObjectAtIndex:0];
      uint64_t v16 = [v35 objectForKey:v38];
      if (v16) {
        goto LABEL_5;
      }
      uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"clusterSequenceNumber = %ld", objc_msgSend(v38, "longValue"));
      [v36 setPredicate:v27];

      uint64_t v26 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v36];
      if ([v26 count])
      {
        uint64_t v28 = [v26 objectAtIndexedSubscript:0];
        if (v28) {
          break;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v38;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "Could not find a face with clusterSequenceNumber '%@' in the library", buf, 0xCu);
        }
        goto LABEL_15;
      }
LABEL_16:
    }
    uint64_t v29 = v28;
    [v35 setObject:v28 forKey:v38];

    uint64_t v16 = v29;
LABEL_5:
    uint64_t v37 = (void *)v16;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"clusterSequenceNumber != %ld", objc_msgSend(v38, "longValue"), context);
    [v36 setPredicate:v17];

    int v18 = [(VCPPhotosPersistenceDelegate *)v34 otherFacesOnAssetWithFace:v37 options:v36];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v24 = (void *)MEMORY[0x1C186D320]();
          uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "clusterSequenceNumber"));
          if ([v12 containsObject:v25])
          {
            [v9 addObject:v25];
            [v9 addObject:v38];
            [v12 removeObject:v25];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v20);
    }

    uint64_t v26 = v37;
LABEL_15:

    goto LABEL_16;
  }
LABEL_24:

  return v9;
}

- (void)_updateFaceCSNsToAddByPerson:(id)a3 faceCSNsToRemoveByPerson:(id)a4 faceInFaceGroupByCSN:(id)a5 faceCSNsByPersonLocalIdentifier:(id)a6 faceCSNsByMigratedPersonLocalIdentifier:(id)a7 personsToUpdate:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v33 = a4;
  id v29 = a5;
  id v31 = a6;
  id v30 = a7;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = a8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v16 = [v32 objectForKey:v15];
        uint64_t v17 = [v33 objectForKey:v15];
        int v18 = [v31 objectForKey:v15];
        uint64_t v19 = [v30 objectForKey:v15];
        if (!v17)
        {
          uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
          [v33 setObject:v17 forKey:v15];
        }
        uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
        [v20 unionSet:v16];
        [v20 unionSet:v18];
        [v20 unionSet:v19];
        uint64_t v21 = [(VCPPhotosPersistenceDelegate *)self _duplicateFaceCSNsOnAssetForPerson:v15 faceCSNsOnPerson:v20 faceByCSNCache:v29];
        uint64_t v22 = (void *)[v21 mutableCopy];
        [v22 intersectSet:v16];
        if ([v22 count])
        {
          [v16 minusSet:v22];
          [v21 minusSet:v22];
        }
        uint64_t v23 = (void *)[v21 mutableCopy];

        uint64_t v24 = v23;
        [v23 intersectSet:v18];
        if ([v23 count])
        {
          [v17 unionSet:v23];
          [v21 minusSet:v23];
        }
        uint64_t v25 = (void *)[v21 mutableCopy];

        [v25 intersectSet:v19];
        if ([v25 count]) {
          [v17 unionSet:v25];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v13);
  }
}

- (void)_adjustConfirmingAndRejectionWithFaces:(id)a3 faceCrops:(id)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v64 = (uint64_t (**)(void))a5;
  long long v53 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v54 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v55 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v56 = [MEMORY[0x1E4F1CA60] dictionary];
  int v9 = [MEMORY[0x1E4F1CA60] dictionary];
  for (unint64_t i = 0; i < [v7 count]; ++i)
  {
    id v11 = (void *)MEMORY[0x1C186D320]();
    uint64_t v12 = [v7 objectAtIndexedSubscript:i];
    uint64_t v13 = [v12 localIdentifier];
    uint64_t v14 = [v8 objectForKeyedSubscript:v13];

    if (v14)
    {
      uint64_t v15 = [v12 localIdentifier];
      [v9 setObject:v12 forKeyedSubscript:v15];
    }
  }
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke;
  v74[3] = &unk_1E6299820;
  id v52 = v9;
  id v75 = v52;
  id v76 = self;
  id v59 = v53;
  id v77 = v59;
  id v16 = v54;
  id v78 = v16;
  id v58 = v55;
  id v79 = v58;
  id v57 = v56;
  id v80 = v57;
  [v8 enumerateKeysAndObjectsUsingBlock:v74];
  if ([v16 count] || objc_msgSend(v58, "count") || objc_msgSend(v57, "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v16 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v82 = v18;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "[FaceCropAdjustment] Correcting %lu training face -> person", buf, 0xCu);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_600;
    aBlock[3] = &unk_1E6299898;
    void aBlock[4] = self;
    id v71 = v16;
    id v72 = v58;
    id v73 = v57;
    uint64_t v19 = _Block_copy(aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    id v69 = 0;
    char v21 = [WeakRetained performChangesAndWait:v19 error:&v69];
    id v22 = v69;

    if ((v21 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v82 = (uint64_t)v22;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[FaceCropAdjustment] Failed to update person - %@", buf, 0xCu);
      }
    }
  }
  if ([v59 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = [v59 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v82 = v25;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Checking %lu rejected person(s)", buf, 0xCu);
      }
    }
    id v63 = [v59 allKeys];
    uint64_t v62 = [MEMORY[0x1E4F1CA60] dictionary];
    id v61 = [MEMORY[0x1E4F38EC0] fetchAssetsGroupedByFaceUUIDForFaces:v7];
    unint64_t v26 = 0;
    *(void *)&long long v27 = 138412546;
    long long v51 = v27;
    do
    {
      if (v26 >= objc_msgSend(v7, "count", v51)) {
        break;
      }
      uint64_t v28 = (void *)MEMORY[0x1C186D320]();
      if (v64 && (v64[2]() & 1) != 0)
      {
        char v29 = 0;
      }
      else
      {
        id v30 = [v7 objectAtIndexedSubscript:v26];
        id v31 = [v30 personLocalIdentifier];
        int v32 = [v63 containsObject:v31];

        if (v32)
        {
          id v33 = [v30 localIdentifier];
          long long v34 = [v61 objectForKeyedSubscript:v33];
          BOOL v35 = v34 == 0;

          if (!v35)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              long long v36 = VCPLogInstance();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                long long v37 = [v30 localIdentifier];
                long long v38 = [v30 personLocalIdentifier];
                *(_DWORD *)buf = v51;
                uint64_t v82 = (uint64_t)v37;
                __int16 v83 = 2112;
                id v84 = v38;
                _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEBUG, "[RejectedFaceCrop] To remove face %@ for person %@", buf, 0x16u);
              }
            }
            uint64_t v39 = [v30 personLocalIdentifier];
            long long v40 = [v62 objectForKeyedSubscript:v39];
            BOOL v41 = v40 == 0;

            if (v41)
            {
              long long v42 = [MEMORY[0x1E4F1CA48] array];
              id v43 = [v30 personLocalIdentifier];
              [v62 setObject:v42 forKeyedSubscript:v43];
            }
            id v44 = [v30 personLocalIdentifier];
            id v45 = [v62 objectForKeyedSubscript:v44];
            [v45 addObject:v30];
          }
        }

        char v29 = 1;
      }
      ++v26;
    }
    while ((v29 & 1) != 0);
    if ([v62 count])
    {
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_603;
      v66[3] = &unk_1E62982E8;
      id v67 = v62;
      id v68 = v59;
      uint64_t v46 = _Block_copy(v66);
      id v47 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      id v65 = 0;
      char v48 = [v47 performChangesAndWait:v46 error:&v65];
      id v49 = v65;

      if ((v48 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        char v50 = VCPLogInstance();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v82 = (uint64_t)v49;
          _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "[FaceCropAdjustment] Failed to update person - %@", buf, 0xCu);
        }
      }
    }
  }
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSString;
  id v8 = [v6 localIdentifier];
  int v9 = [v7 stringWithFormat:@"[FaceCropAdjustment][%@-%d]", v8, (int)objc_msgSend(v6, "type")];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "%@ Checking face %@", buf, 0x16u);
    }
  }
  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v11)
  {
    if ([v6 type] == 2 || objc_msgSend(v6, "type") == 4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      uint64_t v13 = +[VCPPhotosPersistenceDelegate newVerifiedPersonsFetchOptionsWithPhotoLibrary:WeakRetained];

      uint64_t v14 = [MEMORY[0x1E4F391F8] fetchRejectedPersonsForFace:v11 options:v13];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      void v28[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_598;
      v28[3] = &unk_1E62997F8;
      id v29 = *(id *)(a1 + 48);
      [v14 enumerateObjectsUsingBlock:v28];

LABEL_37:
      goto LABEL_38;
    }
    if ([v6 type] == 1
      || [v6 type] == 3
      || [v6 type] == 5)
    {
      id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      uint64_t v13 = +[VCPPhotosPersistenceDelegate newAllPersonsFetchOptionsWithPhotoLibrary:v15];

      long long v27 = [MEMORY[0x1E4F391F8] fetchPersonForFaceCrop:v6 options:v13];
      if ([v27 count])
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v9;
            __int16 v32 = 2112;
            id v33 = v27;
            _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "%@ Found person(s) %@", buf, 0x16u);
          }
        }
        uint64_t v17 = [v27 firstObject];
        uint64_t v18 = [v11 personLocalIdentifier];
        uint64_t v19 = [v17 localIdentifier];
        char v20 = [v18 isEqualToString:v19];

        if (v20) {
          goto LABEL_35;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          char v21 = VCPLogInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v26 = [v11 localIdentifier];
            uint64_t v25 = [v11 personLocalIdentifier];
            id v22 = [v17 localIdentifier];
            uint64_t v23 = [v17 verifiedType];
            *(_DWORD *)buf = 138413314;
            id v31 = v9;
            __int16 v32 = 2112;
            id v33 = v26;
            __int16 v34 = 2112;
            BOOL v35 = v25;
            __int16 v36 = 2112;
            long long v37 = v22;
            __int16 v38 = 2048;
            uint64_t v39 = v23;
            _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "%@ Person mismatch: face (%@) personLocalIdentifier %@ vs faceCropPerson %@ (%ld)", buf, 0x34u);
          }
        }
        if ([v6 type] == 1)
        {
          uint64_t v24 = (id *)(a1 + 56);
LABEL_34:
          [*v24 setObject:v17 forKeyedSubscript:v11];
          goto LABEL_35;
        }
        if ([v6 type] == 3)
        {
          uint64_t v24 = (id *)(a1 + 64);
          goto LABEL_34;
        }
        if ([v6 type] == 5)
        {
          uint64_t v24 = (id *)(a1 + 72);
          goto LABEL_34;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v9;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "%@ No valid person", buf, 0xCu);
        }
      }
LABEL_35:

      goto LABEL_36;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v9;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "%@ Failed to find face", buf, 0xCu);
    }
    goto LABEL_37;
  }
LABEL_38:
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_598(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 localIdentifier];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_600(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  id v3 = +[VCPPhotosPersistenceDelegate newAllPersonsFetchOptionsWithPhotoLibrary:WeakRetained];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_2;
  aBlock[3] = &unk_1E6299870;
  id v4 = v3;
  id v7 = v4;
  id v5 = (void (**)(void *, void, uint64_t))_Block_copy(aBlock);
  v5[2](v5, a1[5], 1);
  v5[2](v5, a1[6], 3);
  v5[2](v5, a1[7], 5);
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_3;
  v5[3] = &unk_1E6299848;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a3;
  [a2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F391F8] fetchPersonWithFace:v5 options:*(void *)(a1 + 32)];
  id v8 = [v7 firstObject];

  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [v5 localIdentifier];
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138413058;
        char v21 = v10;
        __int16 v22 = 2112;
        uint64_t v23 = v8;
        __int16 v24 = 2112;
        id v25 = v6;
        __int16 v26 = 2048;
        uint64_t v27 = v11;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Correcting face %@ from %@ to %@, with nameSource:%ld", buf, 0x2Au);
      }
    }
    uint64_t v12 = [MEMORY[0x1E4F39208] changeRequestForPerson:v8];
    id v19 = v5;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v12 removeFaces:v13];

    uint64_t v14 = [MEMORY[0x1E4F39208] changeRequestForPerson:v6];
    id v18 = v5;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [v14 addFaces:v15];

    id v16 = [MEMORY[0x1E4F39058] changeRequestForFace:v5];
    [v16 setNameSource:*(void *)(a1 + 40)];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_8;
    }
    id v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [v5 localIdentifier];
      *(_DWORD *)buf = 138412290;
      char v21 = v17;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[FaceCropAdjustment] Failed to find person for face %@", buf, 0xCu);
    }
  }

LABEL_8:
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_603(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_2_604;
  v2[3] = &unk_1E62998E0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_2_604(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218242;
      uint64_t v12 = [v6 count];
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[FaceCropAdjustment] Removing %lu faces for person %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v8 = (void *)MEMORY[0x1E4F39208];
  int v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v10 = [v8 changeRequestForPerson:v9];

  [v10 removeFaces:v6];
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_607];
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_605(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = [v2 localIdentifier];
      id v5 = [v2 personLocalIdentifier];
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Remove face %@ for person %@", (uint8_t *)&v7, 0x16u);
    }
  }
  id v6 = [MEMORY[0x1E4F39058] changeRequestForFace:v2];
  [v6 setNameSource:0];
}

- (void)_detectDuplicationInExistingFaceCrops:(id)a3 withFetchedFaces:(id)a4 faceCropFaceIdentifiersToEvaluate:(id)a5 duplicationResults:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v76 = a4;
  id v82 = a5;
  id v87 = (uint64_t (**)(void))a7;
  id v75 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke;
  v98[3] = &unk_1E6299908;
  id v86 = v11;
  id v99 = v86;
  [v10 enumerateKeysAndObjectsUsingBlock:v98];
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_609;
  v96[3] = &unk_1E6298228;
  id v83 = v12;
  id v97 = v83;
  [v76 enumerateObjectsUsingBlock:v96];
  id v88 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v91 = [v10 allValues];
  id v90 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v13 = 0;
  uint64_t v89 = 1;
  while (v13 < [v91 count])
  {
    id v14 = (void *)MEMORY[0x1C186D320]();
    if (v87 && (v87[2]() & 1) != 0)
    {
      int v15 = 2;
      goto LABEL_60;
    }
    id v16 = [v91 objectAtIndexedSubscript:v13];
    uint64_t v17 = [v16 localIdentifier];
    id v18 = [v86 objectForKeyedSubscript:v17];
    char v19 = [v82 containsObject:v18];

    if (v19)
    {
      char v20 = [v16 localIdentifier];
      char v21 = [v90 containsObject:v20];

      if ((v21 & 1) == 0)
      {
        __int16 v22 = [v16 localIdentifier];
        uint64_t v23 = [v86 objectForKeyedSubscript:v22];
        id v84 = [v83 objectForKeyedSubscript:v23];

        if (v84)
        {
          __int16 v24 = [v84 faceClusteringProperties];
          os_log_t v81 = [v24 faceprint];

          if (v81)
          {
            uint64_t v25 = [v81 faceprintVersion];
            __int16 v26 = [v81 faceprintData];
            id v78 = +[VCPVNImageprintWrapper wrapperWithImageprintType:0 version:v25 andData:v26];

            id v77 = 0;
            for (unint64_t i = v89; ; ++i)
            {
              if (i >= [v91 count])
              {
                if (v77) {
                  [v88 addObject:v77];
                }

                int v15 = 0;
                id v57 = v78;
                goto LABEL_48;
              }
              uint64_t v28 = (void *)MEMORY[0x1C186D320]();
              id v29 = [v91 objectAtIndexedSubscript:i];
              id v30 = [v29 localIdentifier];
              char v31 = [v90 containsObject:v30];

              if ((v31 & 1) == 0)
              {
                int v32 = [v29 type];
                if (v32 == [v16 type]) {
                  break;
                }
              }
LABEL_41:
            }
            id v33 = [v29 localIdentifier];
            __int16 v34 = [v86 objectForKeyedSubscript:v33];
            BOOL v35 = [v83 objectForKeyedSubscript:v34];

            if (v35)
            {
              int v36 = [v35 trainingType];
              if (v36 == [v84 trainingType])
              {
                long long v37 = [v35 faceClusteringProperties];
                os_log_t log = [v37 faceprint];

                if (log)
                {
                  uint64_t v38 = [log faceprintVersion];
                  uint64_t v39 = [log faceprintData];
                  os_log_t v80 = +[VCPVNImageprintWrapper wrapperWithImageprintType:0 version:v38 andData:v39];

                  float v95 = 0.0;
                  id v94 = 0;
                  int v40 = [v78 calculateDistance:&v95 toWrapper:v80 andError:&v94];
                  id v79 = v94;
                  if (v40 && v95 < 0.02)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      BOOL v41 = VCPLogInstance();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                      {
                        float v42 = v95;
                        id v73 = [v16 localIdentifier];
                        int v43 = [v16 type];
                        id v44 = [v29 localIdentifier];
                        int v45 = [v29 type];
                        *(_DWORD *)buf = 134219010;
                        double v101 = v42;
                        __int16 v102 = 2112;
                        *(void *)uint64_t v103 = v73;
                        *(_WORD *)&v103[8] = 1024;
                        *(_DWORD *)&v103[10] = v43;
                        *(_WORD *)&v103[14] = 2112;
                        *(void *)&v103[16] = v44;
                        *(_WORD *)&v103[24] = 1024;
                        *(_DWORD *)&v103[26] = v45;
                        _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_INFO, "[PHFaceCrop Dedupe] Duplicated with distance: %f [%@:%d] vs [%@:%d]", buf, 0x2Cu);
                      }
                    }
                    if (!v77)
                    {
                      id v77 = [MEMORY[0x1E4F1CA80] set];
                      [v77 addObject:v16];
                    }
                    [v77 addObject:v29];
                    uint64_t v46 = [v16 localIdentifier];
                    [v90 addObject:v46];

                    id v47 = [v29 localIdentifier];
                    [v90 addObject:v47];
                    goto LABEL_36;
                  }
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    id v47 = VCPLogInstance();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                    {
                      float v53 = v95;
                      uint64_t v54 = [v16 localIdentifier];
                      BOOL v55 = [v29 localIdentifier];
                      *(_DWORD *)buf = 134218754;
                      double v101 = v53;
                      __int16 v102 = 2112;
                      *(void *)uint64_t v103 = v54;
                      *(_WORD *)&v103[8] = 2112;
                      *(void *)&v103[10] = v55;
                      *(_WORD *)&v103[18] = 2112;
                      *(void *)&v103[20] = v79;
                      _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Distance: %f [%@] vs [%@] - %@", buf, 0x2Au);
                    }
LABEL_36:
                  }
LABEL_38:
                }
                else if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  VCPLogInstance();
                  os_log_t v80 = (os_log_t)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                  {
                    double v56 = [v35 localIdentifier];
                    *(_DWORD *)buf = 138412290;
                    double v101 = v56;
                    _os_log_impl(&dword_1BBEDA000, v80, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] PHFaceY[%@] without faceprint", buf, 0xCu);
                  }
                  goto LABEL_38;
                }
LABEL_39:
              }
              else if ((int)MediaAnalysisLogLevel() >= 7)
              {
                VCPLogInstance();
                os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                {
                  double v49 = [v84 localIdentifier];
                  int v50 = [v84 trainingType];
                  long long v51 = [v35 localIdentifier];
                  int v52 = [v35 trainingType];
                  *(_DWORD *)buf = 138413058;
                  double v101 = v49;
                  __int16 v102 = 1024;
                  *(_DWORD *)uint64_t v103 = v50;
                  *(_WORD *)&v103[4] = 2112;
                  *(void *)&v103[6] = v51;
                  *(_WORD *)&v103[14] = 1024;
                  *(_DWORD *)&v103[16] = v52;
                  _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Unmatched training type PHFaceX[%@](%d) and PHFaceY[%@](%d)", buf, 0x22u);
                }
                goto LABEL_39;
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 4)
            {
              VCPLogInstance();
              os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                double v48 = [0 localIdentifier];
                *(_DWORD *)buf = 138412290;
                double v101 = v48;
                _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_DEFAULT, "[PHFaceCrop Dedupe] Missing PHFaceY[%@]", buf, 0xCu);
              }
              goto LABEL_39;
            }

            goto LABEL_41;
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            id v57 = VCPLogInstance();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              double v59 = [v84 localIdentifier];
              *(_DWORD *)buf = 138412290;
              double v101 = v59;
              _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] PHFaceX[%@] without faceprint", buf, 0xCu);
            }
            int v15 = 4;
LABEL_48:

LABEL_57:
LABEL_58:

            goto LABEL_59;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 4)
          {
            int v15 = 4;
            goto LABEL_58;
          }
          VCPLogInstance();
          os_log_t v81 = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            double v58 = [0 localIdentifier];
            *(_DWORD *)buf = 138412290;
            double v101 = v58;
            _os_log_impl(&dword_1BBEDA000, v81, OS_LOG_TYPE_DEFAULT, "[PHFaceCrop Dedupe] Missing PHFaceX[%@]", buf, 0xCu);
          }
        }
        int v15 = 4;
        goto LABEL_57;
      }
    }
    int v15 = 4;
LABEL_59:

LABEL_60:
    if ((v15 | 4) != 4) {
      break;
    }
    ++v13;
    ++v89;
  }
  uint64_t v60 = [MEMORY[0x1E4F1CA48] array];
  if ([v88 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v61 = VCPLogInstance();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Processing duplications", buf, 2u);
      }
    }
    for (unint64_t j = 0; j < [v88 count]; ++j)
    {
      id v63 = (void *)MEMORY[0x1C186D320]();
      uint64_t v64 = [v88 objectAtIndexedSubscript:j];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v65 = VCPLogInstance();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          double v66 = COERCE_DOUBLE([v64 count]);
          *(_DWORD *)buf = 134218242;
          double v101 = v66;
          __int16 v102 = 2112;
          *(void *)uint64_t v103 = v64;
          _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] %lu duplications - %@", buf, 0x16u);
        }
      }
      id v67 = [v64 allObjects];
      id v68 = [v67 sortedArrayUsingComparator:&__block_literal_global_613];

      id v69 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, objc_msgSend(v68, "count") - 1);
      id v70 = [v68 objectsAtIndexes:v69];
      [v60 addObjectsFromArray:v70];
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_2;
      v92[3] = &unk_1E6299950;
      id v71 = v68;
      id v93 = v71;
      [v70 enumerateObjectsUsingBlock:v92];
    }
  }
  id v72 = v60;
  *a6 = v72;
}

void __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 localIdentifier];

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    __int16 v9 = [v6 localIdentifier];
    [v8 setObject:v5 forKeyedSubscript:v9];
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_INFO, "[PHFaceCrop Dedupe] PHFaceCrop without localIdentifier - %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_609(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 localIdentifier];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 localIdentifier];
    [v5 setObject:v3 forKeyedSubscript:v6];
  }
  else if ((int)MediaAnalysisLogLevel() >= 7)
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] PHFace without localIdentifier - %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

uint64_t __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_610(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localIdentifier];
  id v6 = [v4 localIdentifier];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

void __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [v3 localIdentifier];
      id v6 = [*(id *)(a1 + 32) firstObject];
      uint64_t v7 = [v6 localIdentifier];
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      int v11 = v7;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Removing %@ dupe to %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_processNewlyClusteredFaceCropsInFaceGroups:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  void v89[4] = *MEMORY[0x1E4F143B8];
  id v73 = a3;
  id v75 = (uint64_t (**)(void))a4;
  uint64_t v67 = mach_absolute_time();
  id v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  int v8 = VCPSignPostLog();
  id v9 = v8;
  id v68 = self;
  os_signpost_id_t spid = v7;
  unint64_t v66 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MADProcessNewlyClusteredFaceCrops", "", buf, 2u);
  }

  __int16 v10 = objc_opt_class();
  location = (id *)&self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  id v69 = (void *)[v10 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  uint64_t v12 = *MEMORY[0x1E4F39620];
  v89[0] = *MEMORY[0x1E4F39630];
  v89[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F39638];
  v89[2] = *MEMORY[0x1E4F39610];
  void v89[3] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];
  [v69 setFetchPropertySets:v14];

  if ((int)MediaAnalysisLogLevel() > 5)
  {
    int v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [v73 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v86 = v16;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "[FaceCrop] Processing newly clustered face crops in %lu PHFaceGroup; start processing ...",
        buf,
        0xCu);
    }
  }
  for (unint64_t i = 0; i < objc_msgSend(v73, "count", spid); ++i)
  {
    id v18 = (void *)MEMORY[0x1C186D320]();
    if (!v75 || (v75[2]() & 1) == 0)
    {
      id v72 = [v73 objectAtIndexedSubscript:i];
      char v20 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesInFaceGroup:options:");
      id v21 = objc_loadWeakRetained(location);
      unint64_t v74 = [v21 librarySpecificFetchOptions];

      __int16 v22 = [MEMORY[0x1E4F39068] fetchFaceCropByFaceLocalIdentifierForFaces:v20 fetchOptions:v74];
      if ([v22 count])
      {
        uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke;
        v83[3] = &unk_1E6299908;
        __int16 v24 = v23;
        id v84 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v83];
        if ([v24 count])
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v25 = VCPLogInstance();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v26 = [v22 count];
              uint64_t v27 = [v72 localIdentifier];
              *(_DWORD *)buf = 134218242;
              uint64_t v86 = v26;
              __int16 v87 = 2112;
              id v88 = v27;
              _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Fetched %lu PHFaceCrops in PHFaceGroup (%@); start processing ...",
                buf,
                0x16u);
            }
          }
          [(VCPPhotosPersistenceDelegate *)v68 _adjustConfirmingAndRejectionWithFaces:v20 faceCrops:v24 cancelOrExtendTimeoutBlock:v75];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v28 = VCPLogInstance();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Processing finished", buf, 2u);
            }
          }
          if ((unint64_t)[v22 count] > 1)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              int v36 = VCPLogInstance();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v37 = [v22 count];
                uint64_t v38 = [v72 localIdentifier];
                *(_DWORD *)buf = 134218242;
                uint64_t v86 = v37;
                __int16 v87 = 2112;
                id v88 = v38;
                _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Fetched %lu PHFaceCrops in PHFaceGroup (%@); start dedupping ...",
                  buf,
                  0x16u);
              }
            }
            uint64_t v39 = (void *)MEMORY[0x1E4F1CAD0];
            int v40 = [v24 allKeys];
            id v29 = [v39 setWithArray:v40];

            id v82 = 0;
            [(VCPPhotosPersistenceDelegate *)v68 _detectDuplicationInExistingFaceCrops:v22 withFetchedFaces:v20 faceCropFaceIdentifiersToEvaluate:v29 duplicationResults:&v82 cancelOrExtendTimeoutBlock:v75];
            os_log_t log = (os_log_t)v82;
LABEL_41:
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              id v29 = VCPLogInstance();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v30 = [v22 count];
                char v31 = [v72 localIdentifier];
                *(_DWORD *)buf = 134218242;
                uint64_t v86 = v30;
                __int16 v87 = 2112;
                id v88 = v31;
                _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Fetched %lu PHFaceCrop in PHFaceGroup (%@); skip",
                  buf,
                  0x16u);
              }
              os_log_t log = 0;
              goto LABEL_41;
            }
            os_log_t log = 0;
          }
          id v41 = objc_loadWeakRetained(location);
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_616;
          v80[3] = &unk_1E6296FF8;
          float v42 = v24;
          os_log_t v81 = v42;
          id v79 = 0;
          int v43 = [v41 performChangesAndWait:v80 error:&v79];
          id v44 = v79;

          if (v43)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              int v45 = VCPLogInstance();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                uint64_t v46 = [v42 count];
                *(_DWORD *)buf = 134217984;
                uint64_t v86 = v46;
                id v47 = v45;
                os_log_type_t v48 = OS_LOG_TYPE_INFO;
                double v49 = "[FaceCrop] Updated %lu PHFaceCrops";
                uint32_t v50 = 12;
                goto LABEL_52;
              }
              goto LABEL_53;
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            int v45 = VCPLogInstance();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              uint64_t v51 = [v42 count];
              *(_DWORD *)buf = 134218242;
              uint64_t v86 = v51;
              __int16 v87 = 2112;
              id v88 = v44;
              id v47 = v45;
              os_log_type_t v48 = OS_LOG_TYPE_ERROR;
              double v49 = "[FaceCrop] Failed to update %lu PHFaceCrops - %@";
              uint32_t v50 = 22;
LABEL_52:
              _os_log_impl(&dword_1BBEDA000, v47, v48, v49, buf, v50);
            }
LABEL_53:
          }
          if ([log count])
          {
            id v52 = objc_loadWeakRetained(location);
            v77[0] = MEMORY[0x1E4F143A8];
            v77[1] = 3221225472;
            v77[2] = __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_620;
            v77[3] = &unk_1E6296FF8;
            float v53 = log;
            id v78 = v53;
            id v76 = v44;
            int v54 = [v52 performChangesAndWait:v77 error:&v76];
            id v55 = v76;

            if (v54)
            {
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                double v56 = VCPLogInstance();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  uint64_t v57 = [v53 count];
                  *(_DWORD *)buf = 134217984;
                  uint64_t v86 = v57;
                  double v58 = v56;
                  os_log_type_t v59 = OS_LOG_TYPE_INFO;
                  uint64_t v60 = "[FaceCrop] Removed %lu duplicated PHFaceCrops";
                  uint32_t v61 = 12;
                  goto LABEL_63;
                }
                goto LABEL_64;
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 3)
            {
              double v56 = VCPLogInstance();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                uint64_t v62 = [v53 count];
                *(_DWORD *)buf = 134218242;
                uint64_t v86 = v62;
                __int16 v87 = 2112;
                id v88 = v55;
                double v58 = v56;
                os_log_type_t v59 = OS_LOG_TYPE_ERROR;
                uint64_t v60 = "[FaceCrop] Failed to remove %lu duplicated PHFaceCrops - %@";
                uint32_t v61 = 22;
LABEL_63:
                _os_log_impl(&dword_1BBEDA000, v58, v59, v60, buf, v61);
              }
LABEL_64:
            }
          }
          else
          {
            id v55 = v44;
          }

          int v19 = 0;
LABEL_67:
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            VCPLogInstance();
            os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v34 = [v24 count];
              BOOL v35 = [v72 localIdentifier];
              *(_DWORD *)buf = 134218242;
              uint64_t v86 = v34;
              __int16 v87 = 2112;
              id v88 = v35;
              _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_DEBUG, "[FaceCrop] Fetched %lu newly clustered PHFaceCrop in PHFaceGroup (%@); skip",
                buf,
                0x16u);
            }
            int v19 = 6;
            goto LABEL_67;
          }
          int v19 = 6;
        }

LABEL_69:
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          __int16 v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v32 = [v22 count];
            id v33 = [v72 localIdentifier];
            *(_DWORD *)buf = 134218242;
            uint64_t v86 = v32;
            __int16 v87 = 2112;
            id v88 = v33;
            _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "[FaceCrop] Fetched %lu PHFaceCrop in PHFaceGroup (%@); skip",
              buf,
              0x16u);
          }
          int v19 = 6;
          goto LABEL_69;
        }
        int v19 = 6;
      }

      goto LABEL_71;
    }
    int v19 = 4;
LABEL_71:
    if (v19 != 6 && v19) {
      break;
    }
  }
  id v63 = VCPSignPostLog();
  uint64_t v64 = v63;
  if (v66 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v64, OS_SIGNPOST_INTERVAL_END, spid, "MADProcessNewlyClusteredFaceCrops", "", buf, 2u);
  }

  if (v67)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
}

void __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 state] == 1) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

uint64_t __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_616(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_618];
}

void __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E4F39078], "changeRequestForFaceCrop:");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 setState:2];
}

uint64_t __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_620(uint64_t a1)
{
  return [MEMORY[0x1E4F39078] deleteFaceCrops:*(void *)(a1 + 32)];
}

- (void)_buildPersonsFromUpdatedFaceGroups:(id)a3 faceClusterer:(id)a4 keyFaceUpdateBlock:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 context:(id)a7
{
  uint64_t v800 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (NSMapTable *)a3;
  id v417 = a4;
  id v420 = a5;
  uint64_t v13 = (uint64_t (**)(id))a6;
  id v441 = a7;
  locatiouint64_t n = (id *)&self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  table = v12;
  v522 = v13;
  if (WeakRetained)
  {
    int v15 = [(NSMapTable *)v12 objectEnumerator];
    uint64_t v16 = [v15 allObjects];

    v411 = (void *)v16;
    [(VCPPhotosPersistenceDelegate *)self _processNewlyClusteredFaceCropsInFaceGroups:v16 cancelOrExtendTimeoutBlock:v13];
    v448 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", -[NSMapTable count](v12, "count"));
    v493 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMapTable count](v12, "count"));
    long long v743 = 0u;
    long long v742 = 0u;
    long long v741 = 0u;
    long long v740 = 0u;
    uint64_t v17 = [(NSMapTable *)v12 objectEnumerator];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v740 objects:v799 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v741;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v741 != v19) {
            objc_enumerationMutation(v17);
          }
          [v493 addObject:*(void *)(*((void *)&v740 + 1) + 8 * i)];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v740 objects:v799 count:16];
      }
      while (v18);
    }
    v521 = self;

    id v21 = objc_opt_class();
    id v22 = objc_loadWeakRetained(location);
    v412 = (void *)[v21 newAllPersonsFetchOptionsWithPhotoLibrary:v22];

    v429 = [MEMORY[0x1E4F391F8] fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups:v493 options:v412];
    uint64_t v23 = [v493 count];
    if (v23 != [v429 count])
    {
      __int16 v24 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v25 = NSAllMapTableKeys(v12);
      uint64_t v26 = [v24 setWithArray:v25];

      uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v28 = [v429 allKeys];
      id v29 = [v27 setWithArray:v28];

      [v26 minusSet:v29];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v779 = 138412290;
          *(void *)&v779[4] = v26;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to find unverified person for faceGroups '%@'; These will be fixed up and retried later",
            v779,
            0xCu);
        }
      }
      char v31 = [MEMORY[0x1E4F1CA80] set];
      long long v739 = 0u;
      long long v738 = 0u;
      long long v737 = 0u;
      long long v736 = 0u;
      id v32 = v26;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v736 objects:v798 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v737;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v737 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void *)(*((void *)&v736 + 1) + 8 * j);
            uint64_t v37 = [(NSMapTable *)table objectForKey:v36];
            if (v37) {
              [v31 addObject:v37];
            }
            [(NSMapTable *)table removeObjectForKey:v36];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v736 objects:v798 count:16];
        }
        while (v33);
      }

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke;
      aBlock[3] = &unk_1E6299998;
      void aBlock[4] = v521;
      id v38 = v31;
      id v734 = v38;
      v735 = v522;
      uint64_t v39 = _Block_copy(aBlock);
      id v40 = objc_loadWeakRetained(location);
      id v732 = 0;
      char v41 = [v40 performCancellableChangesAndWait:v39 error:&v732];
      id v42 = v732;

      if ((v41 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        int v43 = VCPLogInstance();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v779 = 138412290;
          *(void *)&v779[4] = v42;
          _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to fix up face groups without unverified person. Error: '%@'", v779, 0xCu);
        }
      }
    }
    id v491 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v731 = 0u;
    long long v730 = 0u;
    long long v729 = 0u;
    long long v728 = 0u;
    id v44 = [v429 objectEnumerator];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v728 objects:v797 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v729;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v729 != v46) {
            objc_enumerationMutation(v44);
          }
          os_log_type_t v48 = [*(id *)(*((void *)&v728 + 1) + 8 * k) firstObject];
          double v49 = v48;
          if (v48)
          {
            uint32_t v50 = [v48 localIdentifier];
            [v491 setObject:v49 forKeyedSubscript:v50];
          }
        }
        uint64_t v45 = [v44 countByEnumeratingWithState:&v728 objects:v797 count:16];
      }
      while (v45);
    }

    long long v727 = 0u;
    long long v726 = 0u;
    long long v725 = 0u;
    long long v724 = 0u;
    id obj = [(NSMapTable *)table keyEnumerator];
    uint64_t v51 = v522;
    uint64_t v444 = [obj countByEnumeratingWithState:&v724 objects:v796 count:16];
    if (v444)
    {
      v509 = v522 + 2;
      uint64_t v442 = *(void *)v725;
      uint64_t v436 = *MEMORY[0x1E4F39630];
      uint64_t v435 = *MEMORY[0x1E4F39610];
      uint64_t v434 = *MEMORY[0x1E4F39638];
      do
      {
        uint64_t v460 = 0;
        do
        {
          if (*(void *)v725 != v442) {
            objc_enumerationMutation(obj);
          }
          BOOL v52 = v51 == 0;
          uint64_t v457 = *(void *)(*((void *)&v724 + 1) + 8 * v460);
          v451 = (void *)MEMORY[0x1C186D320]();
          float v53 = table;
          uint64_t v51 = v522;
          int v54 = v521;
          if (v52 || (v522[2](v522) & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              double v56 = VCPLogInstance();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v779 = 138412290;
                *(void *)&v779[4] = v457;
                _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_DEBUG, "PersonBuilder: Person Building faceGroup '%@'", v779, 0xCu);
              }

              float v53 = table;
              int v54 = v521;
            }
            [v448 becomeCurrentWithPendingUnitCount:1];
            v454 = [(NSMapTable *)v53 objectForKey:v457];
            -[VCPPhotosPersistenceDelegate dedupeGraphVerifiedPersonsInFaceGroup:personCache:](v54, "dedupeGraphVerifiedPersonsInFaceGroup:personCache:");
            uint64_t v57 = objc_opt_class();
            id v58 = objc_loadWeakRetained(location);
            v459 = (void *)[v57 newAllFacesFetchOptionsWithPhotoLibrary:v58];

            v795[0] = v436;
            v795[1] = v435;
            v795[2] = v434;
            os_log_type_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v795 count:3];
            [v459 setFetchPropertySets:v59];

            v452 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:v454 options:v459];
            unint64_t v438 = [v452 count];
            unint64_t v437 = [v441 minimumFaceGroupSizeForCreatingMergeCandidates];
            v535 = [MEMORY[0x1E4F1CA80] set];
            id v723 = 0;
            id v722 = 0;
            id v721 = 0;
            id v720 = 0;
            id v719 = 0;
            id v718 = 0;
            id v717 = 0;
            id v716 = 0;
            id v715 = 0;
            [(VCPPhotosPersistenceDelegate *)v521 _getTrainingFacesByPerson:&v723 confirmedFaceCSNs:&v722 faceCSNsByPerson:&v721 faceCSNsByMigratedPerson:&v720 faceCSNsByQuickClassificationPerson:&v719 mergeCandidates:&v718 invalidMergeCandidates:&v717 rejectedPersonsByPerson:&v716 faceInFaceGroupByCSN:&v715 inFaces:v452 personCache:v491 cancelOrExtendTimeoutBlock:v522];
            uint64_t v60 = (NSMapTable *)v723;
            v467 = (NSMapTable *)v722;
            v511 = (NSMapTable *)v721;
            v510 = (NSMapTable *)v720;
            id v465 = v719;
            id v61 = v718;
            id v453 = v717;
            id v456 = v716;
            id v455 = v715;
            v450 = v61;
            if (v522 && (v522[2](v522) & 1) != 0)
            {
              int v55 = 1;
LABEL_609:

              uint64_t v51 = v522;
              [v448 resignCurrent];
              goto LABEL_610;
            }
            long long v714 = 0u;
            long long v713 = 0u;
            long long v712 = 0u;
            long long v711 = 0u;
            uint64_t v62 = [(NSMapTable *)v510 keyEnumerator];
            uint64_t v63 = [v62 countByEnumeratingWithState:&v711 objects:v794 count:16];
            if (v63)
            {
              uint64_t v64 = *(void *)v712;
              do
              {
                for (uint64_t m = 0; m != v63; ++m)
                {
                  if (*(void *)v712 != v64) {
                    objc_enumerationMutation(v62);
                  }
                  [v535 addObject:*(void *)(*((void *)&v711 + 1) + 8 * m)];
                }
                uint64_t v63 = [v62 countByEnumeratingWithState:&v711 objects:v794 count:16];
              }
              while (v63);
            }

            v447 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
            v446 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
            v445 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
            uint64_t v527 = [(NSMapTable *)v60 count];
            unint64_t v66 = [v429 objectForKeyedSubscript:v457];
            v449 = [v66 firstObject];

            v534 = [v449 localIdentifier];
            if (v449 && v534)
            {
              v440 = [MEMORY[0x1E4F1CA80] set];
              v533 = [MEMORY[0x1E4F1CA80] set];
              v532 = [MEMORY[0x1E4F1CA80] set];
              v427 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
              v426 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
              v524 = [MEMORY[0x1E4F1CA80] set];
              if ([(NSMapTable *)v60 count])
              {
                uint64_t v67 = NSAllMapTableKeys(v60);
                [v524 addObjectsFromArray:v67];
              }
              if ([(NSMapTable *)v467 count])
              {
                id v68 = NSAllMapTableKeys(v467);
                [v524 addObjectsFromArray:v68];
              }
              if ([(NSMapTable *)v511 count])
              {
                id v69 = NSAllMapTableKeys(v511);
                [v524 addObjectsFromArray:v69];
              }
              if ([(NSMapTable *)v510 count])
              {
                id v70 = NSAllMapTableKeys(v510);
                [v524 addObjectsFromArray:v70];
              }
              [v524 removeObject:v534];
              id v71 = objc_opt_class();
              id v72 = objc_loadWeakRetained(location);
              v433 = (void *)[v71 newVerifiedPersonsFetchOptionsWithPhotoLibrary:v72];

              v705[0] = MEMORY[0x1E4F143A8];
              v705[1] = 3221225472;
              v705[2] = __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_622;
              v705[3] = &unk_1E62999C0;
              id v73 = v522;
              v710 = v73;
              v705[4] = v521;
              id v517 = v455;
              id v706 = v517;
              id v468 = v427;
              id v707 = v468;
              id v439 = v426;
              id v708 = v439;
              id v74 = v456;
              id v709 = v74;
              [(VCPPhotosPersistenceDelegate *)v521 _enumeratePersonsWithLocalIdentifiers:v524 fetchOptions:v433 personCache:v491 usingBlock:v705];
              if (v522 && ((*v509)(v73) & 1) != 0)
              {
                int v55 = 1;
                goto LABEL_606;
              }
              long long v704 = 0u;
              long long v703 = 0u;
              long long v702 = 0u;
              long long v701 = 0u;
              id v76 = [v74 keyEnumerator];
              uint64_t v77 = [v76 countByEnumeratingWithState:&v701 objects:v793 count:16];
              if (v77)
              {
                uint64_t v78 = *(void *)v702;
                do
                {
                  for (uint64_t n = 0; n != v77; ++n)
                  {
                    if (*(void *)v702 != v78) {
                      objc_enumerationMutation(v76);
                    }
                    os_log_t v80 = *(void **)(*((void *)&v701 + 1) + 8 * n);
                    os_log_t v81 = [v74 objectForKey:v80];
                    id v82 = [v81 allObjects];
                    AddMergeCandidatePersonsForPerson(v533, v82, v80, @"invalid merge candidate pair created from cluster rejections");

                    id v83 = [v81 allObjects];
                    AddMergeCandidatePersonsForPerson(v532, v83, v80, @"potential invalid merge candidate pair created from cluster rejections");
                  }
                  uint64_t v77 = [v76 countByEnumeratingWithState:&v701 objects:v793 count:16];
                }
                while (v77);
              }

              v523 = (void *)[(NSMapTable *)v511 copy];
              [v523 removeObjectForKey:v534];
              long long v700 = 0u;
              long long v699 = 0u;
              long long v698 = 0u;
              long long v697 = 0u;
              id v84 = [v468 keyEnumerator];
              uint64_t v85 = [v84 countByEnumeratingWithState:&v697 objects:v792 count:16];
              if (v85)
              {
                uint64_t v86 = *(void *)v698;
                do
                {
                  for (iuint64_t i = 0; ii != v85; ++ii)
                  {
                    if (*(void *)v698 != v86) {
                      objc_enumerationMutation(v84);
                    }
                    uint64_t v791 = *(void *)(*((void *)&v697 + 1) + 8 * ii);
                    uint64_t v88 = v791;
                    uint64_t v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v791 count:1];
                    AddMergeCandidatePersonsForPerson(v533, v89, v534, @"invalid merge candidate pair from cluster rejection for verified person");

                    uint64_t v790 = v88;
                    id v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v790 count:1];
                    AddMergeCandidatePersonsForPerson(v532, v90, v534, @"potential invalid merge candidate pair from cluster rejection for verified person");

                    [v524 removeObject:v88];
                    [v523 removeObjectForKey:v88];
                  }
                  uint64_t v85 = [v84 countByEnumeratingWithState:&v697 objects:v792 count:16];
                }
                while (v85);
              }

              v682[0] = MEMORY[0x1E4F143A8];
              v682[1] = 3221225472;
              v682[2] = __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_2;
              v682[3] = &unk_1E62999E8;
              id v432 = v440;
              id v683 = v432;
              id v466 = v532;
              id v684 = v466;
              id v418 = v450;
              id v685 = v418;
              id v686 = v533;
              v687 = v521;
              id v515 = v447;
              id v688 = v515;
              id exc_buf = v446;
              id v689 = exc_buf;
              id v464 = v445;
              id v690 = v464;
              id v691 = v454;
              id v415 = v517;
              id v692 = v415;
              id v693 = v491;
              id v695 = v420;
              v507 = v73;
              v696 = v507;
              id v416 = v441;
              id v694 = v416;
              v425 = (uint64_t (**)(void *, id *))_Block_copy(v682);
              if (v527)
              {
                uint64_t v91 = [(NSMapTable *)v60 keyEnumerator];
                id v500 = [v91 nextObject];

                id v424 = [v439 objectForKey:v500];
                v422 = [v468 objectForKey:v500];
                v421 = [v418 objectForKey:v534];
                if (!v421 || v527 != 1)
                {
                  if (v527 == 1) {
                    goto LABEL_139;
                  }
                  goto LABEL_142;
                }
                [v421 removeObject:v500];
LABEL_139:
                if ([v422 count] || objc_msgSend(v421, "count") || objc_msgSend(v453, "count"))
                {
LABEL_142:
                  long long v116 = [(NSMapTable *)v60 objectEnumerator];
                  id v501 = [v116 nextObject];

                  v528 = [v501 anyObject];
                  uint64_t v117 = [v528 clusterSequenceNumber];
                  v518 = [v417 level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:v117 error:0];
                  if ((unint64_t)[v518 count] >= 2)
                  {
                    long long v118 = [(VCPPhotosPersistenceDelegate *)v521 identifyConflictingL0Clusters:v518 csnToRejectedPersonForNewlyClusteredFaces:MEMORY[0x1E4F1CC08] csnToConfirmedPersonForNewlyClusteredFaces:MEMORY[0x1E4F1CC08]];
                    *(void *)v779 = 0;
                    *(void *)&v779[8] = v779;
                    *(void *)&v779[16] = 0x3032000000;
                    v780 = __Block_byref_object_copy__25;
                    v781 = __Block_byref_object_dispose__25;
                    id v782 = 0;
                    v653[0] = MEMORY[0x1E4F143A8];
                    v653[1] = 3221225472;
                    v653[2] = __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_648;
                    v653[3] = &unk_1E6299A10;
                    id v119 = v518;
                    uint64_t v656 = v117;
                    id v654 = v119;
                    v655 = v779;
                    [v118 enumerateObjectsUsingBlock:v653];
                    if (*(void *)(*(void *)&v779[8] + 40))
                    {
                      long long v120 = objc_msgSend(v119, "objectForKeyedSubscript:");
                      BOOL v121 = v120 == 0;

                      if (!v121)
                      {
                        uint64_t v775 = *(void *)(*(void *)&v779[8] + 40);
                        objc_msgSend(v119, "objectForKeyedSubscript:");
                        id v122 = (id)objc_claimAutoreleasedReturnValue();
                        id v776 = v122;
                        v518 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v776 forKeys:&v775 count:1];
                        goto LABEL_148;
                      }
                      if ((int)MediaAnalysisLogLevel() >= 3)
                      {
                        long long v125 = VCPLogInstance();
                        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                        {
                          uint64_t v126 = *(void *)(*(void *)&v779[8] + 40);
                          int v777 = 138412290;
                          uint64_t v778 = v126;
                          _os_log_impl(&dword_1BBEDA000, v125, OS_LOG_TYPE_ERROR, "[VisionFgMapping] Failed to find conflicting l0cluster (expect csn: %@)", (uint8_t *)&v777, 0xCu);
                        }
                      }
                      v518 = [MEMORY[0x1E4F1C9E8] dictionary];
                    }
                    else
                    {
                      long long v123 = (void *)[v119 mutableCopy];
                      long long v124 = [v118 allObjects];
                      [v123 removeObjectsForKeys:v124];

                      id v122 = v123;
                      v518 = v122;
LABEL_148:

                      id v119 = v122;
                    }

                    _Block_object_dispose(v779, 8);
                  }
                  v506 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                  id v512 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                  long long v652 = 0u;
                  long long v651 = 0u;
                  long long v650 = 0u;
                  long long v649 = 0u;
                  id v492 = [(NSMapTable *)v60 objectEnumerator];
                  uint64_t v127 = [v492 countByEnumeratingWithState:&v649 objects:v774 count:16];
                  if (!v127) {
                    goto LABEL_182;
                  }
                  uint64_t v481 = *(void *)v650;
                  do
                  {
                    v494 = 0;
                    v478 = (void *)v127;
                    do
                    {
                      if (*(void *)v650 != v481) {
                        objc_enumerationMutation(v492);
                      }
                      id v128 = *(id *)(*((void *)&v649 + 1) + 8 * (void)v494);

                      context = (void *)MEMORY[0x1C186D320]();
                      long long v648 = 0u;
                      long long v647 = 0u;
                      long long v646 = 0u;
                      long long v645 = 0u;
                      id v501 = v128;
                      uint64_t v129 = [v501 countByEnumeratingWithState:&v645 objects:v773 count:16];
                      id v130 = v528;
                      if (v129)
                      {
                        uint64_t v131 = *(void *)v646;
                        while (2)
                        {
                          for (juint64_t j = 0; jj != v129; ++jj)
                          {
                            if (*(void *)v646 != v131) {
                              objc_enumerationMutation(v501);
                            }
                            id v133 = *(id *)(*((void *)&v645 + 1) + 8 * jj);
                            long long v134 = v130;
                            id v130 = v133;

                            if (v522 && ((*v509)(v507) & 1) != 0)
                            {
                              v528 = v130;
                              int v147 = 0;
                              goto LABEL_179;
                            }
                            uint64_t v135 = -[VCPPhotosPersistenceDelegate _level0ClusterIdForFaceCSN:level0Clusters:](v521, "_level0ClusterIdForFaceCSN:level0Clusters:", [v130 clusterSequenceNumber], v518);
                            if (v135)
                            {
                              v529 = v130;
                              long long v136 = [NSNumber numberWithUnsignedInteger:v135];
                              long long v137 = [v506 objectForKey:v136];
                              if (!v137)
                              {
                                long long v137 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                                [v506 setObject:v137 forKey:v136];
                              }
                              long long v138 = [v529 personLocalIdentifier];
                              long long v139 = [v137 objectForKey:v138];

                              if (!v139)
                              {
                                uint64_t v140 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                                double v141 = [v529 personLocalIdentifier];
                                [v137 setObject:v140 forKey:v141];

                                long long v139 = (void *)v140;
                              }
                              uint64_t v142 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v529, "clusterSequenceNumber"));
                              [v139 addObject:v142];

                              int64_t v143 = [v529 personLocalIdentifier];
                              float v144 = [v512 objectForKey:v143];

                              if (!v144)
                              {
                                uint64_t v145 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                                __int16 v146 = [v529 personLocalIdentifier];
                                [v512 setObject:v145 forKey:v146];

                                float v144 = (void *)v145;
                              }
                              [v144 addObject:v136];

                              id v130 = v529;
                            }
                          }
                          uint64_t v129 = [v501 countByEnumeratingWithState:&v645 objects:v773 count:16];
                          if (v129) {
                            continue;
                          }
                          break;
                        }
                      }

                      v528 = 0;
                      int v147 = 1;
LABEL_179:

                      if (!v147)
                      {
                        int v252 = 1;
                        goto LABEL_571;
                      }
                      v494 = (char *)v494 + 1;
                    }
                    while (v494 != v478);
                    uint64_t v127 = [v492 countByEnumeratingWithState:&v649 objects:v774 count:16];
                  }
                  while (v127);
LABEL_182:

                  id v492 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                  long long v644 = 0u;
                  long long v643 = 0u;
                  long long v642 = 0u;
                  long long v641 = 0u;
                  float v148 = [v468 keyEnumerator];
                  v473 = v148;
                  uint64_t v149 = [v148 countByEnumeratingWithState:&v641 objects:v772 count:16];
                  if (v149)
                  {
                    id contexta = *(void **)v642;
LABEL_184:
                    id v502 = 0;
                    id v482 = (id)v149;
                    while (1)
                    {
                      if (*(void **)v642 != contexta) {
                        objc_enumerationMutation(v148);
                      }
                      uint64_t v150 = *(void *)(*((void *)&v641 + 1) + 8 * (void)v502);
                      v495 = (void *)MEMORY[0x1C186D320]();
                      uint64_t v151 = [v468 objectForKey:v150];
                      long long v640 = 0u;
                      long long v639 = 0u;
                      long long v638 = 0u;
                      long long v637 = 0u;
                      id v152 = v151;
                      uint64_t v153 = [v152 countByEnumeratingWithState:&v637 objects:v771 count:16];
                      if (v153)
                      {
                        uint64_t v154 = *(void *)v638;
                        while (2)
                        {
                          for (kuint64_t k = 0; kk != v153; ++kk)
                          {
                            if (*(void *)v638 != v154) {
                              objc_enumerationMutation(v152);
                            }
                            double v156 = *(void **)(*((void *)&v637 + 1) + 8 * kk);
                            if (v522 && ((*v509)(v507) & 1) != 0)
                            {
                              int v161 = 0;
                              goto LABEL_204;
                            }
                            uint64_t v157 = -[VCPPhotosPersistenceDelegate _level0ClusterIdForFaceCSN:level0Clusters:](v521, "_level0ClusterIdForFaceCSN:level0Clusters:", [v156 unsignedIntegerValue], v518);
                            if (v157)
                            {
                              uint64_t v158 = [NSNumber numberWithUnsignedInteger:v157];
                              double v159 = [v492 objectForKey:v158];
                              if (!v159)
                              {
                                double v159 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                                [v492 setObject:v159 forKey:v158];
                              }
                              double v160 = [v159 objectForKey:v150];
                              if (!v160)
                              {
                                double v160 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                                [v159 setObject:v160 forKey:v150];
                              }
                              [v160 addObject:v156];
                            }
                          }
                          uint64_t v153 = [v152 countByEnumeratingWithState:&v637 objects:v771 count:16];
                          if (v153) {
                            continue;
                          }
                          break;
                        }
                      }
                      int v161 = 1;
LABEL_204:

                      float v148 = v473;
                      if (!v161) {
                        break;
                      }
                      id v502 = (char *)v502 + 1;
                      if (v502 == v482)
                      {
                        uint64_t v149 = [v473 countByEnumeratingWithState:&v641 objects:v772 count:16];
                        if (!v149) {
                          goto LABEL_207;
                        }
                        goto LABEL_184;
                      }
                    }
                    int v252 = 1;
LABEL_570:

                    id v501 = 0;
LABEL_571:

                    if (v252)
                    {
                      int v55 = 1;
                      goto LABEL_603;
                    }
LABEL_573:
                    if ([v416 quarantineTwinsOnAssetEnabled]) {
                      [(VCPPhotosPersistenceDelegate *)v521 _updateFaceCSNsToAddByPerson:v464 faceCSNsToRemoveByPerson:exc_buf faceInFaceGroupByCSN:v415 faceCSNsByPersonLocalIdentifier:v511 faceCSNsByMigratedPersonLocalIdentifier:v510 personsToUpdate:v515];
                    }
                    if ([v468 count])
                    {
                      long long v544 = 0u;
                      long long v543 = 0u;
                      long long v542 = 0u;
                      long long v541 = 0u;
                      id v514 = [v468 keyEnumerator];
                      uint64_t v520 = [v514 countByEnumeratingWithState:&v541 objects:v746 count:16];
                      if (v520)
                      {
                        uint64_t v516 = *(void *)v542;
                        do
                        {
                          for (muint64_t m = 0; mm != v520; ++mm)
                          {
                            if (*(void *)v542 != v516) {
                              objc_enumerationMutation(v514);
                            }
                            exc_bufa = *(void **)(*((void *)&v541 + 1) + 8 * mm);
                            v367 = objc_msgSend(v468, "objectForKey:");
                            if ([v367 count])
                            {
                              v745 = exc_bufa;
                              v368 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v745 count:1];
                              AddMergeCandidatePersonsForPerson(v466, v368, v534, @"invalid merge candidate pair: a cluster rejection");

                              v369 = [MEMORY[0x1E4F1CA80] set];
                              long long v539 = 0u;
                              long long v540 = 0u;
                              long long v537 = 0u;
                              long long v538 = 0u;
                              v370 = [(NSMapTable *)v60 keyEnumerator];
                              uint64_t v371 = [v370 countByEnumeratingWithState:&v537 objects:v744 count:16];
                              if (v371)
                              {
                                uint64_t v372 = *(void *)v538;
                                do
                                {
                                  for (nuint64_t n = 0; nn != v371; ++nn)
                                  {
                                    if (*(void *)v538 != v372) {
                                      objc_enumerationMutation(v370);
                                    }
                                    uint64_t v374 = *(void *)(*((void *)&v537 + 1) + 8 * nn);
                                    v375 = [(NSMapTable *)v60 objectForKey:v374];
                                    v376 = [v375 valueForKey:@"clusterSequenceNumber"];

                                    if ([v376 intersectsSet:v367]) {
                                      [v369 addObject:v374];
                                    }
                                  }
                                  uint64_t v371 = [v370 countByEnumeratingWithState:&v537 objects:v744 count:16];
                                }
                                while (v371);
                              }

                              __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_685(v377, v369, v467, v367);
                              v378 = (void *)[(NSMapTable *)v511 copy];
                              __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_685([v378 removeObjectForKey:v534], v369, v378, v367);
                              __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_685(v379, v369, v510, v367);
                              __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_685(v380, v369, v464, v367);
                              if ([v369 count])
                              {
                                v381 = [v369 allObjects];
                                AddMergeCandidatePersonsForPerson(v466, v381, exc_bufa, @"invalid merge candidate pair:a face on verified person but cluster-rejected on another verified person");
                              }
                            }
                          }
                          uint64_t v520 = [v514 countByEnumeratingWithState:&v541 objects:v746 count:16];
                        }
                        while (v520);
                      }
                    }
                    id v536 = 0;
                    char v382 = v425[2](v425, &v536);
                    id v383 = v536;
                    if ((v382 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
                    {
                      v384 = VCPLogInstance();
                      if (os_log_type_enabled(v384, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v779 = 138412290;
                        *(void *)&v779[4] = v383;
                        _os_log_impl(&dword_1BBEDA000, v384, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to build persons [Error: '%@']", v779, 0xCu);
                      }
                    }
                    int v55 = 0;
LABEL_603:

LABEL_604:
                    goto LABEL_605;
                  }
LABEL_207:

                  uint64_t v162 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                  long long v636 = 0u;
                  long long v635 = 0u;
                  long long v634 = 0u;
                  long long v633 = 0u;
                  v474 = (void *)v162;
                  id v463 = [v439 keyEnumerator];
                  uint64_t v163 = [v463 countByEnumeratingWithState:&v633 objects:v770 count:16];
                  if (!v163) {
                    goto LABEL_232;
                  }
                  id contextb = *(void **)v634;
                  do
                  {
                    id v503 = 0;
                    id v483 = (id)v163;
                    do
                    {
                      if (*(void **)v634 != contextb) {
                        objc_enumerationMutation(v463);
                      }
                      uint64_t v164 = *(void *)(*((void *)&v633 + 1) + 8 * (void)v503);
                      v496 = (void *)MEMORY[0x1C186D320]();
                      double v165 = [v439 objectForKey:v164];
                      long long v632 = 0u;
                      long long v631 = 0u;
                      long long v630 = 0u;
                      long long v629 = 0u;
                      id v166 = v165;
                      double v167 = v474;
                      uint64_t v168 = [v166 countByEnumeratingWithState:&v629 objects:v769 count:16];
                      if (v168)
                      {
                        uint64_t v169 = *(void *)v630;
                        while (2)
                        {
                          for (uint64_t i1 = 0; i1 != v168; ++i1)
                          {
                            if (*(void *)v630 != v169) {
                              objc_enumerationMutation(v166);
                            }
                            char v171 = *(void **)(*((void *)&v629 + 1) + 8 * i1);
                            if (v522 && ((*v509)(v507) & 1) != 0)
                            {
                              int v176 = 0;
                              goto LABEL_229;
                            }
                            uint64_t v172 = -[VCPPhotosPersistenceDelegate _level0ClusterIdForFaceCSN:level0Clusters:](v521, "_level0ClusterIdForFaceCSN:level0Clusters:", [v171 unsignedIntegerValue], v518);
                            if (v172)
                            {
                              long long v173 = [NSNumber numberWithUnsignedInteger:v172];
                              long long v174 = [v167 objectForKey:v173];
                              if (!v174)
                              {
                                long long v174 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                                [v474 setObject:v174 forKey:v173];
                              }
                              double v175 = [v174 objectForKey:v164];
                              if (!v175)
                              {
                                double v175 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                                [v174 setObject:v175 forKey:v164];
                              }
                              [v175 addObject:v171];

                              double v167 = v474;
                            }
                          }
                          uint64_t v168 = [v166 countByEnumeratingWithState:&v629 objects:v769 count:16];
                          if (v168) {
                            continue;
                          }
                          break;
                        }
                      }
                      int v176 = 1;
LABEL_229:

                      if (!v176)
                      {
                        int v252 = 1;
                        goto LABEL_569;
                      }
                      id v503 = (char *)v503 + 1;
                    }
                    while (v503 != v483);
                    uint64_t v163 = [v463 countByEnumeratingWithState:&v633 objects:v770 count:16];
                  }
                  while (v163);
LABEL_232:

                  id v463 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                  v475 = [MEMORY[0x1E4F1CA80] set];
                  long long v628 = 0u;
                  long long v627 = 0u;
                  long long v626 = 0u;
                  long long v625 = 0u;
                  double v177 = [v506 keyEnumerator];
                  uint64_t v178 = [v177 countByEnumeratingWithState:&v625 objects:v768 count:16];
                  if (v178)
                  {
                    uint64_t v179 = *(void *)v626;
                    do
                    {
                      for (uint64_t i2 = 0; i2 != v178; ++i2)
                      {
                        if (*(void *)v626 != v179) {
                          objc_enumerationMutation(v177);
                        }
                        [v463 addObject:*(void *)(*((void *)&v625 + 1) + 8 * i2)];
                      }
                      uint64_t v178 = [v177 countByEnumeratingWithState:&v625 objects:v768 count:16];
                    }
                    while (v178);
                  }

                  char v404 = 0;
                  while (2)
                  {
                    if ([v463 count])
                    {
                      v413 = (void *)MEMORY[0x1C186D320]();
                      v479 = [v463 anyObject];
                      objc_msgSend(v463, "removeObject:");
                      if (v522 && ((*v509)(v507) & 1) != 0)
                      {
                        char v181 = 0;
                        goto LABEL_355;
                      }
                      v476 = [v506 objectForKey:v479];
                      id v504 = [v492 objectForKey:v479];
                      v484 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                      long long v624 = 0u;
                      long long v623 = 0u;
                      long long v622 = 0u;
                      long long v621 = 0u;
                      id v182 = [v476 keyEnumerator];
                      uint64_t v183 = [v182 countByEnumeratingWithState:&v621 objects:v767 count:16];
                      if (v183)
                      {
                        uint64_t v184 = *(void *)v622;
                        do
                        {
                          for (uint64_t i3 = 0; i3 != v183; ++i3)
                          {
                            if (*(void *)v622 != v184) {
                              objc_enumerationMutation(v182);
                            }
                            uint64_t v186 = *(void *)(*((void *)&v621 + 1) + 8 * i3);
                            id v187 = [v504 objectForKey:v186];
                            BOOL v188 = [v187 count] == 0;

                            if (v188) {
                              [v484 addObject:v186];
                            }
                          }
                          uint64_t v183 = [v182 countByEnumeratingWithState:&v621 objects:v767 count:16];
                        }
                        while (v183);
                      }

                      if ([v484 count])
                      {
                        if ((unint64_t)[v484 count] < 2)
                        {
                          id v194 = [v484 anyObject];
                          id v220 = (void *)MEMORY[0x1E4F1CA80];
                          v221 = [v518 objectForKey:v479];
                          double v222 = [v221 set];
                          v497 = [v220 setWithSet:v222];

                          v430 = [(NSMapTable *)v511 objectForKey:v194];
                          v409 = [(NSMapTable *)v467 objectForKey:v194];
                          v223 = [(NSMapTable *)v60 objectForKey:v194];
                          v407 = [v223 valueForKey:@"clusterSequenceNumber"];

                          contextc = [v474 objectForKey:v479];
                          id v224 = v194;
                          v405 = [contextc objectForKey:v194];
                          v469 = [MEMORY[0x1E4F1CA48] array];
                          v471 = (void *)[v497 mutableCopy];
                          [v471 intersectSet:v430];
                          if ([v471 count])
                          {
                            long long v603 = 0u;
                            long long v604 = 0u;
                            long long v601 = 0u;
                            long long v602 = 0u;
                            double v225 = [contextc keyEnumerator];
                            uint64_t v226 = [v225 countByEnumeratingWithState:&v601 objects:v762 count:16];
                            if (v226)
                            {
                              uint64_t v227 = *(void *)v602;
                              do
                              {
                                for (uint64_t i4 = 0; i4 != v226; ++i4)
                                {
                                  if (*(void *)v602 != v227) {
                                    objc_enumerationMutation(v225);
                                  }
                                  uint64_t v229 = *(void *)(*((void *)&v601 + 1) + 8 * i4);
                                  double v230 = [contextc objectForKey:v229];
                                  if ([v471 intersectsSet:v230]) {
                                    [v469 addObject:v229];
                                  }
                                }
                                uint64_t v226 = [v225 countByEnumeratingWithState:&v601 objects:v762 count:16];
                              }
                              while (v226);
                            }

                            id v224 = v194;
                          }
                          [v497 minusSet:v471];
                          [v497 minusSet:v409];
                          [v497 minusSet:v407];
                          [v497 minusSet:v405];
                          v461 = [MEMORY[0x1E4F1CA80] set];
                          v231 = (void *)[(NSMapTable *)v467 copy];
                          [v231 removeObjectForKey:v224];
                          long long v599 = 0u;
                          long long v600 = 0u;
                          long long v597 = 0u;
                          long long v598 = 0u;
                          v232 = [v231 keyEnumerator];
                          uint64_t v233 = [v232 countByEnumeratingWithState:&v597 objects:v761 count:16];
                          if (v233)
                          {
                            uint64_t v234 = *(void *)v598;
                            do
                            {
                              for (uint64_t i5 = 0; i5 != v233; ++i5)
                              {
                                if (*(void *)v598 != v234) {
                                  objc_enumerationMutation(v232);
                                }
                                uint64_t v236 = *(void *)(*((void *)&v597 + 1) + 8 * i5);
                                v237 = [v231 objectForKey:v236];
                                if ([v237 count]
                                  && [v237 intersectsSet:v497])
                                {
                                  [v461 addObject:v236];
                                  [v497 minusSet:v237];
                                }
                              }
                              uint64_t v233 = [v232 countByEnumeratingWithState:&v597 objects:v761 count:16];
                            }
                            while (v233);
                          }

                          double v238 = v194;
                          if ([v497 count])
                          {
                            double v239 = [v464 objectForKey:v194];
                            if (!v239)
                            {
                              double v239 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                              [v464 setObject:v239 forKey:v194];
                            }
                            [v239 unionSet:v497];
                            [v515 addObject:v194];
                            long long v595 = 0u;
                            long long v596 = 0u;
                            long long v593 = 0u;
                            long long v594 = 0u;
                            v240 = [contextc keyEnumerator];
                            uint64_t v241 = [v240 countByEnumeratingWithState:&v593 objects:v760 count:16];
                            if (v241)
                            {
                              uint64_t v242 = *(void *)v594;
                              do
                              {
                                for (uint64_t i6 = 0; i6 != v241; ++i6)
                                {
                                  if (*(void *)v594 != v242) {
                                    objc_enumerationMutation(v240);
                                  }
                                  uint64_t v244 = *(void *)(*((void *)&v593 + 1) + 8 * i6);
                                  v245 = [contextc objectForKey:v244];
                                  if ([v239 intersectsSet:v245]) {
                                    [v469 addObject:v244];
                                  }
                                }
                                uint64_t v241 = [v240 countByEnumeratingWithState:&v593 objects:v760 count:16];
                              }
                              while (v241);
                            }

                            if (v438 >= v437 && [v461 count])
                            {
                              int v246 = [v461 allObjects];
                              AddMergeCandidatePersonsForPerson(v432, v246, v194, @"single training person in level0 cluster - create 'training person : verified person with confirmed face' pair");
                            }
                            if ((unint64_t)[v461 count] >= 3 && (int)MediaAnalysisLogLevel() >= 3)
                            {
                              double v247 = VCPLogInstance();
                              if (os_log_type_enabled(v247, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)v779 = 138412290;
                                *(void *)&v779[4] = v461;
                                _os_log_impl(&dword_1BBEDA000, v247, OS_LOG_TYPE_ERROR, "PersonBuilder: We may have a dirty level0 cluster, verified persons with confirmed face: %@", v779, 0xCu);
                              }
                            }
                            if (v438 >= v437)
                            {
                              while ((unint64_t)[v461 count] >= 2)
                              {
                                v248 = [v461 anyObject];
                                [v461 removeObject:v248];
                                id v249 = [v461 allObjects];
                                AddMergeCandidatePersonsForPerson(v432, v249, v248, @"single training person in level0 cluster - create 'verified persons with confirmed face : verified persons with confirmed face' pair");
                              }
                            }

                            double v238 = v194;
                          }
                          if ([v469 count]) {
                            AddMergeCandidatePersonsForPerson(v466, v469, v238, @"invalid merge candidate pair because one person has face rejected for the other");
                          }
                        }
                        else
                        {
                          if ((int)MediaAnalysisLogLevel() >= 3)
                          {
                            double v189 = VCPLogInstance();
                            if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)v779 = 138412290;
                              *(void *)&v779[4] = v484;
                              _os_log_impl(&dword_1BBEDA000, v189, OS_LOG_TYPE_ERROR, "PersonBuilder: We may have a dirty level0 cluster, persons with training faces: %@", v779, 0xCu);
                            }
                          }
                          double v190 = [v484 allObjects];
                          AddMergeCandidatePersonsForPerson(v466, v190, v534, @"invalid merge candidate pair because we may have a dirty level0 cluster");

                          double v191 = (void *)MEMORY[0x1E4F1CA80];
                          v192 = [v518 objectForKey:v479];
                          double v193 = [v192 set];
                          id v194 = [v191 setWithSet:v193];

                          v497 = (void *)[(NSMapTable *)v511 copy];
                          [v497 removeObjectForKey:v534];
                          long long v612 = 0u;
                          long long v611 = 0u;
                          long long v610 = 0u;
                          long long v609 = 0u;
                          double v195 = [v497 keyEnumerator];
                          uint64_t v196 = [v195 countByEnumeratingWithState:&v609 objects:v764 count:16];
                          if (v196)
                          {
                            uint64_t v197 = *(void *)v610;
                            do
                            {
                              for (uint64_t i7 = 0; i7 != v196; ++i7)
                              {
                                if (*(void *)v610 != v197) {
                                  objc_enumerationMutation(v195);
                                }
                                uint64_t v199 = *(void *)(*((void *)&v609 + 1) + 8 * i7);
                                uint64_t v200 = [v497 objectForKey:v199];
                                uint64_t v201 = (void *)[v200 mutableCopy];

                                [v201 intersectSet:v194];
                                if ([v201 count])
                                {
                                  double v202 = [exc_buf objectForKey:v199];
                                  if (!v202)
                                  {
                                    double v202 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                                    [exc_buf setObject:v202 forKey:v199];
                                  }
                                  [v202 unionSet:v201];
                                  [v515 addObject:v199];
                                }
                              }
                              uint64_t v196 = [v195 countByEnumeratingWithState:&v609 objects:v764 count:16];
                            }
                            while (v196);
                          }

                          long long v607 = 0u;
                          long long v608 = 0u;
                          long long v605 = 0u;
                          long long v606 = 0u;
                          id v203 = v535;
                          uint64_t v204 = [v203 countByEnumeratingWithState:&v605 objects:v763 count:16];
                          if (v204)
                          {
                            uint64_t v205 = *(void *)v606;
                            do
                            {
                              for (uint64_t i8 = 0; i8 != v204; ++i8)
                              {
                                if (*(void *)v606 != v205) {
                                  objc_enumerationMutation(v203);
                                }
                                uint64_t v207 = *(void *)(*((void *)&v605 + 1) + 8 * i8);
                                double v208 = [(NSMapTable *)v510 objectForKey:v207];
                                double v209 = (void *)[v208 mutableCopy];

                                [v209 intersectSet:v194];
                                if ([v209 count])
                                {
                                  double v210 = [exc_buf objectForKey:v207];
                                  if (!v210)
                                  {
                                    double v210 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                                    [exc_buf setObject:v210 forKey:v207];
                                  }
                                  [v210 unionSet:v209];
                                  [v515 addObject:v207];
                                }
                              }
                              uint64_t v204 = [v203 countByEnumeratingWithState:&v605 objects:v763 count:16];
                            }
                            while (v204);
                          }

                          if (v438 < v437)
                          {
                            char v404 = 1;
                            goto LABEL_353;
                          }
                          v430 = (void *)[v484 mutableCopy];
                          while ((unint64_t)[v430 count] >= 2)
                          {
                            int v250 = [v430 anyObject];
                            [v430 removeObject:v250];
                            v251 = [v430 allObjects];
                            AddMergeCandidatePersonsForPerson(v432, v251, v250, @"multiple training persons in level0 cluster - create 'training person : training person' pair");
                          }
                          char v404 = 1;
                        }

LABEL_353:
                      }
                      else
                      {
                        [v463 removeObject:v479];
                        long long v620 = 0u;
                        long long v619 = 0u;
                        long long v618 = 0u;
                        long long v617 = 0u;
                        v211 = [v476 keyEnumerator];
                        uint64_t v212 = [v211 countByEnumeratingWithState:&v617 objects:v766 count:16];
                        if (v212)
                        {
                          uint64_t v213 = *(void *)v618;
                          do
                          {
                            for (uint64_t i9 = 0; i9 != v212; ++i9)
                            {
                              if (*(void *)v618 != v213) {
                                objc_enumerationMutation(v211);
                              }
                              uint64_t v215 = *(void *)(*((void *)&v617 + 1) + 8 * i9);
                              v216 = [v512 objectForKey:v215];
                              [v216 removeObject:v479];
                              if (![v216 count]) {
                                [v512 removeObjectForKey:v215];
                              }
                              [v475 addObject:v215];
                            }
                            uint64_t v212 = [v211 countByEnumeratingWithState:&v617 objects:v766 count:16];
                          }
                          while (v212);
                        }

                        long long v616 = 0u;
                        long long v615 = 0u;
                        long long v614 = 0u;
                        long long v613 = 0u;
                        id v194 = v475;
                        uint64_t v217 = [v194 countByEnumeratingWithState:&v613 objects:v765 count:16];
                        if (v217)
                        {
                          uint64_t v218 = *(void *)v614;
                          do
                          {
                            for (uint64_t i10 = 0; i10 != v217; ++i10)
                            {
                              if (*(void *)v614 != v218) {
                                objc_enumerationMutation(v194);
                              }
                              [v476 removeObjectForKey:*(void *)(*((void *)&v613 + 1) + 8 * i10)];
                            }
                            uint64_t v217 = [v194 countByEnumeratingWithState:&v613 objects:v765 count:16];
                          }
                          while (v217);
                        }
                      }

                      char v181 = 1;
LABEL_355:

                      if ((v181 & 1) == 0)
                      {
                        int v252 = 1;
                        goto LABEL_568;
                      }
                      continue;
                    }
                    break;
                  }
                  unint64_t v285 = [v512 count];
                  if (v404 & 1 | (v285 > 3))
                  {
                    long long v591 = 0u;
                    long long v592 = 0u;
                    long long v589 = 0u;
                    long long v590 = 0u;
                    v286 = [v512 keyEnumerator];
                    uint64_t v287 = [v286 countByEnumeratingWithState:&v589 objects:v759 count:16];
                    if (v287)
                    {
                      uint64_t v288 = *(void *)v590;
                      do
                      {
                        for (uint64_t i11 = 0; i11 != v287; ++i11)
                        {
                          if (*(void *)v590 != v288) {
                            objc_enumerationMutation(v286);
                          }
                          uint64_t v758 = *(void *)(*((void *)&v589 + 1) + 8 * i11);
                          double v290 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v758 count:1];
                          AddMergeCandidatePersonsForPerson(v466, v290, v534, @"invalid merge candidate pair because we have > 3 verified persons in the face group");
                        }
                        uint64_t v287 = [v286 countByEnumeratingWithState:&v589 objects:v759 count:16];
                      }
                      while (v287);
                    }
                  }
                  contextd = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v512, "count"));
                  long long v587 = 0u;
                  long long v588 = 0u;
                  long long v585 = 0u;
                  long long v586 = 0u;
                  __int16 v291 = [v512 keyEnumerator];
                  uint64_t v292 = [v291 countByEnumeratingWithState:&v585 objects:v757 count:16];
                  if (v292)
                  {
                    uint64_t v293 = *(void *)v586;
                    do
                    {
                      for (uint64_t i12 = 0; i12 != v292; ++i12)
                      {
                        if (*(void *)v586 != v293) {
                          objc_enumerationMutation(v291);
                        }
                        [contextd addObject:*(void *)(*((void *)&v585 + 1) + 8 * i12)];
                      }
                      uint64_t v292 = [v291 countByEnumeratingWithState:&v585 objects:v757 count:16];
                    }
                    while (v292);
                  }

                  if (![v418 count])
                  {
                    if (v285 || [v475 count])
                    {
                      if ([contextd count] == 1
                        && ([contextd anyObject], (uint64_t v295 = objc_claimAutoreleasedReturnValue()) != 0))
                      {
                        [v468 objectForKey:v295];
                        v431 = (void *)v295;
                        id v410 = (id)objc_claimAutoreleasedReturnValue();

                        char v414 = 0;
                      }
                      else
                      {
                        id v410 = 0;
                        v431 = 0;
                        char v414 = 1;
                      }
                      uint64_t v408 = [v410 count];
                      long long v575 = 0u;
                      long long v576 = 0u;
                      long long v573 = 0u;
                      long long v574 = 0u;
                      double v296 = v522;
                      id v419 = [v518 keyEnumerator];
                      uint64_t v458 = [v419 countByEnumeratingWithState:&v573 objects:v754 count:16];
                      if (!v458) {
                        goto LABEL_553;
                      }
                      uint64_t v423 = *(void *)v574;
                      while (2)
                      {
                        uint64_t v472 = 0;
LABEL_445:
                        if (*(void *)v574 != v423) {
                          objc_enumerationMutation(v419);
                        }
                        uint64_t v297 = *(void *)(*((void *)&v573 + 1) + 8 * v472);
                        if (v296 && ((*v509)(v507) & 1) != 0)
                        {

                          int v252 = 1;
                          v366 = v431;
                          goto LABEL_566;
                        }
                        v470 = [v492 objectForKey:v297];
                        if ([v463 containsObject:v297]) {
                          goto LABEL_551;
                        }
                        if (v414)
                        {
                          double v298 = (void *)MEMORY[0x1E4F1CA80];
                          __int16 v299 = [v518 objectForKey:v297];
                          double v300 = [v299 set];
                          v498 = [v298 setWithSet:v300];

                          id v505 = (id)[(NSMapTable *)v511 copy];
                          __int16 v301 = [v492 objectForKey:v297];
                          v462 = v301;
                          if (v301)
                          {
                            double v302 = (void *)MEMORY[0x1E4F1CA80];
                            __int16 v303 = NSAllMapTableKeys(v301);
                            double v304 = [v302 setWithArray:v303];

                            __int16 v301 = v304;
                          }
                          __int16 v305 = v301;
                          [(NSMapTable *)v301 intersectSet:v475];
                          [v505 removeObjectForKey:v534];
                          long long v559 = 0u;
                          long long v560 = 0u;
                          long long v557 = 0u;
                          long long v558 = 0u;
                          id v306 = contextd;
                          uint64_t v307 = [v306 countByEnumeratingWithState:&v557 objects:v750 count:16];
                          if (v307)
                          {
                            uint64_t v308 = *(void *)v558;
                            do
                            {
                              for (uint64_t i13 = 0; i13 != v307; ++i13)
                              {
                                if (*(void *)v558 != v308) {
                                  objc_enumerationMutation(v306);
                                }
                                [v505 removeObjectForKey:*(void *)(*((void *)&v557 + 1) + 8 * i13)];
                              }
                              uint64_t v307 = [v306 countByEnumeratingWithState:&v557 objects:v750 count:16];
                            }
                            while (v307);
                          }

                          long long v555 = 0u;
                          long long v556 = 0u;
                          long long v553 = 0u;
                          long long v554 = 0u;
                          v310 = [v505 keyEnumerator];
                          uint64_t v311 = [v310 countByEnumeratingWithState:&v553 objects:v749 count:16];
                          if (v311)
                          {
                            uint64_t v312 = *(void *)v554;
                            do
                            {
                              for (uint64_t i14 = 0; i14 != v311; ++i14)
                              {
                                if (*(void *)v554 != v312) {
                                  objc_enumerationMutation(v310);
                                }
                                uint64_t v314 = *(void *)(*((void *)&v553 + 1) + 8 * i14);
                                if ([v305 containsObject:v314])
                                {
                                  v315 = [(NSMapTable *)v511 objectForKey:v314];
                                  v316 = (void *)[v315 mutableCopy];

                                  [v316 intersectSet:v498];
                                  if ([v316 count])
                                  {
                                    v317 = [exc_buf objectForKey:v314];
                                    if (!v317)
                                    {
                                      v317 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                                      [exc_buf setObject:v317 forKey:v314];
                                    }
                                    [v317 unionSet:v316];
                                    [v515 addObject:v314];
                                  }
                                }
                              }
                              uint64_t v311 = [v310 countByEnumeratingWithState:&v553 objects:v749 count:16];
                            }
                            while (v311);
                          }

                          uint64_t v318 = (void *)[v535 mutableCopy];
                          long long v551 = 0u;
                          long long v552 = 0u;
                          long long v549 = 0u;
                          long long v550 = 0u;
                          id v319 = v306;
                          uint64_t v320 = [v319 countByEnumeratingWithState:&v549 objects:v748 count:16];
                          if (v320)
                          {
                            uint64_t v321 = *(void *)v550;
                            do
                            {
                              for (uint64_t i15 = 0; i15 != v320; ++i15)
                              {
                                if (*(void *)v550 != v321) {
                                  objc_enumerationMutation(v319);
                                }
                                [v318 removeObject:*(void *)(*((void *)&v549 + 1) + 8 * i15)];
                              }
                              uint64_t v320 = [v319 countByEnumeratingWithState:&v549 objects:v748 count:16];
                            }
                            while (v320);
                          }

                          long long v547 = 0u;
                          long long v548 = 0u;
                          long long v545 = 0u;
                          long long v546 = 0u;
                          id v323 = v318;
                          uint64_t v324 = [v323 countByEnumeratingWithState:&v545 objects:v747 count:16];
                          if (v324)
                          {
                            uint64_t v325 = *(void *)v546;
                            do
                            {
                              for (uint64_t i16 = 0; i16 != v324; ++i16)
                              {
                                if (*(void *)v546 != v325) {
                                  objc_enumerationMutation(v323);
                                }
                                uint64_t v327 = *(void *)(*((void *)&v545 + 1) + 8 * i16);
                                if ([v305 containsObject:v327])
                                {
                                  v328 = [(NSMapTable *)v510 objectForKey:v327];
                                  v329 = (void *)[v328 mutableCopy];

                                  [v329 intersectSet:v498];
                                  if ([v329 count])
                                  {
                                    v330 = [exc_buf objectForKey:v327];
                                    if (!v330)
                                    {
                                      v330 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                                      [exc_buf setObject:v330 forKey:v327];
                                    }
                                    [v330 unionSet:v329];
                                    [v515 addObject:v327];
                                  }
                                }
                              }
                              uint64_t v324 = [v323 countByEnumeratingWithState:&v545 objects:v747 count:16];
                            }
                            while (v324);
                          }

                          goto LABEL_549;
                        }
                        v498 = [v470 objectForKey:v431];
                        v331 = (void *)MEMORY[0x1E4F1CA80];
                        v332 = [v518 objectForKey:v297];
                        v333 = [v332 set];
                        id v505 = [v331 setWithSet:v333];

                        v462 = [(NSMapTable *)v511 objectForKey:v431];
                        if ([v498 count])
                        {
                          __int16 v305 = [exc_buf objectForKey:v431];
                          if (!v305)
                          {
                            __int16 v305 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                            [exc_buf setObject:v305 forKey:v431];
                          }
                          [v505 intersectSet:v462];
                          [v305 unionSet:v505];
                          [v515 addObject:v431];
                          if ((int)MediaAnalysisLogLevel() >= 6)
                          {
                            v334 = VCPLogInstance();
                            if (os_log_type_enabled(v334, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)v779 = 138412290;
                              *(void *)&v779[4] = v505;
                              _os_log_impl(&dword_1BBEDA000, v334, OS_LOG_TYPE_INFO, "PersonBuilder: Found training rejection, unassigned faces on trainingPersonLocalIdentifier in level0 cluster: %@", v779, 0xCu);
                            }
                          }
                          goto LABEL_549;
                        }
                        if (v408)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 6)
                          {
                            v335 = VCPLogInstance();
                            if (os_log_type_enabled(v335, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)v779 = 138412290;
                              *(void *)&v779[4] = v431;
                              __int16 v305 = v335;
                              _os_log_impl(&dword_1BBEDA000, v335, OS_LOG_TYPE_INFO, "PersonBuilder: Skip processing level0 cluster since we have rejected face for training person '%@' in level1 cluster", v779, 0xCu);
                            }
                            else
                            {
                              __int16 v305 = v335;
                            }
                            goto LABEL_549;
                          }
                        }
                        else
                        {
                          __int16 v305 = [(NSMapTable *)v467 objectForKey:v431];
                          v336 = [(NSMapTable *)v60 objectForKey:v431];
                          v406 = [v336 valueForKey:@"clusterSequenceNumber"];

                          v337 = [v474 objectForKey:v297];
                          v403 = [v337 objectForKey:v431];
                          v485 = [MEMORY[0x1E4F1CA48] array];
                          v338 = (void *)[v505 mutableCopy];
                          v480 = v338;
                          [v338 intersectSet:v462];
                          if ([v338 count])
                          {
                            long long v571 = 0u;
                            long long v572 = 0u;
                            long long v569 = 0u;
                            long long v570 = 0u;
                            v339 = [v337 keyEnumerator];
                            uint64_t v340 = [v339 countByEnumeratingWithState:&v569 objects:v753 count:16];
                            if (v340)
                            {
                              uint64_t v341 = *(void *)v570;
                              do
                              {
                                for (uint64_t i17 = 0; i17 != v340; ++i17)
                                {
                                  if (*(void *)v570 != v341) {
                                    objc_enumerationMutation(v339);
                                  }
                                  uint64_t v343 = *(void *)(*((void *)&v569 + 1) + 8 * i17);
                                  v344 = [v337 objectForKey:v343];
                                  if ([v480 intersectsSet:v344]) {
                                    [v485 addObject:v343];
                                  }
                                }
                                uint64_t v340 = [v339 countByEnumeratingWithState:&v569 objects:v753 count:16];
                              }
                              while (v340);
                            }

                            v338 = v480;
                          }
                          [v505 minusSet:v338];
                          [v505 minusSet:v305];
                          [v505 minusSet:v406];
                          [v505 minusSet:v403];
                          v477 = [MEMORY[0x1E4F1CA80] set];
                          v402 = (void *)[(NSMapTable *)v467 copy];
                          [v402 removeObjectForKey:v431];
                          long long v567 = 0u;
                          long long v568 = 0u;
                          long long v565 = 0u;
                          long long v566 = 0u;
                          v345 = [(NSMapTable *)v467 keyEnumerator];
                          uint64_t v346 = [v345 countByEnumeratingWithState:&v565 objects:v752 count:16];
                          if (v346)
                          {
                            uint64_t v347 = *(void *)v566;
                            do
                            {
                              for (uint64_t i18 = 0; i18 != v346; ++i18)
                              {
                                if (*(void *)v566 != v347) {
                                  objc_enumerationMutation(v345);
                                }
                                uint64_t v349 = *(void *)(*((void *)&v565 + 1) + 8 * i18);
                                v350 = [(NSMapTable *)v467 objectForKey:v349];
                                if ([v350 count]
                                  && [v350 intersectsSet:v505])
                                {
                                  [v477 addObject:v349];
                                  [v505 minusSet:v350];
                                }
                              }
                              uint64_t v346 = [v345 countByEnumeratingWithState:&v565 objects:v752 count:16];
                            }
                            while (v346);
                          }

                          if ([v505 count])
                          {
                            v351 = [v464 objectForKey:v431];
                            if (!v351)
                            {
                              v351 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                              [v464 setObject:v351 forKey:v431];
                            }
                            [v351 unionSet:v505];
                            [v515 addObject:v431];
                            long long v563 = 0u;
                            long long v564 = 0u;
                            long long v561 = 0u;
                            long long v562 = 0u;
                            v352 = [v337 keyEnumerator];
                            uint64_t v353 = [v352 countByEnumeratingWithState:&v561 objects:v751 count:16];
                            if (v353)
                            {
                              uint64_t v354 = *(void *)v562;
                              do
                              {
                                for (uint64_t i19 = 0; i19 != v353; ++i19)
                                {
                                  if (*(void *)v562 != v354) {
                                    objc_enumerationMutation(v352);
                                  }
                                  uint64_t v356 = *(void *)(*((void *)&v561 + 1) + 8 * i19);
                                  v357 = [v337 objectForKey:v356];
                                  if ([v351 intersectsSet:v357]) {
                                    [v485 addObject:v356];
                                  }
                                }
                                uint64_t v353 = [v352 countByEnumeratingWithState:&v561 objects:v751 count:16];
                              }
                              while (v353);
                            }

                            if (v438 >= v437)
                            {
                              uint64_t v358 = [v477 count];
                              v359 = v477;
                              if (v358)
                              {
                                v360 = [v477 allObjects];
                                AddMergeCandidatePersonsForPerson(v432, v360, v431, @"single training person in level1 cluster - create 'training person : verified person with confirmed face' pair");
                                goto LABEL_542;
                              }
                              while ((unint64_t)[v359 count] >= 2)
                              {
                                v360 = [v477 anyObject];
                                [v477 removeObject:v360];
                                v361 = [v477 allObjects];
                                AddMergeCandidatePersonsForPerson(v432, v361, v360, @"single training person in level1 cluster - create 'verified persons with confirmed face : verified persons with confirmed face' pair");

LABEL_542:
                                v359 = v477;
                              }
                            }
                          }
                          if ([v485 count]) {
                            AddMergeCandidatePersonsForPerson(v466, v485, v431, @"invalid merge candidate pair because one person has face rejected for the other");
                          }

LABEL_549:
                        }

LABEL_551:
                        ++v472;
                        double v296 = v522;
                        if (v472 == v458)
                        {
                          uint64_t v458 = [v419 countByEnumeratingWithState:&v573 objects:v754 count:16];
                          if (v458) {
                            continue;
                          }
LABEL_553:
                          v422 = v410;
LABEL_554:

                          v362 = v431;
                          goto LABEL_555;
                        }
                        goto LABEL_445;
                      }
                    }
                    v431 = (void *)[(NSMapTable *)v511 copy];
                    [v431 removeObjectForKey:v534];
                    long long v583 = 0u;
                    long long v584 = 0u;
                    long long v581 = 0u;
                    long long v582 = 0u;
                    v385 = [v431 keyEnumerator];
                    uint64_t v386 = [v385 countByEnumeratingWithState:&v581 objects:v756 count:16];
                    if (v386)
                    {
                      uint64_t v387 = *(void *)v582;
                      do
                      {
                        for (uint64_t i20 = 0; i20 != v386; ++i20)
                        {
                          if (*(void *)v582 != v387) {
                            objc_enumerationMutation(v385);
                          }
                          uint64_t v389 = *(void *)(*((void *)&v581 + 1) + 8 * i20);
                          v390 = [(NSMapTable *)v511 objectForKey:v389];
                          if ([v390 count])
                          {
                            v391 = [exc_buf objectForKey:v389];
                            if (!v391)
                            {
                              v391 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                              [exc_buf setObject:v391 forKey:v389];
                            }
                            [v391 unionSet:v390];
                            [v515 addObject:v389];
                          }
                        }
                        uint64_t v386 = [v385 countByEnumeratingWithState:&v581 objects:v756 count:16];
                      }
                      while (v386);
                    }

                    long long v579 = 0u;
                    long long v580 = 0u;
                    long long v577 = 0u;
                    long long v578 = 0u;
                    id v392 = v535;
                    uint64_t v393 = [v392 countByEnumeratingWithState:&v577 objects:v755 count:16];
                    if (v393)
                    {
                      uint64_t v394 = *(void *)v578;
                      do
                      {
                        for (uint64_t i21 = 0; i21 != v393; ++i21)
                        {
                          if (*(void *)v578 != v394) {
                            objc_enumerationMutation(v392);
                          }
                          uint64_t v396 = *(void *)(*((void *)&v577 + 1) + 8 * i21);
                          v397 = [(NSMapTable *)v510 objectForKey:v396];
                          if ([v397 count])
                          {
                            v398 = [exc_buf objectForKey:v396];
                            if (!v398)
                            {
                              v398 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                              [exc_buf setObject:v398 forKey:v396];
                            }
                            [v398 unionSet:v397];
                            [v515 addObject:v396];
                          }
                        }
                        uint64_t v393 = [v392 countByEnumeratingWithState:&v577 objects:v755 count:16];
                      }
                      while (v393);
                    }

                    v362 = v431;
                    if ([exc_buf count] && (int)MediaAnalysisLogLevel() >= 4)
                    {
                      v399 = VCPLogInstance();
                      id v419 = v399;
                      if (os_log_type_enabled(v399, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v779 = 138412546;
                        *(void *)&v779[4] = v457;
                        *(_WORD *)&v779[12] = 2112;
                        *(void *)&v779[14] = exc_buf;
                        _os_log_impl(&dword_1BBEDA000, v399, OS_LOG_TYPE_DEFAULT, "PersonBuilder: Unnamed unconfirmed faces in face group, '%@', without a training face: %@", v779, 0x16u);
                      }
                      goto LABEL_554;
                    }
LABEL_555:
                  }
                  if ((unint64_t)[contextd count] > 3) {
                    goto LABEL_563;
                  }
                  if (v438 >= v437)
                  {
                    v363 = (void *)[contextd mutableCopy];
                    while ((unint64_t)[v363 count] >= 2)
                    {
                      v364 = [v363 anyObject];
                      [v363 removeObject:v364];
                      v365 = [v363 allObjects];
                      AddMergeCandidatePersonsForPerson(v432, v365, v364, @"level1 cluster - create 'training person : training person' pair");
                    }
                  }
                  if (v404)
                  {
LABEL_563:
                    int v252 = 0;
                  }
                  else
                  {
                    v366 = [contextd allObjects];
                    AddMergeCandidatePersonsForPerson(v432, v366, v534, @"level1 cluster - create 'unverifed person : training person' pair");
                    int v252 = 0;
                    id v410 = v422;
LABEL_566:

                    v422 = v410;
                  }

LABEL_568:
LABEL_569:

                  float v148 = v474;
                  goto LABEL_570;
                }
                v508 = [v464 objectForKey:v500];
                if (!v508)
                {
                  v508 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                  [v464 setObject:v508 forKey:v500];
                }
                id v513 = [(NSMapTable *)v511 objectForKey:v534];
                if ([v424 count]) {
                  [v513 minusSet:v424];
                }
                if ([v513 count])
                {
                  [v508 unionSet:v513];
                  [v515 addObject:v500];
                }
                v519 = (void *)[(NSMapTable *)v511 copy];
                [v519 removeObjectForKey:v534];
                [v519 removeObjectForKey:v500];
                v530 = [MEMORY[0x1E4F1CA48] array];
                long long v668 = 0u;
                long long v667 = 0u;
                long long v666 = 0u;
                long long v665 = 0u;
                v253 = [v519 keyEnumerator];
                uint64_t v254 = [v253 countByEnumeratingWithState:&v665 objects:v786 count:16];
                if (v254)
                {
                  uint64_t v255 = *(void *)v666;
                  do
                  {
                    for (uint64_t i22 = 0; i22 != v254; ++i22)
                    {
                      if (*(void *)v666 != v255) {
                        objc_enumerationMutation(v253);
                      }
                      uint64_t v257 = *(void *)(*((void *)&v665 + 1) + 8 * i22);
                      uint64_t v258 = [v519 objectForKey:v257];
                      if ([v258 count])
                      {
                        v259 = [exc_buf objectForKey:v257];
                        if (!v259)
                        {
                          v259 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                          [exc_buf setObject:v259 forKey:v257];
                        }
                        [v259 unionSet:v258];
                        [v530 addObject:v257];
                        [v515 addObject:v257];
                      }
                    }
                    uint64_t v254 = [v253 countByEnumeratingWithState:&v665 objects:v786 count:16];
                  }
                  while (v254);
                }

                long long v664 = 0u;
                long long v663 = 0u;
                long long v662 = 0u;
                long long v661 = 0u;
                v260 = [v465 keyEnumerator];
                v261 = v260;
                uint64_t v262 = 0;
                uint64_t v263 = 0;
                uint64_t v264 = [v260 countByEnumeratingWithState:&v661 objects:v785 count:16];
                if (!v264)
                {
LABEL_399:

                  if ((int)MediaAnalysisLogLevel() >= 6)
                  {
                    v275 = VCPLogInstance();
                    if (os_log_type_enabled(v275, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v779 = 134218240;
                      *(void *)&v779[4] = v263;
                      *(_WORD *)&v779[12] = 2048;
                      *(void *)&v779[14] = v262;
                      _os_log_impl(&dword_1BBEDA000, v275, OS_LOG_TYPE_INFO, "PersonBuilder: Quick classification face: %lu retained, %lu reassigned", v779, 0x16u);
                    }
                  }
                  v276 = (void *)[v535 mutableCopy];
                  [v276 removeObject:v500];
                  long long v660 = 0u;
                  long long v659 = 0u;
                  long long v658 = 0u;
                  long long v657 = 0u;
                  id v277 = v276;
                  uint64_t v278 = [v277 countByEnumeratingWithState:&v657 objects:v784 count:16];
                  if (v278)
                  {
                    uint64_t v279 = *(void *)v658;
                    do
                    {
                      for (uint64_t i23 = 0; i23 != v278; ++i23)
                      {
                        if (*(void *)v658 != v279) {
                          objc_enumerationMutation(v277);
                        }
                        uint64_t v281 = *(void *)(*((void *)&v657 + 1) + 8 * i23);
                        id v282 = [(NSMapTable *)v510 objectForKey:v281];
                        if ([v282 count])
                        {
                          id v283 = [exc_buf objectForKey:v281];
                          if (!v283)
                          {
                            id v283 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                            [exc_buf setObject:v283 forKey:v281];
                          }
                          [v283 unionSet:v282];
                          [v530 addObject:v281];
                          [v515 addObject:v281];
                        }
                      }
                      uint64_t v278 = [v277 countByEnumeratingWithState:&v657 objects:v784 count:16];
                    }
                    while (v278);
                  }

                  if ([v530 count])
                  {
                    id v783 = v500;
                    id v284 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v783 count:1];
                    AddMergeCandidatePersonsForPerson(v432, v284, v534, @"all training faces on single verified person in level1 cluster - create 'unverified person : training person' candidate pair");

                    if ([v530 count] == 1)
                    {
                      AddMergeCandidatePersonsForPerson(v432, v530, v534, @"all training faces on single verified person in level1 cluster - create 'unverified person : verified person' candidate pair");
                      if (v438 >= v437) {
                        AddMergeCandidatePersonsForPerson(v432, v530, v500, @"all training faces on single verified person in level1 cluster - create 'training person : verified person' candidate pair");
                      }
                    }
                  }

                  goto LABEL_573;
                }
                uint64_t v265 = *(void *)v662;
                while (2)
                {
                  uint64_t v266 = 0;
LABEL_380:
                  if (*(void *)v662 != v265) {
                    objc_enumerationMutation(v261);
                  }
                  v267 = *(void **)(*((void *)&v661 + 1) + 8 * v266);
                  v268 = [v465 objectForKey:v267];
                  if ([v268 count])
                  {
                    if ([v267 isEqualToString:v500])
                    {
                      v269 = [v464 objectForKey:v500];
                      if (!v269)
                      {
                        v269 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                        [v464 setObject:v269 forKey:v500];
                      }
                      [v269 unionSet:v268];
                      [v515 addObject:v500];
                      v263 += [v268 count];
                      if ((int)MediaAnalysisLogLevel() >= 6)
                      {
                        v270 = VCPLogInstance();
                        if (os_log_type_enabled(v270, OS_LOG_TYPE_INFO))
                        {
                          uint64_t v271 = [v268 count];
                          *(_DWORD *)v779 = 134218242;
                          *(void *)&v779[4] = v271;
                          *(_WORD *)&v779[12] = 2112;
                          *(void *)&v779[14] = v268;
                          v272 = v270;
                          v273 = "%lu Quick classification face to retain: %@";
                          goto LABEL_394;
                        }
                        goto LABEL_395;
                      }
                    }
                    else
                    {
                      v269 = [exc_buf objectForKey:v267];
                      if (!v269)
                      {
                        v269 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                        [exc_buf setObject:v269 forKey:v267];
                      }
                      [v269 unionSet:v268];
                      [v515 addObject:v267];
                      v262 += [v268 count];
                      if ((int)MediaAnalysisLogLevel() >= 6)
                      {
                        v270 = VCPLogInstance();
                        if (os_log_type_enabled(v270, OS_LOG_TYPE_INFO))
                        {
                          uint64_t v274 = [v268 count];
                          *(_DWORD *)v779 = 134218242;
                          *(void *)&v779[4] = v274;
                          *(_WORD *)&v779[12] = 2112;
                          *(void *)&v779[14] = v268;
                          v272 = v270;
                          v273 = "%lu Quick classification face to reassign: %@";
LABEL_394:
                          _os_log_impl(&dword_1BBEDA000, v272, OS_LOG_TYPE_INFO, v273, v779, 0x16u);
                        }
LABEL_395:
                      }
                    }
                  }
                  if (v264 == ++v266)
                  {
                    v260 = v261;
                    uint64_t v264 = [v261 countByEnumeratingWithState:&v661 objects:v785 count:16];
                    if (!v264) {
                      goto LABEL_399;
                    }
                    continue;
                  }
                  goto LABEL_380;
                }
              }
              id v500 = v524;
              long long v678 = 0u;
              long long v679 = 0u;
              long long v680 = 0u;
              long long v681 = 0u;
              uint64_t v92 = [v468 keyEnumerator];
              uint64_t v93 = [v92 countByEnumeratingWithState:&v678 objects:v789 count:16];
              if (v93)
              {
                uint64_t v94 = *(void *)v679;
                do
                {
                  for (uint64_t i24 = 0; i24 != v93; ++i24)
                  {
                    if (*(void *)v679 != v94) {
                      objc_enumerationMutation(v92);
                    }
                    uint64_t v96 = *(void *)(*((void *)&v678 + 1) + 8 * i24);
                    id v97 = [(NSMapTable *)v511 objectForKey:v96];
                    if ([v97 count])
                    {
                      id v98 = [exc_buf objectForKey:v96];
                      if (!v98)
                      {
                        id v98 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                        [exc_buf setObject:v98 forKey:v96];
                      }
                      [v98 unionSet:v97];
                      [v515 addObject:v96];
                    }
                  }
                  uint64_t v93 = [v92 countByEnumeratingWithState:&v678 objects:v789 count:16];
                }
                while (v93);
              }

              if ((unint64_t)[v500 count] >= 2)
              {
                long long v677 = 0u;
                long long v676 = 0u;
                long long v675 = 0u;
                long long v674 = 0u;
                id v99 = [v523 keyEnumerator];
                uint64_t v100 = [v99 countByEnumeratingWithState:&v674 objects:v788 count:16];
                if (v100)
                {
                  uint64_t v101 = *(void *)v675;
                  do
                  {
                    for (uint64_t i25 = 0; i25 != v100; ++i25)
                    {
                      if (*(void *)v675 != v101) {
                        objc_enumerationMutation(v99);
                      }
                      uint64_t v103 = *(void *)(*((void *)&v674 + 1) + 8 * i25);
                      uint64_t v104 = [(NSMapTable *)v511 objectForKey:v103];
                      if ([v104 count])
                      {
                        uint64_t v105 = [exc_buf objectForKey:v103];
                        if (!v105)
                        {
                          uint64_t v105 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                          [exc_buf setObject:v105 forKey:v103];
                        }
                        [v105 unionSet:v104];
                        [v515 addObject:v103];
                      }
                    }
                    uint64_t v100 = [v99 countByEnumeratingWithState:&v674 objects:v788 count:16];
                  }
                  while (v100);
                }
              }
              long long v673 = 0u;
              long long v672 = 0u;
              long long v671 = 0u;
              long long v670 = 0u;
              id v106 = v535;
              uint64_t v107 = [v106 countByEnumeratingWithState:&v670 objects:v787 count:16];
              if (v107)
              {
                uint64_t v108 = *(void *)v671;
                do
                {
                  for (uint64_t i26 = 0; i26 != v107; ++i26)
                  {
                    if (*(void *)v671 != v108) {
                      objc_enumerationMutation(v106);
                    }
                    uint64_t v110 = *(void *)(*((void *)&v670 + 1) + 8 * i26);
                    id v111 = [(NSMapTable *)v510 objectForKey:v110];
                    if ([v111 count])
                    {
                      id v112 = [exc_buf objectForKey:v110];
                      if (!v112)
                      {
                        id v112 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
                        [exc_buf setObject:v112 forKey:v110];
                      }
                      [v112 unionSet:v111];
                      [v515 addObject:v110];
                      [v500 addObject:v110];
                    }
                  }
                  uint64_t v107 = [v106 countByEnumeratingWithState:&v670 objects:v787 count:16];
                }
                while (v107);
              }

              if ([v500 count] == 1)
              {
                long long v113 = [v500 allObjects];
                AddMergeCandidatePersonsForPerson(v432, v113, v534, @"no training faces in level1 cluster - create 'unverified person : verified/migrated person' candidate pair");
              }
              id v669 = 0;
              char v114 = v425[2](v425, &v669);
              id v424 = v669;
              if ((v114 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
              {
                long long v115 = VCPLogInstance();
                v422 = v115;
                if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v779 = 138412290;
                  *(void *)&v779[4] = v424;
                  _os_log_impl(&dword_1BBEDA000, v115, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to build persons [Error: '%@']", v779, 0xCu);
                }
                int v55 = 15;
                goto LABEL_604;
              }
              int v55 = 15;
LABEL_605:

LABEL_606:
LABEL_607:
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                id v75 = VCPLogInstance();
                v440 = v75;
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v779 = 138412802;
                  *(void *)&v779[4] = v457;
                  *(_WORD *)&v779[12] = 2112;
                  *(void *)&v779[14] = v449;
                  *(_WORD *)&v779[22] = 2112;
                  v780 = (uint64_t (*)(uint64_t, uint64_t))v534;
                  _os_log_impl(&dword_1BBEDA000, v75, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to find unverified person [unverifiedPerson: %@, unverifiedPersonLocalIdentifier: %@] for faceGroup '%@', skipping this face group", v779, 0x20u);
                }
                int v55 = 15;
                goto LABEL_607;
              }
              int v55 = 15;
            }

            goto LABEL_609;
          }
          int v55 = 1;
LABEL_610:
          if (v55 != 15 && v55) {
            goto LABEL_641;
          }
          ++v460;
        }
        while (v460 != v444);
        uint64_t v400 = [obj countByEnumeratingWithState:&v724 objects:v796 count:16];
        uint64_t v444 = v400;
      }
      while (v400);
    }
LABEL_641:
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_646;
    }
    v401 = VCPLogInstance();
    v411 = v401;
    if (os_log_type_enabled(v401, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v779 = 0;
      _os_log_impl(&dword_1BBEDA000, v401, OS_LOG_TYPE_ERROR, "PersonBuilder: Got a 'nil' photoLibrary. Cannot build persons", v779, 2u);
    }
  }

LABEL_646:
}

void __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v6 = (void *)[v4 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1C186D320](v8);
        uint64_t v14 = *(void *)(a1 + 48);
        if (v14 && (*(unsigned int (**)(uint64_t))(v14 + 16))(v14))
        {
          int v15 = 0;
          if (a2) {
            *a2 = 1;
          }
        }
        else
        {
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesInFaceGroup:options:", v12, v6, (void)v18);
          if ([v16 count])
          {
            uint64_t v17 = [MEMORY[0x1E4F39088] creationRequestForFaceGroup];
            [v17 addFaces:v16];
            [v17 setPersonBuilderState:1];
          }
          int v15 = 1;
        }
        if (!v15)
        {

          goto LABEL_18;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }

  [MEMORY[0x1E4F39088] deleteFaceGroups:*(void *)(a1 + 40)];
LABEL_18:
}

void __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_622(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1C186D320]();
  uint64_t v10 = *(void *)(a1 + 72);
  if (v10 && (*(unsigned int (**)(void))(v10 + 16))())
  {
    *a4 = 1;
  }
  else
  {
    id v16 = 0;
    id v17 = 0;
    id v15 = 0;
    [*(id *)(a1 + 32) _getRejectedTrainingFaceCSNs:&v17 rejectedFaceCSNs:&v16 rejectedPersonLocalIdentifiers:&v15 forPerson:v7 faceInFaceGroupByCSN:*(void *)(a1 + 40)];
    id v11 = v17;
    id v12 = v16;
    id v13 = v15;
    if ([v11 count]) {
      [*(id *)(a1 + 48) setObject:v11 forKey:v8];
    }
    if ([v12 count]) {
      [*(id *)(a1 + 56) setObject:v12 forKey:v8];
    }
    if ([v13 count])
    {
      uint64_t v14 = [*(id *)(a1 + 64) objectForKey:v8];
      if (!v14)
      {
        uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:");
      }
      [v14 unionSet:v13];
    }
  }
}

uint64_t __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) minusSet:*(void *)(a1 + 40)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v8 person1LocalIdentifier];
        uint64_t v10 = [v8 person2LocalIdentifier];
        id v11 = [*(id *)(a1 + 48) objectForKey:v9];
        if ([v11 containsObject:v10]) {
          [*(id *)(a1 + 56) addObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(a1 + 64), "_completePersonBuildingWithPersonsToUpdate:facesToRemoveByPerson:facesToAddByPerson:updateFaceGroup:newMergeCandidatePairs:newInvalidMergeCandidatePairs:faceInFaceGroupByCSN:personCache:keyFaceUpdateBlock:cancelOrExtendTimeoutBlock:context:error:", *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 120), a2, (void)v13);
}

void __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_648(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_685(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = objc_msgSend(v7, "keyEnumerator", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v14 = [v7 objectForKey:v13];
        if ([v14 intersectsSet:v8]) {
          [v6 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)buildPersonWithFaceClusterer:(id)a3 keyFaceUpdateBlock:(id)a4 context:(id)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  v71[8] = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v52 = a4;
  id v53 = a5;
  uint64_t v62 = (uint64_t (**)(void))a6;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v67 = "-[VCPPhotosPersistenceDelegate buildPersonWithFaceClusterer:keyFaceUpdateBlock:context:cancelOrExtendTimeoutBlock:]";
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "PersonBuilder: ---> buildPersonWithFaceClusterer, %s", buf, 0xCu);
    }
  }
  if (!v62 || (v62[2]() & 1) == 0)
  {
    uint64_t v51 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    [v51 becomeCurrentWithPendingUnitCount:1];
    if (([v53 personBuildingDisabled] & 1) == 0)
    {
      locatiouint64_t n = (id *)&self->_photoLibrary;
      do
      {
        context = (void *)MEMORY[0x1C186D320]();
        id v61 = [(VCPPhotosPersistenceDelegate *)self _updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:v62 fetchLimit:500];
        uint64_t v19 = [v61 count];
        if (v19)
        {
          uint64_t v20 = mach_absolute_time();
          long long v21 = VCPSignPostLog();
          os_signpost_id_t v22 = os_signpost_id_generate(v21);

          uint64_t v23 = VCPSignPostLog();
          __int16 v24 = v23;
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VCPFaceProcessingBuildPersonsCoreAnalyticsCollection", "", buf, 2u);
          }

          uint64_t v25 = [v56 clusteredFaceCount];
          uint64_t v26 = [v56 clusterCount];
          uint64_t v27 = [v61 count];
          id WeakRetained = objc_loadWeakRetained(location);
          uint64_t v29 = objc_msgSend(WeakRetained, "vcp_assetCountForTaskID:", 3);

          id v30 = objc_loadWeakRetained(location);
          os_log_type_t v59 = [v30 librarySpecificFetchOptions];

          [v59 setShouldPrefetchCount:1];
          char v31 = [MEMORY[0x1E4F39080] fetchFaceGroupsWithOptions:v59];
          uint64_t v32 = [v31 count];

          uint64_t v33 = VCPSignPostLog();
          uint64_t v34 = v33;
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v22, "VCPFaceProcessingBuildPersonsCoreAnalyticsCollection", "", buf, 2u);
          }

          if (v20)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
          double Current = CFAbsoluteTimeGetCurrent();
          [(VCPPhotosPersistenceDelegate *)self _buildPersonsFromUpdatedFaceGroups:v61 faceClusterer:v56 keyFaceUpdateBlock:v52 cancelOrExtendTimeoutBlock:v62 context:v53];
          double v36 = CFAbsoluteTimeGetCurrent();
          id v58 = +[VCPMADCoreAnalyticsManager sharedManager];
          v70[0] = @"BuildingInterval";
          int v54 = [NSNumber numberWithDouble:v36 - Current];
          v71[0] = v54;
          v70[1] = @"BuildingSequence";
          uint64_t v37 = [MEMORY[0x1E4F1C9C8] now];
          id v38 = [v37 description];
          v71[1] = v38;
          v70[2] = @"ClusterCount";
          uint64_t v39 = [NSNumber numberWithUnsignedInteger:v26];
          v71[2] = v39;
          v70[3] = @"ClusterFaceCount";
          id v40 = [NSNumber numberWithUnsignedInteger:v25];
          v71[3] = v40;
          v70[4] = @"FaceGroupCount";
          char v41 = [NSNumber numberWithUnsignedInteger:v32];
          v71[4] = v41;
          v70[5] = @"FaceGroupCountNeedToBuild";
          id v42 = [NSNumber numberWithUnsignedInteger:v27];
          v71[5] = v42;
          v70[6] = @"ProcessingQoS";
          qos_class_t v43 = qos_class_self();
          id v44 = VCPMAQoSDescription(v43);
          v71[6] = v44;
          v70[7] = @"TotalAssetCount";
          uint64_t v45 = [NSNumber numberWithUnsignedInteger:v29];
          v71[7] = v45;
          uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:8];
          [v58 sendEvent:@"com.apple.mediaanalysisd.photos.personbuilding" withAnalytics:v46];
        }
        BOOL v47 = v62 && (v62[2]() & 1) != 0;

        if (v19) {
          char v48 = v47;
        }
        else {
          char v48 = 1;
        }
      }
      while ((v48 & 1) == 0);
      goto LABEL_41;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "PersonBuilder: Person Building is Disabled!", buf, 2u);
      }
    }
    uint64_t v11 = [(VCPPhotosPersistenceDelegate *)self _updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:v62 fetchLimit:0];
    id v12 = [(NSMapTable *)v11 objectEnumerator];
    id v13 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __115__VCPPhotosPersistenceDelegate_buildPersonWithFaceClusterer_keyFaceUpdateBlock_context_cancelOrExtendTimeoutBlock___block_invoke;
    v64[3] = &unk_1E6296FF8;
    id v14 = v12;
    id v65 = v14;
    id v63 = 0;
    int v15 = [v13 performChangesAndWait:v64 error:&v63];
    id v16 = v63;

    if (v15)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        long long v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          NSAllMapTableKeys(v11);
          long long v18 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          uint64_t v67 = v18;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "PersonBuilder: Cleared personBuilderState of faceGroups: %@", buf, 0xCu);
        }
LABEL_39:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        NSAllMapTableKeys(v11);
        double v49 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        uint64_t v67 = v49;
        __int16 v68 = 2112;
        id v69 = v16;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to clear personBuilderState of faceGroups: %@, error: %@", buf, 0x16u);
      }
      goto LABEL_39;
    }

LABEL_41:
    [v51 resignCurrent];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint32_t v50 = VCPLogInstance();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_DEBUG, "PersonBuilder: <--- buildPersonWithFaceClusterer", buf, 2u);
      }
    }
  }
}

void __115__VCPPhotosPersistenceDelegate_buildPersonWithFaceClusterer_keyFaceUpdateBlock_context_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = objc_msgSend(MEMORY[0x1E4F39088], "changeRequestForFaceGroup:", *(void *)(*((void *)&v6 + 1) + 8 * v4), (void)v6);
        [v5 setPersonBuilderState:0];

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v2);
  }
}

- (id)keyFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 updateBlock:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__VCPPhotosPersistenceDelegate_keyFaceForPerson_qualityMeasureByFace_updateBlock___block_invoke;
  v12[3] = &unk_1E6297C38;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = [(VCPPhotosPersistenceDelegate *)self bestRepresentativeFaceForPerson:a3 qualityMeasureByFace:a4 candidateFaces:0 cancelOrExtendTimeoutBlock:v12];

  return v10;
}

uint64_t __82__VCPPhotosPersistenceDelegate_keyFaceForPerson_qualityMeasureByFace_updateBlock___block_invoke(uint64_t a1)
{
  char v2 = 0;
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    (*(void (**)(uint64_t, char *, float))(result + 16))(result, &v2, -1.0);
    return v2 != 0;
  }
  return result;
}

- (id)suggestedMeIdentifierWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [getPGPNGraphHelperClass() suggestedMeIdentifierWithPersonClusterManager:v7 forPersons:v8 updateBlock:v9];

  return v10;
}

- (id)performSocialGroupsIdentifiersWithPersonClusterManager:(id)a3 forPersons:(id)a4 overTheYearsComputation:(BOOL)a5 updateBlock:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v7) {
    [getPGPNGraphHelperClass() socialGroupsOverTheYearsWithPersonClusterManager:v9 forPersons:v10 updateBlock:v11];
  }
  else {
  id v12 = [getPGPNGraphHelperClass() multiLevelSocialGroupsWithPersonClusterManager:v9 forPersons:v10 updateBlock:v11];
  }

  return v12;
}

- (id)densityClusteringForObjects:(id)a3 maximumDistance:(double)a4 minimumNumberOfObjects:(unint64_t)a5 withDistanceBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [getPGPNGraphHelperClass() densityClusteringForObjects:v9 maximumDistance:a5 minimumNumberOfObjects:v10 withDistanceBlock:a4];

  return v11;
}

- (id)fetchFaceWithLocalIdentifier:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    id v9 = (void *)[v7 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

    id v10 = (void *)MEMORY[0x1E4F39048];
    id v22 = v6;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    id v12 = [v10 fetchFacesWithLocalIdentifiers:v11 options:v9];

    uint64_t v13 = [v12 count];
    if (v13 == 1)
    {
      id v14 = [v12 firstObject];
    }
    else
    {
      if (a4)
      {
        id v16 = (void *)MEMORY[0x1E4F28C58];
        long long v17 = [NSString stringWithFormat:@"fetched %lu faces for %@", v13, v6, *MEMORY[0x1E4F28568]];
        long long v21 = v17;
        long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v18];
      }
      id v14 = 0;
    }
    goto LABEL_9;
  }
  if (a4)
  {
    int v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    id v9 = [NSString stringWithFormat:@"faceLocalIdentifier is nil"];
    v24[0] = v9;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v12];
    id v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  id v14 = 0;
LABEL_10:

  return v14;
}

- (id)fetchFaceWithClusterSequenceNumber:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    id v9 = (void *)[v7 newAllFacesFetchOptionsWithPhotoLibrary:WeakRetained];

    id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"clusterSequenceNumber = %ld", objc_msgSend(v6, "longValue"));
    [v9 setPredicate:v10];

    uint64_t v11 = *MEMORY[0x1E4F39638];
    v23[0] = *MEMORY[0x1E4F39630];
    v23[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v9 setFetchPropertySets:v12];

    uint64_t v13 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v9];
    uint64_t v14 = [v13 count];
    if (v14 == 1)
    {
      int v15 = [v13 firstObject];
    }
    else
    {
      if (a4)
      {
        long long v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F28568];
        long long v18 = [NSString stringWithFormat:@"fetched %lu faces for %@", v14, v6];
        id v22 = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        *a4 = [v17 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v19];
      }
      int v15 = 0;
    }
    goto LABEL_9;
  }
  if (a4)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v9 = [NSString stringWithFormat:@"clusterSequenceNumber is nil"];
    v25[0] = v9;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v13];
    int v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  int v15 = 0;
LABEL_10:

  return v15;
}

- (id)fetchPersonWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    if (!a5) {
      goto LABEL_10;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithFormat:@"personLocalIdentifier is nil"];
    v22[0] = v11;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    *a5 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v14];
    goto LABEL_8;
  }
  id v9 = (void *)MEMORY[0x1E4F391F8];
  id v20 = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  uint64_t v11 = [v9 fetchPersonsWithLocalIdentifiers:v10 options:v8];

  uint64_t v12 = [v11 count];
  if (v12 != 1)
  {
    if (!a5) {
      goto LABEL_9;
    }
    int v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = [NSString stringWithFormat:@"fetched %lu persons for %@", v12, v7, *MEMORY[0x1E4F28568]];
    uint64_t v19 = v14;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    *a5 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];

LABEL_8:
    a5 = 0;
    goto LABEL_9;
  }
  a5 = [v11 firstObject];
LABEL_9:

LABEL_10:
  return a5;
}

+ (id)newVerifiedPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3
{
  uint64_t v3 = [a3 librarySpecificFetchOptions];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(verifiedType = %d) OR (verifiedType = %d)", 1, 2);
  [v3 setPredicate:v4];

  [v3 setMinimumVerifiedFaceCount:1];
  [v3 setIncludeTorsoOnlyPerson:1];
  return v3;
}

- (BOOL)removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v52 = (uint64_t (**)(void))a4;
  p_photoLibrary = &self->_photoLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    id v42 = a5;
    id v10 = objc_opt_class();
    id v11 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    id v44 = [v10 newVerifiedPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:v11];

    if ([v45 count]) {
      [MEMORY[0x1E4F391F8] fetchPersonsWithLocalIdentifiers:v45 options:v44];
    }
    else {
    qos_class_t v43 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v44];
    }
    BOOL v47 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = objc_opt_class();
    id v19 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    double v49 = (void *)[v18 newAllPersonsFetchOptionsWithPhotoLibrary:v19];

    id v20 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    uint32_t v50 = [v20 librarySpecificFetchOptions];

    uint64_t v21 = objc_opt_class();
    id v22 = objc_loadWeakRetained((id *)p_photoLibrary);
    uint64_t v51 = (void *)[v21 newAllFacesFetchOptionsWithPhotoLibrary:v22];

    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(manual = 0) AND ((nameSource = %d) OR (nameSource = %d) OR (nameSource = %d)) AND ((trainingType = %d) OR (trainingType = nil))", 0, 2, 4, 0);
    [v51 setPredicate:v23];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = v43;
    uint64_t v24 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v24)
    {
      char v46 = 0;
      uint64_t v25 = *(void *)v59;
LABEL_13:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v59 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v58 + 1) + 8 * v26);
        uint64_t v28 = (void *)MEMORY[0x1C186D320]();
        if (v52 && (v52[2]() & 1) != 0)
        {
          int v29 = 0;
          char v46 = 1;
        }
        else
        {
          id v30 = objc_loadWeakRetained((id *)p_photoLibrary);
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __135__VCPPhotosPersistenceDelegate_removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding_cancelOrExtendTimeoutBlock_error___block_invoke;
          v54[3] = &unk_1E6299898;
          v54[4] = v27;
          id v55 = v51;
          id v56 = v49;
          id v57 = v50;
          id v53 = 0;
          char v31 = [v30 performChangesAndWait:v54 error:&v53];
          id v32 = v53;

          if ((v31 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              uint64_t v33 = VCPLogInstance();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                uint64_t v34 = [v27 localIdentifier];
                *(_DWORD *)buf = 138412546;
                uint64_t v67 = v34;
                __int16 v68 = 2112;
                id v69 = v32;
                _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_ERROR, "Failed to remove auto-assigned faces from person '%@', error: %@", buf, 0x16u);
              }
            }
            BOOL v35 = [v27 localIdentifier];
            [v47 addObject:v35];
          }
          int v29 = 1;
        }
        if (!v29) {
          break;
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
          if (v24) {
            goto LABEL_13;
          }
          break;
        }
      }

      if (v46)
      {
        double v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        uint64_t v37 = [NSString stringWithFormat:@"Operation to remove faces from verified persons has been canceled"];
        id v65 = v37;
        id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        uint64_t v39 = [v36 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v38];
        goto LABEL_34;
      }
    }
    else
    {
    }
    if (![v47 count])
    {
      BOOL v17 = 1;
      goto LABEL_37;
    }
    id v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v62 = *MEMORY[0x1E4F28568];
    uint64_t v37 = [NSString stringWithFormat:@"Failed to removed faces from person with localIdentifiers '%@'", v47];
    id v63 = v37;
    id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    uint64_t v39 = [v40 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v38];
LABEL_34:
    *id v42 = v39;

    BOOL v17 = 0;
LABEL_37:

LABEL_38:
    goto LABEL_39;
  }
  if (a5)
  {
    uint64_t v12 = a5;
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v71 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithFormat:@"Got a 'nil' photoLibrary. Cannot remove auto assigned faces"];
    v72[0] = v14;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
    *uint64_t v12 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v15];
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v16 = VCPLogInstance();
    id v44 = v16;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Got a 'nil' photoLibrary. Cannot remove auto assigned faces", buf, 2u);
    }
    BOOL v17 = 0;
    goto LABEL_38;
  }
  BOOL v17 = 0;
LABEL_39:

  return v17;
}

void __135__VCPPhotosPersistenceDelegate_removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding_cancelOrExtendTimeoutBlock_error___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v2 = [MEMORY[0x1E4F39048] fetchFacesForPerson:a1[4] options:a1[5]];
  uint64_t v3 = [MEMORY[0x1E4F391F8] fetchMergeCandidatePersonsForPerson:a1[4] options:a1[6]];
  uint64_t v4 = [v2 count];
  if (v4 | [v3 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F39208] changeRequestForPerson:a1[4]];
    [v5 removeFaces:v2];
    [v5 removeMergeCandidatePersons:v3];
  }
  [MEMORY[0x1E4F39080] fetchFaceGroupsForPerson:a1[4] options:a1[7]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = objc_msgSend(MEMORY[0x1E4F39088], "changeRequestForFaceGroup:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [v10 setPersonBuilderState:1];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)personBuilderMergeCandidatesDisabled
{
  return self->_personBuilderMergeCandidatesDisabled;
}

- (void)setPersonBuilderMergeCandidatesDisabled:(BOOL)a3
{
  self->_personBuilderMergeCandidatesDisabled = a3;
}

- (void).cxx_destruct
{
}

@end