@interface _Head
- (NSMutableArray)blinkTexs;
- (NSMutableArray)texs;
- (double)bone;
- (double)offset;
- (float)curHeadTilt;
- (float)curHeadX;
- (float)height;
- (float)width;
- (int)inAnimation;
- (void)setBlinkTexs:(id)a3;
- (void)setBone:(_Head *)self;
- (void)setCurHeadTilt:(float)a3;
- (void)setCurHeadX:(float)a3;
- (void)setHeight:(float)a3;
- (void)setInAnimation:(int)a3;
- (void)setOffset:(_Head *)self;
- (void)setTexs:(id)a3;
- (void)setWidth:(float)a3;
@end

@implementation _Head

- (float)width
{
  return self->_width;
}

- (void)setWidth:(float)a3
{
  self->_width = a3;
}

- (float)height
{
  return self->_height;
}

- (void)setHeight:(float)a3
{
  self->_height = a3;
}

- (NSMutableArray)texs
{
  return self->_texs;
}

- (void)setTexs:(id)a3
{
}

- (NSMutableArray)blinkTexs
{
  return self->_blinkTexs;
}

- (void)setBlinkTexs:(id)a3
{
}

- (double)bone
{
  return *(double *)(a1 + 56);
}

- (void)setBone:(_Head *)self
{
  *(void *)self->_bone = v2;
}

- (double)offset
{
  return *(double *)(a1 + 64);
}

- (void)setOffset:(_Head *)self
{
  *(void *)self->_offset = v2;
}

- (float)curHeadTilt
{
  return self->_curHeadTilt;
}

- (void)setCurHeadTilt:(float)a3
{
  self->_curHeadTilt = a3;
}

- (float)curHeadX
{
  return self->_curHeadX;
}

- (void)setCurHeadX:(float)a3
{
  self->_curHeadX = a3;
}

- (int)inAnimation
{
  return self->_inAnimation;
}

- (void)setInAnimation:(int)a3
{
  self->_inAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkTexs, 0);

  objc_storeStrong((id *)&self->_texs, 0);
}

@end