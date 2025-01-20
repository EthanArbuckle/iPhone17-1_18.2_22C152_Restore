@interface GKAvatarImage
- (GKAvatarImage)initWithPNGData:(id)a3 useUIImage:(BOOL)a4;
- (NSData)imageData;
- (UIImage)image;
- (void)prepareForUsingUIImage:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageData:(id)a3;
@end

@implementation GKAvatarImage

- (GKAvatarImage)initWithPNGData:(id)a3 useUIImage:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKAvatarImage;
  v7 = [(GKAvatarImage *)&v12 init];
  v8 = v7;
  if (v7)
  {
    if (v4) {
      id v9 = 0;
    }
    else {
      id v9 = v6;
    }
    [(GKAvatarImage *)v7 setImageData:v9];
    if (v4)
    {
      v10 = [MEMORY[0x263F1C6B0] _gkImageWithCheckedData:v6];
      [(GKAvatarImage *)v8 setImage:v10];
    }
    else
    {
      [(GKAvatarImage *)v8 setImage:0];
    }
  }

  return v8;
}

- (void)prepareForUsingUIImage:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(GKAvatarImage *)self image];
    if (!v4)
    {
      v5 = [(GKAvatarImage *)self imageData];

      if (!v5) {
        return;
      }
      id v6 = (void *)MEMORY[0x263F1C6B0];
      id v9 = [(GKAvatarImage *)self imageData];
      v7 = objc_msgSend(v6, "_gkImageWithCheckedData:");
      [(GKAvatarImage *)self setImage:v7];
LABEL_8:

      BOOL v4 = v9;
    }
  }
  else
  {
    BOOL v4 = [(GKAvatarImage *)self imageData];
    if (!v4)
    {
      v8 = [(GKAvatarImage *)self image];

      if (!v8) {
        return;
      }
      id v9 = [(GKAvatarImage *)self image];
      v7 = UIImagePNGRepresentation(v9);
      [(GKAvatarImage *)self setImageData:v7];
      goto LABEL_8;
    }
  }
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
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
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end