@interface PHThumbnailAsset
+ (BOOL)useNoIndexSelf;
+ (BOOL)useObjectFetchingContext;
+ (NSArray)propertiesToFetch;
+ (NSArray)propertiesToSortBy;
+ (NSString)entityName;
+ (NSString)fetchType;
+ (int64_t)batchSize;
+ (int64_t)cacheSize;
- (BOOL)complete;
- (BOOL)isEqual:(id)a3;
- (NSManagedObjectID)objectID;
- (PHPhotoLibrary)photoLibrary;
- (PHThumbnailAsset)initWithObjectID:(id)a3 knownKeysDictionary:(id)a4 photoLibrary:(id)a5;
- (id)pl_photoLibrary;
- (int64_t)cloudPlaceholderKind;
- (unint64_t)hash;
- (unint64_t)thumbnailIndex;
@end

@implementation PHThumbnailAsset

- (PHThumbnailAsset)initWithObjectID:(id)a3 knownKeysDictionary:(id)a4 photoLibrary:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHThumbnailAsset;
  v12 = [(PHThumbnailAsset *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_objectID, a3);
    objc_storeStrong((id *)&v13->_dictionary, a4);
    objc_storeStrong((id *)&v13->_photoLibrary, a5);
  }

  return v13;
}

+ (BOOL)useObjectFetchingContext
{
  return 1;
}

+ (BOOL)useNoIndexSelf
{
  return 1;
}

+ (NSArray)propertiesToSortBy
{
  return 0;
}

+ (NSArray)propertiesToFetch
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"thumbnailIndex";
  v4[1] = @"complete";
  v4[2] = @"cloudPlaceholderKind";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

+ (NSString)fetchType
{
  v2 = @"PHAsset";
  return (NSString *)@"PHAsset";
}

+ (NSString)entityName
{
  return (NSString *)[MEMORY[0x1E4F8A950] entityName];
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

+ (int64_t)batchSize
{
  return 2000;
}

+ (int64_t)cacheSize
{
  return 1000000;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_objectID, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)pl_photoLibrary
{
  v2 = [(PHThumbnailAsset *)self photoLibrary];
  v3 = [v2 photoLibrary];

  return v3;
}

- (int64_t)cloudPlaceholderKind
{
  v2 = [(NSKnownKeysDictionary *)self->_dictionary valueAtIndex:3];
  int64_t v3 = (int)[v2 shortValue];

  return v3;
}

- (BOOL)complete
{
  v2 = [(NSKnownKeysDictionary *)self->_dictionary valueAtIndex:2];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unint64_t)thumbnailIndex
{
  v2 = [(NSKnownKeysDictionary *)self->_dictionary valueAtIndex:1];
  uint64_t v3 = [v2 integerValue];
  if (v3 > (int)*MEMORY[0x1E4F8ADE8] || v3 < (int)*MEMORY[0x1E4F8ADE0] || v2 == 0) {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v6 = v3;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(PHThumbnailAsset *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PHThumbnailAsset *)a3;
  if (self == v4)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(PHThumbnailAsset *)self objectID];
      v7 = [(PHThumbnailAsset *)v5 objectID];

      char IsEqual = PLObjectIsEqual();
    }
    else
    {
      char IsEqual = 0;
    }
  }

  return IsEqual;
}

@end