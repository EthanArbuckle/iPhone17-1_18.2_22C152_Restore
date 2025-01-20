@interface CUINamedLayerImage
- (BOOL)fixedFrame;
- (CGRect)frame;
- (CUINamedLayerImage)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5;
- (double)opacity;
- (int)blendMode;
- (void)setBlendMode:(int)a3;
- (void)setFixedFrame:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setOpacity:(double)a3;
@end

@implementation CUINamedLayerImage

- (CUINamedLayerImage)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CUINamedLayerImage;
  result = [(CUINamedImage *)&v6 initWithName:a3 usingRenditionKey:a4 fromTheme:a5];
  if (result)
  {
    result->_opacity = 1.0;
    result->_blendMode = 0;
  }
  return result;
}

- (double)opacity
{
  v5.receiver = self;
  v5.super_class = (Class)CUINamedLayerImage;
  [(CUINamedImage *)&v5 opacity];
  return v3 * self->_opacity;
}

- (int)blendMode
{
  v4.receiver = self;
  v4.super_class = (Class)CUINamedLayerImage;
  int result = [(CUINamedImage *)&v4 blendMode];
  if (self->_blendMode > 0) {
    return self->_blendMode;
  }
  return result;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setOpacity:(double)a3
{
  self->_opacitdouble y = a3;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (BOOL)fixedFrame
{
  return self->_fixedFrame;
}

- (void)setFixedFrame:(BOOL)a3
{
  self->_fixedFrame = a3;
}

@end