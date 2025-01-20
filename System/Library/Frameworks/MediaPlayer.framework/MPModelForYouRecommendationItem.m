@interface MPModelForYouRecommendationItem
+ (id)__album_KEY;
+ (id)__backedByStoreItemMetadata_KEY;
+ (id)__itemType_KEY;
+ (id)__parentGroup_KEY;
+ (id)__playlist_KEY;
+ (id)__radioStation_KEY;
+ (id)__reason_KEY;
+ (id)__subgroupIndex_KEY;
+ (id)__url_KEY;
+ (id)__utterance_KEY;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (void)__MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemPropertyItemType__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemPropertyParentGroup__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemPropertyReason__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemPropertySubgroupIndex__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemPropertyURL__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemPropertyUtterance__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemRelationshipAlbum__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemRelationshipPlaylist__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationItemRelationshipRadioStation__MAPPING_MISSING__;
- (MPModelForYouRecommendationGroup)subgroup;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)relativeModelObjectForStoreLibraryPersonalization;
@end

@implementation MPModelForYouRecommendationItem

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v2 = +[MPPropertySet emptyPropertySet];
  v18[0] = @"MPModelForYouRecommendationItemPropertyItemType";
  v18[1] = @"MPModelForYouRecommendationItemPropertyURL";
  v18[2] = @"MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  uint64_t v4 = +[MPModelAlbum requiredStoreLibraryPersonalizationProperties];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = (uint64_t)v2;
  }
  v17[0] = v6;
  v16[1] = @"MPModelForYouRecommendationItemRelationshipPlaylist";
  uint64_t v7 = +[MPModelPlaylist requiredStoreLibraryPersonalizationProperties];
  v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = (uint64_t)v2;
  }
  v17[1] = v9;
  v16[2] = @"MPModelForYouRecommendationItemRelationshipRadioStation";
  uint64_t v10 = +[NSObject requiredStoreLibraryPersonalizationProperties];
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = (uint64_t)v2;
  }
  v17[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  v14 = [[MPPropertySet alloc] initWithProperties:v3 relationships:v13];

  return v14;
}

+ (void)__MPModelForYouRecommendationItemPropertySubgroupIndex__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:34 description:@"Translator was missing mapping for MPModelForYouRecommendationItemPropertySubgroupIndex"];
}

+ (id)__subgroupIndex_KEY
{
  return @"MPModelForYouRecommendationItemPropertySubgroupIndex";
}

+ (void)__MPModelForYouRecommendationItemPropertyParentGroup__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:33 description:@"Translator was missing mapping for MPModelForYouRecommendationItemPropertyParentGroup"];
}

+ (id)__parentGroup_KEY
{
  return @"MPModelForYouRecommendationItemPropertyParentGroup";
}

+ (void)__MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:32 description:@"Translator was missing mapping for MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata"];
}

+ (id)__backedByStoreItemMetadata_KEY
{
  return @"MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata";
}

+ (void)__MPModelForYouRecommendationItemRelationshipRadioStation__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:31 description:@"Translator was missing mapping for MPModelForYouRecommendationItemRelationshipRadioStation"];
}

+ (id)__radioStation_KEY
{
  return @"MPModelForYouRecommendationItemRelationshipRadioStation";
}

+ (void)__MPModelForYouRecommendationItemRelationshipPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:30 description:@"Translator was missing mapping for MPModelForYouRecommendationItemRelationshipPlaylist"];
}

+ (id)__playlist_KEY
{
  return @"MPModelForYouRecommendationItemRelationshipPlaylist";
}

+ (void)__MPModelForYouRecommendationItemRelationshipAlbum__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:29 description:@"Translator was missing mapping for MPModelForYouRecommendationItemRelationshipAlbum"];
}

+ (id)__album_KEY
{
  return @"MPModelForYouRecommendationItemRelationshipAlbum";
}

+ (void)__MPModelForYouRecommendationItemPropertyUtterance__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:28 description:@"Translator was missing mapping for MPModelForYouRecommendationItemPropertyUtterance"];
}

+ (id)__utterance_KEY
{
  return @"MPModelForYouRecommendationItemPropertyUtterance";
}

+ (void)__MPModelForYouRecommendationItemPropertyReason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:27 description:@"Translator was missing mapping for MPModelForYouRecommendationItemPropertyReason"];
}

+ (id)__reason_KEY
{
  return @"MPModelForYouRecommendationItemPropertyReason";
}

+ (void)__MPModelForYouRecommendationItemPropertyURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:26 description:@"Translator was missing mapping for MPModelForYouRecommendationItemPropertyURL"];
}

+ (id)__url_KEY
{
  return @"MPModelForYouRecommendationItemPropertyURL";
}

+ (void)__MPModelForYouRecommendationItemPropertyItemType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationItem.m" lineNumber:25 description:@"Translator was missing mapping for MPModelForYouRecommendationItemPropertyItemType"];
}

+ (id)__itemType_KEY
{
  return @"MPModelForYouRecommendationItemPropertyItemType";
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4 = a3;
  v5 = [(MPModelObject *)self identifiers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__MPModelForYouRecommendationItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_1E57F3F90;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(MPModelObject *)self copyWithIdentifiers:v5 block:v9];

  return v7;
}

void __92__MPModelForYouRecommendationItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) itemType];
  if (v3 == 3)
  {
    [v6 setRadioStation:*(void *)(a1 + 40)];
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    [v6 setPlaylist:*(void *)(a1 + 40)];
    goto LABEL_8;
  }
  BOOL v4 = v3 == 1;
  v5 = v6;
  if (v4)
  {
    [v6 setAlbum:*(void *)(a1 + 40)];
LABEL_8:
    v5 = v6;
  }
}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  uint64_t v3 = [(MPModelForYouRecommendationItem *)self itemType];
  switch(v3)
  {
    case 3:
      uint64_t v4 = [(MPModelForYouRecommendationItem *)self radioStation];
      goto LABEL_7;
    case 2:
      uint64_t v4 = [(MPModelForYouRecommendationItem *)self playlist];
      goto LABEL_7;
    case 1:
      uint64_t v4 = [(MPModelForYouRecommendationItem *)self album];
LABEL_7:
      v5 = (void *)v4;
      goto LABEL_9;
  }
  v5 = 0;
LABEL_9:
  id v6 = [v5 relativeModelObjectForStoreLibraryPersonalization];

  return v6;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  uint64_t v4 = [a3 relationships];
  unint64_t v5 = [(MPModelForYouRecommendationItem *)self itemType] - 1;
  if (v5 > 2
    || ([v4 objectForKey:off_1E57F3FB0[v5]], (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = +[MPPropertySet emptyPropertySet];
  }

  return v6;
}

- (MPModelForYouRecommendationGroup)subgroup
{
  uint64_t v3 = [(MPModelForYouRecommendationItem *)self parentGroup];
  uint64_t v4 = [v3 subgroups];
  unint64_t v5 = objc_msgSend(v4, "objectAtIndex:", -[MPModelForYouRecommendationItem subgroupIndex](self, "subgroupIndex"));

  return (MPModelForYouRecommendationGroup *)v5;
}

@end