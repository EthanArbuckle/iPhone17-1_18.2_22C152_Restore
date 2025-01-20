@interface MPModelStoreRadioMusicKitRequestOperation
- (id)additionalCatalogURLQueryItems;
- (id)additionalURLRequestsWithStoreURLBag:(id)a3;
- (id)groupingNameBagKey;
- (id)groupingNameWithMusicSubscriptionDictionary:(id)a3;
- (id)radioStationWithDictionary:(id)a3;
- (id)recentlyPlayedItemWithDictionary:(id)a3;
- (id)recentlyPlayedItemsWithAPILoadedOutput:(id)a3;
- (id)recentlyPlayedSectionWithTitle:(id)a3;
- (id)recentlyPlayedURLWithStoreURLBag:(id)a3;
- (id)rootObjectIdentifierWithSubscriptionStatus:(int64_t)a3;
- (int64_t)radioStationSubTypeFromSubType:(id)a3;
- (int64_t)radioStationTypeFromKind:(id)a3;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation MPModelStoreRadioMusicKitRequestOperation

- (id)radioStationWithDictionary:(id)a3
{
  id v4 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke;
  v17[3] = &unk_1E57FA3B8;
  id v5 = v4;
  id v18 = v5;
  v6 = (void *)MEMORY[0x19971E0F0](v17);
  v7 = [MPModelRadioStation alloc];
  v8 = [MPIdentifierSet alloc];
  v9 = +[MPModelRadioStationKind identityKind];
  v10 = [(MPIdentifierSet *)v8 initWithSource:@"StorePlatform" modelKind:v9 block:v6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_3;
  v14[3] = &unk_1E57EEDB0;
  id v15 = v5;
  v16 = self;
  id v11 = v5;
  v12 = [(MPModelObject *)v7 initWithIdentifiers:v10 block:v14];

  return v12;
}

void __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 radio];
  id v5 = [v4 stationStringID];

  if (!v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_2;
    v6[3] = &unk_1E57F96F0;
    id v7 = *(id *)(a1 + 32);
    [v3 setRadioIdentifiersWithBlock:v6];
  }
}

void __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:@"attributes"];
  if (_NSIsNSDictionary())
  {
    id v5 = objc_msgSend(v4, "ic_stringValueForKey:", @"name");
    [v3 setName:v5];
    v6 = objc_msgSend(v4, "ic_stringValueForKey:", @"kind");
    objc_msgSend(v3, "setType:", objc_msgSend(*(id *)(a1 + 40), "radioStationTypeFromKind:", v6));
    id v7 = objc_msgSend(v4, "ic_stringValueForKey:", @"streamingRadioSubType");
    objc_msgSend(v3, "setSubtype:", objc_msgSend(*(id *)(a1 + 40), "radioStationSubTypeFromSubType:", v7));
    v8 = objc_msgSend(v4, "ic_dictionaryValueForKey:", @"editorialNotes");
    v9 = objc_msgSend(v8, "ic_stringValueForKey:", @"standard");
    [v3 setEditorNotes:v9];
    v10 = objc_msgSend(v8, "ic_stringValueForKey:", @"short");
    [v3 setShortEditorNotes:v10];
    id v11 = [v4 objectForKey:@"isLive"];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v3, "setLive:", objc_msgSend(v11, "BOOLValue"));
    }
    v12 = objc_msgSend(v4, "ic_stringValueForKey:", @"stationProviderName");
    [v3 setProviderName:v12];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_4;
    v13[3] = &unk_1E57EED88;
    id v14 = v4;
    [v3 setArtworkCatalogBlock:v13];
  }
}

MPArtworkCatalog *__72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_4(uint64_t a1)
{
  v2 = objc_alloc_init(MPStoreArtworkRequestToken);
  id v3 = [*(id *)(a1 + 32) objectForKey:@"artwork"];
  if (_NSIsNSDictionary())
  {
    uint64_t v4 = +[MPStoreItemMetadata artworkRequestTokenForStorePlatformArtworkValue:v3];

    v2 = (MPStoreArtworkRequestToken *)v4;
  }
  if (v2)
  {
    [(MPStoreArtworkRequestToken *)v2 setCropStyle:*MEMORY[0x1E4FB8478]];
    id v5 = [MPArtworkCatalog alloc];
    v6 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    id v7 = [(MPArtworkCatalog *)v5 initWithToken:v2 dataSource:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 objectForKeyedSubscript:@"id"];
  uint64_t v4 = MPStoreItemMetadataStringNormalizeStoreIDValue(v5);
  [v3 setStationStringID:v4];
}

- (id)recentlyPlayedItemWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[MPIdentifierSet emptyIdentifierSet];
  v6 = [(MPModelStoreRadioMusicKitRequestOperation *)self radioStationWithDictionary:v4];

  id v7 = [MPModelStoreBrowseContentItem alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__MPModelStoreRadioMusicKitRequestOperation_recentlyPlayedItemWithDictionary___block_invoke;
  v11[3] = &unk_1E57EED48;
  id v12 = v6;
  id v8 = v6;
  v9 = [(MPModelObject *)v7 initWithIdentifiers:v5 block:v11];

  return v9;
}

void __78__MPModelStoreRadioMusicKitRequestOperation_recentlyPlayedItemWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setItemType:5];
  [v3 setDetailedItemType:8];
  [v3 setRadioStation:*(void *)(a1 + 32)];
}

- (id)recentlyPlayedItemsWithAPILoadedOutput:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  if (_NSIsNSDictionary())
  {
    v6 = [v4 objectForKeyedSubscript:@"data"];
    if (_NSIsNSArray())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = -[MPModelStoreRadioMusicKitRequestOperation recentlyPlayedItemWithDictionary:](self, "recentlyPlayedItemWithDictionary:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
            [v5 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }

      v13 = (void *)[v5 copy];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)radioStationSubTypeFromSubType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Episode"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Shoutcast"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)radioStationTypeFromKind:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"albumSeeded"])
  {
    int64_t v4 = 10;
  }
  else
  {
    if ([v3 isEqualToString:@"artistOnly"]) {
      goto LABEL_4;
    }
    if ([v3 isEqualToString:@"artistSeeded"])
    {
      int64_t v4 = 2;
      goto LABEL_24;
    }
    if ([v3 isEqualToString:@"editorial"])
    {
      int64_t v4 = 6;
      goto LABEL_24;
    }
    if ([v3 isEqualToString:@"format"])
    {
      int64_t v4 = 5;
      goto LABEL_24;
    }
    if ([v3 isEqualToString:@"genre"])
    {
      int64_t v4 = 7;
      goto LABEL_24;
    }
    if ([v3 isEqualToString:@"libraryPlaylistSeeded"]) {
      goto LABEL_4;
    }
    if ([v3 isEqualToString:@"playlistSeeded"])
    {
      int64_t v4 = 9;
      goto LABEL_24;
    }
    if ([v3 isEqualToString:@"query"])
    {
LABEL_4:
      int64_t v4 = 0;
    }
    else if ([v3 isEqualToString:@"songSeeded"])
    {
      int64_t v4 = 1;
    }
    else if ([v3 isEqualToString:@"streaming"])
    {
      int64_t v4 = 4;
    }
    else if ([v3 isEqualToString:@"user"])
    {
      int64_t v4 = 8;
    }
    else
    {
      int64_t v4 = 0;
    }
  }
LABEL_24:

  return v4;
}

- (id)recentlyPlayedSectionWithTitle:(id)a3
{
  id v3 = a3;
  int64_t v4 = [MPModelStoreBrowseSection alloc];
  id v5 = +[MPIdentifierSet emptyIdentifierSet];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__MPModelStoreRadioMusicKitRequestOperation_recentlyPlayedSectionWithTitle___block_invoke;
  v9[3] = &unk_1E57EED20;
  id v10 = v3;
  id v6 = v3;
  id v7 = [(MPModelObject *)v4 initWithIdentifiers:v5 block:v9];

  return v7;
}

void __76__MPModelStoreRadioMusicKitRequestOperation_recentlyPlayedSectionWithTitle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setTitle:v2];
  [v3 setDisplaysAsGridCellInCarPlay:1];
  [v3 setSectionType:9];
  [v3 setLoadAdditionalContentURL:0];
}

- (id)rootObjectIdentifierWithSubscriptionStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E57EEDD0[a3 - 1];
  }
}

- (id)recentlyPlayedURLWithStoreURLBag:(id)a3
{
  id v3 = MusicURLComponentsWithURLBag(a3, 0);
  [v3 setPath:@"/v1/me/recent/radio-stations"];
  int64_t v4 = [v3 URL];

  return v4;
}

- (id)groupingNameWithMusicSubscriptionDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(MPModelStoreRadioMusicKitRequestOperation *)self groupingNameBagKey];
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"radio";
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)groupingNameBagKey
{
  uint64_t v2 = @"radioTabGroupingName";
  return @"radioTabGroupingName";
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [(MPStoreModelRequestOperation *)self request];
  if ([v8 additionalContent] == 1)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7102 userInfo:0];
      v7[2](v7, 0, v13);

      goto LABEL_9;
    }
    id v9 = v6;
    if ([v9 count] != 2)
    {
      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7102 userInfo:0];
      v7[2](v7, 0, v14);

      goto LABEL_9;
    }
    id v10 = [v9 firstObject];
    id v11 = [v9 lastObject];
  }
  else
  {
    id v10 = v6;
    id v11 = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v16[3] = &unk_1E57EECF8;
  id v17 = v8;
  long long v18 = self;
  id v19 = v11;
  uint64_t v20 = v7;
  v15.receiver = self;
  v15.super_class = (Class)MPModelStoreRadioMusicKitRequestOperation;
  id v12 = v11;
  [(MPModelStoreGroupingsMusicKitRequestOperation *)&v15 produceResponseWithLoadedOutput:v10 completion:v16];

LABEL_9:
}

void __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6519;
  v27 = __Block_byref_object_dispose__6520;
  id v28 = 0;
  id v7 = [v5 results];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_13;
  v18[3] = &unk_1E57EECD0;
  v18[4] = &v19;
  v18[5] = &v23;
  [v8 enumerateSectionsUsingBlock:v18];
  if (v20[3] == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v8, "removeSectionAtIndex:"), objc_msgSend(*(id *)(a1 + 32), "additionalContent") != 1))
  {
    id v10 = 0;
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) recentlyPlayedItemsWithAPILoadedOutput:*(void *)(a1 + 48)];
    if ([v9 count])
    {
      id v10 = [*(id *)(a1 + 40) recentlyPlayedSectionWithTitle:v24[5]];
      if (v10) {
        [v8 insertSection:v10 atIndex:v20[3]];
      }
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2;
      objc_super v15 = &unk_1E57F9E30;
      id v16 = v8;
      id v17 = &v19;
      [v9 enumerateObjectsUsingBlock:&v12];
    }
    else
    {
      id v10 = 0;
    }
  }
  id v11 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
  [v5 setResults:v11];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v23, 8);
}

void __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_13(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 sectionType] == 9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    uint64_t v7 = [v10 title];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

void __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (void *)MEMORY[0x1E4F28D58];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = a2;
  id v8 = [v4 indexPathForItem:a3 inSection:v6];
  [v5 insertItem:v7 atIndexPath:v8];
}

- (id)additionalCatalogURLQueryItems
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F290C8] queryItemWithName:@"include" value:@"stations"];
  id v3 = objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"include[stations]", @"events", v2);
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F290C8] queryItemWithName:@"art[editorial-elements:url]" value:@"f"];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (id)additionalURLRequestsWithStoreURLBag:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MPStoreModelRequestOperation *)self request];
  if ([v5 additionalContent] == 1)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F290D0];
    id v7 = [(MPModelStoreRadioMusicKitRequestOperation *)self recentlyPlayedURLWithStoreURLBag:v4];
    id v8 = [v6 requestWithURL:v7];
    v11[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

@end