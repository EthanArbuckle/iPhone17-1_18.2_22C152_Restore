@interface AKAuthorizationSubPaneImage
+ (id)_imageViewWithImage:(id)a3;
- (AKAuthorizationSubPaneImage)initWithImage:(id)a3;
- (NSArray)imageViewConstraints;
- (UIImage)image;
- (UIImageView)imageView;
- (void)addToConstraints:(id)a3 context:(id)a4;
- (void)addToStackView:(id)a3 context:(id)a4;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setImageViewConstraints:(id)a3;
@end

@implementation AKAuthorizationSubPaneImage

- (AKAuthorizationSubPaneImage)initWithImage:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _imageViewWithImage:v4];

  imageView = self->_imageView;
  self->_imageView = v5;

  v7 = self->_imageView;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationSubPaneImage;
  return [(AKAuthorizationSubPane *)&v9 initWithView:v7];
}

- (UIImage)image
{
  v2 = [(AKAuthorizationSubPaneImage *)self imageView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAuthorizationSubPaneImage *)self imageView];
  [v5 setImage:v4];
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E4F42FF0];
    v8 = [(AKAuthorizationSubPaneImage *)self imageView];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__AKAuthorizationSubPaneImage_setImage_animated___block_invoke;
    v9[3] = &unk_1E648F2C8;
    v9[4] = self;
    id v10 = v6;
    [v7 transitionWithView:v8 duration:5242880 options:v9 animations:0 completion:0.25];
  }
  else
  {
    [(AKAuthorizationSubPaneImage *)self setImage:v6];
  }
}

void __49__AKAuthorizationSubPaneImage_setImage_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:v1];
}

- (void)addToStackView:(id)a3 context:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPaneImage;
  [(AKAuthorizationSubPane *)&v4 addToStackView:a3 context:a4];
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v5 = [(AKAuthorizationSubPaneImage *)self imageViewConstraints];

  if (v5)
  {
    id v6 = [(AKAuthorizationSubPaneImage *)self imageViewConstraints];
    [v7 addObjectsFromArray:v6];
  }
}

+ (id)_imageViewWithImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F42AA0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithImage:v4];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v5;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (NSArray)imageViewConstraints
{
  return self->_imageViewConstraints;
}

- (void)setImageViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewConstraints, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end