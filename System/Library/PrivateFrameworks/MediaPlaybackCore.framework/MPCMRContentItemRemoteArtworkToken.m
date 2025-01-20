@interface MPCMRContentItemRemoteArtworkToken
- (BOOL)isEqual:(id)a3;
- (MPArtworkCatalog)storeArtworkCatalog;
- (MPCMRContentItemRemoteArtworkToken)initWithIdentifier:(id)a3 artworkIdentifier:(id)a4 supportedRemoteArtworkFormats:(id)a5 remoteArtworks:(id)a6;
- (NSArray)supportedRemoteArtworkFormats;
- (NSDictionary)remoteArtworks;
- (NSString)artworkIdentifier;
- (NSString)identifier;
- (id)stringRepresentation;
- (void)setDestinationScale:(double)a3;
- (void)setFittingSize:(CGSize)a3;
- (void)setStoreArtworkCatalog:(id)a3;
@end

@implementation MPCMRContentItemRemoteArtworkToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeArtworkCatalog, 0);
  objc_storeStrong((id *)&self->_remoteArtworks, 0);
  objc_storeStrong((id *)&self->_supportedRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setStoreArtworkCatalog:(id)a3
{
}

- (MPArtworkCatalog)storeArtworkCatalog
{
  return self->_storeArtworkCatalog;
}

- (NSDictionary)remoteArtworks
{
  return self->_remoteArtworks;
}

- (NSArray)supportedRemoteArtworkFormats
{
  return self->_supportedRemoteArtworkFormats;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setDestinationScale:(double)a3
{
  id v4 = [(MPCMRContentItemRemoteArtworkToken *)self storeArtworkCatalog];
  [v4 setDestinationScale:a3];
}

- (void)setFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(MPCMRContentItemRemoteArtworkToken *)self storeArtworkCatalog];
  objc_msgSend(v5, "setFittingSize:", width, height);
}

- (id)stringRepresentation
{
  v2 = [(MPCMRContentItemRemoteArtworkToken *)self artworkIdentifier];
  v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MPCMRContentItemRemoteArtworkToken *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = self->_identifier;
      v7 = [(MPCMRContentItemRemoteArtworkToken *)v5 identifier];
      if (identifier == v7)
      {
      }
      else
      {
        int v8 = [(NSString *)identifier isEqual:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      artworkIdentifier = self->_artworkIdentifier;
      v11 = [(MPCMRContentItemRemoteArtworkToken *)v5 artworkIdentifier];
      if (artworkIdentifier == v11)
      {
      }
      else
      {
        int v12 = [(NSString *)artworkIdentifier isEqual:v11];

        if (!v12)
        {
          char v9 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      supportedRemoteArtworkFormats = self->_supportedRemoteArtworkFormats;
      v14 = [(MPCMRContentItemRemoteArtworkToken *)v5 supportedRemoteArtworkFormats];
      if (supportedRemoteArtworkFormats == v14)
      {
      }
      else
      {
        int v15 = [(NSArray *)supportedRemoteArtworkFormats isEqual:v14];

        if (!v15)
        {
          char v9 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      remoteArtworks = self->_remoteArtworks;
      v17 = [(MPCMRContentItemRemoteArtworkToken *)v5 remoteArtworks];
      if (remoteArtworks == v17) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSDictionary *)remoteArtworks isEqual:v17];
      }

      goto LABEL_21;
    }
    char v9 = 0;
  }
LABEL_24:

  return v9;
}

- (MPCMRContentItemRemoteArtworkToken)initWithIdentifier:(id)a3 artworkIdentifier:(id)a4 supportedRemoteArtworkFormats:(id)a5 remoteArtworks:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)MPCMRContentItemRemoteArtworkToken;
  v14 = [(MPCMRContentItemRemoteArtworkToken *)&v37 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    artworkIdentifier = v14->_artworkIdentifier;
    v14->_artworkIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    supportedRemoteArtworkFormats = v14->_supportedRemoteArtworkFormats;
    v14->_supportedRemoteArtworkFormats = (NSArray *)v19;

    objc_storeStrong((id *)&v14->_remoteArtworks, a6);
    v21 = v14->_remoteArtworks;
    if (![(NSDictionary *)v21 count])
    {
      v30 = 0;
LABEL_14:

      storeArtworkCatalog = v14->_storeArtworkCatalog;
      v14->_storeArtworkCatalog = v30;

      goto LABEL_15;
    }
    v22 = [(NSDictionary *)v21 objectForKeyedSubscript:*MEMORY[0x263F11B80]];
    v23 = v22;
    if (!v22) {
      goto LABEL_12;
    }
    v24 = [v22 artworkURLTemplateData];

    if (v24)
    {
      v25 = (void *)MEMORY[0x263F08900];
      v26 = [v23 artworkURLTemplateData];
      v27 = [v25 JSONObjectWithData:v26 options:0 error:0];

      if (v27)
      {
        v28 = (void *)[objc_alloc(MEMORY[0x263F89310]) initWithArtworkResponseDictionary:v27];

        if (v28) {
          goto LABEL_10;
        }
      }
    }
    v29 = [v23 artworkURLString];
    v30 = (MPArtworkCatalog *)[v29 length];

    if (!v30) {
      goto LABEL_13;
    }
    v31 = NSURL;
    v32 = [v23 artworkURLString];
    v30 = [v31 URLWithString:v32];

    if (!v30) {
      goto LABEL_13;
    }
    v28 = (void *)[objc_alloc(MEMORY[0x263F89310]) initWithArtworkURL:v30];

    if (v28)
    {
LABEL_10:
      v36 = [MEMORY[0x263F12258] tokenWithImageArtworkInfo:v28];
      v33 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
      v30 = (MPArtworkCatalog *)[objc_alloc(MEMORY[0x263F11D30]) initWithToken:v36 dataSource:v33];
    }
    else
    {
LABEL_12:
      v30 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

  return v14;
}

@end