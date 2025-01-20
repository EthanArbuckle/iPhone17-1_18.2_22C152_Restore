@interface WeekViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityScrollStatusForScrollView:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateWeekScroller;
- (void)viewDidLoad;
@end

@implementation WeekViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WeekViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WeekGroupView"];
  [v3 validateClass:@"WeekViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"WeekView", @"dayWidthForOrientation:withViewInViewHierarchy:", "d", "q", "@", 0);
  [v3 validateClass:@"WeekViewController" hasInstanceVariable:@"_weekScroller" withType:"UIScrollView"];
  [v3 validateClass:@"WeekViewController" hasInstanceVariable:@"_visibleWeeks" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"interfaceOrientation", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeekGroupView", @"dateForXOffset:", "@", "d", 0);
}

- (void)_axAnnotateWeekScroller
{
  id v2 = [(WeekViewControllerAccessibility *)self safeValueForKey:@"_weekScroller"];
  [v2 setIsAccessibilityOpaqueElementProvider:1];
  [v2 accessibilitySetIdentification:@"_AXWeekScrollViewIdentifier"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)WeekViewControllerAccessibility;
  [(WeekViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(WeekViewControllerAccessibility *)self _axAnnotateWeekScroller];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WeekViewControllerAccessibility;
  [(WeekViewControllerAccessibility *)&v3 viewDidLoad];
  [(WeekViewControllerAccessibility *)self _axAnnotateWeekScroller];
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v43 = [(WeekViewControllerAccessibility *)self safeValueForKey:@"_weekScroller"];
  uint64_t v44 = 0;
  v45 = (double *)&v44;
  uint64_t v46 = 0x2020000000;
  v47 = 0;
  uint64_t v54 = MEMORY[0x263EF8330];
  uint64_t v55 = 3221225472;
  v56 = __74__WeekViewControllerAccessibility_accessibilityScrollStatusForScrollView___block_invoke;
  v57 = &unk_265132058;
  v60 = &v44;
  v58 = self;
  id v5 = v4;
  id v59 = v5;
  AXPerformSafeBlock();
  double v6 = v45[3];

  _Block_object_dispose(&v44, 8);
  [v43 frame];
  double v8 = v7;
  v9 = [(WeekViewControllerAccessibility *)self safeValueForKey:@"_visibleWeeks"];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v61 count:16];
  double v12 = v6 * 0.5 + v8;
  if (v11)
  {
    uint64_t v13 = *(void *)v51;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v16 = [(WeekViewControllerAccessibility *)self safeValueForKey:@"view"];
        [v15 frame];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        v25 = [v15 superview];
        objc_msgSend(v16, "convertRect:fromView:", v25, v18, v20, v22, v24);
        double v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;

        if (v27 <= v12)
        {
          v64.origin.x = v27;
          v64.origin.y = v29;
          v64.size.width = v31;
          v64.size.height = v33;
          if (CGRectGetMaxX(v64) > v12)
          {
            id v34 = v15;
            goto LABEL_12;
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v34 = 0;
LABEL_12:

  uint64_t v44 = 0;
  v45 = (double *)&v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  id v49 = 0;
  id v35 = v34;
  AXPerformSafeBlock();
  if (*((void *)v45 + 5) || (_AXAssert(), *((void *)v45 + 5)))
  {
    v36 = [MEMORY[0x263EFF8F0] currentCalendar];
    v37 = [v36 dateFromComponents:*((void *)v45 + 5)];

    v38 = AXDateStringForFormat();
    v39 = NSString;
    v40 = accessibilityLocalizedString(@"week.scroll.status");
    v41 = objc_msgSend(v39, "stringWithFormat:", v40, v38);
  }
  else
  {
    v41 = 0;
  }

  _Block_object_dispose(&v44, 8);

  return v41;
}

uint64_t __74__WeekViewControllerAccessibility_accessibilityScrollStatusForScrollView___block_invoke(uint64_t a1)
{
  uint64_t result = -[objc_class dayWidthForOrientation:withViewInViewHierarchy:](NSClassFromString(&cfstr_Weekview.isa), "dayWidthForOrientation:withViewInViewHierarchy:", [*(id *)(a1 + 32) interfaceOrientation], *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

uint64_t __74__WeekViewControllerAccessibility_accessibilityScrollStatusForScrollView___block_invoke_307(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) dateForXOffset:*(double *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

@end