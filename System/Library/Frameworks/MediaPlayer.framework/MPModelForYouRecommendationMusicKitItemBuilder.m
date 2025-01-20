@interface MPModelForYouRecommendationMusicKitItemBuilder
+ (id)allSupportedProperties;
- (MPModelForYouRecommendationMusicKitItemBuilder)initWithRequestedPropertySet:(id)a3 storeItemMetadataResults:(id)a4 flatSectionedItems:(id)a5 storeURLBag:(id)a6 isListenNow:(BOOL)a7;
- (MPMutableSectionedCollection)flatSectionedItems;
- (MPPropertySet)requestedPropertySet;
- (NSDictionary)storeItemMetadataResults;
- (id)convertToStoreItemMetadataDictionary:(id)a3;
- (id)modelObjectForRecommendationChildDictionary:(id)a3 parentGroup:(id)a4 subgroupsAccumulator:(id)a5 userIdentity:(id)a6;
- (id)storeItemMetadataWithMusicAPIMetadataDictionary:(id)a3;
@end

@implementation MPModelForYouRecommendationMusicKitItemBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flatSectionedItems, 0);
  objc_storeStrong((id *)&self->_storeItemMetadataResults, 0);
  objc_storeStrong((id *)&self->_requestedPropertySet, 0);
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_subgroupBuilder, 0);

  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
}

- (MPMutableSectionedCollection)flatSectionedItems
{
  return self->_flatSectionedItems;
}

- (NSDictionary)storeItemMetadataResults
{
  return self->_storeItemMetadataResults;
}

- (MPPropertySet)requestedPropertySet
{
  return self->_requestedPropertySet;
}

- (id)convertToStoreItemMetadataDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 addEntriesFromDictionary:v3];
  v5 = [v3 objectForKey:@"attributes"];

  if (_NSIsNSDictionary())
  {
    [v4 addEntriesFromDictionary:v5];
    id v6 = v5;
    v7 = [v6 objectForKey:@"playParams"];
    if (_NSIsNSDictionary())
    {
      v8 = [v7 objectForKey:@"kind"];
      if (_NSIsNSString()) {
        [v4 setValue:v8 forKey:@"kind"];
      }
    }
    v9 = [v6 objectForKey:@"artistName"];
    if (_NSIsNSString()) {
      [v4 setValue:v9 forKey:@"artistNameObject"];
    }
    v10 = [v6 objectForKey:@"artwork"];
    if (v10) {
      [v4 setValue:v10 forKey:@"artwork"];
    }
  }
  v11 = (void *)[v4 copy];

  return v11;
}

- (id)storeItemMetadataWithMusicAPIMetadataDictionary:(id)a3
{
  id v4 = a3;
  v5 = [MPStoreItemMetadata alloc];
  id v6 = [(MPModelForYouRecommendationMusicKitItemBuilder *)self convertToStoreItemMetadataDictionary:v4];

  v7 = [(MPStoreItemMetadata *)v5 initWithStorePlatformDictionary:v6];

  return v7;
}

- (id)modelObjectForRecommendationChildDictionary:(id)a3 parentGroup:(id)a4 subgroupsAccumulator:(id)a5 userIdentity:(id)a6
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v79 = a5;
  id v12 = a6;
  [(MPModelForYouRecommendationMusicKitItemBuilder *)self storeItemMetadataResults];
  v76 = id v75 = v10;
  v74 = v11;
  id v77 = v12;
  if (!self->_requestedItemProperties.isInitialized)
  {
    v13 = [(MPModelForYouRecommendationMusicKitItemBuilder *)self requestedPropertySet];
    v14 = [v13 properties];
    self->_requestedItemProperties.itemType = [v14 containsObject:@"MPModelForYouRecommendationItemPropertyItemType"];
    self->_requestedItemProperties.url = [v14 containsObject:@"MPModelForYouRecommendationItemPropertyURL"];
    self->_requestedItemProperties.reason = [v14 containsObject:@"MPModelForYouRecommendationItemPropertyReason"];
    self->_requestedItemProperties.utterance = [v14 containsObject:@"MPModelForYouRecommendationItemPropertyUtterance"];
    self->_requestedItemProperties.backedByStoreItemMetadata = [v14 containsObject:@"MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata"];
    v15 = [v13 relationships];
    v16 = objc_opt_new();
    v17 = [v15 objectForKey:@"MPModelForYouRecommendationItemRelationshipAlbum"];
    if (v17)
    {
      self->_requestedItemProperties.album = 1;
      [v16 setObject:v17 forKey:@"MPModelStoreBrowseContentItemRelationshipAlbum"];
    }
    v18 = [v15 objectForKey:@"MPModelForYouRecommendationItemRelationshipPlaylist"];
    if (v18)
    {
      self->_requestedItemProperties.playlist = 1;
      [v16 setObject:v18 forKey:@"MPModelStoreBrowseContentItemRelationshipPlaylist"];
    }
    v19 = [v15 objectForKey:@"MPModelForYouRecommendationItemRelationshipRadioStation"];
    if (v19)
    {
      self->_requestedItemProperties.radioStation = 1;
      [v16 setObject:v19 forKey:@"MPModelStoreBrowseContentItemRelationshipRadioStation"];
    }
    v20 = [MPPropertySet alloc];
    v95[0] = @"MPModelStoreBrowseContentItemPropertyItemType";
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1];
    v22 = [(MPPropertySet *)v20 initWithProperties:v21 relationships:v16];

    v23 = [[MPModelStoreBrowseContentItemBuilder alloc] initWithRequestedPropertySet:v22];
    contentItemBuilder = self->_contentItemBuilder;
    self->_contentItemBuilder = v23;

    [(MPModelStoreBrowseContentItemBuilder *)self->_contentItemBuilder setPreventStoreItemMetadataCaching:1];
    v25 = [v15 objectForKey:@"MPModelForYouRecommendationItemRelationshipSubgroup"];
    self->_requestedItemProperties.subgroup = v25 != 0;
    v26 = [[MPModelForYouRecommendationMusicKitGroupBuilder alloc] initWithRequestedGroupPropertySet:v25 requestedItemPropertySet:v13 storeItemMetadataResults:v76 flatSectionedItems:self->_flatSectionedItems storeURLBag:self->_storeURLBag isListenNow:self->_isListenNow];
    subgroupBuilder = self->_subgroupBuilder;
    self->_subgroupBuilder = v26;

    self->_requestedItemProperties.isInitialized = 1;
    id v11 = v74;
    id v10 = v75;
    id v12 = v77;
  }
  v28 = +[MPIdentifierSet emptyIdentifierSet];
  v29 = [v10 objectForKey:@"id"];
  if (_NSIsNSString()) {
    id v30 = v29;
  }
  else {
    id v30 = 0;
  }
  v31 = [v10 objectForKey:@"type"];
  if (_NSIsNSString()) {
    id v32 = v31;
  }
  else {
    id v32 = 0;
  }
  v33 = [v10 objectForKey:@"meta"];
  v72 = v33;
  if (_NSIsNSDictionary())
  {
    v69 = v28;
    v34 = [v33 objectForKey:@"reason"];
    if (_NSIsNSDictionary())
    {
      v35 = [v34 objectForKey:@"stringForDisplay"];
      if (_NSIsNSString()) {
        id v78 = v35;
      }
      else {
        id v78 = 0;
      }
    }
    else
    {
      id v78 = 0;
    }
    v36 = [v33 objectForKey:@"utterance"];
    if (_NSIsNSDictionary())
    {
      id v37 = v32;
      v38 = [v36 objectForKey:@"stringForDisplay"];
      if (_NSIsNSString()) {
        id v80 = v38;
      }
      else {
        id v80 = 0;
      }

      id v32 = v37;
      v33 = v72;
    }
    else
    {
      id v80 = 0;
    }

    v28 = v69;
    id v12 = v77;
  }
  else
  {
    id v80 = 0;
    id v78 = 0;
  }
  v73 = v31;
  if (![v11 hasLoadedValueForKey:@"MPModelForYouRecommendationGroupPropertyTraits"]|| (char v39 = objc_msgSend(v11, "traits"), v80)|| (v39 & 1) == 0)
  {
    v70 = v29;
    v42 = v30;
    uint64_t v43 = [v10 objectForKey:@"attributes"];
    v67 = (void *)v43;
    if (_NSIsNSDictionary())
    {
      v44 = (void *)v43;
      id v45 = v11;
      v46 = v28;
      id v47 = v12;
      v48 = [v44 objectForKey:@"url"];
      if (_NSIsNSString())
      {
        v40 = [MEMORY[0x1E4F1CB10] URLWithString:v48];
      }
      else
      {
        v40 = 0;
      }

      id v12 = v47;
      v28 = v46;
      id v11 = v45;
    }
    else
    {
      v40 = 0;
    }
    v68 = v42;
    id v71 = v32;
    if (![v42 length]
      || ![v32 length]
      || [v11 isGroupRecommendation])
    {
      v49 = v28;
      v50 = [(MPModelForYouRecommendationMusicKitGroupBuilder *)self->_subgroupBuilder modelObjectForRecommendationDictionary:v10 userIdentity:v12];
      uint64_t v51 = [v50 identifiers];
      char v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      uint64_t v56 = 4;
LABEL_46:

      v57 = [MPModelForYouRecommendationItem alloc];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __140__MPModelForYouRecommendationMusicKitItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke;
      v81[3] = &unk_1E57F6548;
      v81[4] = self;
      uint64_t v91 = v56;
      v82 = v40;
      id v83 = v78;
      id v84 = v80;
      id v58 = v53;
      id v85 = v58;
      id v59 = v54;
      id v86 = v59;
      id v60 = v55;
      id v87 = v60;
      id v61 = v50;
      id v88 = v61;
      id v11 = v74;
      id v89 = v74;
      id v90 = v79;
      char v92 = v52;
      v41 = [(MPModelObject *)v57 initWithIdentifiers:v51 block:v81];

      v28 = (void *)v51;
      id v32 = v71;
LABEL_47:

      id v10 = v75;
      id v12 = v77;
      id v30 = v68;
      v29 = v70;
      v33 = v72;
      goto LABEL_48;
    }
    v63 = self->_contentItemBuilder;
    v64 = [(MPModelForYouRecommendationMusicKitItemBuilder *)self storeItemMetadataWithMusicAPIMetadataDictionary:v10];
    v49 = [(MPStoreModelObjectBuilder *)v63 modelObjectWithStoreItemMetadata:v64 userIdentity:v12];

    uint64_t v65 = [v49 itemType];
    if (v65 == 5)
    {
      id v32 = v71;
      if (self->_requestedItemProperties.radioStation)
      {
        v66 = [v49 radioStation];
        v54 = 0;
        v53 = 0;
        uint64_t v56 = 3;
        v55 = v66;
        goto LABEL_59;
      }
    }
    else
    {
      id v32 = v71;
      if (v65 == 4)
      {
        v66 = [v49 playlist];
        v55 = 0;
        v53 = 0;
        uint64_t v56 = 2;
        v54 = v66;
        goto LABEL_59;
      }
      if (v65 == 1)
      {
        v66 = [v49 album];
        v55 = 0;
        v54 = 0;
        uint64_t v56 = 1;
        v53 = v66;
LABEL_59:
        uint64_t v51 = [v66 identifiers];

        v50 = 0;
        char v52 = 1;
        goto LABEL_46;
      }
    }

    id v58 = 0;
    id v59 = 0;
    id v60 = 0;
    id v61 = 0;
    v41 = 0;
    id v11 = v74;
    goto LABEL_47;
  }
  v40 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v94 = v10;
    _os_log_impl(&dword_1952E8000, v40, OS_LOG_TYPE_ERROR, "Dropping node because parent requires displaying utterance and no utterance was found in item dictionary: %{public}@", buf, 0xCu);
  }
  v41 = 0;
LABEL_48:

  return v41;
}

void __140__MPModelForYouRecommendationMusicKitItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(unsigned char **)(a1 + 32);
  id v6 = v3;
  if (v4[9])
  {
    [v3 setItemType:*(void *)(a1 + 112)];
    id v4 = *(unsigned char **)(a1 + 32);
  }
  if (v4[10])
  {
    [v6 setUrl:*(void *)(a1 + 40)];
    id v4 = *(unsigned char **)(a1 + 32);
  }
  if (v4[11])
  {
    [v6 setReason:*(void *)(a1 + 48)];
    id v4 = *(unsigned char **)(a1 + 32);
  }
  if (v4[12])
  {
    [v6 setUtterance:*(void *)(a1 + 56)];
    id v4 = *(unsigned char **)(a1 + 32);
  }
  if (v4[14])
  {
    [v6 setAlbum:*(void *)(a1 + 64)];
    id v4 = *(unsigned char **)(a1 + 32);
  }
  if (v4[15])
  {
    [v6 setPlaylist:*(void *)(a1 + 72)];
    id v4 = *(unsigned char **)(a1 + 32);
  }
  if (v4[16])
  {
    [v6 setRadioStation:*(void *)(a1 + 80)];
    id v4 = *(unsigned char **)(a1 + 32);
  }
  if (v4[17])
  {
    if (*(void *)(a1 + 88))
    {
      [v6 setParentGroup:*(void *)(a1 + 96)];
      objc_msgSend(v6, "setSubgroupIndex:", objc_msgSend(*(id *)(a1 + 104), "count"));
      [*(id *)(a1 + 104) addObject:*(void *)(a1 + 88)];
    }
    else
    {
      [v6 setParentGroup:0];
      [v6 setSubgroupIndex:0x7FFFFFFFFFFFFFFFLL];
    }
  }
  v5 = v6;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 13))
  {
    [v6 setBackedByStoreItemMetadata:*(unsigned __int8 *)(a1 + 120)];
    v5 = v6;
  }
}

- (MPModelForYouRecommendationMusicKitItemBuilder)initWithRequestedPropertySet:(id)a3 storeItemMetadataResults:(id)a4 flatSectionedItems:(id)a5 storeURLBag:(id)a6 isListenNow:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MPModelForYouRecommendationMusicKitItemBuilder;
  v16 = [(MPModelForYouRecommendationMusicKitItemBuilder *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    requestedPropertySet = v16->_requestedPropertySet;
    v16->_requestedPropertySet = (MPPropertySet *)v17;

    uint64_t v19 = [v13 copy];
    storeItemMetadataResults = v16->_storeItemMetadataResults;
    v16->_storeItemMetadataResults = (NSDictionary *)v19;

    objc_storeStrong((id *)&v16->_flatSectionedItems, a5);
    objc_storeStrong((id *)&v16->_storeURLBag, a6);
    v16->_isListenNow = a7;
  }

  return v16;
}

+ (id)allSupportedProperties
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v16[0] = @"MPModelForYouRecommendationItemPropertyItemType";
  v16[1] = @"MPModelForYouRecommendationItemPropertyURL";
  v16[2] = @"MPModelForYouRecommendationItemPropertyReason";
  v16[3] = @"MPModelForYouRecommendationItemPropertyUtterance";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v3 = +[MPStoreModelAlbumBuilder allSupportedProperties];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeProperty:@"MPModelPropertyAlbumDiscCount"];
  v5 = (void *)[v4 copy];
  id v6 = +[MPStoreModelPlaylistBuilder allSupportedProperties];
  v7 = (void *)[v6 mutableCopy];

  [v7 removeProperty:@"MPModelPropertyPlaylistEditorNotes"];
  [v7 removeProperty:@"MPModelPropertyPlaylistTrackCount"];
  v8 = (void *)[v7 copy];
  v9 = +[MPStoreModelRadioStationBuilder allSupportedProperties];
  v14[0] = @"MPModelForYouRecommendationItemRelationshipAlbum";
  v14[1] = @"MPModelForYouRecommendationItemRelationshipPlaylist";
  v15[0] = v5;
  v15[1] = v8;
  v15[2] = v9;
  v14[2] = @"MPModelForYouRecommendationItemRelationshipRadioStation";
  v14[3] = @"MPModelForYouRecommendationItemRelationshipSubgroup";
  id v10 = +[MPModelForYouRecommendationMusicKitGroupBuilder allSupportedGroupProperties];
  v15[3] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  id v12 = [[MPPropertySet alloc] initWithProperties:v2 relationships:v11];

  return v12;
}

@end