@interface UIScrollViewAccessibility_EventKit_UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)accessibilityIsDayGridScroller;
- (BOOL)accessibilityIsPreviewDayGridScroller;
- (CGPoint)_pageDecelerationTarget;
- (id)_accessibilityScrollStatus;
- (void)setAccessibilityIsDayGridScroller:(BOOL)a3;
- (void)setAccessibilityIsPreviewDayGridScroller:(BOOL)a3;
@end

@implementation UIScrollViewAccessibility_EventKit_UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIsDayGridScroller
{
  return MEMORY[0x270F09620](self, &__UIScrollViewAccessibility_EventKit_UIKit__accessibilityIsDayGridScroller);
}

- (void)setAccessibilityIsDayGridScroller:(BOOL)a3
{
}

- (BOOL)accessibilityIsPreviewDayGridScroller
{
  return MEMORY[0x270F09620](self, &__UIScrollViewAccessibility_EventKit_UIKit__accessibilityIsPreviewDayGridScroller);
}

- (void)setAccessibilityIsPreviewDayGridScroller:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKDayGridView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayGridView", @"hourHeight", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayGridView", @"topPadding", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"_pageDecelerationTarget", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"_stopScrollDecelerationNotify:", "v", "B", 0);
}

- (id)_accessibilityScrollStatus
{
  if (-[UIScrollViewAccessibility_EventKit_UIKit accessibilityIsDayGridScroller](self, "accessibilityIsDayGridScroller")|| (-[UIScrollViewAccessibility_EventKit_UIKit accessibilityIdentifier](self, "accessibilityIdentifier"), id v3 = objc_claimAutoreleasedReturnValue(), v4 = [v3 isEqualToString:@"_AXWeekViewScrollViewIdentifier"], v3, v4))
  {
    v5 = [(UIScrollViewAccessibility_EventKit_UIKit *)self _accessibilityDescendantOfType:NSClassFromString(&cfstr_Ekdaygridview.isa)];
    [(UIScrollViewAccessibility_EventKit_UIKit *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(UIScrollViewAccessibility_EventKit_UIKit *)self _accessibilityVisibleContentInset];
    CGFloat v15 = v7 + v14;
    CGFloat v17 = v9 + v16;
    CGFloat v19 = v11 - (v14 + v18);
    CGFloat v21 = v13 - (v16 + v20);
    v22 = [v5 safeValueForKey:@"hourHeight"];
    [v22 doubleValue];
    double v24 = v23;

    v25 = [v5 safeValueForKey:@"topPadding"];
    [v25 doubleValue];
    double v27 = v26;

    id v28 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v28 setYear:2013];
    [v28 setMonth:6];
    [v28 setDay:30];
    v29 = [MEMORY[0x263EFF8F0] currentCalendar];
    [v28 setHour:llround((v17 - v27) / v24)];
    v30 = [v29 dateFromComponents:v28];
    v40.origin.x = v15;
    v40.origin.y = v17;
    v40.size.width = v19;
    v40.size.height = v21;
    [v28 setHour:llround((CGRectGetMaxY(v40) - v27) / v24)];
    v31 = [v29 dateFromComponents:v28];
    v32 = NSString;
    v33 = accessibilityLocalizedString(@"day.grid.scroll.status");
    v34 = AXDateStringForFormat();
    v35 = AXDateStringForFormat();
    v36 = objc_msgSend(v32, "stringWithFormat:", v33, v34, v35);
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)UIScrollViewAccessibility_EventKit_UIKit;
    v36 = [(UIScrollViewAccessibility_EventKit_UIKit *)&v38 _accessibilityScrollStatus];
  }

  return v36;
}

- (BOOL)_accessibilityScrollingEnabled
{
  if ([(UIScrollViewAccessibility_EventKit_UIKit *)self accessibilityIsPreviewDayGridScroller])
  {
    if (!AXDoesRequestingClientDeserveAutomation()
      && ![(UIScrollViewAccessibility_EventKit_UIKit *)self accessibilityIsDayGridScroller])
    {
      _AXAssert();
    }
    return 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollViewAccessibility_EventKit_UIKit;
    return [(UIScrollViewAccessibility_EventKit_UIKit *)&v4 _accessibilityScrollingEnabled];
  }
}

- (CGPoint)_pageDecelerationTarget
{
  if ([(UIScrollViewAccessibility_EventKit_UIKit *)self _accessibilityBoolValueForKey:@"_AXEKDayViewControllerShouldFakePageDecelerationTarget"])
  {
    [(UIScrollViewAccessibility_EventKit_UIKit *)self bounds];
    double Width = CGRectGetWidth(v7);
    double v4 = 0.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIScrollViewAccessibility_EventKit_UIKit;
    [(UIScrollViewAccessibility_EventKit_UIKit *)&v5 _pageDecelerationTarget];
  }
  result.y = v4;
  result.x = Width;
  return result;
}

@end