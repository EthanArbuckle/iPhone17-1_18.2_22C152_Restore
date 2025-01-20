@interface HKMapPointAnnotation
- (BOOL)isStartPoint;
- (void)setIsStartPoint:(BOOL)a3;
@end

@implementation HKMapPointAnnotation

- (BOOL)isStartPoint
{
  return self->_isStartPoint;
}

- (void)setIsStartPoint:(BOOL)a3
{
  self->_isStartPoint = a3;
}

@end