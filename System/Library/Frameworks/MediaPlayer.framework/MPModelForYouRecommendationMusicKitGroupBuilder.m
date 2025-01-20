@interface MPModelForYouRecommendationMusicKitGroupBuilder
+ (id)allSupportedGroupProperties;
+ (id)allSupportedItemProperties;
- (MPModelForYouRecommendationMusicKitGroupBuilder)initWithRequestedGroupPropertySet:(id)a3 requestedItemPropertySet:(id)a4 storeItemMetadataResults:(id)a5 flatSectionedItems:(id)a6 storeURLBag:(id)a7 isListenNow:(BOOL)a8;
- (MPMutableSectionedCollection)flatSectionedItems;
- (MPPropertySet)requestedGroupPropertySet;
- (MPPropertySet)requestedItemPropertySet;
- (NSDictionary)storeItemMetadataResults;
- (id)modelObjectForItemsArray:(id)a3 userIdentity:(id)a4;
- (id)modelObjectForRecentlyPlayedArray:(id)a3 userIdentity:(id)a4;
- (id)modelObjectForRecommendationDictionary:(id)a3 userIdentity:(id)a4;
- (void)initializeRequestedGroupProperties;
@end

@implementation MPModelForYouRecommendationMusicKitGroupBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flatSectionedItems, 0);
  objc_storeStrong((id *)&self->_storeItemMetadataResults, 0);
  objc_storeStrong((id *)&self->_requestedItemPropertySet, 0);
  objc_storeStrong((id *)&self->_requestedGroupPropertySet, 0);
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDateFormatter, 0);

  objc_storeStrong((id *)&self->_itemBuilder, 0);
}

- (MPMutableSectionedCollection)flatSectionedItems
{
  return self->_flatSectionedItems;
}

- (NSDictionary)storeItemMetadataResults
{
  return self->_storeItemMetadataResults;
}

- (MPPropertySet)requestedItemPropertySet
{
  return self->_requestedItemPropertySet;
}

- (MPPropertySet)requestedGroupPropertySet
{
  return self->_requestedGroupPropertySet;
}

- (id)modelObjectForRecommendationDictionary:(id)a3 userIdentity:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((*(_WORD *)&self->_requestedGroupProperties & 1) == 0) {
    [(MPModelForYouRecommendationMusicKitGroupBuilder *)self initializeRequestedGroupProperties];
  }
  v8 = [v6 objectForKey:@"id"];
  if (_NSIsNSString())
  {
    id v9 = v8;
    if ([v9 length])
    {
      v10 = [MPIdentifierSet alloc];
      v11 = +[MPModelForYouRecommendationGroupKind identityKind];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke;
      v24[3] = &unk_1E57F95D0;
      id v12 = v7;
      id v25 = v12;
      id v26 = v9;
      v13 = [(MPIdentifierSet *)v10 initWithSource:@"ForYou" modelKind:v11 block:v24];

      v14 = [MPModelForYouRecommendationGroup alloc];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_3;
      v21[3] = &unk_1E57F69A0;
      v21[4] = self;
      id v22 = v6;
      id v23 = v12;
      v15 = [(MPModelObject *)v14 initWithIdentifiers:v13 block:v21];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = [(MPModelForYouRecommendationGroup *)v15 title];

  if (v16)
  {
    if ([(MPModelForYouRecommendationGroup *)v15 groupType] == 4
      || [(MPModelForYouRecommendationGroup *)v15 numberOfItems])
    {
      v17 = v15;
      goto LABEL_19;
    }
    v18 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v6;
      v19 = "Dropping empty node: %{public}@";
      goto LABEL_17;
    }
  }
  else
  {
    v18 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v6;
      v19 = "Dropping node without title: %{public}@";
LABEL_17:
      _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
    }
  }

  v17 = 0;
LABEL_19:

  return v17;
}

void __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 accountDSID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_2;
  v6[3] = &unk_1E57F96C8;
  id v7 = *(id *)(a1 + 40);
  [v4 setPersonalStoreIdentifiersWithPersonID:v5 block:v6];
}

void __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  __int16 v4 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v4 & 2) != 0)
  {
    v5 = [*(id *)(a1 + 40) objectForKey:@"attributes"];
    if (_NSIsNSDictionary())
    {
      id v6 = [v5 objectForKey:@"kind"];
      if (_NSIsNSString())
      {
        if ([v6 isEqualToString:@"recently-played"]) {
          uint64_t v7 = 4;
        }
        else {
          uint64_t v7 = 0;
        }
      }
      else
      {
        uint64_t v7 = 0;
      }
      v8 = [v5 objectForKey:@"display"];
      if (_NSIsNSDictionary())
      {
        id v9 = [v8 objectForKey:@"kind"];
        if (_NSIsNSString())
        {
          if ([v9 isEqualToString:@"MusicNotesHeroShelf"])
          {
            uint64_t v7 = 11;
          }
          else if ([v9 isEqualToString:@"MusicSuperHeroShelf"])
          {
            uint64_t v7 = 12;
          }
        }
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    [v3 setGroupType:v7];

    __int16 v4 = *(_WORD *)(*(void *)(a1 + 32) + 8);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_3;
  }
  v10 = [*(id *)(a1 + 40) objectForKey:@"attributes"];
  v11 = [v10 objectForKey:@"title"];

  if (_NSIsNSDictionary())
  {
    id v12 = [v11 objectForKey:@"stringForDisplay"];
    if (_NSIsNSString())
    {
      if (v12) {
        goto LABEL_40;
      }
    }
    else
    {
    }
  }
  id v12 = [*(id *)(a1 + 40) objectForKey:@"name"];
  if (!v12)
  {
    v13 = [*(id *)(a1 + 40) objectForKey:@"attributes"];
    id v12 = [v13 objectForKey:@"name"];
  }
  if (_NSIsNSString())
  {
    if (v12) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  v14 = [*(id *)(a1 + 40) objectForKey:@"attributes"];
  v15 = [v14 objectForKey:@"reason"];

  if (_NSIsNSDictionary())
  {
    v16 = [v15 objectForKey:@"stringForDisplay"];
    if (_NSIsNSString()) {
      id v12 = v16;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

LABEL_40:
  [v3 setTitle:v12];

  __int16 v4 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 0x40) == 0) {
      goto LABEL_62;
    }
    goto LABEL_56;
  }
LABEL_41:
  v17 = [*(id *)(a1 + 40) objectForKey:@"relationships"];
  if (_NSIsNSDictionary())
  {
    v18 = [v17 objectForKey:@"contents"];
    if (_NSIsNSDictionary())
    {
      v19 = [v18 objectForKey:@"href"];
      if (_NSIsNSString())
      {
        v20 = MusicURLWithPathUsingURLBag(v19, *(void **)(*(void *)(a1 + 32) + 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 40));
LABEL_54:

        goto LABEL_55;
      }
      id v23 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = *(NSObject **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v97 = v24;
        _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_ERROR, "Property href of contents dictionary not found for recommendation item: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v22 = *(NSObject **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v97 = v22;
        _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, "Contents dictionary not found on relationships of recommendation item: %{public}@", buf, 0xCu);
      }
    }
    v20 = 0;
    goto LABEL_54;
  }
  v18 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v21 = *(NSObject **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v97 = v21;
    _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_ERROR, "Relationships dictionary not found on recommendation item: %{public}@", buf, 0xCu);
  }
  v20 = 0;
LABEL_55:

  [v3 setLoadAdditionalContentURL:v20];
  if ((*(_WORD *)(*(void *)(a1 + 32) + 8) & 0x40) == 0) {
    goto LABEL_62;
  }
LABEL_56:
  id v25 = [*(id *)(a1 + 40) objectForKey:@"href"];
  if (_NSIsNSString())
  {
    id v26 = MusicURLWithPathUsingURLBag(v25, *(void **)(*(void *)(a1 + 32) + 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  }
  else
  {
    v27 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = *(NSObject **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v97 = v28;
      _os_log_impl(&dword_1952E8000, v27, OS_LOG_TYPE_ERROR, "Property href not found for recommendation item: %{public}@", buf, 0xCu);
    }

    id v26 = 0;
  }
  [v3 setHrefURL:v26];

LABEL_62:
  uint64_t v29 = [*(id *)(a1 + 40) objectForKey:@"attributes"];
  v30 = [v29 objectForKey:@"isGroupRecommendation"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setGroupRecommendation:", objc_msgSend(v30, "BOOLValue"));
  }
  __int16 v31 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v31 & 0x100) == 0)
  {
    if ((*(_WORD *)(*(void *)(a1 + 32) + 8) & 0x200) == 0) {
      goto LABEL_66;
    }
    goto LABEL_86;
  }
  v32 = [*(id *)(a1 + 40) objectForKey:@"attributes"];
  v33 = [v32 objectForKey:@"traits"];

  if (!_NSIsNSArray())
  {
    v34 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v42 = *(NSObject **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v97 = v42;
      _os_log_impl(&dword_1952E8000, v34, OS_LOG_TYPE_ERROR, "No traits array found in attributes of recommendation item: %{public}@", buf, 0xCu);
    }
    goto LABEL_84;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v34 = v33;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (!v35)
  {
LABEL_84:
    uint64_t v37 = 0;
    goto LABEL_85;
  }
  uint64_t v36 = v35;
  v77 = v33;
  v78 = sel_BOOLValue;
  id v79 = v3;
  uint64_t v37 = 0;
  uint64_t v38 = *(void *)v90;
  do
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      if (*(void *)v90 != v38) {
        objc_enumerationMutation(v34);
      }
      uint64_t v40 = *(void *)(*((void *)&v89 + 1) + 8 * i);
      if (_NSIsNSString())
      {
        v41 = [&unk_1EE6EE430 objectForKeyedSubscript:v40];
        v37 |= [v41 unsignedIntegerValue];
      }
      else
      {
        v41 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v97 = v34;
          _os_log_impl(&dword_1952E8000, v41, OS_LOG_TYPE_ERROR, "Unexpected trait type %{public}@", buf, 0xCu);
        }
      }
    }
    uint64_t v36 = [v34 countByEnumeratingWithState:&v89 objects:v95 count:16];
  }
  while (v36);
LABEL_85:

  [v3 setTraits:v37];
  __int16 v31 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v31 & 0x200) == 0)
  {
LABEL_66:
    if ((v31 & 0x400) == 0) {
      goto LABEL_67;
    }
    goto LABEL_89;
  }
LABEL_86:
  objc_msgSend(v3, "setDisplaysAsGridCellInCarPlay:", 0, v77, v78, v79);
  v43 = [*(id *)(a1 + 40) objectForKey:@"attributes"];
  v44 = [v43 objectForKey:@"emphasize"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setDisplaysAsGridCellInCarPlay:", objc_msgSend(v44, "BOOLValue"));
  }

  __int16 v31 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v31 & 0x400) == 0)
  {
LABEL_67:
    if ((v31 & 4) == 0) {
      goto LABEL_96;
    }
    goto LABEL_92;
  }
LABEL_89:
  objc_msgSend(v3, "setDisplaysAsTitledSectionWithRowsInCarPlay:", 0, v77, v78, v79);
  v45 = [*(id *)(a1 + 40) objectForKey:@"attributes"];
  v46 = [v45 objectForKey:@"expand"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setDisplaysAsTitledSectionWithRowsInCarPlay:", objc_msgSend(v46, "BOOLValue"));
  }

  if ((*(_WORD *)(*(void *)(a1 + 32) + 8) & 4) != 0)
  {
LABEL_92:
    v47 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", @"attributes", v77, v78, v79);
    v48 = [v47 objectForKey:@"lastModifiedDate"];

    if (_NSIsNSString())
    {
      v49 = [*(id *)(*(void *)(a1 + 32) + 24) dateFromString:v48];
    }
    else
    {
      v49 = 0;
    }
    [v3 setLastUpdatedDate:v49];
  }
LABEL_96:
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((*(_WORD *)(*(void *)(a1 + 32) + 8) & 0x10) != 0) {
    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v51 = 0;
  }
  v52 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", @"relationships", v77, v78, v79);
  v53 = [v52 objectForKey:@"contents"];
  v54 = [v53 objectForKey:@"data"];

  if (!v54)
  {
    v55 = [*(id *)(a1 + 40) objectForKey:@"relationships"];
    v56 = [v55 objectForKey:@"recommendations"];
    v54 = [v56 objectForKey:@"data"];
  }
  if (_NSIsNSArray())
  {
    v80 = v30;
    id v57 = v54;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v85 objects:v94 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v86 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v85 + 1) + 8 * j);
          if (_NSIsNSDictionary())
          {
            uint64_t v63 = *(void *)(a1 + 32);
            v64 = *(void **)(v63 + 16);
            __int16 v65 = *(_WORD *)(v63 + 8);
            if ((v65 & 0x10) != 0) {
              id v66 = v3;
            }
            else {
              id v66 = 0;
            }
            if ((v65 & 0x10) != 0) {
              id v67 = v51;
            }
            else {
              id v67 = 0;
            }
            v68 = [v64 modelObjectForRecommendationChildDictionary:v62 parentGroup:v66 subgroupsAccumulator:v67 userIdentity:*(void *)(a1 + 48)];
            if (v68) {
              [v50 addObject:v68];
            }
          }
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v85 objects:v94 count:16];
      }
      while (v59);
    }

    v30 = v80;
  }
  uint64_t v69 = *(void *)(a1 + 32);
  if ((*(_WORD *)(v69 + 8) & 0x10) != 0)
  {
    [v3 setSubgroups:v51];
    uint64_t v69 = *(void *)(a1 + 32);
  }
  objc_msgSend(v3, "setSectionIndex:", objc_msgSend(*(id *)(v69 + 72), "numberOfSections"));
  [v3 setSectionedItems:*(void *)(*(void *)(a1 + 32) + 72)];
  v70 = *(void **)(*(void *)(a1 + 32) + 72);
  v71 = [MEMORY[0x1E4F1CA98] null];
  [v70 appendSection:v71];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v72 = v50;
  uint64_t v73 = [v72 countByEnumeratingWithState:&v81 objects:v93 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v82;
    do
    {
      for (uint64_t k = 0; k != v74; ++k)
      {
        if (*(void *)v82 != v75) {
          objc_enumerationMutation(v72);
        }
        [*(id *)(*(void *)(a1 + 32) + 72) appendItem:*(void *)(*((void *)&v81 + 1) + 8 * k)];
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v81 objects:v93 count:16];
    }
    while (v74);
  }
}

uint64_t __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setRecommendationID:*(void *)(a1 + 32)];
}

- (id)modelObjectForItemsArray:(id)a3 userIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(_WORD *)&self->_requestedGroupProperties & 1) == 0) {
    [(MPModelForYouRecommendationMusicKitGroupBuilder *)self initializeRequestedGroupProperties];
  }
  v8 = [MPModelForYouRecommendationGroup alloc];
  id v9 = +[MPIdentifierSet emptyIdentifierSet];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForItemsArray_userIdentity___block_invoke;
  v14[3] = &unk_1E57F69A0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = [(MPModelObject *)v8 initWithIdentifiers:v9 block:v14];

  return v12;
}

void __89__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForItemsArray_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v24 = objc_opt_new();
  if ((*(_WORD *)(*(void *)(a1 + 32) + 8) & 0x10) != 0) {
    __int16 v4 = objc_opt_new();
  }
  else {
    __int16 v4 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(NSObject **)(*((void *)&v25 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          id v11 = v10;
          uint64_t v12 = *(void *)(a1 + 32);
          v13 = *(void **)(v12 + 16);
          __int16 v14 = *(_WORD *)(v12 + 8);
          if ((v14 & 0x10) != 0) {
            id v15 = v3;
          }
          else {
            id v15 = 0;
          }
          if ((v14 & 0x10) != 0) {
            id v16 = v4;
          }
          else {
            id v16 = 0;
          }
          v17 = [v13 modelObjectForRecommendationChildDictionary:v11 parentGroup:v15 subgroupsAccumulator:v16 userIdentity:*(void *)(a1 + 48)];
          if (v17)
          {
            [v24 addObject:v17];
          }
          else
          {
            id v18 = v3;
            v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v30 = v11;
              _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, "Recommendation item modeling failure: %{public}@", buf, 0xCu);
            }

            id v3 = v18;
          }
        }
        else
        {
          id v11 = os_log_create("com.apple.amp.mediaplayer", "Default");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "Recommendation item should be a dictionary: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v7);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  if ((*(_WORD *)(v20 + 8) & 0x10) != 0)
  {
    [v3 setSubgroups:v4];
    uint64_t v20 = *(void *)(a1 + 32);
  }
  objc_msgSend(v3, "setSectionIndex:", objc_msgSend(*(id *)(v20 + 72), "numberOfSections"));
  [v3 setSectionedItems:*(void *)(*(void *)(a1 + 32) + 72)];
  v21 = v3;
  id v22 = *(void **)(*(void *)(a1 + 32) + 72);
  id v23 = [MEMORY[0x1E4F1CA98] null];
  [v22 appendSection:v23];

  [*(id *)(*(void *)(a1 + 32) + 72) appendItems:v24];
}

- (id)modelObjectForRecentlyPlayedArray:(id)a3 userIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(_WORD *)&self->_requestedGroupProperties & 1) == 0) {
    [(MPModelForYouRecommendationMusicKitGroupBuilder *)self initializeRequestedGroupProperties];
  }
  uint64_t v8 = [MPModelForYouRecommendationGroup alloc];
  id v9 = +[MPIdentifierSet emptyIdentifierSet];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecentlyPlayedArray_userIdentity___block_invoke;
  v14[3] = &unk_1E57F69A0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = [(MPModelObject *)v8 initWithIdentifiers:v9 block:v14];

  return v12;
}

void __98__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecentlyPlayedArray_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  __int16 v4 = v3;
  if ((*(_WORD *)(*(void *)(a1 + 32) + 8) & 2) != 0) {
    [v3 setGroupType:4];
  }
  [v4 setTitle:@"RECENTLY_PLAYED_VIEW_TITLE"];
  id v5 = MusicURLWithPathUsingURLBag(@"/v1/me/recent/played", *(void **)(*(void *)(a1 + 32) + 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  [v4 setLoadAdditionalContentURL:v5];

  id v6 = objc_opt_new();
  if ((*(_WORD *)(*(void *)(a1 + 32) + 8) & 0x10) != 0) {
    id v7 = objc_opt_new();
  }
  else {
    id v7 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          uint64_t v14 = *(void *)(a1 + 32);
          id v15 = *(void **)(v14 + 16);
          __int16 v16 = *(_WORD *)(v14 + 8);
          if ((v16 & 0x10) != 0) {
            v17 = v4;
          }
          else {
            v17 = 0;
          }
          if ((v16 & 0x10) != 0) {
            id v18 = v7;
          }
          else {
            id v18 = 0;
          }
          v19 = objc_msgSend(v15, "modelObjectForRecommendationChildDictionary:parentGroup:subgroupsAccumulator:userIdentity:", v13, v17, v18, *(void *)(a1 + 48), (void)v24);
          if (v19) {
            [v6 addObject:v19];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  __int16 v21 = *(_WORD *)(v20 + 8);
  if ((v21 & 0x10) != 0)
  {
    [v4 setSubgroups:v7];
    uint64_t v20 = *(void *)(a1 + 32);
    __int16 v21 = *(_WORD *)(v20 + 8);
  }
  if ((v21 & 0x200) != 0)
  {
    [v4 setDisplaysAsGridCellInCarPlay:1];
    uint64_t v20 = *(void *)(a1 + 32);
  }
  objc_msgSend(v4, "setSectionIndex:", objc_msgSend(*(id *)(v20 + 72), "numberOfSections", (void)v24));
  [v4 setSectionedItems:*(void *)(*(void *)(a1 + 32) + 72)];
  id v22 = *(void **)(*(void *)(a1 + 32) + 72);
  id v23 = [MEMORY[0x1E4F1CA98] null];
  [v22 appendSection:v23];

  [*(id *)(*(void *)(a1 + 32) + 72) appendItems:v6];
}

- (void)initializeRequestedGroupProperties
{
  id v21 = [(MPPropertySet *)self->_requestedGroupPropertySet properties];
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyGroupType"]) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFFD | v3;
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyLastUpdatedDate"])__int16 v4 = 4; {
  else
  }
    __int16 v4 = 0;
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFFB | v4;
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyTitle"]) {
    __int16 v5 = 8;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFF7 | v5;
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL"])__int16 v6 = 32; {
  else
  }
    __int16 v6 = 0;
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFDF | v6;
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyHrefURL"]) {
    __int16 v7 = 64;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFBF | v7;
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyRefreshURL"]) {
    __int16 v8 = 128;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFF7F | v8;
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyTraits"]) {
    __int16 v9 = 256;
  }
  else {
    __int16 v9 = 0;
  }
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFEFF | v9;
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay"])__int16 v10 = 512; {
  else
  }
    __int16 v10 = 0;
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFDFF | v10;
  if ([v21 containsObject:@"MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay"])__int16 v11 = 1024; {
  else
  }
    __int16 v11 = 0;
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFBFF | v11;
  uint64_t v12 = [(MPPropertySet *)self->_requestedItemPropertySet relationships];
  uint64_t v13 = [v12 objectForKey:@"MPModelForYouRecommendationItemRelationshipSubgroup"];
  *(_WORD *)&self->___int16 requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFEF | (16 * (v13 != 0));

  uint64_t v14 = [[MPModelForYouRecommendationMusicKitItemBuilder alloc] initWithRequestedPropertySet:self->_requestedItemPropertySet storeItemMetadataResults:self->_storeItemMetadataResults flatSectionedItems:self->_flatSectionedItems storeURLBag:self->_storeURLBag isListenNow:self->_isListenNow];
  itemBuilder = self->_itemBuilder;
  self->_itemBuilder = v14;

  __int16 requestedGroupProperties = (__int16)self->_requestedGroupProperties;
  if ((requestedGroupProperties & 4) != 0)
  {
    v17 = (NSDateFormatter *)objc_opt_new();
    lastUpdatedDateFormatter = self->_lastUpdatedDateFormatter;
    self->_lastUpdatedDateFormatter = v17;

    v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)self->_lastUpdatedDateFormatter setLocale:v19];

    uint64_t v20 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [(NSDateFormatter *)self->_lastUpdatedDateFormatter setTimeZone:v20];

    [(NSDateFormatter *)self->_lastUpdatedDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    [(NSDateFormatter *)self->_lastUpdatedDateFormatter setLenient:1];
    __int16 requestedGroupProperties = (__int16)self->_requestedGroupProperties;
  }
  *(_WORD *)&self->___int16 requestedGroupProperties = requestedGroupProperties | 1;
}

- (MPModelForYouRecommendationMusicKitGroupBuilder)initWithRequestedGroupPropertySet:(id)a3 requestedItemPropertySet:(id)a4 storeItemMetadataResults:(id)a5 flatSectionedItems:(id)a6 storeURLBag:(id)a7 isListenNow:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MPModelForYouRecommendationMusicKitGroupBuilder;
  v19 = [(MPModelForYouRecommendationMusicKitGroupBuilder *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    requestedGroupPropertySet = v19->_requestedGroupPropertySet;
    v19->_requestedGroupPropertySet = (MPPropertySet *)v20;

    uint64_t v22 = [v15 copy];
    requestedItemPropertySet = v19->_requestedItemPropertySet;
    v19->_requestedItemPropertySet = (MPPropertySet *)v22;

    uint64_t v24 = [v16 copy];
    storeItemMetadataResults = v19->_storeItemMetadataResults;
    v19->_storeItemMetadataResults = (NSDictionary *)v24;

    objc_storeStrong((id *)&v19->_flatSectionedItems, a6);
    objc_storeStrong((id *)&v19->_storeURLBag, a7);
    v19->_isListenNow = a8;
  }

  return v19;
}

+ (id)allSupportedItemProperties
{
  return +[MPModelForYouRecommendationMusicKitItemBuilder allSupportedProperties];
}

+ (id)allSupportedGroupProperties
{
  v5[9] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelForYouRecommendationGroupPropertyGroupType";
  v5[1] = @"MPModelForYouRecommendationGroupPropertyLastUpdatedDate";
  v5[2] = @"MPModelForYouRecommendationGroupPropertyTitle";
  v5[3] = @"MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL";
  v5[4] = @"MPModelForYouRecommendationGroupPropertyHrefURL";
  v5[5] = @"MPModelForYouRecommendationGroupPropertyRefreshURL";
  v5[6] = @"MPModelForYouRecommendationGroupPropertyTraits";
  v5[7] = @"MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay";
  v5[8] = @"MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:9];
  __int16 v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

@end