@interface PHAssetCollectionReference
+ (id)referenceForAssetCollection:(id)a3;
+ (id)representedType;
- (BOOL)transient;
- (NSArray)transientAssetReferences;
- (PHAssetCollectionReference)initWithDictionary:(id)a3 referenceType:(id)a4;
- (PHAssetCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6;
- (PHAssetCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 assetReferences:(id)a7 transientIdentifier:(id)a8 transientTitle:(id)a9;
- (id)_transientCollectionInLibrary:(id)a3;
- (id)dictionaryForReferenceType:(id)a3;
- (int64_t)assetCollectionSubtype;
- (int64_t)assetCollectionType;
@end

@implementation PHAssetCollectionReference

- (void).cxx_destruct
{
}

- (NSArray)transientAssetReferences
{
  return self->_transientAssetReferences;
}

- (int64_t)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

- (int64_t)assetCollectionType
{
  return self->_assetCollectionType;
}

- (id)_transientCollectionInLibrary:(id)a3
{
  id v4 = a3;
  v5 = [(PHAssetCollectionReference *)self transientAssetReferences];
  v6 = +[PHAsset fetchAssetsForReferences:v5 photoLibrary:v4];

  v7 = [(PHCollectionReference *)self transientTitle];
  v8 = [(PHCollectionReference *)self transientIdentifier];
  if (v6) {
    +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:v6 title:v7 identifier:v8];
  }
  else {
  v9 = +[PHAssetCollection transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:v7 identifier:v8 photoLibrary:v4];
  }

  return v9;
}

- (BOOL)transient
{
  v2 = [(PHAssetCollectionReference *)self transientAssetReferences];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)dictionaryForReferenceType:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PHAssetCollectionReference;
  id v4 = [(PHCollectionReference *)&v10 dictionaryForReferenceType:a3];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHAssetCollectionReference assetCollectionType](self, "assetCollectionType"));
  [v4 setObject:v5 forKeyedSubscript:@"assetCollectionType"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHAssetCollectionReference assetCollectionSubtype](self, "assetCollectionSubtype"));
  [v4 setObject:v6 forKeyedSubscript:@"assetCollectionSubtype"];

  if ([(PHAssetCollectionReference *)self transient])
  {
    v7 = [(PHAssetCollectionReference *)self transientAssetReferences];
    v8 = PHObjectReferenceDictionariesForReferences(v7);
    [v4 setObject:v8 forKeyedSubscript:@"transientAssetReferences"];
  }

  return v4;
}

- (PHAssetCollectionReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetCollectionReference;
  v7 = [(PHCollectionReference *)&v16 initWithDictionary:v6 referenceType:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"assetCollectionType"];
    v9 = [v6 objectForKeyedSubscript:@"assetCollectionSubtype"];
    v7->_assetCollectionType = [v8 integerValue];
    v7->_assetCollectionSubtype = [v9 integerValue];
    objc_super v10 = [v6 objectForKeyedSubscript:@"transientAssetReferences"];
    v17 = @"com.apple.photos.object-reference.asset";
    v18[0] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v12 = PHObjectReferencesForDictionaries(v10, v11);

    uint64_t v13 = [v12 copy];
    transientAssetReferences = v7->_transientAssetReferences;
    v7->_transientAssetReferences = (NSArray *)v13;
  }
  return v7;
}

- (PHAssetCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6
{
  return [(PHAssetCollectionReference *)self initWithLocalIdentifier:a3 libraryURL:a4 type:a5 subtype:a6 assetReferences:0 transientIdentifier:0 transientTitle:0];
}

- (PHAssetCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 assetReferences:(id)a7 transientIdentifier:(id)a8 transientTitle:(id)a9
{
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PHAssetCollectionReference;
  objc_super v16 = [(PHCollectionReference *)&v21 initWithLocalIdentifier:a3 libraryURL:a4 transientIdentifier:a8 transientTitle:a9];
  v17 = v16;
  if (v16)
  {
    v16->_assetCollectionType = a5;
    v16->_assetCollectionSubtype = a6;
    uint64_t v18 = [v15 copy];
    transientAssetReferences = v17->_transientAssetReferences;
    v17->_transientAssetReferences = (NSArray *)v18;
  }
  return v17;
}

+ (id)referenceForAssetCollection:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isTransient])
  {
    v5 = [v4 transientIdentifier];
    id v6 = [v4 localizedTitle];
    v7 = +[PHAsset fetchAssetsInAssetCollection:v4 options:0];
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
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
          v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectReference];
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
    v8 = 0;
  }
  id v15 = objc_alloc((Class)a1);
  objc_super v16 = [v4 localIdentifier];
  v17 = [v4 photoLibrary];
  uint64_t v18 = [v17 photoLibraryURL];
  v19 = objc_msgSend(v15, "initWithLocalIdentifier:libraryURL:type:subtype:assetReferences:transientIdentifier:transientTitle:", v16, v18, objc_msgSend(v4, "assetCollectionType"), objc_msgSend(v4, "assetCollectionSubtype"), v8, v5, v6);

  return v19;
}

+ (id)representedType
{
  return @"com.apple.photos.object-reference.assetcollection";
}

@end