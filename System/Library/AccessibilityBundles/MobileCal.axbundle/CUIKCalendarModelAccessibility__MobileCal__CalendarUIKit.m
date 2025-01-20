@interface CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setSelectedDate:(id)a3;
@end

@implementation CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit

+ (id)safeCategoryTargetClassName
{
  return @"CUIKCalendarModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKCalendarDate", @"date", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"NSLocale", @"currentLocale", "@", 0);
}

- (void)setSelectedDate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit;
  [(CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit *)&v12 setSelectedDate:v4];
  v5 = [(CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit *)self _accessibilityValueForKey:@"ShouldOutputChange"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263F21660];
    v8 = [v4 date];
    v9 = AXDateStringForFormat();
    v10 = [v7 axAttributedStringWithString:v9];

    [v10 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21718]];
    uint64_t v11 = *MEMORY[0x263F1CE30];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], v10);
    MEMORY[0x245654A20](v11);
    [(CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit *)self _accessibilityRemoveValueForKey:@"ShouldOutputChange"];
  }
}

@end