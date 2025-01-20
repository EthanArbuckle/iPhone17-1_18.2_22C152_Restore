@interface _Body
- (NSArray)texs;
- (NSMutableArray)shiftTexs12;
- (NSMutableArray)shiftTexs13;
- (NSMutableArray)shiftTexs14;
- (NSMutableArray)shiftTexs23;
- (char)animationDirection;
- (char)animationFrame;
- (char)frameDisplayTime60th;
- (double)bone;
- (double)offset;
- (float)curBodyX;
- (float)height;
- (float)width;
- (unsigned)state;
- (unsigned)waitingForFootRaise;
- (void)setAnimationDirection:(char)a3;
- (void)setAnimationFrame:(char)a3;
- (void)setBone:(_Body *)self;
- (void)setCurBodyX:(float)a3;
- (void)setFrameDisplayTime60th:(char)a3;
- (void)setHeight:(float)a3;
- (void)setOffset:(_Body *)self;
- (void)setShiftTexs12:(id)a3;
- (void)setShiftTexs13:(id)a3;
- (void)setShiftTexs14:(id)a3;
- (void)setShiftTexs23:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setTexs:(id)a3;
- (void)setWaitingForFootRaise:(unsigned __int8)a3;
- (void)setWidth:(float)a3;
@end

@implementation _Body

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

- (NSArray)texs
{
  return self->_texs;
}

- (void)setTexs:(id)a3
{
}

- (NSMutableArray)shiftTexs12
{
  return self->_shiftTexs12;
}

- (void)setShiftTexs12:(id)a3
{
}

- (NSMutableArray)shiftTexs14
{
  return self->_shiftTexs14;
}

- (void)setShiftTexs14:(id)a3
{
}

- (NSMutableArray)shiftTexs23
{
  return self->_shiftTexs23;
}

- (void)setShiftTexs23:(id)a3
{
}

- (NSMutableArray)shiftTexs13
{
  return self->_shiftTexs13;
}

- (void)setShiftTexs13:(id)a3
{
}

- (double)bone
{
  return *(double *)(a1 + 80);
}

- (void)setBone:(_Body *)self
{
  *(void *)self->_bone = v2;
}

- (double)offset
{
  return *(double *)(a1 + 88);
}

- (void)setOffset:(_Body *)self
{
  *(void *)self->_offset = v2;
}

- (float)curBodyX
{
  return self->_curBodyX;
}

- (void)setCurBodyX:(float)a3
{
  self->_curBodyX = a3;
}

- (char)animationDirection
{
  return self->_animationDirection;
}

- (void)setAnimationDirection:(char)a3
{
  self->_animationDirection = a3;
}

- (char)animationFrame
{
  return self->_animationFrame;
}

- (void)setAnimationFrame:(char)a3
{
  self->_animationFrame = a3;
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

- (unsigned)waitingForFootRaise
{
  return self->_waitingForFootRaise;
}

- (void)setWaitingForFootRaise:(unsigned __int8)a3
{
  self->_waitingForFootRaise = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftTexs13, 0);
  objc_storeStrong((id *)&self->_shiftTexs23, 0);
  objc_storeStrong((id *)&self->_shiftTexs14, 0);
  objc_storeStrong((id *)&self->_shiftTexs12, 0);

  objc_storeStrong((id *)&self->_texs, 0);
}

@end