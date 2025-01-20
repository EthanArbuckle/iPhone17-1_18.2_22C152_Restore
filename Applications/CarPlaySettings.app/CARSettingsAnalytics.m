@interface CARSettingsAnalytics
+ (BOOL)shouldSendAnalyticsEvents;
+ (id)sharedInstance;
- (id)_analyticsEventNameForEvent:(unint64_t)a3;
- (id)_dictionaryRepresentationWithVehicle:(id)a3 session:(id)a4;
- (void)axBoldTextPrefChangedForVehicle:(id)a3 session:(id)a4;
- (void)axColorFiltersPrefChangedForVehicle:(id)a3 session:(id)a4;
- (void)axSoundRecognitionChangedForVehicle:(id)a3 session:(id)a4;
- (void)axVoiceControlPrefChanged:(BOOL)a3 forVehicle:(id)a4 session:(id)a5;
- (void)sendEvent:(unint64_t)a3 withParameters:(id)a4;
@end

@implementation CARSettingsAnalytics

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C0A8;
  block[3] = &unk_100092550;
  block[4] = a1;
  if (qword_1000B0888 != -1) {
    dispatch_once(&qword_1000B0888, block);
  }
  v2 = (void *)qword_1000B0880;

  return v2;
}

+ (BOOL)shouldSendAnalyticsEvents
{
  Class v2 = NSClassFromString(@"XCTestCase");
  if (v2)
  {
    v3 = sub_100021030();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] Not recording events due to testing context.", v5, 2u);
    }
  }
  return v2 == 0;
}

- (void)axVoiceControlPrefChanged:(BOOL)a3 forVehicle:(id)a4 session:(id)a5
{
  BOOL v5 = a3;
  v7 = [(CARSettingsAnalytics *)self _dictionaryRepresentationWithVehicle:a4 session:a5];
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  v8 = +[NSNumber numberWithBool:v5];
  [v9 setObject:v8 forKeyedSubscript:@"voiceControl"];

  [(CARSettingsAnalytics *)self sendEvent:0 withParameters:v9];
}

- (void)axBoldTextPrefChangedForVehicle:(id)a3 session:(id)a4
{
  id v6 = a3;
  v7 = [(CARSettingsAnalytics *)self _dictionaryRepresentationWithVehicle:v6 session:a4];
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  id v8 = [v6 boldTextPreference];
  id v9 = +[NSNumber numberWithBool:v8 == (id)1];
  [v10 setObject:v9 forKeyedSubscript:@"boldText"];

  [(CARSettingsAnalytics *)self sendEvent:0 withParameters:v10];
}

- (void)axColorFiltersPrefChangedForVehicle:(id)a3 session:(id)a4
{
  id v6 = a3;
  v7 = [(CARSettingsAnalytics *)self _dictionaryRepresentationWithVehicle:v6 session:a4];
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  id v8 = [v6 _axColorFiltersAnalyticsString];

  [v9 setObject:v8 forKeyedSubscript:@"colorFilters"];
  [(CARSettingsAnalytics *)self sendEvent:0 withParameters:v9];
}

- (void)axSoundRecognitionChangedForVehicle:(id)a3 session:(id)a4
{
  id v6 = a3;
  v7 = [(CARSettingsAnalytics *)self _dictionaryRepresentationWithVehicle:v6 session:a4];
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  id v8 = [v6 _axSoundRecognitionAnalyticsString];

  [v9 setObject:v8 forKeyedSubscript:@"soundRecognition"];
  [(CARSettingsAnalytics *)self sendEvent:0 withParameters:v9];
}

- (void)sendEvent:(unint64_t)a3 withParameters:(id)a4
{
  id v6 = a4;
  if ([(id)objc_opt_class() shouldSendAnalyticsEvents])
  {
    v7 = [(CARSettingsAnalytics *)self _analyticsEventNameForEvent:a3];
    if (v7)
    {
      id v8 = sub_100021030();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        id v10 = v7;
        __int16 v11 = 2112;
        id v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Settings] Sending CA event %@ with %@", (uint8_t *)&v9, 0x16u);
      }

      AnalyticsSendEvent();
    }
  }
}

- (id)_analyticsEventNameForEvent:(unint64_t)a3
{
  if (a3)
  {
    v4 = sub_100021030();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006563C(a3, v4);
    }

    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = +[NSString stringWithFormat:@"com.apple.carexperience.%@", @"ax-pref-changed"];
  }

  return v5;
}

- (id)_dictionaryRepresentationWithVehicle:(id)a3 session:(id)a4
{
  id v4 = a4;
  BOOL v5 = [v4 configuration];
  id v6 = +[NSMutableDictionary dictionary];
  uint64_t v7 = [v5 PPID];
  id v8 = (void *)v7;
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  else {
    CFStringRef v9 = @"(no value)";
  }
  [v6 setObject:v9 forKeyedSubscript:@"ppid"];

  uint64_t v10 = [v5 name];
  __int16 v11 = (void *)v10;
  if (v10) {
    CFStringRef v12 = (const __CFString *)v10;
  }
  else {
    CFStringRef v12 = @"(no value)";
  }
  [v6 setObject:v12 forKeyedSubscript:@"name"];

  uint64_t v13 = [v5 modelName];
  v14 = (void *)v13;
  if (v13) {
    CFStringRef v15 = (const __CFString *)v13;
  }
  else {
    CFStringRef v15 = @"(no value)";
  }
  [v6 setObject:v15 forKeyedSubscript:@"airplayModel"];

  uint64_t v16 = [v5 manufacturerName];
  v17 = (void *)v16;
  if (v16) {
    CFStringRef v18 = (const __CFString *)v16;
  }
  else {
    CFStringRef v18 = @"(no value)";
  }
  [v6 setObject:v18 forKeyedSubscript:@"manufacturer"];

  uint64_t v19 = [v5 vehicleName];
  v20 = (void *)v19;
  if (v19) {
    CFStringRef v21 = (const __CFString *)v19;
  }
  else {
    CFStringRef v21 = @"(no value)";
  }
  [v6 setObject:v21 forKeyedSubscript:@"iAPName"];

  uint64_t v22 = [v5 vehicleModelName];
  v23 = (void *)v22;
  if (v22) {
    CFStringRef v24 = (const __CFString *)v22;
  }
  else {
    CFStringRef v24 = @"(no value)";
  }
  [v6 setObject:v24 forKeyedSubscript:@"iAPModel"];

  uint64_t v25 = [v5 vehicleManufacturer];
  v26 = (void *)v25;
  if (v25) {
    CFStringRef v27 = (const __CFString *)v25;
  }
  else {
    CFStringRef v27 = @"(no value)";
  }
  [v6 setObject:v27 forKeyedSubscript:@"iAPManufacturer"];

  uint64_t v28 = [v5 vehicleFirmwareVersion];
  v29 = (void *)v28;
  if (v28) {
    CFStringRef v30 = (const __CFString *)v28;
  }
  else {
    CFStringRef v30 = @"(no value)";
  }
  [v6 setObject:v30 forKeyedSubscript:@"firmwareVersion"];

  uint64_t v31 = [v5 vehicleHardwareVersion];
  v32 = (void *)v31;
  if (v31) {
    CFStringRef v33 = (const __CFString *)v31;
  }
  else {
    CFStringRef v33 = @"(no value)";
  }
  [v6 setObject:v33 forKeyedSubscript:@"hardwareVersion"];

  uint64_t v34 = [v5 descriptionForLimitableUserInterfaces];
  v35 = (void *)v34;
  if (v34) {
    CFStringRef v36 = (const __CFString *)v34;
  }
  else {
    CFStringRef v36 = @"(no value)";
  }
  [v6 setObject:v36 forKeyedSubscript:@"limitableUITypes"];

  [v4 voiceTriggerMode];
  uint64_t v37 = CARStringFromVoiceTriggerMode();
  v38 = (void *)v37;
  if (v37) {
    CFStringRef v39 = (const __CFString *)v37;
  }
  else {
    CFStringRef v39 = @"(no value)";
  }
  [v6 setObject:v39 forKeyedSubscript:@"voiceTriggerMode"];

  v40 = [v5 screens];
  v41 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v40 count]);
  [v6 setObject:v41 forKeyedSubscript:@"screenCount"];

  v42 = [v4 sourceVersion];

  if (v42) {
    CFStringRef v43 = v42;
  }
  else {
    CFStringRef v43 = @"(no value)";
  }
  [v6 setObject:v43 forKeyedSubscript:@"SourceVersion"];

  v44 = [v5 screens];
  v45 = [v44 firstObject];

  if (v45)
  {
    uint64_t v46 = [v45 descriptionForPrimaryInteractionModel];
    v47 = (void *)v46;
    if (v46) {
      CFStringRef v48 = (const __CFString *)v46;
    }
    else {
      CFStringRef v48 = @"(no value)";
    }
    [v6 setObject:v48 forKeyedSubscript:@"primaryInteraction"];

    uint64_t v49 = [v45 descriptionForAvailableInteractionModels];
    v50 = (void *)v49;
    if (v49) {
      CFStringRef v51 = (const __CFString *)v49;
    }
    else {
      CFStringRef v51 = @"(no value)";
    }
    [v6 setObject:v51 forKeyedSubscript:@"availableInteractions"];

    if ([v45 supportsHighFidelityTouch]) {
      v52 = &__kCFBooleanTrue;
    }
    else {
      v52 = &__kCFBooleanFalse;
    }
    [v6 setObject:v52 forKeyedSubscript:@"supportsHiFiTouch"];
  }

  return v6;
}

@end