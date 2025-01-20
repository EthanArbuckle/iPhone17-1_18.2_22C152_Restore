@interface LPiTunesMediaAsset
- (LPFetcher)fetcher;
- (LPiTunesMediaAsset)initWithImageURL:(id)a3 colors:(id)a4 name:(id)a5;
- (LPiTunesMediaAsset)initWithName:(id)a3 curatorID:(id)a4;
- (LPiTunesMediaAsset)initWithName:(id)a3 lyricComponents:(id)a4;
- (LPiTunesMediaAsset)initWithVideoURL:(id)a3 name:(id)a4;
- (NSDictionary)colors;
- (NSString)name;
- (NSURL)URL;
- (id)metadata;
@end

@implementation LPiTunesMediaAsset

- (LPiTunesMediaAsset)initWithImageURL:(id)a3 colors:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LPiTunesMediaAsset;
  v12 = [(LPiTunesMediaAsset *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeStrong((id *)&v13->_colors, a4);
    objc_storeStrong((id *)&v13->_name, a5);
    v13->_type = 0;
    v14 = v13;
  }

  return v13;
}

- (LPiTunesMediaAsset)initWithVideoURL:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPiTunesMediaAsset;
  id v9 = [(LPiTunesMediaAsset *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    v10->_type = 1;
    id v11 = v10;
  }

  return v10;
}

- (LPiTunesMediaAsset)initWithName:(id)a3 lyricComponents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPiTunesMediaAsset;
  id v9 = [(LPiTunesMediaAsset *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_lyricComponents, a4);
    v10->_type = 2;
    id v11 = v10;
  }

  return v10;
}

- (LPiTunesMediaAsset)initWithName:(id)a3 curatorID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPiTunesMediaAsset;
  id v9 = [(LPiTunesMediaAsset *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_curatorID, a4);
    v10->_type = 3;
    id v11 = v10;
  }

  return v10;
}

- (id)metadata
{
  v3 = objc_alloc_init(LPArtworkMetadata);
  [(LPArtworkMetadata *)v3 setURL:self->_URL];
  [(LPArtworkMetadata *)v3 setColors:self->_colors];

  return v3;
}

- (LPFetcher)fetcher
{
  switch(self->_type)
  {
    case 0:
      v2 = objc_alloc_init(LPImageFetcher);
      [(LPImageFetcher *)v2 setURL:self->_URL];
      [(LPFetcher *)v2 setUserData:self];
      [(LPFetcher *)v2 setResponseClass:objc_opt_class()];
      break;
    case 1:
      v2 = objc_alloc_init(LPMediaAssetFetcher);
      [(LPImageFetcher *)v2 setURL:self->_URL];
      [(LPFetcher *)v2 setUserData:self];
      break;
    case 2:
      v2 = objc_alloc_init(LPAppleMusicLyricExcerptFetcher);
      [(LPImageFetcher *)v2 setLyricComponents:self->_lyricComponents];
      [(LPFetcher *)v2 setUserData:self];
      break;
    case 3:
      v2 = [[LPiTunesCuratorProfileURLFetcher alloc] initWithCuratorID:self->_curatorID];
      [(LPFetcher *)v2 setUserData:self];
      break;
    default:
      break;
  }

  return (LPFetcher *)v2;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDictionary)colors
{
  return self->_colors;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_curatorID, 0);

  objc_storeStrong((id *)&self->_lyricComponents, 0);
}

@end