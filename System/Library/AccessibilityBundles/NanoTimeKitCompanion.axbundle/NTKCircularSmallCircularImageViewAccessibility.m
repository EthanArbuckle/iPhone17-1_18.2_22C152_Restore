@interface NTKCircularSmallCircularImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation NTKCircularSmallCircularImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCircularSmallCircularImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(NTKCircularSmallCircularImageViewAccessibility *)self safeValueForKey:@"imageView"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKCircularSmallCircularImageViewAccessibility;
    id v5 = [(NTKCircularSmallCircularImageViewAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

@end