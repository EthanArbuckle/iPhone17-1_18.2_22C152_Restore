@interface MPModelLibraryDuplicatePlaylistChangeRequest
- (MPMediaLibrary)mediaLibrary;
- (MPModelLibraryDuplicatePlaylistChangeRequest)initWithLibrary:(id)a3 playlist:(id)a4;
- (MPModelLibraryDuplicatePlaylistChangeRequest)initWithLibrary:(id)a3 playlistPersistentID:(int64_t)a4;
- (MPModelPlaylist)playlist;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (int64_t)playlistPersistentID;
- (void)performWithResponseHandler:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setPlaylistPersistentID:(int64_t)a3;
@end

@implementation MPModelLibraryDuplicatePlaylistChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlist, 0);

  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (void)setPlaylistPersistentID:(int64_t)a3
{
  self->_playlistPersistentID = a3;
}

- (int64_t)playlistPersistentID
{
  return self->_playlistPersistentID;
}

- (void)setPlaylist:(id)a3
{
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setMediaLibrary:(id)a3
{
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_mediaLibrary);
    objc_storeStrong((id *)(v5 + 16), self->_playlist);
    *(void *)(v5 + 24) = self->_playlistPersistentID;
  }
  return (id)v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = [(MPModelLibraryDuplicatePlaylistChangeRequest *)self newOperationWithResponseHandler:a3];
  v3 = +[MPModelLibraryChangeRequest sharedOperationQueue];
  [v3 addOperation:v4];
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(MPModelLibraryDuplicatePlaylistChangeRequestOperation);
  [(MPModelLibraryDuplicatePlaylistChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryDuplicatePlaylistChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (MPModelLibraryDuplicatePlaylistChangeRequest)initWithLibrary:(id)a3 playlistPersistentID:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPModelLibraryDuplicatePlaylistChangeRequest;
  v8 = [(MPModelLibraryDuplicatePlaylistChangeRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaLibrary, a3);
    v9->_playlistPersistentID = a4;
  }

  return v9;
}

- (MPModelLibraryDuplicatePlaylistChangeRequest)initWithLibrary:(id)a3 playlist:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPModelLibraryDuplicatePlaylistChangeRequest;
  v9 = [(MPModelLibraryDuplicatePlaylistChangeRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    objc_storeStrong((id *)&v10->_playlist, a4);
  }

  return v10;
}

@end