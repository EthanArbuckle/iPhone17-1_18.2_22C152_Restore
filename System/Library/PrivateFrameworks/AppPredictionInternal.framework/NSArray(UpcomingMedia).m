@interface NSArray(UpcomingMedia)
- (id)atx_filterPlayMediaIntentsWithUnavailableAppDestinationGivenSBAppList:()UpcomingMedia;
@end

@implementation NSArray(UpcomingMedia)

- (id)atx_filterPlayMediaIntentsWithUnavailableAppDestinationGivenSBAppList:()UpcomingMedia
{
  id v5 = a3;
  if ([a1 count])
  {
    v6 = (void *)MEMORY[0x1E4F28F60];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __96__NSArray_UpcomingMedia__atx_filterPlayMediaIntentsWithUnavailableAppDestinationGivenSBAppList___block_invoke;
    v10[3] = &unk_1E68B3F58;
    uint64_t v12 = a2;
    v10[4] = a1;
    id v11 = v5;
    v7 = [v6 predicateWithBlock:v10];
    id v8 = [a1 filteredArrayUsingPredicate:v7];
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

@end