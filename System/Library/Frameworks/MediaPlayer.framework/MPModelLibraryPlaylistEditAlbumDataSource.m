@interface MPModelLibraryPlaylistEditAlbumDataSource
- (MPModelLibraryPlaylistEditAlbumDataSource)initWithLibrary:(id)a3 album:(id)a4 trackProperties:(id)a5;
- (id)description;
- (void)loadEntriesWithCompletion:(id)a3;
@end

@implementation MPModelLibraryPlaylistEditAlbumDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackPropertySet, 0);
  objc_storeStrong((id *)&self->_album, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)loadEntriesWithCompletion:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[MPModelSong kindWithVariants:3];
  v6 = +[MPPropertySet emptyPropertySet];
  v7 = objc_alloc_init(MPModelLibraryRequest);
  v8 = [NSString stringWithFormat:@"%@ loading track list", self];
  [(MPModelRequest *)v7 setLabel:v8];

  v9 = +[MPModelAlbum kindWithSongKind:v5 options:0];
  [(MPModelRequest *)v7 setSectionKind:v9];

  [(MPModelRequest *)v7 setSectionProperties:v6];
  v17[0] = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v11 = +[MPModelPlaylistEntry kindWithKinds:v10];
  [(MPModelRequest *)v7 setItemKind:v11];

  [(MPModelRequest *)v7 setItemProperties:self->_trackPropertySet];
  album = self->_album;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&album count:1];
  [(MPModelLibraryRequest *)v7 setScopedContainers:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__MPModelLibraryPlaylistEditAlbumDataSource_loadEntriesWithCompletion___block_invoke;
  v14[3] = &unk_1E57F0CD8;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [(MPModelLibraryRequest *)v7 performWithResponseHandler:v14];
}

void __71__MPModelLibraryPlaylistEditAlbumDataSource_loadEntriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to album tracks from library. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = [a2 results];
    v9 = [v8 allItems];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__MPModelLibraryPlaylistEditAlbumDataSource_loadEntriesWithCompletion___block_invoke_22;
    v11[3] = &unk_1E57F0CB0;
    v11[4] = *(void *)(a1 + 32);
    v10 = objc_msgSend(v9, "msv_map:", v11);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __71__MPModelLibraryPlaylistEditAlbumDataSource_loadEntriesWithCompletion___block_invoke_22(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newPlaylistEntryForTrack:a2];

  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p : %@>{\n", objc_opt_class(), self, self->_album];
}

- (MPModelLibraryPlaylistEditAlbumDataSource)initWithLibrary:(id)a3 album:(id)a4 trackProperties:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 identifiers];
  uint64_t v13 = [v12 library];
  uint64_t v14 = [v13 persistentID];

  if (v14)
  {
    id v15 = NSString;
    uint64_t v16 = [v12 library];
    objc_msgSend(v15, "stringWithFormat:", @"l.%lld", objc_msgSend(v16, "persistentID"));
LABEL_5:
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v17 = [v12 universalStore];
  uint64_t v18 = [v17 adamID];

  if (v18)
  {
    v19 = NSString;
    uint64_t v16 = [v12 universalStore];
    objc_msgSend(v19, "stringWithFormat:", @"a.%lld", objc_msgSend(v16, "adamID"));
    goto LABEL_5;
  }
  v20 = @"u";
LABEL_6:
  v21 = NSString;
  v22 = MSVNanoIDCreateTaggedPointer();
  v23 = [v21 stringWithFormat:@"a-%@-%@", v20, v22];

  v29.receiver = self;
  v29.super_class = (Class)MPModelLibraryPlaylistEditAlbumDataSource;
  v24 = [(MPModelLibraryPlaylistEditDataSource *)&v29 initWithIdentifier:v23];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_library, a3);
    uint64_t v26 = [v10 copy];
    album = v25->_album;
    v25->_album = (MPModelAlbum *)v26;

    objc_storeStrong((id *)&v25->_trackPropertySet, a5);
  }

  return v25;
}

@end