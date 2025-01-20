@interface CPMLBestAppShim
+ (id)bestShim;
+ (id)bestShimWithDBPath:(id)a3 withModelPath:(id)a4 withPListPath:(id)a5;
- (id)rankItems:(id)a3 withMetaInfo:(id)a4 withNumOfRankItem:(unint64_t)a5;
- (void)feedback:(id)a3 withItemsVisited:(id)a4;
@end

@implementation CPMLBestAppShim

+ (id)bestShim
{
  return (id)[a1 bestShimWithDBPath:&stru_26ECD8E48 withModelPath:&stru_26ECD8E48 withPListPath:&stru_26ECD8E48];
}

+ (id)bestShimWithDBPath:(id)a3 withModelPath:(id)a4 withPListPath:(id)a5
{
  if (bestShimWithDBPath_withModelPath_withPListPath__token != -1) {
    dispatch_once(&bestShimWithDBPath_withModelPath_withPListPath__token, &__block_literal_global);
  }
  v5 = (void *)bestShimWithDBPath_withModelPath_withPListPath__instance;

  return v5;
}

uint64_t __66__CPMLBestAppShim_bestShimWithDBPath_withModelPath_withPListPath___block_invoke()
{
  id v0 = objc_alloc_init(NSDictionary);
  v1 = (void *)kCPMLExpertProposalNoDetail;
  kCPMLExpertProposalNoDetail = (uint64_t)v0;

  id v2 = objc_alloc_init(NSDictionary);
  v3 = (void *)kCPMLExpertProposalMoot;
  kCPMLExpertProposalMoot = (uint64_t)v2;

  bestShimWithDBPath_withModelPath_withPListPath__instance = objc_alloc_init(CPMLBestAppShim);

  return MEMORY[0x270F9A758]();
}

- (id)rankItems:(id)a3 withMetaInfo:(id)a4 withNumOfRankItem:(unint64_t)a5
{
  v6 = objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_5, a4);
  v7 = (void *)[v6 mutableCopy];
  objc_msgSend(v7, "removeObjectsInRange:", a5, objc_msgSend(v6, "count") - a5);
  v8 = objc_alloc_init(CPMLBestShimContext);
  v9 = (void *)[v7 copy];
  [(CPMLBestShimContext *)v8 setOrderedSuggestions:v9];

  return v8;
}

uint64_t __60__CPMLBestAppShim_rankItems_withMetaInfo_withNumOfRankItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 valueForKey:@"CPMLLastModifiedDate"];
  uint64_t v7 = [v6 integerValue];
  v8 = [v5 valueForKey:@"CPMLLastModifiedDate"];
  uint64_t v9 = [v8 integerValue];

  if (v7 <= v9)
  {
    v11 = [v4 valueForKey:@"CPMLLastModifiedDate"];
    uint64_t v12 = [v11 integerValue];
    v13 = [v5 valueForKey:@"CPMLLastModifiedDate"];
    uint64_t v14 = [v13 integerValue];

    if (v12 >= v14) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

- (void)feedback:(id)a3 withItemsVisited:(id)a4
{
}

@end