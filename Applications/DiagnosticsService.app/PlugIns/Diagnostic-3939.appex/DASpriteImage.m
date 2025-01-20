@interface DASpriteImage
+ (id)imagesFromSprite:(id)a3 inRange:(_NSRange)a4 withImageSize:(CGSize)a5;
@end

@implementation DASpriteImage

+ (id)imagesFromSprite:(id)a3 inRange:(_NSRange)a4 withImageSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v10 = v9;
  if (!v9
    || (height == CGSizeZero.height ? (BOOL v11 = width == CGSizeZero.width) : (BOOL v11 = 0),
        !v11 ? (BOOL v12 = length == 0) : (BOOL v12 = 1),
        v12))
  {
    v15 = 0;
  }
  else
  {
    v14 = (CGImage *)[v9 CGImage];
    v15 = +[NSMutableArray arrayWithCapacity:length];
    size_t v16 = CGImageGetWidth(v14);
    size_t v17 = CGImageGetHeight(v14);
    unint64_t v18 = (int)((double)v16 / width);
    int v19 = (int)(height * (double)(location / v18));
    if (v17 > v19)
    {
      unint64_t v20 = v17;
      int v21 = (int)(width * (double)(location % v18));
      do
      {
        double v22 = (double)v19;
        while (v16 > v21)
        {
          double v23 = (double)v21;
          v28.origin.x = (double)v21;
          v28.origin.y = v22;
          v28.size.double width = width;
          v28.size.double height = height;
          v24 = CGImageCreateWithImageInRect(v14, v28);
          v25 = +[UIImage imageWithCGImage:v24];
          [v15 addObject:v25];

          CGImageRelease(v24);
          id v26 = [v15 count];
          int v21 = (int)(width + v23);
          if (v26 == (id)length) {
            goto LABEL_11;
          }
        }
        int v21 = 0;
        int v19 = (int)(height + v22);
      }
      while (v20 > v19);
    }
  }
LABEL_11:

  return v15;
}

@end