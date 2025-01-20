@interface CPNowPlayingImageButton
+ (BOOL)supportsSecureCoding;
- (CPImageSet)imageSet;
- (CPNowPlayingImageButton)initWithCoder:(id)a3;
- (CPNowPlayingImageButton)initWithImage:(UIImage *)image handler:(void *)handler;
- (UIImage)image;
- (void)encodeWithCoder:(id)a3;
- (void)setImageSet:(id)a3;
@end

@implementation CPNowPlayingImageButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPNowPlayingImageButton)initWithImage:(UIImage *)image handler:(void *)handler
{
  v6 = image;
  v16.receiver = self;
  v16.super_class = (Class)CPNowPlayingImageButton;
  v7 = [(CPNowPlayingButton *)&v16 initWithHandler:handler];
  if (v7)
  {
    v8 = [CPImageSet alloc];
    v9 = (objc_class *)objc_opt_class();
    v10 = v6;
    v11 = [(UIImage *)v10 images];

    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        CPSanitizeImage_cold_1(v9);
      }
      v12 = [(UIImage *)v10 images];
      v13 = [v12 firstObject];
    }
    else
    {
      v13 = v10;
    }

    v14 = [(CPImageSet *)v8 initWithImage:v13 treatmentBlock:&__block_literal_global_7];
    [(CPNowPlayingImageButton *)v7 setImageSet:v14];
  }
  return v7;
}

id __49__CPNowPlayingImageButton_initWithImage_handler___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 20.0, 20.0);
}

- (CPNowPlayingImageButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPNowPlayingImageButton;
  v5 = [(CPNowPlayingButton *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPNowPlayingButtonButtonImageSet"];
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPNowPlayingImageButton;
  id v4 = a3;
  [(CPNowPlayingButton *)&v6 encodeWithCoder:v4];
  v5 = [(CPNowPlayingImageButton *)self imageSet];
  [v4 encodeObject:v5 forKey:@"CPNowPlayingButtonButtonImageSet"];
}

- (UIImage)image
{
  v2 = [(CPNowPlayingImageButton *)self imageSet];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end