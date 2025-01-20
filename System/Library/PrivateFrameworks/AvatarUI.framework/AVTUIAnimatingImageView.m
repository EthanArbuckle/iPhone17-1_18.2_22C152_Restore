@interface AVTUIAnimatingImageView
- (AVTUIAnimatingImageView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)fadeInImageView;
- (UIImageView)imageView;
- (void)setContentMode:(int64_t)a3;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTUIAnimatingImageView

- (AVTUIAnimatingImageView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVTUIAnimatingImageView;
  v3 = -[AVTUIAnimatingImageView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(AVTUIAnimatingImageView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(AVTUIAnimatingImageView *)v3 bounds];
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:");
    fadeInImageView = v3->_fadeInImageView;
    v3->_fadeInImageView = (UIImageView *)v8;

    [(UIImageView *)v3->_imageView setAutoresizingMask:18];
    [(UIImageView *)v3->_fadeInImageView setAutoresizingMask:18];
    [(AVTUIAnimatingImageView *)v3 addSubview:v3->_fadeInImageView];
    [(AVTUIAnimatingImageView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)setImage:(id)a3
{
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (UIImage *)a3;
  if (self->_image != v7)
  {
    objc_storeStrong((id *)&self->_image, a3);
    uint64_t v8 = [(AVTUIAnimatingImageView *)self fadeInImageView];
    [v8 setImage:0];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__AVTUIAnimatingImageView_setImage_animated___block_invoke;
    v23[3] = &unk_263FF0780;
    v23[4] = self;
    v9 = v7;
    v24 = v9;
    uint64_t v10 = MEMORY[0x210530210](v23);
    objc_super v11 = (void *)v10;
    if (v4)
    {
      v12 = [(AVTUIAnimatingImageView *)self imageView];
      v13 = [v12 image];

      if (v13)
      {
        v14 = [(AVTUIAnimatingImageView *)self fadeInImageView];
        [v14 setImage:v9];

        v15 = [(AVTUIAnimatingImageView *)self imageView];
        [v15 setAlpha:1.0];

        v16 = (void *)MEMORY[0x263F1CB60];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_3;
        v21[3] = &unk_263FF03D8;
        v21[4] = self;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_4;
        v19[3] = &unk_263FF0620;
        id v20 = v11;
        [v16 animateWithDuration:v21 animations:v19 completion:0.18];
      }
      else
      {
        v17 = [(AVTUIAnimatingImageView *)self imageView];
        [v17 setAlpha:0.0];

        v18 = [(AVTUIAnimatingImageView *)self imageView];
        [v18 setImage:v9];

        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_2;
        v22[3] = &unk_263FF03D8;
        v22[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:v22 animations:0.18];
      }
    }
    else
    {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
  }
}

void __45__AVTUIAnimatingImageView_setImage_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageView];
  [v2 setAlpha:1.0];

  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 32) imageView];
  [v4 setImage:v3];

  id v5 = [*(id *)(a1 + 32) fadeInImageView];
  [v5 setImage:0];
}

void __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageView];
  [v1 setAlpha:1.0];
}

void __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageView];
  [v1 setAlpha:0.0];
}

uint64_t __45__AVTUIAnimatingImageView_setImage_animated___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)setContentMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTUIAnimatingImageView;
  -[AVTUIAnimatingImageView setContentMode:](&v7, sel_setContentMode_);
  id v5 = [(AVTUIAnimatingImageView *)self imageView];
  [v5 setContentMode:a3];

  v6 = [(AVTUIAnimatingImageView *)self fadeInImageView];
  [v6 setContentMode:a3];
}

- (void)setContinuousCornerRadius:(double)a3
{
  BOOL v5 = a3 > 0.0;
  v6 = [(AVTUIAnimatingImageView *)self imageView];
  [v6 setClipsToBounds:v5];

  objc_super v7 = [(AVTUIAnimatingImageView *)self fadeInImageView];
  [v7 setClipsToBounds:v5];

  [(AVTUIAnimatingImageView *)self setClipsToBounds:v5];
  [(AVTUIAnimatingImageView *)self _setContinuousCornerRadius:a3];
  uint64_t v8 = [(AVTUIAnimatingImageView *)self imageView];
  [v8 _setContinuousCornerRadius:a3];

  id v9 = [(AVTUIAnimatingImageView *)self fadeInImageView];
  [v9 _setContinuousCornerRadius:a3];
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)fadeInImageView
{
  return self->_fadeInImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeInImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end