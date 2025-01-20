@interface MPModelForYouRecommendationItemBuilder
+ (id)allSupportedProperties;
- (MPModelForYouRecommendationItemBuilder)initWithRequestedPropertySet:(id)a3 storeItemMetadataResults:(id)a4 flatSectionedItems:(id)a5;
- (MPMutableSectionedCollection)flatSectionedItems;
- (MPPropertySet)requestedPropertySet;
- (NSDictionary)storeItemMetadataResults;
- (id)modelObjectForRecommendationChildDictionary:(id)a3 parentGroup:(id)a4 subgroupsAccumulator:(id)a5 userIdentity:(id)a6;
@end

@implementation MPModelForYouRecommendationItemBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flatSectionedItems, 0);
  objc_storeStrong((id *)&self->_storeItemMetadataResults, 0);
  objc_storeStrong((id *)&self->_requestedPropertySet, 0);
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

- (id)modelObjectForRecommendationChildDictionary:(id)a3 parentGroup:(id)a4 subgroupsAccumulator:(id)a5 userIdentity:(id)a6
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(MPModelForYouRecommendationItemBuilder *)self storeItemMetadataResults];
  v80 = id v79 = v10;
  v77 = v11;
  if ((*(unsigned char *)&self->_requestedItemProperties & 1) == 0)
  {
    id v14 = v13;
    v15 = [(MPModelForYouRecommendationItemBuilder *)self requestedPropertySet];
    v16 = [v15 properties];
    if ([v16 containsObject:@"MPModelForYouRecommendationItemPropertyItemType"]) {
      char v17 = 2;
    }
    else {
      char v17 = 0;
    }
    *(unsigned char *)&self->_char requestedItemProperties = *(unsigned char *)&self->_requestedItemProperties & 0xFD | v17;
    if ([v16 containsObject:@"MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata"])char v18 = 4; {
    else
    }
      char v18 = 0;
    *(unsigned char *)&self->_char requestedItemProperties = *(unsigned char *)&self->_requestedItemProperties & 0xFB | v18;
    v19 = [v15 relationships];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v21 = [v19 objectForKey:@"MPModelForYouRecommendationItemRelationshipAlbum"];
    if (v21)
    {
      *(unsigned char *)&self->_requestedItemProperties |= 8u;
      [v20 setObject:v21 forKey:@"MPModelStoreBrowseContentItemRelationshipAlbum"];
    }
    id v72 = v12;
    v22 = [v19 objectForKey:@"MPModelForYouRecommendationItemRelationshipPlaylist"];
    char requestedItemProperties = (char)self->_requestedItemProperties;
    *(unsigned char *)&self->_char requestedItemProperties = requestedItemProperties & 0xEF | (16 * (v22 != 0));
    if (v22)
    {
      *(unsigned char *)&self->_char requestedItemProperties = requestedItemProperties | 0x10;
      [v20 setObject:v22 forKey:@"MPModelStoreBrowseContentItemRelationshipPlaylist"];
    }
    v81 = v14;
    v24 = [v19 objectForKey:@"MPModelForYouRecommendationItemRelationshipRadioStation"];
    char v25 = (char)self->_requestedItemProperties;
    *(unsigned char *)&self->_char requestedItemProperties = v25 & 0xDF | (32 * (v24 != 0));
    if (v24)
    {
      *(unsigned char *)&self->_char requestedItemProperties = v25 | 0x20;
      [v20 setObject:v24 forKey:@"MPModelStoreBrowseContentItemRelationshipRadioStation"];
    }
    v26 = [MPPropertySet alloc];
    v99[0] = @"MPModelStoreBrowseContentItemPropertyItemType";
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
    v28 = [(MPPropertySet *)v26 initWithProperties:v27 relationships:v20];

    v29 = [[MPModelStoreBrowseContentItemBuilder alloc] initWithRequestedPropertySet:v28];
    contentItemBuilder = self->_contentItemBuilder;
    self->_contentItemBuilder = v29;

    v31 = [v19 objectForKey:@"MPModelForYouRecommendationItemRelationshipSubgroup"];
    *(unsigned char *)&self->_char requestedItemProperties = *(unsigned char *)&self->_requestedItemProperties & 0xBF | ((v31 != 0) << 6);
    v32 = [[MPModelForYouRecommendationGroupBuilder alloc] initWithRequestedGroupPropertySet:v31 requestedItemPropertySet:v15 storeItemMetadataResults:v80 flatSectionedItems:self->_flatSectionedItems];
    subgroupBuilder = self->_subgroupBuilder;
    self->_subgroupBuilder = v32;

    *(unsigned char *)&self->_requestedItemProperties |= 1u;
    id v10 = v79;
    id v12 = v72;
    id v13 = v81;
  }
  v78 = [v10 objectForKey:@"contentId"];
  if (_NSIsNSString()) {
    id v34 = v78;
  }
  else {
    id v34 = 0;
  }
  v35 = [v10 objectForKey:@"contentType"];
  if (_NSIsNSString()) {
    id v36 = v35;
  }
  else {
    id v36 = 0;
  }
  v75 = v36;
  v76 = v35;
  id v74 = v34;
  if (![v34 length] || !objc_msgSend(v36, "length"))
  {
    v44 = v13;
    v45 = [(MPModelForYouRecommendationGroupBuilder *)self->_subgroupBuilder modelObjectForRecommendationDictionary:v10 userIdentity:v13];
    v82 = [v45 identifiers];
    v46 = 0;
    v42 = 0;
    v47 = 0;
    char v48 = 0;
    unint64_t v43 = 4;
    goto LABEL_40;
  }
  id v73 = v12;
  uint64_t v37 = [v80 objectForKey:v34];
  v71 = (void *)v37;
  if (!v37)
  {
    v38 = [v10 objectForKey:@"isUnavailableInAppleMusic"];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_46;
    }
    v68 = v38;
    if (![v38 BOOLValue]) {
      goto LABEL_46;
    }
    id v12 = v73;
    if ([v36 isEqualToString:@"1"])
    {
      unint64_t v43 = strtoll((const char *)[v34 UTF8String], 0, 0);
      if (v43)
      {
        id v49 = v13;
        v50 = [MPIdentifierSet alloc];
        v51 = +[MPModelAlbumKind identityKind];
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke;
        v98[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
        v98[4] = v43;
        v82 = [(MPIdentifierSet *)v50 initWithSource:@"ForYou" modelKind:v51 block:v98];
        unint64_t v43 = 1;
LABEL_55:

        if (!v82)
        {
          v69 = 0;
          v70 = 0;
          v42 = 0;
          char v48 = 0;
          v82 = 0;
          v40 = v68;
          id v13 = v49;
          goto LABEL_39;
        }
        id v13 = v49;
        if (v43 != 2)
        {
          v40 = v68;
          v69 = [(MPModelObject *)[MPModelAlbum alloc] initWithIdentifiers:v82 block:&__block_literal_global_44500];
          v70 = 0;
          v42 = 0;
          char v48 = 0;
          goto LABEL_39;
        }
        v42 = [(MPModelObject *)[MPModelPlaylist alloc] initWithIdentifiers:v82 block:&__block_literal_global_45];
        v69 = 0;
        v70 = 0;
        char v48 = 0;
LABEL_60:
        v40 = v68;
        goto LABEL_39;
      }
    }
    else
    {
      if (([v36 isEqualToString:@"3"] & 1) == 0
        && ![v36 isEqualToString:@"21"])
      {
        if ([v36 isEqualToString:@"22"])
        {
          v64 = [MPIdentifierSet alloc];
          uint64_t v65 = +[MPModelAlbumKind identityKind];
          v66 = v13;
          v67 = (void *)v65;
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_5;
          v92[3] = &unk_1E57F95D0;
          id v49 = v66;
          id v93 = v66;
          id v94 = v34;
          v82 = [(MPIdentifierSet *)v64 initWithSource:@"ForYou" modelKind:v67 block:v92];

          unint64_t v43 = 1;
          v51 = v93;
          goto LABEL_55;
        }
        v69 = 0;
        v70 = 0;
        v42 = 0;
        char v48 = 0;
        unint64_t v43 = 0;
LABEL_52:
        v82 = 0;
        goto LABEL_60;
      }
      unint64_t v43 = strtoull((const char *)[v34 UTF8String], 0, 0);
      if (v43)
      {
        v60 = [MPIdentifierSet alloc];
        uint64_t v61 = +[MPModelPlaylistKind identityKind];
        v62 = v13;
        v63 = (void *)v61;
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_3;
        v95[3] = &unk_1E57F7AD0;
        id v49 = v62;
        id v96 = v62;
        unint64_t v97 = v43;
        v82 = [(MPIdentifierSet *)v60 initWithSource:@"ForYou" modelKind:v63 block:v95];

        unint64_t v43 = 2;
        v51 = v96;
        goto LABEL_55;
      }
    }
    v69 = 0;
    v70 = 0;
    v42 = 0;
    char v48 = 0;
    goto LABEL_52;
  }
  v38 = [(MPStoreModelObjectBuilder *)self->_contentItemBuilder modelObjectWithStoreItemMetadata:v37 userIdentity:v13];
  uint64_t v39 = [v38 itemType];
  if (v39 == 5)
  {
    v40 = v38;
    v41 = [v38 radioStation];
    v42 = 0;
    v69 = 0;
    v70 = v41;
    unint64_t v43 = 3;
    goto LABEL_37;
  }
  if (v39 == 4)
  {
    v40 = v38;
    v41 = [v38 playlist];
    v69 = 0;
    v70 = 0;
    unint64_t v43 = 2;
    v42 = v41;
    goto LABEL_37;
  }
  if (v39 != 1)
  {
LABEL_46:
    v69 = 0;
    v70 = 0;
    v42 = 0;
    char v48 = 0;
    unint64_t v43 = 0;
    v82 = 0;
    v40 = v38;
    goto LABEL_38;
  }
  v40 = v38;
  v41 = [v38 album];
  v69 = (MPModelAlbum *)v41;
  v70 = 0;
  v42 = 0;
  unint64_t v43 = 1;
LABEL_37:
  v82 = [(MPModelObject *)v41 identifiers];
  char v48 = 1;
LABEL_38:
  id v12 = v73;
LABEL_39:
  v44 = v13;

  v45 = 0;
  v47 = v69;
  v46 = v70;
LABEL_40:
  v52 = v42;
  if (v82)
  {
    char v53 = v48;
    v54 = [MPModelForYouRecommendationItem alloc];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_10;
    v83[3] = &unk_1E57F7148;
    v83[4] = self;
    unint64_t v90 = v43;
    v84 = v47;
    v85 = v52;
    v86 = v46;
    id v87 = v45;
    v55 = v77;
    id v88 = v77;
    id v89 = v12;
    char v91 = v53;
    v56 = v79;
    v57 = v74;
    v58 = [(MPModelObject *)v54 initWithIdentifiers:v82 block:v83];
  }
  else
  {
    v58 = 0;
    v55 = v77;
    v57 = v74;
    v56 = v79;
  }

  return v58;
}

uint64_t __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_2;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 accountDSID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_4;
  v6[3] = &__block_descriptor_40_e45_v16__0___MPMutablePersonalStoreIdentifiers__8l;
  v6[4] = *(void *)(a1 + 40);
  [v4 setPersonalStoreIdentifiersWithPersonID:v5 block:v6];
}

void __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 accountDSID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_6;
  v6[3] = &unk_1E57F96C8;
  id v7 = *(id *)(a1 + 40);
  [v4 setPersonalStoreIdentifiersWithPersonID:v5 block:v6];
}

void __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  id v4 = a2;
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  if ((v3 & 2) != 0)
  {
    [v4 setItemType:*(void *)(a1 + 88)];
    char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 8);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 32) + 8) & 8) == 0)
  {
    goto LABEL_3;
  }
  [v4 setAlbum:*(void *)(a1 + 40)];
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  [v4 setPlaylist:*(void *)(a1 + 48)];
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
LABEL_10:
  [v4 setRadioStation:*(void *)(a1 + 56)];
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 8) & 0x40) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  if (*(void *)(a1 + 64))
  {
    [v4 setParentGroup:*(void *)(a1 + 72)];
    objc_msgSend(v4, "setSubgroupIndex:", objc_msgSend(*(id *)(a1 + 80), "count"));
    [*(id *)(a1 + 80) addObject:*(void *)(a1 + 64)];
  }
  else
  {
    [v4 setParentGroup:0];
    [v4 setSubgroupIndex:0x7FFFFFFFFFFFFFFFLL];
  }
LABEL_14:
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 8) & 4) != 0) {
    [v4 setBackedByStoreItemMetadata:*(unsigned __int8 *)(a1 + 96)];
  }
}

uint64_t __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setCloudAlbumID:*(void *)(a1 + 32)];
}

uint64_t __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setCloudID:*(void *)(a1 + 32)];
}

void __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAdamID:v3];
  [v4 setPurchasedAdamID:*(void *)(a1 + 32)];
}

- (MPModelForYouRecommendationItemBuilder)initWithRequestedPropertySet:(id)a3 storeItemMetadataResults:(id)a4 flatSectionedItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPModelForYouRecommendationItemBuilder;
  id v11 = [(MPModelForYouRecommendationItemBuilder *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    requestedPropertySet = v11->_requestedPropertySet;
    v11->_requestedPropertySet = (MPPropertySet *)v12;

    uint64_t v14 = [v9 copy];
    storeItemMetadataResults = v11->_storeItemMetadataResults;
    v11->_storeItemMetadataResults = (NSDictionary *)v14;

    objc_storeStrong((id *)&v11->_flatSectionedItems, a5);
  }

  return v11;
}

+ (id)allSupportedProperties
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v2 = +[MPStoreModelAlbumBuilder allSupportedProperties];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 removeProperty:@"MPModelPropertyAlbumDiscCount"];
  id v4 = (void *)[v3 copy];
  v5 = +[MPStoreModelPlaylistBuilder allSupportedProperties];
  v6 = (void *)[v5 mutableCopy];

  [v6 removeProperty:@"MPModelPropertyPlaylistEditorNotes"];
  [v6 removeProperty:@"MPModelPropertyPlaylistTrackCount"];
  id v7 = (void *)[v6 copy];
  id v8 = +[MPStoreModelRadioStationBuilder allSupportedProperties];
  id v9 = [MPPropertySet alloc];
  v17[0] = @"MPModelForYouRecommendationItemPropertyItemType";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v11 = +[MPModelForYouRecommendationGroupBuilder allSupportedGroupProperties];
  v16[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:4];
  id v13 = [(MPPropertySet *)v9 initWithProperties:v10 relationships:v12];

  return v13;
}

@end