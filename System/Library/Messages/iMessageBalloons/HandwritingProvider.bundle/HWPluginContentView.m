@interface HWPluginContentView
+ (id)_backgroundColor;
+ (id)_inkColor;
- (CGSize)cachedSize;
- (DKInkView)inkView;
- (HWBalloonDataSource)dataSource;
- (HWHandwritingItem)handwriting;
- (HWPluginContentView)initWithFrame:(CGRect)a3;
- (UIImage)cachedImage;
- (UIImageView)imageView;
- (id)currentBackgroundColor;
- (void)_lazySetupGLInkView;
- (void)_teardownInkView;
- (void)_updateCachedImageForSize:(CGSize)a3 completionBlock:(id)a4;
- (void)cleanupAfterAnimation;
- (void)layoutSubviews;
- (void)replayDrawingWithCompletionBlock:(id)a3;
- (void)setCachedImage:(id)a3;
- (void)setCachedSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setHandwriting:(id)a3;
- (void)setImageView:(id)a3;
- (void)setInkView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HWPluginContentView

- (HWPluginContentView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HWPluginContentView;
  v3 = -[HWPluginContentView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(HWPluginContentView *)v3 currentBackgroundColor];
    [(HWPluginContentView *)v4 setBackgroundColor:v5];

    id v6 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(HWPluginContentView *)v4 setImageView:v6];

    v7 = [(HWPluginContentView *)v4 imageView];
    [v7 setContentMode:4];

    v8 = +[UIDevice currentDevice];
    unsigned int v9 = objc_msgSend(v8, "dk_deviceSupportsGL");

    if (v9)
    {
      v10 = +[HWAbstractBalloonController _sharedRenderQueue];
      [v10 setMaxConcurrentOperationCount:1];
    }
    [(HWPluginContentView *)v4 addSubview:v4->_imageView];
    v4->_cachedSize = CGSizeZero;
  }
  return v4;
}

- (id)currentBackgroundColor
{
  v2 = [(HWPluginContentView *)self dataSource];
  if ([v2 payloadInShelf]) {
    +[UIColor clearColor];
  }
  else {
  v3 = +[HWPluginContentView _backgroundColor];
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HWPluginContentView;
  id v4 = a3;
  [(HWPluginContentView *)&v11 traitCollectionDidChange:v4];
  v5 = [(HWPluginContentView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    self->_cachedSize = CGSizeZero;
    v8 = [(HWPluginContentView *)self imageView];
    [v8 setContentMode:1];

    [(HWPluginContentView *)self bounds];
    -[HWPluginContentView _updateCachedImageForSize:completionBlock:](self, "_updateCachedImageForSize:completionBlock:", 0, v9, v10);
  }
}

+ (id)_inkColor
{
  v2 = +[UIDevice currentDevice];
  v3 = (int *)[v2 userInterfaceIdiom];

  if (v3 == &dword_4) {
    +[UIColor whiteColor];
  }
  else {
  id v4 = +[UIColor inkColor];
  }

  return v4;
}

+ (id)_backgroundColor
{
  v2 = +[UIDevice currentDevice];
  v3 = (int *)[v2 userInterfaceIdiom];

  if (v3 == &dword_4) {
    +[UIColor blackColor];
  }
  else {
  id v4 = +[UIColor drawingCanvasBackgroundColor];
  }

  return v4;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)HWPluginContentView;
  [(HWPluginContentView *)&v33 layoutSubviews];
  v3 = [(HWPluginContentView *)self currentBackgroundColor];
  [(HWPluginContentView *)self setBackgroundColor:v3];

  [(HWPluginContentView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(HWPluginContentView *)self imageView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  [(HWPluginContentView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(HWPluginContentView *)self inkView];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = +[UIDevice currentDevice];
  if (objc_msgSend(v22, "dk_deviceSupportsGL"))
  {
    v23 = [(HWPluginContentView *)self dataSource];
    unsigned __int8 v24 = [v23 shouldAnimate];

    if (v24) {
      return;
    }
  }
  else
  {
  }
  [(HWPluginContentView *)self bounds];
  double width = self->_cachedSize.width;
  double height = self->_cachedSize.height;
  if (width != v28 || height != v25)
  {
    v30 = [(HWPluginContentView *)self imageView];
    [v30 setContentMode:1];

    [(HWPluginContentView *)self bounds];
    -[HWPluginContentView _updateCachedImageForSize:completionBlock:](self, "_updateCachedImageForSize:completionBlock:", 0, v31, v32);
  }
}

- (void)_lazySetupGLInkView
{
  v3 = [(HWPluginContentView *)self inkView];
  if (v3)
  {
  }
  else
  {
    double v4 = +[UIDevice currentDevice];
    unsigned int v5 = objc_msgSend(v4, "dk_deviceSupportsGL");

    if (v5)
    {
      id v6 = objc_alloc((Class)DKInkView);
      [(HWPluginContentView *)self bounds];
      id v7 = objc_msgSend(v6, "initWithFrame:");
      [(HWPluginContentView *)self setInkView:v7];

      double v8 = [(HWPluginContentView *)self inkView];
      [v8 setUserInteractionEnabled:0];

      double v9 = [(HWPluginContentView *)self inkView];
      [v9 setMode:1];

      double v10 = [(HWPluginContentView *)self inkView];
      [v10 setAllowInput:0];

      double v11 = [(HWPluginContentView *)self inkView];
      [v11 setScaleDrawingToFitCanvas:1];

      objc_super v12 = [(HWPluginContentView *)self inkView];
      [v12 setRenderPreviewMode:0];

      double v13 = [(id)objc_opt_class() _inkColor];
      double v14 = [(HWPluginContentView *)self inkView];
      [v14 setStrokeColor:v13];

      [(HWPluginContentView *)self addSubview:self->_inkView];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      double v15 = [(HWPluginContentView *)self inkView];
      double v16 = [v15 layer];
      double v17 = [v16 sublayers];

      id v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          v21 = 0;
          do
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v22 setAllowsDisplayCompositing:0];
            }
            v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          id v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v19);
      }

      v23 = [(HWPluginContentView *)self inkView];
      [v23 setNeedsLayout];
    }
  }
}

- (void)_teardownInkView
{
  v3 = [(HWPluginContentView *)self inkView];
  [v3 teardown];

  double v4 = [(HWPluginContentView *)self inkView];
  [v4 removeFromSuperview];

  [(HWPluginContentView *)self setInkView:0];
  id v5 = [(HWPluginContentView *)self imageView];
  [v5 setHidden:0];
}

- (void)replayDrawingWithCompletionBlock:(id)a3
{
  double v4 = (void (**)(void))a3;
  [(HWPluginContentView *)self _lazySetupGLInkView];
  objc_initWeak(&location, self);
  id v5 = [(HWPluginContentView *)self handwriting];
  id v6 = [v5 drawing];
  id v7 = [(HWPluginContentView *)self inkView];
  double v8 = [v7 currentDrawing];

  if (v8 == v6)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    double v9 = [(HWPluginContentView *)self inkView];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_158B4;
    v10[3] = &unk_28A90;
    double v11 = v4;
    objc_copyWeak(&v12, &location);
    [v9 setCurrentDrawing:v6 scaleDrawingToFitBounds:1 withAnimationType:1 animationCompletionHandler:v10];

    objc_destroyWeak(&v12);
  }

  objc_destroyWeak(&location);
}

- (void)cleanupAfterAnimation
{
  v3 = [(HWPluginContentView *)self inkView];
  [v3 pauseRendering];

  objc_initWeak(&location, self);
  [(HWPluginContentView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_15A10;
  v8[3] = &unk_28AB8;
  objc_copyWeak(&v9, &location);
  -[HWPluginContentView _updateCachedImageForSize:completionBlock:](self, "_updateCachedImageForSize:completionBlock:", v8, v5, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_updateCachedImageForSize:(CGSize)a3 completionBlock:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = (void (**)(void))a4;
  double v8 = +[HWPluginContentView _inkColor];
  [(HWPluginContentView *)self bounds];
  double v10 = v9;
  id v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(HWPluginContentView *)self handwriting];

  if (v17)
  {
    id v18 = [(HWPluginContentView *)self handwriting];
    id v19 = [v18 drawing];
    int IsValid = DKDrawingIsValid();

    if (IsValid)
    {
      v21 = [(HWPluginContentView *)self traitCollection];
      id v22 = [v21 userInterfaceStyle];

      cachedImage = self->_cachedImage;
      long long v24 = [(HWPluginContentView *)self imageView];
      [v24 setImage:cachedImage];

      p_cachedSize = &self->_cachedSize;
      if (self->_cachedSize.width != width || self->_cachedSize.height != height)
      {
        CGSize v34 = *p_cachedSize;
        p_cachedSize->double width = width;
        self->_cachedSize.double height = height;
        objc_initWeak(&location, self);
        long long v27 = +[HWAbstractBalloonController _sharedRenderQueue];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_15CC4;
        v28[3] = &unk_28B08;
        objc_copyWeak(v31, &location);
        v31[1] = v22;
        v31[2] = v10;
        v31[3] = v12;
        v31[4] = v14;
        v31[5] = v16;
        id v29 = v8;
        CGSize v32 = v34;
        v30 = v7;
        [v27 addOperationWithBlock:v28];

        objc_destroyWeak(v31);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
    }
    else
    {
      NSLog(@"Drawing has invalid dimensions.");
    }
  }
  else
  {
    NSLog(@"Received unrecognized payload to render.");
  }
  if (v7) {
    v7[2](v7);
  }
LABEL_12:
}

- (HWBalloonDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (HWBalloonDataSource *)a3;
}

- (HWHandwritingItem)handwriting
{
  return self->_handwriting;
}

- (void)setHandwriting:(id)a3
{
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImageView:(id)a3
{
}

- (DKInkView)inkView
{
  return (DKInkView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInkView:(id)a3
{
}

- (UIImage)cachedImage
{
  return (UIImage *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedImage:(id)a3
{
}

- (CGSize)cachedSize
{
  objc_copyStruct(v4, &self->_cachedSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setCachedSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_cachedSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_inkView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_handwriting, 0);
}

@end