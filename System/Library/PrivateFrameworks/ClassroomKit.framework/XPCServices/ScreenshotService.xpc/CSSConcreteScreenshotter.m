@interface CSSConcreteScreenshotter
- (CGSize)sizeByScalingSize:(CGSize)a3 byFactor:(double)a4;
- (CSSConcreteScreenshotter)init;
- (CSSDeviceProperties)deviceProperties;
- (id)fullSizeScreenshotWithError:(id *)a3;
- (id)resizeScreenshot:(id)a3 toFitInPixelBox:(CGSize)a4;
- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4;
@end

@implementation CSSConcreteScreenshotter

- (CSSConcreteScreenshotter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSSConcreteScreenshotter;
  v2 = [(CSSConcreteScreenshotter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deviceProperties = v2->_deviceProperties;
    v2->_deviceProperties = (CSSDeviceProperties *)v3;
  }
  return v2;
}

- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9 = [(CSSConcreteScreenshotter *)self deviceProperties];
  unsigned __int8 v10 = [v9 isScreenOn];

  if ((v10 & 1) != 0
    && ([(CSSConcreteScreenshotter *)self deviceProperties],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 isLocked],
        v11,
        !v12))
  {
    if (fabs(width) <= 2.22044605e-16 || fabs(height) <= 2.22044605e-16)
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    else
    {
      id v17 = 0;
      v14 = [(CSSConcreteScreenshotter *)self fullSizeScreenshotWithError:&v17];
      id v15 = v17;
      if (v14)
      {
        v16 = -[CSSConcreteScreenshotter resizeScreenshot:toFitInPixelBox:](self, "resizeScreenshot:toFitInPixelBox:", v14, width, height);
        (*((void (**)(id, void *, void))v7 + 2))(v7, v16, 0);
      }
      else
      {
        (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
      }
    }
  }
  else
  {
    v13 = CRKErrorWithCodeAndUserInfo();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

- (id)fullSizeScreenshotWithError:(id *)a3
{
  v4 = objc_opt_new();
  v5 = objc_msgSend(v4, "screenshotWithMaximumSizeInPixels:error:", a3, 1.79769313e308, 1.79769313e308);

  return v5;
}

- (id)resizeScreenshot:(id)a3 toFitInPixelBox:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = (UIImage *)a3;
  [(UIImage *)v7 size];
  double v9 = v8;
  double v11 = v10;
  [(UIImage *)v7 scale];
  -[CSSConcreteScreenshotter sizeByScalingSize:byFactor:](self, "sizeByScalingSize:byFactor:", v9, v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v17 = fmin(width / v13, 1.0);
  double v18 = height / v15;
  if (v18 >= v17) {
    double v19 = v17;
  }
  else {
    double v19 = v18;
  }
  -[CSSConcreteScreenshotter sizeByScalingSize:byFactor:](self, "sizeByScalingSize:byFactor:", v14, v16, v19);
  if (v14 == v20 && v16 == v21)
  {
    v27 = UIImageJPEGRepresentation(v7, 0.0);
  }
  else
  {
    double v23 = v20;
    double v24 = v21;
    v25 = objc_opt_new();
    [v25 setScale:1.0];
    id v26 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v25, v23, v24);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100005F4C;
    v29[3] = &unk_10000C760;
    v30 = v7;
    double v31 = v23;
    double v32 = v24;
    v27 = [v26 JPEGDataWithCompressionQuality:v29 actions:0.0];
  }

  return v27;
}

- (CGSize)sizeByScalingSize:(CGSize)a3 byFactor:(double)a4
{
  double v4 = a3.width * a4;
  double v5 = a3.height * a4;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CSSDeviceProperties)deviceProperties
{
  return self->_deviceProperties;
}

- (void).cxx_destruct
{
}

@end