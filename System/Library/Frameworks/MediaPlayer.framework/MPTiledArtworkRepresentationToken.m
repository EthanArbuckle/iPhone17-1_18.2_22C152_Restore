@interface MPTiledArtworkRepresentationToken
- (NSArray)tileArtworkVisualIdenticalityIdentifiers;
- (NSCopying)revisionIdentifier;
- (void)setRevisionIdentifier:(id)a3;
- (void)setTileArtworkVisualIdenticalityIdentifiers:(id)a3;
@end

@implementation MPTiledArtworkRepresentationToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileArtworkVisualIdenticalityIdentifiers, 0);

  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
}

- (void)setTileArtworkVisualIdenticalityIdentifiers:(id)a3
{
}

- (NSArray)tileArtworkVisualIdenticalityIdentifiers
{
  return self->_tileArtworkVisualIdenticalityIdentifiers;
}

- (void)setRevisionIdentifier:(id)a3
{
}

- (NSCopying)revisionIdentifier
{
  return self->_revisionIdentifier;
}

@end