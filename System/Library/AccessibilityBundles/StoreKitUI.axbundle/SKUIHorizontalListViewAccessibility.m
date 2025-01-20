@interface SKUIHorizontalListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUIHorizontalListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIHorizontalListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIHorizontalListView", @"setImage: forArtworkRequest: context:", "B", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIHorizontalListView", @"reloadWithViewElement: width: context:", "v", "@", "d", "@", 0);
  [v3 validateClass:@"SKUIHorizontalListView" hasInstanceVariable:@"_imageViewToImageResourceCacheKey" withType:"NSMapTable"];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SKUIHorizontalListViewAccessibility;
  BOOL v6 = [(SKUIHorizontalListViewAccessibility *)&v8 setImage:a3 forArtworkRequest:a4 context:a5];
  [(SKUIHorizontalListViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  return v6;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIHorizontalListViewAccessibility;
  [(SKUIHorizontalListViewAccessibility *)&v6 reloadWithViewElement:a3 width:a5 context:a4];
  [(SKUIHorizontalListViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)SKUIHorizontalListViewAccessibility;
  [(SKUIHorizontalListViewAccessibility *)&v22 _accessibilityLoadAccessibilityInformation];
  char v21 = 0;
  objc_opt_class();
  id v3 = [(SKUIHorizontalListViewAccessibility *)self safeValueForKey:@"_imageViewToImageResourceCacheKey"];
  v4 = __UIAccessibilityCastAsClass();

  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v21 = 0;
        objc_opt_class();
        v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v17);
        v12 = __UIAccessibilityCastAsClass();

        if (v21) {
          abort();
        }
        v13 = [v12 absoluteString];
        char v14 = [v13 containsString:@"itunes-mastered"];
        v15 = @"itunes-mastered";
        if ((v14 & 1) != 0
          || (int v16 = [v13 containsString:@"parental-advisory"],
              v15 = @"parental.advisory",
              v16))
        {
          [v10 setAccessibilityIdentifier:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }
}

@end