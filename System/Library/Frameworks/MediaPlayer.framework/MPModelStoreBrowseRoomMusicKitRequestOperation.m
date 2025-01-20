@interface MPModelStoreBrowseRoomMusicKitRequestOperation
- (id)_produceResponseWithParser:(id)a3 results:(id)a4 error:(id *)a5;
- (id)_roomURLWithRoomID:(id)a3 storeURLBag:(id)a4;
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation MPModelStoreBrowseRoomMusicKitRequestOperation

- (void).cxx_destruct
{
}

- (id)_roomURLWithRoomID:(id)a3 storeURLBag:(id)a4
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 stringForBagKey:@"countryCode"];
  if (_NSIsNSString())
  {
    v9 = MusicURLComponentsWithURLBag(v7, 0);
    v10 = NSString;
    v27[0] = @"/v1/editorial";
    v27[1] = v8;
    v27[2] = @"rooms";
    v27[3] = v6;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    v12 = [v10 pathWithComponents:v11];
    [v9 setPath:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F290C8]);
    v14 = [(MPStoreModelRequestOperation *)self request];
    uint64_t v15 = [v14 clientPlatformIdentifier];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = @"iphone";
    }
    v18 = (void *)[v13 initWithName:@"platform" value:v17];
    v26 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v9 setQueryItems:v19];

    v20 = MusicURLQueryItemLanguageWithURLBag(v7);
    if (v20)
    {
      v21 = [v9 queryItems];
      v22 = [v21 arrayByAddingObject:v20];
      [v9 setQueryItems:v22];
    }
    v23 = [v9 URL];
  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "No country code found in bag, can't create storefront endpoint URL", v25, 2u);
    }
    v23 = 0;
  }

  return v23;
}

- (id)_produceResponseWithParser:(id)a3 results:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v12 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v10 = [MPModelStoreBrowseResponse alloc];
  v11 = [(MPStoreModelRequestOperation *)self request];
  v12 = [(MPModelResponse *)v10 initWithRequest:v11];

  [(MPModelStoreBrowseResponse *)v12 setParser:v8];
  if ([v9 numberOfSections] >= 1) {
    [(MPModelResponse *)v12 setResults:v9];
  }
  if (a5)
  {
LABEL_7:
    if (!v12)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7102 userInfo:0];
    }
  }
LABEL_9:

  return v12;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(MPStoreModelRequestOperation *)self request];
  id v9 = +[MPModelStoreBrowseSectionBuilder allSupportedInternalOnlyProperties];
  v10 = [v8 sectionProperties];
  uint64_t v11 = [v9 propertySetByCombiningWithPropertySet:v10];

  v27 = (void *)v11;
  v12 = [[MPModelStoreBrowseSectionBuilder alloc] initWithRequestedPropertySet:v11];
  v29[0] = @"MPModelStoreBrowseContentItemPropertyItemType";
  v29[1] = @"MPModelStoreBrowseContentItemPropertyDetailedItemType";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v14 = +[MPPropertySet propertySetWithProperties:v13];

  uint64_t v15 = [MPModelStoreBrowseContentItemBuilder alloc];
  v16 = [v8 itemProperties];
  v17 = [v16 propertySetByCombiningWithPropertySet:v14];
  v18 = [(MPModelStoreBrowseContentItemBuilder *)v15 initWithRequestedPropertySet:v17];

  v19 = self->_allowedFCKinds;
  v20 = [MPModelStoreBrowseRoomMusicKitResponseParser alloc];
  v21 = [(MPAsyncOperation *)self userIdentity];
  v22 = [(MPModelStoreBrowseRoomMusicKitResponseParser *)v20 initWithRawResponseOutput:v7 sectionBuilder:v12 contentItemBuilder:v18 filteredFCKinds:v19 userIdentity:v21];

  v23 = [(MPModelStoreBrowseRoomMusicKitResponseParser *)v22 results];
  id v28 = 0;
  v24 = [(MPModelStoreBrowseRoomMusicKitRequestOperation *)self _produceResponseWithParser:v22 results:v23 error:&v28];
  id v25 = v28;

  if (!v24)
  {
    uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7102 userInfo:0];

    id v25 = (id)v26;
  }
  v6[2](v6, v24, v25);
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MPStoreModelRequestOperation *)self request];
  id v8 = [v7 loadAdditionalContentURL];
  if (v8
    || ([v7 roomID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [(MPModelStoreBrowseRoomMusicKitRequestOperation *)self _roomURLWithRoomID:v9 storeURLBag:v6], id v8 = objc_claimAutoreleasedReturnValue(), v9, v8))
  {
    v10 = [MEMORY[0x1E4F28E88] requestWithURL:v8];
    [v10 setHTTPMethod:@"GET"];
    [(MPStoreModelRequestOperation *)self remainingTimeInterval];
    objc_msgSend(v10, "setTimeoutInterval:");
    uint64_t v11 = [MPStoreModelRequestConfiguration alloc];
    v12 = (void *)[v10 copy];
    id v13 = [(MPStoreModelRequestConfiguration *)v11 initWithURLRequest:v12];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7201 userInfo:0];
    id v8 = 0;
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
    id v13 = 0;
  }
  v14 = v13;

  return v14;
}

@end