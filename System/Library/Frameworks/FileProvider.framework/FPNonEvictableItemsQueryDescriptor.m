@interface FPNonEvictableItemsQueryDescriptor
- (id)name;
- (id)queryStringForMountPoint:(id)a3;
- (unint64_t)desiredCount;
- (void)augmentQueryContext:(id)a3;
@end

@implementation FPNonEvictableItemsQueryDescriptor

- (id)name
{
  return (id)[NSString stringWithUTF8String:"NEVC"];
}

- (id)queryStringForMountPoint:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v4 = [(FPSpotlightQueryDescriptor *)self settings];
  v5 = [v4 allowedFileTypes];

  v6 = [(FPSpotlightQueryDescriptor *)self settings];
  uint64_t v7 = [v6 excludedFileTypes];
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    v10 = (void *)v7;
  }
  else {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v10;

  v12 = NSString;
  v13 = FPContentTypeQueryStringForFileTypes(v5, v11);

  v14 = [(id)*MEMORY[0x1E4F443C8] identifier];
  v19[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v16 = FPContentTypeQueryStringForFileTypes(v9, v15);
  v17 = [v12 stringWithFormat:@"(%@) && ((%@) || ((%@) && (%@)))", v13, @"FPItemIsPinned == \"1\", v16, @"FPItemIsInPinnedFolder == \"0\" && FPEvictable == \"0\" && FPDownloaded == \"1\"];

  return v17;
}

- (unint64_t)desiredCount
{
  v2 = [(FPSpotlightQueryDescriptor *)self settings];
  uint64_t v3 = [v2 desiredNumberOfItems];
  v4 = (void *)v3;
  v5 = &unk_1EF6C38F0;
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  unint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (void)augmentQueryContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)FPNonEvictableItemsQueryDescriptor;
  id v13 = a3;
  -[FPSpotlightQueryDescriptor augmentQueryContext:](&v19, sel_augmentQueryContext_);
  uint64_t v3 = FPFileSizeAttributes();
  v14 = [v3 allValues];

  v4 = objc_opt_new();
  unint64_t v5 = 10000000000;
  do
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v14;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [NSString stringWithFormat:@"InRange(%@, %lu, %lu)", *(void *)(*((void *)&v15 + 1) + 8 * i), v5, 10 * v5 - 1];
          [v4 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }

    BOOL v12 = v5 > 0x13;
    v5 /= 0xAuLL;
  }
  while (v12);
  [v13 setRankingQueries:v4];
}

@end