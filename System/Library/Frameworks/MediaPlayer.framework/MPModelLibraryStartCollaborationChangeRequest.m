@interface MPModelLibraryStartCollaborationChangeRequest
- (MPModelPlaylist)playlistToConvert;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (int64_t)collaborationSharingMode;
- (void)performWithResponseHandler:(id)a3;
- (void)setCollaborationSharingMode:(int64_t)a3;
- (void)setPlaylistToConvert:(id)a3;
@end

@implementation MPModelLibraryStartCollaborationChangeRequest

- (void).cxx_destruct
{
}

- (void)setCollaborationSharingMode:(int64_t)a3
{
  self->_collaborationSharingMode = a3;
}

- (int64_t)collaborationSharingMode
{
  return self->_collaborationSharingMode;
}

- (void)setPlaylistToConvert:(id)a3
{
}

- (MPModelPlaylist)playlistToConvert
{
  return self->_playlistToConvert;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = [(MPModelLibraryStartCollaborationChangeRequest *)self newOperationWithResponseHandler:a3];
  v3 = +[MPModelLibraryChangeRequest sharedOperationQueue];
  [v3 addOperation:v4];
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryStartCollaborationChangeRequestOperation);
  [(MPModelLibraryStartCollaborationChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryStartCollaborationChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 1, self->_playlistToConvert);
    v5[2] = self->_collaborationSharingMode;
  }
  return v5;
}

@end