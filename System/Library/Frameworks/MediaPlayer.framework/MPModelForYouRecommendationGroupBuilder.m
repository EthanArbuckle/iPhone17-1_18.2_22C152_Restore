@interface MPModelForYouRecommendationGroupBuilder
+ (id)allSupportedGroupProperties;
+ (id)allSupportedItemProperties;
- (MPModelForYouRecommendationGroupBuilder)initWithRequestedGroupPropertySet:(id)a3 requestedItemPropertySet:(id)a4 storeItemMetadataResults:(id)a5 flatSectionedItems:(id)a6;
- (MPMutableSectionedCollection)flatSectionedItems;
- (MPPropertySet)requestedGroupPropertySet;
- (MPPropertySet)requestedItemPropertySet;
- (NSDictionary)storeItemMetadataResults;
- (id)modelObjectForRecommendationDictionary:(id)a3 userIdentity:(id)a4;
@end

@implementation MPModelForYouRecommendationGroupBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flatSectionedItems, 0);
  objc_storeStrong((id *)&self->_storeItemMetadataResults, 0);
  objc_storeStrong((id *)&self->_requestedItemPropertySet, 0);
  objc_storeStrong((id *)&self->_requestedGroupPropertySet, 0);
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
  id v6 = a3;
  id v7 = a4;
  if ((*(unsigned char *)&self->_requestedGroupProperties & 1) == 0)
  {
    v8 = [(MPPropertySet *)self->_requestedGroupPropertySet properties];
    if ([v8 containsObject:@"MPModelForYouRecommendationGroupPropertyGroupType"]) {
      char v9 = 2;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_char requestedGroupProperties = *(unsigned char *)&self->_requestedGroupProperties & 0xFD | v9;
    if ([v8 containsObject:@"MPModelForYouRecommendationGroupPropertyLastUpdatedDate"])char v10 = 4; {
    else
    }
      char v10 = 0;
    *(unsigned char *)&self->_char requestedGroupProperties = *(unsigned char *)&self->_requestedGroupProperties & 0xFB | v10;
    if ([v8 containsObject:@"MPModelForYouRecommendationGroupPropertyTitle"]) {
      char v11 = 8;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&self->_char requestedGroupProperties = *(unsigned char *)&self->_requestedGroupProperties & 0xF7 | v11;
    if ([v8 containsObject:@"MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL"])char v12 = 32; {
    else
    }
      char v12 = 0;
    *(unsigned char *)&self->_char requestedGroupProperties = *(unsigned char *)&self->_requestedGroupProperties & 0xDF | v12;
    if ([v8 containsObject:@"MPModelForYouRecommendationGroupPropertyRefreshURL"]) {
      char v13 = 64;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&self->_char requestedGroupProperties = *(unsigned char *)&self->_requestedGroupProperties & 0xBF | v13;
    v14 = [(MPPropertySet *)self->_requestedItemPropertySet relationships];
    v15 = [v14 objectForKey:@"MPModelForYouRecommendationItemRelationshipSubgroup"];
    *(unsigned char *)&self->_char requestedGroupProperties = *(unsigned char *)&self->_requestedGroupProperties & 0xEF | (16 * (v15 != 0));

    v16 = [[MPModelForYouRecommendationItemBuilder alloc] initWithRequestedPropertySet:self->_requestedItemPropertySet storeItemMetadataResults:self->_storeItemMetadataResults flatSectionedItems:self->_flatSectionedItems];
    itemBuilder = self->_itemBuilder;
    self->_itemBuilder = v16;

    char requestedGroupProperties = (char)self->_requestedGroupProperties;
    if ((requestedGroupProperties & 4) != 0)
    {
      v19 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
      lastUpdatedDateFormatter = self->_lastUpdatedDateFormatter;
      self->_lastUpdatedDateFormatter = v19;

      v21 = self->_lastUpdatedDateFormatter;
      v22 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
      [(NSDateFormatter *)v21 setLocale:v22];

      v23 = self->_lastUpdatedDateFormatter;
      v24 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
      [(NSDateFormatter *)v23 setTimeZone:v24];

      [(NSDateFormatter *)self->_lastUpdatedDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
      [(NSDateFormatter *)self->_lastUpdatedDateFormatter setLenient:1];
      char requestedGroupProperties = (char)self->_requestedGroupProperties;
    }
    *(unsigned char *)&self->_char requestedGroupProperties = requestedGroupProperties | 1;
  }
  v25 = [v6 objectForKey:@"recoId"];
  if (_NSIsNSString())
  {
    id v26 = v25;
    if ([v26 length])
    {
      v27 = [v7 accountDSID];
      v28 = [MPIdentifierSet alloc];
      v29 = +[MPModelForYouRecommendationGroupKind identityKind];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke;
      v39[3] = &unk_1E57F95D0;
      id v40 = v27;
      id v41 = v26;
      id v30 = v27;
      v31 = [(MPIdentifierSet *)v28 initWithSource:@"ForYou" modelKind:v29 block:v39];

      v32 = [MPModelForYouRecommendationGroup alloc];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_3;
      v35[3] = &unk_1E57F69A0;
      id v36 = v6;
      v37 = self;
      id v38 = v7;
      v33 = [(MPModelObject *)v32 initWithIdentifiers:v31 block:v35];
    }
    else
    {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_2;
  v4[3] = &unk_1E57F96C8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 setPersonalStoreIdentifiersWithPersonID:v3 block:v4];
}

void __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKey:@"moduleType"];
  if (_NSIsNSString())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"PERSONALIZED_MIX"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"FRIENDS_LISTENING"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"RECOMMEND_FRIENDS"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"RECENTLY_PLAYED"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"TODAYS_PLAYLISTS"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"HEAVY_ROTATION"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"ALBUM_GROUPS"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"ARTIST_PLAYLISTS"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"NEW_RELEASES"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"ALBUM_RECO"])
    {
      uint64_t v6 = 10;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  char v7 = *(unsigned char *)(*(void *)(a1 + 40) + 8);
  if ((v7 & 2) != 0)
  {
    [v3 setGroupType:v6];
    char v7 = *(unsigned char *)(*(void *)(a1 + 40) + 8);
    if ((v7 & 8) == 0)
    {
LABEL_27:
      if ((v7 & 4) == 0) {
        goto LABEL_28;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 40) + 8) & 8) == 0)
  {
    goto LABEL_27;
  }
  v8 = [*(id *)(a1 + 32) objectForKey:@"title"];
  if (_NSIsNSDictionary())
  {
    id v9 = [v8 objectForKey:@"stringForDisplay"];
    if (_NSIsNSString())
    {
      if (v9) {
        goto LABEL_44;
      }
    }
    else
    {
    }
  }
  char v10 = [*(id *)(a1 + 32) objectForKey:@"reason"];
  if (_NSIsNSDictionary())
  {
    char v11 = [v10 objectForKey:@"stringForDisplay"];
    if (_NSIsNSString()) {
      id v9 = v11;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

LABEL_44:
  uint64_t v12 = [v9 length];
  if (v6 == 1 && !v12)
  {
    char v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    uint64_t v14 = [v13 localizedStringForKey:@"FOR_YOU_PERSONAL_MIXES_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];

    id v9 = (id)v14;
  }
  [v3 setTitle:v9];

  char v7 = *(unsigned char *)(*(void *)(a1 + 40) + 8);
  if ((v7 & 4) == 0)
  {
LABEL_28:
    if ((v7 & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_52;
  }
LABEL_48:
  v15 = [*(id *)(a1 + 32) objectForKey:@"timestamp"];
  if (_NSIsNSString())
  {
    v16 = [*(id *)(*(void *)(a1 + 40) + 24) dateFromString:v15];
  }
  else
  {
    v16 = 0;
  }
  [v3 setLastUpdatedDate:v16];

  char v7 = *(unsigned char *)(*(void *)(a1 + 40) + 8);
  if ((v7 & 0x20) == 0)
  {
LABEL_29:
    if ((v7 & 0x40) == 0) {
      goto LABEL_60;
    }
    goto LABEL_56;
  }
LABEL_52:
  v17 = [*(id *)(a1 + 32) objectForKey:@"seeAllUrl"];
  if (_NSIsNSString())
  {
    v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
  }
  else
  {
    v18 = 0;
  }
  [v3 setLoadAdditionalContentURL:v18];

  if ((*(unsigned char *)(*(void *)(a1 + 40) + 8) & 0x40) != 0)
  {
LABEL_56:
    v19 = [*(id *)(a1 + 32) objectForKey:@"refreshUrl"];
    if (_NSIsNSString())
    {
      v20 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
    }
    else
    {
      v20 = 0;
    }
    [v3 setRefreshURL:v20];
  }
LABEL_60:
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 8) & 0x10) != 0) {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v22 = 0;
  }
  v23 = [*(id *)(a1 + 32) objectForKey:@"children"];
  if (_NSIsNSArray())
  {
    v44 = v4;
    id v24 = v23;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v50 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            uint64_t v30 = *(void *)(a1 + 40);
            v31 = *(void **)(v30 + 16);
            char v32 = *(unsigned char *)(v30 + 8);
            if ((v32 & 0x10) != 0) {
              id v33 = v3;
            }
            else {
              id v33 = 0;
            }
            if ((v32 & 0x10) != 0) {
              id v34 = v22;
            }
            else {
              id v34 = 0;
            }
            v35 = [v31 modelObjectForRecommendationChildDictionary:v29 parentGroup:v33 subgroupsAccumulator:v34 userIdentity:*(void *)(a1 + 48)];
            if (v35) {
              [v21 addObject:v35];
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v26);
    }

    v4 = v44;
  }
  uint64_t v36 = *(void *)(a1 + 40);
  if ((*(unsigned char *)(v36 + 8) & 0x10) != 0)
  {
    [v3 setSubgroups:v22];
    uint64_t v36 = *(void *)(a1 + 40);
  }
  objc_msgSend(v3, "setSectionIndex:", objc_msgSend(*(id *)(v36 + 56), "numberOfSections"));
  [v3 setSectionedItems:*(void *)(*(void *)(a1 + 40) + 56)];
  v37 = *(void **)(*(void *)(a1 + 40) + 56);
  id v38 = [MEMORY[0x1E4F1CA98] null];
  [v37 appendSection:v38];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v39 = v21;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v46 != v42) {
          objc_enumerationMutation(v39);
        }
        [*(id *)(*(void *)(a1 + 40) + 56) appendItem:*(void *)(*((void *)&v45 + 1) + 8 * j)];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v41);
  }
}

uint64_t __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setRecommendationID:*(void *)(a1 + 32)];
}

- (MPModelForYouRecommendationGroupBuilder)initWithRequestedGroupPropertySet:(id)a3 requestedItemPropertySet:(id)a4 storeItemMetadataResults:(id)a5 flatSectionedItems:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MPModelForYouRecommendationGroupBuilder;
  uint64_t v14 = [(MPModelForYouRecommendationGroupBuilder *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    requestedGroupPropertySet = v14->_requestedGroupPropertySet;
    v14->_requestedGroupPropertySet = (MPPropertySet *)v15;

    uint64_t v17 = [v11 copy];
    requestedItemPropertySet = v14->_requestedItemPropertySet;
    v14->_requestedItemPropertySet = (MPPropertySet *)v17;

    uint64_t v19 = [v12 copy];
    storeItemMetadataResults = v14->_storeItemMetadataResults;
    v14->_storeItemMetadataResults = (NSDictionary *)v19;

    objc_storeStrong((id *)&v14->_flatSectionedItems, a6);
  }

  return v14;
}

+ (id)allSupportedItemProperties
{
  return +[MPModelForYouRecommendationItemBuilder allSupportedProperties];
}

+ (id)allSupportedGroupProperties
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelForYouRecommendationGroupPropertyGroupType";
  v5[1] = @"MPModelForYouRecommendationGroupPropertyLastUpdatedDate";
  v5[2] = @"MPModelForYouRecommendationGroupPropertyTitle";
  v5[3] = @"MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL";
  v5[4] = @"MPModelForYouRecommendationGroupPropertyHrefURL";
  v5[5] = @"MPModelForYouRecommendationGroupPropertyRefreshURL";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  id v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

@end