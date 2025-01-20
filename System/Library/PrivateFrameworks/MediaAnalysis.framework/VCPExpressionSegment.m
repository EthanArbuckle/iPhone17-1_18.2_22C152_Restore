@interface VCPExpressionSegment
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange;
- (float)score;
- (void)setScore:(float)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation VCPExpressionSegment

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange
{
  long long v3 = *(_OWORD *)((char *)&self->var1.var0 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var2;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)((char *)&self->var1.var3 + 4);
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)((char *)&self->_timeRange.duration.value + 4) = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.flags = v4;
  *(_OWORD *)(&self->_score + 1) = v3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

@end