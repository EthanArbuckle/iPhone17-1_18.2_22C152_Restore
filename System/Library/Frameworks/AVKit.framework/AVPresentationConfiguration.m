@interface AVPresentationConfiguration
+ (AVPresentationConfiguration)configurationWithTransitionStyle:(unint64_t)a3 transitionDuration:(double)a4;
- (double)transitionDuration;
- (unint64_t)transitionStyle;
@end

@implementation AVPresentationConfiguration

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (unint64_t)transitionStyle
{
  return self->_transitionStyle;
}

+ (AVPresentationConfiguration)configurationWithTransitionStyle:(unint64_t)a3 transitionDuration:(double)a4
{
  v6 = objc_alloc_init(AVPresentationConfiguration);
  v6->_transitionStyle = a3;
  v6->_transitionDuration = a4;

  return v6;
}

@end