@interface UIKBUndoControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation UIKBUndoControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKBUndoControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIKBUndoControl";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"type", "q", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(UIKBUndoControlAccessibility *)self safeIntegerForKey:@"type"];
  if (v2)
  {
    uint64_t v4 = v2;
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        id v7 = (id)UIKitAccessibilityLocalizedString();
        goto LABEL_8;
      default:
        JUMPOUT(0);
    }
  }
  id v7 = (id)[(UIKBUndoControlAccessibility *)self safeValueForKeyPath:@"label.text"];
LABEL_8:

  return v7;
}

@end