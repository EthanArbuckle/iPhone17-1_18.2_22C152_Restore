@interface ATXHeuristicDataSourcesClient
- (ATXHeuristicDataSourcesClient)initWithListenerEndpoint:(id)a3;
- (id)_queryProxySynchronouslyWithTimeout:(double)a3 queryHandler:(id)a4;
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

@implementation ATXHeuristicDataSourcesClient

- (ATXHeuristicDataSourcesClient)initWithListenerEndpoint:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ATXHeuristicDataSources.m", 46, @"Invalid parameter not satisfying: %@", @"listenerEndpoint" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)ATXHeuristicDataSourcesClient;
  v6 = [(ATXHeuristicDataSourcesClient *)&v12 init];
  if (v6)
  {
    v7 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v5];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = v7;

    v9 = ATXHeuristicDataSourcesInterface();
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v6->_xpcConnection resume];
  }

  return v6;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicDataSourcesClient;
  [(ATXHeuristicDataSourcesClient *)&v3 dealloc];
}

- (id)_queryProxySynchronouslyWithTimeout:(double)a3 queryHandler:(id)a4
{
  v6 = (void (**)(id, void *, void *))a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_1000059D4;
  v31 = sub_1000059E4;
  id v32 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  xpcConnection = self->_xpcConnection;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000059EC;
  v24[3] = &unk_100024B70;
  v26 = &v27;
  v9 = v7;
  v25 = v9;
  v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100005A4C;
  v21 = &unk_100024B70;
  v23 = &v27;
  v11 = v9;
  v22 = v11;
  objc_super v12 = objc_retainBlock(&v18);
  ((void (**)(id, void *, void ***))v6)[2](v6, v10, v12);
  if (+[_PASDispatch waitForSemaphore:timeoutSeconds:](_PASDispatch, "waitForSemaphore:timeoutSeconds:", v11, a3, v18, v19, v20, v21) == 1)
  {
    v13 = sub_100002EBC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100007E48(v13);
    }

    uint64_t v14 = +[NSError errorWithDomain:NSCocoaErrorDomain code:1 userInfo:0];
    v15 = (void *)v28[5];
    v28[5] = v14;
  }
  id v16 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v16;
}

- (void)getEventsWithProminentFeature:(id)a3 callback:(id)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000059D4;
  v17 = sub_1000059E4;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005BF0;
  v10[3] = &unk_100024BC0;
  id v8 = v6;
  id v11 = v8;
  objc_super v12 = &v13;
  v9 = [(ATXHeuristicDataSourcesClient *)self _queryProxySynchronouslyWithTimeout:v10 queryHandler:5.0];
  v7[2](v7, v14[5], v9);

  _Block_object_dispose(&v13, 8);
}

- (void)calendarEventsFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_1000059D4;
  v22 = sub_1000059E4;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005E8C;
  v14[3] = &unk_100024BE8;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  v17 = &v18;
  uint64_t v13 = [(ATXHeuristicDataSourcesClient *)self _queryProxySynchronouslyWithTimeout:v14 queryHandler:5.0];
  v10[2](v10, v19[5], v13);

  _Block_object_dispose(&v18, 8);
}

- (void)visibleCalendarsWithCallback:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000059D4;
  id v11 = sub_1000059E4;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000060DC;
  v6[3] = &unk_100024C10;
  v6[4] = &v7;
  id v5 = [(ATXHeuristicDataSourcesClient *)self _queryProxySynchronouslyWithTimeout:v6 queryHandler:5.0];
  v4[2](v4, v8[5], v5);

  _Block_object_dispose(&v7, 8);
}

- (void)flightStatusForFlight:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000062C4;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 flightStatusForFlight:v9 callback:v8];
}

- (void)birthdaysWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006388;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 birthdaysWithCallback:v6];
}

- (void)holidaysFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000647C;
  v14[3] = &unk_100024C38;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 holidaysFromStartDate:v12 toEndDate:v11 callback:v10];
}

- (void)passesWithStyle:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000655C;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 passesWithStyle:v9 callback:v8];
}

- (void)bestAppSuggestionWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006620;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 bestAppSuggestionWithCallback:v6];
}

- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 callback:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  xpcConnection = self->_xpcConnection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006754;
  v22[3] = &unk_100024C38;
  id v23 = v14;
  id v16 = v14;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v22];
  [v21 travelTimeInfoForEventID:v20 location:v19 expectedArrivalDate:v18 transportType:v17 localOnlyAfterFirstUpdate:v8 callback:v16];
}

- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 callback:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006848;
  v14[3] = &unk_100024C38;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 preferredAppForIntentName:v12 andParameterCombination:v11 callback:v10];
}

- (void)contentsWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000690C;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 contentsWithCallback:v6];
}

- (void)vipsWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000069D8;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 vipsWithCallback:v6];
}

- (void)callNewerThan:(double)a3 showIncoming:(BOOL)a4 showOutgoing:(BOOL)a5 missedOnly:(BOOL)a6 callback:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  xpcConnection = self->_xpcConnection;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100006AD4;
  v16[3] = &unk_100024C38;
  id v17 = v12;
  id v14 = v12;
  id v15 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v16];
  [v15 callNewerThan:v9 showIncoming:v8 showOutgoing:v7 missedOnly:v14 callback:a3];
}

- (void)nlEventsWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006B98;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 nlEventsWithCallback:v6];
}

- (void)allHandlesForContact:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006C78;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 allHandlesForContact:v9 callback:v8];
}

- (void)bestHandleForContact:(id)a3 service:(id)a4 callback:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006D6C;
  v14[3] = &unk_100024C38;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 bestHandleForContact:v12 service:v11 callback:v10];
}

- (void)favoritesWithContacts:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006E4C;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 favoritesWithContacts:v9 callback:v8];
}

- (void)contactsWithIdentifiers:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006F2C;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 contactsWithIdentifiers:v9 callback:v8];
}

- (void)contactsWithName:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000700C;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 contactsWithName:v9 callback:v8];
}

- (void)contactsWithEmail:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000070EC;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 contactsWithEmail:v9 callback:v8];
}

- (void)contactsWithPhone:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000071CC;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 contactsWithPhone:v9 callback:v8];
}

- (void)alarmsFromDate:(id)a3 toDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000072C0;
  v14[3] = &unk_100024C38;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 alarmsFromDate:v12 toDate:v11 completionHandler:v10];
}

- (void)alarmTimeOfDay:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007384;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 alarmTimeOfDay:v6];
}

- (void)isFocusModeActive:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007448;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 isFocusModeActive:v6];
}

- (void)duetInteractionCountForHandles:(id)a3 sinceDate:(id)a4 callback:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000753C;
  v14[3] = &unk_100024C38;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 duetInteractionCountForHandles:v12 sinceDate:v11 callback:v10];
}

- (void)obtainOneTimeLocationWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007600;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 obtainOneTimeLocationWithCallback:v6];
}

- (void)unreadMessagesWithLimit:(int64_t)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000076D4;
  v10[3] = &unk_100024C38;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v10];
  [v9 unreadMessagesWithLimit:a3 callback:v8];
}

- (void)peopleSuggestionsWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007798;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 peopleSuggestionsWithCallback:v6];
}

- (void)hourOfDayInteractionProbabilitiesWithContact:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007878;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 hourOfDayInteractionProbabilitiesWithContact:v9 callback:v8];
}

- (void)timeIntervalSinceUserWakeupWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000793C;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 timeIntervalSinceUserWakeupWithCallback:v6];
}

- (void)batteryInformationWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007A00;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 batteryInformationWithCallback:v6];
}

- (void)fetchWidgetMetadataForAppBundleIds:(id)a3 callback:(id)a4
{
  id v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007AE0;
  v11[3] = &unk_100024C38;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v10 fetchWidgetMetadataForAppBundleIds:v9 callback:v8];
}

- (void)getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4 callback:(id)a5
{
  id v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007BD4;
  v14[3] = &unk_100024C38;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 getLocationForMostRelevantTripInRangeFrom:v12 to:v11 callback:v10];
}

- (void)modeCorrelatedAppsInCurrentModeWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007C98;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 modeCorrelatedAppsInCurrentModeWithCallback:v6];
}

- (void)predictedBedTimeWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007D60;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 predictedBedTimeWithCallback:v6];
}

- (void)scheduledBedTimeWithCallback:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007E24;
  v8[3] = &unk_100024C38;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 scheduledBedTimeWithCallback:v6];
}

- (void).cxx_destruct
{
}

@end