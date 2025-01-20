@interface SiriMoviesChevronButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityProxyChevronButton;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SiriMoviesChevronButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriMoviesChevronButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesChevronButton", @"primaryString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesChevronButton", @"secondaryString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesChevronButton", @"accessoryString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesChevronButton", @"showtimeListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesShowtimeListView", @"showtimes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAMovieShowtime", @"showtime", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SACalendar", @"date", "@", 0);
}

- (id)_accessibilityProxyChevronButton
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v2 = [(SiriMoviesChevronButtonAccessibility *)self safeValueForKey:@"subviews"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__SiriMoviesChevronButtonAccessibility__accessibilityProxyChevronButton__block_invoke;
  v5[3] = &unk_26513B740;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __72__SiriMoviesChevronButtonAccessibility__accessibilityProxyChevronButton__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  NSClassFromString(&cfstr_Sirimovieschev.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(SiriMoviesChevronButtonAccessibility *)self safeValueForKey:@"primaryString"];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SiriMoviesChevronButtonAccessibility *)self safeValueForKey:@"showtimeListView"];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(SiriMoviesChevronButtonAccessibility *)self _accessibilityProxyChevronButton];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(SiriMoviesChevronButtonAccessibility *)self safeValueForKey:@"accessoryString"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  v5 = [MEMORY[0x263F21660] axAttributedStringWithString:v4];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [v5 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21890]];
  [v5 setAttribute:v6 forKey:*MEMORY[0x263F21778]];
  id v7 = [(SiriMoviesChevronButtonAccessibility *)self safeValueForKey:@"primaryString"];
  v13 = [(SiriMoviesChevronButtonAccessibility *)self safeValueForKey:@"secondaryString"];
  uint64_t v8 = __UIAXStringForVariables();

  v9 = [(SiriMoviesChevronButtonAccessibility *)self _accessibilityProxyChevronButton];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 accessibilityLabel];

    uint64_t v8 = (void *)v11;
  }

  return v8;
}

- (id)accessibilityValue
{
  id v3 = [(SiriMoviesChevronButtonAccessibility *)self _accessibilityProxyChevronButton];
  BOOL v4 = v3;
  if (v3)
  {
    v5 = [v3 accessibilityValue];
  }
  else
  {
    uint64_t v6 = [(SiriMoviesChevronButtonAccessibility *)self safeValueForKey:@"showtimeListView"];
    if (v6)
    {
      id v7 = [MEMORY[0x263EFF980] array];
      uint64_t v8 = [MEMORY[0x263EFF980] array];
      v9 = [v6 safeValueForKey:@"showtimes"];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke;
      v19[3] = &unk_26513B768;
      id v20 = v8;
      id v10 = v8;
      [v9 enumerateObjectsUsingBlock:v19];

      uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_0];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke_3;
      v17 = &unk_26513B768;
      id v18 = v7;
      id v12 = v7;
      [v11 enumerateObjectsUsingBlock:&v14];
      v5 = [v12 componentsJoinedByString:@", ", v14, v15, v16, v17];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

uint64_t __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

uint64_t __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  uint64_t v6 = [v4 safeValueForKey:@"showtime"];
  id v7 = [v6 safeValueForKey:@"date"];
  uint64_t v8 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v9 = [v5 safeValueForKey:@"showtime"];
  id v10 = [v9 safeValueForKey:@"date"];
  uint64_t v11 = __UIAccessibilityCastAsClass();

  uint64_t v12 = [v8 compare:v11];
  return v12;
}

void __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 safeValueForKey:@"showtime"];
  id v5 = [v4 safeValueForKey:@"date"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  id v7 = AXDateStringForFormat();
  if ([v7 length]) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

@end