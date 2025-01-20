@interface MPModelStoreBrowseResponseParser
- ($96EE1C12479E9B303E9C2794B92A11A2)options;
- (BOOL)_parseFeaturedContentChild:(id)a3 isMemberOfChartSet:(BOOL)a4 insertingResultsToSectionedCollection:(id)a5 atSectionIndex:(int64_t)a6 additionalContentIdentifiers:(id)a7 allAdditionalContentIdentifiersNeedingLookup:(id)a8;
- (BOOL)_storeItemMetadataIsAvailableForContentIdentifier:(id)a3;
- (MPChangeDetails)changeDetails;
- (MPModelStoreBrowseContentItemBuilder)contentItemBuilder;
- (MPModelStoreBrowseResponseParser)initWithPreviousParser:(id)a3 additionalStoreItemMetadataResponse:(id)a4 options:(id)a5 sectionBuilder:(id)a6 contentItemBuilder:(id)a7 userIdentity:(id)a8;
- (MPModelStoreBrowseResponseParser)initWithRawResponseOutput:(id)a3 options:(id)a4 sectionBuilder:(id)a5 contentItemBuilder:(id)a6 userIdentity:(id)a7;
- (MPModelStoreBrowseResponseParser)previousParser;
- (MPModelStoreBrowseSectionBuilder)sectionBuilder;
- (MPSectionedCollection)additionalContentIdentifiers;
- (MPSectionedCollection)results;
- (MPStoreItemMetadataResponse)additionalStoreItemMetadataResponse;
- (NSArray)allAdditionalContentIdentifiersNeedingLookup;
- (id)_storeItemMetadataForContentIdentifier:(id)a3;
- (id)rawResponseOutput;
- (void)_parse;
- (void)_parseFeaturedContentStructureModelChildren:(id)a3;
- (void)_parseSingleContentListFromPageDataDictionary:(id)a3 isMemberOfChartSet:(BOOL)a4;
- (void)_parseUsingAdditionalContentIdentifiersFromPreviousParser;
- (void)_populateStorePlatformDataResultsFromRawResponseOutputDictionary:(id)a3;
- (void)_populateUnavailableContentIdentifiersFromPageDataDictionary:(id)a3;
@end

@implementation MPModelStoreBrowseResponseParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
  objc_storeStrong((id *)&self->_sectionBuilder, 0);
  objc_storeStrong((id *)&self->_additionalStoreItemMetadataResponse, 0);
  objc_storeStrong((id *)&self->_previousParser, 0);
  objc_storeStrong(&self->_rawResponseOutput, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_unavailableContentIdentifiers, 0);
  objc_storeStrong((id *)&self->_storePlatformDataResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_allAdditionalContentIdentifiersNeedingLookup, 0);

  objc_storeStrong((id *)&self->_additionalContentIdentifiers, 0);
}

- (MPChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (MPModelStoreBrowseContentItemBuilder)contentItemBuilder
{
  return self->_contentItemBuilder;
}

- (MPModelStoreBrowseSectionBuilder)sectionBuilder
{
  return self->_sectionBuilder;
}

- (MPStoreItemMetadataResponse)additionalStoreItemMetadataResponse
{
  return self->_additionalStoreItemMetadataResponse;
}

- (MPModelStoreBrowseResponseParser)previousParser
{
  return self->_previousParser;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)options
{
  return ($96EE1C12479E9B303E9C2794B92A11A2)self->_options;
}

- (id)rawResponseOutput
{
  return self->_rawResponseOutput;
}

- (BOOL)_storeItemMetadataIsAvailableForContentIdentifier:(id)a3
{
  id v4 = a3;
  if ([(MPModelStoreBrowseResponseParser *)self->_previousParser _storeItemMetadataIsAvailableForContentIdentifier:v4]|| ([(MPStoreItemMetadataResponse *)self->_additionalStoreItemMetadataResponse storeItemMetadataForItemIdentifier:v4], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(NSDictionary *)self->_storePlatformDataResults objectForKey:v4];
    char v6 = _NSIsNSDictionary();
  }
  return v6;
}

- (id)_storeItemMetadataForContentIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(MPModelStoreBrowseResponseParser *)self->_previousParser _storeItemMetadataForContentIdentifier:v4];
  if (!v5)
  {
    v5 = [(MPStoreItemMetadataResponse *)self->_additionalStoreItemMetadataResponse storeItemMetadataForItemIdentifier:v4];
    if (!v5)
    {
      char v6 = [(NSDictionary *)self->_storePlatformDataResults objectForKey:v4];
      if (_NSIsNSDictionary())
      {
        id v7 = v6;
        v5 = [[MPStoreItemMetadata alloc] initWithStorePlatformDictionary:v7];
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (void)_populateUnavailableContentIdentifiersFromPageDataDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"unAvailableContentIds"];
  if (_NSIsNSDictionary())
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__47029;
    v25 = __Block_byref_object_dispose__47030;
    id v26 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97__MPModelStoreBrowseResponseParser__populateUnavailableContentIdentifiersFromPageDataDictionary___block_invoke;
    v20[3] = &unk_1E57F7748;
    v20[4] = &v21;
    [v5 enumerateKeysAndObjectsUsingBlock:v20];
    char v6 = (NSSet *)[(id)v22[5] copy];
    unavailableContentIdentifiers = self->_unavailableContentIdentifiers;
    self->_unavailableContentIdentifiers = v6;

    _Block_object_dispose(&v21, 8);
  }
  else if ([v5 conformsToProtocol:&unk_1EE715FB8])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    id v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = MPStoreItemMetadataStringNormalizeStoreIDValue(*(void **)(*((void *)&v16 + 1) + 8 * v12));
          if (v13)
          {
            if (!v9) {
              id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            objc_msgSend(v9, "addObject:", v13, (void)v16);
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v27 count:16];
      }
      while (v10);
    }

    v14 = (NSSet *)[v9 copy];
    v15 = self->_unavailableContentIdentifiers;
    self->_unavailableContentIdentifiers = v14;
  }
}

void __97__MPModelStoreBrowseResponseParser__populateUnavailableContentIdentifiersFromPageDataDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 BOOLValue])
  {
    char v6 = MPStoreItemMetadataStringNormalizeStoreIDValue(v11);
    if (v6)
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (!v7)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      [v7 addObject:v6];
    }
  }
}

- (void)_populateStorePlatformDataResultsFromRawResponseOutputDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"storePlatformData"];
  if (_NSIsNSDictionary())
  {
    char v6 = [v5 allValues];
    id v7 = [v6 firstObject];

    if (_NSIsNSDictionary())
    {
      id v8 = [v7 objectForKey:@"results"];
      if (_NSIsNSDictionary())
      {
        id v9 = v8;
        uint64_t v13 = 0;
        v14 = &v13;
        uint64_t v15 = 0x3032000000;
        long long v16 = __Block_byref_object_copy__47029;
        long long v17 = __Block_byref_object_dispose__47030;
        id v18 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __101__MPModelStoreBrowseResponseParser__populateStorePlatformDataResultsFromRawResponseOutputDictionary___block_invoke;
        v12[3] = &unk_1E57F7748;
        v12[4] = &v13;
        [v9 enumerateKeysAndObjectsUsingBlock:v12];
        uint64_t v10 = (NSDictionary *)[(id)v14[5] copy];
        storePlatformDataResults = self->_storePlatformDataResults;
        self->_storePlatformDataResults = v10;

        _Block_object_dispose(&v13, 8);
      }
    }
  }
}

void __101__MPModelStoreBrowseResponseParser__populateStorePlatformDataResultsFromRawResponseOutputDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = MPStoreItemMetadataStringNormalizeStoreIDValue(a2);
  if (v5 && _NSIsNSDictionary())
  {
    id v6 = v12;
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    id v11 = (void *)[v6 copy];
    [v7 setObject:v11 forKey:v5];
  }
}

- (void)_parseUsingAdditionalContentIdentifiersFromPreviousParser
{
  v3 = [(MPModelStoreBrowseResponseParser *)self->_previousParser results];
  id v4 = [(MPModelStoreBrowseResponseParser *)self->_previousParser additionalContentIdentifiers];
  id v5 = objc_alloc_init(MPMutableSectionedCollection);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MPMutableSectionedCollection);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke;
  v28[3] = &unk_1E57F77C0;
  uint64_t v9 = v7;
  v29 = v9;
  uint64_t v10 = v5;
  v30 = v10;
  id v11 = v3;
  id v31 = v11;
  id v12 = v4;
  id v32 = v12;
  v33 = self;
  id v13 = v6;
  id v34 = v13;
  id v14 = v8;
  id v35 = v14;
  [v11 enumerateSectionsUsingBlock:v28];
  if ([v13 count])
  {
    uint64_t v15 = [MPChangeDetails alloc];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_4;
    id v26 = &unk_1E57F77E8;
    id v27 = v13;
    long long v16 = [(MPChangeDetails *)v15 initWithBlock:&v23];
  }
  else
  {
    long long v16 = 0;
  }
  if ([(MPSectionedCollection *)v10 numberOfSections] <= 0)
  {
    results = self->_results;
    self->_results = 0;
  }
  else
  {
    long long v17 = (MPSectionedCollection *)[(MPMutableSectionedCollection *)v10 copy];
    results = self->_results;
    self->_results = v17;
  }

  objc_storeStrong((id *)&self->_changeDetails, v16);
  if ([(MPSectionedCollection *)v9 numberOfSections] <= 0)
  {
    additionalContentIdentifiers = self->_additionalContentIdentifiers;
    self->_additionalContentIdentifiers = 0;
  }
  else
  {
    long long v19 = (MPSectionedCollection *)[(MPMutableSectionedCollection *)v9 copy];
    additionalContentIdentifiers = self->_additionalContentIdentifiers;
    self->_additionalContentIdentifiers = v19;
  }

  if ([v14 count])
  {
    uint64_t v21 = (NSArray *)[v14 copy];
    allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
    self->_allAdditionalContentIdentifiersNeedingLookup = v21;
  }
  else
  {
    allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
    self->_allAdditionalContentIdentifiersNeedingLookup = 0;
  }
}

void __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) appendSection:v5];
  [*(id *)(a1 + 40) appendSection:v5];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_2;
  v21[3] = &unk_1E57F7770;
  id v6 = *(void **)(a1 + 48);
  id v22 = *(id *)(a1 + 40);
  [v6 enumerateItemsInSectionAtIndex:a3 usingBlock:v21];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v20 = [*(id *)(a1 + 40) numberOfItemsInSection:a3];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_3;
  v9[3] = &unk_1E57F7798;
  id v8 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v14 = v17;
  v9[4] = v7;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 72);
  uint64_t v15 = v19;
  uint64_t v16 = a3;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 80);
  [v8 enumerateItemsInSectionAtIndex:a3 usingBlock:v9];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

uint64_t __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setInsertedItemIndexPaths:*(void *)(a1 + 32)];
}

uint64_t __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendItem:a2];
}

void __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v12 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    char v11 = [v4 _storeItemMetadataIsAvailableForContentIdentifier:v3];
    [*(id *)(a1 + 56) appendItem:v12];
    id v10 = v12;
    if (v11) {
      goto LABEL_10;
    }
LABEL_9:
    [*(id *)(a1 + 64) addObject:v12];
    id v10 = v12;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    goto LABEL_10;
  }
  uint64_t v5 = [v4 _storeItemMetadataForContentIdentifier:v3];
  if (!v5)
  {
    [*(id *)(a1 + 56) appendItem:v12];
    goto LABEL_9;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 104) modelObjectWithStoreItemMetadata:v5 userIdentity:*(void *)(*(void *)(a1 + 32) + 56)];
  if (v7)
  {
    [*(id *)(a1 + 40) appendItem:v7];
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) inSection:*(void *)(a1 + 88)];
    [v8 addObject:v9];

    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  }

  id v10 = v12;
LABEL_10:
}

- (void)_parseSingleContentListFromPageDataDictionary:(id)a3 isMemberOfChartSet:(BOOL)a4
{
  BOOL v50 = a4;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v53 = [v54 objectForKey:@"title"];
  if ((_NSIsNSString() & 1) == 0)
  {

LABEL_5:
    id v4 = [v54 objectForKey:@"pageTitle"];
    if (_NSIsNSString()) {
      id v53 = v4;
    }
    else {
      id v53 = 0;
    }

    goto LABEL_9;
  }
  if (!v53) {
    goto LABEL_5;
  }
LABEL_9:
  uint64_t v5 = [v54 objectForKey:@"seeAllUrl"];
  if (_NSIsNSString())
  {
    v51 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  }
  else
  {
    v51 = 0;
  }

  v57 = objc_alloc_init(MPModelStoreBrowseSectionUniformContentItemTypeResolver);
  v52 = [v54 objectForKey:@"adamIds"];
  if (!_NSIsNSArray())
  {
    v55 = 0;
    v56 = 0;
    id v8 = 0;
    goto LABEL_43;
  }
  id v6 = v52;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v78 objects:v85 count:16];
  if (!v7)
  {
    v55 = 0;
    v56 = 0;
    id v8 = 0;
    goto LABEL_42;
  }
  v55 = 0;
  v56 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v79;
  char v10 = 1;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v79 != v9) {
        objc_enumerationMutation(v6);
      }
      id v12 = MPStoreItemMetadataStringNormalizeStoreIDValue(*(void **)(*((void *)&v78 + 1) + 8 * i));
      if (v12 && ![(NSSet *)self->_unavailableContentIdentifiers containsObject:v12])
      {
        if (v10)
        {
          id v13 = [(MPModelStoreBrowseResponseParser *)self _storeItemMetadataForContentIdentifier:v12];
          BOOL v14 = v13 != 0;
          if (v13)
          {
            uint64_t v15 = [(MPStoreModelObjectBuilder *)self->_contentItemBuilder modelObjectWithStoreItemMetadata:v13 userIdentity:self->_userIdentity];
            if (v15)
            {
              id v16 = v55;
              if (!v55) {
                id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              v55 = v16;
              [v16 addObject:v15];
              uint64_t v17 = [v15 detailedItemType];
            }
            else
            {
              uint64_t v17 = 0;
            }

            char v10 = 1;
LABEL_36:
            [(MPModelStoreBrowseSectionUniformContentItemTypeResolver *)v57 addContentItemType:v17];
            goto LABEL_37;
          }
        }
        else
        {
          BOOL v14 = [(MPModelStoreBrowseResponseParser *)self _storeItemMetadataIsAvailableForContentIdentifier:v12];
        }
        id v18 = v8;
        if (!v8) {
          id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        id v8 = v18;
        [v18 addObject:v12];
        if (v14)
        {
          uint64_t v17 = 0;
        }
        else
        {
          id v19 = v56;
          if (!v56) {
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v56 = v19;
          [v19 addObject:v12];
          uint64_t v17 = 0;
          char v10 = 0;
        }
        goto LABEL_36;
      }
LABEL_37:
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v78 objects:v85 count:16];
  }
  while (v7);
LABEL_42:

LABEL_43:
  uint64_t v20 = [(MPModelStoreBrowseSectionUniformContentItemTypeResolver *)v57 uniformContentItemType];
  if (!v20)
  {
    uint64_t v21 = [v54 objectForKey:@"kinds"];
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__47029;
    v76 = __Block_byref_object_dispose__47030;
    id v77 = 0;
    if (_NSIsNSDictionary())
    {
      id v22 = v21;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __101__MPModelStoreBrowseResponseParser__parseSingleContentListFromPageDataDictionary_isMemberOfChartSet___block_invoke;
      v71[3] = &unk_1E57F7748;
      v71[4] = &v72;
      [v22 enumerateKeysAndObjectsUsingBlock:v71];
      goto LABEL_59;
    }
    if ([v21 conformsToProtocol:&unk_1EE715FB8])
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v84 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v68 != v25) {
              objc_enumerationMutation(v23);
            }
            id v27 = *(void **)(*((void *)&v67 + 1) + 8 * j);
            if (_NSIsNSString())
            {
              id v28 = v27;
              v29 = (void *)v73[5];
              if (!v29)
              {
                id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                id v31 = (void *)v73[5];
                v73[5] = (uint64_t)v30;

                v29 = (void *)v73[5];
              }
              [v29 addObject:v28];
            }
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v84 count:16];
        }
        while (v24);
      }

LABEL_59:
    }
    if ([(id)v73[5] count] == 1)
    {
      id v32 = [(id)v73[5] anyObject];
      if ([v32 isEqualToString:@"album"])
      {
        uint64_t v20 = 1;
      }
      else if ([v32 isEqualToString:@"musicVideo"])
      {
        uint64_t v20 = 6;
      }
      else if ([v32 isEqualToString:@"song"])
      {
        uint64_t v20 = 10;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    _Block_object_dispose(&v72, 8);
  }
  v33 = [(MPModelStoreBrowseSectionBuilder *)self->_sectionBuilder modelObjectWithTitle:v53 loadAdditionalContentURL:v51 uniformContentItemType:v20 isMemberOfChartSet:v50 isBrick:0 previouslyRetrievedNestedResponse:0];
  id v34 = objc_alloc_init(MPMutableSectionedCollection);
  [(MPMutableSectionedCollection *)v34 appendSection:v33];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v35 = v55;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v83 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v64 != v37) {
          objc_enumerationMutation(v35);
        }
        [(MPMutableSectionedCollection *)v34 appendItem:*(void *)(*((void *)&v63 + 1) + 8 * k)];
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v83 count:16];
    }
    while (v36);
  }

  v39 = objc_alloc_init(MPMutableSectionedCollection);
  [(MPMutableSectionedCollection *)v39 appendSection:v33];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v40 = v8;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v82 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v60;
    do
    {
      for (uint64_t m = 0; m != v41; ++m)
      {
        if (*(void *)v60 != v42) {
          objc_enumerationMutation(v40);
        }
        [(MPMutableSectionedCollection *)v39 appendItem:*(void *)(*((void *)&v59 + 1) + 8 * m)];
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v82 count:16];
    }
    while (v41);
  }

  v44 = (MPSectionedCollection *)[(MPMutableSectionedCollection *)v34 copy];
  results = self->_results;
  self->_results = v44;

  v46 = (MPSectionedCollection *)[(MPMutableSectionedCollection *)v39 copy];
  additionalContentIdentifiers = self->_additionalContentIdentifiers;
  self->_additionalContentIdentifiers = v46;

  v48 = (NSArray *)[v56 copy];
  allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
  self->_allAdditionalContentIdentifiersNeedingLookup = v48;
}

void __101__MPModelStoreBrowseResponseParser__parseSingleContentListFromPageDataDictionary_isMemberOfChartSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (_NSIsNSString()
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v5 BOOLValue])
  {
    id v6 = v11;
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      char v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v7 addObject:v6];
  }
}

- (BOOL)_parseFeaturedContentChild:(id)a3 isMemberOfChartSet:(BOOL)a4 insertingResultsToSectionedCollection:(id)a5 atSectionIndex:(int64_t)a6 additionalContentIdentifiers:(id)a7 allAdditionalContentIdentifiersNeedingLookup:(id)a8
{
  BOOL v11 = a4;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v96 = a5;
  id v95 = a7;
  id v86 = a8;
  if (_NSIsNSDictionary())
  {
    BOOL v77 = v11;
    id v14 = v13;
    id v15 = [v14 objectForKey:@"name"];
    if (_NSIsNSString())
    {
      if (v15) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v17 = [v14 objectForKey:@"title"];
    if (_NSIsNSString()) {
      id v15 = v17;
    }
    else {
      id v15 = 0;
    }

LABEL_11:
    v91 = self;
    id v18 = [v14 objectForKey:@"seeAllUrl"];
    if (_NSIsNSString())
    {
      id v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];

      if (v19) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v20 = [v14 objectForKey:@"link"];
    if (_NSIsNSDictionary())
    {
      uint64_t v21 = [v20 objectForKey:@"url"];
      if (_NSIsNSString())
      {
        id v19 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
      }
      else
      {
        id v19 = 0;
      }
    }
    else
    {
      id v19 = 0;
    }

LABEL_22:
    id v22 = [v14 objectForKey:@"fcKind"];
    BOOL v76 = (objc_opt_respondsToSelector() & 1) != 0 && [v22 integerValue] == 325;
    id v23 = [v14 objectForKey:@"content"];
    if (_NSIsNSArray())
    {
      if (v23) {
        goto LABEL_33;
      }
    }
    else
    {
    }
    uint64_t v24 = [v14 objectForKey:@"links"];
    if (_NSIsNSArray()) {
      id v23 = v24;
    }
    else {
      id v23 = 0;
    }

LABEL_33:
    v92 = objc_alloc_init(MPModelStoreBrowseSectionUniformContentItemTypeResolver);
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    obuint64_t j = v23;
    uint64_t v25 = (void *)[obj countByEnumeratingWithState:&v107 objects:v113 count:16];
    if (v25)
    {
      long long v79 = v22;
      long long v81 = v19;
      id v82 = v15;
      id v84 = v14;
      id v78 = v13;
      id v87 = 0;
      id v89 = 0;
      int v93 = 0;
      uint64_t v26 = *(void *)v108;
      char v27 = 1;
      id v28 = v91;
      while (1)
      {
        for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v108 != v26) {
            objc_enumerationMutation(obj);
          }
          id v30 = *(void **)(*((void *)&v107 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            id v31 = v30;
            id v32 = [v31 objectForKey:@"type"];
            if (_NSIsNSString()) {
              int v33 = [v32 isEqualToString:@"content"];
            }
            else {
              int v33 = 0;
            }
            id v34 = [v31 objectForKey:@"contentId"];
            id v35 = v34;
            if (!v34)
            {
              uint64_t v36 = 0;
              goto LABEL_86;
            }
            uint64_t v36 = MPStoreItemMetadataStringNormalizeStoreIDValue(v34);
            if (v36) {
              int v37 = v33;
            }
            else {
              int v37 = 0;
            }
            if (v37 != 1 || [(NSSet *)v28->_unavailableContentIdentifiers containsObject:v36]) {
              goto LABEL_86;
            }
            uint64_t v38 = [(MPModelStoreBrowseResponseParser *)v28 _storeItemMetadataForContentIdentifier:v36];
            contentItemBuilder = v28->_contentItemBuilder;
            v94 = (void *)v38;
            if (v38)
            {
              if (v27)
              {
                id v40 = [(MPStoreModelObjectBuilder *)contentItemBuilder modelObjectWithStoreItemMetadata:v38 userIdentity:v28->_userIdentity];
                if (v40)
                {
                  uint64_t v41 = v40;
                  uint64_t v42 = [v40 detailedItemType];
                  id v43 = v87;
                  if (!v87) {
                    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  id v87 = v43;
                  [v43 addObject:v41];

                  if (v93) {
                    int v44 = v93;
                  }
                  else {
                    int v44 = 1;
                  }
                  if (v42)
                  {
                    char v27 = 1;
                    goto LABEL_80;
                  }
                }
                else if (v93)
                {
                  int v44 = v93;
                }
                else
                {
                  int v44 = 1;
                }
                int v93 = v44;
                v48 = v94;
                uint64_t v42 = 0;
                char v27 = 1;
LABEL_85:
                [(MPModelStoreBrowseSectionUniformContentItemTypeResolver *)v92 addContentItemType:v42];

                id v28 = v91;
LABEL_86:

                continue;
              }
              v48 = (void *)v38;
              uint64_t v49 = [(MPModelStoreBrowseContentItemBuilder *)v28->_contentItemBuilder contentItemTypeForStoreItemMetadata:v38];
              uint64_t v42 = v49;
              if ((v93 & 1) == 0 && v49 == 0) {
                int v51 = 1;
              }
              else {
                int v51 = v93;
              }
              int v93 = v51;
              if (v49)
              {
LABEL_74:
                id v52 = v89;
                if (!v89) {
                  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                id v89 = v52;
                [v52 addObject:v36];
                if (!v48) {
                  [v86 addObject:v36];
                }
              }
              char v27 = 0;
              goto LABEL_85;
            }
            v45 = [v31 objectForKey:@"kindIds"];
            uint64_t v42 = [(MPModelStoreBrowseContentItemBuilder *)contentItemBuilder contentItemTypeForRawResponseKindIdentifiers:v45];

            if ((v93 & 1) == 0 && v42 == 0) {
              int v47 = 1;
            }
            else {
              int v47 = v93;
            }
            int v93 = v47;
            if (!v42)
            {
              char v27 = 0;
LABEL_80:
              v48 = v94;
              goto LABEL_85;
            }
            v48 = 0;
            goto LABEL_74;
          }
        }
        uint64_t v25 = (void *)[obj countByEnumeratingWithState:&v107 objects:v113 count:16];
        if (!v25)
        {
          char v53 = v93 & 1;
          id v13 = v78;
          id v22 = v79;
          id v15 = v82;
          id v14 = v84;
          id v19 = v81;
          uint64_t v25 = v87;
          id v54 = v89;
          goto LABEL_91;
        }
      }
    }
    id v54 = 0;
    char v53 = 0;
LABEL_91:

    uint64_t v55 = [(MPModelStoreBrowseSectionUniformContentItemTypeResolver *)v92 uniformContentItemType];
    uint64_t v56 = [v25 count];
    if (v56) {
      char v57 = 0;
    }
    else {
      char v57 = v53;
    }
    if ((v57 & 1) != 0 || v56)
    {
      if (v57)
      {
LABEL_102:
        BOOL v16 = 0;
LABEL_118:

        goto LABEL_119;
      }
    }
    else
    {
      BOOL v16 = 0;
      if (!v15 || !v19) {
        goto LABEL_118;
      }
    }
    if (!v91->_options.useCarPlayBrowseTopLevelContentOnly || v55 != 7)
    {
      v90 = v54;
      long long v80 = v22;
      id v83 = v15;
      id v85 = v14;
      v58 = [(MPModelStoreBrowseSectionBuilder *)v91->_sectionBuilder modelObjectWithTitle:v15 loadAdditionalContentURL:v19 uniformContentItemType:v55 isMemberOfChartSet:v77 isBrick:v76 previouslyRetrievedNestedResponse:0];
      [v96 insertSection:v58 atIndex:a6];
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      v88 = v25;
      id v59 = v25;
      uint64_t v60 = [v59 countByEnumeratingWithState:&v103 objects:v112 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = 0;
        uint64_t v63 = *(void *)v104;
        do
        {
          for (uint64_t j = 0; j != v61; ++j)
          {
            if (*(void *)v104 != v63) {
              objc_enumerationMutation(v59);
            }
            uint64_t v65 = *(void *)(*((void *)&v103 + 1) + 8 * j);
            long long v66 = [MEMORY[0x1E4F28D58] indexPathForItem:v62 + j inSection:a6];
            [v96 insertItem:v65 atIndexPath:v66];
          }
          v62 += j;
          uint64_t v61 = [v59 countByEnumeratingWithState:&v103 objects:v112 count:16];
        }
        while (v61);
      }

      [v95 insertSection:v58 atIndex:a6];
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v67 = v90;
      uint64_t v68 = [v67 countByEnumeratingWithState:&v99 objects:v111 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v70 = 0;
        uint64_t v71 = *(void *)v100;
        do
        {
          for (uint64_t k = 0; k != v69; ++k)
          {
            if (*(void *)v100 != v71) {
              objc_enumerationMutation(v67);
            }
            uint64_t v73 = *(void *)(*((void *)&v99 + 1) + 8 * k);
            uint64_t v74 = [MEMORY[0x1E4F28D58] indexPathForItem:v70 + k inSection:a6];
            [v95 insertItem:v73 atIndexPath:v74];
          }
          v70 += k;
          uint64_t v69 = [v67 countByEnumeratingWithState:&v99 objects:v111 count:16];
        }
        while (v69);
      }

      BOOL v16 = 1;
      id v15 = v83;
      id v14 = v85;
      id v22 = v80;
      uint64_t v25 = v88;
      id v54 = v90;
      goto LABEL_118;
    }
    goto LABEL_102;
  }
  BOOL v16 = 0;
LABEL_119:

  return v16;
}

- (void)_parseFeaturedContentStructureModelChildren:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v5 addIndex:324];
  [v5 addIndex:323];
  [v5 addIndex:326];
  if (!self->_options.useCarPlayBrowseTopLevelContentOnly)
  {
    [v5 addIndex:327];
    [v5 addIndex:328];
  }
  [v5 addIndex:329];
  id v6 = objc_alloc_init(MPMutableSectionedCollection);
  uint64_t v7 = objc_alloc_init(MPMutableSectionedCollection);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    int v51 = 0;
    int v41 = 0;
    uint64_t v13 = *(void *)v59;
    id v43 = v9;
    id v44 = v5;
    uint64_t v42 = *(void *)v59;
    do
    {
      uint64_t v14 = 0;
      uint64_t v45 = v11;
      do
      {
        if (*(void *)v59 != v13)
        {
          uint64_t v15 = v14;
          objc_enumerationMutation(v9);
          uint64_t v14 = v15;
        }
        uint64_t v48 = v14;
        BOOL v16 = *(void **)(*((void *)&v58 + 1) + 8 * v14);
        if (_NSIsNSDictionary())
        {
          id v47 = v16;
          uint64_t v17 = [v47 objectForKey:@"fcKind"];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v49 = [v17 integerValue];
            if (objc_msgSend(v5, "containsIndex:"))
            {
              char v53 = v17;
              id v18 = [v47 objectForKey:@"children"];
              v46 = v18;
              if (_NSIsNSArray())
              {
                id v19 = v18;
              }
              else
              {
                id v63 = v47;
                id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
              }
              uint64_t v20 = v49;
              long long v56 = 0u;
              long long v57 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              obuint64_t j = v19;
              uint64_t v21 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v52 = *(void *)v55;
                do
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v55 != v52) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v24 = *(void *)(*((void *)&v54 + 1) + 8 * i);
                    if (!(!self->_options.useCarPlayBrowseTopLevelRequestReorderingHeuristics | (v41 ^ 1 | v51) & 1))
                    {
                      BOOL v32 = [(MPModelStoreBrowseResponseParser *)self _parseFeaturedContentChild:*(void *)(*((void *)&v54 + 1) + 8 * i) isMemberOfChartSet:v20 == 323 insertingResultsToSectionedCollection:v6 atSectionIndex:v12 additionalContentIdentifiers:v7 allAdditionalContentIdentifiersNeedingLookup:v8];
LABEL_26:
                      uint64_t v33 = v12 + 1;
                      goto LABEL_27;
                    }
                    BOOL v25 = v20 == 323;
                    id v26 = v8;
                    char v27 = v7;
                    uint64_t v28 = v25;
                    uint64_t v29 = [(MPSectionedCollection *)v6 numberOfSections];
                    char v30 = !self->_options.useCarPlayBrowseTopLevelRequestReorderingHeuristics | v41 | (v49 == 324);
                    uint64_t v31 = v28;
                    uint64_t v7 = v27;
                    id v8 = v26;
                    uint64_t v20 = v49;
                    BOOL v32 = [(MPModelStoreBrowseResponseParser *)self _parseFeaturedContentChild:v24 isMemberOfChartSet:v31 insertingResultsToSectionedCollection:v6 atSectionIndex:v29 additionalContentIdentifiers:v7 allAdditionalContentIdentifiersNeedingLookup:v8];
                    uint64_t v33 = v12;
                    if ((v30 & 1) == 0) {
                      goto LABEL_26;
                    }
LABEL_27:
                    if (v32) {
                      uint64_t v12 = v33;
                    }
                    uint64_t v17 = v53;
                  }
                  uint64_t v22 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
                }
                while (v22);
              }

              if (self->_options.useCarPlayBrowseTopLevelRequestReorderingHeuristics)
              {
                BOOL v25 = v20 == 323;
                uint64_t v34 = v20;
                id v9 = v43;
                id v5 = v44;
                uint64_t v13 = v42;
                uint64_t v11 = v45;
                if (v25)
                {
                  int v51 = 1;
                }
                else if (v34 == 324)
                {
                  int v41 = 1;
                }
              }
              else
              {
                id v9 = v43;
                id v5 = v44;
                uint64_t v13 = v42;
                uint64_t v11 = v45;
              }
            }
          }
        }
        uint64_t v14 = v48 + 1;
      }
      while (v48 + 1 != v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v11);
  }

  if ([(MPSectionedCollection *)v6 numberOfSections] <= 0)
  {
    results = self->_results;
    self->_results = 0;
  }
  else
  {
    id v35 = (MPSectionedCollection *)[(MPMutableSectionedCollection *)v6 copy];
    results = self->_results;
    self->_results = v35;
  }

  if ([(MPSectionedCollection *)v7 numberOfSections] <= 0)
  {
    additionalContentIdentifiers = self->_additionalContentIdentifiers;
    self->_additionalContentIdentifiers = 0;
  }
  else
  {
    int v37 = (MPSectionedCollection *)[(MPMutableSectionedCollection *)v7 copy];
    additionalContentIdentifiers = self->_additionalContentIdentifiers;
    self->_additionalContentIdentifiers = v37;
  }

  if ([v8 count])
  {
    v39 = (NSArray *)[v8 copy];
    allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
    self->_allAdditionalContentIdentifiersNeedingLookup = v39;
  }
  else
  {
    allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
    self->_allAdditionalContentIdentifiersNeedingLookup = 0;
  }
}

- (void)_parse
{
  if (_NSIsNSDictionary())
  {
    id v11 = self->_rawResponseOutput;
    -[MPModelStoreBrowseResponseParser _populateStorePlatformDataResultsFromRawResponseOutputDictionary:](self, "_populateStorePlatformDataResultsFromRawResponseOutputDictionary:");
    if (self->_previousParser)
    {
      [(MPModelStoreBrowseResponseParser *)self _parseUsingAdditionalContentIdentifiersFromPreviousParser];
    }
    else
    {
      id v3 = [v11 objectForKey:@"pageData"];
      if (_NSIsNSDictionary())
      {
        id v4 = v3;
        [(MPModelStoreBrowseResponseParser *)self _populateUnavailableContentIdentifiersFromPageDataDictionary:v4];
        id v5 = [v4 objectForKey:@"fcStructure"];
        if (_NSIsNSDictionary())
        {
          id v6 = [v5 objectForKey:@"model"];
          if (_NSIsNSDictionary())
          {
            uint64_t v7 = [v6 objectForKey:@"children"];
            if (_NSIsNSArray()) {
              [(MPModelStoreBrowseResponseParser *)self _parseFeaturedContentStructureModelChildren:v7];
            }
          }
        }
        else
        {
          id v6 = [v4 objectForKey:@"selectedChart"];
          if (_NSIsNSDictionary())
          {
            id v8 = self;
            id v9 = v6;
            uint64_t v10 = 1;
          }
          else
          {
            id v8 = self;
            id v9 = v4;
            uint64_t v10 = 0;
          }
          [(MPModelStoreBrowseResponseParser *)v8 _parseSingleContentListFromPageDataDictionary:v9 isMemberOfChartSet:v10];
        }
      }
    }
  }
}

- (NSArray)allAdditionalContentIdentifiersNeedingLookup
{
  int64_t parseOnceToken = self->_parseOnceToken;
  p_int64_t parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MPModelStoreBrowseResponseParser_allAdditionalContentIdentifiersNeedingLookup__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  if (parseOnceToken != -1) {
    dispatch_once(p_parseOnceToken, block);
  }
  return self->_allAdditionalContentIdentifiersNeedingLookup;
}

uint64_t __80__MPModelStoreBrowseResponseParser_allAdditionalContentIdentifiersNeedingLookup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _parse];
}

- (MPSectionedCollection)additionalContentIdentifiers
{
  int64_t parseOnceToken = self->_parseOnceToken;
  p_int64_t parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MPModelStoreBrowseResponseParser_additionalContentIdentifiers__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  if (parseOnceToken != -1) {
    dispatch_once(p_parseOnceToken, block);
  }
  return self->_additionalContentIdentifiers;
}

uint64_t __64__MPModelStoreBrowseResponseParser_additionalContentIdentifiers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _parse];
}

- (MPSectionedCollection)results
{
  int64_t parseOnceToken = self->_parseOnceToken;
  p_int64_t parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MPModelStoreBrowseResponseParser_results__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  if (parseOnceToken != -1) {
    dispatch_once(p_parseOnceToken, block);
  }
  return self->_results;
}

uint64_t __43__MPModelStoreBrowseResponseParser_results__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _parse];
}

- (MPModelStoreBrowseResponseParser)initWithPreviousParser:(id)a3 additionalStoreItemMetadataResponse:(id)a4 options:(id)a5 sectionBuilder:(id)a6 contentItemBuilder:(id)a7 userIdentity:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MPModelStoreBrowseResponseParser;
  id v18 = [(MPModelStoreBrowseResponseParser *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_additionalStoreItemMetadataResponse, a4);
    objc_storeStrong((id *)&v19->_contentItemBuilder, a7);
    v19->_options = ($D56A91B0D9B4BA8C66615E7F684A800E)a5;
    objc_storeStrong((id *)&v19->_previousParser, a3);
    previousParser = v19->_previousParser;
    if (previousParser) {
      objc_storeStrong(&v19->_rawResponseOutput, previousParser->_rawResponseOutput);
    }
    objc_storeStrong((id *)&v19->_sectionBuilder, a6);
    objc_storeStrong((id *)&v19->_userIdentity, a8);
  }

  return v19;
}

- (MPModelStoreBrowseResponseParser)initWithRawResponseOutput:(id)a3 options:(id)a4 sectionBuilder:(id)a5 contentItemBuilder:(id)a6 userIdentity:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MPModelStoreBrowseResponseParser;
  id v17 = [(MPModelStoreBrowseResponseParser *)&v20 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentItemBuilder, a6);
    v18->_options = ($D56A91B0D9B4BA8C66615E7F684A800E)a4;
    objc_storeStrong(&v18->_rawResponseOutput, a3);
    objc_storeStrong((id *)&v18->_sectionBuilder, a5);
    objc_storeStrong((id *)&v18->_userIdentity, a7);
  }

  return v18;
}

@end