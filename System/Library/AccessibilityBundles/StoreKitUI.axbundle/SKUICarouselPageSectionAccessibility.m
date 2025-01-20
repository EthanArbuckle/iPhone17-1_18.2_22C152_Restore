@interface SKUICarouselPageSectionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateValidIndices;
- (void)_fireCycleTimer;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUICarouselPageSectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUICarouselPageSection";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUICarouselPageSection", @"_carouselCollectionView", "@", 0);
  [v3 validateClass:@"SKUICarouselPageSection" hasInstanceVariable:@"_modelObjects" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUICarouselPageSection", @"willAppearInContext:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUICarouselPageSection", @"willTransitionToSize: withTransitionCoordinator:", "v", "{CGSize=dd}", "@", 0);
}

- (void)_fireCycleTimer
{
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = self;
    v3.super_class = (Class)SKUICarouselPageSectionAccessibility;
    [(SKUICarouselPageSectionAccessibility *)&v3 _fireCycleTimer];
  }
}

- (void)willAppearInContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUICarouselPageSectionAccessibility;
  [(SKUICarouselPageSectionAccessibility *)&v4 willAppearInContext:a3];
  [(SKUICarouselPageSectionAccessibility *)self _accessibilityUpdateValidIndices];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SKUICarouselPageSectionAccessibility;
  -[SKUICarouselPageSectionAccessibility willTransitionToSize:withTransitionCoordinator:](&v5, sel_willTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(SKUICarouselPageSectionAccessibility *)self _accessibilityUpdateValidIndices];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SKUICarouselPageSectionAccessibility;
  [(SKUICarouselPageSectionAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SKUICarouselPageSectionAccessibility *)self _accessibilityUpdateValidIndices];
}

- (void)_accessibilityUpdateValidIndices
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v9 = [(SKUICarouselPageSectionAccessibility *)self safeValueForKey:@"_carouselCollectionView"];
    [v9 bounds];
    CGFloat x = v11.origin.x;
    CGFloat y = v11.origin.y;
    CGFloat width = v11.size.width;
    CGFloat height = v11.size.height;
    double MidX = CGRectGetMidX(v11);
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    v8 = objc_msgSend(v9, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v12));
    [(SKUICarouselPageSectionAccessibility *)self _accessibilitySetRetainedValue:v8 forKey:@"kAXStartingIndexPath"];
  }
  else
  {
    [(SKUICarouselPageSectionAccessibility *)self _accessibilitySetRetainedValue:0 forKey:@"kAXStartingIndexPath"];
  }
}

- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SKUICarouselPageSectionAccessibility *)self _accessibilityValueForKey:@"kAXStartingIndexPath"];
  v6 = v5;
  if (v5 && (uint64_t v7 = [v5 section], v7 == objc_msgSend(v4, "section")))
  {
    v8 = [(SKUICarouselPageSectionAccessibility *)self safeValueForKey:@"_modelObjects"];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    id v9 = v8;
    AXPerformSafeBlock();
    unint64_t v10 = v17[3];

    _Block_object_dispose(&v16, 8);
    uint64_t v11 = objc_msgSend(v4, "item", v15, 3221225472, __90__SKUICarouselPageSectionAccessibility__accessibilityDescendantElementAtIndexPathIsValid___block_invoke, &unk_2650AB6C8);
    BOOL v13 = 0;
    if (v11 >= [v6 item] || objc_msgSend(v4, "item") < v10)
    {
      unint64_t v12 = [v4 item];
      if (v12 < [v6 item] + v10 || objc_msgSend(v4, "item") < v10) {
        BOOL v13 = 1;
      }
    }
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

uint64_t __90__SKUICarouselPageSectionAccessibility__accessibilityDescendantElementAtIndexPathIsValid___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end