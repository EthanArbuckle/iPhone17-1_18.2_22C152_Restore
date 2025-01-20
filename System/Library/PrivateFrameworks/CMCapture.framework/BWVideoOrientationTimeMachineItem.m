@interface BWVideoOrientationTimeMachineItem
- (BWVideoOrientationTimeMachineItem)initWithPTSSeconds:(double)a3 exifOrientation:(signed __int16)a4;
- (double)ptsSeconds;
- (id)description;
- (signed)exifOrientation;
- (void)setExifOrientation:(signed __int16)a3;
- (void)setPtsSeconds:(double)a3;
@end

@implementation BWVideoOrientationTimeMachineItem

- (BWVideoOrientationTimeMachineItem)initWithPTSSeconds:(double)a3 exifOrientation:(signed __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWVideoOrientationTimeMachineItem;
  result = [(BWVideoOrientationTimeMachineItem *)&v7 init];
  if (result)
  {
    result->_ptsSeconds = a3;
    result->_exifOrientation = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p> ptsSeconds: %.4f, exifOrientation: %d", NSStringFromClass(v4), self, *(void *)&self->_ptsSeconds, self->_exifOrientation];
}

- (double)ptsSeconds
{
  return self->_ptsSeconds;
}

- (void)setPtsSeconds:(double)a3
{
  self->_ptsSeconds = a3;
}

- (signed)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(signed __int16)a3
{
  self->_exifOrientation = a3;
}

@end