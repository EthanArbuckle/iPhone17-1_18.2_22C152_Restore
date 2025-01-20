@interface NSObject(MusicKit_SoftLinking_MPModelObject_Artwork)
- (id)musicKit_artworkCatalogForProperty:()MusicKit_SoftLinking_MPModelObject_Artwork;
@end

@implementation NSObject(MusicKit_SoftLinking_MPModelObject_Artwork)

- (id)musicKit_artworkCatalogForProperty:()MusicKit_SoftLinking_MPModelObject_Artwork
{
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v5 = (void *)getMPModelObjectClass_softClass_2;
  uint64_t v28 = getMPModelObjectClass_softClass_2;
  if (!getMPModelObjectClass_softClass_2)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getMPModelObjectClass_block_invoke_2;
    v23 = &unk_26443F950;
    v24 = &v25;
    __getMPModelObjectClass_block_invoke_2((uint64_t)&v20);
    v5 = (void *)v26[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v25, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = 0;
    goto LABEL_22;
  }
  id v7 = a1;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v8 = (void *)getMPModelStoreBrowseContentItemClass_softClass_1;
  uint64_t v28 = getMPModelStoreBrowseContentItemClass_softClass_1;
  if (!getMPModelStoreBrowseContentItemClass_softClass_1)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getMPModelStoreBrowseContentItemClass_block_invoke_1;
    v23 = &unk_26443F950;
    v24 = &v25;
    __getMPModelStoreBrowseContentItemClass_block_invoke_1((uint64_t)&v20);
    v8 = (void *)v26[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v25, 8);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v7 innerObject];

    id v7 = (id)v10;
  }
  if (![v7 hasLoadedValueForKey:v4]) {
    goto LABEL_20;
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  v11 = (id *)getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr_0;
  uint64_t v28 = getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr_0;
  if (!getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr_0)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_block_invoke_0;
    v23 = &unk_26443F950;
    v24 = &v25;
    v12 = (void *)MediaPlayerLibrary_11();
    v13 = dlsym(v12, "MPModelPropertyPlaylistTracksTiledArtwork");
    *(void *)(v24[1] + 24) = v13;
    getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr_0 = *(void *)(v24[1] + 24);
    v11 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v11)
  {
    v19 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    _Block_object_dispose(&v25, 8);
    _Unwind_Resume(v19);
  }
  id v14 = *v11;
  if (![v4 isEqualToString:v14])
  {

LABEL_17:
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [v7 artworkCatalog];
      goto LABEL_19;
    }
LABEL_20:
    v17 = 0;
    goto LABEL_21;
  }
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v16 = [v7 tracksTiledArtworkCatalogWithRows:2 columns:2];
LABEL_19:
  v17 = (void *)v16;
LABEL_21:

LABEL_22:

  return v17;
}

@end