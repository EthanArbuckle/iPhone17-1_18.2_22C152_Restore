@interface HKTickStyle
- (BOOL)shouldRenderMajorTickMarks;
- (double)tickLength;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)tickDirection;
- (void)setShouldRenderMajorTickMarks:(BOOL)a3;
- (void)setTickDirection:(int64_t)a3;
- (void)setTickLength:(double)a3;
@end

@implementation HKTickStyle

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKTickStyle;
  id result = [(HKStrokeStyle *)&v5 copyWithZone:a3];
  *((void *)result + 7) = *(void *)&self->_tickLength;
  *((void *)result + 8) = self->_tickDirection;
  return result;
}

- (double)tickLength
{
  return self->_tickLength;
}

- (void)setTickLength:(double)a3
{
  self->_tickLength = a3;
}

- (int64_t)tickDirection
{
  return self->_tickDirection;
}

- (void)setTickDirection:(int64_t)a3
{
  self->_tickDirection = a3;
}

- (BOOL)shouldRenderMajorTickMarks
{
  return self->_shouldRenderMajorTickMarks;
}

- (void)setShouldRenderMajorTickMarks:(BOOL)a3
{
  self->_shouldRenderMajorTickMarks = a3;
}

@end