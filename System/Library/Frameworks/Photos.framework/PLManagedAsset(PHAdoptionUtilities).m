@interface PLManagedAsset(PHAdoptionUtilities)
+ (id)pl_PHAssetsForManagedAssets:()PHAdoptionUtilities photoLibrary:;
- (id)pl_PHAssetFromPhotoLibrary:()PHAdoptionUtilities;
- (id)pl_PHAssetWithPropertySets:()PHAdoptionUtilities photoLibrary:;
@end

@implementation PLManagedAsset(PHAdoptionUtilities)

- (id)pl_PHAssetWithPropertySets:()PHAdoptionUtilities photoLibrary:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = +[PHAsset propertyFetchHintsForPropertySets:a3];
  v8 = [a1 objectID];
  v13[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v10 = [v6 fetchPHObjectsForOIDs:v9 propertyHint:v7 includeTrash:1 overrideResultsWithClass:0];

  v11 = [v10 lastObject];

  return v11;
}

- (id)pl_PHAssetFromPhotoLibrary:()PHAdoptionUtilities
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PHAdoptionUtilities.m", 611, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  id v6 = [v5 photoLibraryURL];
  unint64_t v7 = [a1 photoLibrary];
  v8 = [v7 pathManager];
  v9 = [v8 libraryURL];
  char v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHAdoptionUtilities.m", 612, @"Invalid parameter not satisfying: %@", @"[photoLibrary.photoLibraryURL isEqual:self.photoLibrary.pathManager.libraryURL]" object file lineNumber description];
  }
  v11 = (void *)MEMORY[0x1E4F1C978];
  v12 = [a1 objectID];
  v13 = [v11 arrayWithObject:v12];
  v14 = [v5 fetchPHObjectsForOIDs:v13];

  v15 = [v14 lastObject];

  return v15;
}

+ (id)pl_PHAssetsForManagedAssets:()PHAdoptionUtilities photoLibrary:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"PHAdoptionUtilities.m" lineNumber:628 description:@"This is only callable on the main thread"];
  }
  if ([v7 count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectID", (void)v19);
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    v16 = [v8 fetchPHObjectsForOIDs:v9];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

@end