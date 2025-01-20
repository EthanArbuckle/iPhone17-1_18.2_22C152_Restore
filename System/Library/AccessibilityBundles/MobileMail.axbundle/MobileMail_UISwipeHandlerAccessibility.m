@interface MobileMail_UISwipeHandlerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_swipeRecognizerEnded:(id)a3 wasCancelled:(BOOL)a4;
@end

@implementation MobileMail_UISwipeHandlerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISwipeHandler";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UISwipeHandler", @"_swipeRecognizerEnded: wasCancelled:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UISwipeHandler", @"swipeController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISwipeActionController", @"swipeActionHost", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISwipeActionController", @"swipedIndexPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_accessibilityClearChildren", "v", 0);
}

- (void)_swipeRecognizerEnded:(id)a3 wasCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(MobileMail_UISwipeHandlerAccessibility *)self safeValueForKey:@"swipeController"];
  v8 = [v7 safeValueForKey:@"swipeActionHost"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v7 safeValueForKey:@"swipedIndexPath"];
    if (v9)
    {
      char v14 = 0;
      v10 = [v8 cellForRowAtIndexPath:v9];
      v11 = __UIAccessibilitySafeClass();

      id v12 = (id)[v11 safeValueForKey:@"_accessibilityClearChildren"];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)MobileMail_UISwipeHandlerAccessibility;
  [(MobileMail_UISwipeHandlerAccessibility *)&v13 _swipeRecognizerEnded:v6 wasCancelled:v4];
}

@end