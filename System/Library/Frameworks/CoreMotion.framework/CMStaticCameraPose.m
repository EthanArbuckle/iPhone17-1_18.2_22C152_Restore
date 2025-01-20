@interface CMStaticCameraPose
- (BOOL)isStatic;
- (CMStaticCameraPose)initWithIsStatic:(BOOL)a3 timeInStaticState:(double)a4 timeInMovingState:(double)a5 portraitAngle:(float)a6 portraitUpsideDownAngle:(float)a7 landscapeLeftAngle:(float)a8 landscapeRightAngle:(float)a9 faceUpAngle:(float)a10 faceDownAngle:(float)a11;
- (double)timeInMovingState;
- (double)timeInStaticState;
- (float)faceDownAngleDeg;
- (float)faceUpAngleDeg;
- (float)landscapeLeftAngleDeg;
- (float)landscapeRightAngleDeg;
- (float)portraitAngleDeg;
- (float)portraitUpsideDownAngleDeg;
- (id)description;
- (void)setFaceDownAngleDeg:(float)a3;
- (void)setFaceUpAngleDeg:(float)a3;
- (void)setIsStatic:(BOOL)a3;
- (void)setLandscapeLeftAngleDeg:(float)a3;
- (void)setLandscapeRightAngleDeg:(float)a3;
- (void)setPortraitAngleDeg:(float)a3;
- (void)setPortraitUpsideDownAngleDeg:(float)a3;
- (void)setTimeInMovingState:(double)a3;
- (void)setTimeInStaticState:(double)a3;
@end

@implementation CMStaticCameraPose

- (CMStaticCameraPose)initWithIsStatic:(BOOL)a3 timeInStaticState:(double)a4 timeInMovingState:(double)a5 portraitAngle:(float)a6 portraitUpsideDownAngle:(float)a7 landscapeLeftAngle:(float)a8 landscapeRightAngle:(float)a9 faceUpAngle:(float)a10 faceDownAngle:(float)a11
{
  v21.receiver = self;
  v21.super_class = (Class)CMStaticCameraPose;
  result = [(CMStaticCameraPose *)&v21 init];
  if (result)
  {
    result->_isStatic = a3;
    result->_timeInStaticState = a4;
    result->_timeInMovingState = a5;
    result->_portraitAngleDeg = a6;
    result->_portraitUpsideDownAngleDeg = a7;
    result->_landscapeLeftAngleDeg = a8;
    result->_landscapeRightAngleDeg = a9;
    result->_faceUpAngleDeg = a10;
    result->_faceDownAngleDeg = a11;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"isStatic,%u,timeInStaticState,%f,timeInMovingState,%f,p,%f,pud,%f,ll,%f,lr,%f,fu,%f,fd,%f", self->_isStatic, *(void *)&self->_timeInStaticState, *(void *)&self->_timeInMovingState, self->_portraitAngleDeg, self->_portraitUpsideDownAngleDeg, self->_landscapeLeftAngleDeg, self->_landscapeRightAngleDeg, self->_faceUpAngleDeg, self->_faceDownAngleDeg);
}

- (BOOL)isStatic
{
  return self->_isStatic;
}

- (void)setIsStatic:(BOOL)a3
{
  self->_isStatic = a3;
}

- (double)timeInStaticState
{
  return self->_timeInStaticState;
}

- (void)setTimeInStaticState:(double)a3
{
  self->_timeInStaticState = a3;
}

- (double)timeInMovingState
{
  return self->_timeInMovingState;
}

- (void)setTimeInMovingState:(double)a3
{
  self->_timeInMovingState = a3;
}

- (float)portraitAngleDeg
{
  return self->_portraitAngleDeg;
}

- (void)setPortraitAngleDeg:(float)a3
{
  self->_portraitAngleDeg = a3;
}

- (float)portraitUpsideDownAngleDeg
{
  return self->_portraitUpsideDownAngleDeg;
}

- (void)setPortraitUpsideDownAngleDeg:(float)a3
{
  self->_portraitUpsideDownAngleDeg = a3;
}

- (float)landscapeLeftAngleDeg
{
  return self->_landscapeLeftAngleDeg;
}

- (void)setLandscapeLeftAngleDeg:(float)a3
{
  self->_landscapeLeftAngleDeg = a3;
}

- (float)landscapeRightAngleDeg
{
  return self->_landscapeRightAngleDeg;
}

- (void)setLandscapeRightAngleDeg:(float)a3
{
  self->_landscapeRightAngleDeg = a3;
}

- (float)faceUpAngleDeg
{
  return self->_faceUpAngleDeg;
}

- (void)setFaceUpAngleDeg:(float)a3
{
  self->_faceUpAngleDeg = a3;
}

- (float)faceDownAngleDeg
{
  return self->_faceDownAngleDeg;
}

- (void)setFaceDownAngleDeg:(float)a3
{
  self->_faceDownAngleDeg = a3;
}

@end