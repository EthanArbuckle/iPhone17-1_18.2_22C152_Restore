@interface ATXHeuristicDataSourcesServer
- (ATXHeuristicDataSourcesServer)initWithDevice:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (void)alarmTimeOfDay:(id)a3;
- (void)alarmsFromDate:(id)a3 toDate:(id)a4 completionHandler:(id)a5;
- (void)allHandlesForContact:(id)a3 callback:(id)a4;
- (void)batteryInformationWithCallback:(id)a3;
- (void)bestAppSuggestionWithCallback:(id)a3;
- (void)bestHandleForContact:(id)a3 service:(id)a4 callback:(id)a5;
- (void)birthdaysWithCallback:(id)a3;
- (void)calendarEventsFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5;
- (void)callNewerThan:(double)a3 showIncoming:(BOOL)a4 showOutgoing:(BOOL)a5 missedOnly:(BOOL)a6 callback:(id)a7;
- (void)contactsWithEmail:(id)a3 callback:(id)a4;
- (void)contactsWithIdentifiers:(id)a3 callback:(id)a4;
- (void)contactsWithName:(id)a3 callback:(id)a4;
- (void)contactsWithPhone:(id)a3 callback:(id)a4;
- (void)contentsWithCallback:(id)a3;
- (void)dealloc;
- (void)duetInteractionCountForHandles:(id)a3 sinceDate:(id)a4 callback:(id)a5;
- (void)favoritesWithContacts:(id)a3 callback:(id)a4;
- (void)fetchWidgetMetadataForAppBundleIds:(id)a3 callback:(id)a4;
- (void)flightStatusForFlight:(id)a3 callback:(id)a4;
- (void)getEventsWithProminentFeature:(id)a3 callback:(id)a4;
- (void)getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4 callback:(id)a5;
- (void)holidaysFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5;
- (void)hourOfDayInteractionProbabilitiesWithContact:(id)a3 callback:(id)a4;
- (void)isFocusModeActive:(id)a3;
- (void)modeCorrelatedAppsInCurrentModeWithCallback:(id)a3;
- (void)nlEventsWithCallback:(id)a3;
- (void)obtainOneTimeLocationWithCallback:(id)a3;
- (void)passesWithStyle:(id)a3 callback:(id)a4;
- (void)peopleSuggestionsWithCallback:(id)a3;
- (void)predictedBedTimeWithCallback:(id)a3;
- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 callback:(id)a5;
- (void)scheduledBedTimeWithCallback:(id)a3;
- (void)timeIntervalSinceUserWakeupWithCallback:(id)a3;
- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 callback:(id)a8;
- (void)unreadMessagesWithLimit:(int64_t)a3 callback:(id)a4;
- (void)vipsWithCallback:(id)a3;
- (void)visibleCalendarsWithCallback:(id)a3;
@end

@implementation ATXHeuristicDataSourcesServer

- (ATXHeuristicDataSourcesServer)initWithDevice:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ATXHeuristicDataSourcesProtocol.m", 113, @"Invalid parameter not satisfying: %@", @"device" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicDataSourcesServer;
  v7 = [(ATXHeuristicDataSourcesServer *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_device, a3);
  }

  return v8;
}

- (void)bestAppSuggestionWithCallback:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x1D25F43D0]();
  v5 = [[ATXBestAppDataSource alloc] initWithDevice:self->_device];
  [(ATXBestAppDataSource *)v5 bestAppSuggestionWithCallback:v6];
}

- (void)isFocusModeActive:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x1D25F43D0]();
  v5 = [[ATXFocusModeDataSource alloc] initWithDevice:self->_device];
  [(ATXFocusModeDataSource *)v5 isFocusModeActive:v6];
}

- (void)contentsWithCallback:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x1D25F43D0]();
  v5 = [[ATXClipboardContents alloc] initWithDevice:self->_device];
  [(ATXClipboardContents *)v5 contentsWithCallback:v6];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = ATXHeuristicDataSourcesInterface();
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  listener = v2->_listener;
  if (!listener)
  {
    uint64_t v4 = [MEMORY[0x1E4F29290] anonymousListener];
    id v5 = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    listener = v2->_listener;
  }
  id v6 = [(NSXPCListener *)listener endpoint];
  objc_sync_exit(v2);

  return (NSXPCListenerEndpoint *)v6;
}

- (void)passesWithStyle:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D25F43D0]();
  v8 = [[ATXWalletDataSource alloc] initWithDevice:self->_device];
  [(ATXWalletDataSource *)v8 passesWithStyle:v9 callback:v6];
}

- (void)getEventsWithProminentFeature:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D25F43D0]();
  v8 = [[ATXExtraordinaryEventsDataSource alloc] initWithDevice:self->_device];
  [(ATXExtraordinaryEventsDataSource *)v8 getEventsWithProminentFeature:v9 callback:v6];
}

- (void)callNewerThan:(double)a3 showIncoming:(BOOL)a4 showOutgoing:(BOOL)a5 missedOnly:(BOOL)a6 callback:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v14 = a7;
  v12 = (void *)MEMORY[0x1D25F43D0]();
  v13 = [[ATXCallHistoryDataSource alloc] initWithDevice:self->_device];
  [(ATXCallHistoryDataSource *)v13 callNewerThan:v9 showIncoming:v8 showOutgoing:v7 missedOnly:v14 callback:a3];
}

- (void)calendarEventsFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D25F43D0]();
  objc_super v11 = [[ATXCalendarEventsDataSource alloc] initWithDevice:self->_device];
  [(ATXCalendarEventsDataSource *)v11 calendarEventsFromStartDate:v12 toEndDate:v8 callback:v9];
}

- (void)birthdaysWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXBirthdaysDataSource alloc] initWithDevice:self->_device];
  [(ATXBirthdaysDataSource *)v5 birthdaysWithCallback:v6];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicDataSourcesServer;
  [(ATXHeuristicDataSourcesServer *)&v3 dealloc];
}

- (void)visibleCalendarsWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXCalendarEventsDataSource alloc] initWithDevice:self->_device];
  [(ATXCalendarEventsDataSource *)v5 visibleCalendarsWithCallback:v6];
}

- (void)flightStatusForFlight:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXFlightStatusDataSource alloc] initWithDevice:self->_device];
  [(ATXFlightStatusDataSource *)v8 flightStatusForFlight:v9 callback:v6];
}

- (void)holidaysFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D25F43D0]();
  objc_super v11 = [[ATXHolidaysDataSource alloc] initWithDevice:self->_device];
  [(ATXHolidaysDataSource *)v11 holidaysFromStartDate:v12 toEndDate:v8 callback:v9];
}

- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 callback:(id)a8
{
  BOOL v9 = a7;
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v18 = (void *)MEMORY[0x1D25F43D0]();
  v19 = [[ATXEventTravelTimeDataSource alloc] initWithDevice:self->_device];
  [(ATXEventTravelTimeDataSource *)v19 travelTimeInfoForEventID:v20 location:v14 expectedArrivalDate:v15 transportType:v16 localOnlyAfterFirstUpdate:v9 callback:v17];
}

- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 callback:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D25F43D0]();
  objc_super v11 = [[ATXUserAppPreferenceDataSource alloc] initWithDevice:self->_device];
  [(ATXUserAppPreferenceDataSource *)v11 preferredAppForIntentName:v12 andParameterCombination:v8 callback:v9];
}

- (void)vipsWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXVIPsDataSource alloc] initWithDevice:self->_device];
  [(ATXVIPsDataSource *)v5 vipsWithCallback:v6];
}

- (void)nlEventsWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXNLEventsDataSource alloc] initWithDevice:self->_device];
  [(ATXNLEventsDataSource *)v5 nlEventsWithCallback:v6];
}

- (void)allHandlesForContact:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXBestContactHandleForServiceDataSource alloc] initWithDevice:self->_device];
  [(ATXBestContactHandleForServiceDataSource *)v8 allHandlesForContact:v9 callback:v6];
}

- (void)bestHandleForContact:(id)a3 service:(id)a4 callback:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D25F43D0]();
  objc_super v11 = [[ATXBestContactHandleForServiceDataSource alloc] initWithDevice:self->_device];
  [(ATXBestContactHandleForServiceDataSource *)v11 bestHandleForContact:v12 service:v8 callback:v9];
}

- (void)favoritesWithContacts:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXFavoriteContactDataSource alloc] initWithDevice:self->_device];
  [(ATXFavoriteContactDataSource *)v8 favoritesWithContacts:v9 callback:v6];
}

- (void)contactsWithIdentifiers:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXContactsDataSource alloc] initWithDevice:self->_device];
  [(ATXContactsDataSource *)v8 contactsWithIdentifiers:v9 callback:v6];
}

- (void)contactsWithName:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXContactsDataSource alloc] initWithDevice:self->_device];
  [(ATXContactsDataSource *)v8 contactsWithName:v9 callback:v6];
}

- (void)contactsWithEmail:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXContactsDataSource alloc] initWithDevice:self->_device];
  [(ATXContactsDataSource *)v8 contactsWithEmail:v9 callback:v6];
}

- (void)contactsWithPhone:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXContactsDataSource alloc] initWithDevice:self->_device];
  [(ATXContactsDataSource *)v8 contactsWithPhone:v9 callback:v6];
}

- (void)alarmsFromDate:(id)a3 toDate:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D25F43D0]();
  objc_super v11 = [[ATXAlarmsDataSource alloc] initWithDevice:self->_device];
  [(ATXAlarmsDataSource *)v11 alarmsFromDate:v12 toDate:v8 completionHandler:v9];
}

- (void)alarmTimeOfDay:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXSetAlarmTimeOfDayDataSource alloc] initWithDevice:self->_device];
  [(ATXSetAlarmTimeOfDayDataSource *)v5 alarmTimeOfDay:v6];
}

- (void)duetInteractionCountForHandles:(id)a3 sinceDate:(id)a4 callback:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D25F43D0]();
  objc_super v11 = [[ATXDuetInteractionDataSource alloc] initWithDevice:self->_device];
  [(ATXDuetInteractionDataSource *)v11 duetInteractionCountForHandles:v12 sinceDate:v8 callback:v9];
}

- (void)obtainOneTimeLocationWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXCurrentLocationDataSource alloc] initWithDevice:self->_device];
  [(ATXCurrentLocationDataSource *)v5 obtainOneTimeLocationWithCallback:v6];
}

- (void)unreadMessagesWithLimit:(int64_t)a3 callback:(id)a4
{
  id v8 = a4;
  id v6 = (void *)MEMORY[0x1D25F43D0]();
  BOOL v7 = [[ATXUnreadMessagesDataSource alloc] initWithDevice:self->_device];
  [(ATXUnreadMessagesDataSource *)v7 unreadMessagesWithLimit:a3 callback:v8];
}

- (void)peopleSuggestionsWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXPeopleSuggesterDataSource alloc] initWithDevice:self->_device];
  [(ATXPeopleSuggesterDataSource *)v5 peopleSuggestionsWithCallback:v6];
}

- (void)hourOfDayInteractionProbabilitiesWithContact:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXBestTimeToInteractWithContactDataSource alloc] initWithDevice:self->_device];
  [(ATXBestTimeToInteractWithContactDataSource *)v8 hourOfDayInteractionProbabilitiesWithContact:v9 callback:v6];
}

- (void)timeIntervalSinceUserWakeupWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXTimeSinceUserWakeupDataSource alloc] initWithDevice:self->_device];
  [(ATXTimeSinceUserWakeupDataSource *)v5 timeIntervalSinceUserWakeupWithCallback:v6];
}

- (void)batteryInformationWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXBatteryDataSource alloc] initWithDevice:self->_device];
  [(ATXBatteryDataSource *)v5 batteryInformationWithCallback:v6];
}

- (void)fetchWidgetMetadataForAppBundleIds:(id)a3 callback:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F43D0]();
  id v8 = [[ATXWidgetMetadataDataSource alloc] initWithDevice:self->_device];
  [(ATXWidgetMetadataDataSource *)v8 fetchWidgetMetadataForAppBundleIds:v9 callback:v6];
}

- (void)getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4 callback:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D25F43D0]();
  objc_super v11 = [[ATXTripEventsDataSource alloc] initWithDevice:self->_device];
  [(ATXTripEventsDataSource *)v11 getLocationForMostRelevantTripInRangeFrom:v12 to:v8 callback:v9];
}

- (void)modeCorrelatedAppsInCurrentModeWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXModeCorrelatedAppsDataSource alloc] initWithDevice:self->_device];
  [(ATXModeCorrelatedAppsDataSource *)v5 modeCorrelatedAppsInCurrentModeWithCallback:v6];
}

- (void)scheduledBedTimeWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXChangeAlarmBeforeHolidayDataSource alloc] initWithDevice:self->_device];
  [(ATXChangeAlarmBeforeHolidayDataSource *)v5 scheduledBedTimeWithCallback:v6];
}

- (void)predictedBedTimeWithCallback:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F43D0]();
  id v5 = [[ATXChangeAlarmBeforeHolidayDataSource alloc] initWithDevice:self->_device];
  [(ATXChangeAlarmBeforeHolidayDataSource *)v5 predictedBedTimeWithCallback:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end