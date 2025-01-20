@interface DOCFeatureState
- (BOOL)isEnabled;
- (void)setIsEnabled:(BOOL)a3;
@end

@implementation DOCFeatureState

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

@end