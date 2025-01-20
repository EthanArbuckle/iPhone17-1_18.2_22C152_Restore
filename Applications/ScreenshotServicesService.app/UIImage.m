@interface UIImage
+ (id)_sss_imageFromScreenshot:(id)a3;
- (SSSScreenshot)associatedScreenshot;
- (void)setAssociatedScreenshot:(id)a3;
@end

@implementation UIImage

+ (id)_sss_imageFromScreenshot:(id)a3
{
  id v3 = a3;
  v4 = [v3 imageGenerator];
  v5 = [v4 generateImageForScreenshot:v3];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 backingImage];
  }
  v8 = v7;
  v9 = [v3 environmentDescription];
  [v9 imagePixelSize];
  double v11 = v10;
  double v13 = v12;

  v14 = [v3 environmentDescription];
  [v14 imageScale];
  double v16 = v15;

  v17 = [v3 modelModificationInfo];
  v18 = v17;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  if (v17) {
    [v17 cropInfo];
  }
  [v18 vellumOpacity];
  uint64_t v20 = v19;
  double v21 = v11 / v16;
  long long v50 = v52;
  long long v22 = v53;
  double v23 = v13 / v16;
  id v24 = objc_alloc_init((Class)UIGraphicsImageRendererFormat);
  [v24 setScale:v16];
  v25 = [v18 originalAnnotations];
  id v26 = [v25 count];

  if (v26)
  {
    id v27 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v24 format:v21];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100003354;
    v46[3] = &unk_100099900;
    double v48 = v21;
    double v49 = v23;
    id v47 = v18;
    id v26 = [v27 imageWithActions:v46];
  }
  id v28 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v24 format:v22];
  v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472;
  v36 = sub_100003684;
  v37 = &unk_100099988;
  long long v40 = v50;
  long long v41 = v22;
  double v42 = v21;
  double v43 = v23;
  uint64_t v44 = v20;
  long long v45 = v22;
  id v38 = v8;
  id v39 = v26;
  id v29 = v26;
  id v30 = v8;
  v31 = objc_retainBlock(&v34);
  v32 = [v28 imageWithActions:v31, v34, v35, v36, v37];

  return v32;
}

- (void)setAssociatedScreenshot:(id)a3
{
}

- (SSSScreenshot)associatedScreenshot
{
  return (SSSScreenshot *)objc_getAssociatedObject(self, "_UIImageSSSAssociatedScreenshotKey");
}

@end