@interface LPiTunesMediaTVEpisodeUnresolvedMetadata
- (LPiTunesMediaAsset)artwork;
- (NSString)episodeName;
- (NSString)genre;
- (NSString)seasonName;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (id)assetsToFetch;
- (id)resolve;
- (void)setArtwork:(id)a3;
- (void)setEpisodeName:(id)a3;
- (void)setGenre:(id)a3;
- (void)setSeasonName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaTVEpisodeUnresolvedMetadata

- (id)resolve
{
  v3 = objc_alloc_init(LPiTunesMediaTVEpisodeMetadata);
  [(LPiTunesMediaTVEpisodeMetadata *)v3 setStoreFrontIdentifier:self->_storeFrontIdentifier];
  [(LPiTunesMediaTVEpisodeMetadata *)v3 setStoreIdentifier:self->_storeIdentifier];
  [(LPiTunesMediaTVEpisodeMetadata *)v3 setEpisodeName:self->_episodeName];
  [(LPiTunesMediaTVEpisodeMetadata *)v3 setSeasonName:self->_seasonName];
  [(LPiTunesMediaTVEpisodeMetadata *)v3 setGenre:self->_genre];
  v4 = [(LPiTunesMediaAsset *)self->_artwork metadata];
  [(LPiTunesMediaTVEpisodeMetadata *)v3 setArtworkMetadata:v4];

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

- (NSString)episodeName
{
  return self->_episodeName;
}

- (void)setEpisodeName:(id)a3
{
}

- (NSString)seasonName
{
  return self->_seasonName;
}

- (void)setSeasonName:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
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
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_seasonName, 0);
  objc_storeStrong((id *)&self->_episodeName, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end