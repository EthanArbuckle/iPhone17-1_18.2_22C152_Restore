@interface PHCloudIdentifierLookup
+ (id)cloudIdentifierKeysByFetchType;
+ (id)fetchOptionsForResolvingIdentifiersInLibrary:(id)a3;
- (BOOL)supportsIdentifierCode:(id)a3;
- (PHCloudIdentifierLookup)initWithPhotoLibrary:(id)a3;
- (id)_computeFingerprintsForAssetsWithObjectIDsByUUID:(id)a3;
- (id)_fingerPrintsForAssetUUIDs:(id)a3;
- (id)_getAssetLocalIdentifiersByFingerPrintForFingerPrints:(id)a3;
- (id)lookupCloudIdentifiersForLocalIdentifiers:(id)a3;
- (id)lookupLocalIdentifiersForCloudIdentifiers:(id)a3;
- (void)_lookupCloudIdentifiersForIdentifierCode:(id)a3 codeSpecificLocalIdentifiers:(id)a4;
- (void)_lookupCodeSpecificCloudIdentifierStrings:(id)a3 forIdentifierCode:(id)a4;
- (void)_lookupLocalIdentifiersForIdentifierCode:(id)a3 codeSpecificCloudIdentifierStrings:(id)a4;
@end

@implementation PHCloudIdentifierLookup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudIdentifiersByLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_resolvedCloudIdentifiersForLocalCloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_unresolvedCloudIdentifierStrings, 0);
  objc_storeStrong((id *)&self->_localIdentifersByCloudIdentiferStrings, 0);
  objc_storeStrong((id *)&self->_cloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudIdentifierKeysByFetchType, 0);

  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)_fingerPrintsForAssetUUIDs:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v4 count])
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = [(PHPhotoLibrary *)self->_photoLibrary managedObjectContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__PHCloudIdentifierLookup__fingerPrintsForAssetUUIDs___block_invoke;
    v13[3] = &unk_1E5848078;
    id v14 = v4;
    v15 = @"additionalAttributes.originalStableHash";
    id v16 = v7;
    id v8 = v5;
    id v17 = v8;
    id v9 = v6;
    id v18 = v9;
    id v10 = v7;
    [v10 performBlockAndWait:v13];
    if ([v9 count])
    {
      v11 = [(PHCloudIdentifierLookup *)self _computeFingerprintsForAssetsWithObjectIDsByUUID:v9];
      if ([v11 count]) {
        [v8 addEntriesFromDictionary:v11];
      }
    }
  }

  return v5;
}

void __54__PHCloudIdentifierLookup__fingerPrintsForAssetUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PHAsset managedEntityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  v6 = +[PHObject identifierPropertiesToFetch];
  v7 = [v6 arrayByAddingObject:*(void *)(a1 + 40)];

  [v4 setPropertiesToFetch:v7];
  [v4 setResultType:2];
  id v8 = *(void **)(a1 + 48);
  id v17 = 0;
  id v9 = [v8 executeFetchRequest:v4 error:&v17];
  id v10 = v17;
  if (v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__PHCloudIdentifierLookup__fingerPrintsForAssetUUIDs___block_invoke_2;
    v13[3] = &unk_1E58447C8;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    [v9 enumerateObjectsUsingBlock:v13];

    v11 = v14;
  }
  else
  {
    v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v12;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch identifier information for cloud identifier fingerprints: %{public}@", buf, 0xCu);
    }
  }
}

void __54__PHCloudIdentifierLookup__fingerPrintsForAssetUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = [v6 objectForKeyedSubscript:@"uuid"];
  if (v3)
  {
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:v4];
  }
  else
  {
    v5 = [v6 objectForKeyedSubscript:@"objectID"];
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v4];
  }
}

- (id)_computeFingerprintsForAssetsWithObjectIDsByUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(PHPhotoLibrary *)self->_photoLibrary assetsdClient];
  v7 = [v6 cloudClient];

  id v8 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = [v4 count];
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_INFO, "Generating fingerprints on demand for %ld assets", buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PHCloudIdentifierLookup__computeFingerprintsForAssetsWithObjectIDsByUUID___block_invoke;
  v14[3] = &unk_1E58447A0;
  id v15 = v7;
  id v9 = v5;
  id v16 = v9;
  id v10 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v14];
  v11 = v16;
  id v12 = v9;

  return v12;
}

void __76__PHCloudIdentifierLookup__computeFingerprintsForAssetsWithObjectIDsByUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PHCloudIdentifierLookup__computeFingerprintsForAssetsWithObjectIDsByUUID___block_invoke_2;
  v8[3] = &unk_1E5844778;
  id v6 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [v6 computeFingerPrintsOfAsset:a3 synchronously:1 completionHandler:v8];
}

void __76__PHCloudIdentifierLookup__computeFingerprintsForAssetsWithObjectIDsByUUID___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Failed to generate fingerprint for asset %{public}@: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_lookupCloudIdentifiersForIdentifierCode:(id)a3 codeSpecificLocalIdentifiers:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:v7];
  v42 = [(NSDictionary *)self->_cloudIdentifierKeysByFetchType objectForKeyedSubscript:v9];
  if (!v42)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PHCloudIdentifierLookup.m", 261, @"Unsupported identifier code: %@", v7 object file lineNumber description];
  }
  v37 = [(id)objc_opt_class() fetchOptionsForResolvingIdentifiersInLibrary:self->_photoLibrary];
  v36 = +[PHQuery queryForType:withLocalIdentifiers:options:](PHQuery, "queryForType:withLocalIdentifiers:options:", v9, v8);
  uint64_t v10 = [v36 executeQuery];
  __int16 v11 = +[PHAsset identifierCode];
  v43 = v7;
  int v12 = [v7 isEqualToString:v11];

  v38 = (void *)v9;
  v39 = v8;
  v41 = self;
  if (v12)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v49 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [(PHCloudIdentifierLookup *)v41 _fingerPrintsForAssetUUIDs:v13];
  }
  else
  {
    uint64_t v20 = 0;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v10;
  uint64_t v21 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v26 = [v25 valueForKeyPath:v42];
        if (![v26 length])
        {
          uint64_t v27 = [v25 uuid];

          v26 = (void *)v27;
        }
        v28 = [v25 uuid];
        v29 = [v20 objectForKeyedSubscript:v28];

        v30 = [PHCloudIdentifier alloc];
        if (v29) {
          v31 = v29;
        }
        else {
          v31 = &stru_1EEAC1950;
        }
        v32 = [(PHCloudIdentifier *)v30 initWithLocalCloudIdentifier:v26 identifierCode:v43 fingerPrint:v31];
        cloudIdentifiersByLocalIdentifiers = v41->_cloudIdentifiersByLocalIdentifiers;
        v34 = [v25 localIdentifier];
        [(NSMutableDictionary *)cloudIdentifiersByLocalIdentifiers setObject:v32 forKeyedSubscript:v34];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v22);
  }
}

- (id)lookupCloudIdentifiersForLocalIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  cloudIdentifiersByLocalIdentifiers = self->_cloudIdentifiersByLocalIdentifiers;
  uint64_t v18 = self;
  self->_cloudIdentifiersByLocalIdentifiers = v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v14 = +[PHObject identifierCodeFromLocalIdentifier:](PHObject, "identifierCodeFromLocalIdentifier:", v13, v18);
        if (v14)
        {
          id v15 = [v7 objectForKeyedSubscript:v14];
          if (!v15)
          {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v7 setObject:v15 forKeyedSubscript:v14];
          }
          [v15 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PHCloudIdentifierLookup_lookupCloudIdentifiersForLocalIdentifiers___block_invoke;
  v19[3] = &unk_1E58446D8;
  v19[4] = v18;
  [v7 enumerateKeysAndObjectsUsingBlock:v19];
  uint64_t v16 = v18->_cloudIdentifiersByLocalIdentifiers;

  return v16;
}

void __69__PHCloudIdentifierLookup_lookupCloudIdentifiersForLocalIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) supportsIdentifierCode:v7])
  {
    id v6 = (void *)MEMORY[0x19F389B10]();
    [*(id *)(a1 + 32) _lookupCloudIdentifiersForIdentifierCode:v7 codeSpecificLocalIdentifiers:v5];
  }
}

- (id)_getAssetLocalIdentifiersByFingerPrintForFingerPrints:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v4 count])
  {
    id v6 = [(PHPhotoLibrary *)self->_photoLibrary managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__PHCloudIdentifierLookup__getAssetLocalIdentifiersByFingerPrintForFingerPrints___block_invoke;
    v9[3] = &unk_1E5847D90;
    uint64_t v10 = @"additionalAttributes.originalStableHash";
    id v11 = v4;
    id v12 = v6;
    id v13 = v5;
    id v7 = v6;
    [v7 performBlockAndWait:v9];
  }

  return v5;
}

void __81__PHCloudIdentifierLookup__getAssetLocalIdentifiersByFingerPrintForFingerPrints___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PHAsset managedEntityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = +[PHObject identifierPropertiesToFetch];
  id v7 = [v6 arrayByAddingObject:*(void *)(a1 + 32)];

  [v4 setPropertiesToFetch:v7];
  [v4 setResultType:2];
  id v8 = *(void **)(a1 + 48);
  id v16 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v4 error:&v16];
  id v10 = v16;
  if (v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__PHCloudIdentifierLookup__getAssetLocalIdentifiersByFingerPrintForFingerPrints___block_invoke_2;
    v13[3] = &unk_1E5844750;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    [v9 enumerateObjectsUsingBlock:v13];

    id v11 = v14;
  }
  else
  {
    id v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v12;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch identifier information for cloud identifier fingerprints: %{public}@", buf, 0xCu);
    }
  }
}

void __81__PHCloudIdentifierLookup__getAssetLocalIdentifiersByFingerPrintForFingerPrints___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v10 = [v4 objectForKeyedSubscript:v3];
  id v5 = [v4 objectForKeyedSubscript:@"uuid"];

  id v6 = +[PHObject localIdentifierWithUUID:v5];
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
  id v8 = v7;
  if (v7)
  {
    [v7 addObject:v6];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v10];
  }
}

- (void)_lookupCodeSpecificCloudIdentifierStrings:(id)a3 forIdentifierCode:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:v8];
  if (!v9
    || ([(NSDictionary *)self->_cloudIdentifierKeysByFetchType objectForKeyedSubscript:v9],
        (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHCloudIdentifierLookup.m", 169, @"Unsupported identifier code: %@", v8 object file lineNumber description];

    id v10 = 0;
  }
  v31 = v8;
  v29 = [(id)objc_opt_class() fetchOptionsForResolvingIdentifiersInLibrary:self->_photoLibrary];
  v30 = (void *)v9;
  v28 = +[PHQuery queryForType:withIdentifiers:identifierKeyPath:options:](PHQuery, "queryForType:withIdentifiers:identifierKeyPath:options:", v9, v7, v10);
  uint64_t v12 = [v28 executeQuery];
  uint64_t v13 = [v12 count];
  if (v13 != [v7 count])
  {
    unresolvedCloudIdentifierStrings = self->_unresolvedCloudIdentifierStrings;
    if (unresolvedCloudIdentifierStrings)
    {
      id v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      [(NSMutableSet *)unresolvedCloudIdentifierStrings unionSet:v15];
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
      id v15 = self->_unresolvedCloudIdentifierStrings;
      self->_unresolvedCloudIdentifierStrings = v16;
    }
  }
  v32 = v7;
  [v7 removeAllObjects];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v23 = [v22 valueForKeyPath:v10];
        [(NSMutableSet *)self->_unresolvedCloudIdentifierStrings removeObject:v23];
        v24 = [(NSMutableDictionary *)self->_resolvedCloudIdentifiersForLocalCloudIdentifiers objectForKeyedSubscript:v23];
        uint64_t v25 = v24;
        if (v24)
        {
          id v26 = v24;

          long long v23 = v26;
        }
        uint64_t v27 = [v22 localIdentifier];
        [(NSMutableDictionary *)self->_localIdentifersByCloudIdentiferStrings setObject:v27 forKeyedSubscript:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v19);
  }
}

- (void)_lookupLocalIdentifiersForIdentifierCode:(id)a3 codeSpecificCloudIdentifierStrings:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PHCloudIdentifierLookup *)self _lookupCodeSpecificCloudIdentifierStrings:v7 forIdentifierCode:v6];
  if ([(NSMutableSet *)self->_unresolvedCloudIdentifierStrings count])
  {
    id v8 = [(PHPhotoLibrary *)self->_photoLibrary assetsdClient];
    uint64_t v9 = [v8 photoKitClient];
    unresolvedCloudIdentifierStrings = self->_unresolvedCloudIdentifierStrings;
    id v61 = 0;
    id v11 = [v9 resolveLocalIdentifiersForCloudIdentifiers:unresolvedCloudIdentifierStrings error:&v61];
    id v12 = v61;

    if (v11)
    {
      uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      resolvedCloudIdentifiersForLocalCloudIdentifiers = self->_resolvedCloudIdentifiersForLocalCloudIdentifiers;
      self->_resolvedCloudIdentifiersForLocalCloudIdentifiers = v13;

      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __103__PHCloudIdentifierLookup__lookupLocalIdentifiersForIdentifierCode_codeSpecificCloudIdentifierStrings___block_invoke;
      v59[3] = &unk_1E5844700;
      v59[4] = self;
      id v15 = v7;
      id v60 = v15;
      [v11 enumerateKeysAndObjectsUsingBlock:v59];
      if ([v15 count]) {
        [(PHCloudIdentifierLookup *)self _lookupCodeSpecificCloudIdentifierStrings:v15 forIdentifierCode:v6];
      }
    }
    else
    {
      id v16 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v65 = v12;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "failed to get identifier conversion from CPL with error: %@", buf, 0xCu);
      }
    }
  }
  id v44 = v7;
  id v46 = v6;
  if ([(NSMutableSet *)self->_unresolvedCloudIdentifierStrings count])
  {
    id v17 = +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:v6];
    uint64_t v18 = [(id)objc_opt_class() fetchOptionsForResolvingIdentifiersInLibrary:self->_photoLibrary];
    uint64_t v19 = [(NSMutableSet *)self->_unresolvedCloudIdentifierStrings allObjects];
    uint64_t v20 = +[PHQuery queryForType:v17 withLocalIdentifiers:v19 options:v18];

    long long v21 = [v20 executeQuery];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v56 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v27 = objc_msgSend(v26, "uuid", v44, v46);
          v28 = [v26 localIdentifier];
          [(NSMutableDictionary *)self->_localIdentifersByCloudIdentiferStrings setObject:v28 forKeyedSubscript:v27];

          [(NSMutableSet *)self->_unresolvedCloudIdentifierStrings removeObject:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v23);
    }

    id v7 = v44;
    id v6 = v46;
  }
  if ([(NSMutableSet *)self->_unresolvedCloudIdentifierStrings count])
  {
    v29 = +[PHAsset identifierCode];
    int v30 = [v6 isEqualToString:v29];

    if (v30)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableSet count](self->_unresolvedCloudIdentifierStrings, "count"));
      v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableSet count](self->_unresolvedCloudIdentifierStrings, "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v33 = self->_cloudIdentifiers;
      uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (!v34) {
        goto LABEL_32;
      }
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v52;
      while (1)
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v52 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          v39 = self->_unresolvedCloudIdentifierStrings;
          v40 = [v38 localCloudIdentifier];
          if ([(NSMutableSet *)v39 containsObject:v40])
          {
            uint64_t v41 = [v38 fingerPrint];

            if (!v41) {
              continue;
            }
            [v31 addObject:v38];
            [v32 addObject:v41];
            v40 = (void *)v41;
          }
        }
        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v51 objects:v62 count:16];
        if (!v35)
        {
LABEL_32:

          v42 = [(PHCloudIdentifierLookup *)self _getAssetLocalIdentifiersByFingerPrintForFingerPrints:v32];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __103__PHCloudIdentifierLookup__lookupLocalIdentifiersForIdentifierCode_codeSpecificCloudIdentifierStrings___block_invoke_63;
          v48[3] = &unk_1E5844728;
          id v49 = v42;
          long long v50 = self;
          id v43 = v42;
          [v31 enumerateObjectsUsingBlock:v48];

          id v7 = v45;
          id v6 = v47;
          break;
        }
      }
    }
  }
}

void __103__PHCloudIdentifierLookup__lookupLocalIdentifiersForIdentifierCode_codeSpecificCloudIdentifierStrings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:v5])
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:v5 forKeyedSubscript:v6];
    [*(id *)(a1 + 40) addObject:v6];
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v5];
  }
  else
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "PHCloudIdentifier cloud->local translation received unexpected result from assetsd: cloudIdentifier = %@, localIdentifier = %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __103__PHCloudIdentifierLookup__lookupLocalIdentifiersForIdentifierCode_codeSpecificCloudIdentifierStrings___block_invoke_63(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 fingerPrint];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = [v7 localCloudIdentifier];
    [*(id *)(*(void *)(a1 + 40) + 40) removeObject:v5];
    if ([v4 count] == 1)
    {
      id v6 = [v4 firstObject];
      [*(id *)(*(void *)(a1 + 40) + 32) setObject:v6 forKeyedSubscript:v5];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 40) + 32) setObject:v4 forKeyedSubscript:v5];
    }
  }
}

- (id)lookupLocalIdentifiersForCloudIdentifiers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_cloudIdentifiers, a3);
  id v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  localIdentifersByCloudIdentiferStrings = self->_localIdentifersByCloudIdentiferStrings;
  self->_localIdentifersByCloudIdentiferStrings = v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v15 = [v14 identifierCode];
        id v16 = [v8 objectForKeyedSubscript:v15];

        if (!v16)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v17 = [v14 identifierCode];
          [v8 setObject:v16 forKeyedSubscript:v17];
        }
        uint64_t v18 = [v14 localCloudIdentifier];
        [v16 addObject:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__PHCloudIdentifierLookup_lookupLocalIdentifiersForCloudIdentifiers___block_invoke;
  v21[3] = &unk_1E58446D8;
  v21[4] = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v21];
  uint64_t v19 = self->_localIdentifersByCloudIdentiferStrings;

  return v19;
}

void __69__PHCloudIdentifierLookup_lookupLocalIdentifiersForCloudIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) supportsIdentifierCode:v7])
  {
    id v6 = (void *)MEMORY[0x19F389B10]();
    [*(id *)(a1 + 32) _lookupLocalIdentifiersForIdentifierCode:v7 codeSpecificCloudIdentifierStrings:v5];
  }
}

- (BOOL)supportsIdentifierCode:(id)a3
{
  id v4 = +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:a3];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_cloudIdentifierKeysByFetchType objectForKeyedSubscript:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (PHCloudIdentifierLookup)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHCloudIdentifierLookup;
  BOOL v6 = [(PHCloudIdentifierLookup *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = [(id)objc_opt_class() cloudIdentifierKeysByFetchType];
    cloudIdentifierKeysByFetchType = v7->_cloudIdentifierKeysByFetchType;
    v7->_cloudIdentifierKeysByFetchType = (NSDictionary *)v8;
  }
  return v7;
}

+ (id)fetchOptionsForResolvingIdentifiersInLibrary:(id)a3
{
  uint64_t v3 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:a3 orObject:0];
  [v3 setIsExclusivePredicate:1];

  return v3;
}

+ (id)cloudIdentifierKeysByFetchType
{
  return &unk_1EEB26FC0;
}

@end