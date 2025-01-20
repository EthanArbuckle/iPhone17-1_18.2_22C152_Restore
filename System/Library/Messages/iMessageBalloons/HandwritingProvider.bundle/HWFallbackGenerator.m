@interface HWFallbackGenerator
- (void)fallbackForData:(id)a3 inFileURL:(id)a4 completionBlock:(id)a5;
@end

@implementation HWFallbackGenerator

- (void)fallbackForData:(id)a3 inFileURL:(id)a4 completionBlock:(id)a5
{
  v7 = (void (**)(id, void *, void, uint64_t, uint64_t))a5;
  id v8 = a4;
  v9 = +[HWEncoding decodeHandwritingFromData:a3];
  v10 = [v9 drawing];
  v11 = +[UIColor fallbackInkColor];
  v12 = +[DKInkThumbnailRenderer imageForDrawing:fittingInSize:backingScale:color:highFidelity:](DKInkThumbnailRenderer, "imageForDrawing:fittingInSize:backingScale:color:highFidelity:", v10, v11, 1, 184.0, 94.0, 3.0);

  [v12 size];
  BOOL v15 = v13 == v14;
  if (v14 <= 16.0) {
    BOOL v15 = 0;
  }
  BOOL v16 = v13 > 16.0;
  double v17 = v13 + 16.0;
  double v18 = v14 + 16.0;
  if (v16 && v15) {
    double v19 = v18;
  }
  else {
    double v19 = 110.0;
  }
  if (v16 && v15) {
    double v20 = v17;
  }
  else {
    double v20 = 200.0;
  }
  [v12 size];
  double v22 = v19 - (v21 + 8.0);
  v36.width = v20;
  v36.height = v19;
  UIGraphicsBeginImageContextWithOptions(v36, 1, 3.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v24 = +[UIColor drawingCanvasBackgroundColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v24 CGColor]);

  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = v20;
  v37.size.height = v19;
  CGContextFillRect(CurrentContext, v37);
  [v12 size];
  double v26 = v25;
  [v12 size];
  objc_msgSend(v12, "drawInRect:", 8.0, v22, v26, v27);
  UIGraphicsGetImageFromCurrentImageContext();
  v28 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v29 = UIImageJPEGRepresentation(v28, 0.75);
  v30 = [v8 URLByAppendingPathComponent:@"handwriting.jpg"];

  id v34 = 0;
  unsigned int v31 = [v29 writeToURL:v30 options:1 error:&v34];
  id v32 = v34;
  if (v31)
  {
    v35 = v30;
    v33 = +[NSArray arrayWithObjects:&v35 count:1];
    v7[2](v7, v33, 0, 1, 1);
  }
  else
  {
    ((void (**)(id, void *, id, uint64_t, uint64_t))v7)[2](v7, 0, v32, 0, 1);
  }
}

@end