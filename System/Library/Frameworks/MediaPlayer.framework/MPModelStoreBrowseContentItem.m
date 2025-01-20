@interface MPModelStoreBrowseContentItem
+ (id)__album_KEY;
+ (id)__artistUploadedContentType_KEY;
+ (id)__artist_KEY;
+ (id)__creditsArtist_KEY;
+ (id)__curator_KEY;
+ (id)__detailedItemType_KEY;
+ (id)__episode_KEY;
+ (id)__itemType_KEY;
+ (id)__mediaClip_KEY;
+ (id)__movie_KEY;
+ (id)__playlist_KEY;
+ (id)__radioStation_KEY;
+ (id)__recordLabel_KEY;
+ (id)__season_KEY;
+ (id)__showCreator_KEY;
+ (id)__show_KEY;
+ (id)__socialPerson_KEY;
+ (id)__song_KEY;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (void)__MPModelStoreBrowseContentItemPropertyArtistUploadedContentType__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemPropertyDetailedItemType__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemPropertyItemType__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipAlbum__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipArtist__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipCreditsArtist__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipCurator__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipMediaClip__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipMovie__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipPlaylist__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipRadioStation__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipRecordLabel__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipSocialPerson__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipSong__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipTVEpisode__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipTVSeason__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipTVShowCreator__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseContentItemRelationshipTVShow__MAPPING_MISSING__;
- (id)innerObject;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)relativeModelObjectForStoreLibraryPersonalization;
@end

@implementation MPModelStoreBrowseContentItem

+ (id)__song_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipSong";
}

+ (id)__socialPerson_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipSocialPerson";
}

+ (id)__show_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipTVShow";
}

+ (id)__showCreator_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipTVShowCreator";
}

+ (id)__season_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipTVSeason";
}

+ (id)__recordLabel_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipRecordLabel";
}

+ (id)__radioStation_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipRadioStation";
}

+ (id)__playlist_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipPlaylist";
}

+ (id)__movie_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipMovie";
}

+ (id)__mediaClip_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipMediaClip";
}

+ (id)__itemType_KEY
{
  return @"MPModelStoreBrowseContentItemPropertyItemType";
}

+ (id)__episode_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipTVEpisode";
}

+ (id)__detailedItemType_KEY
{
  return @"MPModelStoreBrowseContentItemPropertyDetailedItemType";
}

+ (id)__curator_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipCurator";
}

+ (id)__creditsArtist_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipCreditsArtist";
}

+ (id)__artist_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipArtist";
}

+ (id)__artistUploadedContentType_KEY
{
  return @"MPModelStoreBrowseContentItemPropertyArtistUploadedContentType";
}

+ (id)__album_KEY
{
  return @"MPModelStoreBrowseContentItemRelationshipAlbum";
}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  v2 = [(MPModelStoreBrowseContentItem *)self innerObject];
  v3 = [v2 relativeModelObjectForStoreLibraryPersonalization];

  return v3;
}

- (id)innerObject
{
  switch([(MPModelStoreBrowseContentItem *)self itemType])
  {
    case 1:
      v3 = [(MPModelStoreBrowseContentItem *)self album];
      break;
    case 2:
      v3 = [(MPModelStoreBrowseContentItem *)self artist];
      break;
    case 3:
      v3 = [(MPModelStoreBrowseContentItem *)self curator];
      break;
    case 4:
      v3 = [(MPModelStoreBrowseContentItem *)self playlist];
      break;
    case 5:
      v3 = [(MPModelStoreBrowseContentItem *)self radioStation];
      break;
    case 6:
      v3 = [(MPModelStoreBrowseContentItem *)self socialPerson];
      break;
    case 7:
      v3 = [(MPModelStoreBrowseContentItem *)self song];
      break;
    case 8:
      v3 = [(MPModelStoreBrowseContentItem *)self episode];
      break;
    case 9:
      v3 = [(MPModelStoreBrowseContentItem *)self show];
      break;
    case 10:
      v3 = [(MPModelStoreBrowseContentItem *)self season];
      break;
    case 11:
      v3 = [(MPModelStoreBrowseContentItem *)self showCreator];
      break;
    case 12:
      v3 = [(MPModelStoreBrowseContentItem *)self movie];
      break;
    case 13:
      v3 = [(MPModelStoreBrowseContentItem *)self mediaClip];
      break;
    case 14:
      v3 = [(MPModelStoreBrowseContentItem *)self recordLabel];
      break;
    case 15:
      v3 = [(MPModelStoreBrowseContentItem *)self creditsArtist];
      break;
    default:
      v3 = 0;
      break;
  }

  return v3;
}

void __90__MPModelStoreBrowseContentItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch([*(id *)(a1 + 32) itemType])
  {
    case 1:
      [v3 setAlbum:*(void *)(a1 + 40)];
      break;
    case 2:
      [v3 setArtist:*(void *)(a1 + 40)];
      break;
    case 3:
      [v3 setCurator:*(void *)(a1 + 40)];
      break;
    case 4:
      [v3 setPlaylist:*(void *)(a1 + 40)];
      break;
    case 5:
      [v3 setRadioStation:*(void *)(a1 + 40)];
      break;
    case 6:
      [v3 setSocialPerson:*(void *)(a1 + 40)];
      break;
    case 7:
      [v3 setSong:*(void *)(a1 + 40)];
      break;
    case 8:
      [v3 setEpisode:*(void *)(a1 + 40)];
      break;
    case 9:
      [v3 setShow:*(void *)(a1 + 40)];
      break;
    case 10:
      [v3 setSeason:*(void *)(a1 + 40)];
      break;
    case 11:
      [v3 setShowCreator:*(void *)(a1 + 40)];
      break;
    case 12:
      [v3 setMovie:*(void *)(a1 + 40)];
      break;
    case 14:
      [v3 setRecordLabel:*(void *)(a1 + 40)];
      break;
    case 15:
      [v3 setCreditsArtist:*(void *)(a1 + 40)];
      break;
    default:
      break;
  }
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  v4 = [a3 relationships];
  unint64_t v5 = [(MPModelStoreBrowseContentItem *)self itemType] - 1;
  if (v5 > 0xE
    || ((0x6FFFu >> v5) & 1) == 0
    || ([v4 objectForKey:off_1E57F3458[v5]], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = +[MPPropertySet emptyPropertySet];
  }

  return v6;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MPModelObject *)self identifiers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__MPModelStoreBrowseContentItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_1E57F3438;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(MPModelObject *)self copyWithIdentifiers:v5 block:v9];

  return v7;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = +[MPPropertySet emptyPropertySet];
  uint64_t v4 = +[MPModelAlbum requiredStoreLibraryPersonalizationProperties];
  unint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = v3;
  }
  id v63 = v6;

  [v2 setObject:v63 forKey:@"MPModelStoreBrowseContentItemRelationshipAlbum"];
  uint64_t v7 = +[MPModelArtist requiredStoreLibraryPersonalizationProperties];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v3;
  }
  id v62 = v9;

  [v2 setObject:v62 forKey:@"MPModelStoreBrowseContentItemRelationshipArtist"];
  uint64_t v10 = +[NSObject requiredStoreLibraryPersonalizationProperties];
  v11 = (void *)v10;
  if (v10) {
    v12 = (void *)v10;
  }
  else {
    v12 = v3;
  }
  id v61 = v12;

  [v2 setObject:v61 forKey:@"MPModelStoreBrowseContentItemRelationshipCurator"];
  uint64_t v13 = +[MPModelMovie requiredStoreLibraryPersonalizationProperties];
  v14 = (void *)v13;
  if (v13) {
    v15 = (void *)v13;
  }
  else {
    v15 = v3;
  }
  id v60 = v15;

  [v2 setObject:v60 forKey:@"MPModelStoreBrowseContentItemRelationshipMovie"];
  uint64_t v16 = +[MPModelPlaylist requiredStoreLibraryPersonalizationProperties];
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v3;
  }
  id v59 = v18;

  [v2 setObject:v59 forKey:@"MPModelStoreBrowseContentItemRelationshipPlaylist"];
  uint64_t v19 = +[NSObject requiredStoreLibraryPersonalizationProperties];
  v20 = (void *)v19;
  if (v19) {
    v21 = (void *)v19;
  }
  else {
    v21 = v3;
  }
  id v58 = v21;

  [v2 setObject:v58 forKey:@"MPModelStoreBrowseContentItemRelationshipRadioStation"];
  uint64_t v22 = +[MPModelSong requiredStoreLibraryPersonalizationProperties];
  v23 = (void *)v22;
  if (v22) {
    v24 = (void *)v22;
  }
  else {
    v24 = v3;
  }
  id v57 = v24;

  [v2 setObject:v57 forKey:@"MPModelStoreBrowseContentItemRelationshipSong"];
  uint64_t v25 = +[NSObject requiredStoreLibraryPersonalizationProperties];
  v26 = (void *)v25;
  if (v25) {
    v27 = (void *)v25;
  }
  else {
    v27 = v3;
  }
  id v28 = v27;

  [v2 setObject:v28 forKey:@"MPModelStoreBrowseContentItemRelationshipSocialPerson"];
  uint64_t v29 = +[MPModelTVEpisode requiredStoreLibraryPersonalizationProperties];
  v30 = (void *)v29;
  if (v29) {
    v31 = (void *)v29;
  }
  else {
    v31 = v3;
  }
  id v32 = v31;

  [v2 setObject:v32 forKey:@"MPModelStoreBrowseContentItemRelationshipTVEpisode"];
  uint64_t v33 = +[MPModelTVSeason requiredStoreLibraryPersonalizationProperties];
  v34 = (void *)v33;
  if (v33) {
    v35 = (void *)v33;
  }
  else {
    v35 = v3;
  }
  id v36 = v35;

  [v2 setObject:v36 forKey:@"MPModelStoreBrowseContentItemRelationshipTVSeason"];
  uint64_t v37 = +[NSObject requiredStoreLibraryPersonalizationProperties];
  v38 = (void *)v37;
  if (v37) {
    v39 = (void *)v37;
  }
  else {
    v39 = v3;
  }
  id v40 = v39;

  [v2 setObject:v40 forKey:@"MPModelStoreBrowseContentItemRelationshipTVShow"];
  uint64_t v41 = +[NSObject requiredStoreLibraryPersonalizationProperties];
  v42 = (void *)v41;
  if (v41) {
    v43 = (void *)v41;
  }
  else {
    v43 = v3;
  }
  id v44 = v43;

  [v2 setObject:v44 forKey:@"MPModelStoreBrowseContentItemRelationshipTVShowCreator"];
  uint64_t v45 = +[NSObject requiredStoreLibraryPersonalizationProperties];
  v46 = (void *)v45;
  if (v45) {
    v47 = (void *)v45;
  }
  else {
    v47 = v3;
  }
  id v48 = v47;

  [v2 setObject:v48 forKey:@"MPModelStoreBrowseContentItemRelationshipRecordLabel"];
  uint64_t v49 = +[NSObject requiredStoreLibraryPersonalizationProperties];
  v50 = (void *)v49;
  if (v49) {
    v51 = (void *)v49;
  }
  else {
    v51 = v3;
  }
  id v52 = v51;

  [v2 setObject:v52 forKey:@"MPModelStoreBrowseContentItemRelationshipCreditsArtist"];
  v53 = [MPPropertySet alloc];
  v64[0] = @"MPModelStoreBrowseContentItemPropertyItemType";
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
  v55 = [(MPPropertySet *)v53 initWithProperties:v54 relationships:v2];

  return v55;
}

+ (void)__MPModelStoreBrowseContentItemRelationshipCreditsArtist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:52 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipCreditsArtist"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipRecordLabel__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:51 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipRecordLabel"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipTVShowCreator__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:50 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipTVShowCreator"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipTVShow__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:49 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipTVShow"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipTVSeason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:48 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipTVSeason"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipTVEpisode__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:47 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipTVEpisode"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipSong__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:46 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipSong"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipSocialPerson__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:45 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipSocialPerson"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipRadioStation__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:44 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipRadioStation"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:43 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipPlaylist"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipMovie__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:42 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipMovie"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipMediaClip__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:41 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipMediaClip"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipCurator__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:40 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipCurator"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipArtist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:39 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipArtist"];
}

+ (void)__MPModelStoreBrowseContentItemRelationshipAlbum__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:38 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemRelationshipAlbum"];
}

+ (void)__MPModelStoreBrowseContentItemPropertyArtistUploadedContentType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:37 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemPropertyArtistUploadedContentType"];
}

+ (void)__MPModelStoreBrowseContentItemPropertyDetailedItemType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:36 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemPropertyDetailedItemType"];
}

+ (void)__MPModelStoreBrowseContentItemPropertyItemType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseContentItem.m" lineNumber:35 description:@"Translator was missing mapping for MPModelStoreBrowseContentItemPropertyItemType"];
}

@end