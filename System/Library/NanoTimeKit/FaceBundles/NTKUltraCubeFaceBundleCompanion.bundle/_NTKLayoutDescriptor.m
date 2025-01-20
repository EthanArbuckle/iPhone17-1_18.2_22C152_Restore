@interface _NTKLayoutDescriptor
- (CGRect)crop;
- (_NTKLayoutDescriptor)init;
- (double)baseline;
- (double)maskedImageZorder;
- (double)timeElementZorder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)position;
- (void)setBaseline:(double)a3;
- (void)setCrop:(CGRect)a3;
- (void)setMaskedImageZorder:(double)a3;
- (void)setPosition:(int64_t)a3;
- (void)setTimeElementZorder:(double)a3;
@end

@implementation _NTKLayoutDescriptor

- (_NTKLayoutDescriptor)init
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKLayoutDescriptor;
  result = [(_NTKLayoutDescriptor *)&v4 init];
  if (result)
  {
    CGSize size = CGRectNull.size;
    result->_crop.origin = CGRectNull.origin;
    result->_crop.CGSize size = size;
    result->_timeElementZorder = 0.0;
    result->_maskedImageZorder = 0.0;
    result->_baseline = 0.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCrop:", self->_crop.origin.x, self->_crop.origin.y, self->_crop.size.width, self->_crop.size.height);
  [v4 setBaseline:self->_baseline];
  [v4 setMaskedImageZorder:self->_maskedImageZorder];
  [v4 setTimeElementZorder:self->_timeElementZorder];
  return v4;
}

- (int64_t)position
{
  [(_NTKLayoutDescriptor *)self maskedImageZorder];
  double v4 = v3;
  [(_NTKLayoutDescriptor *)self timeElementZorder];
  if (v4 > v5) {
    return 3;
  }
  [(_NTKLayoutDescriptor *)self baseline];
  if (v7 == 0.328125) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)setPosition:(int64_t)a3
{
  int64_t v4 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 3)
  {
    double v7 = &NTKUltraCubePhotoTimeElementBelowUnitBaseY;
    double v6 = 2.0;
    double v5 = 1.0;
  }
  else
  {
    double v5 = dbl_44458[v4];
    double v6 = dbl_44478[v4];
    double v7 = off_49448[v4];
  }
  [(_NTKLayoutDescriptor *)self setMaskedImageZorder:v5];
  [(_NTKLayoutDescriptor *)self setTimeElementZorder:v6];
  double v8 = *(double *)v7;

  [(_NTKLayoutDescriptor *)self setBaseline:v8];
}

- (CGRect)crop
{
  double x = self->_crop.origin.x;
  double y = self->_crop.origin.y;
  double width = self->_crop.size.width;
  double height = self->_crop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCrop:(CGRect)a3
{
  self->_crop = a3;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (double)timeElementZorder
{
  return self->_timeElementZorder;
}

- (void)setTimeElementZorder:(double)a3
{
  self->_timeElementZorder = a3;
}

- (double)maskedImageZorder
{
  return self->_maskedImageZorder;
}

- (void)setMaskedImageZorder:(double)a3
{
  self->_maskedImageZorder = a3;
}

@end