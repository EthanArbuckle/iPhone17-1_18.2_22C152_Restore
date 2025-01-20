@interface PHBatchFetchedAssetPropertySet
+ (BOOL)useNoIndexSelf;
+ (BOOL)useObjectFetchingContext;
+ (NSArray)propertiesToFetch;
+ (NSArray)propertiesToSortBy;
+ (NSString)entityName;
+ (NSString)fetchType;
+ (int64_t)batchSize;
+ (int64_t)cacheSize;
- (NSKnownKeysDictionary)knownKeysDictionary;
- (NSManagedObjectID)objectID;
- (PHBatchFetchedAssetPropertySet)initWithObjectID:(id)a3 knownKeysDictionary:(id)a4 photoLibrary:(id)a5;
- (unint64_t)hash;
@end

@implementation PHBatchFetchedAssetPropertySet

- (PHBatchFetchedAssetPropertySet)initWithObjectID:(id)a3 knownKeysDictionary:(id)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHBatchFetchedAssetPropertySet;
  v10 = [(PHBatchFetchedAssetPropertySet *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_objectID, a3);
    objc_storeStrong((id *)&v11->_knownKeysDictionary, a4);
  }

  return v11;
}

+ (NSString)entityName
{
  return (NSString *)[MEMORY[0x1E4F8A950] entityName];
}

+ (NSString)fetchType
{
  return (NSString *)+[PHAsset fetchType];
}

- (NSKnownKeysDictionary)knownKeysDictionary
{
  return self->_knownKeysDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownKeysDictionary, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (unint64_t)hash
{
  v2 = [(PHBatchFetchedAssetPropertySet *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (NSArray)propertiesToSortBy
{
  return 0;
}

+ (BOOL)useObjectFetchingContext
{
  return 1;
}

+ (BOOL)useNoIndexSelf
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (int64_t)cacheSize
{
  return 100000;
}

+ (int64_t)batchSize
{
  return 2000;
}

+ (NSArray)propertiesToFetch
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end