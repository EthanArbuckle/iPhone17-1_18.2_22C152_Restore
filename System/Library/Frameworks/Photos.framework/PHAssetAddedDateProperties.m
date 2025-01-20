@interface PHAssetAddedDateProperties
+ (BOOL)useNoIndexSelf;
+ (BOOL)useObjectFetchingContext;
+ (id)propertiesToFetch;
+ (int64_t)batchSize;
+ (int64_t)cacheSize;
- (NSDate)addedDate;
@end

@implementation PHAssetAddedDateProperties

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_69;

  return v2;
}

void __47__PHAssetAddedDateProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"addedDate";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_69;
  propertiesToFetch_pl_once_object_69 = v1;
}

+ (BOOL)useObjectFetchingContext
{
  return 0;
}

+ (BOOL)useNoIndexSelf
{
  return 1;
}

+ (int64_t)cacheSize
{
  return 20000;
}

+ (int64_t)batchSize
{
  return 5000;
}

- (NSDate)addedDate
{
  v2 = [(PHBatchFetchedAssetPropertySet *)self knownKeysDictionary];
  v3 = [v2 valueAtIndex:1];

  return (NSDate *)v3;
}

@end