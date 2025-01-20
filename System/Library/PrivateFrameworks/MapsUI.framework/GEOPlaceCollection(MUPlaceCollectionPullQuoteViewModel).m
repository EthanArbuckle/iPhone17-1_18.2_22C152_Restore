@interface GEOPlaceCollection(MUPlaceCollectionPullQuoteViewModel)
- (id)plainTextDescription;
- (id)publisherIconForIsNightMode:()MUPlaceCollectionPullQuoteViewModel;
- (id)publisherName;
@end

@implementation GEOPlaceCollection(MUPlaceCollectionPullQuoteViewModel)

- (id)publisherName
{
  v1 = [a1 publisherAttribution];
  v2 = [v1 displayName];

  return v2;
}

- (id)plainTextDescription
{
  v1 = [a1 publisherBlockQuote];
  v2 = [v1 plainTextDescription];

  return v2;
}

- (id)publisherIconForIsNightMode:()MUPlaceCollectionPullQuoteViewModel
{
  v5 = [MEMORY[0x1E4F30FA8] sharedInstance];
  v6 = [a1 publisherName];
  v7 = [a1 publisherAttribution];
  uint64_t v8 = [v7 iconIdentifier];
  v9 = [MEMORY[0x1E4F31038] sharedInstance];
  [v9 screenScale];
  v10 = objc_msgSend(v5, "iconForPublisherNamed:usingId:usingContentScale:usingSizeGroup:isNightMode:", v6, v8, 1, a3);

  return v10;
}

@end