@interface WFGiphyCell
- (NSURLSessionDataTask)dataTask;
- (UIActivityIndicatorView)indicatorView;
- (UIImageView)imageView;
- (UIImageView)selectedImageView;
- (WFGiphyCell)initWithFrame:(CGRect)a3;
- (WFGiphyObject)object;
- (void)layoutSubviews;
- (void)setDataTask:(id)a3;
- (void)setImageView:(id)a3;
- (void)setIndicatorView:(id)a3;
- (void)setObject:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedImageView:(id)a3;
@end

@implementation WFGiphyCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
  objc_destroyWeak((id *)&self->_dataTask);
  objc_destroyWeak((id *)&self->_selectedImageView);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_indicatorView);
}

- (WFGiphyObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return (WFGiphyObject *)WeakRetained;
}

- (void)setDataTask:(id)a3
{
}

- (NSURLSessionDataTask)dataTask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataTask);
  return (NSURLSessionDataTask *)WeakRetained;
}

- (void)setSelectedImageView:(id)a3
{
}

- (UIImageView)selectedImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedImageView);
  return (UIImageView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  return (UIImageView *)WeakRetained;
}

- (void)setIndicatorView:(id)a3
{
}

- (UIActivityIndicatorView)indicatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indicatorView);
  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setObject:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  char v6 = [WeakRetained isEqual:v4];

  objc_storeWeak((id *)&self->_object, v4);
  if ((v6 & 1) == 0)
  {
    v7 = [(WFGiphyCell *)self dataTask];
    [v7 cancel];

    v8 = [v4 images];
    v9 = [v8 objectForKey:@"fixed_width_downsampled"];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v12 = [v4 images];
      v13 = [v12 objectForKey:@"fixed_width_downsampled"];
      v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [v4 originalImage];
      }
      id v11 = v15;
    }
    v16 = [v11 cachedImage];
    v17 = [v16 UIImage];
    v18 = [(WFGiphyCell *)self imageView];
    [v18 setImage:v17];

    v19 = [v11 cachedImage];

    if (!v19)
    {
      v20 = [(WFGiphyCell *)self indicatorView];
      [v20 startAnimating];

      v21 = objc_msgSend(MEMORY[0x263F08BF8], "wf_sharedSession");
      v22 = [v11 url];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __25__WFGiphyCell_setObject___block_invoke;
      v24[3] = &unk_264900FA0;
      v24[4] = self;
      id v25 = v11;
      id v26 = v4;
      id v11 = v11;
      v23 = [v21 dataTaskWithURL:v22 completionHandler:v24];

      [(WFGiphyCell *)self setDataTask:v23];
      [v23 resume];
    }
  }
}

void __25__WFGiphyCell_setObject___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x263F85308] imageWithData:a2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__WFGiphyCell_setObject___block_invoke_2;
  v6[3] = &unk_264900F78;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __25__WFGiphyCell_setObject___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) indicatorView];
  [v2 stopAnimating];

  [*(id *)(a1 + 40) setCachedImage:*(void *)(a1 + 48)];
  v3 = [*(id *)(a1 + 32) object];
  int v4 = [v3 isEqual:*(void *)(a1 + 56)];

  if (v4)
  {
    id v6 = [*(id *)(a1 + 48) UIImage];
    id v5 = [*(id *)(a1 + 32) imageView];
    [v5 setImage:v6];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFGiphyCell;
  -[WFGiphyCell setSelected:](&v6, sel_setSelected_);
  id v5 = [(WFGiphyCell *)self selectedImageView];
  [v5 setHidden:!v3];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)WFGiphyCell;
  [(WFGiphyCell *)&v25 layoutSubviews];
  BOOL v3 = [(WFGiphyCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(WFGiphyCell *)self imageView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(WFGiphyCell *)self selectedImageView];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  double v14 = *MEMORY[0x263F00148];
  double v15 = *(double *)(MEMORY[0x263F00148] + 8);
  v16 = [(WFGiphyCell *)self indicatorView];
  [v16 intrinsicContentSize];
  double v18 = v17;
  double v20 = v19;
  v21 = [(WFGiphyCell *)self indicatorView];
  objc_msgSend(v21, "setBounds:", v14, v15, v18, v20);

  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  double MidX = CGRectGetMidX(v26);
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  double MidY = CGRectGetMidY(v27);
  v24 = [(WFGiphyCell *)self indicatorView];
  objc_msgSend(v24, "setCenter:", MidX, MidY);
}

- (WFGiphyCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)WFGiphyCell;
  double v7 = -[WFGiphyCell initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    if (initWithFrame__onceToken != -1) {
      dispatch_once(&initWithFrame__onceToken, &__block_literal_global_5688);
    }
    double v8 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    double v9 = [(WFGiphyCell *)v7 contentView];
    [v9 addSubview:v8];

    [(WFGiphyCell *)v7 setIndicatorView:v8];
    double v10 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", x, y, width, height);
    double v11 = [(WFGiphyCell *)v7 contentView];
    [v11 addSubview:v10];

    [(WFGiphyCell *)v7 setImageView:v10];
    v12 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", x, y, width, height);
    [v12 setHidden:1];
    [v12 setImage:initWithFrame__selectedImage];
    v13 = [(WFGiphyCell *)v7 contentView];
    [v13 addSubview:v12];

    [(WFGiphyCell *)v7 setSelectedImageView:v12];
  }
  return v7;
}

void __29__WFGiphyCell_initWithFrame___block_invoke()
{
  v11.double width = 38.0;
  v11.double height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", 0.0, 0.0, 38.0, 38.0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x263F824C0];
  v12.origin.double x = 0.0;
  v12.origin.double y = 0.0;
  v12.size.double width = 38.0;
  v12.size.double height = 38.0;
  CGRect v13 = CGRectInset(v12, 7.0, 7.0);
  v1 = objc_msgSend(v0, "bezierPathWithOvalInRect:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  v2 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v2, "moveToPoint:", 13.0, 19.0);
  objc_msgSend(v2, "addLineToPoint:", 17.0, 23.0);
  objc_msgSend(v2, "addLineToPoint:", 25.0, 16.0);
  BOOL v3 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.300000012];
  [v3 setFill];

  [v9 fill];
  double v4 = [MEMORY[0x263F825C8] colorWithRed:0.071 green:0.337 blue:0.843 alpha:1.0];
  [v4 setFill];

  [v1 fill];
  double v5 = [MEMORY[0x263F825C8] whiteColor];
  [v5 setStroke];

  [v1 stroke];
  [v2 stroke];
  double v6 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v7 = objc_msgSend(v6, "resizableImageWithCapInsets:", 0.0, 0.0, 34.0, 34.0);
  double v8 = (void *)initWithFrame__selectedImage;
  initWithFrame__selectedImage = v7;

  UIGraphicsEndImageContext();
}

@end