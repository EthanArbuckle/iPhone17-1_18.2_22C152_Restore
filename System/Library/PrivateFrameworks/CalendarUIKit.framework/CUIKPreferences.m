@interface CUIKPreferences
+ (id)sharedPreferences;
- (BOOL)allowSubscribedCalendarSpamDetection;
- (BOOL)debugLocationSearchResults;
- (BOOL)disableContinuity;
- (BOOL)disableTodayPushes;
- (BOOL)displayedSubscribedCalendarSpamDetectionPrivacyNotice;
- (BOOL)drawDebugViewColors;
- (BOOL)enableAvatars;
- (BOOL)enableMultiwindowAsserts;
- (BOOL)eventAutocompleteEnabled;
- (BOOL)forceAllowClearComments;
- (BOOL)hideInlineDayViewInEventDetails;
- (BOOL)immediateAlarmCreation;
- (BOOL)isShortResumeToTodayTimeout;
- (BOOL)largeListViewDisclosingEventDetails;
- (BOOL)overrideLocaleWeekends;
- (BOOL)perSectionShowAllHideAllButtonSpecifier;
- (BOOL)requestSyncOnApplicationLaunch;
- (BOOL)scanForDiscoveredVirtualConferences;
- (BOOL)showDeclinedAndCancelledEventsInWidgets;
- (BOOL)showExperimentalUI;
- (BOOL)showListView;
- (BOOL)showMonthDividedListView;
- (BOOL)showWeekNumbers;
- (BOOL)showWindowDebugButton;
- (BOOL)swipeToDeleteEnabled;
- (BOOL)viewedTimeZoneAutomatic;
- (BOOL)weekViewStartsOnToday;
- (CUIKPreferences)init;
- (NSArray)calendarUUIDsExcludedFromNotifications;
- (NSArray)deselectedCalendarSyncHashes;
- (NSDate)lastViewedOccurrenceDate;
- (NSDate)simulatedCurrentDate;
- (NSNumber)dayViewFirstVisibleSecond;
- (NSNumber)dayViewHourScale;
- (NSNumber)lastSidebarMode;
- (NSNumber)lastSuspendTime;
- (NSNumber)lastViewMode;
- (NSNumber)lastViewedDate;
- (NSNumber)locationSearchResultLimit;
- (NSNumber)weekStart;
- (NSNumber)weekViewHourScale;
- (NSString)lastViewedOccurrenceUID;
- (NSString)overlayCalendarID;
- (NSString)searchString;
- (int64_t)numDaysToShow;
- (unint64_t)monthViewEventScaleSize;
- (unint64_t)monthViewScaleSize;
- (unint64_t)promptForCommentWhenDeclining;
- (void)resetSubscribedCalendarSpamDetectionToNull;
- (void)setAllowSubscribedCalendarSpamDetection:(BOOL)a3;
- (void)setCalendarUUIDsExcludedFromNotifications:(id)a3;
- (void)setDayViewFirstVisibleSecond:(id)a3;
- (void)setDayViewHourScale:(id)a3;
- (void)setDebugLocationSearchResults:(BOOL)a3;
- (void)setDisableContinuity:(BOOL)a3;
- (void)setDisableTodayPushes:(BOOL)a3;
- (void)setDisplayedSubscribedCalendarSpamDetectionPrivacyNotice:(BOOL)a3;
- (void)setDrawDebugViewColors:(BOOL)a3;
- (void)setEnableAvatars:(BOOL)a3;
- (void)setEnableMultiwindowAsserts:(BOOL)a3;
- (void)setEventAutocompleteEnabled:(BOOL)a3;
- (void)setForceAllowClearComments:(BOOL)a3;
- (void)setHideInlineDayViewInEventDetails:(BOOL)a3;
- (void)setImmediateAlarmCreation:(BOOL)a3;
- (void)setLargeListViewDisclosingEventDetails:(BOOL)a3;
- (void)setLastSidebarMode:(id)a3;
- (void)setLastSuspendTime:(id)a3;
- (void)setLastViewMode:(id)a3;
- (void)setLastViewedDate:(id)a3;
- (void)setLastViewedOccurrenceDate:(id)a3;
- (void)setLastViewedOccurrenceUID:(id)a3;
- (void)setLocationSearchResultLimit:(id)a3;
- (void)setMonthViewEventScaleSize:(unint64_t)a3;
- (void)setMonthViewScaleSize:(unint64_t)a3;
- (void)setNumDaysToShow:(int64_t)a3;
- (void)setOverlayCalendarID:(id)a3;
- (void)setOverrideLocaleWeekends:(BOOL)a3;
- (void)setPerSectionShowAllHideAllButtonSpecifier:(BOOL)a3;
- (void)setPromptForCommentWhenDeclining:(unint64_t)a3;
- (void)setRequestSyncOnApplicationLaunch:(BOOL)a3;
- (void)setScanForDiscoveredVirtualConferences:(BOOL)a3;
- (void)setSearchString:(id)a3;
- (void)setShortResumeToTodayTimeout:(BOOL)a3;
- (void)setShowDeclinedAndCancelledEventsInWidgets:(BOOL)a3;
- (void)setShowExperimentalUI:(BOOL)a3;
- (void)setShowListView:(BOOL)a3;
- (void)setShowMonthDividedListView:(BOOL)a3;
- (void)setShowWeekNumbers:(BOOL)a3;
- (void)setShowWindowDebugButton:(BOOL)a3;
- (void)setSimulatedCurrentDate:(id)a3;
- (void)setSwipeToDeleteEnabled:(BOOL)a3;
- (void)setViewedTimeZoneAutomatic:(BOOL)a3;
- (void)setWeekStart:(id)a3;
- (void)setWeekViewHourScale:(id)a3;
- (void)setWeekViewStartsOnToday:(BOOL)a3;
@end

@implementation CUIKPreferences

- (BOOL)showWeekNumbers
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"ShowWeekNumbers" defaultValue:0];
}

- (NSNumber)lastSidebarMode
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"LastSidebarMode" expectedClass:objc_opt_class()];
  if (!v2)
  {
    v2 = [NSNumber numberWithUnsignedInteger:0];
  }

  return (NSNumber *)v2;
}

- (unint64_t)monthViewScaleSize
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"MonthViewScaleSize" expectedClass:objc_opt_class()];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 integerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (BOOL)overrideLocaleWeekends
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"overrideLocaleWeekends" defaultValue:0];
}

- (NSString)overlayCalendarID
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"overlayCalendarID" expectedClass:objc_opt_class()];
  if (!v2)
  {
    if ([MEMORY[0x1E4F70FE8] isLunarCalendarDefaultOn])
    {
      v3 = (void *)MEMORY[0x1E4F70FE8];
      unint64_t v4 = [MEMORY[0x1E4F1CA20] currentLocale];
      v5 = [v4 localeIdentifier];
      v2 = [v3 preferredLunarCalendarForLocaleID:v5];
    }
    else
    {
      v2 = &stru_1F187C430;
    }
  }

  return (NSString *)v2;
}

- (void)setShowListView:(BOOL)a3
{
}

- (BOOL)enableMultiwindowAsserts
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"EnableMultiwindowAsserts" defaultValue:0];
}

- (void)setNumDaysToShow:(int64_t)a3
{
}

- (NSNumber)lastViewMode
{
  uint64_t v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"LastViewType" expectedClass:objc_opt_class()];
  v3 = (void *)v2;
  unint64_t v4 = &unk_1F1892198;
  if (v2) {
    unint64_t v4 = (void *)v2;
  }
  id v5 = v4;

  return (NSNumber *)v5;
}

- (NSNumber)weekStart
{
  preferences = self->_preferences;
  uint64_t v3 = *MEMORY[0x1E4F57560];
  uint64_t v4 = objc_opt_class();

  return (NSNumber *)[(CalPreferences *)preferences getValueForPreference:v3 expectedClass:v4];
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_36);
  }
  uint64_t v2 = (void *)sharedPreferences_sharedPreferences;

  return v2;
}

- (BOOL)showListView
{
  int v3 = CUIKShouldSaveStateInPreferences();
  if (v3)
  {
    preferences = self->_preferences;
    LOBYTE(v3) = [(CalPreferences *)preferences getBooleanPreference:@"ShowListView" defaultValue:0];
  }
  return v3;
}

- (int64_t)numDaysToShow
{
  if (!CUIKShouldSaveStateInPreferences()) {
    return 1;
  }
  preferences = self->_preferences;

  return [(CalPreferences *)preferences getIntegerPreference:@"NumDaysToShow" defaultValue:1];
}

- (BOOL)showMonthDividedListView
{
  int v3 = CUIKShouldSaveStateInPreferences();
  if (v3)
  {
    preferences = self->_preferences;
    LOBYTE(v3) = [(CalPreferences *)preferences getBooleanPreference:@"ShowMonthDividedListView" defaultValue:0];
  }
  return v3;
}

- (BOOL)isShortResumeToTodayTimeout
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"ShortResumeToTodayTimeout" defaultValue:0];
}

void __36__CUIKPreferences_sharedPreferences__block_invoke()
{
  v0 = objc_alloc_init(CUIKPreferences);
  v1 = (void *)sharedPreferences_sharedPreferences;
  sharedPreferences_sharedPreferences = (uint64_t)v0;
}

- (CUIKPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)CUIKPreferences;
  uint64_t v2 = [(CUIKPreferences *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F57780]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x1E4F57900]];
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.calendarsExcludedFromNotifications"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.requestSyncOnApplicationLaunch"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.showweeknumbers"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.weekViewStartsOnToday"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.showlistview"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.viewedTimeZoneAutomatic"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.drawDebugViewColors"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.immediateAlarmCreation"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.eventsInMonthView"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.weekStart"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.overlayCalendarID"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.LocationSearchResultLimit"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.PromptForCommentWhenDeclining"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.ShowExperimentalUI"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.DisableContinuity"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.swipeToDeleteEnabled"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.largeListViewDisclosingEventDetails"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.showWindowDebugButton"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.shortResumeToTodayTimeout"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.HighColorCarplayChanged"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.OverrideLocaleWeekends"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.AllowSubscribedCalendarSpamDetection"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.monthWeekScale"];
  }
  return v2;
}

- (BOOL)requestSyncOnApplicationLaunch
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"RequestSyncOnApplicationLaunch" defaultValue:1];
}

- (BOOL)disableContinuity
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"DisableContinuity" defaultValue:0];
}

- (void)setLastViewMode:(id)a3
{
}

- (NSString)lastViewedOccurrenceUID
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CalPreferences *)preferences getValueForPreference:@"LastViewedOccurrenceUID" expectedClass:v3];
}

- (NSDate)lastViewedOccurrenceDate
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSDate *)[(CalPreferences *)preferences getValueForPreference:@"LastViewedOccurrenceDate" expectedClass:v3];
}

- (NSNumber)lastSuspendTime
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(CalPreferences *)preferences getValueForPreference:@"LastSuspendTime" expectedClass:v3];
}

- (NSNumber)dayViewHourScale
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(CalPreferences *)preferences getValueForPreference:@"DayViewHourScale" expectedClass:v3];
}

- (NSNumber)dayViewFirstVisibleSecond
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(CalPreferences *)preferences getValueForPreference:@"DayViewFirstVisibleSecond" expectedClass:v3];
}

- (NSDate)simulatedCurrentDate
{
  uint64_t v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"SimulatedCurrentDate" expectedClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 doubleValue];
    id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setSimulatedCurrentDate:(id)a3
{
  if (a3)
  {
    uint64_t v4 = NSNumber;
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  [(CalPreferences *)self->_preferences setValueForPreference:@"SimulatedCurrentDate" value:v5 notificationName:0];
}

- (void)setWeekStart:(id)a3
{
}

- (void)setLastSidebarMode:(id)a3
{
}

- (NSNumber)lastViewedDate
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(CalPreferences *)preferences getValueForPreference:@"LastViewedDate" expectedClass:v3];
}

- (void)setLastViewedDate:(id)a3
{
}

- (void)setLastSuspendTime:(id)a3
{
}

- (void)setDayViewHourScale:(id)a3
{
}

- (NSNumber)weekViewHourScale
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(CalPreferences *)preferences getValueForPreference:@"WeekViewHourScale" expectedClass:v3];
}

- (void)setWeekViewHourScale:(id)a3
{
}

- (void)setMonthViewScaleSize:(unint64_t)a3
{
  preferences = self->_preferences;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(CalPreferences *)preferences setValueForPreference:@"MonthViewScaleSize" value:v4 notificationName:@"com.apple.mobilecal.preference.notification.monthWeekScale"];
}

- (unint64_t)monthViewEventScaleSize
{
  uint64_t v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"MonthViewEventScaleSize" expectedClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 integerValue];
    if (v4 <= 3) {
      unint64_t v5 = 3;
    }
    else {
      unint64_t v5 = v4;
    }
  }
  else
  {
    unint64_t v5 = 3;
  }

  return v5;
}

- (void)setMonthViewEventScaleSize:(unint64_t)a3
{
  preferences = self->_preferences;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(CalPreferences *)preferences setValueForPreference:@"MonthViewEventScaleSize" value:v4 notificationName:0];
}

- (NSString)searchString
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CalPreferences *)preferences getValueForPreference:@"searchString" expectedClass:v3];
}

- (void)setSearchString:(id)a3
{
}

- (void)setOverlayCalendarID:(id)a3
{
}

- (void)setShowWeekNumbers:(BOOL)a3
{
}

- (BOOL)weekViewStartsOnToday
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"WeekViewStartsOnToday" defaultValue:0];
}

- (void)setWeekViewStartsOnToday:(BOOL)a3
{
}

- (void)setShowMonthDividedListView:(BOOL)a3
{
}

- (BOOL)immediateAlarmCreation
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"ImmediateAlarmCreation" defaultValue:0];
}

- (void)setImmediateAlarmCreation:(BOOL)a3
{
}

- (BOOL)viewedTimeZoneAutomatic
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:*MEMORY[0x1E4F578D8] defaultValue:1];
}

- (void)setViewedTimeZoneAutomatic:(BOOL)a3
{
}

- (void)setRequestSyncOnApplicationLaunch:(BOOL)a3
{
}

- (NSArray)calendarUUIDsExcludedFromNotifications
{
  uint64_t v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"CalendarsExcludedFromNotifications" expectedClass:objc_opt_class()];
  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x1E4F1C978] array];
  }

  return (NSArray *)v2;
}

- (void)setCalendarUUIDsExcludedFromNotifications:(id)a3
{
}

- (NSNumber)locationSearchResultLimit
{
  uint64_t v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"LocationSearchResultLimit" expectedClass:objc_opt_class()];
  if (!v2) {
    uint64_t v2 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:50];
  }

  return (NSNumber *)v2;
}

- (void)setLocationSearchResultLimit:(id)a3
{
}

- (unint64_t)promptForCommentWhenDeclining
{
  uint64_t v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"PromptForCommentWhenDeclining" expectedClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 integerValue];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)setPromptForCommentWhenDeclining:(unint64_t)a3
{
  preferences = self->_preferences;
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  [(CalPreferences *)preferences setValueForPreference:@"PromptForCommentWhenDeclining" value:v4 notificationName:@"com.apple.mobilecal.preference.notification.PromptForCommentWhenDeclining"];
}

- (BOOL)showExperimentalUI
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"ShowExperimentalUI" defaultValue:0];
}

- (void)setShowExperimentalUI:(BOOL)a3
{
}

- (void)setDisableContinuity:(BOOL)a3
{
}

- (BOOL)swipeToDeleteEnabled
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"swipeToDeleteEnabled" defaultValue:0];
}

- (void)setSwipeToDeleteEnabled:(BOOL)a3
{
}

- (BOOL)largeListViewDisclosingEventDetails
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"largeListViewDisclosingEventDetails" defaultValue:0];
}

- (void)setLargeListViewDisclosingEventDetails:(BOOL)a3
{
}

- (BOOL)showWindowDebugButton
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"ShowWindowDebugButton" defaultValue:0];
}

- (void)setShowWindowDebugButton:(BOOL)a3
{
}

- (BOOL)hideInlineDayViewInEventDetails
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"HideInlineDayViewInEventDetails" defaultValue:0];
}

- (void)setHideInlineDayViewInEventDetails:(BOOL)a3
{
}

- (void)setEnableMultiwindowAsserts:(BOOL)a3
{
}

- (void)setShortResumeToTodayTimeout:(BOOL)a3
{
}

- (BOOL)disableTodayPushes
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"DisableTodayPushes" defaultValue:0];
}

- (void)setDisableTodayPushes:(BOOL)a3
{
}

- (BOOL)enableAvatars
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"enableAvatars" defaultValue:0];
}

- (void)setEnableAvatars:(BOOL)a3
{
}

- (BOOL)eventAutocompleteEnabled
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"EventAutocompleteEnabled" defaultValue:1];
}

- (void)setEventAutocompleteEnabled:(BOOL)a3
{
}

- (NSArray)deselectedCalendarSyncHashes
{
  uint64_t v2 = [MEMORY[0x1E4F255C8] shared];
  uint64_t v3 = [v2 deselectedCalendarSyncHashes];

  return (NSArray *)v3;
}

- (void)setDayViewFirstVisibleSecond:(id)a3
{
}

- (void)setOverrideLocaleWeekends:(BOOL)a3
{
}

- (void)setLastViewedOccurrenceUID:(id)a3
{
}

- (void)setLastViewedOccurrenceDate:(id)a3
{
}

- (BOOL)scanForDiscoveredVirtualConferences
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"scanForDiscoveredVirtualConferences" defaultValue:1];
}

- (void)setScanForDiscoveredVirtualConferences:(BOOL)a3
{
}

- (BOOL)allowSubscribedCalendarSpamDetection
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"allowSubscribedCalendarSpamDetection" defaultValue:0];
}

- (void)setAllowSubscribedCalendarSpamDetection:(BOOL)a3
{
}

- (void)resetSubscribedCalendarSpamDetectionToNull
{
}

- (BOOL)displayedSubscribedCalendarSpamDetectionPrivacyNotice
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"displayedSubscribedCalendarSpamDetectionPrivacyNotice" defaultValue:0];
}

- (void)setDisplayedSubscribedCalendarSpamDetectionPrivacyNotice:(BOOL)a3
{
}

- (BOOL)perSectionShowAllHideAllButtonSpecifier
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"perSectionShowAllHideAllButtonSpecifier" defaultValue:0];
}

- (void)setPerSectionShowAllHideAllButtonSpecifier:(BOOL)a3
{
}

- (BOOL)showDeclinedAndCancelledEventsInWidgets
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"showDeclinedAndCancelledEventsInWidgets" defaultValue:0];
}

- (void)setShowDeclinedAndCancelledEventsInWidgets:(BOOL)a3
{
}

- (BOOL)debugLocationSearchResults
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"debugLocationSearchResults" defaultValue:0];
}

- (void)setDebugLocationSearchResults:(BOOL)a3
{
}

- (BOOL)forceAllowClearComments
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"forceAllowClearComments" defaultValue:0];
}

- (void)setForceAllowClearComments:(BOOL)a3
{
}

- (BOOL)drawDebugViewColors
{
  return self->_drawDebugViewColors;
}

- (void)setDrawDebugViewColors:(BOOL)a3
{
  self->_drawDebugViewColors = a3;
}

- (void).cxx_destruct
{
}

@end