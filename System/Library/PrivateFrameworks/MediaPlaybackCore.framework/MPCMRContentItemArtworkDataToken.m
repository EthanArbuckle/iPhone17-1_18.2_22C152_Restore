@interface MPCMRContentItemArtworkDataToken
- (BOOL)isEqual:(id)a3;
- (MPCMRContentItemArtworkDataToken)initWithIdentifier:(id)a3 artworkIdentifier:(id)a4;
- (NSString)artworkIdentifier;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringRepresentation;
@end

@implementation MPCMRContentItemArtworkDataToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)stringRepresentation
{
  v2 = [(MPCMRContentItemArtworkDataToken *)self artworkIdentifier];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPCMRContentItemArtworkDataToken alloc];
  v5 = [(MPCMRContentItemArtworkDataToken *)self identifier];
  v6 = [(MPCMRContentItemArtworkDataToken *)self artworkIdentifier];
  v7 = [(MPCMRContentItemArtworkDataToken *)v4 initWithIdentifier:v5 artworkIdentifier:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPCMRContentItemArtworkDataToken *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(NSString *)self->_identifier isEqual:v5->_identifier]) {
        char v6 = [(NSString *)self->_artworkIdentifier isEqual:v5->_artworkIdentifier];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (MPCMRContentItemArtworkDataToken)initWithIdentifier:(id)a3 artworkIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPCMRContentItemArtworkDataToken;
  v8 = [(MPCMRContentItemArtworkDataToken *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    artworkIdentifier = v8->_artworkIdentifier;
    v8->_artworkIdentifier = (NSString *)v11;
  }
  return v8;
}

@end