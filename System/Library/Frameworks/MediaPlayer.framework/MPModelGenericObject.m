@interface MPModelGenericObject
+ (MPModelGenericObject)genericObjectWithModelObject:(id)a3;
+ (id)__album_KEY;
+ (id)__artist_KEY;
+ (id)__composer_KEY;
+ (id)__creditsArtist_KEY;
+ (id)__curator_KEY;
+ (id)__genre_KEY;
+ (id)__group_KEY;
+ (id)__mediaClip_KEY;
+ (id)__movie_KEY;
+ (id)__playlistEntry_KEY;
+ (id)__playlist_KEY;
+ (id)__podcastEpisode_KEY;
+ (id)__podcast_KEY;
+ (id)__radioStationEvent_KEY;
+ (id)__radioStation_KEY;
+ (id)__recordLabel_KEY;
+ (id)__season_KEY;
+ (id)__show_KEY;
+ (id)__socialPerson_KEY;
+ (id)__song_KEY;
+ (id)__tvEpisode_KEY;
+ (id)kindWithRelationshipKinds:(id)a3;
+ (id)relationshipKeyForGenericObjectType:(int64_t)a3;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (void)__MPModelRelationshipGenericAlbum__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericArtist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericComposer__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericCreditsArtist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericCurator__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericGenre__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericGroup__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericMediaClip__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericMovie__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericPlaylistEntry__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericPlaylist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericPodcastEpisode__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericPodcast__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericRadioStationEvent__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericRadioStation__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericRecordLabel__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericSocialPerson__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericSong__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericTVEpisode__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericTVSeason__MAPPING_MISSING__;
+ (void)__MPModelRelationshipGenericTVShow__MAPPING_MISSING__;
- (MPModelGenericObject)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)anyObject;
- (id)artworkCatalog;
- (id)copyWithIdentifiers:(id)a3 block:(id)a4;
- (id)copyWithIdentifiers:(id)a3 propertySet:(id)a4;
- (id)flattenedGenericObject;
- (id)humanDescription;
- (id)identifiers;
- (id)mediaItemPropertyValues;
- (id)mergeWithObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)relativeModelObjectForStoreLibraryPersonalization;
- (int64_t)type;
@end

@implementation MPModelGenericObject

+ (id)__tvEpisode_KEY
{
  return @"MPModelRelationshipGenericTVEpisode";
}

+ (id)__song_KEY
{
  return @"MPModelRelationshipGenericSong";
}

+ (id)__socialPerson_KEY
{
  return @"MPModelRelationshipGenericSocialPerson";
}

+ (id)__show_KEY
{
  return @"MPModelRelationshipGenericTVShow";
}

+ (id)__season_KEY
{
  return @"MPModelRelationshipGenericTVSeason";
}

+ (id)__recordLabel_KEY
{
  return @"MPModelRelationshipGenericRecordLabel";
}

+ (id)__radioStation_KEY
{
  return @"MPModelRelationshipGenericRadioStation";
}

+ (id)__radioStationEvent_KEY
{
  return @"MPModelRelationshipGenericRadioStationEvent";
}

+ (id)__podcast_KEY
{
  return @"MPModelRelationshipGenericPodcast";
}

+ (id)__podcastEpisode_KEY
{
  return @"MPModelRelationshipGenericPodcastEpisode";
}

+ (id)__playlist_KEY
{
  return @"MPModelRelationshipGenericPlaylist";
}

+ (id)__playlistEntry_KEY
{
  return @"MPModelRelationshipGenericPlaylistEntry";
}

+ (id)__movie_KEY
{
  return @"MPModelRelationshipGenericMovie";
}

+ (id)__mediaClip_KEY
{
  return @"MPModelRelationshipGenericMediaClip";
}

+ (id)__group_KEY
{
  return @"MPModelRelationshipGenericGroup";
}

+ (id)__genre_KEY
{
  return @"MPModelRelationshipGenericGenre";
}

+ (id)__curator_KEY
{
  return @"MPModelRelationshipGenericCurator";
}

+ (id)__creditsArtist_KEY
{
  return @"MPModelRelationshipGenericCreditsArtist";
}

+ (id)__composer_KEY
{
  return @"MPModelRelationshipGenericComposer";
}

+ (id)__artist_KEY
{
  return @"MPModelRelationshipGenericArtist";
}

+ (id)__album_KEY
{
  return @"MPModelRelationshipGenericAlbum";
}

- (int64_t)type
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__MPModelGenericObject_type__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __28__MPModelGenericObject_type__block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) song];
  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v3 = [*(id *)(a1 + 32) album];
    if (v3)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
    }
    else
    {
      v4 = [*(id *)(a1 + 32) artist];
      if (v4)
      {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 3;
      }
      else
      {
        uint64_t v5 = [*(id *)(a1 + 32) playlist];
        if (v5)
        {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 4;
        }
        else
        {
          v6 = [*(id *)(a1 + 32) playlistEntry];
          if (v6)
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 5;
          }
          else
          {
            uint64_t v7 = [*(id *)(a1 + 32) tvEpisode];
            if (v7)
            {
              *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 6;
            }
            else
            {
              uint64_t v8 = [*(id *)(a1 + 32) season];
              if (v8)
              {
                *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 7;
              }
              else
              {
                v9 = [*(id *)(a1 + 32) show];
                if (v9)
                {
                  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 8;
                }
                else
                {
                  v10 = [*(id *)(a1 + 32) movie];
                  if (v10)
                  {
                    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 9;
                  }
                  else
                  {
                    v11 = [*(id *)(a1 + 32) mediaClip];
                    if (v11)
                    {
                      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 10;
                    }
                    else
                    {
                      v12 = [*(id *)(a1 + 32) podcast];
                      if (v12)
                      {
                        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 11;
                      }
                      else
                      {
                        v23 = [*(id *)(a1 + 32) podcastEpisode];
                        if (v23)
                        {
                          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 12;
                        }
                        else
                        {
                          v22 = [*(id *)(a1 + 32) radioStation];
                          if (v22)
                          {
                            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 13;
                          }
                          else
                          {
                            v21 = [*(id *)(a1 + 32) radioStationEvent];
                            if (v21)
                            {
                              *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 18;
                            }
                            else
                            {
                              v20 = [*(id *)(a1 + 32) composer];
                              if (v20)
                              {
                                *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 14;
                              }
                              else
                              {
                                v19 = [*(id *)(a1 + 32) genre];
                                if (v19)
                                {
                                  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 15;
                                }
                                else
                                {
                                  v18 = [*(id *)(a1 + 32) curator];
                                  if (v18)
                                  {
                                    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 16;
                                  }
                                  else
                                  {
                                    v17 = [*(id *)(a1 + 32) socialPerson];
                                    if (v17)
                                    {
                                      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 17;
                                    }
                                    else
                                    {
                                      v16 = [*(id *)(a1 + 32) recordLabel];
                                      if (v16)
                                      {
                                        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 19;
                                      }
                                      else
                                      {
                                        v15 = [*(id *)(a1 + 32) creditsArtist];
                                        if (v15)
                                        {
                                          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 20;
                                        }
                                        else
                                        {
                                          v13 = [*(id *)(a1 + 32) group];
                                          uint64_t v14 = 21;
                                          if (!v13) {
                                            uint64_t v14 = 0;
                                          }
                                          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }

                      v11 = 0;
                    }

                    v10 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
    int64_t v2 = 0;
  }
}

void __33__MPModelGenericObject_anyObject__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) song];
  v35 = (void *)v2;
  if (v2)
  {
    uint64_t v33 = 0;
    memset(v34, 0, sizeof(v34));
    uint64_t v32 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
LABEL_17:
    v11 = (void *)v2;
    goto LABEL_18;
  }
  uint64_t v2 = [*(id *)(a1 + 32) album];
  if (v2)
  {
    uint64_t v33 = 0;
    memset(v34, 0, sizeof(v34));
    uint64_t v32 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    v24 = (void *)v2;
    goto LABEL_17;
  }
  uint64_t v2 = [*(id *)(a1 + 32) artist];
  if (v2)
  {
    v24 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    memset(v34, 0, 20);
    HIDWORD(v34[2]) = 1;
    v31 = (void *)v2;
    goto LABEL_17;
  }
  uint64_t v2 = [*(id *)(a1 + 32) playlist];
  if (v2)
  {
    v24 = 0;
    v31 = 0;
    v34[0] = 0;
    v34[1] = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    v34[2] = 0x100000001;
    v30 = (void *)v2;
    goto LABEL_17;
  }
  uint64_t v2 = [*(id *)(a1 + 32) playlistEntry];
  if (v2)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    *(void *)((char *)v34 + 4) = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    LODWORD(v34[0]) = 0;
    v34[2] = 0x100000001;
    HIDWORD(v34[1]) = 1;
    v29 = (void *)v2;
    goto LABEL_17;
  }
  uint64_t v2 = [*(id *)(a1 + 32) tvEpisode];
  if (v2)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    v29 = 0;
    uint64_t v33 = 0;
    v34[0] = 0;
    uint64_t v32 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    v34[2] = 0x100000001;
    v34[1] = 0x100000001;
    v28 = (void *)v2;
    goto LABEL_17;
  }
  uint64_t v2 = [*(id *)(a1 + 32) season];
  if (v2)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 0;
    v29 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    v34[2] = 0x100000001;
    v34[1] = 0x100000001;
    v34[0] = 0x100000000;
    v27 = (void *)v2;
    goto LABEL_17;
  }
  uint64_t v2 = [*(id *)(a1 + 32) show];
  if (v2)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 0;
    v29 = 0;
    v27 = 0;
    uint64_t v32 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    v34[2] = 0x100000001;
    v34[1] = 0x100000001;
    v34[0] = 0x100000000;
    uint64_t v33 = 0x100000000;
    v26 = (void *)v2;
    goto LABEL_17;
  }
  uint64_t v13 = [*(id *)(a1 + 32) movie];
  if (v13)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 0;
    v29 = 0;
    v26 = 0;
    v27 = 0;
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    v11 = (void *)v13;
    v34[2] = 0x100000001;
    v34[1] = 0x100000001;
    v34[0] = 0x100000000;
    uint64_t v33 = 0x100000000;
    uint64_t v32 = 0x100000000;
    v23 = (void *)v13;
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 32) mediaClip];
    if (v2)
    {
      v23 = 0;
      v24 = 0;
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v29 = 0;
      v26 = 0;
      v27 = 0;
      int v4 = 0;
      int v5 = 0;
      int v6 = 0;
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      v34[2] = 0x100000001;
      v34[1] = 0x100000001;
      v34[0] = 0x100000000;
      uint64_t v33 = 0x100000000;
      uint64_t v32 = 0x100000000;
      int v3 = 1;
      v25 = (void *)v2;
      goto LABEL_17;
    }
    v22 = [*(id *)(a1 + 32) podcast];
    if (v22)
    {
      v23 = 0;
      v24 = 0;
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v29 = 0;
      v26 = 0;
      v27 = 0;
      v25 = 0;
      int v5 = 0;
      int v6 = 0;
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      v34[2] = 0x100000001;
      v34[1] = 0x100000001;
      v34[0] = 0x100000000;
      uint64_t v33 = 0x100000000;
      uint64_t v32 = 0x100000000;
      int v3 = 1;
      int v4 = 1;
      v11 = v22;
    }
    else
    {
      v21 = [*(id *)(a1 + 32) podcastEpisode];
      if (v21)
      {
        v23 = 0;
        v24 = 0;
        v30 = 0;
        v31 = 0;
        v28 = 0;
        v29 = 0;
        v26 = 0;
        v27 = 0;
        v25 = 0;
        v22 = 0;
        int v6 = 0;
        int v7 = 0;
        int v8 = 0;
        int v9 = 0;
        int v10 = 0;
        v34[2] = 0x100000001;
        v34[1] = 0x100000001;
        v34[0] = 0x100000000;
        uint64_t v33 = 0x100000000;
        uint64_t v32 = 0x100000000;
        int v3 = 1;
        int v4 = 1;
        int v5 = 1;
        v11 = v21;
      }
      else
      {
        v20 = [*(id *)(a1 + 32) radioStation];
        if (v20)
        {
          v23 = 0;
          v24 = 0;
          v30 = 0;
          v31 = 0;
          v28 = 0;
          v29 = 0;
          v26 = 0;
          v27 = 0;
          v25 = 0;
          v21 = 0;
          v22 = 0;
          int v7 = 0;
          int v8 = 0;
          int v9 = 0;
          int v10 = 0;
          v34[2] = 0x100000001;
          v34[1] = 0x100000001;
          v34[0] = 0x100000000;
          uint64_t v33 = 0x100000000;
          uint64_t v32 = 0x100000000;
          int v3 = 1;
          int v4 = 1;
          int v5 = 1;
          int v6 = 1;
          v11 = v20;
        }
        else
        {
          v19 = [*(id *)(a1 + 32) composer];
          if (v19)
          {
            v23 = 0;
            v24 = 0;
            v30 = 0;
            v31 = 0;
            v28 = 0;
            v29 = 0;
            v26 = 0;
            v27 = 0;
            v25 = 0;
            v21 = 0;
            v22 = 0;
            v20 = 0;
            int v8 = 0;
            int v9 = 0;
            int v10 = 0;
            v34[2] = 0x100000001;
            v34[1] = 0x100000001;
            v34[0] = 0x100000000;
            uint64_t v33 = 0x100000000;
            uint64_t v32 = 0x100000000;
            int v3 = 1;
            int v4 = 1;
            int v5 = 1;
            int v6 = 1;
            int v7 = 1;
            v11 = v19;
          }
          else
          {
            v18 = [*(id *)(a1 + 32) genre];
            if (v18)
            {
              v23 = 0;
              v24 = 0;
              v30 = 0;
              v31 = 0;
              v28 = 0;
              v29 = 0;
              v26 = 0;
              v27 = 0;
              v25 = 0;
              v21 = 0;
              v22 = 0;
              v19 = 0;
              v20 = 0;
              int v9 = 0;
              int v10 = 0;
              v34[2] = 0x100000001;
              v34[1] = 0x100000001;
              v34[0] = 0x100000000;
              uint64_t v33 = 0x100000000;
              uint64_t v32 = 0x100000000;
              int v3 = 1;
              int v4 = 1;
              int v5 = 1;
              int v6 = 1;
              int v7 = 1;
              int v8 = 1;
              v11 = v18;
            }
            else
            {
              v17 = [*(id *)(a1 + 32) curator];
              if (v17)
              {
                v23 = 0;
                v24 = 0;
                v30 = 0;
                v31 = 0;
                v28 = 0;
                v29 = 0;
                v26 = 0;
                v27 = 0;
                v25 = 0;
                v21 = 0;
                v22 = 0;
                v19 = 0;
                v20 = 0;
                v18 = 0;
                int v10 = 0;
                v34[2] = 0x100000001;
                v34[1] = 0x100000001;
                v34[0] = 0x100000000;
                uint64_t v33 = 0x100000000;
                uint64_t v32 = 0x100000000;
                int v3 = 1;
                int v4 = 1;
                int v5 = 1;
                int v6 = 1;
                int v7 = 1;
                int v8 = 1;
                int v9 = 1;
                v11 = v17;
              }
              else
              {
                v16 = [*(id *)(a1 + 32) socialPerson];
                if (v16)
                {
                  v23 = 0;
                  v24 = 0;
                  v30 = 0;
                  v31 = 0;
                  v28 = 0;
                  v29 = 0;
                  v26 = 0;
                  v27 = 0;
                  v25 = 0;
                  v21 = 0;
                  v22 = 0;
                  v19 = 0;
                  v20 = 0;
                  v17 = 0;
                  v18 = 0;
                  v34[2] = 0x100000001;
                  v34[1] = 0x100000001;
                  v34[0] = 0x100000000;
                  uint64_t v33 = 0x100000000;
                  uint64_t v32 = 0x100000000;
                  int v3 = 1;
                  int v4 = 1;
                  int v5 = 1;
                  int v6 = 1;
                  int v7 = 1;
                  int v8 = 1;
                  int v9 = 1;
                  int v10 = 1;
                  v11 = v16;
                }
                else
                {
                  v15 = [*(id *)(a1 + 32) recordLabel];
                  if (v15)
                  {
                    v23 = 0;
                    v24 = 0;
                    v30 = 0;
                    v31 = 0;
                    v28 = 0;
                    v29 = 0;
                    v26 = 0;
                    v27 = 0;
                    v25 = 0;
                    v21 = 0;
                    v22 = 0;
                    v19 = 0;
                    v20 = 0;
                    v17 = 0;
                    v18 = 0;
                    v16 = 0;
                    v34[2] = 0x100000001;
                    v34[1] = 0x100000001;
                    v34[0] = 0x100000000;
                    uint64_t v33 = 0x100000000;
                    uint64_t v32 = 0x100000001;
                    int v3 = 1;
                    int v4 = 1;
                    int v5 = 1;
                    int v6 = 1;
                    int v7 = 1;
                    int v8 = 1;
                    int v9 = 1;
                    int v10 = 1;
                    v11 = v15;
                  }
                  else
                  {
                    uint64_t v14 = [*(id *)(a1 + 32) creditsArtist];
                    if (v14)
                    {
                      v23 = 0;
                      v24 = 0;
                      v30 = 0;
                      v31 = 0;
                      v28 = 0;
                      v29 = 0;
                      v26 = 0;
                      v27 = 0;
                      v25 = 0;
                      v21 = 0;
                      v22 = 0;
                      v19 = 0;
                      v20 = 0;
                      v17 = 0;
                      v18 = 0;
                      v15 = 0;
                      v16 = 0;
                      v34[2] = 0x100000001;
                      v34[1] = 0x100000001;
                      v34[0] = 0x100000000;
                      uint64_t v33 = 0x100000001;
                      uint64_t v32 = 0x100000001;
                      int v3 = 1;
                      int v4 = 1;
                      int v5 = 1;
                      int v6 = 1;
                      int v7 = 1;
                      int v8 = 1;
                      int v9 = 1;
                      int v10 = 1;
                      v11 = v14;
                    }
                    else
                    {
                      v11 = [*(id *)(a1 + 32) group];
                      v23 = 0;
                      v24 = 0;
                      v30 = 0;
                      v31 = 0;
                      v28 = 0;
                      v29 = 0;
                      v26 = 0;
                      v27 = 0;
                      v25 = 0;
                      v21 = 0;
                      v22 = 0;
                      v19 = 0;
                      v20 = 0;
                      v17 = 0;
                      v18 = 0;
                      v15 = 0;
                      v16 = 0;
                      uint64_t v14 = 0;
                      v34[2] = 0x100000001;
                      v34[1] = 0x100000001;
                      v34[0] = 0x100000001;
                      uint64_t v33 = 0x100000001;
                      uint64_t v32 = 0x100000001;
                      int v3 = 1;
                      int v4 = 1;
                      int v5 = 1;
                      int v6 = 1;
                      int v7 = 1;
                      int v8 = 1;
                      int v9 = 1;
                      int v10 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_18:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11);
  if (LODWORD(v34[0])) {

  }
  if (v33) {
  if (v32)
  }
  {

    if (!v10) {
      goto LABEL_24;
    }
  }
  else if (!v10)
  {
LABEL_24:
    if (v9) {
      goto LABEL_25;
    }
    goto LABEL_33;
  }

  if (v9)
  {
LABEL_25:

    if (!v8) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }
LABEL_33:
  if (!v8)
  {
LABEL_26:
    if (v7) {
      goto LABEL_27;
    }
    goto LABEL_35;
  }
LABEL_34:

  if (v7)
  {
LABEL_27:

    if (!v6) {
      goto LABEL_28;
    }
    goto LABEL_36;
  }
LABEL_35:
  if (!v6)
  {
LABEL_28:
    if (v5) {
      goto LABEL_29;
    }
LABEL_37:
    if (!v4) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_36:

  if (!v5) {
    goto LABEL_37;
  }
LABEL_29:

  if (v4) {
LABEL_38:
  }

LABEL_39:
  if (v3) {

  }
  if (HIDWORD(v32)) {
  if (HIDWORD(v33))
  }

  if (HIDWORD(v34[0])) {
  if (LODWORD(v34[1]))
  }

  if (HIDWORD(v34[1])) {
  if (LODWORD(v34[2]))
  }

  if (HIDWORD(v34[2])) {
  v12 = v35;
  }
  if (!v35)
  {

    v12 = 0;
  }
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSong:*(void *)(a1 + 32)];
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v3 = +[MPPropertySet emptyPropertySet];
  uint64_t v4 = +[MPModelAlbum requiredStoreLibraryPersonalizationProperties];
  int v5 = (void *)v4;
  if (v4) {
    int v6 = (void *)v4;
  }
  else {
    int v6 = v3;
  }
  id v7 = v6;

  [v2 setObject:v7 forKey:@"MPModelRelationshipGenericAlbum"];
  uint64_t v8 = +[MPModelArtist requiredStoreLibraryPersonalizationProperties];
  int v9 = (void *)v8;
  if (v8) {
    int v10 = (void *)v8;
  }
  else {
    int v10 = v3;
  }
  id v11 = v10;

  [v2 setObject:v11 forKey:@"MPModelRelationshipGenericArtist"];
  uint64_t v12 = +[MPModelMovie requiredStoreLibraryPersonalizationProperties];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  else {
    uint64_t v14 = v3;
  }
  id v15 = v14;

  [v2 setObject:v15 forKey:@"MPModelRelationshipGenericMovie"];
  uint64_t v16 = +[MPModelPlaylistEntry requiredStoreLibraryPersonalizationProperties];
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v3;
  }
  id v19 = v18;

  [v2 setObject:v19 forKey:@"MPModelRelationshipGenericPlaylistEntry"];
  uint64_t v20 = +[MPModelSong requiredStoreLibraryPersonalizationProperties];
  v21 = (void *)v20;
  if (v20) {
    v22 = (void *)v20;
  }
  else {
    v22 = v3;
  }
  id v23 = v22;

  [v2 setObject:v23 forKey:@"MPModelRelationshipGenericSong"];
  uint64_t v24 = +[MPModelTVEpisode requiredStoreLibraryPersonalizationProperties];
  v25 = (void *)v24;
  if (v24) {
    v26 = (void *)v24;
  }
  else {
    v26 = v3;
  }
  id v27 = v26;

  [v2 setObject:v27 forKey:@"MPModelRelationshipGenericTVEpisode"];
  uint64_t v28 = +[MPModelTVSeason requiredStoreLibraryPersonalizationProperties];
  v29 = (void *)v28;
  if (v28) {
    v30 = (void *)v28;
  }
  else {
    v30 = v3;
  }
  id v31 = v30;

  [v2 setObject:v31 forKey:@"MPModelRelationshipGenericTVSeason"];
  uint64_t v32 = [MPPropertySet alloc];
  uint64_t v33 = [(MPPropertySet *)v32 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:v2];

  return v33;
}

- (id)identifiers
{
  switch([(MPModelGenericObject *)self type])
  {
    case 1:
      int v3 = [(MPModelGenericObject *)self song];
      goto LABEL_23;
    case 2:
      int v3 = [(MPModelGenericObject *)self album];
      goto LABEL_23;
    case 3:
      int v3 = [(MPModelGenericObject *)self artist];
      goto LABEL_23;
    case 4:
      int v3 = [(MPModelGenericObject *)self playlist];
      goto LABEL_23;
    case 5:
      int v3 = [(MPModelGenericObject *)self playlistEntry];
      goto LABEL_23;
    case 6:
      int v3 = [(MPModelGenericObject *)self tvEpisode];
      goto LABEL_23;
    case 7:
      int v3 = [(MPModelGenericObject *)self season];
      goto LABEL_23;
    case 8:
      int v3 = [(MPModelGenericObject *)self show];
      goto LABEL_23;
    case 9:
      int v3 = [(MPModelGenericObject *)self movie];
      goto LABEL_23;
    case 10:
      int v3 = [(MPModelGenericObject *)self mediaClip];
      goto LABEL_23;
    case 11:
      int v3 = [(MPModelGenericObject *)self podcast];
      goto LABEL_23;
    case 12:
      int v3 = [(MPModelGenericObject *)self podcastEpisode];
      goto LABEL_23;
    case 13:
      int v3 = [(MPModelGenericObject *)self radioStation];
      goto LABEL_23;
    case 14:
      int v3 = [(MPModelGenericObject *)self composer];
      goto LABEL_23;
    case 15:
      int v3 = [(MPModelGenericObject *)self genre];
      goto LABEL_23;
    case 16:
      int v3 = [(MPModelGenericObject *)self curator];
      goto LABEL_23;
    case 17:
      int v3 = [(MPModelGenericObject *)self socialPerson];
      goto LABEL_23;
    case 18:
      int v3 = [(MPModelGenericObject *)self radioStationEvent];
      goto LABEL_23;
    case 19:
      int v3 = [(MPModelGenericObject *)self recordLabel];
      goto LABEL_23;
    case 20:
      int v3 = [(MPModelGenericObject *)self creditsArtist];
      goto LABEL_23;
    case 21:
      int v3 = [(MPModelGenericObject *)self group];
LABEL_23:
      uint64_t v4 = v3;
      int v5 = [v3 identifiers];

      if (!v5) {
        goto LABEL_24;
      }
      goto LABEL_25;
    default:
LABEL_24:
      v7.receiver = self;
      v7.super_class = (Class)MPModelGenericObject;
      int v5 = [(MPModelObject *)&v7 identifiers];
LABEL_25:
      return v5;
  }
}

void __46__MPModelGenericObject_flattenedGenericObject__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playlistEntry];
  id v10 = v2;
  if (v2)
  {
    int v3 = [v2 anyObject];
    uint64_t v4 = +[MPModelGenericObject genericObjectWithModelObject:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    int v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    objc_super v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v7;
    int v3 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
}

- (id)flattenedGenericObject
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__37492;
  id v9 = __Block_byref_object_dispose__37493;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MPModelGenericObject_flattenedGenericObject__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)anyObject
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__37492;
  id v9 = __Block_byref_object_dispose__37493;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__MPModelGenericObject_anyObject__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (MPModelGenericObject)genericObjectWithModelObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (MPModelGenericObject *)v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_49;
    }
    uint64_t v5 = [MPModelGenericObject alloc];
    int v6 = [v3 identifiers];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke;
    v84[3] = &unk_1E57F5898;
    id v85 = v3;
    uint64_t v4 = [(MPModelObject *)v5 initWithIdentifiers:v6 block:v84];

    if (!v4)
    {
LABEL_49:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_50;
      }
      uint64_t v7 = [MPModelGenericObject alloc];
      uint64_t v8 = [v3 identifiers];
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_2;
      v82[3] = &unk_1E57F5898;
      id v83 = v3;
      uint64_t v4 = [(MPModelObject *)v7 initWithIdentifiers:v8 block:v82];

      if (!v4)
      {
LABEL_50:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_51;
        }
        id v9 = [MPModelGenericObject alloc];
        id v10 = [v3 identifiers];
        v80[0] = MEMORY[0x1E4F143A8];
        v80[1] = 3221225472;
        v80[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_3;
        v80[3] = &unk_1E57F5898;
        id v81 = v3;
        uint64_t v4 = [(MPModelObject *)v9 initWithIdentifiers:v10 block:v80];

        if (!v4)
        {
LABEL_51:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_52;
          }
          id v11 = [MPModelGenericObject alloc];
          uint64_t v12 = [v3 identifiers];
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_4;
          v78[3] = &unk_1E57F5898;
          id v79 = v3;
          uint64_t v4 = [(MPModelObject *)v11 initWithIdentifiers:v12 block:v78];

          if (!v4)
          {
LABEL_52:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_53;
            }
            uint64_t v13 = [MPModelGenericObject alloc];
            uint64_t v14 = [v3 identifiers];
            v76[0] = MEMORY[0x1E4F143A8];
            v76[1] = 3221225472;
            v76[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_5;
            v76[3] = &unk_1E57F5898;
            id v77 = v3;
            uint64_t v4 = [(MPModelObject *)v13 initWithIdentifiers:v14 block:v76];

            if (!v4)
            {
LABEL_53:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_54;
              }
              id v15 = [MPModelGenericObject alloc];
              uint64_t v16 = [v3 identifiers];
              v74[0] = MEMORY[0x1E4F143A8];
              v74[1] = 3221225472;
              v74[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_6;
              v74[3] = &unk_1E57F5898;
              id v75 = v3;
              uint64_t v4 = [(MPModelObject *)v15 initWithIdentifiers:v16 block:v74];

              if (!v4)
              {
LABEL_54:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_55;
                }
                v17 = [MPModelGenericObject alloc];
                v18 = [v3 identifiers];
                v72[0] = MEMORY[0x1E4F143A8];
                v72[1] = 3221225472;
                v72[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_7;
                v72[3] = &unk_1E57F5898;
                id v73 = v3;
                uint64_t v4 = [(MPModelObject *)v17 initWithIdentifiers:v18 block:v72];

                if (!v4)
                {
LABEL_55:
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_56;
                  }
                  id v19 = [MPModelGenericObject alloc];
                  uint64_t v20 = [v3 identifiers];
                  v70[0] = MEMORY[0x1E4F143A8];
                  v70[1] = 3221225472;
                  v70[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_8;
                  v70[3] = &unk_1E57F5898;
                  id v71 = v3;
                  uint64_t v4 = [(MPModelObject *)v19 initWithIdentifiers:v20 block:v70];

                  if (!v4)
                  {
LABEL_56:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_57;
                    }
                    v21 = [MPModelGenericObject alloc];
                    v22 = [v3 identifiers];
                    v68[0] = MEMORY[0x1E4F143A8];
                    v68[1] = 3221225472;
                    v68[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_9;
                    v68[3] = &unk_1E57F5898;
                    id v69 = v3;
                    uint64_t v4 = [(MPModelObject *)v21 initWithIdentifiers:v22 block:v68];

                    if (!v4)
                    {
LABEL_57:
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_58;
                      }
                      id v23 = [MPModelGenericObject alloc];
                      uint64_t v24 = [v3 identifiers];
                      v66[0] = MEMORY[0x1E4F143A8];
                      v66[1] = 3221225472;
                      v66[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_10;
                      v66[3] = &unk_1E57F5898;
                      id v67 = v3;
                      uint64_t v4 = [(MPModelObject *)v23 initWithIdentifiers:v24 block:v66];

                      if (!v4)
                      {
LABEL_58:
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0) {
                          goto LABEL_59;
                        }
                        v25 = [MPModelGenericObject alloc];
                        v26 = [v3 identifiers];
                        v64[0] = MEMORY[0x1E4F143A8];
                        v64[1] = 3221225472;
                        v64[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_11;
                        v64[3] = &unk_1E57F5898;
                        id v65 = v3;
                        uint64_t v4 = [(MPModelObject *)v25 initWithIdentifiers:v26 block:v64];

                        if (!v4)
                        {
LABEL_59:
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_60;
                          }
                          id v27 = [MPModelGenericObject alloc];
                          uint64_t v28 = [v3 identifiers];
                          v62[0] = MEMORY[0x1E4F143A8];
                          v62[1] = 3221225472;
                          v62[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_12;
                          v62[3] = &unk_1E57F5898;
                          id v63 = v3;
                          uint64_t v4 = [(MPModelObject *)v27 initWithIdentifiers:v28 block:v62];

                          if (!v4)
                          {
LABEL_60:
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0) {
                              goto LABEL_61;
                            }
                            v29 = [MPModelGenericObject alloc];
                            v30 = [v3 identifiers];
                            v60[0] = MEMORY[0x1E4F143A8];
                            v60[1] = 3221225472;
                            v60[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_13;
                            v60[3] = &unk_1E57F5898;
                            id v61 = v3;
                            uint64_t v4 = [(MPModelObject *)v29 initWithIdentifiers:v30 block:v60];

                            if (!v4)
                            {
LABEL_61:
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0) {
                                goto LABEL_62;
                              }
                              id v31 = [MPModelGenericObject alloc];
                              uint64_t v32 = [v3 identifiers];
                              v58[0] = MEMORY[0x1E4F143A8];
                              v58[1] = 3221225472;
                              v58[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_14;
                              v58[3] = &unk_1E57F5898;
                              id v59 = v3;
                              uint64_t v4 = [(MPModelObject *)v31 initWithIdentifiers:v32 block:v58];

                              if (!v4)
                              {
LABEL_62:
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0) {
                                  goto LABEL_63;
                                }
                                uint64_t v33 = [MPModelGenericObject alloc];
                                v34 = [v3 identifiers];
                                v56[0] = MEMORY[0x1E4F143A8];
                                v56[1] = 3221225472;
                                v56[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_15;
                                v56[3] = &unk_1E57F5898;
                                id v57 = v3;
                                uint64_t v4 = [(MPModelObject *)v33 initWithIdentifiers:v34 block:v56];

                                if (!v4)
                                {
LABEL_63:
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                                    goto LABEL_64;
                                  }
                                  v35 = [MPModelGenericObject alloc];
                                  v36 = [v3 identifiers];
                                  v54[0] = MEMORY[0x1E4F143A8];
                                  v54[1] = 3221225472;
                                  v54[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_16;
                                  v54[3] = &unk_1E57F5898;
                                  id v55 = v3;
                                  uint64_t v4 = [(MPModelObject *)v35 initWithIdentifiers:v36 block:v54];

                                  if (!v4)
                                  {
LABEL_64:
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                                      goto LABEL_65;
                                    }
                                    v37 = [MPModelGenericObject alloc];
                                    v38 = [v3 identifiers];
                                    v52[0] = MEMORY[0x1E4F143A8];
                                    v52[1] = 3221225472;
                                    v52[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_17;
                                    v52[3] = &unk_1E57F5898;
                                    id v53 = v3;
                                    uint64_t v4 = [(MPModelObject *)v37 initWithIdentifiers:v38 block:v52];

                                    if (!v4)
                                    {
LABEL_65:
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                                        goto LABEL_66;
                                      }
                                      v39 = [MPModelGenericObject alloc];
                                      v40 = [v3 identifiers];
                                      v50[0] = MEMORY[0x1E4F143A8];
                                      v50[1] = 3221225472;
                                      v50[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_18;
                                      v50[3] = &unk_1E57F5898;
                                      id v51 = v3;
                                      uint64_t v4 = [(MPModelObject *)v39 initWithIdentifiers:v40 block:v50];

                                      if (!v4)
                                      {
LABEL_66:
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0) {
                                          goto LABEL_41;
                                        }
                                        v41 = [MPModelGenericObject alloc];
                                        v42 = [v3 identifiers];
                                        v48[0] = MEMORY[0x1E4F143A8];
                                        v48[1] = 3221225472;
                                        v48[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_19;
                                        v48[3] = &unk_1E57F5898;
                                        id v49 = v3;
                                        uint64_t v4 = [(MPModelObject *)v41 initWithIdentifiers:v42 block:v48];

                                        if (!v4)
                                        {
LABEL_41:
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            v43 = [MPModelGenericObject alloc];
                                            v44 = [v3 identifiers];
                                            v46[0] = MEMORY[0x1E4F143A8];
                                            v46[1] = 3221225472;
                                            v46[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_20;
                                            v46[3] = &unk_1E57F5898;
                                            id v47 = v3;
                                            uint64_t v4 = [(MPModelObject *)v43 initWithIdentifiers:v44 block:v46];
                                          }
                                          else
                                          {
                                            uint64_t v4 = 0;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (id)mediaItemPropertyValues
{
  id v3 = 0;
  switch([(MPModelGenericObject *)self type])
  {
    case 1:
      uint64_t v4 = [(MPModelGenericObject *)self song];
      goto LABEL_6;
    case 5:
      uint64_t v4 = [(MPModelGenericObject *)self playlistEntry];
      goto LABEL_6;
    case 6:
      uint64_t v4 = [(MPModelGenericObject *)self tvEpisode];
      goto LABEL_6;
    case 9:
      uint64_t v4 = [(MPModelGenericObject *)self movie];
LABEL_6:
      uint64_t v5 = v4;
      id v3 = [v4 mediaItemPropertyValues];

      break;
    default:
      break;
  }

  return v3;
}

- (id)artworkCatalog
{
  id v3 = 0;
  switch([(MPModelGenericObject *)self type])
  {
    case 1:
      uint64_t v4 = [(MPModelGenericObject *)self song];
      goto LABEL_19;
    case 2:
      uint64_t v4 = [(MPModelGenericObject *)self album];
      goto LABEL_19;
    case 3:
      uint64_t v4 = [(MPModelGenericObject *)self artist];
      goto LABEL_19;
    case 4:
      uint64_t v4 = [(MPModelGenericObject *)self playlist];
      goto LABEL_19;
    case 6:
      uint64_t v4 = [(MPModelGenericObject *)self tvEpisode];
      goto LABEL_19;
    case 7:
      uint64_t v4 = [(MPModelGenericObject *)self season];
      goto LABEL_19;
    case 8:
      uint64_t v4 = [(MPModelGenericObject *)self show];
      goto LABEL_19;
    case 9:
      uint64_t v4 = [(MPModelGenericObject *)self movie];
      goto LABEL_19;
    case 10:
      uint64_t v5 = [(MPModelGenericObject *)self mediaClip];
      uint64_t v6 = [v5 previewArtworkCatalog];
      goto LABEL_20;
    case 11:
      uint64_t v4 = [(MPModelGenericObject *)self podcast];
      goto LABEL_19;
    case 12:
      uint64_t v4 = [(MPModelGenericObject *)self podcastEpisode];
      goto LABEL_19;
    case 13:
      uint64_t v4 = [(MPModelGenericObject *)self radioStation];
      goto LABEL_19;
    case 15:
      uint64_t v4 = [(MPModelGenericObject *)self genre];
      goto LABEL_19;
    case 16:
      uint64_t v5 = [(MPModelGenericObject *)self curator];
      uint64_t v6 = [v5 editorialArtworkCatalog];
      goto LABEL_20;
    case 18:
      uint64_t v4 = [(MPModelGenericObject *)self radioStationEvent];
      goto LABEL_19;
    case 19:
      uint64_t v4 = [(MPModelGenericObject *)self recordLabel];
      goto LABEL_19;
    case 20:
      uint64_t v4 = [(MPModelGenericObject *)self creditsArtist];
LABEL_19:
      uint64_t v5 = v4;
      uint64_t v6 = [v4 artworkCatalog];
LABEL_20:
      id v3 = (void *)v6;

      break;
    default:
      break;
  }

  return v3;
}

- (id)humanDescription
{
  id v3 = NSString;
  uint64_t v4 = [(MPModelGenericObject *)self anyObject];
  uint64_t v5 = [v4 humanDescription];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = [v3 stringWithFormat:@"generic %@", v5];
  }
  else
  {
    uint64_t v8 = [(MPModelGenericObject *)self identifiers];
    id v9 = [v8 humanDescription];
    uint64_t v7 = [v3 stringWithFormat:@"generic %@", v9];
  }

  return v7;
}

- (id)mergeWithObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v24 = objc_opt_class();
    [v23 handleFailureInMethod:a2, self, @"MPModelGenericObject.m", 261, @"MPModelObject mergeWithObject: called with a different object class: %@ %@", v24, objc_opt_class() object file lineNumber description];
  }
  id v6 = v5;
  uint64_t v7 = [(MPModelGenericObject *)self anyObject];
  uint64_t v8 = [v6 anyObject];
  id v9 = (void *)v8;
  if (v7 | v8)
  {
    if (!v7 || v8)
    {
      if (v7 || !v8)
      {
        int64_t v21 = [(MPModelGenericObject *)self type];
        if (v21 != [v6 type])
        {
          v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2, self, @"MPModelGenericObject.m", 281, @"MPModelObject mergeWithObject: called with a different generic relationship type: %@ %@", self, v6 object file lineNumber description];
        }
        uint64_t v12 = [(id)v7 mergeWithObject:v9];
        uint64_t v13 = +[MPModelGenericObject genericObjectWithModelObject:v12];
        goto LABEL_15;
      }
      v17 = [(MPModelGenericObject *)self identifiers];
      v18 = [v6 identifiers];
      uint64_t v12 = [v17 unionSet:v18];

      uint64_t v16 = v9;
    }
    else
    {
      uint64_t v14 = [(MPModelGenericObject *)self identifiers];
      id v15 = [v6 identifiers];
      uint64_t v12 = [v14 unionSet:v15];

      uint64_t v16 = (void *)v7;
    }
    id v19 = (void *)[v16 copyWithIdentifiers:v12];
    uint64_t v20 = +[MPModelGenericObject genericObjectWithModelObject:v19];

    goto LABEL_16;
  }
  id v10 = [(MPModelGenericObject *)self identifiers];
  id v11 = [v6 identifiers];
  uint64_t v12 = [v10 unionSet:v11];

  uint64_t v13 = [(MPModelObject *)[MPModelGenericObject alloc] initWithIdentifiers:v12];
LABEL_15:
  uint64_t v20 = v13;
LABEL_16:

  return v20;
}

- (id)copyWithIdentifiers:(id)a3 propertySet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPModelGenericObject *)self anyObject];
  int64_t v9 = [(MPModelGenericObject *)self type];
  id v10 = +[MPPropertySet emptyPropertySet];
  if (v9)
  {
    id v11 = [v7 relationships];
    uint64_t v12 = +[MPModelGenericObject relationshipKeyForGenericObjectType:[(MPModelGenericObject *)self type]];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];

    id v10 = (void *)v13;
  }
  if (v10)
  {
    uint64_t v14 = (void *)[v8 copyWithIdentifiers:v6 propertySet:v10];
    id v15 = +[MPModelGenericObject genericObjectWithModelObject:v14];
  }
  else
  {
    id v15 = [(MPModelObject *)[MPModelGenericObject alloc] initWithIdentifiers:v6 block:&__block_literal_global_37510];
  }

  return v15;
}

- (id)copyWithIdentifiers:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPModelGenericObject *)self anyObject];
  if (v8)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __50__MPModelGenericObject_copyWithIdentifiers_block___block_invoke_2;
    id v19 = &unk_1E57F58C0;
    int64_t v9 = &v20;
    id v20 = v7;
    id v10 = v7;
    id v11 = (void *)[v8 copyWithIdentifiers:v6 block:&v16];
    +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v11, v16, v17, v18, v19);
    uint64_t v12 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = [MPModelGenericObject alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__MPModelGenericObject_copyWithIdentifiers_block___block_invoke;
    v21[3] = &unk_1E57F58C0;
    int64_t v9 = &v22;
    id v22 = v7;
    id v14 = v7;
    uint64_t v12 = [(MPModelObject *)v13 initWithIdentifiers:v6 block:v21];
  }

  return v12;
}

uint64_t __50__MPModelGenericObject_copyWithIdentifiers_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__MPModelGenericObject_copyWithIdentifiers_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)__MPModelRelationshipGenericGroup__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:311 description:@"Translator was missing mapping for MPModelRelationshipGenericGroup"];
}

+ (void)__MPModelRelationshipGenericCreditsArtist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:310 description:@"Translator was missing mapping for MPModelRelationshipGenericCreditsArtist"];
}

+ (void)__MPModelRelationshipGenericRecordLabel__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:309 description:@"Translator was missing mapping for MPModelRelationshipGenericRecordLabel"];
}

+ (void)__MPModelRelationshipGenericSocialPerson__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:308 description:@"Translator was missing mapping for MPModelRelationshipGenericSocialPerson"];
}

+ (void)__MPModelRelationshipGenericCurator__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:307 description:@"Translator was missing mapping for MPModelRelationshipGenericCurator"];
}

+ (void)__MPModelRelationshipGenericGenre__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:306 description:@"Translator was missing mapping for MPModelRelationshipGenericGenre"];
}

+ (void)__MPModelRelationshipGenericComposer__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:305 description:@"Translator was missing mapping for MPModelRelationshipGenericComposer"];
}

+ (void)__MPModelRelationshipGenericRadioStationEvent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:304 description:@"Translator was missing mapping for MPModelRelationshipGenericRadioStationEvent"];
}

+ (void)__MPModelRelationshipGenericRadioStation__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:303 description:@"Translator was missing mapping for MPModelRelationshipGenericRadioStation"];
}

+ (void)__MPModelRelationshipGenericPodcastEpisode__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:302 description:@"Translator was missing mapping for MPModelRelationshipGenericPodcastEpisode"];
}

+ (void)__MPModelRelationshipGenericPodcast__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:301 description:@"Translator was missing mapping for MPModelRelationshipGenericPodcast"];
}

+ (void)__MPModelRelationshipGenericMediaClip__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:300 description:@"Translator was missing mapping for MPModelRelationshipGenericMediaClip"];
}

+ (void)__MPModelRelationshipGenericMovie__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:299 description:@"Translator was missing mapping for MPModelRelationshipGenericMovie"];
}

+ (void)__MPModelRelationshipGenericTVShow__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:298 description:@"Translator was missing mapping for MPModelRelationshipGenericTVShow"];
}

+ (void)__MPModelRelationshipGenericTVSeason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:297 description:@"Translator was missing mapping for MPModelRelationshipGenericTVSeason"];
}

+ (void)__MPModelRelationshipGenericTVEpisode__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:296 description:@"Translator was missing mapping for MPModelRelationshipGenericTVEpisode"];
}

+ (void)__MPModelRelationshipGenericPlaylistEntry__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:295 description:@"Translator was missing mapping for MPModelRelationshipGenericPlaylistEntry"];
}

+ (void)__MPModelRelationshipGenericPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:294 description:@"Translator was missing mapping for MPModelRelationshipGenericPlaylist"];
}

+ (void)__MPModelRelationshipGenericArtist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:293 description:@"Translator was missing mapping for MPModelRelationshipGenericArtist"];
}

+ (void)__MPModelRelationshipGenericAlbum__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:292 description:@"Translator was missing mapping for MPModelRelationshipGenericAlbum"];
}

+ (void)__MPModelRelationshipGenericSong__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:291 description:@"Translator was missing mapping for MPModelRelationshipGenericSong"];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAlbum:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setArtist:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setPlaylist:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setPlaylistEntry:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setTvEpisode:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setSeason:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 setShow:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 setMovie:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 setMediaClip:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 setPodcast:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 setPodcastEpisode:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 setRadioStation:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 setComposer:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 setGenre:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 setCurator:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 setSocialPerson:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_18(uint64_t a1, void *a2)
{
  return [a2 setRecordLabel:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_19(uint64_t a1, void *a2)
{
  return [a2 setCreditsArtist:*(void *)(a1 + 32)];
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_20(uint64_t a1, void *a2)
{
  return [a2 setGroup:*(void *)(a1 + 32)];
}

+ (id)relationshipKeyForGenericObjectType:(int64_t)a3
{
  id result = @"MPModelRelationshipGenericAlbum";
  switch(a3)
  {
    case 0:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:a1 file:@"MPModelGenericObject.m" lineNumber:169 description:@"Cannot provide relationship key for unknown generic object type."];

      goto LABEL_3;
    case 1:
      id result = @"MPModelRelationshipGenericSong";
      break;
    case 2:
      return result;
    case 3:
      id result = @"MPModelRelationshipGenericArtist";
      break;
    case 4:
      id result = @"MPModelRelationshipGenericPlaylist";
      break;
    case 5:
      id result = @"MPModelRelationshipGenericPlaylistEntry";
      break;
    case 6:
      id result = @"MPModelRelationshipGenericTVEpisode";
      break;
    case 7:
      id result = @"MPModelRelationshipGenericTVSeason";
      break;
    case 8:
      id result = @"MPModelRelationshipGenericTVShow";
      break;
    case 9:
      id result = @"MPModelRelationshipGenericMovie";
      break;
    case 10:
      id result = @"MPModelRelationshipGenericMediaClip";
      break;
    case 11:
      id result = @"MPModelRelationshipGenericPodcast";
      break;
    case 12:
      id result = @"MPModelRelationshipGenericPodcastEpisode";
      break;
    case 13:
      id result = @"MPModelRelationshipGenericRadioStation";
      break;
    case 14:
      id result = @"MPModelRelationshipGenericComposer";
      break;
    case 15:
      id result = @"MPModelRelationshipGenericGenre";
      break;
    case 16:
      id result = @"MPModelRelationshipGenericCurator";
      break;
    case 17:
      id result = @"MPModelRelationshipGenericSocialPerson";
      break;
    case 18:
      id result = @"MPModelRelationshipGenericRadioStationEvent";
      break;
    case 19:
      id result = @"MPModelRelationshipGenericRecordLabel";
      break;
    case 20:
      id result = @"MPModelRelationshipGenericCreditsArtist";
      break;
    case 21:
      id result = @"MPModelRelationshipGenericGroup";
      break;
    default:
LABEL_3:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MPModelGenericObject.m", 171, @"Unsupported generic object type: %ld", a3);

      id result = 0;
      break;
  }
  return result;
}

+ (id)kindWithRelationshipKinds:(id)a3
{
  return +[MPModelGenericObjectKind kindWithRelationshipKinds:a3];
}

- (MPModelGenericObject)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4 = a3;
  id v5 = [(MPModelGenericObject *)self anyObject];
  id v6 = [v5 objectWithStoreLibraryPersonalizationRelativeModelObject:v4];
  id v7 = +[MPModelGenericObject genericObjectWithModelObject:v6];

  return (MPModelGenericObject *)v7;
}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  id v3 = 0;
  switch([(MPModelGenericObject *)self type])
  {
    case 1:
      id v4 = [(MPModelGenericObject *)self song];
      uint64_t v5 = [v4 relativeModelObjectForStoreLibraryPersonalization];
      goto LABEL_10;
    case 2:
      id v4 = [(MPModelGenericObject *)self album];
      uint64_t v5 = [v4 relativeModelObjectForStoreLibraryPersonalization];
      goto LABEL_10;
    case 3:
      id v4 = [(MPModelGenericObject *)self artist];
      uint64_t v5 = [v4 relativeModelObjectForStoreLibraryPersonalization];
      goto LABEL_10;
    case 4:
      id v4 = [(MPModelGenericObject *)self playlist];
      uint64_t v5 = [v4 relativeModelObjectForStoreLibraryPersonalization];
      goto LABEL_10;
    case 5:
      id v4 = [(MPModelGenericObject *)self playlistEntry];
      uint64_t v5 = [v4 relativeModelObjectForStoreLibraryPersonalization];
      goto LABEL_10;
    case 6:
      id v4 = [(MPModelGenericObject *)self tvEpisode];
      uint64_t v5 = [v4 relativeModelObjectForStoreLibraryPersonalization];
      goto LABEL_10;
    case 7:
      id v4 = [(MPModelGenericObject *)self season];
      uint64_t v5 = [v4 relativeModelObjectForStoreLibraryPersonalization];
      goto LABEL_10;
    case 9:
      id v4 = [(MPModelGenericObject *)self movie];
      uint64_t v5 = [v4 relativeModelObjectForStoreLibraryPersonalization];
LABEL_10:
      id v3 = (void *)v5;

      break;
    default:
      break;
  }

  return v3;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  id v4 = [a3 relationships];
  switch([(MPModelGenericObject *)self type])
  {
    case 1:
      uint64_t v5 = [(MPModelGenericObject *)self song];
      id v6 = [v4 objectForKey:@"MPModelRelationshipGenericSong"];
      id v7 = v6;
      if (!v6)
      {
        id v7 = +[MPPropertySet emptyPropertySet];
      }
      goto LABEL_25;
    case 2:
      uint64_t v5 = [(MPModelGenericObject *)self album];
      id v6 = [v4 objectForKey:@"MPModelRelationshipGenericAlbum"];
      id v7 = v6;
      if (!v6)
      {
        id v7 = +[MPPropertySet emptyPropertySet];
      }
      goto LABEL_25;
    case 3:
      uint64_t v5 = [(MPModelGenericObject *)self artist];
      id v6 = [v4 objectForKey:@"MPModelRelationshipGenericArtist"];
      id v7 = v6;
      if (!v6)
      {
        id v7 = +[MPPropertySet emptyPropertySet];
      }
      goto LABEL_25;
    case 4:
      uint64_t v5 = [(MPModelGenericObject *)self playlist];
      id v6 = [v4 objectForKey:@"MPModelRelationshipGenericPlaylist"];
      id v7 = v6;
      if (!v6)
      {
        id v7 = +[MPPropertySet emptyPropertySet];
      }
      goto LABEL_25;
    case 5:
      uint64_t v5 = [(MPModelGenericObject *)self playlistEntry];
      id v6 = [v4 objectForKey:@"MPModelRelationshipGenericPlaylistEntry"];
      id v7 = v6;
      if (!v6)
      {
        id v7 = +[MPPropertySet emptyPropertySet];
      }
      goto LABEL_25;
    case 6:
      uint64_t v5 = [(MPModelGenericObject *)self tvEpisode];
      id v6 = [v4 objectForKey:@"MPModelRelationshipGenericTVEpisode"];
      id v7 = v6;
      if (!v6)
      {
        id v7 = +[MPPropertySet emptyPropertySet];
      }
      goto LABEL_25;
    case 7:
      uint64_t v5 = [(MPModelGenericObject *)self season];
      id v6 = [v4 objectForKey:@"MPModelRelationshipGenericTVSeason"];
      id v7 = v6;
      if (!v6)
      {
        id v7 = +[MPPropertySet emptyPropertySet];
      }
      goto LABEL_25;
    case 9:
      uint64_t v5 = [(MPModelGenericObject *)self movie];
      id v6 = [v4 objectForKey:@"MPModelRelationshipGenericMovie"];
      id v7 = v6;
      if (!v6)
      {
        id v7 = +[MPPropertySet emptyPropertySet];
      }
LABEL_25:
      uint64_t v8 = [v5 personalizationScopedPropertiesForProperties:v7];
      if (!v6)
      {

        id v6 = 0;
      }

      if (!v8) {
        goto LABEL_28;
      }
      goto LABEL_29;
    default:
LABEL_28:
      uint64_t v8 = +[MPPropertySet emptyPropertySet];
LABEL_29:

      return v8;
  }
}

@end