@interface MPMediaItemArtwork
- (CGRect)bounds;
- (MPMediaItemArtwork)init;
- (MPMediaItemArtwork)initWithBoundsSize:(CGSize)boundsSize requestHandler:(void *)requestHandler;
- (MPMediaItemArtwork)initWithImage:(UIImage *)image;
- (UIImage)imageWithSize:(CGSize)size;
- (id)jpegDataWithSize:(CGSize)a3;
- (id)pngDataWithSize:(CGSize)a3;
@end

@implementation MPMediaItemArtwork

- (void).cxx_destruct
{
}

- (id)pngDataWithSize:(CGSize)a3
{
  -[MPMediaItemArtwork imageWithSize:](self, "imageWithSize:", a3.width, a3.height);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v4 = UIImagePNGRepresentation(v3);

  return v4;
}

- (id)jpegDataWithSize:(CGSize)a3
{
  -[MPMediaItemArtwork imageWithSize:](self, "imageWithSize:", a3.width, a3.height);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v4 = UIImageJPEGRepresentation(v3, *MEMORY[0x1E4F778F0]);

  return v4;
}

- (CGRect)bounds
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double width = self->_bounds.width;
  double height = self->_bounds.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)imageWithSize:(CGSize)size
{
  double width = self->_bounds.width;
  double height = self->_bounds.height;
  if ((*MEMORY[0x1E4F1DB30] != width || *(double *)(MEMORY[0x1E4F1DB30] + 8) != height)
    && (size.height > height || size.width > width))
  {
    size = self->_bounds;
  }
  return (UIImage *)(*((uint64_t (**)(__n128, __n128))self->_requestHandler + 2))((__n128)size, *(__n128 *)&size.height);
}

- (MPMediaItemArtwork)initWithBoundsSize:(CGSize)boundsSize requestHandler:(void *)requestHandler
{
  CGFloat height = boundsSize.height;
  CGFloat width = boundsSize.width;
  v7 = requestHandler;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)MPMediaItemArtwork;
    v8 = [(MPMediaItemArtwork *)&v14 init];
    v9 = v8;
    if (v8)
    {
      v8->_bounds.CGFloat width = width;
      v8->_bounds.CGFloat height = height;
      uint64_t v10 = MEMORY[0x19971E0F0](v7);
      id v11 = v9->_requestHandler;
      v9->_requestHandler = (id)v10;
    }
    self = v9;
    v12 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"requestHandler must be non-nil"];
    v12 = 0;
  }

  return v12;
}

- (MPMediaItemArtwork)initWithImage:(UIImage *)image
{
  v4 = image;
  v5 = v4;
  if (v4)
  {
    [(UIImage *)v4 size];
    double v7 = v6;
    double v9 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__MPMediaItemArtwork_initWithImage___block_invoke;
    v12[3] = &unk_1E57F0228;
    v13 = v5;
    self = -[MPMediaItemArtwork initWithBoundsSize:requestHandler:](self, "initWithBoundsSize:requestHandler:", v12, v7, v9);

    uint64_t v10 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"image must be non-nil"];
    uint64_t v10 = 0;
  }

  return v10;
}

id __36__MPMediaItemArtwork_initWithImage___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MPMediaItemArtwork)init
{
  return 0;
}

@end