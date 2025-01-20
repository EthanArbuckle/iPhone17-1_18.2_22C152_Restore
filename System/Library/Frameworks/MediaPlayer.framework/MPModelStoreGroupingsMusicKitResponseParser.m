@interface MPModelStoreGroupingsMusicKitResponseParser
- (BOOL)featuredContentKindCorrespondsToItem:(id)a3;
- (BOOL)isContentNodeAnEditorialElement:(id)a3;
- (MPModelStoreGroupingsMusicKitResponseParser)initWithRawResponseOutput:(id)a3 sectionBuilder:(id)a4 contentItemBuilder:(id)a5 filteredFCKinds:(id)a6 userIdentity:(id)a7 rootObjectIdentifier:(id)a8 options:(unint64_t)a9 storeURLBag:(id)a10;
- (MPSectionedCollection)results;
- (id)_parsedContentNode:(id)a3 uniformContentItemTypeResolver:(id)a4 additionalAttributesFromParent:(id)a5;
- (id)_parsedEditorialElement:(id)a3;
- (id)_parsedEditorialElementX:(id)a3;
- (id)_parsedEditorialElements:(id)a3;
- (id)_parsedSectionedCollection;
- (id)attributesForContentNode:(id)a3;
- (id)bagRoomURLRegularExpression;
- (id)childrenOfContentNode:(id)a3;
- (id)description;
- (id)firstChildOfContentNode:(id)a3;
- (id)linkSectionWithDictionary:(id)a3;
- (id)linksForContentNode:(id)a3;
- (id)musicAPIURLWithLinkURLString:(id)a3;
- (int64_t)featuredContentKindForNode:(id)a3;
@end

@implementation MPModelStoreGroupingsMusicKitResponseParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootObjectIdentifier, 0);
  objc_storeStrong((id *)&self->_storeBagLinkRegularExpression, 0);
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_filteredFCKinds, 0);
  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
  objc_storeStrong((id *)&self->_sectionBuilder, 0);

  objc_storeStrong(&self->_rawResponseOutput, 0);
}

- (id)_parsedContentNode:(id)a3 uniformContentItemTypeResolver:(id)a4 additionalAttributesFromParent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_NSIsNSDictionary())
  {
    v19 = 0;
    goto LABEL_19;
  }
  id v11 = v8;
  v12 = [v11 objectForKey:@"id"];
  v13 = v12;
  if (v12)
  {
    v14 = MPStoreItemMetadataStringNormalizeStoreIDValue(v12);
    if (v14)
    {
      v15 = [v11 objectForKey:@"type"];
      if (_NSIsNSString()) {
        [(MPModelStoreBrowseContentItemBuilder *)self->_contentItemBuilder contentItemTypeForMusicAPIType:v15];
      }
      v16 = [v11 objectForKey:@"attributes"];
      v25 = v16;
      if (_NSIsNSDictionary())
      {
        v17 = (void *)[v10 mutableCopy];
        if (v17)
        {
          v18 = v17;
          [v17 addEntriesFromDictionary:v16];
        }
        else
        {
          v18 = (void *)[v16 mutableCopy];
        }
        objc_msgSend(v18, "setObject:forKey:", v14, @"id", v15, v16);
        v21 = [v11 objectForKey:@"relationships"];
        if (v21)
        {
          v22 = [v11 objectForKey:@"relationships"];
          [v18 setObject:v22 forKey:@"relationships"];
        }
        v20 = [[MPStoreItemMetadata alloc] initWithStoreMusicAPIDictionary:v18];

        v15 = v24;
      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(v9, "addContentItemType:", -[MPModelStoreBrowseContentItemBuilder contentItemTypeForStoreItemMetadata:](self->_contentItemBuilder, "contentItemTypeForStoreItemMetadata:", v20));
      v19 = [(MPStoreModelObjectBuilder *)self->_contentItemBuilder modelObjectWithStoreItemMetadata:v20 userIdentity:self->_userIdentity];

      goto LABEL_18;
    }
  }
  else
  {
    v14 = 0;
  }
  v19 = 0;
LABEL_18:

LABEL_19:

  return v19;
}

- (BOOL)isContentNodeAnEditorialElement:(id)a3
{
  id v3 = a3;
  if (_NSIsNSDictionary())
  {
    v4 = [v3 objectForKey:@"type"];
    if (_NSIsNSString()) {
      char v5 = [v4 isEqualToString:@"editorial-elements"];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)featuredContentKindCorrespondsToItem:(id)a3
{
  id v4 = a3;
  if (_NSIsNSDictionary())
  {
    int64_t v5 = [(MPModelStoreGroupingsMusicKitResponseParser *)self featuredContentKindForNode:v4];
    BOOL v7 = v5 != 317 && v5 != 383;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)linksForContentNode:(id)a3
{
  id v3 = [a3 objectForKey:@"attributes"];
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"links"];
    if (_NSIsNSArray()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)childrenOfContentNode:(id)a3
{
  id v3 = [a3 objectForKey:@"relationships"];
  if (!_NSIsNSDictionary())
  {
    id v4 = 0;
    goto LABEL_15;
  }
  id v4 = [v3 objectForKey:@"children"];
  if (!_NSIsNSDictionary())
  {
    id v5 = v3;
    goto LABEL_8;
  }
  id v5 = v4;

  id v4 = [v5 objectForKey:@"data"];

  if (!_NSIsNSArray() || (v6 = v4, (id v4 = v6) == 0))
  {
LABEL_8:
    id v3 = [v5 objectForKey:@"contents"];

    if (_NSIsNSDictionary())
    {
      id v7 = v3;

      id v3 = [v7 objectForKey:@"data"];

      if (_NSIsNSArray())
      {
        id v4 = v3;
        id v3 = v4;
      }
      else
      {
        id v4 = 0;
      }
      id v5 = v7;
    }
    else
    {
      id v4 = 0;
    }
    goto LABEL_14;
  }
  id v3 = v6;
LABEL_14:

LABEL_15:

  return v4;
}

- (id)firstChildOfContentNode:(id)a3
{
  id v3 = [(MPModelStoreGroupingsMusicKitResponseParser *)self childrenOfContentNode:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)attributesForContentNode:(id)a3
{
  id v3 = a3;
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"attributes"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)featuredContentKindForNode:(id)a3
{
  id v3 = a3;
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"attributes"];
    if (_NSIsNSDictionary())
    {
      id v5 = [v4 objectForKey:@"editorialElementKind"];
      if (objc_opt_respondsToSelector()) {
        int64_t v6 = [v5 integerValue];
      }
      else {
        int64_t v6 = 0;
      }
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)linkSectionWithDictionary:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NSIsNSDictionary())
  {
    id v5 = [v4 objectForKey:@"label"];
    if (v5)
    {
      int64_t v6 = [v4 objectForKey:@"url"];
      id v7 = [(MPModelStoreGroupingsMusicKitResponseParser *)self musicAPIURLWithLinkURLString:v6];

      LOBYTE(v11) = 0;
      id v8 = [(MPModelStoreBrowseSectionBuilder *)self->_sectionBuilder modelObjectWithTitle:v5 loadAdditionalContentURL:v7 uniformContentItemType:16 isMemberOfChartSet:0 isBrick:0 displaysAsGridCellInCarPlay:0 previouslyRetrievedNestedResponse:0 onlyContainsEditorialElements:v11 featuredContentKind:0 modelObject:0];
    }
    else
    {
      id v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v4;
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "Dropping link without label: %{public}@", buf, 0xCu);
      }

      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)musicAPIURLWithLinkURLString:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4
    || (storeBagLinkRegularExpression = self->_storeBagLinkRegularExpression) == 0
    && ([(MPModelStoreGroupingsMusicKitResponseParser *)self bagRoomURLRegularExpression],
        int64_t v6 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue(),
        id v7 = self->_storeBagLinkRegularExpression,
        self->_storeBagLinkRegularExpression = v6,
        v7,
        (storeBagLinkRegularExpression = self->_storeBagLinkRegularExpression) == 0))
  {
    v17 = 0;
    goto LABEL_21;
  }
  id v8 = storeBagLinkRegularExpression;
  id v9 = -[NSRegularExpression matchesInString:options:range:](v8, "matchesInString:options:range:", v4, 0, 0, [v4 length]);
  id v10 = [v9 firstObject];
  if (!v10)
  {
    uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v4;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "No match found, URL is not supported: %{public}@", buf, 0xCu);
    }
    v17 = 0;
    goto LABEL_20;
  }
  uint64_t v11 = [(ICURLBag *)self->_storeURLBag stringForBagKey:*MEMORY[0x1E4FB8530]];
  if ((_NSIsNSString() & 1) == 0)
  {
    v15 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "countryCode not found in bag";
      v19 = v15;
      uint32_t v20 = 2;
LABEL_17:
      _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  uint64_t v12 = [v10 rangeWithName:@"identifier"];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v4, "substringWithRange:", v12, v13), (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v10;
      v18 = "Match didn't capture an identifier: %{public}@";
      v19 = v15;
      uint32_t v20 = 12;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v15 = v14;
  v16 = [NSString stringWithFormat:@"/v1/editorial/%@/rooms/%@", v11, v14];
  v17 = MusicURLWithPathUsingURLBag(v16, self->_storeURLBag, 0);

LABEL_19:
LABEL_20:

LABEL_21:

  return v17;
}

- (id)bagRoomURLRegularExpression
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(ICURLBag *)self->_storeURLBag dictionaryForBagKey:*MEMORY[0x1E4FB8560]];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"viewRoomUrlRegex"];
    if (_NSIsNSString())
    {
      id v9 = 0;
      id v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v4 options:0 error:&v9];
      id v6 = v9;
      if (v6)
      {
        id v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v11 = v4;
          __int16 v12 = 2114;
          id v13 = v6;
          _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Regex cannot be generated from pattern: %{public}@ with error %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_parsedEditorialElement:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_NSIsNSDictionary())
  {
    id v10 = 0;
    goto LABEL_76;
  }
  id v5 = objc_opt_new();
  id v60 = v4;
  int64_t v6 = -[MPModelStoreGroupingsMusicKitResponseParser featuredContentKindForNode:](self, "featuredContentKindForNode:");
  filteredFCKinds = self->_filteredFCKinds;
  if (!filteredFCKinds || [(NSIndexSet *)filteredFCKinds containsIndex:v6])
  {
    id v8 = [v60 objectForKey:@"attributes"];
    if (!_NSIsNSDictionary())
    {
      id v10 = 0;
LABEL_74:

      goto LABEL_75;
    }
    id v9 = [v8 objectForKey:@"name"];
    if (_NSIsNSString())
    {
      if (v9)
      {
LABEL_16:
        if (_parsedEditorialElement__onceToken == -1)
        {
          if (v9) {
            goto LABEL_20;
          }
        }
        else
        {
          dispatch_once(&_parsedEditorialElement__onceToken, &__block_literal_global_4855);
          if (v9) {
            goto LABEL_20;
          }
        }
        if ((self->_options & 4) == 0
          || (uint64_t v12 = _parsedEditorialElement__featuredContentKindInWhichTitleCanBeIgnored,
              [NSNumber numberWithInteger:v6],
              id v13 = objc_claimAutoreleasedReturnValue(),
              LOBYTE(v12) = [(id)v12 containsObject:v13],
              v13,
              (v12 & 1) != 0))
        {
LABEL_20:
          uint64_t v14 = [v8 objectForKey:@"seeAllUrl"];
          if (_NSIsNSString())
          {
            uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];

            uint64_t v57 = v15;
            if (v15)
            {
LABEL_31:
              int64_t v58 = v6;
              id v59 = v9;
              if (_NSIsNSDictionary())
              {
                v18 = [v8 objectForKey:@"emphasize"];
                unsigned int v53 = [v18 BOOLValue];
              }
              else
              {
                unsigned int v53 = 0;
              }
              id v55 = v4;
              v56 = v8;
              v54 = v5;
              v19 = [(MPModelStoreGroupingsMusicKitResponseParser *)self childrenOfContentNode:v60];
              uint32_t v20 = objc_opt_new();
              v21 = objc_opt_new();
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              id v22 = v19;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v65 objects:v70 count:16];
              if (!v23)
              {
                char v26 = 1;
                goto LABEL_52;
              }
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v66;
              char v26 = 1;
              while (1)
              {
                uint64_t v27 = 0;
                do
                {
                  if (*(void *)v66 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v28 = *(void *)(*((void *)&v65 + 1) + 8 * v27);
                  BOOL v29 = [(MPModelStoreGroupingsMusicKitResponseParser *)self featuredContentKindCorrespondsToItem:v28];
                  if (![(MPModelStoreGroupingsMusicKitResponseParser *)self isContentNodeAnEditorialElement:v28])
                  {
                    v33 = [(MPModelStoreGroupingsMusicKitResponseParser *)self attributesForContentNode:v60];
                    v32 = [(MPModelStoreGroupingsMusicKitResponseParser *)self _parsedContentNode:v28 uniformContentItemTypeResolver:v20 additionalAttributesFromParent:v33];

LABEL_43:
                    char v26 = 0;
                    if (!v32) {
                      goto LABEL_45;
                    }
LABEL_44:
                    [v21 addObject:v32];
                    goto LABEL_45;
                  }
                  if (v29)
                  {
                    v30 = [(MPModelStoreGroupingsMusicKitResponseParser *)self firstChildOfContentNode:v28];
                    v31 = [(MPModelStoreGroupingsMusicKitResponseParser *)self attributesForContentNode:v28];
                    v32 = [(MPModelStoreGroupingsMusicKitResponseParser *)self _parsedContentNode:v30 uniformContentItemTypeResolver:v20 additionalAttributesFromParent:v31];

                    goto LABEL_43;
                  }
                  v32 = [(MPModelStoreGroupingsMusicKitResponseParser *)self _parsedEditorialElement:v28];
                  if (v32) {
                    goto LABEL_44;
                  }
LABEL_45:

                  ++v27;
                }
                while (v24 != v27);
                uint64_t v34 = [v22 countByEnumeratingWithState:&v65 objects:v70 count:16];
                uint64_t v24 = v34;
                if (!v34)
                {
LABEL_52:

                  v35 = [(MPModelStoreGroupingsMusicKitResponseParser *)self linksForContentNode:v60];
                  if (![v21 count] && objc_msgSend(v35, "count"))
                  {
                    long long v63 = 0u;
                    long long v64 = 0u;
                    long long v61 = 0u;
                    long long v62 = 0u;
                    v51 = v35;
                    id v36 = v35;
                    uint64_t v37 = [v36 countByEnumeratingWithState:&v61 objects:v69 count:16];
                    if (v37)
                    {
                      uint64_t v38 = v37;
                      uint64_t v39 = *(void *)v62;
                      do
                      {
                        for (uint64_t i = 0; i != v38; ++i)
                        {
                          if (*(void *)v62 != v39) {
                            objc_enumerationMutation(v36);
                          }
                          v41 = [(MPModelStoreGroupingsMusicKitResponseParser *)self linkSectionWithDictionary:*(void *)(*((void *)&v61 + 1) + 8 * i)];
                          if (v41) {
                            [v21 addObject:v41];
                          }
                        }
                        uint64_t v38 = [v36 countByEnumeratingWithState:&v61 objects:v69 count:16];
                      }
                      while (v38);
                    }

                    v35 = v51;
                  }
                  if ([v21 count] || v58 == 332)
                  {
                    v52 = v35;
                    id v5 = v54;
                    id v4 = v55;
                    if (v58 == 489 || v58 == 383)
                    {
                      v43 = [v21 firstObject];
                      v44 = [v43 radioStation];
                    }
                    else
                    {
                      v44 = 0;
                    }
                    sectionBuilder = self->_sectionBuilder;
                    uint64_t v46 = [v20 uniformContentItemType];
                    LOBYTE(v50) = v26 & 1;
                    v47 = sectionBuilder;
                    v42 = v57;
                    v48 = [(MPModelStoreBrowseSectionBuilder *)v47 modelObjectWithTitle:v59 loadAdditionalContentURL:v57 uniformContentItemType:v46 isMemberOfChartSet:v58 == 323 isBrick:v58 == 325 displaysAsGridCellInCarPlay:v53 previouslyRetrievedNestedResponse:0 onlyContainsEditorialElements:v50 featuredContentKind:v58 modelObject:v44];
                    [v54 appendSection:v48];
                    [v54 appendItems:v21];
                    id v10 = (void *)[v54 copy];

                    v35 = v52;
                  }
                  else
                  {
                    id v10 = 0;
                    id v5 = v54;
                    id v4 = v55;
                    v42 = v57;
                  }

                  id v8 = v56;
                  id v9 = v59;
                  goto LABEL_73;
                }
              }
            }
          }
          else
          {
          }
          v16 = [v8 objectForKey:@"link"];
          if (_NSIsNSDictionary())
          {
            v17 = [v16 objectForKey:@"url"];
            if (_NSIsNSString())
            {
              uint64_t v57 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
            }
            else
            {
              uint64_t v57 = 0;
            }
          }
          else
          {
            uint64_t v57 = 0;
            v17 = v16;
          }

          goto LABEL_31;
        }
        v42 = _MPLogCategoryDefault();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v72 = v60;
          _os_log_impl(&dword_1952E8000, v42, OS_LOG_TYPE_ERROR, "Dropping node without title: %{public}@", buf, 0xCu);
        }
        id v10 = 0;
LABEL_73:

        goto LABEL_74;
      }
    }
    else
    {
    }
    uint64_t v11 = [v8 objectForKey:@"title"];
    if (_NSIsNSString()) {
      id v9 = v11;
    }
    else {
      id v9 = 0;
    }

    goto LABEL_16;
  }
  id v10 = 0;
LABEL_75:

LABEL_76:

  return v10;
}

void __71__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElement___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EE6ECDB8, &unk_1EE6ECDD0, &unk_1EE6ECDE8, &unk_1EE6ECE00, 0);
  v1 = (void *)_parsedEditorialElement__featuredContentKindInWhichTitleCanBeIgnored;
  _parsedEditorialElement__featuredContentKindInWhichTitleCanBeIgnored = v0;
}

- (id)_parsedEditorialElementX:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_NSIsNSDictionary())
  {
    v17 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_23;
  }
  id v5 = v4;
  int64_t v6 = [(MPModelStoreGroupingsMusicKitResponseParser *)self featuredContentKindForNode:v5];
  filteredFCKinds = self->_filteredFCKinds;
  if (filteredFCKinds && ![(NSIndexSet *)filteredFCKinds containsIndex:v6])
  {
    v17 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_22;
  }
  unint64_t options = self->_options;
  if ((options & 1) != 0 && v6 == 488 || (options & 2) != 0 && v6 == 316)
  {
    id v9 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = -[MPModelStoreGroupingsMusicKitResponseParser childrenOfContentNode:](self, "childrenOfContentNode:", v5, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [(MPModelStoreGroupingsMusicKitResponseParser *)self _parsedEditorialElement:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [v9 copy];
  }
  else
  {
    uint64_t v19 = [(MPModelStoreGroupingsMusicKitResponseParser *)self _parsedEditorialElement:v5];
    id v9 = (void *)v19;
    if (!v19)
    {
      v17 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_19;
    }
    uint64_t v24 = v19;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  }
  v17 = (void *)v16;
LABEL_19:

LABEL_22:
LABEL_23:

  return v17;
}

- (id)_parsedEditorialElements:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v5)
  {
    uint64_t v18 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(obj);
        }
        id v7 = [(MPModelStoreGroupingsMusicKitResponseParser *)self _parsedEditorialElementX:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v34 != v9) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              uint64_t v12 = [v11 firstSection];
              [v4 appendSection:v12];

              uint64_t v13 = [v11 allItems];
              [v4 appendItems:v13];
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v8);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v5);
  }

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__4875;
  uint64_t v27 = __Block_byref_object_dispose__4876;
  id v28 = (id)objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElements___block_invoke;
  v22[3] = &unk_1E57EE6E0;
  v22[4] = &v29;
  v22[5] = &v23;
  [v4 enumerateSectionsUsingBlock:v22];
  if (*((unsigned char *)v30 + 24))
  {
    uint64_t v14 = (void *)v24[5];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElements___block_invoke_2;
    v20[3] = &unk_1E57F6610;
    id v21 = v4;
    [v14 enumerateIndexesUsingBlock:v20];
  }
  if ([v4 numberOfSections]) {
    uint64_t v15 = (void *)[v4 copy];
  }
  else {
    uint64_t v15 = 0;
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __72__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 sectionType];
  if ((unint64_t)(result - 13) >= 2)
  {
    if (result == 12)
    {
      int64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      return [v6 addIndex:a3];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __72__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeSectionAtIndex:a2];
}

- (id)_parsedSectionedCollection
{
  v59[5] = *MEMORY[0x1E4F143B8];
  id v3 = +[MPMediaAPIParserLayer layerWithKey:@"data" ofType:0];
  v59[0] = v3;
  id v4 = +[MPMediaAPIParserLayer layerWithFirstObjectOfType:1];
  v59[1] = v4;
  uint64_t v5 = +[MPMediaAPIParserLayer layerWithKey:@"relationships" ofType:1];
  v59[2] = v5;
  int64_t v6 = +[MPMediaAPIParserLayer layerWithKey:@"tabs" ofType:1];
  v59[3] = v6;
  id v7 = +[MPMediaAPIParserLayer layerWithKey:@"data" ofType:0];
  v59[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:5];

  if ((_NSIsNSDictionary() & 1) == 0)
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      rawResponseOutput = self->_rawResponseOutput;
      *(_DWORD *)buf = 138543362;
      id v55 = rawResponseOutput;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "Can't parse because input has unexpected type: %{public}@", buf, 0xCu);
    }
    uint64_t v31 = 0;
    goto LABEL_62;
  }
  uint64_t v9 = self->_rawResponseOutput;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v44 = v8;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v58 count:16];
  uint64_t v12 = v9;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v50;
    uint64_t v12 = v9;
    do
    {
      uint64_t v15 = v9;
      for (uint64_t i = 0; i != v13; ++i)
      {
        v17 = v12;
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v19 = [v18 key];

        if (v19)
        {
          long long v20 = [v18 key];
          uint64_t v12 = [v12 objectForKey:v20];

          if (!v12)
          {
            uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              long long v33 = [v18 key];
              *(_DWORD *)buf = 138543618;
              id v55 = v33;
              __int16 v56 = 2114;
              uint64_t v57 = v17;
              _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "Can't parse because %{public}@ property doesn't exist: %{public}@", buf, 0x16u);
            }
LABEL_46:
            uint64_t v8 = v44;
            uint64_t v9 = v15;
            goto LABEL_60;
          }
        }
        else
        {
          uint64_t v12 = [v12 firstObject];
          if (!v12)
          {
            uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v55 = v17;
              _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "Can't parse because array doesn't contain anything: %{public}@", buf, 0xCu);
            }
            goto LABEL_46;
          }
        }
        uint64_t v21 = [v18 type];
        if (v21 == 1)
        {
          if ((_NSIsNSDictionary() & 1) == 0)
          {
            long long v39 = [v18 key];

            long long v35 = os_log_create("com.apple.amp.mediaplayer", "Default");
            BOOL v40 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
            if (!v39)
            {
              uint64_t v8 = v44;
              uint64_t v9 = v15;
              if (!v40) {
                goto LABEL_59;
              }
              *(_DWORD *)buf = 138543362;
              id v55 = v12;
              v41 = "Can't parse because array first object is not of expected (NSDictionary) type: %{public}@";
              goto LABEL_58;
            }
            uint64_t v8 = v44;
            uint64_t v9 = v15;
            if (v40)
            {
              long long v37 = [v18 key];
              *(_DWORD *)buf = 138543618;
              id v55 = v37;
              __int16 v56 = 2114;
              uint64_t v57 = v12;
              long long v38 = "Can't parse because %{public}@ property is not of expected (NSDictionary) type: %{public}@";
LABEL_53:
              _os_log_impl(&dword_1952E8000, v35, OS_LOG_TYPE_ERROR, v38, buf, 0x16u);
            }
LABEL_59:

LABEL_60:
            uint64_t v31 = 0;
            goto LABEL_61;
          }
        }
        else if (!v21 && (_NSIsNSArray() & 1) == 0)
        {
          long long v34 = [v18 key];

          long long v35 = os_log_create("com.apple.amp.mediaplayer", "Default");
          BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
          if (v34)
          {
            uint64_t v8 = v44;
            uint64_t v9 = v15;
            if (v36)
            {
              long long v37 = [v18 key];
              *(_DWORD *)buf = 138543618;
              id v55 = v37;
              __int16 v56 = 2114;
              uint64_t v57 = v12;
              long long v38 = "Can't parse because %{public}@ property is not of expected (NSArray) type: %{public}@";
              goto LABEL_53;
            }
            goto LABEL_59;
          }
          uint64_t v8 = v44;
          uint64_t v9 = v15;
          if (!v36) {
            goto LABEL_59;
          }
          *(_DWORD *)buf = 138543362;
          id v55 = v12;
          v41 = "Can't parse because array first object is not of expected (NSArray) type: %{public}@";
LABEL_58:
          _os_log_impl(&dword_1952E8000, v35, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
          goto LABEL_59;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v49 objects:v58 count:16];
      uint64_t v9 = v15;
    }
    while (v13);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v22 = v12;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
  v17 = v22;
  if (!v23) {
    goto LABEL_43;
  }
  uint64_t v24 = v23;
  uint64_t v43 = v9;
  uint64_t v25 = *(void *)v46;
  while (2)
  {
    for (uint64_t j = 0; j != v24; ++j)
    {
      if (*(void *)v46 != v25) {
        objc_enumerationMutation(v22);
      }
      uint64_t v27 = *(void **)(*((void *)&v45 + 1) + 8 * j);
      if (self->_rootObjectIdentifier)
      {
        id v28 = [*(id *)(*((void *)&v45 + 1) + 8 * j) objectForKey:@"attributes"];
        if (!_NSIsNSDictionary()) {
          goto LABEL_33;
        }
        uint64_t v29 = [v28 objectForKey:@"token"];
        if (!_NSIsNSString()
          || ![v29 isEqualToString:self->_rootObjectIdentifier])
        {
          goto LABEL_32;
        }
      }
      id v28 = objc_msgSend(v27, "objectForKey:", @"relationships", v43);
      if (!_NSIsNSDictionary()) {
        goto LABEL_33;
      }
      uint64_t v29 = [v28 objectForKey:@"children"];
      if (_NSIsNSDictionary())
      {
        v17 = [v29 objectForKey:@"data"];
        if (_NSIsNSArray())
        {

          goto LABEL_42;
        }
      }
LABEL_32:

LABEL_33:
    }
    uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v24) {
      continue;
    }
    break;
  }
  v17 = v22;
LABEL_42:
  uint64_t v9 = v43;
LABEL_43:

  uint64_t v31 = [(MPModelStoreGroupingsMusicKitResponseParser *)self _parsedEditorialElements:v17];
  uint64_t v8 = v44;
LABEL_61:

LABEL_62:

  return v31;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_options) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  [v6 appendFormat:@"; createIndependentSectionsForLiveRadioStations = %@", v7];
  if ((self->_options & 2) != 0) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v6 appendFormat:@"; useOneLevelHeroListHierarchy = %@", v8];
  if ((self->_options & 4) != 0) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v6 appendFormat:@"; disallowEmptyTitleSections = %@", v9];
  [v6 appendString:@">"];

  return v6;
}

- (MPSectionedCollection)results
{
  int64_t parseOnceToken = self->_parseOnceToken;
  p_int64_t parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MPModelStoreGroupingsMusicKitResponseParser_results__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  if (parseOnceToken != -1) {
    dispatch_once(p_parseOnceToken, block);
  }
  return self->_results;
}

void __54__MPModelStoreGroupingsMusicKitResponseParser_results__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _parsedSectionedCollection];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (MPModelStoreGroupingsMusicKitResponseParser)initWithRawResponseOutput:(id)a3 sectionBuilder:(id)a4 contentItemBuilder:(id)a5 filteredFCKinds:(id)a6 userIdentity:(id)a7 rootObjectIdentifier:(id)a8 options:(unint64_t)a9 storeURLBag:(id)a10
{
  id v17 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)MPModelStoreGroupingsMusicKitResponseParser;
  uint64_t v19 = [(MPModelStoreGroupingsMusicKitResponseParser *)&v27 init];
  long long v20 = v19;
  if (v19)
  {
    objc_storeStrong(&v19->_rawResponseOutput, a3);
    objc_storeStrong((id *)&v20->_sectionBuilder, a4);
    objc_storeStrong((id *)&v20->_contentItemBuilder, a5);
    objc_storeStrong((id *)&v20->_filteredFCKinds, a6);
    objc_storeStrong((id *)&v20->_userIdentity, a7);
    objc_storeStrong((id *)&v20->_rootObjectIdentifier, a8);
    v20->_unint64_t options = a9;
    objc_storeStrong((id *)&v20->_storeURLBag, a10);
  }

  return v20;
}

@end