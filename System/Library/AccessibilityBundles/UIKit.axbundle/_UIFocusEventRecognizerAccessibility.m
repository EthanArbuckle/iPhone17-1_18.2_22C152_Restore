@interface _UIFocusEventRecognizerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_moveWithEvent:(id)a3;
@end

@implementation _UIFocusEventRecognizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusEventRecognizer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:"Q" hasInstanceMethod:"q" withFullSignature:0];
  [location[0] validateClass:@"_UIFocusEventRecognizer" hasInstanceMethod:@"owningView" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusEventRecognizer", @"_moveWithEvent:", "B", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIEvent", @"_focusHeading", "Q", 0);
  if (AXProcessIsPineBoard()) {
    [location[0] validateClass:@"PBSceneLayoutWindow"];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_moveWithEvent:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)_UIFocusEventRecognizerAccessibility;
  unsigned __int8 v4 = [(_UIFocusEventRecognizerAccessibility *)&v5 _moveWithEvent:location[0]];
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end