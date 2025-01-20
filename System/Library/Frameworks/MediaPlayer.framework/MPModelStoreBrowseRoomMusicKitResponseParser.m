@interface MPModelStoreBrowseRoomMusicKitResponseParser
- (MPModelStoreBrowseRoomMusicKitResponseParser)initWithRawResponseOutput:(id)a3 sectionBuilder:(id)a4 contentItemBuilder:(id)a5 filteredFCKinds:(id)a6 userIdentity:(id)a7;
- (MPSectionedCollection)results;
- (id)_parsedContentNode:(id)a3 additionalAttributesFromParent:(id)a4;
- (id)_parsedElements:(id)a3;
- (id)_parsedSectionedCollection;
@end

@implementation MPModelStoreBrowseRoomMusicKitResponseParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_filteredFCKinds, 0);
  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
  objc_storeStrong((id *)&self->_sectionBuilder, 0);

  objc_storeStrong(&self->_rawResponseOutput, 0);
}

- (id)_parsedContentNode:(id)a3 additionalAttributesFromParent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!_NSIsNSDictionary())
  {
    v16 = 0;
    goto LABEL_19;
  }
  id v8 = v6;
  v9 = [v8 objectForKey:@"id"];
  v10 = v9;
  if (v9)
  {
    v11 = MPStoreItemMetadataStringNormalizeStoreIDValue(v9);
    if (v11)
    {
      v12 = [v8 objectForKey:@"type"];
      if (_NSIsNSString()) {
        [(MPModelStoreBrowseContentItemBuilder *)self->_contentItemBuilder contentItemTypeForMusicAPIType:v12];
      }
      v13 = [v8 objectForKey:@"attributes"];
      if (_NSIsNSDictionary())
      {
        v21 = v12;
        v14 = (void *)[v7 mutableCopy];
        if (v14)
        {
          v15 = v14;
          [v14 addEntriesFromDictionary:v13];
        }
        else
        {
          v15 = (void *)[v13 mutableCopy];
        }
        [v15 setObject:v11 forKey:@"id"];
        v18 = [v8 objectForKey:@"relationships"];
        if (v18)
        {
          v19 = [v8 objectForKey:@"relationships"];
          [v15 setObject:v19 forKey:@"relationships"];
        }
        v17 = [[MPStoreItemMetadata alloc] initWithStoreMusicAPIDictionary:v15];

        v12 = v21;
      }
      else
      {
        v17 = 0;
      }
      v16 = [(MPStoreModelObjectBuilder *)self->_contentItemBuilder modelObjectWithStoreItemMetadata:v17 userIdentity:self->_userIdentity];

      goto LABEL_18;
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = 0;
LABEL_18:

LABEL_19:

  return v16;
}

- (id)_parsedElements:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F1CA98] null];
  [v5 appendSection:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
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
        v12 = -[MPModelStoreBrowseRoomMusicKitResponseParser _parsedContentNode:additionalAttributesFromParent:](self, "_parsedContentNode:additionalAttributesFromParent:", *(void *)(*((void *)&v15 + 1) + 8 * i), 0, (void)v15);
        if (v12) {
          [v5 appendItem:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if ([v5 numberOfSections]) {
    v13 = (void *)[v5 copy];
  }
  else {
    v13 = 0;
  }

  return v13;
}

- (id)_parsedSectionedCollection
{
  v44[5] = *MEMORY[0x1E4F143B8];
  v3 = +[MPMediaAPIParserLayer layerWithKey:@"data" ofType:0];
  v44[0] = v3;
  id v4 = +[MPMediaAPIParserLayer layerWithFirstObjectOfType:1];
  v44[1] = v4;
  v5 = +[MPMediaAPIParserLayer layerWithKey:@"relationships" ofType:1];
  v44[2] = v5;
  id v6 = +[MPMediaAPIParserLayer layerWithKey:@"contents" ofType:1];
  v44[3] = v6;
  id v7 = +[MPMediaAPIParserLayer layerWithKey:@"data" ofType:0];
  v44[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];

  if (_NSIsNSDictionary())
  {
    uint64_t v9 = self->_rawResponseOutput;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
    v12 = v9;
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v36;
      v12 = v9;
      v34 = v8;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        long long v16 = v12;
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v17 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
        long long v18 = [v17 key];

        if (v18)
        {
          v19 = [v17 key];
          v12 = [v16 objectForKey:v19];

          if (!v12)
          {
            v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v24 = [v17 key];
              *(_DWORD *)buf = 138543618;
              v40 = v24;
              __int16 v41 = 2114;
              v42 = v16;
              _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "Can't parse because %{public}@ property doesn't exist: %{public}@", buf, 0x16u);
            }
LABEL_26:
            uint64_t v8 = v34;
            goto LABEL_40;
          }
        }
        else
        {
          v12 = [v16 firstObject];
          if (!v12)
          {
            v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v40 = v16;
              _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "Can't parse because array doesn't contain anything: %{public}@", buf, 0xCu);
            }
            goto LABEL_26;
          }
        }
        uint64_t v20 = [v17 type];
        if (v20 == 1)
        {
          if ((_NSIsNSDictionary() & 1) == 0)
          {
            v30 = [v17 key];

            v26 = os_log_create("com.apple.amp.mediaplayer", "Default");
            BOOL v31 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
            if (!v30)
            {
              uint64_t v8 = v34;
              if (!v31) {
                goto LABEL_39;
              }
              *(_DWORD *)buf = 138543362;
              v40 = v12;
              v32 = "Can't parse because array first object is not of expected (NSDictionary) type: %{public}@";
              goto LABEL_38;
            }
            uint64_t v8 = v34;
            if (v31)
            {
              v28 = [v17 key];
              *(_DWORD *)buf = 138543618;
              v40 = v28;
              __int16 v41 = 2114;
              v42 = v12;
              v29 = "Can't parse because %{public}@ property is not of expected (NSDictionary) type: %{public}@";
LABEL_33:
              _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);
            }
LABEL_39:

LABEL_40:
            v21 = 0;
            goto LABEL_41;
          }
        }
        else if (!v20 && (_NSIsNSArray() & 1) == 0)
        {
          v25 = [v17 key];

          v26 = os_log_create("com.apple.amp.mediaplayer", "Default");
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          if (v25)
          {
            uint64_t v8 = v34;
            if (v27)
            {
              v28 = [v17 key];
              *(_DWORD *)buf = 138543618;
              v40 = v28;
              __int16 v41 = 2114;
              v42 = v12;
              v29 = "Can't parse because %{public}@ property is not of expected (NSArray) type: %{public}@";
              goto LABEL_33;
            }
            goto LABEL_39;
          }
          uint64_t v8 = v34;
          if (!v27) {
            goto LABEL_39;
          }
          *(_DWORD *)buf = 138543362;
          v40 = v12;
          v32 = "Can't parse because array first object is not of expected (NSArray) type: %{public}@";
LABEL_38:
          _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
          goto LABEL_39;
        }

        if (v13 == ++v15)
        {
          uint64_t v13 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
          uint64_t v8 = v34;
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v21 = [(MPModelStoreBrowseRoomMusicKitResponseParser *)self _parsedElements:v12];
    long long v16 = v12;
LABEL_41:
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      rawResponseOutput = self->_rawResponseOutput;
      *(_DWORD *)buf = 138543362;
      v40 = rawResponseOutput;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "Can't parse because input has unexpected type: %{public}@", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (MPSectionedCollection)results
{
  int64_t parseOnceToken = self->_parseOnceToken;
  p_int64_t parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MPModelStoreBrowseRoomMusicKitResponseParser_results__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  if (parseOnceToken != -1) {
    dispatch_once(p_parseOnceToken, block);
  }
  return self->_results;
}

void __55__MPModelStoreBrowseRoomMusicKitResponseParser_results__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _parsedSectionedCollection];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (MPModelStoreBrowseRoomMusicKitResponseParser)initWithRawResponseOutput:(id)a3 sectionBuilder:(id)a4 contentItemBuilder:(id)a5 filteredFCKinds:(id)a6 userIdentity:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MPModelStoreBrowseRoomMusicKitResponseParser;
  long long v17 = [(MPModelStoreBrowseRoomMusicKitResponseParser *)&v21 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->_rawResponseOutput, a3);
    objc_storeStrong((id *)&v18->_sectionBuilder, a4);
    objc_storeStrong((id *)&v18->_contentItemBuilder, a5);
    objc_storeStrong((id *)&v18->_filteredFCKinds, a6);
    objc_storeStrong((id *)&v18->_userIdentity, a7);
  }

  return v18;
}

@end