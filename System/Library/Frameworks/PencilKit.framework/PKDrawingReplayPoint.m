@interface PKDrawingReplayPoint
- ($F30B99E357B462A7BBD676CBC61D9025)pkInputPointWithOffset:(SEL)a3;
- (CGPoint)point;
- (double)delay;
- (unint64_t)type;
- (void)setDelay:(double)a3;
- (void)setPoint:(CGPoint)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKDrawingReplayPoint

- ($F30B99E357B462A7BBD676CBC61D9025)pkInputPointWithOffset:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  *(_OWORD *)&retstr->var11 = 0u;
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr->var1 = 0.5;
  result = ($F30B99E357B462A7BBD676CBC61D9025 *)[(PKDrawingReplayPoint *)self point];
  retstr->var0.var0.double x = x + v8;
  retstr->var0.var0.double y = y + v9;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_deladouble y = a3;
}

@end