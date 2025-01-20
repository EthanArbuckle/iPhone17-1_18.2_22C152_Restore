@interface LPiTunesMediaPlaylistUnresolvedMetadata
- (LPiTunesMediaAsset)artwork;
- (NSString)curator;
- (NSString)curatorHandle;
- (NSString)curatorID;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (id)assetsToFetch;
- (id)resolve;
- (void)setArtwork:(id)a3;
- (void)setCurator:(id)a3;
- (void)setCuratorHandle:(id)a3;
- (void)setCuratorID:(id)a3;
- (void)setName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaPlaylistUnresolvedMetadata

- (id)resolve
{
  v3 = objc_alloc_init(LPiTunesMediaPlaylistMetadata);
  [(LPiTunesMediaPlaylistMetadata *)v3 setStoreFrontIdentifier:self->_storeFrontIdentifier];
  [(LPiTunesMediaPlaylistMetadata *)v3 setStoreIdentifier:self->_storeIdentifier];
  [(LPiTunesMediaPlaylistMetadata *)v3 setName:self->_name];
  [(LPiTunesMediaPlaylistMetadata *)v3 setCurator:self->_curator];
  [(LPiTunesMediaPlaylistMetadata *)v3 setCuratorHandle:self->_curatorHandle];
  v4 = [(LPiTunesMediaAsset *)self->_artwork metadata];
  [(LPiTunesMediaPlaylistMetadata *)v3 setArtworkMetadata:v4];

  return v3;
}

- (id)assetsToFetch
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = v3;
  if (self->_artwork) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_curatorID)
  {
    v5 = [[LPiTunesMediaAsset alloc] initWithName:@"curatorProfileURL" curatorID:self->_curatorID];
    [v4 addObject:v5];
  }

  return v4;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
}

- (NSString)curatorHandle
{
  return self->_curatorHandle;
}

- (void)setCuratorHandle:(id)a3
{
}

- (NSString)curatorID
{
  return self->_curatorID;
}

- (void)setCuratorID:(id)a3
{
}

- (LPiTunesMediaAsset)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_curatorID, 0);
  objc_storeStrong((id *)&self->_curatorHandle, 0);
  objc_storeStrong((id *)&self->_curator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end