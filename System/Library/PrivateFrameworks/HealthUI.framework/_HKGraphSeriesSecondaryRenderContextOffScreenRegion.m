@interface _HKGraphSeriesSecondaryRenderContextOffScreenRegion
- (UIColor)color;
- (double)end;
- (double)start;
- (void)setColor:(id)a3;
- (void)setEnd:(double)a3;
- (void)setStart:(double)a3;
@end

@implementation _HKGraphSeriesSecondaryRenderContextOffScreenRegion

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end