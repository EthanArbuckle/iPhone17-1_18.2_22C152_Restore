@interface PHPhotoLibrary(PNPhotoLibraryProtocol)
+ (id)_defaultAssetPropertySets;
+ (id)_defaultFacePropertySets;
+ (id)_phFaceSortDescriptors;
+ (id)_phPeopleSortDescriptors;
- (double)_progressFromWorkerStatesDictionary:()PNPhotoLibraryProtocol;
- (float)pn_faceProcessingProgress;
- (id)_defaultAssetFetchOptions;
- (id)_defaultFetchOptions;
- (id)pn_fetchAssetsForFaceGroup:()PNPhotoLibraryProtocol;
- (id)pn_fetchAssetsForFaceLocalIdentifiers:()PNPhotoLibraryProtocol;
- (id)pn_fetchAssetsForPerson:()PNPhotoLibraryProtocol;
- (id)pn_fetchAssetsInMoment:()PNPhotoLibraryProtocol;
- (id)pn_fetchAssetsWithLocalIdentifiers:()PNPhotoLibraryProtocol;
- (id)pn_fetchCandidatePersonsForPerson:()PNPhotoLibraryProtocol;
- (id)pn_fetchFaceGroups;
- (id)pn_fetchFaceGroupsForPerson:()PNPhotoLibraryProtocol;
- (id)pn_fetchFacesForFaceGroup:()PNPhotoLibraryProtocol;
- (id)pn_fetchFacesForPerson:()PNPhotoLibraryProtocol;
- (id)pn_fetchFacesForPerson:()PNPhotoLibraryProtocol inMoment:;
- (id)pn_fetchFacesForPersonLocalIdentifiers:()PNPhotoLibraryProtocol inMoment:;
- (id)pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:()PNPhotoLibraryProtocol;
- (id)pn_fetchFacesWithLocalIdentifiers:()PNPhotoLibraryProtocol;
- (id)pn_fetchInvalidAssetIdentifiersForCommonComparison;
- (id)pn_fetchInvalidCandidatePersonsForPerson:()PNPhotoLibraryProtocol;
- (id)pn_fetchMoments;
- (id)pn_fetchMomentsForAssetsWithLocalIdentifiers:()PNPhotoLibraryProtocol;
- (id)pn_fetchMomentsWithLocalIdentifiers:()PNPhotoLibraryProtocol;
- (id)pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:()PNPhotoLibraryProtocol;
- (id)pn_fetchPersonsInMoment:()PNPhotoLibraryProtocol;
- (id)pn_fetchPersonsWithLocalIdentifiers:()PNPhotoLibraryProtocol;
- (id)pn_fetchPersonsWithType:()PNPhotoLibraryProtocol;
- (id)pn_lastAssetDate;
- (id)pn_persistentStorageDirectoryURL;
- (uint64_t)pn_numberOfFacesWithFaceprints;
- (void)pn_fetchMomentsForPerson:()PNPhotoLibraryProtocol;
@end

@implementation PHPhotoLibrary(PNPhotoLibraryProtocol)

+ (id)_phFaceSortDescriptors
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v3[0] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v1;
}

+ (id)_phPeopleSortDescriptors
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v3[0] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v1;
}

+ (id)_defaultAssetPropertySets
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F39530];
  v3[0] = *MEMORY[0x1E4F39450];
  v3[1] = v0;
  void v3[2] = *MEMORY[0x1E4F394F0];
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  return v1;
}

+ (id)_defaultFacePropertySets
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F39620];
  v3[0] = *MEMORY[0x1E4F39630];
  v3[1] = v0;
  void v3[2] = *MEMORY[0x1E4F39610];
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  return v1;
}

- (id)_defaultFetchOptions
{
  v2 = objc_opt_new();
  [v2 setWantsIncrementalChangeDetails:0];
  [v2 setPhotoLibrary:a1];
  return v2;
}

- (id)_defaultAssetFetchOptions
{
  v1 = [a1 _defaultFetchOptions];
  v2 = [(id)objc_opt_class() _defaultAssetPropertySets];
  [v1 setFetchPropertySets:v2];

  return v1;
}

- (id)pn_persistentStorageDirectoryURL
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 processName];

  if ([v3 isEqualToString:@"mediaanalysisd"])
  {
    v4 = [a1 urlForApplicationDataFolderIdentifier:2];
    goto LABEL_7;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v17 = 0;
  v6 = [v5 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v17];
  id v7 = v17;
  if (!v7)
  {
    v4 = [v6 URLByAppendingPathComponent:v3];
    char v16 = 0;
    v13 = [v4 path];
    char v14 = [v5 fileExistsAtPath:v13 isDirectory:&v16];

    if (v14)
    {
      if (!v16)
      {

        v4 = 0;
        id v8 = 0;
        goto LABEL_5;
      }
      id v8 = 0;
    }
    else
    {
      id v15 = 0;
      [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
      id v8 = v15;
    }
    if (v4 && !v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v8 = v7;
  v4 = 0;
LABEL_5:
  v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = NSTemporaryDirectory();
  uint64_t v11 = [v9 fileURLWithPath:v10];

  v4 = (void *)v11;
LABEL_6:

LABEL_7:
  return v4;
}

- (id)pn_fetchPersonsWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  [v5 setMinimumVerifiedFaceCount:1];
  [v5 setMinimumUnverifiedFaceCount:1];
  v6 = [MEMORY[0x1E4F39220] _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x1E4F391F8] fetchPersonsWithLocalIdentifiers:v4 options:v5];

  return v7;
}

- (id)pn_fetchPersonsWithType:()PNPhotoLibraryProtocol
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a1 _defaultFetchOptions];
  v6 = [MEMORY[0x1E4F39220] _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  switch(a3)
  {
    case 0:
      abort();
    case 1:
      id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"verifiedType = %@ OR verifiedType = %@", &unk_1F15EB268, &unk_1F15EB280];
      [v5 setPredicate:v7];

      goto LABEL_7;
    case 2:
      [v5 setMinimumVerifiedFaceCount:2];
      [v5 setMinimumUnverifiedFaceCount:2];
      id v9 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v5];
      v10 = objc_opt_new();
      uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
      v21[0] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v10 setSortDescriptors:v12];

      [v10 setPhotoLibrary:a1];
      v13 = [v9 fetchedObjects];
      char v14 = (void *)MEMORY[0x1E4F28F60];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__PHPhotoLibrary_PNPhotoLibraryProtocol__pn_fetchPersonsWithType___block_invoke;
      v19[3] = &unk_1E6297088;
      id v20 = v10;
      id v15 = v10;
      char v16 = [v14 predicateWithBlock:v19];
      id v17 = [v13 filteredArrayUsingPredicate:v16];

      goto LABEL_9;
    case 3:
      [v5 setPersonContext:0];
      goto LABEL_7;
    case 4:
      [v5 setMinimumVerifiedFaceCount:1];
      [v5 setMinimumUnverifiedFaceCount:1];
LABEL_7:
      id v8 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v5];
      break;
    default:
      id v8 = 0;
      break;
  }
  id v9 = v8;
  id v17 = v9;
LABEL_9:

  return v17;
}

- (id)pn_fetchPersonsInMoment:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  [v5 setMinimumVerifiedFaceCount:1];
  [v5 setMinimumUnverifiedFaceCount:1];
  v6 = [MEMORY[0x1E4F39220] _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x1E4F391F8] fetchPersonsForAssetCollection:v4 options:v5];

  return v7;
}

- (id)pn_fetchCandidatePersonsForPerson:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  v6 = [MEMORY[0x1E4F39220] _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x1E4F391F8] fetchMergeCandidatePersonsForPerson:v4 options:v5];

  return v7;
}

- (id)pn_fetchInvalidCandidatePersonsForPerson:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  v6 = [MEMORY[0x1E4F39220] _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x1E4F391F8] fetchInvalidMergeCandidatePersonsForPerson:v4 options:v5];

  return v7;
}

- (id)pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  [v5 setMinimumVerifiedFaceCount:1];
  [v5 setMinimumUnverifiedFaceCount:1];
  v6 = [MEMORY[0x1E4F39220] _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x1E4F391F8] fetchPersonsGroupedByAssetLocalIdentifierForAssets:v4 options:v5];

  return v7;
}

- (uint64_t)pn_numberOfFacesWithFaceprints
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = [a1 _defaultFetchOptions];
  [v1 setIncludeOnlyFacesWithFaceprints:1];
  v6[0] = *MEMORY[0x1E4F39630];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v1 setFetchPropertySets:v2];

  [v1 setShouldPrefetchCount:1];
  [v1 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v1 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  v3 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v1];
  uint64_t v4 = [v3 count];

  return v4;
}

- (id)pn_fetchFacesWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  v6 = [(id)objc_opt_class() _defaultFacePropertySets];
  [v5 setFetchPropertySets:v6];

  id v7 = [MEMORY[0x1E4F39220] _phFaceSortDescriptors];
  [v5 setSortDescriptors:v7];

  [v5 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v5 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  id v8 = [MEMORY[0x1E4F39048] fetchFacesWithLocalIdentifiers:v4 options:v5];

  return v8;
}

- (id)pn_fetchFacesForPerson:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  [v5 setIncludeOnlyFacesWithFaceprints:1];
  v6 = [(id)objc_opt_class() _defaultFacePropertySets];
  [v5 setFetchPropertySets:v6];

  id v7 = [MEMORY[0x1E4F39220] _phFaceSortDescriptors];
  [v5 setSortDescriptors:v7];

  [v5 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v5 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  id v8 = [MEMORY[0x1E4F39048] fetchFacesForPerson:v4 options:v5];

  return v8;
}

- (id)pn_fetchFacesForPerson:()PNPhotoLibraryProtocol inMoment:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 localIdentifier];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = objc_msgSend(a1, "pn_fetchFacesForPersonLocalIdentifiers:inMoment:", v8, v6);

  return v9;
}

- (id)pn_fetchFacesForPersonLocalIdentifiers:()PNPhotoLibraryProtocol inMoment:
{
  v1 = objc_msgSend(a1, "fetchFacesForMediaProcessingWithPersonLocalIdentifiers:inMoment:");
  if ([v1 count]) {
    id v2 = v1;
  }
  else {
    id v2 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v2;
}

- (id)pn_fetchFacesForFaceGroup:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  id v6 = [(id)objc_opt_class() _defaultFacePropertySets];
  [v5 setFetchPropertySets:v6];

  id v7 = [MEMORY[0x1E4F39220] _phFaceSortDescriptors];
  [v5 setSortDescriptors:v7];

  [v5 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v5 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  id v8 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:v4 options:v5];

  return v8;
}

- (id)pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  id v6 = [(id)objc_opt_class() _defaultFacePropertySets];
  [v5 setFetchPropertySets:v6];

  id v7 = [MEMORY[0x1E4F39220] _phFaceSortDescriptors];
  [v5 setSortDescriptors:v7];

  [v5 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v5 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  id v8 = [MEMORY[0x1E4F39048] fetchFacesGroupedByAssetLocalIdentifierForAssets:v4 options:v5];

  return v8;
}

- (id)pn_fetchMoments
{
  v1 = [a1 _defaultFetchOptions];
  id v2 = [MEMORY[0x1E4F8E800] momentSortDescriptors];
  [v1 setSortDescriptors:v2];

  v3 = [MEMORY[0x1E4F38EE0] fetchMomentsWithOptions:v1];

  return v3;
}

- (id)pn_fetchMomentsWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  id v6 = [MEMORY[0x1E4F8E800] momentSortDescriptors];
  [v5 setSortDescriptors:v6];

  id v7 = [MEMORY[0x1E4F38EE0] fetchAssetCollectionsWithLocalIdentifiers:v4 options:v5];

  return v7;
}

- (void)pn_fetchMomentsForPerson:()PNPhotoLibraryProtocol
{
  id v3 = a3;
  abort();
}

- (id)pn_fetchMomentsForAssetsWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  id v6 = [MEMORY[0x1E4F8E800] momentSortDescriptors];
  [v5 setSortDescriptors:v6];

  id v7 = [MEMORY[0x1E4F38EE0] fetchMomentsForAssetsWithLocalIdentifiers:v4 options:v5];

  return v7;
}

- (id)pn_fetchAssetsWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultAssetFetchOptions];
  id v6 = [MEMORY[0x1E4F38EC0] fetchAssetsWithLocalIdentifiers:v4 options:v5];

  return v6;
}

- (id)pn_fetchAssetsInMoment:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultAssetFetchOptions];
  id v6 = [MEMORY[0x1E4F38EC0] fetchAssetsInAssetCollection:v4 options:v5];

  return v6;
}

- (id)pn_fetchAssetsForPerson:()PNPhotoLibraryProtocol
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _defaultAssetFetchOptions];
  id v6 = (void *)MEMORY[0x1E4F38EC0];
  v10[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = [v6 fetchAssetsForPersons:v7 options:v5];

  return v8;
}

- (id)pn_fetchAssetsForFaceGroup:()PNPhotoLibraryProtocol
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _defaultAssetFetchOptions];
  id v6 = (void *)MEMORY[0x1E4F38EC0];
  v10[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = [v6 fetchAssetsForFaceGroups:v7 options:v5];

  return v8;
}

- (id)pn_fetchFaceGroups
{
  v1 = [a1 _defaultFetchOptions];
  id v2 = [MEMORY[0x1E4F39080] fetchFaceGroupsWithOptions:v1];

  return v2;
}

- (id)pn_fetchFaceGroupsForPerson:()PNPhotoLibraryProtocol
{
  id v4 = a3;
  id v5 = [a1 _defaultFetchOptions];
  id v6 = [MEMORY[0x1E4F39080] fetchFaceGroupsForPerson:v4 options:v5];

  return v6;
}

- (double)_progressFromWorkerStatesDictionary:()PNPhotoLibraryProtocol
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"total-allowed"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", @"total-allowed", (void)v16) & 1) == 0)
        {
          v13 = [v6 objectForKeyedSubscript:v12];
          v9 += [v13 unsignedIntegerValue];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  if (v5)
  {
    if ((double)v9 / (double)v5 <= 1.0) {
      double v14 = (double)v9 / (double)v5;
    }
    else {
      double v14 = 1.0;
    }
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (float)pn_faceProcessingProgress
{
  [a1 ratioOfAssetsWithFacesProcessed];
  return v1;
}

- (id)pn_fetchInvalidAssetIdentifiersForCommonComparison
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  id v3 = [a1 _defaultFetchOptions];
  v32[0] = *MEMORY[0x1E4F394A0];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v3 setFetchPropertySets:v4];

  uint64_t v21 = [MEMORY[0x1E4F38EE0] fetchAssetCollectionsWithType:2 subtype:211 options:v3];
  id v20 = [v21 firstObject];
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F38EC0], "fetchAssetsInAssetCollection:options:");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) localIdentifier];
        [v2 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }
  uint64_t v11 = [MEMORY[0x1E4F38EE0] fetchAssetCollectionsWithType:2 subtype:201 options:v3];
  v12 = [v11 firstObject];
  v13 = [MEMORY[0x1E4F38EC0] fetchAssetsInAssetCollection:v12 options:v3];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = [*(id *)(*((void *)&v22 + 1) + 8 * j) localIdentifier];
        [v2 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }

  return v2;
}

- (id)pn_lastAssetDate
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v1 = [a1 _defaultFetchOptions];
  id v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v8[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v1 setSortDescriptors:v3];

  [v1 setFetchLimit:1];
  [v1 setIncludeAssetSourceTypes:5];
  id v4 = [MEMORY[0x1E4F38EC0] fetchAssetsWithOptions:v1];
  unint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 creationDate];

  return v6;
}

- (id)pn_fetchAssetsForFaceLocalIdentifiers:()PNPhotoLibraryProtocol
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
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
        uint64_t v11 = [MEMORY[0x1E4F391C8] uuidFromLocalIdentifier:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = [a1 _defaultAssetFetchOptions];
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY detectedFaces.uuid IN %@", v5];
  [v12 setInternalPredicate:v13];

  uint64_t v14 = [MEMORY[0x1E4F38EC0] fetchAssetsWithOptions:v12];

  return v14;
}

@end