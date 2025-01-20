@interface CKImageTransparencyTrimmer
- (BOOL)isTooSmallToTrim;
- (CGRect)trimmedFrame;
- (CGSize)size;
- (UIImage)image;
- (char)bitmap;
- (double)height;
- (double)trimmedBottom;
- (double)trimmedLeft;
- (double)trimmedRight;
- (double)trimmedTop;
- (id)trimTransparencyFromImage:(id)a3;
- (int)bitmapSize;
- (int)bytesPerRow;
- (unsigned)pixel:(int)a3 col:(int)a4;
- (void)dealloc;
- (void)setBitmap:(char *)a3;
- (void)setBitmapSize:(int)a3;
- (void)setBytesPerRow:(int)a3;
- (void)setImage:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation CKImageTransparencyTrimmer

- (void)dealloc
{
  [(CKImageTransparencyTrimmer *)self setBitmap:0];
  v3.receiver = self;
  v3.super_class = (Class)CKImageTransparencyTrimmer;
  [(CKImageTransparencyTrimmer *)&v3 dealloc];
}

- (double)height
{
  [(CKImageTransparencyTrimmer *)self size];
  return v2;
}

- (BOOL)isTooSmallToTrim
{
  [(CKImageTransparencyTrimmer *)self size];
  if (v3 < 2.0) {
    return 1;
  }
  [(CKImageTransparencyTrimmer *)self size];
  return v5 < 2.0;
}

- (unsigned)pixel:(int)a3 col:(int)a4
{
  return self->_bitmap[a4 + self->_bytesPerRow * a3];
}

- (void)setBitmap:(char *)a3
{
  bitmap = self->_bitmap;
  if (bitmap) {
    free(bitmap);
  }
  self->_bitmap = a3;
}

- (double)trimmedTop
{
  [(CKImageTransparencyTrimmer *)self height];
  double v3 = 0.0;
  if (v4 > 0.0)
  {
    uint64_t v6 = 0;
    while (1)
    {
      [(CKImageTransparencyTrimmer *)self width];
      if (v7 > 0.0) {
        break;
      }
LABEL_8:
      uint64_t v6 = (v6 + 1);
      double v3 = (double)(int)v6;
      [(CKImageTransparencyTrimmer *)self height];
      if (v10 <= (double)(int)v6) {
        return 0.0;
      }
    }
    uint64_t v8 = 0;
    while (![(CKImageTransparencyTrimmer *)self pixel:v6 col:v8])
    {
      uint64_t v8 = (v8 + 1);
      [(CKImageTransparencyTrimmer *)self width];
      if (v9 <= (double)(int)v8) {
        goto LABEL_8;
      }
    }
  }
  return v3;
}

- (double)trimmedLeft
{
  [(CKImageTransparencyTrimmer *)self width];
  double v4 = v3;
  [(CKImageTransparencyTrimmer *)self height];
  if (v5 > 0.0)
  {
    uint64_t v6 = 0;
    do
    {
      [(CKImageTransparencyTrimmer *)self width];
      if (v7 > 0.0)
      {
        uint64_t v8 = 0;
        double v9 = 0.0;
        do
        {
          int v10 = [(CKImageTransparencyTrimmer *)self pixel:v6 col:v8];
          BOOL v11 = v4 < v9 || v10 == 0;
          if (!v11) {
            double v4 = v9;
          }
          uint64_t v8 = (v8 + 1);
          double v9 = (double)(int)v8;
          [(CKImageTransparencyTrimmer *)self width];
        }
        while (v12 > (double)(int)v8);
      }
      uint64_t v6 = (v6 + 1);
      [(CKImageTransparencyTrimmer *)self height];
    }
    while (v13 > (double)(int)v6);
  }
  [(CKImageTransparencyTrimmer *)self width];
  BOOL v11 = v4 == v14;
  double result = 0.0;
  if (!v11) {
    return v4;
  }
  return result;
}

- (double)trimmedRight
{
  [(CKImageTransparencyTrimmer *)self height];
  if (v3 > 0.0)
  {
    uint64_t v4 = 0;
    double v5 = 0.0;
    do
    {
      [(CKImageTransparencyTrimmer *)self width];
      uint64_t v7 = (int)(v6 + -1.0);
      if ((v7 & 0x80000000) == 0)
      {
        do
        {
          int v8 = [(CKImageTransparencyTrimmer *)self pixel:v4 col:v7];
          double v9 = (double)(int)v7;
          if (v5 >= (double)(int)v7) {
            double v9 = v5;
          }
          if (v8) {
            double v5 = v9;
          }
          uint64_t v7 = (v7 - 1);
        }
        while (v7 != -1);
      }
      uint64_t v4 = (v4 + 1);
      [(CKImageTransparencyTrimmer *)self height];
    }
    while (v10 > (double)(int)v4);
    if (v5 != 0.0) {
      return v5;
    }
  }

  [(CKImageTransparencyTrimmer *)self width];
  return result;
}

- (double)trimmedBottom
{
  [(CKImageTransparencyTrimmer *)self height];
  uint64_t v4 = (int)(v3 + -1.0);
  if ((v4 & 0x80000000) != 0)
  {
LABEL_8:
    [(CKImageTransparencyTrimmer *)self height];
  }
  else
  {
    while (1)
    {
      [(CKImageTransparencyTrimmer *)self width];
      if (v5 > 0.0) {
        break;
      }
LABEL_6:
      BOOL v8 = (int)v4 <= 0;
      uint64_t v4 = (v4 - 1);
      if (v8) {
        goto LABEL_8;
      }
    }
    uint64_t v6 = 0;
    while (![(CKImageTransparencyTrimmer *)self pixel:v4 col:v6])
    {
      uint64_t v6 = (v6 + 1);
      [(CKImageTransparencyTrimmer *)self width];
      if (v7 <= (double)(int)v6) {
        goto LABEL_6;
      }
    }
    return (double)(int)v4;
  }
  return result;
}

- (CGRect)trimmedFrame
{
  [(CKImageTransparencyTrimmer *)self trimmedLeft];
  double v4 = fmax(v3 + -2.0, 0.0);
  [(CKImageTransparencyTrimmer *)self width];
  double v6 = v5;
  [(CKImageTransparencyTrimmer *)self trimmedRight];
  double v8 = v7 + 2.0;
  if (v6 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v6;
  }
  [(CKImageTransparencyTrimmer *)self trimmedTop];
  double v11 = fmax(v10 + -2.0, 0.0);
  [(CKImageTransparencyTrimmer *)self height];
  double v13 = v12;
  [(CKImageTransparencyTrimmer *)self trimmedBottom];
  double v15 = v14 + 2.0;
  if (v13 < v15) {
    double v15 = v13;
  }
  double v16 = v9 - v4;
  double v17 = v15 - v11;
  double v18 = v4;
  double v19 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)trimTransparencyFromImage:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
    [(CKImageTransparencyTrimmer *)self setImage:v6];
    [v6 size];
    -[CKImageTransparencyTrimmer setSize:](self, "setSize:");
    [(CKImageTransparencyTrimmer *)self size];
    [(CKImageTransparencyTrimmer *)self setBytesPerRow:(int)v7];
    if (![(CKImageTransparencyTrimmer *)self isTooSmallToTrim])
    {
      [(CKImageTransparencyTrimmer *)self width];
      double v9 = v8;
      [(CKImageTransparencyTrimmer *)self height];
      [(CKImageTransparencyTrimmer *)self setBitmapSize:(int)(v9 * v10)];
      [(CKImageTransparencyTrimmer *)self width];
      double v12 = v11;
      [(CKImageTransparencyTrimmer *)self height];
      [(CKImageTransparencyTrimmer *)self setBitmap:malloc_type_calloc((unint64_t)(v12 * v13), 1uLL, 0x100004077774924uLL)];
      double v14 = [(CKImageTransparencyTrimmer *)self bitmap];
      [(CKImageTransparencyTrimmer *)self width];
      size_t v16 = (unint64_t)v15;
      [(CKImageTransparencyTrimmer *)self height];
      double v18 = CGBitmapContextCreate(v14, v16, (unint64_t)v17, 8uLL, [(CKImageTransparencyTrimmer *)self bytesPerRow], 0, 7u);
      id v19 = [(CKImageTransparencyTrimmer *)self image];
      v20 = (CGImage *)[v19 CGImage];

      [(CKImageTransparencyTrimmer *)self width];
      CGFloat v22 = v21;
      [(CKImageTransparencyTrimmer *)self height];
      CGFloat v24 = v23;
      v40.origin.x = 0.0;
      v40.origin.y = 0.0;
      v40.size.width = v22;
      v40.size.height = v24;
      CGContextDrawImage(v18, v40, v20);
      [(CKImageTransparencyTrimmer *)self trimmedFrame];
      double v26 = v25;
      double v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      v41.origin.x = 0.0;
      v41.origin.y = 0.0;
      v41.size.width = v22;
      v41.size.height = v24;
      v42.origin.x = v26;
      v42.origin.y = v28;
      v42.size.width = v30;
      v42.size.height = v32;
      if (!CGRectEqualToRect(v41, v42))
      {
        [v6 scale];
        CGFloat v34 = v33;
        v39.width = v30;
        v39.height = v32;
        UIGraphicsBeginImageContextWithOptions(v39, 0, v34);
        objc_msgSend(v6, "drawAtPoint:", -v26, -v28);
        uint64_t v35 = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
        id v6 = (id)v35;
      }
      if (v18) {
        CGContextRelease(v18);
      }
      [(CKImageTransparencyTrimmer *)self setBitmap:0];
      [(CKImageTransparencyTrimmer *)self setImage:0];
    }
    id v36 = v6;
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (char)bitmap
{
  return self->_bitmap;
}

- (int)bitmapSize
{
  return self->_bitmapSize;
}

- (void)setBitmapSize:(int)a3
{
  self->_bitmapSize = a3;
}

- (int)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(int)a3
{
  self->_bytesPerRow = a3;
}

- (void).cxx_destruct
{
}

@end