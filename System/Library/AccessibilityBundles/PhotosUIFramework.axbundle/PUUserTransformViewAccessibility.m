@interface PUUserTransformViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
- (void)setFrame:(CGRect)a3;
@end

@implementation PUUserTransformViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUUserTransformView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUUserTransformViewAccessibility;
  -[PUUserTransformViewAccessibility setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end