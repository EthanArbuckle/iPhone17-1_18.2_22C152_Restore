@interface AXMobileCalGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobileCalGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_388 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_397];

    uint64_t v3 = [objc_allocWithZone((Class)AXMobileCalGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    id v5 = [MEMORY[0x263F22850] sharedInstance];
    [v5 addHandler:&__block_literal_global_525 forFramework:@"AddressBookUI"];
  }
}

uint64_t __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"CUIKCalendarModel"];
  [v2 validateClass:@"PreferencesDoubleTwoPartValueCell"];
  [v2 validateClass:@"PreferencesTwoPartValueCell"];
  [v2 validateClass:@"ListViewController"];
  [v2 validateClass:@"TwoPartTextLabel"];
  [v2 validateClass:@"PreferencesTwoPartValueCell" isKindOfClass:@"UITableViewCell"];
  [v2 validateClass:@"WeekView" hasInstanceVariable:@"_allDayView" withType:"WeekAllDayView"];
  [v2 validateClass:@"ListViewController" hasInstanceVariable:@"_model" withType:"CUIKCalendarModel"];
  [v2 validateClass:@"TwoPartTextLabel" hasInstanceVariable:@"_secondTextPart" withType:"NSString"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKCalendarModel", @"cachedOccurrenceAtIndexPath:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKCalendarModel", @"eventStore", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKCalendarModel", @"occurrencesForDay: waitForLoad:", "@", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKCalendarModel", @"selectedCalendars", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKCalendarModel", @"setSelectedDate:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKOccurrencesCollection", @"occurrences", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKOccurrencesCollection", @"allDayOccurrences", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PreferencesDoubleTwoPartValueCell", @"textLabel2", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PreferencesDoubleTwoPartValueCell", @"twoPartTextLabel2", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PreferencesTwoPartValueCell", @"twoPartTextLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ListViewController", @"tableView: viewForHeaderInSection:", "@", "@", "q", 0);
  [v2 validateClass:@"ListViewController" isKindOfClass:@"MainViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MainViewController", @"model", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"NSCalendar", @"components: fromDate:", "@", "Q", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"NSCalendar", @"calendarWithIdentifier:", "@", "@", 0);
  [v2 validateClass:@"WeekGroupView"];
  [v2 validateClass:@"WeekViewController"];
  [v2 validateClass:@"WeekViewController" hasInstanceVariable:@"_eventGestureController" withType:"EKEventGestureController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"CUIKDateStrings", @"overlayShortStringForDate: inCalendar:", "@", "@", "@", 0);

  return 1;
}

uint64_t __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileCal AX Bundle"];
  [v2 setOverrideProcessName:@"MobileCal"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DayNavigationWeekScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DayNavigationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DayNavigationViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"InfiniteScrollViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileCalUIAccessibilityElementMockViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileCalUIScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MonthViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LargeMonthViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CompactMonthViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LargeMonthWeekViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LargeWeekViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CompactWidthMonthViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CompactMonthWeekDayNumberAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CompactMonthWeekTodayCircleAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CompactMonthWeekViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RootNavigationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WeekAllDayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WeekDayInitialsHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WeekTimeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WeekViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WeekViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"YearViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"YearViewYearHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MainViewControllerContainerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DayViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SearchResultsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ListTableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"YearMonthAnimatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileCalUIDimmingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileCalUIViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileCalUITransitionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CompactDayNavigationViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LargeDayNavigationViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SplashScreenViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MainWindowControlHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MainWindowRootViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MainWindowContentContainerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LargeTextLargeMonthWeekViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LargeYearMonthViewAccessibility" canInteractWithTargetClass:1];
}

uint64_t __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke_5()
{
  v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AddressBookUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

@end