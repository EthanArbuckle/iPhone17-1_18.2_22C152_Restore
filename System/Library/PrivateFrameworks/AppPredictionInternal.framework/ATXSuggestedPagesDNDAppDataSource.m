@interface ATXSuggestedPagesDNDAppDataSource
- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesDNDAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  v4 = +[ATXSuggestedPagesUtils semanticTypeForSuggestedPageType:](ATXSuggestedPagesUtils, "semanticTypeForSuggestedPageType:", a3, a4);
  if (v4)
  {
    v5 = [MEMORY[0x1E4F4AF78] sharedInstance];
    v6 = objc_msgSend(v5, "iOSAppAllowListForMode:", objc_msgSend(v4, "integerValue"));

    v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_142);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __81__ATXSuggestedPagesDNDAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F4B070];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithBundleId:v3 predictionSource:@"DND Configuration"];

  return v4;
}

@end