@interface LPiTunesMediaAlbumUnresolvedMetadata
- (LPiTunesMediaAsset)artwork;
- (NSArray)offers;
- (NSString)artist;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (id)assetsToFetch;
- (id)resolve;
- (void)setArtist:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setName:(id)a3;
- (void)setOffers:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaAlbumUnresolvedMetadata

- (id)resolve
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(LPiTunesMediaAlbumMetadata);
  [(LPiTunesMediaAlbumMetadata *)v3 setStoreFrontIdentifier:self->_storeFrontIdentifier];
  [(LPiTunesMediaAlbumMetadata *)v3 setStoreIdentifier:self->_storeIdentifier];
  [(LPiTunesMediaAlbumMetadata *)v3 setName:self->_name];
  [(LPiTunesMediaAlbumMetadata *)v3 setArtist:self->_artist];
  v4 = [(LPiTunesMediaAsset *)self->_artwork metadata];
  [(LPiTunesMediaAlbumMetadata *)v3 setArtworkMetadata:v4];

  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_offers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "type", (void)v12);
        [v5 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(LPiTunesMediaAlbumMetadata *)v3 setOffers:v5];

  return v3;
}

- (id)assetsToFetch
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_artwork)
  {
    v4[0] = self->_artwork;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v2;
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

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (LPiTunesMediaAsset)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end