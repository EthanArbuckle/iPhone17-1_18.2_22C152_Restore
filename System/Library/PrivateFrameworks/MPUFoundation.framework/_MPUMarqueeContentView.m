@interface _MPUMarqueeContentView
+ (Class)layerClass;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
@end

@implementation _MPUMarqueeContentView

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4 = a3;
  id v6 = [(_MPUMarqueeContentView *)self superview];
  id v5 = [v6 viewForContentSize];

  if (v5 == v4) {
    [v6 invalidateIntrinsicContentSize];
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end