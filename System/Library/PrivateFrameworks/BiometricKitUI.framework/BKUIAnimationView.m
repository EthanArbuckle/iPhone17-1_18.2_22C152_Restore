@interface BKUIAnimationView
- (double)topOffsetPercentage;
- (void)layoutSubviews;
@end

@implementation BKUIAnimationView

- (double)topOffsetPercentage
{
  v2 = +[BKUIDevice sharedInstance];
  int v3 = [v2 isIdiomPad];

  if (v3)
  {
    if (+[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", 0) == 4|| +[BKUIUtils activeInterfaceOrientationForView:0] == 3)
    {
      v4 = +[BKUIDevice sharedInstance];
      int v5 = [v4 isMini];

      if (v5) {
        double v6 = 0.806399985;
      }
      else {
        double v6 = 0.778899985;
      }
      v7 = +[BKUIDevice sharedInstance];
      int v8 = [v7 isPad6];

      if (v8) {
        double v6 = v6 + -0.026;
      }
      v9 = +[BKUIDevice sharedInstance];
      int v10 = [v9 isIPad2];

      if (v10) {
        double v6 = v6 + 0.026;
      }
      v11 = +[BKUIDevice sharedInstance];
      int v12 = [v11 isiPad21];

      double v13 = 0.01;
    }
    else
    {
      v20 = +[BKUIDevice sharedInstance];
      int v21 = [v20 isMini];

      if (v21) {
        double v6 = 0.803499985;
      }
      else {
        double v6 = 0.753499985;
      }
      v22 = +[BKUIDevice sharedInstance];
      int v23 = [v22 isPad7];

      if (v23) {
        double v6 = v6 + 0.025;
      }
      v24 = +[BKUIDevice sharedInstance];
      int v25 = [v24 isIPad2];

      if (v25) {
        double v6 = v6 + 0.051;
      }
      v26 = +[BKUIDevice sharedInstance];
      int v12 = [v26 isiPad21];

      double v13 = 0.0324;
    }
  }
  else
  {
    v14 = +[BKUIDevice sharedInstance];
    int v15 = [v14 isZoomEnabled];

    if (v15)
    {
      double v6 = 0.598000009;
    }
    else
    {
      v16 = _BKUILoggingFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1E4B6C000, v16, OS_LOG_TYPE_DEFAULT, "Unable to determine displayzoom as DisplayAndBrightnessSettings is not available", v28, 2u);
      }

      double v6 = 0.61500001;
    }
    v17 = +[BKUIDevice sharedInstance];
    int v18 = [v17 isN69];

    if (v18) {
      double v6 = v6 + -0.0419999994;
    }
    v19 = +[BKUIDevice sharedInstance];
    int v12 = [v19 isD10];

    double v13 = -0.0199999996;
  }
  double result = v6 + v13;
  if (!v12) {
    return v6;
  }
  return result;
}

- (void)layoutSubviews
{
  int v3 = [(BKUIAnimationView *)self layer];
  [v3 setMasksToBounds:0];

  v4 = [(BKUIAnimationView *)self layer];
  int v5 = [v4 sublayers];
  double v6 = [v5 firstObject];

  [(BKUIAnimationView *)self bounds];
  double v8 = v7 * 0.5;
  [(BKUIAnimationView *)self bounds];
  objc_msgSend(v6, "setPosition:", v8, v9 * 0.5);
  int v10 = +[BKUIDevice sharedInstance];
  LODWORD(v4) = [v10 isIdiomPad];

  if (!v4)
  {
    v11 = +[BKUIDevice sharedInstance];
    int v12 = [v11 isN69];

    if (v12)
    {
      double v13 = 0.349999994;
      if (v6)
      {
LABEL_6:
        [v6 contentsTransform];
LABEL_12:
        v16 = (CGAffineTransform *)v22;
        v17 = (CGAffineTransform *)v22;
        int v18 = (CGAffineTransform *)v21;
        CGFloat v19 = v13;
        CGFloat v20 = v13;
        goto LABEL_15;
      }
    }
    else
    {
      v14 = +[BKUIDevice sharedInstance];
      int v15 = [v14 isD10];

      if (v15) {
        double v13 = 0.400000006;
      }
      else {
        double v13 = 0.449999988;
      }
      if (v6) {
        goto LABEL_6;
      }
    }
    memset(v21, 0, sizeof(v21));
    goto LABEL_12;
  }
  if (v6) {
    [v6 contentsTransform];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }
  CGFloat v19 = 0.3;
  v16 = &v24;
  v17 = &v24;
  int v18 = &v23;
  CGFloat v20 = 0.3;
LABEL_15:
  CGAffineTransformScale(v17, v18, v19, v20);
  [v6 setAffineTransform:v16];
}

@end