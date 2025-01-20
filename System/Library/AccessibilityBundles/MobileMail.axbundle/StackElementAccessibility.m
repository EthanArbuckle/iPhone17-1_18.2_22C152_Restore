@interface StackElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)itemViewCreateIfNeeded:(BOOL)a3;
@end

@implementation StackElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StackElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)itemViewCreateIfNeeded:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)StackElementAccessibility;
  v4 = [(StackElementAccessibility *)&v11 itemViewCreateIfNeeded:a3];
  v5 = accessibilityLocalizedString(@"message.to.be.moved.label");
  v6 = [(StackElementAccessibility *)self safeValueForKey:@"item"];
  NSClassFromString(&cfstr_Mfmailmessage.isa);
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 safeValueForKeyPath:@"subject.subjectWithoutPrefix"];
  }
  else
  {
    v7 = 0;
  }
  v8 = __UIAXStringForVariables();
  objc_msgSend(v4, "setAccessibilityLabel:", v8, v7, @"__AXStringForVariablesSentinel");

  v9 = accessibilityLocalizedString(@"message.to.be.moved.hint");
  [v4 setAccessibilityHint:v9];

  [v4 setIsAccessibilityElement:1];

  return v4;
}

@end