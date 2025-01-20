@interface NTKCollieFaceImageView
+ (UIImage)loadingImage;
- (NSString)loadingTag;
- (double)timeIntervalSinceTagged;
- (double)vOffset;
- (id)image;
- (void)_recomputeContentsRect;
- (void)setImage:(id)a3;
- (void)setLoadingTag:(id)a3;
- (void)setVOffset:(double)a3;
@end

@implementation NTKCollieFaceImageView

+ (UIImage)loadingImage
{
  id v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&qword_2F7F0);
  if (!WeakRetained)
  {
    v4 = +[UIColor colorWithRed:0.0784313725 green:0.0666666701 blue:0.0823529437 alpha:1.0];
    v5 = +[NTKCollieFaceBundle imageWithName:@"loading-head"];
    v6 = [v5 imageWithRenderingMode:2];

    v7 = +[CLKDevice currentDevice];
    [v7 screenBounds];
    double v9 = v8;
    double v11 = v10;

    id v12 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v9, v11);
    v16[1] = 3221225472;
    v16[0] = _NSConcreteStackBlock;
    v16[2] = sub_12990;
    v16[3] = &unk_29058;
    double v19 = v9;
    double v20 = v11;
    double v21 = (v9 - v9 * 0.765) * 0.5;
    double v22 = (v11 - v9 * 0.765) * 0.5;
    double v23 = v9 * 0.765;
    double v24 = v9 * 0.765;
    id v13 = v6;
    id v17 = v13;
    id v14 = v4;
    id v18 = v14;
    WeakRetained = [v12 imageWithActions:v16];
    objc_storeWeak(&qword_2F7F0, WeakRetained);
  }
  objc_sync_exit(v2);

  return (UIImage *)WeakRetained;
}

- (double)vOffset
{
  return self->_vOffset;
}

- (void)_recomputeContentsRect
{
  v3 = +[CLKDevice currentDevice];
  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;

  v19.receiver = self;
  v19.super_class = (Class)NTKCollieFaceImageView;
  double v8 = [(NTKCollieFaceImageView *)&v19 image];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  if (v12 <= 0.0)
  {
    double v16 = 1.0;
    double v15 = 0.0;
    double v17 = 1.0;
  }
  else
  {
    double vOffset = self->_vOffset;
    if (v5 == v10 && v7 == v12)
    {
      double v16 = 1.0;
      double v17 = 1.0;
      double v15 = -vOffset / v12;
    }
    else
    {
      double v15 = ((v12 - v7) * 0.75 - vOffset) / v12;
      double v16 = 1.0;
      double v17 = 1.0 - v15;
    }
  }
  id v18 = [(NTKCollieFaceImageView *)self layer];
  objc_msgSend(v18, "setContentsRect:", 0.0, v15, v16, v17);
}

- (void)setVOffset:(double)a3
{
  self->_double vOffset = a3;
  [(NTKCollieFaceImageView *)self _recomputeContentsRect];
}

- (void)setImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCollieFaceImageView;
  [(NTKCollieFaceImageView *)&v5 setImage:a3];
  [(NTKCollieFaceImageView *)self _recomputeContentsRect];
  loadingTag = self->_loadingTag;
  self->_loadingTag = 0;
}

- (id)image
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCollieFaceImageView;
  id v2 = [(NTKCollieFaceImageView *)&v5 image];
  if (v2)
  {
    v3 = [(id)objc_opt_class() loadingImage];

    if (v2 == v3)
    {

      id v2 = 0;
    }
  }

  return v2;
}

- (void)setLoadingTag:(id)a3
{
  double v4 = (NSString *)a3;
  if (v4 && ![(NSString *)self->_loadingTag isEqualToString:v4]) {
    self->_taggedTime = CACurrentMediaTime();
  }
  loadingTag = self->_loadingTag;
  self->_loadingTag = v4;
}

- (double)timeIntervalSinceTagged
{
  return CACurrentMediaTime() - self->_taggedTime;
}

- (NSString)loadingTag
{
  return self->_loadingTag;
}

- (void).cxx_destruct
{
}

@end