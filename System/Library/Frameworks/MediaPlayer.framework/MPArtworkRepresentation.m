@interface MPArtworkRepresentation
+ (id)representationForVisualIdentity:(id)a3 withSize:(CGSize)a4 image:(id)a5;
+ (id)representationForVisualIdentity:(id)a3 withSize:(CGSize)a4 video:(id)a5;
+ (id)representationWithSize:(CGSize)a3 image:(id)a4;
+ (id)representationWithSize:(CGSize)a3 video:(id)a4;
- (AVAsset)video;
- (BOOL)isImagePrepared;
- (CGSize)representationSize;
- (MPArtworkRepresentation)representationWithPreparedImage:(id)a3;
- (NSString)visualIdenticalityStringRepresentation;
- (UIImage)image;
- (id)representationToken;
- (int64_t)kind;
- (void)setImage:(id)a3;
- (void)setImagePrepared:(BOOL)a3;
- (void)setKind:(int64_t)a3;
- (void)setRepresentationSize:(CGSize)a3;
- (void)setRepresentationToken:(id)a3;
- (void)setVideo:(id)a3;
@end

@implementation MPArtworkRepresentation

- (BOOL)isImagePrepared
{
  return self->_imagePrepared;
}

- (MPArtworkRepresentation)representationWithPreparedImage:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  objc_msgSend(v5, "setKind:", -[MPArtworkRepresentation kind](self, "kind"));
  [v5 setImage:v4];

  [(MPArtworkRepresentation *)self representationSize];
  objc_msgSend(v5, "setRepresentationSize:");
  v6 = [(MPArtworkRepresentation *)self representationToken];
  [v5 setRepresentationToken:v6];

  [v5 setImagePrepared:1];
  uint64_t v7 = [(MPArtworkRepresentation *)self visualIdenticalityStringRepresentation];
  v8 = (void *)v5[5];
  v5[5] = v7;

  return (MPArtworkRepresentation *)v5;
}

+ (id)representationForVisualIdentity:(id)a3 withSize:(CGSize)a4 image:(id)a5
{
  if (a5)
  {
    double height = a4.height;
    double width = a4.width;
    id v8 = a5;
    id v9 = a3;
    v10 = objc_alloc_init(MPArtworkRepresentation);
    [(MPArtworkRepresentation *)v10 setKind:0];
    [(MPArtworkRepresentation *)v10 setImage:v8];

    -[MPArtworkRepresentation setRepresentationSize:](v10, "setRepresentationSize:", width, height);
    uint64_t v11 = [v9 stringRepresentation];

    visualIdenticalityStringRepresentation = v10->_visualIdenticalityStringRepresentation;
    v10->_visualIdenticalityStringRepresentation = (NSString *)v11;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setRepresentationSize:(CGSize)a3
{
  self->_representationSize = a3;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (void)setImage:(id)a3
{
}

- (CGSize)representationSize
{
  double width = self->_representationSize.width;
  double height = self->_representationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setRepresentationToken:(id)a3
{
}

- (id)representationToken
{
  return self->_representationToken;
}

- (NSString)visualIdenticalityStringRepresentation
{
  return self->_visualIdenticalityStringRepresentation;
}

- (void)setImagePrepared:(BOOL)a3
{
  self->_imagePrepared = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representationToken, 0);
  objc_storeStrong((id *)&self->_visualIdenticalityStringRepresentation, 0);
  objc_storeStrong((id *)&self->_video, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setVideo:(id)a3
{
}

- (AVAsset)video
{
  return self->_video;
}

+ (id)representationForVisualIdentity:(id)a3 withSize:(CGSize)a4 video:(id)a5
{
  if (a5)
  {
    double height = a4.height;
    double width = a4.width;
    id v8 = a5;
    id v9 = a3;
    v10 = objc_alloc_init(MPArtworkRepresentation);
    [(MPArtworkRepresentation *)v10 setKind:1];
    [(MPArtworkRepresentation *)v10 setVideo:v8];

    -[MPArtworkRepresentation setRepresentationSize:](v10, "setRepresentationSize:", width, height);
    uint64_t v11 = [v9 stringRepresentation];

    visualIdenticalityStringRepresentation = v10->_visualIdenticalityStringRepresentation;
    v10->_visualIdenticalityStringRepresentation = (NSString *)v11;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)representationWithSize:(CGSize)a3 video:(id)a4
{
  return (id)objc_msgSend(a1, "representationForVisualIdentity:withSize:video:", &stru_1EE680640, a4, a3.width, a3.height);
}

+ (id)representationWithSize:(CGSize)a3 image:(id)a4
{
  return (id)objc_msgSend(a1, "representationForVisualIdentity:withSize:image:", &stru_1EE680640, a4, a3.width, a3.height);
}

@end