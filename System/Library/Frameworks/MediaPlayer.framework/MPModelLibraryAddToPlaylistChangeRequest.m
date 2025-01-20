@interface MPModelLibraryAddToPlaylistChangeRequest
- (MPModelObject)referralObject;
- (MPModelObject)representativeModelObject;
- (MPModelPlaylist)playlist;
- (MPSectionedCollection)songResults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (id)storeImportAllowedHandler;
- (void)setPlaylist:(id)a3;
- (void)setReferralObject:(id)a3;
- (void)setRepresentativeModelObject:(id)a3;
- (void)setSongResults:(id)a3;
- (void)setStoreImportAllowedHandler:(id)a3;
@end

@implementation MPModelLibraryAddToPlaylistChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_storeImportAllowedHandler, 0);
  objc_storeStrong((id *)&self->_songResults, 0);
  objc_storeStrong((id *)&self->_referralObject, 0);
  objc_storeStrong((id *)&self->_representativeModelObject, 0);

  objc_storeStrong((id *)&self->_playlist, 0);
}

- (void)setStoreImportAllowedHandler:(id)a3
{
}

- (id)storeImportAllowedHandler
{
  return self->_storeImportAllowedHandler;
}

- (void)setSongResults:(id)a3
{
}

- (MPSectionedCollection)songResults
{
  return self->_songResults;
}

- (void)setReferralObject:(id)a3
{
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void)setRepresentativeModelObject:(id)a3
{
}

- (MPModelObject)representativeModelObject
{
  return self->_representativeModelObject;
}

- (void)setPlaylist:(id)a3
{
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryAddToPlaylistChangeRequestOperation);
  [(MPModelLibraryAddToPlaylistChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryAddToPlaylistChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_representativeModelObject);
    objc_storeStrong((id *)(v5 + 24), self->_referralObject);
    objc_storeStrong((id *)(v5 + 8), self->_playlist);
    objc_storeStrong((id *)(v5 + 32), self->_songResults);
    uint64_t v6 = MEMORY[0x19971E0F0](self->_storeImportAllowedHandler);
    v7 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  return (id)v5;
}

@end