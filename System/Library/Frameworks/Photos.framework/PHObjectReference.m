@interface PHObjectReference
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (NSString)representedType;
+ (id)filteredObjectReferences:(id)a3 inPhotoLibrary:(id)a4;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)referenceForObject:(id)a3;
- (NSString)description;
- (NSString)localIdentifier;
- (NSString)representedType;
- (NSURL)libraryURL;
- (PHObjectReference)initWithDictionary:(id)a3 referenceType:(id)a4;
- (PHObjectReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4;
- (id)dictionaryForReferenceType:(id)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
@end

@implementation PHObjectReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);

  objc_storeStrong((id *)&self->_representedType, 0);
}

- (NSURL)libraryURL
{
  return self->_libraryURL;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)representedType
{
  return self->_representedType;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  v7 = [(PHObjectReference *)self dictionaryForReferenceType:a3];
  uint64_t v10 = 0;
  v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:&v10];
  v6[2](v6, v8, v10);

  return 0;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PHObjectReference *)self representedType];
  v6 = [(PHObjectReference *)self localIdentifier];
  v7 = [(PHObjectReference *)self libraryURL];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: pasteboardType: %@; localIdentifier: %@; libraryURL: %@>",
    v4,
    self,
    v5,
    v6,
  v8 = v7);

  return (NSString *)v8;
}

- (id)dictionaryForReferenceType:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  v5 = [(PHObjectReference *)self localIdentifier];
  v6 = [(PHObjectReference *)self libraryURL];
  v7 = [v6 absoluteString];
  v8 = objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, @"localIdentifier", v7, @"libraryURL", 0);

  return v8;
}

- (PHObjectReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"localIdentifier"];
  v9 = [v7 objectForKeyedSubscript:@"libraryURL"];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    v11 = (void *)v10;
    v12 = 0;
    if (v8 && v10)
    {
      v13 = [(PHObjectReference *)self initWithLocalIdentifier:v8 libraryURL:v10];
      if (v13)
      {
        uint64_t v14 = [v6 copy];
        representedType = v13->_representedType;
        v13->_representedType = (NSString *)v14;
      }
      self = v13;
      v12 = self;
    }
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }

  return v12;
}

- (PHObjectReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)PHObjectReference;
    uint64_t v10 = [(PHObjectReference *)&v18 init];
    if (v10)
    {
      uint64_t v11 = [v6 copy];
      localIdentifier = v10->_localIdentifier;
      v10->_localIdentifier = (NSString *)v11;

      uint64_t v13 = [v8 copy];
      libraryURL = v10->_libraryURL;
      v10->_libraryURL = (NSURL *)v13;

      uint64_t v15 = [(id)objc_opt_class() representedType];
      representedType = v10->_representedType;
      v10->_representedType = (NSString *)v15;
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:a5];
  if (v9) {
    uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithDictionary:v9 referenceType:v8];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 representedType];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 representedType];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

+ (id)filteredObjectReferences:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v19 = [v6 photoLibraryURL];
  id v7 = v5;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:&v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = [v13 libraryURL];
        uint64_t v15 = [v8 objectForKeyedSubscript:v14];
        if (!v15)
        {
          uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
          [v8 setObject:v15 forKeyedSubscript:v14];
        }
        [v15 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:&v27 count:16];
    }
    while (v10);
  }

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__33157;
  v31 = __Block_byref_object_dispose__33158;
  id v32 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__PHObjectReference_filteredObjectReferences_inPhotoLibrary___block_invoke;
  v20[3] = &unk_1E5846B28;
  id v16 = v19;
  id v21 = v16;
  v22 = &v27;
  [v8 enumerateKeysAndObjectsUsingBlock:v20];
  id v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v17;
}

void __61__PHObjectReference_filteredObjectReferences_inPhotoLibrary___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([MEMORY[0x1E4F8B908] fileURL:*(void *)(a1 + 32) isEqualToFileURL:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

+ (NSString)representedType
{
  return (NSString *)@"com.apple.photos.object-reference";
}

+ (id)referenceForObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 localIdentifier];
  id v7 = [v4 photoLibrary];

  id v8 = [v7 photoLibraryURL];
  id v9 = (void *)[v5 initWithLocalIdentifier:v6 libraryURL:v8];

  return v9;
}

@end