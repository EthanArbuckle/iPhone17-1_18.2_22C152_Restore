@interface PHCollectionListReference
+ (id)referenceForCollectionList:(id)a3;
+ (id)representedType;
- (BOOL)transient;
- (NSArray)transientCollectionReferences;
- (PHCollectionListReference)initWithDictionary:(id)a3 referenceType:(id)a4;
- (PHCollectionListReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 collectionListType:(int64_t)a5 collectionListSubtype:(int64_t)a6;
- (PHCollectionListReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 collectionListType:(int64_t)a5 collectionListSubtype:(int64_t)a6 collectionReferences:(id)a7 transientIdentifier:(id)a8 transientTitle:(id)a9;
- (id)_transientCollectionInLibrary:(id)a3;
- (id)dictionaryForReferenceType:(id)a3;
- (int64_t)collectionListSubtype;
- (int64_t)collectionListType;
@end

@implementation PHCollectionListReference

- (void).cxx_destruct
{
}

- (NSArray)transientCollectionReferences
{
  return self->_transientCollectionReferences;
}

- (int64_t)collectionListSubtype
{
  return self->_collectionListSubtype;
}

- (int64_t)collectionListType
{
  return self->_collectionListType;
}

- (id)_transientCollectionInLibrary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PHCollectionListReference *)self transientCollectionReferences];
  v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v26 = v11;
          v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
          v13 = +[PHAssetCollection fetchAssetCollectionsForReferences:v12 photoLibrary:v4];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v25 = v11;
          v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
          v13 = +[PHCollectionList fetchCollectionListsForReferences:v12 photoLibrary:v4];
        }
        v14 = v13;
        v15 = [v13 firstObject];

        if (v15)
        {
          [v20 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  v16 = [(PHCollectionReference *)self transientTitle];
  v17 = [(PHCollectionReference *)self transientIdentifier];
  v18 = +[PHCollectionList transientCollectionListWithCollections:v20 title:v16 identifier:v17 photoLibrary:v4];

  return v18;
}

- (BOOL)transient
{
  v2 = [(PHCollectionListReference *)self transientCollectionReferences];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)dictionaryForReferenceType:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PHCollectionListReference;
  id v4 = [(PHCollectionReference *)&v10 dictionaryForReferenceType:a3];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHCollectionListReference collectionListType](self, "collectionListType"));
  [v4 setObject:v5 forKeyedSubscript:@"collectionListType"];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHCollectionListReference collectionListSubtype](self, "collectionListSubtype"));
  [v4 setObject:v6 forKeyedSubscript:@"collectionListSubtype"];

  if ([(PHCollectionListReference *)self transient])
  {
    uint64_t v7 = [(PHCollectionListReference *)self transientCollectionReferences];
    uint64_t v8 = PHObjectReferenceDictionariesForReferences(v7);
    [v4 setObject:v8 forKeyedSubscript:@"transientCollectionReferences"];
  }

  return v4;
}

- (PHCollectionListReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHCollectionListReference;
  uint64_t v7 = [(PHCollectionReference *)&v17 initWithDictionary:v6 referenceType:a4];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"collectionListType"];
    uint64_t v9 = [v6 objectForKeyedSubscript:@"collectionListSubtype"];
    v7->_collectionListType = [v8 integerValue];
    v7->_collectionListSubtype = [v9 integerValue];
    objc_super v10 = [v6 objectForKeyedSubscript:@"transientCollectionReferences"];
    v18[0] = @"com.apple.photos.object-reference.assetcollection";
    uint64_t v11 = objc_opt_class();
    v18[1] = @"com.apple.photos.object-reference.collectionlist";
    v19[0] = v11;
    v19[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    v13 = PHObjectReferencesForDictionaries(v10, v12);
    uint64_t v14 = [v13 copy];
    transientCollectionReferences = v7->_transientCollectionReferences;
    v7->_transientCollectionReferences = (NSArray *)v14;
  }
  return v7;
}

- (PHCollectionListReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 collectionListType:(int64_t)a5 collectionListSubtype:(int64_t)a6
{
  return [(PHCollectionListReference *)self initWithLocalIdentifier:a3 libraryURL:a4 collectionListType:a5 collectionListSubtype:a6 collectionReferences:0 transientIdentifier:0 transientTitle:0];
}

- (PHCollectionListReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 collectionListType:(int64_t)a5 collectionListSubtype:(int64_t)a6 collectionReferences:(id)a7 transientIdentifier:(id)a8 transientTitle:(id)a9
{
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PHCollectionListReference;
  v16 = [(PHCollectionReference *)&v21 initWithLocalIdentifier:a3 libraryURL:a4 transientIdentifier:a8 transientTitle:a9];
  objc_super v17 = v16;
  if (v16)
  {
    v16->_collectionListType = a5;
    v16->_collectionListSubtype = a6;
    uint64_t v18 = [v15 copy];
    transientCollectionReferences = v17->_transientCollectionReferences;
    v17->_transientCollectionReferences = (NSArray *)v18;
  }
  return v17;
}

+ (id)referenceForCollectionList:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isTransient])
  {
    v5 = [v4 transientIdentifier];
    id v6 = [v4 localizedTitle];
    uint64_t v7 = +[PHCollection fetchCollectionsInCollectionList:v4 options:0];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectReference];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v6 = 0;
    v5 = 0;
    uint64_t v8 = 0;
  }
  id v15 = objc_alloc((Class)a1);
  v16 = [v4 localIdentifier];
  objc_super v17 = [v4 photoLibrary];
  uint64_t v18 = [v17 photoLibraryURL];
  v19 = objc_msgSend(v15, "initWithLocalIdentifier:libraryURL:collectionListType:collectionListSubtype:collectionReferences:transientIdentifier:transientTitle:", v16, v18, objc_msgSend(v4, "collectionListType"), objc_msgSend(v4, "collectionListSubtype"), v8, v5, v6);

  return v19;
}

+ (id)representedType
{
  return @"com.apple.photos.object-reference.collectionlist";
}

@end