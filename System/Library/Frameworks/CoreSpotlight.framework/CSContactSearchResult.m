@interface CSContactSearchResult
@end

@implementation CSContactSearchResult

void __108___CSContactSearchResult_generateQueryStringForContact_filterQueries_includeSecondaryRecipients_inputScope___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  [NSString stringWithFormat:@"(%@=\"%@\"cd)", *(void *)(a1 + 40), a2];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

@end