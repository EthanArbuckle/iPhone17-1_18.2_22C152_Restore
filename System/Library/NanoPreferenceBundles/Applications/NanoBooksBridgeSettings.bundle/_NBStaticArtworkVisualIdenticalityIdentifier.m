@interface _NBStaticArtworkVisualIdenticalityIdentifier
- (BOOL)isEqual:(id)a3;
- (_NBStaticArtworkVisualIdenticalityIdentifier)initWithArtworkIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringRepresentation;
@end

@implementation _NBStaticArtworkVisualIdenticalityIdentifier

- (_NBStaticArtworkVisualIdenticalityIdentifier)initWithArtworkIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NBStaticArtworkVisualIdenticalityIdentifier;
  v5 = [(_NBStaticArtworkVisualIdenticalityIdentifier *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    artworkIdentifier = v5->_artworkIdentifier;
    v5->_artworkIdentifier = v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_NBStaticArtworkVisualIdenticalityIdentifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(NSString *)self->_artworkIdentifier isEqualToString:v4->_artworkIdentifier];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_NBStaticArtworkVisualIdenticalityIdentifier allocWithZone:a3];
  artworkIdentifier = self->_artworkIdentifier;

  return [(_NBStaticArtworkVisualIdenticalityIdentifier *)v4 initWithArtworkIdentifier:artworkIdentifier];
}

- (id)stringRepresentation
{
  return self->_artworkIdentifier;
}

- (void).cxx_destruct
{
}

@end