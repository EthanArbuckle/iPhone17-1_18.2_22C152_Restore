@interface MPModelPlaylistEntriesShareEligibilityRequest
- (MPModelPlaylist)playlist;
- (MPModelPlaylistEntriesShareEligibilityRequest)initWithPlaylist:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
@end

@implementation MPModelPlaylistEntriesShareEligibilityRequest

- (void).cxx_destruct
{
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelPlaylistEntriesShareEligibilityRequestOperation);
  [(MPModelPlaylistEntriesShareEligibilityRequestOperation *)v5 setRequest:self];
  [(MPModelPlaylistEntriesShareEligibilityRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  playlist = self->_playlist;

  return (id)[v4 initWithPlaylist:playlist];
}

- (MPModelPlaylistEntriesShareEligibilityRequest)initWithPlaylist:(id)a3
{
  id v5 = a3;
  v6 = [(MPModelPlaylistEntriesShareEligibilityRequest *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playlist, a3);
  }

  return v7;
}

@end