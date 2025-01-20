@interface AMSUIPopoverShapeLayerMaskView
+ (Class)layerClass;
- (BOOL)disablePathAnimation;
- (void)setDisablePathAnimation:(BOOL)a3;
@end

@implementation AMSUIPopoverShapeLayerMaskView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)disablePathAnimation
{
  return self->_disablePathAnimation;
}

- (void)setDisablePathAnimation:(BOOL)a3
{
  self->_disablePathAnimation = a3;
}

@end