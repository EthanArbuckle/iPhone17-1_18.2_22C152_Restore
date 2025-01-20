@interface CalendarAssistantUIControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
@end

@implementation CalendarAssistantUIControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CalendarAssistantUIController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CalendarAssistantUIController", @"tableView: viewForHeaderInSection:", "@", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CalendarAssistantUIController", @"sections", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CalendarAssistantUISnippetSection", @"date", "@", 0);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CalendarAssistantUIControllerAccessibility;
  v7 = [(CalendarAssistantUIControllerAccessibility *)&v14 tableView:v6 viewForHeaderInSection:a4];
  if (v7)
  {
    objc_opt_class();
    v8 = [(CalendarAssistantUIControllerAccessibility *)self safeValueForKey:@"sections"];
    v9 = __UIAccessibilityCastAsClass();

    if ([v9 count] > (unint64_t)a4)
    {
      v10 = [v9 objectAtIndex:a4];
      v11 = [v10 safeValueForKey:@"date"];
      v12 = [MEMORY[0x263F08790] localizedStringFromDate:v11 dateStyle:4 timeStyle:0];
      [v7 setAccessibilityLabel:v12];
      [v7 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
      [v7 setIsAccessibilityElement:1];
    }
  }

  return v7;
}

@end