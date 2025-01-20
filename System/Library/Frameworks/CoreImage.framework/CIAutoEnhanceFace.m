@interface CIAutoEnhanceFace
- (CGRect)faceRect;
- (CIAutoEnhanceFace)initWithBounds:(CGRect)a3 andImage:(id)a4 usingContext:(id)a5;
- (double)I;
- (double)Q;
- (id)description;
- (int)centerX;
- (int)centerY;
- (int)size;
@end

@implementation CIAutoEnhanceFace

- (CIAutoEnhanceFace)initWithBounds:(CGRect)a3 andImage:(id)a4 usingContext:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v35.origin.double x = a3.origin.x + a3.size.width * 0.339999974 * 0.5;
  v35.origin.double y = a3.origin.y + a3.size.height * 0.339999974 * 0.5;
  v35.size.double width = a3.size.width * 0.660000026;
  v35.size.double height = a3.size.height * 0.660000026;
  CGRect v36 = CGRectIntegral(v35);
  double x = v36.origin.x;
  double y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;
  v32.receiver = self;
  v32.super_class = (Class)CIAutoEnhanceFace;
  v12 = [(CIAutoEnhanceFace *)&v32 init];
  v13 = v12;
  if (v12)
  {
    if (width >= height) {
      double v14 = height;
    }
    else {
      double v14 = width;
    }
    v12->size = (int)v14;
    v12->centerX = (int)(x + width * 0.5);
    v12->centerY = (int)(y + height * 0.5);
    CGAffineTransformMakeTranslation(&v31, -x, -y);
    v15 = (void *)[a4 imageByApplyingTransform:&v31];
    CGAffineTransformMakeScale(&v30, 16.0 / width, 16.0 / height);
    uint64_t v16 = [v15 imageByApplyingTransform:&v30];
    bzero(v33, 0x400uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    double v18 = 0.0;
    objc_msgSend(a5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v16, v33, 64, 264, DeviceRGB, 0.0, 0.0, 16.0, 16.0);
    CGColorSpaceRelease(DeviceRGB);
    uint64_t v20 = 0;
    double v21 = 0.212;
    double v22 = 0.0;
    do
    {
      LOBYTE(v21) = v33[v20];
      LOBYTE(v19) = v33[v20 + 1];
      *(double *)&unint64_t v23 = (double)*(unint64_t *)&v19;
      long double v24 = *(double *)&v23 / 255.0;
      LOBYTE(v23) = v33[v20 + 2];
      long double v25 = (double)v23 / 255.0;
      double v26 = pow((double)*(unint64_t *)&v21 / 255.0, 0.55);
      double v27 = pow(v24, 0.55);
      long double v28 = pow(v25, 0.55);
      double v22 = v22 + v27 * -0.2755 + v26 * 0.596 + v28 * -0.321;
      double v19 = v27 * -0.523 + v26 * 0.212;
      double v21 = v19 + v28 * 0.311;
      double v18 = v18 + v21;
      v20 += 4;
    }
    while (v20 != 1024);
    v13->I = v22 * 0.00390625;
    v13->Q = v18 * 0.00390625;
  }
  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"size = %d, center = %d, %d, I = %g, Q = %g", self->size, self->centerX, self->centerY, *(void *)&self->I, *(void *)&self->Q];
}

- (CGRect)faceRect
{
  int size = self->size;
  double v3 = (double)(self->centerX - size);
  double v4 = (double)(self->centerY - size);
  double v5 = (double)(2 * size);
  double v6 = v5;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (int)size
{
  return self->size;
}

- (int)centerX
{
  return self->centerX;
}

- (int)centerY
{
  return self->centerY;
}

- (double)I
{
  return self->I;
}

- (double)Q
{
  return self->Q;
}

@end