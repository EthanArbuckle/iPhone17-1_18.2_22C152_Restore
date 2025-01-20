@interface SearchControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_dropPinsForSearchResults:(id)a3 forSearchType:(int64_t)a4 scrollToResults:(BOOL)a5;
@end

@implementation SearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_dropPinsForSearchResults:(id)a3 forSearchType:(int64_t)a4 scrollToResults:(BOOL)a5
{
  BOOL v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SearchControllerAccessibility;
  id v7 = a3;
  [(SearchControllerAccessibility *)&v16 _dropPinsForSearchResults:v7 forSearchType:a4 scrollToResults:v5];
  v8 = [v7 safeValueForKey:@"results"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 count];
    if (v9 >= 1)
    {
      uint64_t v10 = v9;
      v11 = NSString;
      if (v9 == 1)
      {
        v12 = AXMapsLocString(@"DROPPED_PINS_ANNOUNCEMENT_SINGULAR");
        uint64_t v13 = 1;
      }
      else
      {
        v12 = AXMapsLocString(@"DROPPED_PINS_ANNOUNCEMENT_PLURAL");
        uint64_t v13 = v10;
      }
      v14 = MEMORY[0x245653040](v13);
      v15 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v14);

      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v15);
    }
  }
}

@end