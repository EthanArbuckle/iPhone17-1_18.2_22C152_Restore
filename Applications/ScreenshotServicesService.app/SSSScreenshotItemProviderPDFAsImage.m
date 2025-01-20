@interface SSSScreenshotItemProviderPDFAsImage
- (SSSScreenshotItemProviderPDFAsImage)initWithScreenshot:(id)a3;
- (UIImage)pdfAsImage;
- (UIImage)thumbnailImage;
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageDataForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)imageData;
- (void)setPdfAsImage:(id)a3;
- (void)setThumbnailImage:(id)a3;
@end

@implementation SSSScreenshotItemProviderPDFAsImage

- (SSSScreenshotItemProviderPDFAsImage)initWithScreenshot:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SSSScreenshotItemProviderPDFAsImage;
  v3 = [(SSSScreenshotItemProvider *)&v11 initWithScreenshot:a3];
  v4 = [(SSSScreenshotItemProvider *)v3 screenshot];
  v5 = [v4 PDFDocument];
  v6 = [v5 pageAtIndex:0];
  v7 = [v6 thumbnailOfSize:1 forBox:300.0, 300.0];
  [(SSSScreenshotItemProviderPDFAsImage *)v3 setThumbnailImage:v7];

  v8 = [(SSSScreenshotItemProvider *)v3 screenshot];
  v9 = [v8 pdfAsImage];
  [(SSSScreenshotItemProviderPDFAsImage *)v3 setPdfAsImage:v9];

  return v3;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v5 = (void *)qword_1000B57D0;
  uint64_t v27 = qword_1000B57D0;
  if (!qword_1000B57D0)
  {
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_100035808;
    v22 = &unk_100099928;
    v23 = &v24;
    sub_100035808((uint64_t)&v19);
    v5 = (void *)v25[3];
  }
  v6 = v5;
  _Block_object_dispose(&v24, 8);
  id v7 = objc_alloc_init(v6);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v8 = (void *)qword_1000B57E0;
  uint64_t v27 = qword_1000B57E0;
  if (!qword_1000B57E0)
  {
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_1000359D0;
    v22 = &unk_100099928;
    v23 = &v24;
    sub_1000359D0((uint64_t)&v19);
    v8 = (void *)v25[3];
  }
  v9 = v8;
  _Block_object_dispose(&v24, 8);
  id v10 = objc_alloc_init(v9);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  objc_super v11 = (void *)qword_1000B57E8;
  uint64_t v27 = qword_1000B57E8;
  if (!qword_1000B57E8)
  {
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_100035A28;
    v22 = &unk_100099928;
    v23 = &v24;
    sub_100035A28((uint64_t)&v19);
    objc_super v11 = (void *)v25[3];
  }
  v12 = v11;
  _Block_object_dispose(&v24, 8);
  id v13 = [v12 alloc];
  v14 = [(SSSScreenshotItemProviderPDFAsImage *)self thumbnailImage];
  id v15 = [v13 initWithPlatformImage:v14];
  [v10 setThumbnail:v15];

  v16 = [(SSSScreenshotItemProvider *)self nameForScreenshot];
  [v10 setName:v16];

  v17 = [UTTypeImage identifier];
  [v10 setType:v17];

  [v7 setSpecialization:v10];

  return v7;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  id v4 = [(SSSScreenshotItemProvider *)self nameForScreenshot];
  v5 = [v4 stringByAppendingPathExtension:@"jpeg"];

  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageDataForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return [(SSSScreenshotItemProviderPDFAsImage *)self imageData];
}

- (id)imageData
{
  v2 = [(SSSScreenshotItemProviderPDFAsImage *)self pdfAsImage];
  v3 = UIImageJPEGRepresentation(v2, 1.0);

  return v3;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
}

- (UIImage)pdfAsImage
{
  return self->_pdfAsImage;
}

- (void)setPdfAsImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfAsImage, 0);

  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end