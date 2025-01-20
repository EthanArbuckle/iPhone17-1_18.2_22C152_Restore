@interface TUICandidateArrowButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TUICandidateArrowButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUICandidateArrowButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = objc_msgSend((id)MEMORY[0x245666FF0](@"UIKeyboardCandidateController", a2), "safeValueForKey:", @"sharedInstance");
  int v3 = [v2 safeBoolForKey:@"isExtended"];

  if (v3) {
    v4 = @"collapse.suggestions";
  }
  else {
    v4 = @"more.candidates";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

@end