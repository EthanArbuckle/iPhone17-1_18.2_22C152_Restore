@interface HearingDevicesComplicationBundleDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)adjustsIndependentlyEnabled;
+ (BOOL)shouldShowHearingComplicationsUI;
+ (id)_requeryQueue;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)localizedAppName;
+ (int64_t)complicationPreferredDisplayMode;
+ (void)_requeryHANanoSettingsForPairedHearingAids;
+ (void)_requeryHUHearingAidSettingsForPairedHearingAids;
+ (void)initialize;
- (BOOL)alwaysShowIdealizedTemplateInSwitcher;
- (HearingDevicesComplicationBundleDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (NSArray)currentHearingDevices;
- (id)currentSwitcherTemplate;
- (id)currentTimelineEntry;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getSupportedTimeTravelDirectionsWithHandler:(id)a3;
- (void)getTimelineEndDateWithHandler:(id)a3;
- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
- (void)getTimelineEntriesBeforeDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
- (void)getTimelineStartDateWithHandler:(id)a3;
- (void)hearingDevicePropertiesDidUpdate:(id)a3;
- (void)hearingDevicesDidChange:(id)a3;
- (void)listenForUpdates;
- (void)setCurrentHearingDevices:(id)a3;
@end

@implementation HearingDevicesComplicationBundleDataSource

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[HUHearingAidSettings sharedInstance];
    [v3 registerUpdateBlock:&stru_82C8 forRetrieveSelector:"pairedHearingAids" withListener:a1];

    v4 = [a1 _requeryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4670;
    block[3] = &unk_82E8;
    block[4] = a1;
    dispatch_async(v4, block);

    v5 = +[HANanoSettings sharedInstance];
    [v5 registerUpdateBlock:&stru_8308 forRetrieveSelector:"pairedHearingAids" withListener:a1];

    v6 = [a1 _requeryQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4684;
    v7[3] = &unk_82E8;
    v7[4] = a1;
    dispatch_async(v6, v7);
  }
}

+ (id)_requeryQueue
{
  if (qword_C9B0 != -1) {
    dispatch_once(&qword_C9B0, &stru_8328);
  }
  v2 = (void *)qword_C9A8;

  return v2;
}

+ (void)_requeryHUHearingAidSettingsForPairedHearingAids
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_47C8;
  block[3] = &unk_82E8;
  block[4] = a1;
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, block);
  v4 = [a1 _requeryQueue];
  dispatch_async(v4, v3);
}

+ (void)_requeryHANanoSettingsForPairedHearingAids
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4900;
  block[3] = &unk_82E8;
  block[4] = a1;
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, block);
  v4 = [a1 _requeryQueue];
  dispatch_async(v4, v3);
}

- (HearingDevicesComplicationBundleDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HearingDevicesComplicationBundleDataSource;
  return [(HearingDevicesComplicationBundleDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5];
}

- (void)listenForUpdates
{
  dispatch_block_t v3 = +[HUHearingAidSettings sharedInstance];
  v4 = [v3 pairedHearingAids];

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = +[HUHearingAidSettings sharedInstance];
    unsigned int v6 = [v5 isiCloudPaired];

    v7 = +[AXHAServer sharedInstance];
    if (v6)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_4BFC;
      v14[3] = &unk_8350;
      v8 = &v15;
      objc_copyWeak(&v15, &location);
      [v7 registerPassiveListener:self forAvailableDeviceHandler:v14];
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_4C58;
      v12[3] = &unk_8350;
      v8 = &v13;
      objc_copyWeak(&v13, &location);
      [v7 registerListener:self forAvailableDeviceHandler:v12];
    }

    objc_destroyWeak(v8);
    v9 = +[AXHAServer sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_4CB4;
    v10[3] = &unk_8378;
    objc_copyWeak(&v11, &location);
    [v9 registerListener:self forPropertyUpdateHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)hearingDevicesDidChange:(id)a3
{
  id v4 = a3;
  [(HearingDevicesComplicationBundleDataSource *)self setCurrentHearingDevices:v4];
  HAInitializeLogging();
  v5 = +[NSString stringWithFormat:@"devices did change %@", v4];
  unsigned int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingDevicesComplicationBundleDataSource hearingDevicesDidChange:]", 143, v5);
  v7 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    id v13 = [v8 UTF8String];
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v10 = [v4 firstObject];
  [v10 loadRequiredProperties];
  id v11 = [(HearingDevicesComplicationBundleDataSource *)self delegate];
  [v11 invalidateEntries];
}

- (void)hearingDevicePropertiesDidUpdate:(id)a3
{
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(HearingDevicesComplicationBundleDataSource *)self currentHearingDevices];
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v6) {
    goto LABEL_14;
  }
  id v7 = v6;
  v20 = self;
  char v8 = 0;
  uint64_t v9 = *(void *)v24;
  id obj = v5;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      v12 = [v11 deviceUUID];
      id v13 = [v4 objectForKey:v12];

      if ([v13 count])
      {
        HAInitializeLogging();
        v14 = +[NSString stringWithFormat:@"Update %@", v13];
        id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingDevicesComplicationBundleDataSource hearingDevicePropertiesDidUpdate:]", 161, v14);
        v16 = (void *)HAEngineeringLog;
        if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v15;
          v18 = v16;
          id v19 = [v17 UTF8String];
          *(_DWORD *)buf = 136446210;
          id v28 = v19;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_5130;
        v22[3] = &unk_83A0;
        v22[4] = v11;
        [v13 enumerateKeysAndObjectsInDependentOrderUsingBlock:v22];
        char v8 = 1;
      }
    }
    id v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  }
  while (v7);

  if (v8)
  {
    v5 = [(HearingDevicesComplicationBundleDataSource *)v20 delegate];
    [v5 invalidateEntries];
LABEL_14:
  }
}

+ (BOOL)shouldShowHearingComplicationsUI
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  BOOL v3 = (byte_C9B8 | byte_C9B9) != 0;
  objc_sync_exit(v2);

  return v3;
}

+ (BOOL)adjustsIndependentlyEnabled
{
  v2 = +[HANanoSettings sharedInstance];
  unsigned __int8 v3 = [v2 independentHearingAidSettings];

  return v3;
}

+ (int64_t)complicationPreferredDisplayMode
{
  v2 = +[HANanoSettings sharedInstance];
  id v3 = [v2 complicationPreferredDisplayMode];

  return (int64_t)v3;
}

+ (id)appIdentifier
{
  return @"com.apple.HearingApp";
}

+ (id)localizedAppName
{
  return (id)hearingLocString();
}

+ (id)bundleIdentifier
{
  id v3 = +[NSBundle bundleForClass:a1];
  id v4 = [v3 bundleIdentifier];
  v5 = [v4 stringByAppendingString:@"."];
  id v6 = NSStringFromClass((Class)a1);
  id v7 = [v5 stringByAppendingString:v6];

  return v7;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  unsigned int v6 = objc_msgSend(a1, "shouldShowHearingComplicationsUI", a3, a4);
  if (v6)
  {
    if (CLKComplicationFamilyCircularMedium == a3)
    {
LABEL_5:
      LOBYTE(v6) = 1;
      return v6;
    }
    if ((unint64_t)a3 > 0xB) {
      goto LABEL_9;
    }
    if (((1 << a3) & 0xF93) != 0) {
      goto LABEL_5;
    }
    if (((1 << a3) & 0x4C) != 0) {
      LOBYTE(v6) = [a1 adjustsIndependentlyEnabled] ^ 1;
    }
    else {
LABEL_9:
    }
      LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

- (id)currentSwitcherTemplate
{
  v2 = [(HearingDevicesComplicationBundleDataSource *)self currentTimelineEntry];
  id v3 = [v2 complicationTemplate];

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(HearingDevicesComplicationBundleDataSource *)self currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)getSupportedTimeTravelDirectionsWithHandler:(id)a3
{
}

- (void)getTimelineStartDateWithHandler:(id)a3
{
}

- (void)getTimelineEndDateWithHandler:(id)a3
{
}

- (void)getTimelineEntriesBeforeDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
}

- (id)currentTimelineEntry
{
  id v3 = [HearingDevicesComplicationTimelineEntryModel alloc];
  id v4 = +[CLKClockTimer now];
  id v5 = [(HearingDevicesComplicationTimelineEntryModel *)v3 initWithEntryDate:v4];

  id v6 = [objc_alloc((Class)AXFakeHearingAidDevice) initWithDeviceType:64];
  if (v6)
  {
    id v7 = [(HearingDevicesComplicationBundleDataSource *)self family];
    id v8 = [(id)objc_opt_class() adjustsIndependentlyEnabled];
    uint64_t v9 = -[HearingDevicesComplicationTimelineEntryModel entryForComplicationFamily:hearingDevice:adjustsIndependently:preferredDisplayMode:](v5, "entryForComplicationFamily:hearingDevice:adjustsIndependently:preferredDisplayMode:", v7, v6, v8, [(id)objc_opt_class() complicationPreferredDisplayMode]);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSArray)currentHearingDevices
{
  return self->_currentHearingDevices;
}

- (void)setCurrentHearingDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end