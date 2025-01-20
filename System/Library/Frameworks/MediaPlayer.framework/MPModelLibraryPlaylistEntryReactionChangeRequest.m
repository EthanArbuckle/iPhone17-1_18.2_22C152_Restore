@interface MPModelLibraryPlaylistEntryReactionChangeRequest
- (MPModelLibraryPlaylistEntryReactionChangeRequest)initWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5;
- (MPModelPlaylist)playlist;
- (MPModelPlaylistEntry)playlistEntry;
- (NSString)reactionText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)performWithResponseHandler:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setPlaylistEntry:(id)a3;
- (void)setReactionText:(id)a3;
@end

@implementation MPModelLibraryPlaylistEntryReactionChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactionText, 0);
  objc_storeStrong((id *)&self->_playlistEntry, 0);

  objc_storeStrong((id *)&self->_playlist, 0);
}

- (void)setReactionText:(id)a3
{
}

- (NSString)reactionText
{
  return self->_reactionText;
}

- (void)setPlaylistEntry:(id)a3
{
}

- (MPModelPlaylistEntry)playlistEntry
{
  return self->_playlistEntry;
}

- (void)setPlaylist:(id)a3
{
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_playlist);
    objc_storeStrong(v5 + 2, self->_playlistEntry);
    objc_storeStrong(v5 + 3, self->_reactionText);
  }
  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = [(MPModelLibraryPlaylistEntryReactionChangeRequest *)self newOperationWithResponseHandler:a3];
  v3 = +[MPModelLibraryChangeRequest sharedOperationQueue];
  [v3 addOperation:v4];
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryPlaylistEntryReactionChangeRequestOperation);
  [(MPModelLibraryPlaylistEntryReactionChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryPlaylistEntryReactionChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (MPModelLibraryPlaylistEntryReactionChangeRequest)initWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(MPModelLibraryPlaylistEntryReactionChangeRequest *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_playlist, a3);
    objc_storeStrong((id *)&v13->_playlistEntry, a4);
    objc_storeStrong((id *)&v13->_reactionText, a5);
  }

  return v13;
}

@end