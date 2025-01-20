@interface VCCameraPreview
- (BOOL)isStarted;
- (id)description;
- (void)setStarted:(BOOL)a3;
@end

@implementation VCCameraPreview

- (void)setStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p)", NSStringFromClass(v4), self];
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

@end