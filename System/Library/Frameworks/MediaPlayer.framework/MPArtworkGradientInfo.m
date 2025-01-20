@interface MPArtworkGradientInfo
- (MPArtworkGradientInfo)initWithColor:(id)a3 y1:(double)a4 y2:(double)a5;
- (UIColor)color;
- (double)y1;
- (double)y2;
- (void)setColor:(id)a3;
- (void)setY1:(double)a3;
- (void)setY2:(double)a3;
@end

@implementation MPArtworkGradientInfo

- (void).cxx_destruct
{
}

- (void)setColor:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setY2:(double)a3
{
  self->_y2 = a3;
}

- (double)y2
{
  return self->_y2;
}

- (void)setY1:(double)a3
{
  self->_y1 = a3;
}

- (double)y1
{
  return self->_y1;
}

- (MPArtworkGradientInfo)initWithColor:(id)a3 y1:(double)a4 y2:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPArtworkGradientInfo;
  v10 = [(MPArtworkGradientInfo *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_y1 = a4;
    v10->_y2 = a5;
    objc_storeStrong((id *)&v10->_color, a3);
  }

  return v11;
}

@end