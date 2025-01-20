@interface MusicKit_SoftLinking_MPModelSortDescriptor
+ (NSSortDescriptor)recentlyAddedModelObjectSortDescriptor;
+ (NSSortDescriptor)recentlyDownloadedModelObjectSortDescriptor;
- (MusicKit_SoftLinking_MPModelSortDescriptor)initWithKey:(id)a3 isAscending:(BOOL)a4;
- (MusicKit_SoftLinking_MPModelSortDescriptor)initWithKeyPath:(id)a3 isAscending:(BOOL)a4;
- (NSSortDescriptor)sortDescriptor;
- (void)setSortDescriptor:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelSortDescriptor

- (MusicKit_SoftLinking_MPModelSortDescriptor)initWithKey:(id)a3 isAscending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPModelSortDescriptor;
  v7 = [(MusicKit_SoftLinking_MPModelSortDescriptor *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08B30]) initWithKey:v6 ascending:v4];
    sortDescriptor = v7->_sortDescriptor;
    v7->_sortDescriptor = (NSSortDescriptor *)v8;
  }
  return v7;
}

- (MusicKit_SoftLinking_MPModelSortDescriptor)initWithKeyPath:(id)a3 isAscending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicKit_SoftLinking_MPModelSortDescriptor;
  v7 = [(MusicKit_SoftLinking_MPModelSortDescriptor *)&v13 init];
  if (v7)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    uint64_t v8 = (void *)getMPModelSortDescriptorClass_softClass;
    uint64_t v18 = getMPModelSortDescriptorClass_softClass;
    if (!getMPModelSortDescriptorClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getMPModelSortDescriptorClass_block_invoke;
      v14[3] = &unk_26443F950;
      v14[4] = &v15;
      __getMPModelSortDescriptorClass_block_invoke((uint64_t)v14);
      uint64_t v8 = (void *)v16[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v15, 8);
    uint64_t v10 = [v9 sortDescriptorWithKeyPath:v6 ascending:v4];
    sortDescriptor = v7->_sortDescriptor;
    v7->_sortDescriptor = (NSSortDescriptor *)v10;
  }
  return v7;
}

+ (NSSortDescriptor)recentlyAddedModelObjectSortDescriptor
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id MPMultiSortDescriptorClass = getMPMultiSortDescriptorClass();
  v3 = getMPModelRelationshipGenericAlbum_1();
  v27[0] = v3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  BOOL v4 = (id *)getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr_0;
  uint64_t v26 = getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr_0)
  {
    v5 = (void *)MediaPlayerLibrary_13();
    v24[3] = (uint64_t)dlsym(v5, "MPModelPropertyAlbumLibraryAddedDate");
    getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr_0 = v24[3];
    BOOL v4 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v4) {
    goto LABEL_16;
  }
  id v6 = *v4;
  v28[0] = v6;
  v7 = getMPModelRelationshipGenericMovie_1();
  v27[1] = v7;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v8 = (id *)getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr_0;
  uint64_t v26 = getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr_0)
  {
    id v9 = (void *)MediaPlayerLibrary_13();
    v24[3] = (uint64_t)dlsym(v9, "MPModelPropertyMovieLibraryAddedDate");
    getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr_0 = v24[3];
    uint64_t v8 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v8) {
    goto LABEL_16;
  }
  id v10 = *v8;
  v28[1] = v10;
  objc_super v11 = getMPModelRelationshipGenericPlaylist_1();
  v27[2] = v11;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v12 = (id *)getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr_0;
  uint64_t v26 = getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr_0)
  {
    objc_super v13 = (void *)MediaPlayerLibrary_13();
    v24[3] = (uint64_t)dlsym(v13, "MPModelPropertyPlaylistLibraryAddedDate");
    getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr_0 = v24[3];
    v12 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v12) {
    goto LABEL_16;
  }
  id v14 = *v12;
  v28[2] = v14;
  uint64_t v15 = getMPModelRelationshipGenericTVSeason_1();
  v27[3] = v15;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v16 = (id *)getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr_0;
  uint64_t v26 = getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr_0)
  {
    uint64_t v17 = (void *)MediaPlayerLibrary_13();
    v24[3] = (uint64_t)dlsym(v17, "MPModelPropertyTVSeasonLibraryAddedDate");
    getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr_0 = v24[3];
    v16 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v16)
  {
LABEL_16:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v29 = *v16;
  uint64_t v18 = NSDictionary;
  id v19 = v29;
  v20 = [v18 dictionaryWithObjects:v28 forKeys:v27 count:4];

  v21 = [MPMultiSortDescriptorClass sortDescriptorWithRelatedProperties:v20 ascending:0];

  return (NSSortDescriptor *)v21;
}

+ (NSSortDescriptor)recentlyDownloadedModelObjectSortDescriptor
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id MPMultiSortDescriptorClass = getMPMultiSortDescriptorClass();
  v3 = getMPModelRelationshipGenericAlbum_1();
  v27[0] = v3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  BOOL v4 = (id *)getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr_0;
  uint64_t v26 = getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr_0)
  {
    v5 = (void *)MediaPlayerLibrary_13();
    v24[3] = (uint64_t)dlsym(v5, "MPModelPropertyAlbumDownloadedDate");
    getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr_0 = v24[3];
    BOOL v4 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v4) {
    goto LABEL_16;
  }
  id v6 = *v4;
  v28[0] = v6;
  v7 = getMPModelRelationshipGenericMovie_1();
  v27[1] = v7;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v8 = (id *)getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr_0;
  uint64_t v26 = getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr_0)
  {
    id v9 = (void *)MediaPlayerLibrary_13();
    v24[3] = (uint64_t)dlsym(v9, "MPModelPropertyMovieDownloadedDate");
    getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr_0 = v24[3];
    uint64_t v8 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v8) {
    goto LABEL_16;
  }
  id v10 = *v8;
  v28[1] = v10;
  objc_super v11 = getMPModelRelationshipGenericPlaylist_1();
  v27[2] = v11;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v12 = (id *)getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr_0;
  uint64_t v26 = getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr_0)
  {
    objc_super v13 = (void *)MediaPlayerLibrary_13();
    v24[3] = (uint64_t)dlsym(v13, "MPModelPropertyPlaylistDownloadedDate");
    getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr_0 = v24[3];
    v12 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v12) {
    goto LABEL_16;
  }
  id v14 = *v12;
  v28[2] = v14;
  uint64_t v15 = getMPModelRelationshipGenericTVSeason_1();
  v27[3] = v15;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v16 = (id *)getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr_0;
  uint64_t v26 = getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr_0;
  if (!getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr_0)
  {
    uint64_t v17 = (void *)MediaPlayerLibrary_13();
    v24[3] = (uint64_t)dlsym(v17, "MPModelPropertyTVSeasonDownloadedDate");
    getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr_0 = v24[3];
    v16 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v16)
  {
LABEL_16:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    __break(1u);
  }
  id v29 = *v16;
  uint64_t v18 = NSDictionary;
  id v19 = v29;
  v20 = [v18 dictionaryWithObjects:v28 forKeys:v27 count:4];

  v21 = [MPMultiSortDescriptorClass sortDescriptorWithRelatedProperties:v20 ascending:0];

  return (NSSortDescriptor *)v21;
}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (void)setSortDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end