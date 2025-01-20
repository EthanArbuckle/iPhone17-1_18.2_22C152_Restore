@interface PKStrokeSelectionImageConfig
- (BOOL)highlighted;
- (BOOL)invertedColors;
- (BOOL)isEqual:(id)a3;
- (BOOL)rotated;
- (BOOL)sixChannel;
- (CGRect)imageViewBounds;
- (CGRect)strokeBounds;
- (CGSize)imageSize;
- (PKStrokeSelectionImageConfig)initWithStrokeBounds:(CGRect)a3 imageViewBounds:(CGRect)a4 scale:(double)a5 imageSize:(CGSize)a6 invertedColors:(BOOL)a7 rotated:(BOOL)a8 sixChannel:(BOOL)a9 highlighted:(BOOL)a10;
- (double)scale;
- (unint64_t)hash;
@end

@implementation PKStrokeSelectionImageConfig

- (PKStrokeSelectionImageConfig)initWithStrokeBounds:(CGRect)a3 imageViewBounds:(CGRect)a4 scale:(double)a5 imageSize:(CGSize)a6 invertedColors:(BOOL)a7 rotated:(BOOL)a8 sixChannel:(BOOL)a9 highlighted:(BOOL)a10
{
  char height_low = LOBYTE(a6.height);
  char width_low = LOBYTE(a6.width);
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v18 = a3.size.height;
  CGFloat v19 = a3.size.width;
  CGFloat v20 = a3.origin.y;
  CGFloat v21 = a3.origin.x;
  result = [(PKStrokeSelectionImageConfig *)self init];
  if (result)
  {
    result->_strokeBounds.origin.CGFloat y = v20;
    result->_strokeBounds.size.CGFloat width = v19;
    result->_strokeBounds.size.CGFloat height = v18;
    result->_imageViewBounds.origin.CGFloat x = x;
    result->_imageViewBounds.origin.CGFloat y = y;
    result->_imageViewBounds.size.CGFloat width = width;
    result->_imageViewBounds.size.CGFloat height = height;
    result->_scale = a5;
    result->_imageSize.CGFloat width = v23;
    result->_imageSize.CGFloat height = v24;
    result->_strokeBounds.origin.CGFloat x = v21;
    result->_invertedColors = width_low;
    result->_rotated = height_low;
    result->_sixChannel = a7;
    result->_highlighted = a8;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = PKHashBytes((uint64_t)&self->_strokeBounds, 32);
  uint64_t v4 = PKHashBytes((uint64_t)&self->_imageViewBounds, 32) ^ v3;
  uint64_t v5 = PKHashBytes((uint64_t)&self->_scale, 8);
  return v4 ^ v5 ^ PKHashBytes((uint64_t)&self->_imageSize, 16) ^ self->_invertedColors ^ (2 * self->_rotated);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 strokeBounds];
    v23.origin.CGFloat x = v6;
    v23.origin.CGFloat y = v7;
    v23.size.CGFloat width = v8;
    v23.size.CGFloat height = v9;
    if (!CGRectEqualToRect(self->_strokeBounds, v23)) {
      goto LABEL_11;
    }
    [v5 imageViewBounds];
    v24.origin.CGFloat x = v10;
    v24.origin.CGFloat y = v11;
    v24.size.CGFloat width = v12;
    v24.size.CGFloat height = v13;
    if (!CGRectEqualToRect(self->_imageViewBounds, v24)) {
      goto LABEL_11;
    }
    double scale = self->_scale;
    [v5 scale];
    if (scale != v15) {
      goto LABEL_11;
    }
    [v5 imageSize];
    BOOL v17 = 0;
    if (self->_imageSize.width != v18 || self->_imageSize.height != v16) {
      goto LABEL_12;
    }
    int invertedColors = self->_invertedColors;
    if (invertedColors == [v5 invertedColors]
      && (int rotated = self->_rotated, rotated == [v5 rotated]))
    {
      int sixChannel = self->_sixChannel;
      BOOL v17 = sixChannel == [v5 sixChannel];
    }
    else
    {
LABEL_11:
      BOOL v17 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (CGRect)strokeBounds
{
  double x = self->_strokeBounds.origin.x;
  double y = self->_strokeBounds.origin.y;
  double width = self->_strokeBounds.size.width;
  double height = self->_strokeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)imageViewBounds
{
  double x = self->_imageViewBounds.origin.x;
  double y = self->_imageViewBounds.origin.y;
  double width = self->_imageViewBounds.size.width;
  double height = self->_imageViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)invertedColors
{
  return self->_invertedColors;
}

- (BOOL)rotated
{
  return self->_rotated;
}

- (BOOL)sixChannel
{
  return self->_sixChannel;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

@end