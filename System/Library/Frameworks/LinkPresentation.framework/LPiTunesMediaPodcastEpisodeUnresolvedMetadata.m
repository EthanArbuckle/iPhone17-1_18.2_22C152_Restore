@interface LPiTunesMediaPodcastEpisodeUnresolvedMetadata
- (LPiTunesMediaAsset)artwork;
- (NSArray)offers;
- (NSString)artist;
- (NSString)episodeName;
- (NSString)podcastName;
- (NSString)releaseDate;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (id)assetsToFetch;
- (id)resolve;
- (void)setArtist:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setEpisodeName:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPodcastName:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaPodcastEpisodeUnresolvedMetadata

- (id)resolve
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(LPiTunesMediaPodcastEpisodeMetadata);
  [(LPiTunesMediaPodcastEpisodeMetadata *)v3 setStoreFrontIdentifier:self->_storeFrontIdentifier];
  [(LPiTunesMediaPodcastEpisodeMetadata *)v3 setStoreIdentifier:self->_storeIdentifier];
  [(LPiTunesMediaPodcastEpisodeMetadata *)v3 setEpisodeName:self->_episodeName];
  [(LPiTunesMediaPodcastEpisodeMetadata *)v3 setPodcastName:self->_podcastName];
  [(LPiTunesMediaPodcastEpisodeMetadata *)v3 setArtist:self->_artist];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateFormat:@"yyyy-MM-dd"];
  v5 = [v4 dateFromString:self->_releaseDate];
  [(LPiTunesMediaPodcastEpisodeMetadata *)v3 setReleaseDate:v5];

  v6 = [(LPiTunesMediaAsset *)self->_artwork metadata];
  [(LPiTunesMediaPodcastEpisodeMetadata *)v3 setArtworkMetadata:v6];

  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_offers;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasAudio", (void)v15) & 1) != 0 || objc_msgSend(v12, "hasVideo"))
        {
          v13 = [v12 type];
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(LPiTunesMediaPodcastEpisodeMetadata *)v3 setOffers:v7];

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

- (NSString)podcastName
{
  return self->_podcastName;
}

- (void)setPodcastName:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
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
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_podcastName, 0);
  objc_storeStrong((id *)&self->_episodeName, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end