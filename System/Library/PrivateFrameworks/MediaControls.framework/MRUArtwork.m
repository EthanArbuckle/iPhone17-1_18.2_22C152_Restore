@interface MRUArtwork
- (BOOL)isEqual:(id)a3;
- (MPArtworkCatalog)catalog;
- (MPCPlayerResponse)response;
- (MRUArtwork)initWithImage:(id)a3;
- (MRUArtwork)initWithMPCResponse:(id)a3;
- (UIImage)image;
- (id)description;
- (void)setImage:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation MRUArtwork

- (MRUArtwork)initWithMPCResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUArtwork;
  v6 = [(MRUArtwork *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

- (MRUArtwork)initWithImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUArtwork;
  v6 = [(MRUArtwork *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRUArtwork *)self catalog];
  v6 = [v3 stringWithFormat:@"%@ catalog: %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRUArtwork *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(MRUArtwork *)v4 catalog];
      v6 = [v5 visualIdenticalityIdentifier];
      v7 = [(MRUArtwork *)self catalog];
      v8 = [v7 visualIdenticalityIdentifier];
      if (v6 == v8) {
        char v9 = 1;
      }
      else {
        char v9 = [v6 isEqual:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (MPArtworkCatalog)catalog
{
  if (self->_image)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F31860], "staticArtworkCatalogWithImage:");
  }
  else
  {
    v3 = [(MPCPlayerResponse *)self->_response tracklist];
    uint64_t v4 = [v3 playingItem];
    id v5 = [v4 metadataObject];
    v6 = [v5 song];
    v2 = [v6 artworkCatalog];
  }

  return (MPArtworkCatalog *)v2;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end