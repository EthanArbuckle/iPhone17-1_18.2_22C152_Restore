@interface TLKImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TLKImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKImageView", @"tlkImage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKImage", @"uiImage", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(TLKImageViewAccessibility *)self safeValueForKeyPath:@"tlkImage.uiImage"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TLKImageViewAccessibility;
    id v5 = [(TLKImageViewAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

@end