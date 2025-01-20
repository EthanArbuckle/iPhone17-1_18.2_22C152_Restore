@interface PDCRemotePreviewController
- (CGSize)preferredContentSize;
- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5;
- (void)loadView;
@end

@implementation PDCRemotePreviewController

- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5
{
  return 0;
}

- (CGSize)preferredContentSize
{
  double v2 = 272.0;
  double v3 = 204.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)loadView
{
  double y = CGPointZero.y;
  [(PDCRemotePreviewController *)self preferredContentSize];
  id v16 = objc_msgSend(objc_alloc((Class)PUStackView), "initWithFrame:", CGPointZero.x, y, v4, v5);
  id v6 = +[PUStackView maximumNumberOfVisibleImagesForStyle:1];
  [v16 setStyle:1];
  objc_msgSend(v16, "setStackPerspectiveInsets:", 0.0, 5.0, 0.0, 5.0);
  objc_msgSend(v16, "setStackPerspectiveOffset:", 0.0, -3.5);
  id v7 = objc_alloc_init((Class)PUPhotoDecoration);
  v8 = +[UIColor whiteColor];
  [v7 setBorderColor:v8];

  [v7 setBorderWidth:1.0];
  v9 = +[UIColor clearColor];
  [v7 setForegroundColor:v9];

  [v16 setPhotoDecoration:v7];
  PUPixelSizeFromPointSize();
  v10 = -[PDCRemotePreviewController imagesWithTargetSize:contentMode:maximumCount:](self, "imagesWithTargetSize:contentMode:maximumCount:", 1, v6);
  objc_msgSend(v16, "setNumberOfVisibleItems:", objc_msgSend(v10, "count"));
  double v11 = (double)((unint64_t)[v16 numberOfVisibleItems] - 1);
  [v16 stackPerspectiveOffset];
  double v13 = 204.0 - v11 * fabs(v12);
  objc_msgSend(v16, "setStackSize:", 272.0, v13);
  objc_msgSend(v16, "setStackOffset:", 0.0, (204.0 - v13) * 0.5);
  if ([v10 count])
  {
    unint64_t v14 = 0;
    do
    {
      v15 = [v10 objectAtIndexedSubscript:v14];
      [v16 setImage:v15 forItemAtIndex:v14];

      ++v14;
    }
    while (v14 < (unint64_t)[v10 count]);
  }
  [(PDCRemotePreviewController *)self setView:v16];
}

@end