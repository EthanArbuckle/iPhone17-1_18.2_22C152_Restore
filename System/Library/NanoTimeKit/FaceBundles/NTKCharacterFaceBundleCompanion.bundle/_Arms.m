@interface _Arms
- (NSArray)texHandMnut;
- (NSNumber)texArm;
- (NSNumber)texHandHour;
- (float)curLeftBend;
- (float)curRightBend;
- (float)leftShoulderAdjustment;
- (float)leftShoulderX;
- (float)rightShoulderAdjustment;
- (float)rightShoulderX;
- (unint64_t)mtlBufArmOffset;
- (unint64_t)mtlBufHandOffset;
- (void)setCurLeftBend:(float)a3;
- (void)setCurRightBend:(float)a3;
- (void)setLeftShoulderAdjustment:(float)a3;
- (void)setLeftShoulderX:(float)a3;
- (void)setMtlBufArmOffset:(unint64_t)a3;
- (void)setMtlBufHandOffset:(unint64_t)a3;
- (void)setRightShoulderAdjustment:(float)a3;
- (void)setRightShoulderX:(float)a3;
- (void)setTexArm:(id)a3;
- (void)setTexHandHour:(id)a3;
- (void)setTexHandMnut:(id)a3;
@end

@implementation _Arms

- (NSArray)texHandMnut
{
  return self->_texHandMnut;
}

- (void)setTexHandMnut:(id)a3
{
}

- (NSNumber)texHandHour
{
  return self->_texHandHour;
}

- (void)setTexHandHour:(id)a3
{
}

- (NSNumber)texArm
{
  return self->_texArm;
}

- (void)setTexArm:(id)a3
{
}

- (unint64_t)mtlBufHandOffset
{
  return self->_mtlBufHandOffset;
}

- (void)setMtlBufHandOffset:(unint64_t)a3
{
  self->_mtlBufHandOffset = a3;
}

- (unint64_t)mtlBufArmOffset
{
  return self->_mtlBufArmOffset;
}

- (void)setMtlBufArmOffset:(unint64_t)a3
{
  self->_mtlBufArmOffset = a3;
}

- (float)leftShoulderX
{
  return self->_leftShoulderX;
}

- (void)setLeftShoulderX:(float)a3
{
  self->_leftShoulderX = a3;
}

- (float)rightShoulderX
{
  return self->_rightShoulderX;
}

- (void)setRightShoulderX:(float)a3
{
  self->_rightShoulderX = a3;
}

- (float)leftShoulderAdjustment
{
  return self->_leftShoulderAdjustment;
}

- (void)setLeftShoulderAdjustment:(float)a3
{
  self->_leftShoulderAdjustment = a3;
}

- (float)rightShoulderAdjustment
{
  return self->_rightShoulderAdjustment;
}

- (void)setRightShoulderAdjustment:(float)a3
{
  self->_rightShoulderAdjustment = a3;
}

- (float)curLeftBend
{
  return self->_curLeftBend;
}

- (void)setCurLeftBend:(float)a3
{
  self->_curLeftBend = a3;
}

- (float)curRightBend
{
  return self->_curRightBend;
}

- (void)setCurRightBend:(float)a3
{
  self->_curRightBend = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texArm, 0);
  objc_storeStrong((id *)&self->_texHandHour, 0);

  objc_storeStrong((id *)&self->_texHandMnut, 0);
}

@end