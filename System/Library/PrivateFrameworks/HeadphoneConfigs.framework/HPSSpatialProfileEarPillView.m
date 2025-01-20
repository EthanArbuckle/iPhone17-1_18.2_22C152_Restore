@interface HPSSpatialProfileEarPillView
- (double)pillInitialHeight;
- (void)setPillInitialHeight:(double)a3;
@end

@implementation HPSSpatialProfileEarPillView

- (void)setPillInitialHeight:(double)a3
{
  self->_pillInitialHeight = a3;
}

- (double)pillInitialHeight
{
  return self->_pillInitialHeight;
}

@end