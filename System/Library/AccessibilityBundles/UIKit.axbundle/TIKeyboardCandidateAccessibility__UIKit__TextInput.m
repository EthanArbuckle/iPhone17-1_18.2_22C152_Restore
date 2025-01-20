@interface TIKeyboardCandidateAccessibility__UIKit__TextInput
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TIKeyboardCandidateAccessibility__UIKit__TextInput

+ (id)safeCategoryTargetClassName
{
  return @"TIKeyboardCandidate";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"TIKeyboardCandidate", @"candidate", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  v9 = self;
  v8[1] = (id)a2;
  id v4 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  id v3 = (id)[v4 currentInputMode];
  v8[0] = (id)[v3 primaryLanguage];

  id v6 = (id)[MEMORY[0x263F228D0] sharedInstance];
  id v5 = (id)[(TIKeyboardCandidateAccessibility__UIKit__TextInput *)v9 safeValueForKey:@"candidate"];
  id v7 = (id)objc_msgSend(v6, "descriptionOfWord:forLanguage:");

  objc_storeStrong(v8, 0);

  return v7;
}

@end