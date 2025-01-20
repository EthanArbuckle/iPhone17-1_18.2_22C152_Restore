@interface MusicKit_SoftLinking_MPModelLibrarySearchResponse
+ (int64_t)_modelObjectTypeForLibrarySearchResultModelKind:(id)a3;
- (void)enumerateSectionLegacyObjectTypesUsingBlock:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibrarySearchResponse

- (void)enumerateSectionLegacyObjectTypesUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(MusicKit_SoftLinking_MPModelResponse *)self results];
  v6 = [v5 _underlyingSectionedCollection];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __97__MusicKit_SoftLinking_MPModelLibrarySearchResponse_enumerateSectionLegacyObjectTypesUsingBlock___block_invoke;
  v8[3] = &unk_264440480;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateSectionsUsingBlock:v8];
}

+ (int64_t)_modelObjectTypeForLibrarySearchResultModelKind:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v4 = (void *)getMPModelGenericObjectKindClass_softClass_0;
  uint64_t v26 = getMPModelGenericObjectKindClass_softClass_0;
  if (!getMPModelGenericObjectKindClass_softClass_0)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __getMPModelGenericObjectKindClass_block_invoke_0;
    v21 = &unk_26443F950;
    v22 = &v23;
    __getMPModelGenericObjectKindClass_block_invoke_0((uint64_t)&v18);
    id v4 = (void *)v24[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = 11;
  }
  else
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    id v7 = (void *)getMPModelAlbumKindClass_softClass_1;
    uint64_t v26 = getMPModelAlbumKindClass_softClass_1;
    if (!getMPModelAlbumKindClass_softClass_1)
    {
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelAlbumKindClass_block_invoke_1;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelAlbumKindClass_block_invoke_1((uint64_t)&v18);
      id v7 = (void *)v24[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v23, 8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v6 = 0;
    }
    else
    {
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      id v9 = (void *)getMPModelArtistKindClass_softClass;
      uint64_t v26 = getMPModelArtistKindClass_softClass;
      if (!getMPModelArtistKindClass_softClass)
      {
        uint64_t v18 = MEMORY[0x263EF8330];
        uint64_t v19 = 3221225472;
        v20 = __getMPModelArtistKindClass_block_invoke;
        v21 = &unk_26443F950;
        v22 = &v23;
        __getMPModelArtistKindClass_block_invoke((uint64_t)&v18);
        id v9 = (void *)v24[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v23, 8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v6 = 2;
      }
      else
      {
        uint64_t v23 = 0;
        v24 = &v23;
        uint64_t v25 = 0x2050000000;
        v11 = (void *)getMPModelComposerKindClass_softClass;
        uint64_t v26 = getMPModelComposerKindClass_softClass;
        if (!getMPModelComposerKindClass_softClass)
        {
          uint64_t v18 = MEMORY[0x263EF8330];
          uint64_t v19 = 3221225472;
          v20 = __getMPModelComposerKindClass_block_invoke;
          v21 = &unk_26443F950;
          v22 = &v23;
          __getMPModelComposerKindClass_block_invoke((uint64_t)&v18);
          v11 = (void *)v24[3];
        }
        id v12 = v11;
        _Block_object_dispose(&v23, 8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t v6 = 3;
        }
        else
        {
          uint64_t v23 = 0;
          v24 = &v23;
          uint64_t v25 = 0x2050000000;
          v13 = (void *)getMPModelMovieKindClass_softClass;
          uint64_t v26 = getMPModelMovieKindClass_softClass;
          if (!getMPModelMovieKindClass_softClass)
          {
            uint64_t v18 = MEMORY[0x263EF8330];
            uint64_t v19 = 3221225472;
            v20 = __getMPModelMovieKindClass_block_invoke;
            v21 = &unk_26443F950;
            v22 = &v23;
            __getMPModelMovieKindClass_block_invoke((uint64_t)&v18);
            v13 = (void *)v24[3];
          }
          id v14 = v13;
          _Block_object_dispose(&v23, 8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int64_t v6 = 13;
          }
          else
          {
            uint64_t v23 = 0;
            v24 = &v23;
            uint64_t v25 = 0x2050000000;
            v15 = (void *)getMPModelPlaylistKindClass_softClass_2;
            uint64_t v26 = getMPModelPlaylistKindClass_softClass_2;
            if (!getMPModelPlaylistKindClass_softClass_2)
            {
              uint64_t v18 = MEMORY[0x263EF8330];
              uint64_t v19 = 3221225472;
              v20 = __getMPModelPlaylistKindClass_block_invoke_2;
              v21 = &unk_26443F950;
              v22 = &v23;
              __getMPModelPlaylistKindClass_block_invoke_2((uint64_t)&v18);
              v15 = (void *)v24[3];
            }
            id v16 = v15;
            _Block_object_dispose(&v23, 8);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int64_t v6 = 15;
            }
            else
            {
              getMPModelSongKindClass_0();
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int64_t v6 = 30;
              }
              else
              {
                getMPModelTVEpisodeKindClass();
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  int64_t v6 = 31;
                }
                else {
                  int64_t v6 = 26;
                }
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

@end