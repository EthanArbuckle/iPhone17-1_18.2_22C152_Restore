@interface SKUIToggleButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)_accessibilityFindAttributedStringView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUIToggleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIToggleButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUIAttributedStringView"];
  [v3 validateClass:@"SKUIToggleStateCenter"];
  [v3 validateClass:@"SKUIToggleStateItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIToggleButton", @"element", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIToggleButton", @"toggledTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIToggleButton", @"nonToggledTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIToggleButton", @"isToggled", "B", 0);
  [v3 validateClass:@"SKUIToggleButton" hasInstanceVariable:@"_titleToggleString" withType:"NSString"];
  [v3 validateClass:@"SKUIToggleButton" hasInstanceVariable:@"_toggled" withType:"B"];
  [v3 validateClass:@"SKUIToggleButton" hasInstanceVariable:@"_autoIncrement" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIToggleButton", @"toggleItemIdentifier", "@", 0);
  [v3 validateClass:@"SKUIToggleButton" hasInstanceVariable:@"_autoIncrementCount" withType:"q"];
}

- (id)accessibilityLabel
{
  id v3 = [(SKUIToggleButtonAccessibility *)self safeValueForKey:@"element"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length]
    || ([(SKUIToggleButtonAccessibility *)self _accessibilityFindAttributedStringView], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = v4;
  }
  else
  {
    v7 = v6;
    id v5 = [v6 accessibilityLabel];
  }

  return v5;
}

- (id)_accessibilityFindAttributedStringView
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(SKUIToggleButtonAccessibility *)self subviews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        NSClassFromString(&cfstr_Skuiattributed_0.isa);
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (id)accessibilityValue
{
  uint64_t v3 = [NSString string];
  if ([(SKUIToggleButtonAccessibility *)self safeBoolForKey:@"isToggled"]) {
    uint64_t v4 = @"toggledTitle";
  }
  else {
    uint64_t v4 = @"nonToggledTitle";
  }
  id v5 = [(SKUIToggleButtonAccessibility *)self safeValueForKey:v4];
  if ([v5 length])
  {
    id v5 = v5;

    uint64_t v3 = v5;
  }

  if ([v3 length]) {
    goto LABEL_7;
  }
  char v13 = 0;
  objc_opt_class();
  v7 = [(SKUIToggleButtonAccessibility *)self safeValueForKey:@"_titleToggleString"];
  id v8 = __UIAccessibilityCastAsClass();

  v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  long long v10 = [v8 stringByTrimmingCharactersInSet:v9];

  v6 = [MEMORY[0x263F21660] axAttributedStringWithString:v10];
  [v6 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21898]];
  if (![v6 length])
  {

LABEL_7:
    v12.receiver = self;
    v12.super_class = (Class)SKUIToggleButtonAccessibility;
    v6 = [(SKUIToggleButtonAccessibility *)&v12 accessibilityValue];
    goto LABEL_10;
  }

LABEL_10:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIToggleButtonAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(SKUIToggleButtonAccessibility *)&v7 accessibilityTraits];
  int v4 = [(SKUIToggleButtonAccessibility *)self safeBoolForKey:@"isToggled"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (BOOL)accessibilityActivate
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIToggleButtonAccessibility;
  BOOL v3 = [(SKUIToggleButtonAccessibility *)&v5 accessibilityActivate];
  [(SKUIToggleButtonAccessibility *)self safeBoolForKey:@"_toggled"];
  [(SKUIToggleButtonAccessibility *)self safeBoolForKey:@"_autoIncrement"];
  AXPerformSafeBlock();
  return v3;
}

void __54__SKUIToggleButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) safeValueForKey:@"toggleItemIdentifier"];
  if (v9)
  {
    id v2 = [MEMORY[0x263F7B0D8] defaultCenter];
    BOOL v3 = [v2 itemForIdentifier:v9];
    int v4 = v3;
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v5 = [v3 count];
      if (v5 == -1) {
        uint64_t v5 = [*(id *)(a1 + 32) safeIntegerForKey:@"_autoIncrementCount"];
      }
      if (*(unsigned char *)(a1 + 41)) {
        uint64_t v6 = v5 - 1;
      }
      else {
        uint64_t v6 = v5 + 1;
      }
      uint64_t v7 = v6 & ~(v6 >> 63);
      if (v6 < 1)
      {
        id v8 = @" ";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%li", v7);
        id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setToggledString:v8];
      [v4 setCount:v7];
    }
    [v4 setToggled:*(unsigned __int8 *)(a1 + 41) ^ 1u];
    [v2 updateItem:v4];
  }
  else
  {
    [*(id *)(a1 + 32) setToggled:*(unsigned char *)(a1 + 41) == 0];
  }
}

@end