@interface ADNilDistortionModel
- (ADNilDistortionModel)initWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation:(BOOL)a3;
- (unint64_t)hash;
- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6;
- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6;
@end

@implementation ADNilDistortionModel

- (id)dictionaryRepresentation:(BOOL)a3
{
  return 0;
}

- (ADNilDistortionModel)initWithDictionary:(id)a3
{
  v4 = (ADNilDistortionModel *)objc_opt_new();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_opt_new();
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADNilDistortionModel *)a3;
  v5 = v4;
  char v6 = 1;
  if (v4 && self != v4) {
    char v6 = [(ADNilDistortionModel *)v4 isMemberOfClass:objc_opt_class()];
  }

  return v6;
}

@end