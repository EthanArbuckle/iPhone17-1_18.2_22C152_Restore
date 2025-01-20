@interface MusicKit_SoftLinking_MPModelLibrarySearchScope
+ (id)_topResultsRelationshipKeyForSpecificModelObjectType:(int64_t)a3;
+ (id)scopeForTopResultsWithSpecificModelObjectTypeScopes:(id)a3;
- (MusicKit_SoftLinking_MPModelLibrarySearchScope)initWithModelObjectType:(int64_t)a3;
- (id)_initWithUnderlyingSearchScope:(id)a3 modelObjectType:(int64_t)a4;
- (id)_underlyingSearchScope;
- (int64_t)_modelObjectType;
- (int64_t)modelObjectType;
@end

@implementation MusicKit_SoftLinking_MPModelLibrarySearchScope

- (id)_initWithUnderlyingSearchScope:(id)a3 modelObjectType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPModelLibrarySearchScope;
  v8 = [(MusicKit_SoftLinking_MPModelLibrarySearchScope *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_underlyingSearchScope, a3);
    v9->_modelObjectType = a4;
  }

  return v9;
}

- (MusicKit_SoftLinking_MPModelLibrarySearchScope)initWithModelObjectType:(int64_t)a3
{
  v5 = +[MusicKit_SoftLinking_MPModelRequest _supportedPropertiesForModelObjectType:](MusicKit_SoftLinking_MPModelRequest, "_supportedPropertiesForModelObjectType:");
  v6 = +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:a3];
  id v7 = (void *)[objc_alloc((Class)getMPModelLibrarySearchScopeClass()) initWithItemKind:v6 name:0 properties:v5];
  v8 = [(MusicKit_SoftLinking_MPModelLibrarySearchScope *)self _initWithUnderlyingSearchScope:v7 modelObjectType:a3];

  return v8;
}

+ (id)scopeForTopResultsWithSpecificModelObjectTypeScopes:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_super v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v12 = objc_msgSend(a1, "_topResultsRelationshipKeyForSpecificModelObjectType:", objc_msgSend(v11, "_modelObjectType", (void)v28));
        if (v12)
        {
          v13 = [v11 _underlyingSearchScope];
          v14 = [v13 itemKind];
          [v5 setObject:v14 forKeyedSubscript:v12];

          v15 = [v13 itemProperties];
          [v6 setObject:v15 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v8);
  }

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v16 = (void *)getMPModelGenericObjectClass_softClass;
  uint64_t v40 = getMPModelGenericObjectClass_softClass;
  if (!getMPModelGenericObjectClass_softClass)
  {
    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 3221225472;
    v34 = __getMPModelGenericObjectClass_block_invoke;
    v35 = &unk_26443F950;
    v36 = &v37;
    __getMPModelGenericObjectClass_block_invoke((uint64_t)&v32);
    v16 = (void *)v38[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v37, 8);
  v18 = (void *)[v5 copy];
  v19 = [v17 kindWithRelationshipKinds:v18];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v20 = (void *)getMPPropertySetClass_softClass;
  uint64_t v40 = getMPPropertySetClass_softClass;
  if (!getMPPropertySetClass_softClass)
  {
    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 3221225472;
    v34 = __getMPPropertySetClass_block_invoke;
    v35 = &unk_26443F950;
    v36 = &v37;
    __getMPPropertySetClass_block_invoke((uint64_t)&v32);
    v20 = (void *)v38[3];
  }
  v21 = v20;
  _Block_object_dispose(&v37, 8);
  id v22 = [v21 alloc];
  v23 = (void *)[v6 copy];
  v24 = (void *)[v22 initWithProperties:MEMORY[0x263EFFA68] relationships:v23];

  v25 = (void *)[objc_alloc((Class)getMPModelLibrarySearchScopeClass()) initWithItemKind:v19 name:0 properties:v24];
  v26 = (void *)[objc_alloc((Class)a1) _initWithUnderlyingSearchScope:v25 modelObjectType:11];

  return v26;
}

- (id)_underlyingSearchScope
{
  return self->_underlyingSearchScope;
}

- (int64_t)_modelObjectType
{
  return self->_modelObjectType;
}

+ (id)_topResultsRelationshipKeyForSpecificModelObjectType:(int64_t)a3
{
  id v3 = 0;
  if (a3 <= 14)
  {
    if (a3 > 12)
    {
      if (a3 != 13) {
        goto LABEL_21;
      }
LABEL_30:
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      id v4 = (id *)getMPModelRelationshipGenericMovieSymbolLoc_ptr;
      uint64_t v15 = getMPModelRelationshipGenericMovieSymbolLoc_ptr;
      if (!getMPModelRelationshipGenericMovieSymbolLoc_ptr)
      {
        uint64_t v9 = (void *)MediaPlayerLibrary();
        v13[3] = (uint64_t)dlsym(v9, "MPModelRelationshipGenericMovie");
        getMPModelRelationshipGenericMovieSymbolLoc_ptr = v13[3];
        id v4 = (id *)v13[3];
      }
      _Block_object_dispose(&v12, 8);
      if (!v4)
      {
        objc_super v11 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
        _Block_object_dispose(&v12, 8);
        _Unwind_Resume(v11);
      }
      goto LABEL_33;
    }
    if (!a3)
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      id v4 = (id *)getMPModelRelationshipGenericAlbumSymbolLoc_ptr;
      uint64_t v15 = getMPModelRelationshipGenericAlbumSymbolLoc_ptr;
      if (!getMPModelRelationshipGenericAlbumSymbolLoc_ptr)
      {
        id v7 = (void *)MediaPlayerLibrary();
        v13[3] = (uint64_t)dlsym(v7, "MPModelRelationshipGenericAlbum");
        getMPModelRelationshipGenericAlbumSymbolLoc_ptr = v13[3];
        id v4 = (id *)v13[3];
      }
      _Block_object_dispose(&v12, 8);
      if (v4) {
        goto LABEL_33;
      }
      +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
LABEL_26:
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      id v4 = (id *)getMPModelRelationshipGenericPlaylistSymbolLoc_ptr;
      uint64_t v15 = getMPModelRelationshipGenericPlaylistSymbolLoc_ptr;
      if (!getMPModelRelationshipGenericPlaylistSymbolLoc_ptr)
      {
        uint64_t v8 = (void *)MediaPlayerLibrary();
        v13[3] = (uint64_t)dlsym(v8, "MPModelRelationshipGenericPlaylist");
        getMPModelRelationshipGenericPlaylistSymbolLoc_ptr = v13[3];
        id v4 = (id *)v13[3];
      }
      _Block_object_dispose(&v12, 8);
      if (v4) {
        goto LABEL_33;
      }
      +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
      goto LABEL_30;
    }
    if (a3 != 2) {
      goto LABEL_34;
    }
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    id v4 = (id *)getMPModelRelationshipGenericArtistSymbolLoc_ptr;
    uint64_t v15 = getMPModelRelationshipGenericArtistSymbolLoc_ptr;
    if (!getMPModelRelationshipGenericArtistSymbolLoc_ptr)
    {
      id v5 = (void *)MediaPlayerLibrary();
      v13[3] = (uint64_t)dlsym(v5, "MPModelRelationshipGenericArtist");
      getMPModelRelationshipGenericArtistSymbolLoc_ptr = v13[3];
      id v4 = (id *)v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (v4) {
      goto LABEL_33;
    }
    id v3 = (id)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
  }
  if (a3 > 29)
  {
    if (a3 == 30) {
      goto LABEL_21;
    }
    if (a3 != 31) {
      goto LABEL_34;
    }
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    id v4 = (id *)getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr;
    uint64_t v15 = getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr;
    if (!getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr)
    {
      id v6 = (void *)MediaPlayerLibrary();
      v13[3] = (uint64_t)dlsym(v6, "MPModelRelationshipGenericTVEpisode");
      getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr = v13[3];
      id v4 = (id *)v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v4)
    {
      +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
      goto LABEL_21;
    }
LABEL_33:
    id v3 = *v4;
    goto LABEL_34;
  }
  if (a3 == 15) {
    goto LABEL_26;
  }
  if (a3 == 26)
  {
LABEL_21:
    getMPModelRelationshipGenericSong();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_34:

  return v3;
}

- (int64_t)modelObjectType
{
  return self->_modelObjectType;
}

- (void).cxx_destruct
{
}

+ (uint64_t)_topResultsRelationshipKeyForSpecificModelObjectType:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getMPModelLibrarySearchScopeClass_block_invoke_cold_1(v0);
}

@end