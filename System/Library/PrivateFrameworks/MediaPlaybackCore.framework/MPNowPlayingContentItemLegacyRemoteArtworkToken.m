@interface MPNowPlayingContentItemLegacyRemoteArtworkToken
- (BOOL)isEqual:(id)a3;
- (MPExportableArtworkProperties)artworkProperties;
- (MPNowPlayingContentItemLegacyRemoteArtworkToken)initWithIdentifier:(id)a3 artworkProperties:(id)a4 artworkIdentifier:(id)a5;
- (NSString)artworkIdentifier;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringRepresentation;
@end

@implementation MPNowPlayingContentItemLegacyRemoteArtworkToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProperties, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MPExportableArtworkProperties)artworkProperties
{
  return self->_artworkProperties;
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
  v2 = [(MPNowPlayingContentItemLegacyRemoteArtworkToken *)self artworkIdentifier];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPNowPlayingContentItemLegacyRemoteArtworkToken alloc];
  v5 = [(MPNowPlayingContentItemLegacyRemoteArtworkToken *)self identifier];
  v6 = [(MPNowPlayingContentItemLegacyRemoteArtworkToken *)self artworkProperties];
  v7 = [(MPNowPlayingContentItemLegacyRemoteArtworkToken *)self artworkIdentifier];
  v8 = [(MPNowPlayingContentItemLegacyRemoteArtworkToken *)v4 initWithIdentifier:v5 artworkProperties:v6 artworkIdentifier:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPNowPlayingContentItemLegacyRemoteArtworkToken *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(NSString *)self->_identifier isEqualToString:v5->_identifier]
        && [(MPExportableArtworkProperties *)self->_artworkProperties isEqual:v5->_artworkProperties]&& [(NSString *)self->_artworkIdentifier isEqualToString:v5->_artworkIdentifier];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (MPNowPlayingContentItemLegacyRemoteArtworkToken)initWithIdentifier:(id)a3 artworkProperties:(id)a4 artworkIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPNowPlayingContentItemLegacyRemoteArtworkToken;
  v11 = [(MPNowPlayingContentItemLegacyRemoteArtworkToken *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    artworkProperties = v11->_artworkProperties;
    v11->_artworkProperties = (MPExportableArtworkProperties *)v14;

    uint64_t v16 = [v10 copy];
    artworkIdentifier = v11->_artworkIdentifier;
    v11->_artworkIdentifier = (NSString *)v16;
  }
  return v11;
}

@end