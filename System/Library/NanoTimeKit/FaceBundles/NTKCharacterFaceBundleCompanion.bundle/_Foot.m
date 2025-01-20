@interface _Foot
- (NSMutableArray)texs;
- (char)animFrame;
- (char)frameDisplayTime60th;
- (unsigned)state;
- (void)setAnimFrame:(char)a3;
- (void)setFrameDisplayTime60th:(char)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setTexs:(id)a3;
@end

@implementation _Foot

- (NSMutableArray)texs
{
  return self->_texs;
}

- (void)setTexs:(id)a3
{
}

- (char)animFrame
{
  return self->_animFrame;
}

- (void)setAnimFrame:(char)a3
{
  self->_animFrame = a3;
}

- (char)frameDisplayTime60th
{
  return self->_frameDisplayTime60th;
}

- (void)setFrameDisplayTime60th:(char)a3
{
  self->_frameDisplayTime60th = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end