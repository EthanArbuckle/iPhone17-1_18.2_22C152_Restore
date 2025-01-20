@interface MADImagePersonalizationFace
+ (BOOL)supportsSecureCoding;
- (CGRect)normalizedCropRect;
- (MADImagePersonalizationFace)initWithCoder:(id)a3;
- (MADImagePersonalizationFace)initWithNormalizedCropRect:(CGRect)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADImagePersonalizationFace

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImagePersonalizationFace)initWithNormalizedCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)MADImagePersonalizationFace;
  result = [(MADImagePersonalizationFace *)&v8 init];
  if (result)
  {
    result->_normalizedCropRect.origin.CGFloat x = x;
    result->_normalizedCropRect.origin.CGFloat y = y;
    result->_normalizedCropRect.size.CGFloat width = width;
    result->_normalizedCropRect.size.CGFloat height = height;
  }
  return result;
}

- (MADImagePersonalizationFace)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADImagePersonalizationFace;
  v5 = [(MADImagePersonalizationFace *)&v11 init];
  if (v5)
  {
    [v4 decodeRectForKey:@"NormalizedCropRect"];
    v5->_normalizedCropRect.origin.CGFloat x = v6;
    v5->_normalizedCropRect.origin.CGFloat y = v7;
    v5->_normalizedCropRect.size.CGFloat width = v8;
    v5->_normalizedCropRect.size.CGFloat height = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"normalizedCropRect: (%0.3f, %0.3f) to (%0.3f, %0.3f)>", *(void *)&self->_normalizedCropRect.origin.x, *(void *)&self->_normalizedCropRect.origin.y, self->_normalizedCropRect.origin.x + self->_normalizedCropRect.size.width, self->_normalizedCropRect.origin.y + self->_normalizedCropRect.size.height];
  return v3;
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end