@interface CPLAssetKeywordSortDescriptor
+ (id)sortedKeywordsForKeywordSet:(id)a3;
- (CPLAssetKeywordSortDescriptor)init;
- (id)description;
- (int64_t)compareObject:(id)a3 toObject:(id)a4;
@end

@implementation CPLAssetKeywordSortDescriptor

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  return [a3 compare:a4];
}

- (CPLAssetKeywordSortDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLAssetKeywordSortDescriptor;
  return [(CPLAssetKeywordSortDescriptor *)&v3 init];
}

+ (id)sortedKeywordsForKeywordSet:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CPLAssetKeywordSortDescriptor_sortedKeywordsForKeywordSet___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = sortedKeywordsForKeywordSet__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&sortedKeywordsForKeywordSet__onceToken, block);
  }
  v5 = [v4 sortedArrayUsingDescriptors:sortedKeywordsForKeywordSet__sortDescriptors];

  return v5;
}

void __61__CPLAssetKeywordSortDescriptor_sortedKeywordsForKeywordSet___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1C978];
  id v4 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = [v1 arrayWithObject:v4];
  uint64_t v3 = (void *)sortedKeywordsForKeywordSet__sortDescriptors;
  sortedKeywordsForKeywordSet__sortDescriptors = v2;
}

@end