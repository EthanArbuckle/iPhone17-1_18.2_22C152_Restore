@interface LPiTunesMediaAudioBookUnresolvedMetadata
- (LPiTunesMediaAsset)artwork;
- (NSArray)offers;
- (NSString)author;
- (NSString)name;
- (NSString)narrator;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (id)assetsToFetch;
- (id)resolve;
- (void)setArtwork:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setName:(id)a3;
- (void)setNarrator:(id)a3;
- (void)setOffers:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaAudioBookUnresolvedMetadata

- (id)resolve
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(LPiTunesMediaAudioBookMetadata);
  [(LPiTunesMediaAudioBookMetadata *)v3 setStoreFrontIdentifier:self->_storeFrontIdentifier];
  [(LPiTunesMediaAudioBookMetadata *)v3 setStoreIdentifier:self->_storeIdentifier];
  [(LPiTunesMediaAudioBookMetadata *)v3 setName:self->_name];
  [(LPiTunesMediaAudioBookMetadata *)v3 setNarrator:self->_narrator];
  [(LPiTunesMediaAudioBookMetadata *)v3 setAuthor:self->_author];
  v4 = [(LPiTunesMediaAsset *)self->_artwork metadata];
  [(LPiTunesMediaAudioBookMetadata *)v3 setArtworkMetadata:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_offers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "previewURL", (void)v14);
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          v12 = [v9 previewURL];
          [(LPiTunesMediaAudioBookMetadata *)v3 setPreviewURL:v12];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

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

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)narrator
{
  return self->_narrator;
}

- (void)setNarrator:(id)a3
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
  objc_storeStrong((id *)&self->_narrator, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end