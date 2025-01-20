@interface CUIPSDLayer
- (CUIPSDLayer)init;
- (NSString)name;
- (double)opacity;
- (int)blendMode;
- (void)dealloc;
- (void)setBlendMode:(int)a3;
- (void)setName:(id)a3;
- (void)setOpacity:(double)a3;
@end

@implementation CUIPSDLayer

- (CUIPSDLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayer;
  result = [(CUIPSDLayer *)&v3 init];
  if (result)
  {
    result->_opacity = 1.0;
    result->_blendMode = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayer;
  [(CUIPSDLayer *)&v3 dealloc];
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end