@interface _MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)imageArtworkIdentifier;
- (NSString)videoArtworkIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringRepresentation;
- (void)setImageArtworkIdentifier:(id)a3;
- (void)setVideoArtworkIdentifier:(id)a3;
@end

@implementation _MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoArtworkIdentifier, 0);

  objc_storeStrong((id *)&self->_imageArtworkIdentifier, 0);
}

- (void)setVideoArtworkIdentifier:(id)a3
{
}

- (NSString)videoArtworkIdentifier
{
  return self->_videoArtworkIdentifier;
}

- (void)setImageArtworkIdentifier:(id)a3
{
}

- (NSString)imageArtworkIdentifier
{
  return self->_imageArtworkIdentifier;
}

- (id)stringRepresentation
{
  v3 = [(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *)self imageArtworkIdentifier];
  v4 = (void *)[v3 copy];

  v5 = [(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *)self videoArtworkIdentifier];
  v6 = (void *)[v5 copy];

  v7 = [NSString stringWithFormat:@"i=%@/v=%@", v4, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier);
  [(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *)v4 setImageArtworkIdentifier:self->_imageArtworkIdentifier];
  [(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *)v4 setVideoArtworkIdentifier:self->_videoArtworkIdentifier];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      imageArtworkIdentifier = self->_imageArtworkIdentifier;
      v7 = v5->_imageArtworkIdentifier;
      if (imageArtworkIdentifier == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = imageArtworkIdentifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      videoArtworkIdentifier = self->_videoArtworkIdentifier;
      v13 = v5->_videoArtworkIdentifier;
      v14 = videoArtworkIdentifier;
      v15 = v14;
      if (v14 == v13) {
        char v11 = 1;
      }
      else {
        char v11 = [(NSString *)v14 isEqual:v13];
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

@end