@interface UISearchTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setClearButtonImage:(id)a3 forState:(unint64_t)a4;
@end

@implementation UISearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISearchTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  v4 = @"UISearchTextField";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{_NSRange=QQ}", "@", "^B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_setClearButtonImage:forState:", "v", v3, "Q", 0);
  [location[0] validateClass:v4 hasInstanceVariable:@"_customClearButtons" withType:"NSMutableDictionary"];
  objc_storeStrong(v6, v5);
}

- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5
{
  _NSRange v13 = a3;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v10 = a5;
  char v9 = 0;
  v8.receiver = v12;
  v8.super_class = (Class)UISearchTextFieldAccessibility;
  char v9 = -[UISearchTextFieldAccessibility _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](&v8, sel__delegateShouldChangeCharactersInTextStorageRange_replacementString_delegateCares_, v13.location, v13.length, location[0], a5);
  if (!v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
  }
  char v6 = v9;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14 = self;
  SEL v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)UISearchTextFieldAccessibility;
  [(UISearchTextFieldAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  memset(__b, 0, sizeof(__b));
  id v7 = (id)[(UISearchTextFieldAccessibility *)v14 safeDictionaryForKey:@"_customClearButtons"];
  id obj = (id)[v7 allValues];

  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v9)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v9;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v5);
      id v2 = (id)UIKitAccessibilityLocalizedString();
      objc_msgSend(v11, "setAccessibilityLabel:");

      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (void)_setClearButtonImage:(id)a3 forState:(unint64_t)a4
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v7 = a4;
  v6.receiver = v9;
  v6.super_class = (Class)UISearchTextFieldAccessibility;
  [(UISearchTextFieldAccessibility *)&v6 _setClearButtonImage:location[0] forState:a4];
  id v5 = (id)UIKitAccessibilityLocalizedString();
  objc_msgSend(location[0], "setAccessibilityLabel:");

  objc_storeStrong(location, 0);
}

@end