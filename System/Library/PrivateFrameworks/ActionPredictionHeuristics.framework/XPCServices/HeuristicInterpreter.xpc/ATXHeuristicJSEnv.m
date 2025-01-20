@interface ATXHeuristicJSEnv
+ (id)defaultHeuristicBundlePath;
- (ATXHeuristicDevice)device;
- (ATXHeuristicJSEnv)init;
- (ATXHeuristicJSEnv)initWithHeuristicBundle:(id)a3 dataProvider:(id)a4;
- (BOOL)BOOLByEvaluatingJavaScript:(id)a3;
- (BOOL)_BOOLForMGQuery:(int)a3;
- (BOOL)_isEventAtOneWithTimeIntervelOrDate:(id)a3 usesTwelveHourClock:(BOOL)a4;
- (BOOL)_isFocusModeActiveFromDataSource;
- (BOOL)_mgQueryCaller:(int)a3;
- (NSDate)now;
- (double)doubleByEvaluatingJavaScript:(id)a3;
- (id)_allHandlesFromDataSourceWithContact:(id)a3;
- (id)_allHeuristicClassNames;
- (id)_allHeuristicNames;
- (id)_batteryInformationFromDataSource;
- (id)_bestAppSuggestionFromDataSource;
- (id)_bestContactHandleFromDataSourceWithContact:(id)a3 serviceString:(id)a4;
- (id)_bestTimeToInteractFromDataSourceWithContact:(id)a3;
- (id)_birthdayEventsFromDataSource;
- (id)_calendarEventsFromDataSourceBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)_callHistoryFromDataSourceWithMaxAge:(double)a3 showIncomingCalls:(BOOL)a4 showOutgoingCalls:(BOOL)a5 showMissedCallsOnly:(BOOL)a6;
- (id)_cityNameFromAirportCode:(id)a3;
- (id)_clipboardContentsFromDataSource;
- (id)_contactsDataSourceWithType:(id)a3 value:(id)a4 identifiers:(id)a5;
- (id)_currentLocationFromDataSource;
- (id)_dateFromTimeIntervalOrDate:(id)a3;
- (id)_duetInteractionCountFromDataSourceWithHandles:(id)a3 date:(id)a4;
- (id)_enabledAlarmsFromTS:(double)a3 toTS:(double)a4;
- (id)_eventPassesFromDataSourceWithStyle:(id)a3;
- (id)_extraordinaryEventsFromDataSourceWithProminentFeature:(id)a3;
- (id)_favoriteContactsFromDataSourceWithExistingContacts:(id)a3;
- (id)_fetchWidgetMetadataForAppBundleIds:(id)a3;
- (id)_functionNameForMGQuery:(int)a3;
- (id)_getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4;
- (id)_holidayEventsFromDataSourceBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)_latestFlightStatus:(id)a3;
- (id)_localizedFormatStringForKey:(id)a3;
- (id)_makeIntentDescriptionWithCustomTypeName:(id)a3 parameters:(id)a4;
- (id)_modeCorrelatedAppsInCurrentMode;
- (id)_nlEventsFromDataSource;
- (id)_peopleSuggestionsFromDataSource;
- (id)_predictedBedTime;
- (id)_scheduledBedTime;
- (id)_timeIntervalSinceUserWakeup;
- (id)_travelTimeForEventWithID:(id)a3 latitude:(double)a4 longitude:(double)a5 expectedArrivalDate:(id)a6 transportType:(id)a7 localOnlyAfterFirstUpdate:(BOOL)a8;
- (id)_unreadMessagesWithLimit:(int64_t)a3;
- (id)_userAppPreferenceFromDataSourceWithIntentName:(id)a3 parameterCombination:(id)a4;
- (id)_usualAlarmTimeOfDayDataSource;
- (id)_vipsFromDataSource;
- (id)_visibleCalendarsFromDataSource;
- (id)actionsAndExpirersForHeuristics:(id)a3;
- (id)actionsAndExpirersForHeuristicsExcept:(id)a3;
- (id)executeHeuristics:(id)a3;
- (id)generateAllHeuristicNames;
- (id)heuristicResults;
- (id)objectByEvaluatingJavaScript:(id)a3;
- (id)resultsForInformationHeuristics:(id)a3;
- (id)stringByEvaluatingJavaScript:(id)a3;
- (int)intByEvaluatingJavaScript:(id)a3;
- (void)_addAction:(id)a3 withCriteria:(id)a4;
- (void)_expireCacheAfterDarwinNotification:(id)a3;
- (void)_expireCacheAfterLocalNotification:(id)a3;
- (void)_expireCacheAfterTime:(double)a3;
- (void)_expireCacheAtTime:(double)a3;
- (void)_injectScript;
- (void)_recordErrorForCurrentHeuristic;
- (void)_refreshAfterDarwinNotification:(id)a3 coalescingInterval:(double)a4;
- (void)_refreshAfterLocalNotification:(id)a3;
- (void)_refreshAfterTimeInterval:(double)a3;
- (void)_refreshAfterUserWakeUp;
- (void)_refreshAtTimestamp:(double)a3;
- (void)_refreshOnAirplaneModeToggle;
- (void)_refreshWithInferredModeStream;
- (void)_refreshWithUserFocusComputedModeStream;
- (void)_registerDataSources;
- (void)_setUpInterpreter;
- (void)dealloc;
- (void)mockClipboardContent:(id)a3 createdAt:(id)a4;
- (void)mockClipboardContent:(id)a3 createdAt:(id)a4 fromBundleId:(id)a5;
- (void)mockDataSource:(id)a3 block:(id)a4;
- (void)mockDataSource:(id)a3 returning:(id)a4;
- (void)mockEventTravelTimeWithDuration:(double)a3;
- (void)mockMidnightAndGetHolidayEventsToday:(double)a3;
- (void)mockMidnightAndGetHolidayEventsTomorrow:(double)a3;
- (void)mockUsesTwelveHourClock:(BOOL)a3;
- (void)setNow:(id)a3;
- (void)trackActionsAndExpirersForHeuristicName:(id)a3 mutableResult:(id)a4 performingBlock:(id)a5;
- (void)trackCardsAndRefreshTriggersForInformationHeuristicName:(id)a3 mutableResults:(id)a4 performingBlock:(id)a5;
@end

@implementation ATXHeuristicJSEnv

+ (id)defaultHeuristicBundlePath
{
  v2 = +[ATXAssets2 pathForResource:@"Heuristics" ofType:&stru_100025C48 isDirectory:1];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = sub_100002EBC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100017C98();
    }
  }

  return v3;
}

- (ATXHeuristicJSEnv)init
{
  v3 = +[ATXHeuristicJSEnv defaultHeuristicBundlePath];
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_5;
  }
  id v4 = +[NSBundle bundleWithPath:v3];
  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  self = [(ATXHeuristicJSEnv *)self initWithHeuristicBundle:v4 dataProvider:0];
  v5 = self;
LABEL_6:
  v6 = v5;

  return v6;
}

- (ATXHeuristicJSEnv)initWithHeuristicBundle:(id)a3 dataProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)ATXHeuristicJSEnv;
  v9 = [(ATXHeuristicJSEnv *)&v26 init];
  if (v9)
  {
    v10 = sub_100002D8C();
    v9->_os_signpost_id_t signpost = os_signpost_id_generate(v10);

    v11 = sub_100002D8C();
    v12 = v11;
    os_signpost_id_t signpost = v9->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v25[0] = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "ATXHeuristicJSEnv", " enableTelemetry=YES ", (uint8_t *)v25, 2u);
    }

    objc_storeStrong((id *)&v9->_heuristicsBundle, a3);
    v14 = (ATXHeuristicDevice *)[objc_alloc((Class)ATXHeuristicDevice) initWithLocationManager:0];
    device = v9->_device;
    v9->_device = v14;

    if (v8)
    {
      v16 = (ATXHeuristicDataSources *)v8;
      provider = v9->_provider;
      v9->_provider = v16;
    }
    else
    {
      v18 = (ATXHeuristicDataSourcesServer *)[objc_alloc((Class)ATXHeuristicDataSourcesServer) initWithDevice:v9->_device];
      dataSourcesServer = v9->_dataSourcesServer;
      v9->_dataSourcesServer = v18;

      v20 = [ATXHeuristicDataSourcesClient alloc];
      provider = [(ATXHeuristicDataSourcesServer *)v9->_dataSourcesServer listenerEndpoint];
      v21 = [(ATXHeuristicDataSourcesClient *)v20 initWithListenerEndpoint:provider];
      v22 = v9->_provider;
      v9->_provider = (ATXHeuristicDataSources *)v21;
    }
    *(_WORD *)&v9->_mgQueryResults[4] = -1;
    *(_DWORD *)v9->_mgQueryResults = -1;
    [(ATXHeuristicJSEnv *)v9 _setUpInterpreter];
    v23 = v9;
  }

  return v9;
}

- (void)dealloc
{
  v3 = sub_100002D8C();
  id v4 = v3;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, signpost, "ATXHeuristicJSEnv", " enableTelemetry=YES ", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ATXHeuristicJSEnv;
  [(ATXHeuristicJSEnv *)&v6 dealloc];
}

- (void)_setUpInterpreter
{
  v3 = objc_opt_new();
  [(ATXHeuristicJSEnv *)self setNow:v3];

  id v4 = (JSVirtualMachine *)objc_alloc_init((Class)JSVirtualMachine);
  virtualMachine = self->_virtualMachine;
  self->_virtualMachine = v4;

  objc_super v6 = (JSContext *)[objc_alloc((Class)JSContext) initWithVirtualMachine:self->_virtualMachine];
  jsContext = self->_jsContext;
  self->_jsContext = v6;

  [(JSContext *)self->_jsContext setObject:&off_100027FA0 forKeyedSubscript:@"ATXSuggestionLayoutOption1Row1Column"];
  [(JSContext *)self->_jsContext setObject:&off_100027FB8 forKeyedSubscript:@"ATXSuggestionLayoutOption1Row2Columns"];
  [(JSContext *)self->_jsContext setObject:&off_100027FD0 forKeyedSubscript:@"ATXSuggestionLayoutOption2Rows2Columns"];
  [(JSContext *)self->_jsContext setObject:&off_100027FE8 forKeyedSubscript:@"ATXSuggestionLayoutOption2Rows4Columns"];
  [(JSContext *)self->_jsContext setObject:&off_100028000 forKeyedSubscript:@"ATXSuggestionLayoutOption1Row4Columns"];
  [(JSContext *)self->_jsContext setObject:&off_100028018 forKeyedSubscript:@"ATXSuggestionLayoutOption4Rows4Columns"];
  [(JSContext *)self->_jsContext setObject:&off_100028030 forKeyedSubscript:@"ATXSuggestionLayoutOption4Rows8Columns"];
  [(JSContext *)self->_jsContext setObject:ATXHomeScreenPageConfigUpdateDarwinNotificationName forKeyedSubscript:@"ATXHomeScreenPageConfigUpdateDarwinNotificationName"];
  [(JSContext *)self->_jsContext setObject:ATXTodayPageConfigUpdateDarwinNotificationName forKeyedSubscript:@"ATXTodayPageConfigUpdateDarwinNotificationName"];
  [(JSContext *)self->_jsContext setObject:@"SignificantTimeChangeNotification" forKeyedSubscript:@"SignificantTimeChangeNotification"];
  [(JSContext *)self->_jsContext setObject:&off_100028048 forKeyedSubscript:@"PPEventRankerProminentFeatureUnusualStartTime"];
  [(JSContext *)self->_jsContext setObject:NSUserActivityTypeBrowsingWeb forKeyedSubscript:@"NSUserActivityTypeBrowsingWeb"];
  [(JSContext *)self->_jsContext setObject:ATXLocalPasteboardDidChangeNotification forKeyedSubscript:@"ATXLocalPasteboardDidChangeNotification"];
  id v8 = +[NSString stringWithUTF8String:_UABestAppSuggestionChangedNotification];
  [(JSContext *)self->_jsContext setObject:v8 forKeyedSubscript:@"UABestAppSuggestionChangedNotification"];

  [(JSContext *)self->_jsContext setObject:@"com.apple.CallHistoryPluginHelper.launchnotification" forKeyedSubscript:@"CallHistoryChangedNotification"];
  [(JSContext *)self->_jsContext setObject:MTAlarmManagerAlarmsChanged forKeyedSubscript:@"MTAlarmManagerAlarmsChanged"];
  [(JSContext *)self->_jsContext setObject:EKEventStoreChangedNotification forKeyedSubscript:@"EKEventStoreChangedNotification"];
  [(JSContext *)self->_jsContext setObject:@"ATXTravelTimeUpdated" forKeyedSubscript:@"ATXEventTravelTimeUpdated"];
  [(JSContext *)self->_jsContext setObject:ATXDNDStateChanged forKeyedSubscript:@"ATXDNDStateChanged"];
  [(JSContext *)self->_jsContext setObject:ATXPassLibraryChanged forKeyedSubscript:@"ATXPassLibraryChanged"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.LaunchServices.applicationUnregistered" forKeyedSubscript:@"LSApplicationUnregistered"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.system.accpowersources.timeremaining" forKeyedSubscript:@"kIOPSAccNotifyTimeRemaining"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.system.accpowersources.attach" forKeyedSubscript:@"kIOPSAccNotifyAttach"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.system.accpowersources.source" forKeyedSubscript:@"kIOPSAccNotifyPowerSource"];
  [(JSContext *)self->_jsContext setObject:&off_100028060 forKeyedSubscript:@"RUNNING_TESTS"];
  [(JSContext *)self->_jsContext setObject:CNFavoritesChangedExternallyNotification forKeyedSubscript:@"CNFavoritesChangedExternallyNotification"];
  objc_initWeak(location, self);
  v165[0] = _NSConcreteStackBlock;
  v165[1] = 3221225472;
  v165[2] = sub_10000A4E0;
  v165[3] = &unk_100024C60;
  objc_copyWeak(&v166, location);
  v9 = objc_retainBlock(v165);
  [(JSContext *)self->_jsContext setObject:v9 forKeyedSubscript:@"expireAfterTime"];

  v163[0] = _NSConcreteStackBlock;
  v163[1] = 3221225472;
  v163[2] = sub_10000A530;
  v163[3] = &unk_100024C60;
  objc_copyWeak(&v164, location);
  v10 = objc_retainBlock(v163);
  [(JSContext *)self->_jsContext setObject:v10 forKeyedSubscript:@"expireAtTime"];

  v161[0] = _NSConcreteStackBlock;
  v161[1] = 3221225472;
  v161[2] = sub_10000A580;
  v161[3] = &unk_100024C88;
  objc_copyWeak(&v162, location);
  v11 = objc_retainBlock(v161);
  [(JSContext *)self->_jsContext setObject:v11 forKeyedSubscript:@"expireAfterLocalNotification"];

  v159[0] = _NSConcreteStackBlock;
  v159[1] = 3221225472;
  v159[2] = sub_10000A69C;
  v159[3] = &unk_100024C88;
  objc_copyWeak(&v160, location);
  v12 = objc_retainBlock(v159);
  [(JSContext *)self->_jsContext setObject:v12 forKeyedSubscript:@"expireAfterDarwinNotification"];

  v157[0] = _NSConcreteStackBlock;
  v157[1] = 3221225472;
  v157[2] = sub_10000A70C;
  v157[3] = &unk_100024CB0;
  objc_copyWeak(&v158, location);
  v13 = objc_retainBlock(v157);
  [(JSContext *)self->_jsContext setObject:v13 forKeyedSubscript:@"recordError"];

  [(JSContext *)self->_jsContext setObject:&stru_100024CF0 forKeyedSubscript:@"appNameFromBundleID"];
  [(JSContext *)self->_jsContext setObject:&stru_100024D30 forKeyedSubscript:@"dataDetectors"];
  [(JSContext *)self->_jsContext setObject:&stru_100024D70 forKeyedSubscript:@"localizedTimeForAlarm"];
  v155[0] = _NSConcreteStackBlock;
  v155[1] = 3221225472;
  v155[2] = sub_10000A8A0;
  v155[3] = &unk_100024D98;
  objc_copyWeak(&v156, location);
  v14 = objc_retainBlock(v155);
  [(JSContext *)self->_jsContext setObject:v14 forKeyedSubscript:@"localizedFormat"];

  v153[0] = _NSConcreteStackBlock;
  v153[1] = 3221225472;
  v153[2] = sub_10000A91C;
  v153[3] = &unk_100024DC0;
  objc_copyWeak(&v154, location);
  v15 = objc_retainBlock(v153);
  [(JSContext *)self->_jsContext setObject:v15 forKeyedSubscript:@"makeLocalizedTime"];

  v151[0] = _NSConcreteStackBlock;
  v151[1] = 3221225472;
  v151[2] = sub_10000A9B4;
  v151[3] = &unk_100024DE8;
  objc_copyWeak(&v152, location);
  v16 = objc_retainBlock(v151);
  [(JSContext *)self->_jsContext setObject:v16 forKeyedSubscript:@"isEventAtOne"];

  v149[0] = _NSConcreteStackBlock;
  v149[1] = 3221225472;
  v149[2] = sub_10000AA20;
  v149[3] = &unk_100024DC0;
  objc_copyWeak(&v150, location);
  v17 = objc_retainBlock(v149);
  [(JSContext *)self->_jsContext setObject:v17 forKeyedSubscript:@"makeLocalizedDateTime"];

  v147[0] = 0;
  v147[1] = v147;
  v147[2] = 0x3032000000;
  v147[3] = sub_10000AAB8;
  v147[4] = sub_10000AAC8;
  id v148 = 0;
  v145[0] = _NSConcreteStackBlock;
  v145[1] = 3221225472;
  v145[2] = sub_10000AAD0;
  v145[3] = &unk_100024E10;
  v145[4] = v147;
  objc_copyWeak(&v146, location);
  v18 = objc_retainBlock(v145);
  [(JSContext *)self->_jsContext setObject:v18 forKeyedSubscript:@"getBestAppSuggestionDictionary"];

  v143[0] = _NSConcreteStackBlock;
  v143[1] = 3221225472;
  v143[2] = sub_10000ADD0;
  v143[3] = &unk_100024E38;
  objc_copyWeak(&v144, location);
  v143[4] = v147;
  v19 = objc_retainBlock(v143);
  [(JSContext *)self->_jsContext setObject:v19 forKeyedSubscript:@"makeBestAppAction"];

  [(JSContext *)self->_jsContext setObject:&stru_100024E58 forKeyedSubscript:@"extractHostFromURL"];
  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472;
  v142[2] = sub_10000B004;
  v142[3] = &unk_100024E80;
  v142[4] = v147;
  v20 = objc_retainBlock(v142);
  [(JSContext *)self->_jsContext setObject:v20 forKeyedSubscript:@"mockBestAppSuggestionFromDataSource"];

  [(JSContext *)self->_jsContext setObject:&stru_100024EC0 forKeyedSubscript:@"allowBestAppNotifications"];
  v140[0] = _NSConcreteStackBlock;
  v140[1] = 3221225472;
  v140[2] = sub_10000B118;
  v140[3] = &unk_100024EE8;
  objc_copyWeak(&v141, location);
  v21 = objc_retainBlock(v140);
  [(JSContext *)self->_jsContext setObject:v21 forKeyedSubscript:@"getNLEvents"];

  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472;
  v138[2] = sub_10000B164;
  v138[3] = &unk_100024F10;
  objc_copyWeak(&v139, location);
  v22 = objc_retainBlock(v138);
  [(JSContext *)self->_jsContext setObject:v22 forKeyedSubscript:@"getContacts"];

  v136[0] = _NSConcreteStackBlock;
  v136[1] = 3221225472;
  v136[2] = sub_10000B22C;
  v136[3] = &unk_100024F38;
  objc_copyWeak(&v137, location);
  v23 = objc_retainBlock(v136);
  [(JSContext *)self->_jsContext setObject:v23 forKeyedSubscript:@"getEnabledAlarms"];

  v134[0] = _NSConcreteStackBlock;
  v134[1] = 3221225472;
  v134[2] = sub_10000B290;
  v134[3] = &unk_100024F60;
  objc_copyWeak(&v135, location);
  v24 = objc_retainBlock(v134);
  [(JSContext *)self->_jsContext setObject:v24 forKeyedSubscript:@"getCurrentLocation"];

  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472;
  v132[2] = sub_10000B2DC;
  v132[3] = &unk_100024F88;
  objc_copyWeak(&v133, location);
  v25 = objc_retainBlock(v132);
  [(JSContext *)self->_jsContext setObject:v25 forKeyedSubscript:@"getUnreadMessages"];

  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472;
  v130[2] = sub_10000B330;
  v130[3] = &unk_100024EE8;
  objc_copyWeak(&v131, location);
  objc_super v26 = objc_retainBlock(v130);
  [(JSContext *)self->_jsContext setObject:v26 forKeyedSubscript:@"getBatteryInformation"];

  [(JSContext *)self->_jsContext setObject:&stru_100024FC8 forKeyedSubscript:@"willAlarmFireInDateRange"];
  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472;
  v128[2] = sub_10000B414;
  v128[3] = &unk_100024D98;
  objc_copyWeak(&v129, location);
  v27 = objc_retainBlock(v128);
  [(JSContext *)self->_jsContext setObject:v27 forKeyedSubscript:@"getCityNameFromAirportCode"];

  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472;
  v126[2] = sub_10000B490;
  v126[3] = &unk_100024FF0;
  objc_copyWeak(&v127, location);
  v28 = objc_retainBlock(v126);
  [(JSContext *)self->_jsContext setObject:v28 forKeyedSubscript:@"getLatestFlightStatus"];

  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_10000B4F8;
  v124[3] = &unk_100025018;
  objc_copyWeak(&v125, location);
  v29 = objc_retainBlock(v124);
  [(JSContext *)self->_jsContext setObject:v29 forKeyedSubscript:@"getSetAlarmTimeOfDay"];

  [(JSContext *)self->_jsContext setObject:&stru_100025058 forKeyedSubscript:@"timestampWithHourMinuteAtDayOfTimestamp"];
  [(JSContext *)self->_jsContext setObject:&stru_100025098 forKeyedSubscript:@"timestampByOffsettingDays"];
  [(JSContext *)self->_jsContext setObject:&stru_1000250B8 forKeyedSubscript:@"phoneNumberFromTelUrl"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.mobilesafari" forKeyedSubscript:@"safariBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.mobilecal" forKeyedSubscript:@"calendarBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.mobilecal.CalendarWidgetExtension" forKeyedSubscript:@"calendarWidgetBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.mobiletimer" forKeyedSubscript:@"clockBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.facetime" forKeyedSubscript:@"faceTimeBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.Music" forKeyedSubscript:@"musicBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.podcasts" forKeyedSubscript:@"podcastsBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.stocks" forKeyedSubscript:@"stocksBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.tv" forKeyedSubscript:@"tvBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.weather" forKeyedSubscript:@"weatherBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:@"com.apple.MobileSMS" forKeyedSubscript:@"messagesBundleIdentifier"];
  [(JSContext *)self->_jsContext setObject:&stru_1000250D8 forKeyedSubscript:@"isMac"];
  [(JSContext *)self->_jsContext setObject:&stru_1000250F8 forKeyedSubscript:@"isiPad"];
  [(JSContext *)self->_jsContext setObject:&stru_100025138 forKeyedSubscript:@"isAppInstalled"];
  [(JSContext *)self->_jsContext setObject:&stru_100025178 forKeyedSubscript:@"makeLocalizedTimeInterval"];
  [(JSContext *)self->_jsContext setObject:&stru_1000251B8 forKeyedSubscript:@"makeCriteria"];
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_10000B80C;
  v122[3] = &unk_1000251E0;
  objc_copyWeak(&v123, location);
  v30 = objc_retainBlock(v122);
  [(JSContext *)self->_jsContext setObject:v30 forKeyedSubscript:@"makeDNDForEventAction"];

  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_10000B95C;
  v120[3] = &unk_100025208;
  objc_copyWeak(&v121, location);
  v31 = objc_retainBlock(v120);
  [(JSContext *)self->_jsContext setObject:v31 forKeyedSubscript:@"makeSendMsgIntentAction"];

  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_10000BB74;
  v118[3] = &unk_100025230;
  objc_copyWeak(&v119, location);
  v32 = objc_retainBlock(v118);
  [(JSContext *)self->_jsContext setObject:v32 forKeyedSubscript:@"makeSetAlarmIntent"];

  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472;
  v116[2] = sub_10000BCC8;
  v116[3] = &unk_100025258;
  objc_copyWeak(&v117, location);
  v33 = objc_retainBlock(v116);
  [(JSContext *)self->_jsContext setObject:v33 forKeyedSubscript:@"makeUpdateAlarmIntent"];

  [(JSContext *)self->_jsContext setObject:&stru_100025298 forKeyedSubscript:@"makeEnableAirplaneModeAction"];
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_10000BE80;
  v114[3] = &unk_1000252C0;
  objc_copyWeak(&v115, location);
  v34 = objc_retainBlock(v114);
  [(JSContext *)self->_jsContext setObject:v34 forKeyedSubscript:@"makeStartCallIntentAction"];

  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = sub_10000C068;
  v112[3] = &unk_1000252E8;
  objc_copyWeak(&v113, location);
  v35 = objc_retainBlock(v112);
  [(JSContext *)self->_jsContext setObject:v35 forKeyedSubscript:@"makeStartAudioCallIntentAction"];

  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_10000C244;
  v110[3] = &unk_1000252E8;
  objc_copyWeak(&v111, location);
  v36 = objc_retainBlock(v110);
  [(JSContext *)self->_jsContext setObject:v36 forKeyedSubscript:@"makeStartVideoCallIntentAction"];

  [(JSContext *)self->_jsContext setObject:&stru_100025328 forKeyedSubscript:@"makeCreateCalendarEventAction"];
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_10000C500;
  v108[3] = &unk_100025350;
  objc_copyWeak(&v109, location);
  v37 = objc_retainBlock(v108);
  [(JSContext *)self->_jsContext setObject:v37 forKeyedSubscript:@"makeDNDForCurrentLocationAction"];

  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_10000C5C4;
  v106[3] = &unk_1000251E0;
  objc_copyWeak(&v107, location);
  v38 = objc_retainBlock(v106);
  [(JSContext *)self->_jsContext setObject:v38 forKeyedSubscript:@"makeCheckInForEventAction"];

  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_10000C7C4;
  v104[3] = &unk_100025378;
  objc_copyWeak(&v105, location);
  v39 = objc_retainBlock(v104);
  [(JSContext *)self->_jsContext setObject:v39 forKeyedSubscript:@"addInfoSuggestion"];

  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_10000CA1C;
  v102[3] = &unk_100024C60;
  objc_copyWeak(&v103, location);
  v40 = objc_retainBlock(v102);
  [(JSContext *)self->_jsContext setObject:v40 forKeyedSubscript:@"scheduleRefreshAfterTimeInterval"];

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_10000CAE4;
  v100[3] = &unk_100024C60;
  objc_copyWeak(&v101, location);
  v41 = objc_retainBlock(v100);
  [(JSContext *)self->_jsContext setObject:v41 forKeyedSubscript:@"scheduleRefreshAtTimestamp"];

  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_10000CBAC;
  v98[3] = &unk_100024C88;
  objc_copyWeak(&v99, location);
  v42 = objc_retainBlock(v98);
  [(JSContext *)self->_jsContext setObject:v42 forKeyedSubscript:@"scheduleRefreshAfterLocalNotification"];

  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_10000CC90;
  v96[3] = &unk_1000253A0;
  objc_copyWeak(&v97, location);
  v43 = objc_retainBlock(v96);
  [(JSContext *)self->_jsContext setObject:v43 forKeyedSubscript:@"scheduleRefreshAfterDarwinNotification"];

  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_10000CD90;
  v94[3] = &unk_100024CB0;
  objc_copyWeak(&v95, location);
  v44 = objc_retainBlock(v94);
  [(JSContext *)self->_jsContext setObject:v44 forKeyedSubscript:@"scheduleRefreshAfterUserWakeUp"];

  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_10000CE10;
  v92[3] = &unk_100024CB0;
  objc_copyWeak(&v93, location);
  v45 = objc_retainBlock(v92);
  [(JSContext *)self->_jsContext setObject:v45 forKeyedSubscript:@"scheduleRefreshOnAirplaneModeToggle"];

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_10000CE90;
  v90[3] = &unk_100024CB0;
  objc_copyWeak(&v91, location);
  v46 = objc_retainBlock(v90);
  [(JSContext *)self->_jsContext setObject:v46 forKeyedSubscript:@"scheduleRefreshWithUserFocusComputedModeStream"];

  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_10000CF10;
  v88[3] = &unk_100024CB0;
  objc_copyWeak(&v89, location);
  v47 = objc_retainBlock(v88);
  [(JSContext *)self->_jsContext setObject:v47 forKeyedSubscript:@"scheduleRefreshWithInferredModeStream"];

  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_10000CF90;
  v86[3] = &unk_1000253C8;
  objc_copyWeak(&v87, location);
  v48 = objc_retainBlock(v86);
  [(JSContext *)self->_jsContext setObject:v48 forKeyedSubscript:@"makeCalendarIntent"];

  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_10000CFEC;
  v84[3] = &unk_1000253C8;
  objc_copyWeak(&v85, location);
  v49 = objc_retainBlock(v84);
  [(JSContext *)self->_jsContext setObject:v49 forKeyedSubscript:@"makeWeatherIntent"];

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_10000D0BC;
  v82[3] = &unk_1000253F0;
  objc_copyWeak(&v83, location);
  v50 = objc_retainBlock(v82);
  [(JSContext *)self->_jsContext setObject:v50 forKeyedSubscript:@"makeTravelWeatherIntent"];

  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10000D374;
  v80[3] = &unk_100025418;
  objc_copyWeak(&v81, location);
  v51 = objc_retainBlock(v80);
  [(JSContext *)self->_jsContext setObject:v51 forKeyedSubscript:@"makeNSUA"];

  [(JSContext *)self->_jsContext setObject:&stru_100025458 forKeyedSubscript:@"getPerDeviceRandomTimeOffset"];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_10000D5EC;
  v78[3] = &unk_100025480;
  objc_copyWeak(&v79, location);
  v52 = objc_retainBlock(v78);
  [(JSContext *)self->_jsContext setObject:v52 forKeyedSubscript:@"addAction"];

  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10000D664;
  v76[3] = &unk_100025018;
  objc_copyWeak(&v77, location);
  v53 = objc_retainBlock(v76);
  [(JSContext *)self->_jsContext setObject:v53 forKeyedSubscript:@"now"];

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10000D6D0;
  v74[3] = &unk_1000254A8;
  objc_copyWeak(&v75, location);
  v54 = objc_retainBlock(v74);
  [(JSContext *)self->_jsContext setObject:v54 forKeyedSubscript:@"getDate"];

  [(JSContext *)self->_jsContext setObject:&stru_1000254E8 forKeyedSubscript:@"getTS"];
  [(JSContext *)self->_jsContext setObject:&stru_100025528 forKeyedSubscript:@"isTimestampToday"];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10000D86C;
  v72[3] = &unk_100025550;
  objc_copyWeak(&v73, location);
  v55 = objc_retainBlock(v72);
  [(JSContext *)self->_jsContext setObject:v55 forKeyedSubscript:@"timestampByOffsettingStartOfTodayByNumberOfDays"];

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10000D96C;
  v70[3] = &unk_100024C88;
  objc_copyWeak(&v71, location);
  v56 = objc_retainBlock(v70);
  [(JSContext *)self->_jsContext setObject:v56 forKeyedSubscript:@"consoleLog"];

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10000DA5C;
  v68[3] = &unk_100025578;
  objc_copyWeak(&v69, location);
  v57 = objc_retainBlock(v68);
  [(JSContext *)self->_jsContext setObject:v57 forKeyedSubscript:@"consoleLogPrivate"];

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10000DB70;
  v66[3] = &unk_100025578;
  objc_copyWeak(&v67, location);
  v58 = objc_retainBlock(v66);
  [(JSContext *)self->_jsContext setObject:v58 forKeyedSubscript:@"consoleLogSensitive"];

  [(JSContext *)self->_jsContext setObject:&stru_100025598 forKeyedSubscript:@"localizedAppName"];
  [(JSContext *)self->_jsContext setExceptionHandler:&stru_1000255D8];
  uint64_t v59 = 0;
  do
  {
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10000DDFC;
    v63[3] = &unk_100025600;
    objc_copyWeak(&v64, location);
    int v65 = v59;
    v60 = objc_retainBlock(v63);
    v61 = self->_jsContext;
    v62 = [(ATXHeuristicJSEnv *)self _functionNameForMGQuery:v59];
    [(JSContext *)v61 setObject:v60 forKeyedSubscript:v62];

    objc_destroyWeak(&v64);
    uint64_t v59 = (v59 + 1);
  }
  while (v59 != 6);
  [(ATXHeuristicJSEnv *)self _registerDataSources];
  [(ATXHeuristicJSEnv *)self _injectScript];
  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&v91);
  objc_destroyWeak(&v93);
  objc_destroyWeak(&v95);
  objc_destroyWeak(&v97);
  objc_destroyWeak(&v99);
  objc_destroyWeak(&v101);
  objc_destroyWeak(&v103);
  objc_destroyWeak(&v105);
  objc_destroyWeak(&v107);
  objc_destroyWeak(&v109);
  objc_destroyWeak(&v111);
  objc_destroyWeak(&v113);
  objc_destroyWeak(&v115);
  objc_destroyWeak(&v117);
  objc_destroyWeak(&v119);
  objc_destroyWeak(&v121);
  objc_destroyWeak(&v123);
  objc_destroyWeak(&v125);
  objc_destroyWeak(&v127);
  objc_destroyWeak(&v129);
  objc_destroyWeak(&v131);
  objc_destroyWeak(&v133);
  objc_destroyWeak(&v135);
  objc_destroyWeak(&v137);
  objc_destroyWeak(&v139);
  objc_destroyWeak(&v141);
  objc_destroyWeak(&v144);
  objc_destroyWeak(&v146);
  _Block_object_dispose(v147, 8);

  objc_destroyWeak(&v150);
  objc_destroyWeak(&v152);
  objc_destroyWeak(&v154);
  objc_destroyWeak(&v156);
  objc_destroyWeak(&v158);
  objc_destroyWeak(&v160);
  objc_destroyWeak(&v162);
  objc_destroyWeak(&v164);
  objc_destroyWeak(&v166);
  objc_destroyWeak(location);
}

- (void)_injectScript
{
  v3 = [(NSBundle *)self->_heuristicsBundle URLForResource:@"heuristics" withExtension:@"js"];
  if (v3)
  {
    id v8 = 0;
    id v4 = [objc_alloc((Class)NSString) initWithContentsOfURL:v3 usedEncoding:0 error:&v8];
    v5 = v8;
    if (v4)
    {
      id v6 = [(JSContext *)self->_jsContext evaluateScript:v4 withSourceURL:v3];
    }
    else
    {
      id v7 = sub_100002EBC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not load the heuristics JS script: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v5 = sub_100002EBC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Could not find the heuristics JS script", buf, 2u);
    }
  }
}

- (id)_makeIntentDescriptionWithCustomTypeName:(id)a3 parameters:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)ATXCustomIntentDescription) initWithTypeName:v6 parameters:v5];

  return v7;
}

- (id)_allHeuristicClassNames
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E0B4;
  block[3] = &unk_100025628;
  block[4] = self;
  if (qword_10002E370 != -1) {
    dispatch_once(&qword_10002E370, block);
  }
  return (id)qword_10002E368;
}

- (id)generateAllHeuristicNames
{
  v3 = [(ATXHeuristicJSEnv *)self _allHeuristicClassNames];
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[NSString stringWithFormat:@"%@.name", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        v11 = [(ATXHeuristicJSEnv *)self stringByEvaluatingJavaScript:v10];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_allHeuristicNames
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E320;
  block[3] = &unk_100025628;
  block[4] = self;
  if (qword_10002E380 != -1) {
    dispatch_once(&qword_10002E380, block);
  }
  return (id)qword_10002E378;
}

- (id)executeHeuristics:(id)a3
{
  v3 = [(ATXHeuristicJSEnv *)self actionsAndExpirersForHeuristics:a3];
  id v4 = ATXActionsFromEnvResult(v3);

  return v4;
}

- (id)actionsAndExpirersForHeuristics:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXHeuristicJSEnv *)self _allHeuristicNames];
  id v6 = [v5 mutableCopy];

  if ([v4 count])
  {
    id v7 = +[NSSet setWithArray:v4];
    [v6 minusSet:v7];
  }
  uint64_t v8 = [(ATXHeuristicJSEnv *)self actionsAndExpirersForHeuristicsExcept:v6];

  return v8;
}

- (id)actionsAndExpirersForHeuristicsExcept:(id)a3
{
  id v43 = a3;
  v42 = objc_opt_new();
  [(ATXHeuristicJSEnv *)self _allHeuristicClassNames];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v54;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v54 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        v10 = +[NSString stringWithFormat:@"%@.name", v8];
        v11 = [(ATXHeuristicJSEnv *)self stringByEvaluatingJavaScript:v10];

        if (([v43 containsObject:v11] & 1) == 0)
        {
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_10000E95C;
          v52[3] = &unk_100025650;
          v52[4] = self;
          v52[5] = v8;
          [(ATXHeuristicJSEnv *)self trackActionsAndExpirersForHeuristicName:v11 mutableResult:v42 performingBlock:v52];
          JSGarbageCollect([(JSContext *)self->_jsContext JSGlobalContextRef]);
          v12 = sub_100002EBC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            double v13 = ATXMemoryUsageInMBOfCurrentProcess();
            *(_DWORD *)buf = 134218242;
            double v60 = v13;
            __int16 v61 = 2112;
            v62 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Memory usage is %f MB after running '%@'", buf, 0x16u);
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v5);
  }

  id v14 = [(JSContext *)self->_jsContext evaluateScript:@"resetSharedState()"];
  v37 = [(NSDate *)self->_now dateByAddingTimeInterval:600.0];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v15 = v42;
  id v40 = [v42 allKeys];
  id v16 = [v40 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v49;
    uint64_t v38 = *(void *)v49;
    do
    {
      v19 = 0;
      id v39 = v17;
      do
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v40);
        }
        uint64_t v20 = *(void *)(*((void *)&v48 + 1) + 8 * (void)v19);
        v21 = [v15 objectForKeyedSubscript:v20];
        v22 = [v21 actionMakers];
        id v23 = [v22 count];

        if (!v23)
        {
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v24 = [v21 expirers];
          v25 = (char *)[v24 countByEnumeratingWithState:&v44 objects:v57 count:16];
          if (!v25)
          {

LABEL_28:
            id v30 = [objc_alloc((Class)ATXHeuristicCacheTimeExpirer) initWithFireDate:v37];
            id v31 = objc_alloc((Class)ATXHeuristicActionMakersAndExpirers);
            v32 = [v21 actionMakers];
            v33 = [v21 expirers];
            v34 = [v33 setByAddingObject:v30];
            id v35 = [v31 initWithActionMakers:v32 expirers:v34];

            uint64_t v18 = v38;
            [v15 setObject:v35 forKeyedSubscript:v20];

            id v17 = v39;
            goto LABEL_29;
          }
          objc_super v26 = v25;
          int v27 = 0;
          uint64_t v28 = *(void *)v45;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(void *)v45 != v28) {
                objc_enumerationMutation(v24);
              }
              objc_opt_class();
              v27 |= objc_opt_isKindOfClass();
            }
            objc_super v26 = (char *)[v24 countByEnumeratingWithState:&v44 objects:v57 count:16];
          }
          while (v26);

          long long v15 = v42;
          uint64_t v18 = v38;
          id v17 = v39;
          if ((v27 & 1) == 0) {
            goto LABEL_28;
          }
        }
LABEL_29:

        v19 = (char *)v19 + 1;
      }
      while (v19 != v17);
      id v17 = [v40 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v17);
  }

  return v15;
}

- (id)resultsForInformationHeuristics:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10000EC00;
        v16[3] = &unk_100025650;
        v16[4] = self;
        v16[5] = v10;
        [(ATXHeuristicJSEnv *)self trackCardsAndRefreshTriggersForInformationHeuristicName:v10 mutableResults:v5 performingBlock:v16];
        JSGarbageCollect([(JSContext *)self->_jsContext JSGlobalContextRef]);
        v12 = sub_100002EBC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          double v13 = ATXMemoryUsageInMBOfCurrentProcess();
          *(_DWORD *)buf = 134218242;
          double v22 = v13;
          __int16 v23 = 2112;
          uint64_t v24 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Memory usage is %f MB after running '%@'", buf, 0x16u);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)heuristicResults
{
  v2 = [(ATXHeuristicJSEnv *)self actionsAndExpirersForHeuristicsExcept:0];
  v3 = ATXActionsFromEnvResult(v2);

  return v3;
}

- (id)stringByEvaluatingJavaScript:(id)a3
{
  v3 = [(JSContext *)self->_jsContext evaluateScript:a3];
  id v4 = [v3 toString];

  return v4;
}

- (id)objectByEvaluatingJavaScript:(id)a3
{
  v3 = [(JSContext *)self->_jsContext evaluateScript:a3];
  id v4 = [v3 toObject];

  return v4;
}

- (double)doubleByEvaluatingJavaScript:(id)a3
{
  v3 = [(JSContext *)self->_jsContext evaluateScript:a3];
  [v3 toDouble];
  double v5 = v4;

  return v5;
}

- (int)intByEvaluatingJavaScript:(id)a3
{
  v3 = [(JSContext *)self->_jsContext evaluateScript:a3];
  int v4 = [v3 toInt32];

  return v4;
}

- (BOOL)BOOLByEvaluatingJavaScript:(id)a3
{
  v3 = [(JSContext *)self->_jsContext evaluateScript:a3];
  unsigned __int8 v4 = [v3 toBool];

  return v4;
}

- (void)setNow:(id)a3
{
  double v5 = (NSDate *)a3;
  if (self->_now != v5)
  {
    objc_storeStrong((id *)&self->_now, a3);
    [(ATXHeuristicDevice *)self->_device setNow:v5];
  }
}

- (void)trackActionsAndExpirersForHeuristicName:(id)a3 mutableResult:(id)a4 performingBlock:(id)a5
{
  uint64_t v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (NSString *)[v10 copy];
  currentHeuristicName = self->_currentHeuristicName;
  self->_currentHeuristicName = v11;

  double v13 = +[NSMutableArray array];
  currentActionsBuffer = self->_currentActionsBuffer;
  self->_currentActionsBuffer = v13;

  long long v15 = +[NSMutableSet set];
  currentExpirersBuffer = self->_currentExpirersBuffer;
  self->_currentExpirersBuffer = v15;

  v8[2](v8);
  long long v17 = self->_currentActionsBuffer;
  self->_currentActionsBuffer = 0;
  double v22 = v17;

  long long v18 = self->_currentExpirersBuffer;
  self->_currentExpirersBuffer = 0;
  long long v19 = v18;

  long long v20 = self->_currentHeuristicName;
  self->_currentHeuristicName = 0;

  id v21 = [objc_alloc((Class)ATXHeuristicActionMakersAndExpirers) initWithActionMakers:v22 expirers:v19];
  [v9 setObject:v21 forKeyedSubscript:v10];
}

- (void)_recordErrorForCurrentHeuristic
{
  self->_hasCurrentHeuristicFailed = 1;
}

- (void)_addAction:(id)a3 withCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = [objc_alloc((Class)ATXHeuristicActionMakerForAction) initWithAction:v6];
    }
    else {
      uint64_t v8 = v6;
    }
    id v9 = v8;
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      double v13 = sub_100002EBC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Expected nil or ATXActionCriteria", v14, 2u);
      }
    }
    else
    {
      [v9 setCriteria:v7];
      id v10 = [v9 actionTypeName];
      v11 = [@":" stringByAppendingString:v10];

      v12 = [(NSString *)self->_currentHeuristicName stringByAppendingString:v11];
      [v9 setHeuristic:v12];

      [(NSMutableArray *)self->_currentActionsBuffer addObject:v9];
    }
  }
  else
  {
    id v9 = sub_100002EBC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Expected non-null ATXAction", buf, 2u);
    }
  }
}

- (void)trackCardsAndRefreshTriggersForInformationHeuristicName:(id)a3 mutableResults:(id)a4 performingBlock:(id)a5
{
  uint64_t v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (NSString *)[v10 copy];
  currentInformationHeuristicName = self->_currentInformationHeuristicName;
  self->_currentInformationHeuristicName = v11;

  double v13 = (NSMutableArray *)objc_opt_new();
  currentInfoSuggestionsBuffer = self->_currentInfoSuggestionsBuffer;
  self->_currentInfoSuggestionsBuffer = v13;

  long long v15 = (NSMutableSet *)objc_opt_new();
  currentRefreshTriggerBuffer = self->_currentRefreshTriggerBuffer;
  self->_currentRefreshTriggerBuffer = v15;

  self->_hasCurrentHeuristicFailed = 0;
  v8[2](v8);

  id v20 = [objc_alloc((Class)ATXInformationHeuristicResult) initWithHeuristicName:v10 suggestions:self->_currentInfoSuggestionsBuffer refreshTriggers:self->_currentRefreshTriggerBuffer hasFailed:self->_hasCurrentHeuristicFailed];
  [v9 addObject:v20];

  long long v17 = self->_currentInformationHeuristicName;
  self->_currentInformationHeuristicName = 0;

  long long v18 = self->_currentInfoSuggestionsBuffer;
  self->_currentInfoSuggestionsBuffer = 0;

  long long v19 = self->_currentRefreshTriggerBuffer;
  self->_currentRefreshTriggerBuffer = 0;

  self->_hasCurrentHeuristicFailed = 0;
}

- (void)_refreshAfterTimeInterval:(double)a3
{
  if (a3 > 0.0)
  {
    id v6 = objc_alloc((Class)ATXInformationHeuristicRefreshTimeTrigger);
    id v7 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    id v8 = [v6 initWithFireDate:v7];

    [(NSMutableSet *)self->_currentRefreshTriggerBuffer addObject:v8];
  }
}

- (void)_refreshAtTimestamp:(double)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (v5 < a3)
  {
    id v6 = objc_alloc((Class)ATXInformationHeuristicRefreshTimeTrigger);
    id v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
    id v8 = [v6 initWithFireDate:v7];

    [(NSMutableSet *)self->_currentRefreshTriggerBuffer addObject:v8];
  }
}

- (void)_refreshAfterLocalNotification:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)ATXInformationHeuristicRefreshNotitifcationTrigger) initWithNotification:v4 type:0];

  [(NSMutableSet *)self->_currentRefreshTriggerBuffer addObject:v5];
}

- (void)_refreshAfterDarwinNotification:(id)a3 coalescingInterval:(double)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)ATXInformationHeuristicRefreshNotitifcationTrigger) initWithNotification:v6 type:1 coalescingInterval:a4];

  [(NSMutableSet *)self->_currentRefreshTriggerBuffer addObject:v7];
}

- (void)_refreshAfterUserWakeUp
{
  id v3 = objc_alloc((Class)ATXInformationHeuristicRefreshContextChangeTrigger);
  id v4 = +[_CDContextQueries keyPathForFirstWakeupStatus];
  id v5 = [v3 initWithCDContextualKeyPath:v4 equalToValue:&off_100028078 withMinimumDurationInPreviousState:14400.0];

  [(NSMutableSet *)self->_currentRefreshTriggerBuffer addObject:v5];
}

- (void)_refreshOnAirplaneModeToggle
{
  id v3 = objc_alloc((Class)ATXHeuristicCacheContextStoreExpirer);
  id v4 = +[_CDContextQueries keyPathForAirplaneModeStatus];
  id v5 = [v3 initWithCDContextualKeyPath:v4];

  [(NSMutableSet *)self->_currentExpirersBuffer addObject:v5];
}

- (void)_refreshWithUserFocusComputedModeStream
{
  id v3 = [objc_alloc((Class)ATXInformationHeuristicRefreshBiomeTrigger) initWithStreamType:0];
  [(NSMutableSet *)self->_currentRefreshTriggerBuffer addObject:v3];
}

- (void)_refreshWithInferredModeStream
{
  id v3 = [objc_alloc((Class)ATXInformationHeuristicRefreshBiomeTrigger) initWithStreamType:1];
  [(NSMutableSet *)self->_currentRefreshTriggerBuffer addObject:v3];
}

- (id)_functionNameForMGQuery:(int)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return *(&off_100025B08 + a3);
  }
}

- (BOOL)_BOOLForMGQuery:(int)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return _MGGetBoolAnswer(*(&off_100025B38 + a3), a2);
  }
}

- (BOOL)_mgQueryCaller:(int)a3
{
  if (a3 > 5) {
    return 0;
  }
  mgQueryResults = self->_mgQueryResults;
  int v4 = self->_mgQueryResults[a3];
  if (v4 != 255) {
    return v4 != 0;
  }
  uint64_t v5 = a3;
  BOOL result = -[ATXHeuristicJSEnv _BOOLForMGQuery:](self, "_BOOLForMGQuery:");
  mgQueryResults[v5] = result;
  return result;
}

- (void)_expireCacheAfterTime:(double)a3
{
  if (a3 > 0.0)
  {
    id v6 = objc_alloc((Class)ATXHeuristicCacheTimeExpirer);
    id v7 = [(ATXHeuristicJSEnv *)self now];
    id v8 = [v7 dateByAddingTimeInterval:a3];
    id v9 = [v6 initWithFireDate:v8];

    [(NSMutableSet *)self->_currentExpirersBuffer addObject:v9];
  }
}

- (void)_expireCacheAtTime:(double)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (v5 < a3)
  {
    id v6 = objc_alloc((Class)ATXHeuristicCacheTimeExpirer);
    id v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
    id v8 = [v6 initWithFireDate:v7];

    [(NSMutableSet *)self->_currentExpirersBuffer addObject:v8];
  }
}

- (void)_expireCacheAfterDarwinNotification:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)ATXHeuristicCacheNotificationExpirer) initDarwin:v4];

  [(NSMutableSet *)self->_currentExpirersBuffer addObject:v5];
}

- (void)_expireCacheAfterLocalNotification:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)ATXHeuristicCacheNotificationExpirer) initLocal:v4];

  [(NSMutableSet *)self->_currentExpirersBuffer addObject:v5];
}

- (id)_localizedFormatStringForKey:(id)a3
{
  return [(NSBundle *)self->_heuristicsBundle localizedStringForKey:a3 value:0 table:0];
}

- (id)_dateFromTimeIntervalOrDate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_5;
  }
  id v6 = +[NSAssertionHandler currentHandler];
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ATXHeuristicJSEnv _dateFromTimeIntervalOrDate:]");
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v6 handleFailureInFunction:v7, @"ATXHeuristicJSEnv.m", 1216, @"Expected timestamp or date, got %@", v9 file lineNumber description];

  id v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)_isEventAtOneWithTimeIntervelOrDate:(id)a3 usesTwelveHourClock:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(ATXHeuristicJSEnv *)self _dateFromTimeIntervalOrDate:a3];
  if (v5)
  {
    id v6 = +[NSCalendar currentCalendar];
    id v7 = [v6 components:32 fromDate:v5];

    id v8 = [v7 hour];
    BOOL v10 = v8 == (id)13 || v8 == (id)1;
    if (v4) {
      BOOL v11 = v10;
    }
    else {
      BOOL v11 = v8 == (id)1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_registerDataSources
{
  objc_initWeak(location, self);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_10001096C;
  v73[3] = &unk_100024F60;
  objc_copyWeak(&v74, location);
  id v3 = objc_retainBlock(v73);
  [(JSContext *)self->_jsContext setObject:v3 forKeyedSubscript:@"getClipboard"];

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1000109B8;
  v71[3] = &unk_100025678;
  objc_copyWeak(&v72, location);
  BOOL v4 = objc_retainBlock(v71);
  [(JSContext *)self->_jsContext setObject:v4 forKeyedSubscript:@"isFocusModeActive"];

  [(JSContext *)self->_jsContext setObject:&stru_1000256B8 forKeyedSubscript:@"getMemoryUse"];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000109F4;
  v69[3] = &unk_100024EE8;
  objc_copyWeak(&v70, location);
  id v5 = objc_retainBlock(v69);
  [(JSContext *)self->_jsContext setObject:v5 forKeyedSubscript:@"getVisibleCalendars"];

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100010A40;
  v67[3] = &unk_100024F38;
  objc_copyWeak(&v68, location);
  id v6 = objc_retainBlock(v67);
  [(JSContext *)self->_jsContext setObject:v6 forKeyedSubscript:@"getCalendarEvents"];

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100010ADC;
  v65[3] = &unk_1000256E0;
  objc_copyWeak(&v66, location);
  id v7 = objc_retainBlock(v65);
  [(JSContext *)self->_jsContext setObject:v7 forKeyedSubscript:@"getEventPasses"];

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100010B58;
  v63[3] = &unk_100025708;
  objc_copyWeak(&v64, location);
  id v8 = objc_retainBlock(v63);
  [(JSContext *)self->_jsContext setObject:v8 forKeyedSubscript:@"getEventTravelTime"];

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100010C44;
  v61[3] = &unk_100024EE8;
  objc_copyWeak(&v62, location);
  id v9 = objc_retainBlock(v61);
  [(JSContext *)self->_jsContext setObject:v9 forKeyedSubscript:@"getVIPs"];

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100010C90;
  v59[3] = &unk_1000256E0;
  objc_copyWeak(&v60, location);
  BOOL v10 = objc_retainBlock(v59);
  [(JSContext *)self->_jsContext setObject:v10 forKeyedSubscript:@"getExtraordinaryEvents"];

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100010D10;
  v57[3] = &unk_100024F38;
  objc_copyWeak(&v58, location);
  BOOL v11 = objc_retainBlock(v57);
  [(JSContext *)self->_jsContext setObject:v11 forKeyedSubscript:@"getHolidayEvents"];

  [(JSContext *)self->_jsContext setObject:&stru_100025748 forKeyedSubscript:@"getDistanceBetween"];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100010F78;
  v55[3] = &unk_100025770;
  objc_copyWeak(&v56, location);
  v12 = objc_retainBlock(v55);
  [(JSContext *)self->_jsContext setObject:v12 forKeyedSubscript:@"getBestContactHandle"];

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10001100C;
  v53[3] = &unk_100025798;
  objc_copyWeak(&v54, location);
  double v13 = objc_retainBlock(v53);
  [(JSContext *)self->_jsContext setObject:v13 forKeyedSubscript:@"allHandlesForContact"];

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100011074;
  v51[3] = &unk_1000257C0;
  objc_copyWeak(&v52, location);
  id v14 = objc_retainBlock(v51);
  [(JSContext *)self->_jsContext setObject:v14 forKeyedSubscript:@"getFavoriteContacts"];

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000110DC;
  v49[3] = &unk_100024EE8;
  objc_copyWeak(&v50, location);
  long long v15 = objc_retainBlock(v49);
  [(JSContext *)self->_jsContext setObject:v15 forKeyedSubscript:@"getBirthdayEvents"];

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100011128;
  v47[3] = &unk_1000257E8;
  objc_copyWeak(&v48, location);
  id v16 = objc_retainBlock(v47);
  [(JSContext *)self->_jsContext setObject:v16 forKeyedSubscript:@"getCallHistory"];

  [(JSContext *)self->_jsContext setObject:&stru_100025828 forKeyedSubscript:@"makeRequestRideActionForEvent"];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10001134C;
  v45[3] = &unk_100025850;
  objc_copyWeak(&v46, location);
  long long v17 = objc_retainBlock(v45);
  [(JSContext *)self->_jsContext setObject:v17 forKeyedSubscript:@"getUserAppPreference"];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000113E0;
  v43[3] = &unk_100025878;
  objc_copyWeak(&v44, location);
  long long v18 = objc_retainBlock(v43);
  [(JSContext *)self->_jsContext setObject:v18 forKeyedSubscript:@"getDuetInteractionCount"];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100011488;
  v41[3] = &unk_1000257C0;
  objc_copyWeak(&v42, location);
  long long v19 = objc_retainBlock(v41);
  [(JSContext *)self->_jsContext setObject:v19 forKeyedSubscript:@"getPeopleSuggestions"];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000114D4;
  v39[3] = &unk_1000258A0;
  objc_copyWeak(&v40, location);
  id v20 = objc_retainBlock(v39);
  [(JSContext *)self->_jsContext setObject:v20 forKeyedSubscript:@"getBestTimeToInteractWithContact"];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100011664;
  v37[3] = &unk_100025018;
  objc_copyWeak(&v38, location);
  id v21 = objc_retainBlock(v37);
  [(JSContext *)self->_jsContext setObject:v21 forKeyedSubscript:@"getTimeIntervalSinceUserWakeup"];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000116B0;
  v35[3] = &unk_1000258C8;
  objc_copyWeak(&v36, location);
  double v22 = objc_retainBlock(v35);
  [(JSContext *)self->_jsContext setObject:v22 forKeyedSubscript:@"fetchWidgetMetadataForAppBundleIds"];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100011718;
  v33[3] = &unk_1000258F0;
  objc_copyWeak(&v34, location);
  __int16 v23 = objc_retainBlock(v33);
  [(JSContext *)self->_jsContext setObject:v23 forKeyedSubscript:@"getLocationForMostRelevantTripInRange"];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000117B4;
  v31[3] = &unk_100024F60;
  objc_copyWeak(&v32, location);
  uint64_t v24 = objc_retainBlock(v31);
  [(JSContext *)self->_jsContext setObject:v24 forKeyedSubscript:@"getModeCorrelatedAppsInCurrentMode"];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100011800;
  v29[3] = &unk_100025018;
  objc_copyWeak(&v30, location);
  v25 = objc_retainBlock(v29);
  [(JSContext *)self->_jsContext setObject:v25 forKeyedSubscript:@"getPredictedBedTime"];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001184C;
  v27[3] = &unk_100025018;
  objc_copyWeak(&v28, location);
  objc_super v26 = objc_retainBlock(v27);
  [(JSContext *)self->_jsContext setObject:v26 forKeyedSubscript:@"getScheduledBedTime"];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&v70);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v74);
  objc_destroyWeak(location);
}

- (id)_duetInteractionCountFromDataSourceWithHandles:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    __int16 v23 = sub_10000AAB8;
    uint64_t v24 = sub_10000AAC8;
    id v25 = 0;
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = sub_10000AAB8;
    long long v18 = sub_10000AAC8;
    id v19 = 0;
    provider = self->_provider;
    id v9 = +[NSSet setWithArray:v6];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100011AE4;
    v13[3] = &unk_100025918;
    v13[4] = &v20;
    v13[5] = &v14;
    [(ATXHeuristicDataSources *)provider duetInteractionCountForHandles:v9 sinceDate:v7 callback:v13];

    if (v15[5])
    {
      BOOL v10 = sub_100002EBC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sel_getName("duetInteractionCountForHandles:sinceDate:callback:");
        sub_100018094();
      }

      id v11 = 0;
    }
    else
    {
      id v11 = (id)v21[5];
    }
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_userAppPreferenceFromDataSourceWithIntentName:(id)a3 parameterCombination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10000AAB8;
  __int16 v23 = sub_10000AAC8;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10000AAB8;
  long long v17 = sub_10000AAC8;
  id v18 = 0;
  provider = self->_provider;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011D7C;
  v12[3] = &unk_100025940;
  v12[4] = &v19;
  v12[5] = &v13;
  [(ATXHeuristicDataSources *)provider preferredAppForIntentName:v6 andParameterCombination:v7 callback:v12];
  if (v14[5])
  {
    id v9 = sub_100002EBC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sel_getName("preferredAppForIntentName:andParameterCombination:callback:");
      sub_100018094();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = (id)v20[5];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

- (id)_travelTimeForEventWithID:(id)a3 latitude:(double)a4 longitude:(double)a5 expectedArrivalDate:(id)a6 transportType:(id)a7 localOnlyAfterFirstUpdate:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = [objc_alloc((Class)CLLocation) initWithLatitude:a4 longitude:a5];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_10000AAB8;
  v33 = sub_10000AAC8;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  objc_super v26 = sub_10000AAB8;
  int v27 = sub_10000AAC8;
  id v28 = 0;
  provider = self->_provider;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100012074;
  v22[3] = &unk_100025968;
  v22[4] = &v29;
  v22[5] = &v23;
  [(ATXHeuristicDataSources *)provider travelTimeInfoForEventID:v14 location:v17 expectedArrivalDate:v15 transportType:v16 localOnlyAfterFirstUpdate:v8 callback:v22];
  if (v24[5])
  {
    uint64_t v19 = sub_100002EBC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      sel_getName("travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:callback:");
      sub_100018094();
    }

    id v20 = 0;
  }
  else
  {
    id v20 = (id)v30[5];
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v20;
}

- (id)_nlEventsFromDataSource
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000AAB8;
  id v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000AAB8;
  id v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000122DC;
  v6[3] = &unk_100025990;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider nlEventsWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("nlEventsWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_contactsDataSourceWithType:(id)a3 value:(id)a4 identifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v13 = 0;
    goto LABEL_29;
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  objc_super v26 = sub_10000AAB8;
  int v27 = sub_10000AAC8;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10000AAB8;
  uint64_t v21 = sub_10000AAC8;
  id v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100012770;
  v16[3] = &unk_100025990;
  v16[4] = &v23;
  v16[5] = &v17;
  id v11 = objc_retainBlock(v16);
  if ([v8 isEqualToString:@"identifiers"])
  {
    [(ATXHeuristicDataSources *)self->_provider contactsWithIdentifiers:v10 callback:v11];
    if (v18[5])
    {
      id v12 = sub_100002EBC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sel_getName("contactsWithIdentifiers:callback:");
        sub_100018094();
      }
LABEL_22:

LABEL_27:
      id v13 = 0;
      goto LABEL_28;
    }
  }
  else if ([v8 isEqualToString:@"name"])
  {
    [(ATXHeuristicDataSources *)self->_provider contactsWithName:v9 callback:v11];
    if (v18[5])
    {
      id v12 = sub_100002EBC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sel_getName("contactsWithName:callback:");
        sub_100018094();
      }
      goto LABEL_22;
    }
  }
  else if ([v8 isEqualToString:@"email"])
  {
    [(ATXHeuristicDataSources *)self->_provider contactsWithEmail:v9 callback:v11];
    if (v18[5])
    {
      id v12 = sub_100002EBC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sel_getName("contactsWithEmail:callback:");
        sub_100018094();
      }
      goto LABEL_22;
    }
  }
  else
  {
    if (![v8 isEqualToString:@"phone"])
    {
      id v14 = sub_100002EBC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unknown fetch type: '%@'", buf, 0xCu);
      }

      goto LABEL_27;
    }
    [(ATXHeuristicDataSources *)self->_provider contactsWithPhone:v9 callback:v11];
    if (v18[5])
    {
      id v12 = sub_100002EBC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sel_getName("contactsWithPhone:callback:");
        sub_100018094();
      }
      goto LABEL_22;
    }
  }
  id v13 = (id)v24[5];
LABEL_28:

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

LABEL_29:

  return v13;
}

- (id)_currentLocationFromDataSource
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000AAB8;
  id v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000129D8;
  v6[3] = &unk_100025968;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider obtainOneTimeLocationWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("obtainOneTimeLocationWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_unreadMessagesWithLimit:(int64_t)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10000AAB8;
  id v18 = sub_10000AAC8;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10000AAB8;
  id v12 = sub_10000AAC8;
  id v13 = 0;
  provider = self->_provider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012C40;
  v7[3] = &unk_100025990;
  v7[4] = &v14;
  v7[5] = &v8;
  [(ATXHeuristicDataSources *)provider unreadMessagesWithLimit:a3 callback:v7];
  if (v9[5])
  {
    id v4 = sub_100002EBC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sel_getName("unreadMessagesWithLimit:callback:");
      sub_100018094();
    }

    id v5 = 0;
  }
  else
  {
    id v5 = (id)v15[5];
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

- (id)_peopleSuggestionsFromDataSource
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10000AAB8;
  id v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012EA8;
  v6[3] = &unk_100025990;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider peopleSuggestionsWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("peopleSuggestionsWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_enabledAlarmsFromTS:(double)a3 toTS:(double)a4
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10000AAB8;
  id v22 = sub_10000AAC8;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10000AAB8;
  uint64_t v16 = sub_10000AAC8;
  id v17 = 0;
  provider = self->_provider;
  id v6 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a3];
  id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013170;
  v11[3] = &unk_100025990;
  v11[4] = &v18;
  v11[5] = &v12;
  [(ATXHeuristicDataSources *)provider alarmsFromDate:v6 toDate:v7 completionHandler:v11];

  if (v13[5])
  {
    uint64_t v8 = sub_100002EBC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sel_getName("alarmsFromDate:toDate:completionHandler:");
      sub_100018094();
    }

    id v9 = 0;
  }
  else
  {
    id v9 = (id)v19[5];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v9;
}

- (id)_cityNameFromAirportCode:(id)a3
{
  id v3 = +[ATXHeuristicAirportCity cityForAirport:a3];
  id v4 = [v3 name];

  return v4;
}

- (id)_latestFlightStatus:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10000AAB8;
  uint64_t v20 = sub_10000AAC8;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_10000AAB8;
  uint64_t v14 = sub_10000AAC8;
  id v15 = 0;
  provider = self->_provider;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013448;
  v9[3] = &unk_100025968;
  v9[4] = &v16;
  v9[5] = &v10;
  [(ATXHeuristicDataSources *)provider flightStatusForFlight:v4 callback:v9];
  if (v11[5])
  {
    id v6 = sub_100002EBC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sel_getName("flightStatusForFlight:callback:");
      sub_100018094();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = (id)v17[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (id)_usualAlarmTimeOfDayDataSource
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10000AAB8;
  id v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10000AAB8;
  id v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000136B0;
  v6[3] = &unk_100025918;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider alarmTimeOfDay:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("alarmTimeOfDay:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_clipboardContentsFromDataSource
{
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10000AAB8;
  uint64_t v31 = sub_10000AAC8;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10000AAB8;
  uint64_t v25 = sub_10000AAC8;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10000AAB8;
  id v19 = sub_10000AAC8;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10000AAB8;
  uint64_t v13 = sub_10000AAC8;
  id v14 = 0;
  provider = self->_provider;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013A54;
  v8[3] = &unk_1000259B8;
  v8[4] = &v27;
  v8[5] = &v15;
  v8[6] = &v21;
  v8[7] = &v9;
  [(ATXHeuristicDataSources *)provider contentsWithCallback:v8];
  if (v10[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("contentsWithCallback:");
      sub_100018094();
    }
    id v4 = 0;
    goto LABEL_5;
  }
  if (v28[5])
  {
    id v5 = (void *)v16[5];
    if (v5)
    {
      if (v22[5])
      {
        v34[0] = v28[5];
        v33[0] = @"content";
        v33[1] = @"creationTimestamp";
        [v5 timeIntervalSinceReferenceDate];
        id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v33[2] = @"originatorBundleID";
        uint64_t v6 = v22[5];
        v34[1] = v3;
        v34[2] = v6;
        id v4 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
LABEL_5:

        goto LABEL_11;
      }
    }
  }
  id v4 = 0;
LABEL_11:
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v4;
}

- (BOOL)_isFocusModeActiveFromDataSource
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10000AAB8;
  uint64_t v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013CE8;
  v6[3] = &unk_1000259E0;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider isFocusModeActive:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("isFocusModeActive:");
      sub_100018094();
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = *((unsigned char *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (id)_visibleCalendarsFromDataSource
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10000AAB8;
  uint64_t v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013EE8;
  v6[3] = &unk_100025990;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider visibleCalendarsWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("visibleCalendarsWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_calendarEventsFromDataSourceBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10000AAB8;
  uint64_t v23 = sub_10000AAC8;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  provider = self->_provider;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100014180;
  v12[3] = &unk_100025990;
  v12[4] = &v19;
  v12[5] = &v13;
  [(ATXHeuristicDataSources *)provider calendarEventsFromStartDate:v6 toEndDate:v7 callback:v12];
  if (v14[5])
  {
    uint64_t v9 = sub_100002EBC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sel_getName("calendarEventsFromStartDate:toEndDate:callback:");
      sub_100018094();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = (id)v20[5];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

- (id)_eventPassesFromDataSourceWithStyle:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || ([v4 isEqualToString:@"ticket"] & 1) != 0
    || ([v5 isEqualToString:@"boardingPass"] & 1) != 0)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = sub_10000AAB8;
    id v22 = sub_10000AAC8;
    id v23 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_10000AAB8;
    char v16 = sub_10000AAC8;
    id v17 = 0;
    provider = self->_provider;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100014464;
    v11[3] = &unk_100025990;
    v11[4] = &v18;
    v11[5] = &v12;
    [(ATXHeuristicDataSources *)provider passesWithStyle:v5 callback:v11];
    if (v13[5])
    {
      id v7 = sub_100002EBC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        sel_getName("passesWithStyle:callback:");
        sub_100018094();
      }

      id v8 = 0;
    }
    else
    {
      id v8 = (id)v19[5];
    }
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v10 = sub_100002EBC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000180CC((uint64_t)v5, v10);
    }

    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)_bestAppSuggestionFromDataSource
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_10000AAB8;
  id v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000AAB8;
  uint64_t v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000146CC;
  v6[3] = &unk_100025A08;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider bestAppSuggestionWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("bestAppSuggestionWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_vipsFromDataSource
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_10000AAB8;
  id v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000AAB8;
  uint64_t v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014934;
  v6[3] = &unk_100025990;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider vipsWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("vipsWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_extraordinaryEventsFromDataSourceWithProminentFeature:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [&off_100028188 objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10000AAB8;
  uint64_t v21 = sub_10000AAC8;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10000AAB8;
  uint64_t v15 = sub_10000AAC8;
  id v16 = 0;
  provider = self->_provider;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014BE0;
  v10[3] = &unk_100025990;
  v10[4] = &v17;
  v10[5] = &v11;
  [(ATXHeuristicDataSources *)provider getEventsWithProminentFeature:v5 callback:v10];
  if (v12[5])
  {
    uint64_t v7 = sub_100002EBC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sel_getName("getEventsWithProminentFeature:callback:");
      sub_100018094();
    }

    id v8 = 0;
  }
  else
  {
    id v8 = (id)v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

- (id)_batteryInformationFromDataSource
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000AAB8;
  uint64_t v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014E48;
  v6[3] = &unk_100025990;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider batteryInformationWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("batteryInformationWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_favoriteContactsFromDataSourceWithExistingContacts:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10000AAB8;
  uint64_t v20 = sub_10000AAC8;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_10000AAB8;
  uint64_t v14 = sub_10000AAC8;
  id v15 = 0;
  provider = self->_provider;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000150CC;
  v9[3] = &unk_100025990;
  v9[4] = &v16;
  v9[5] = &v10;
  [(ATXHeuristicDataSources *)provider favoritesWithContacts:v4 callback:v9];
  if (v11[5])
  {
    id v6 = sub_100002EBC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sel_getName("favoritesWithContacts:callback:");
      sub_100018094();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = (id)v17[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (id)_allHandlesFromDataSourceWithContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = sub_10000AAB8;
    id v21 = sub_10000AAC8;
    id v22 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = sub_10000AAB8;
    id v15 = sub_10000AAC8;
    id v16 = 0;
    provider = self->_provider;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100015380;
    v10[3] = &unk_100025990;
    v10[4] = &v17;
    v10[5] = &v11;
    [(ATXHeuristicDataSources *)provider allHandlesForContact:v4 callback:v10];
    if (v12[5])
    {
      id v6 = sub_100002EBC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        sel_getName("allHandlesForContact:callback:");
        sub_100018094();
      }

      id v7 = 0;
    }
    else
    {
      id v7 = (id)v18[5];
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v8 = sub_100002EBC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100018144();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_bestContactHandleFromDataSourceWithContact:(id)a3 serviceString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v19 = @"imessage";
  uint64_t v20 = (const __CFString **)@"facetime";
  uint64_t v25 = IDSServiceNameiMessage;
  id v26 = (uint64_t *)IDSServiceNameFaceTime;
  uint64_t v21 = @"calling";
  uint64_t v27 = IDSServiceNameCalling;
  id v8 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v19 count:3];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = sub_100002EBC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000181AC((uint64_t)v7, v12);
    }
  }
  if (v6 && v10)
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = sub_10000AAB8;
    uint64_t v29 = sub_10000AAC8;
    id v30 = 0;
    CFStringRef v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = sub_10000AAB8;
    id v23 = sub_10000AAC8;
    id v24 = 0;
    provider = self->_provider;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100015718;
    v18[3] = &unk_100025940;
    v18[4] = &v25;
    v18[5] = &v19;
    [(ATXHeuristicDataSources *)provider bestHandleForContact:v6 service:v10 callback:v18];
    if (v20[5])
    {
      uint64_t v14 = sub_100002EBC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        sel_getName("bestHandleForContact:service:callback:");
        sub_100018094();
      }

      id v15 = 0;
    }
    else
    {
      id v15 = (id)v26[5];
    }
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v16 = sub_100002EBC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100018178();
    }

    id v15 = 0;
  }

  return v15;
}

- (id)_holidayEventsFromDataSourceBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10000AAB8;
  id v23 = sub_10000AAC8;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  provider = self->_provider;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000159B0;
  v12[3] = &unk_100025990;
  v12[4] = &v19;
  v12[5] = &v13;
  [(ATXHeuristicDataSources *)provider holidaysFromStartDate:v6 toEndDate:v7 callback:v12];
  if (v14[5])
  {
    uint64_t v9 = sub_100002EBC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sel_getName("holidaysFromStartDate:toEndDate:callback:");
      sub_100018094();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = (id)v20[5];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

- (id)_birthdayEventsFromDataSource
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000AAB8;
  id v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015C18;
  v6[3] = &unk_100025990;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider birthdaysWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("birthdaysWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_callHistoryFromDataSourceWithMaxAge:(double)a3 showIncomingCalls:(BOOL)a4 showOutgoingCalls:(BOOL)a5 showMissedCallsOnly:(BOOL)a6
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10000AAB8;
  uint64_t v21 = sub_10000AAC8;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10000AAB8;
  uint64_t v15 = sub_10000AAC8;
  id v16 = 0;
  provider = self->_provider;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015E80;
  v10[3] = &unk_100025990;
  v10[4] = &v17;
  v10[5] = &v11;
  [(ATXHeuristicDataSources *)provider callNewerThan:a4 showIncoming:a5 showOutgoing:a6 missedOnly:v10 callback:a3];
  if (v12[5])
  {
    uint64_t v7 = sub_100002EBC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sel_getName("callNewerThan:showIncoming:showOutgoing:missedOnly:callback:");
      sub_100018094();
    }

    id v8 = 0;
  }
  else
  {
    id v8 = (id)v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

- (id)_bestTimeToInteractFromDataSourceWithContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = sub_10000AAB8;
    uint64_t v21 = sub_10000AAC8;
    id v22 = 0;
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = sub_10000AAB8;
    uint64_t v15 = sub_10000AAC8;
    id v16 = 0;
    provider = self->_provider;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100016134;
    v10[3] = &unk_100025968;
    v10[4] = &v17;
    v10[5] = &v11;
    [(ATXHeuristicDataSources *)provider hourOfDayInteractionProbabilitiesWithContact:v4 callback:v10];
    if (v12[5])
    {
      id v6 = sub_100002EBC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        sel_getName("hourOfDayInteractionProbabilitiesWithContact:callback:");
        sub_100018094();
      }

      id v7 = 0;
    }
    else
    {
      id v7 = (id)v18[5];
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v8 = sub_100002EBC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100018224();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_timeIntervalSinceUserWakeup
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000AAB8;
  uint64_t v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001639C;
  v6[3] = &unk_100025918;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider timeIntervalSinceUserWakeupWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("timeIntervalSinceUserWakeupWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_fetchWidgetMetadataForAppBundleIds:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10000AAB8;
  uint64_t v20 = sub_10000AAC8;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_10000AAB8;
  uint64_t v14 = sub_10000AAC8;
  id v15 = 0;
  provider = self->_provider;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016620;
  v9[3] = &unk_100025968;
  v9[4] = &v16;
  v9[5] = &v10;
  [(ATXHeuristicDataSources *)provider fetchWidgetMetadataForAppBundleIds:v4 callback:v9];
  if (v11[5])
  {
    id v6 = sub_100002EBC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sel_getName("fetchWidgetMetadataForAppBundleIds:callback:");
      sub_100018094();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = (id)v17[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (id)_getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10000AAB8;
  id v23 = sub_10000AAC8;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  provider = self->_provider;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000168B8;
  v12[3] = &unk_100025968;
  v12[4] = &v19;
  v12[5] = &v13;
  [(ATXHeuristicDataSources *)provider getLocationForMostRelevantTripInRangeFrom:v6 to:v7 callback:v12];
  if (v14[5])
  {
    uint64_t v9 = sub_100002EBC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sel_getName("getLocationForMostRelevantTripInRangeFrom:to:callback:");
      sub_100018094();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = (id)v20[5];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

- (id)_modeCorrelatedAppsInCurrentMode
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10000AAB8;
  uint64_t v17 = sub_10000AAC8;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000AAB8;
  uint64_t v11 = sub_10000AAC8;
  id v12 = 0;
  provider = self->_provider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016B20;
  v6[3] = &unk_100025A30;
  v6[4] = &v13;
  v6[5] = &v7;
  [(ATXHeuristicDataSources *)provider modeCorrelatedAppsInCurrentModeWithCallback:v6];
  if (v8[5])
  {
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sel_getName("modeCorrelatedAppsInCurrentModeWithCallback:");
      sub_100018094();
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (id)v14[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (id)_scheduledBedTime
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10000AAB8;
  id v18 = sub_10000AAC8;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_10000AAB8;
  id v12 = sub_10000AAC8;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016E6C;
  v7[3] = &unk_100025918;
  v7[4] = &v14;
  v7[5] = &v8;
  id v3 = objc_retainBlock(v7);
  [(ATXHeuristicDataSources *)self->_provider scheduledBedTimeWithCallback:v3];
  if (v9[5])
  {
    id v4 = sub_100002EBC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sel_getName("scheduledBedTimeWithCallback:");
      sub_100018094();
    }

    id v5 = 0;
  }
  else
  {
    id v5 = (id)v15[5];
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

- (id)_predictedBedTime
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10000AAB8;
  id v18 = sub_10000AAC8;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_10000AAB8;
  id v12 = sub_10000AAC8;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000170F0;
  v7[3] = &unk_100025918;
  v7[4] = &v14;
  v7[5] = &v8;
  id v3 = objc_retainBlock(v7);
  [(ATXHeuristicDataSources *)self->_provider predictedBedTimeWithCallback:v3];
  if (v9[5])
  {
    id v4 = sub_100002EBC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sel_getName("predictedBedTimeWithCallback:");
      sub_100018094();
    }

    id v5 = 0;
  }
  else
  {
    id v5 = (id)v15[5];
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

- (void)mockClipboardContent:(id)a3 createdAt:(id)a4
{
}

- (void)mockClipboardContent:(id)a3 createdAt:(id)a4 fromBundleId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000172D4;
  v15[3] = &unk_100025A58;
  objc_copyWeak(&v19, &location);
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  uint64_t v14 = objc_retainBlock(v15);
  [(JSContext *)self->_jsContext setObject:v14 forKeyedSubscript:@"getClipboard"];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)mockMidnightAndGetHolidayEventsToday:(double)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000174C8;
  v5[3] = &unk_100025A78;
  *(double *)&v5[4] = a3;
  id v4 = objc_retainBlock(v5);
  [(JSContext *)self->_jsContext setObject:v4 forKeyedSubscript:@"getHolidayEvents"];
}

- (void)mockMidnightAndGetHolidayEventsTomorrow:(double)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001763C;
  v5[3] = &unk_100025A78;
  *(double *)&v5[4] = a3;
  id v4 = objc_retainBlock(v5);
  [(JSContext *)self->_jsContext setObject:v4 forKeyedSubscript:@"getHolidayEvents"];
}

- (void)mockDataSource:(id)a3 returning:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000177E8;
  v9[3] = &unk_100025AA0;
  id v10 = a4;
  id v6 = v10;
  id v7 = a3;
  id v8 = objc_retainBlock(v9);
  [(ATXHeuristicJSEnv *)self mockDataSource:v7 block:v8];
}

- (void)mockDataSource:(id)a3 block:(id)a4
{
}

- (void)mockEventTravelTimeWithDuration:(double)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017898;
  v5[3] = &unk_100025AC0;
  *(double *)&v5[4] = a3;
  id v4 = objc_retainBlock(v5);
  [(JSContext *)self->_jsContext setObject:v4 forKeyedSubscript:@"getEventTravelTime"];
}

- (void)mockUsesTwelveHourClock:(BOOL)a3
{
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017A5C;
  v6[3] = &unk_100025AE8;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  id v5 = objc_retainBlock(v6);
  [(JSContext *)self->_jsContext setObject:v5 forKeyedSubscript:@"isEventAtOne"];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (NSDate)now
{
  return self->_now;
}

- (ATXHeuristicDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_currentInformationHeuristicName, 0);
  objc_storeStrong((id *)&self->_currentRefreshTriggerBuffer, 0);
  objc_storeStrong((id *)&self->_currentInfoSuggestionsBuffer, 0);
  objc_storeStrong((id *)&self->_currentHeuristicName, 0);
  objc_storeStrong((id *)&self->_currentExpirersBuffer, 0);
  objc_storeStrong((id *)&self->_currentActionsBuffer, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_virtualMachine, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_dataSourcesServer, 0);

  objc_storeStrong((id *)&self->_heuristicsBundle, 0);
}

@end