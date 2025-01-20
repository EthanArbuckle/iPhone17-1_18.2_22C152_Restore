@interface MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 authorDisplayName:(id)a7;
- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylistEntries:(id)a3 playlistName:(id)a4 playlistDescription:(id)a5 authorDisplayName:(id)a6;
- (void)sdk_performWithCompletionHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylistEntries:(id)a3 playlistName:(id)a4 playlistDescription:(id)a5 authorDisplayName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest;
  v14 = [(MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *)&v26 init];
  if (v14)
  {
    uint64_t v15 = +[MusicKit_SoftLinking_MPMediaLibrary deviceLibrary];
    mediaLibrary = v14->_mediaLibrary;
    v14->_mediaLibrary = (MusicKit_SoftLinking_MPMediaLibrary *)v15;

    v17 = (MPModelLibraryPlaylistEditChangeRequest *)objc_alloc_init((Class)getMPModelLibraryPlaylistEditChangeRequestClass());
    underlyingRequest = v14->_underlyingRequest;
    v14->_underlyingRequest = v17;

    v19 = v14->_underlyingRequest;
    v20 = [(MusicKit_SoftLinking_MPMediaLibrary *)v14->_mediaLibrary _underlyingMediaLibrary];
    [(MPModelLibraryPlaylistEditChangeRequest *)v19 setMediaLibrary:v20];

    [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest setShouldCreatePlaylist:1];
    if (v10)
    {
      v21 = objc_msgSend(v10, "msv_map:", &__block_literal_global_4);
      id v22 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
      [v22 appendSection:&stru_26CDBDE00];
      [v22 appendItems:v21];
      [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest setMusicKitPlaylistEntries:v22];
    }
    uint64_t v23 = MEMORY[0x263EFFA88];
    [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest setIsOwner:MEMORY[0x263EFFA88]];
    v24 = [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest playlist];
    [v24 setOwner:1];

    [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest setPlaylistName:v11];
    [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest setPlaylistDescription:v12];
    [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest setPublicPlaylist:v23];
    [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest setVisiblePlaylist:v23];
    [(MPModelLibraryPlaylistEditChangeRequest *)v14->_underlyingRequest setAuthorDisplayName:v13];
  }

  return v14;
}

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 authorDisplayName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest;
  v17 = [(MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *)&v29 init];
  if (v17)
  {
    uint64_t v18 = +[MusicKit_SoftLinking_MPMediaLibrary deviceLibrary];
    mediaLibrary = v17->_mediaLibrary;
    v17->_mediaLibrary = (MusicKit_SoftLinking_MPMediaLibrary *)v18;

    v20 = (MPModelLibraryPlaylistEditChangeRequest *)objc_alloc_init((Class)getMPModelLibraryPlaylistEditChangeRequestClass());
    underlyingRequest = v17->_underlyingRequest;
    v17->_underlyingRequest = v20;

    id v22 = v17->_underlyingRequest;
    uint64_t v23 = [(MusicKit_SoftLinking_MPMediaLibrary *)v17->_mediaLibrary _underlyingMediaLibrary];
    [(MPModelLibraryPlaylistEditChangeRequest *)v22 setMediaLibrary:v23];

    v24 = v17->_underlyingRequest;
    v25 = [v12 _underlyingModelObject];
    [(MPModelLibraryPlaylistEditChangeRequest *)v24 setPlaylist:v25];

    if (v13)
    {
      objc_super v26 = objc_msgSend(v13, "msv_map:", &__block_literal_global_3);
      id v27 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
      [v27 appendSection:&stru_26CDBDE00];
      [v27 appendItems:v26];
      [(MPModelLibraryPlaylistEditChangeRequest *)v17->_underlyingRequest setMusicKitPlaylistEntries:v27];
    }
    [(MPModelLibraryPlaylistEditChangeRequest *)v17->_underlyingRequest setPlaylistName:v14];
    [(MPModelLibraryPlaylistEditChangeRequest *)v17->_underlyingRequest setPlaylistDescription:v15];
    [(MPModelLibraryPlaylistEditChangeRequest *)v17->_underlyingRequest setAuthorDisplayName:v16];
  }

  return v17;
}

- (void)sdk_performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  underlyingRequest = self->_underlyingRequest;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __97__MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest_sdk_performWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_2644400A8;
  id v9 = v4;
  id v6 = v4;
  v7 = (void *)[(MPModelLibraryPlaylistEditChangeRequest *)underlyingRequest newSDKOperationWithLocalPersistenceResponseHandler:&__block_literal_global_6 completeResponseHandler:v8];
  [(MusicKit_SoftLinking_MPMediaLibrary *)self->_mediaLibrary performOperation:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);

  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

@end