@interface NTKTimerBundleComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (double)_fallbackDurationWithComplicationDuration:(double)result;
+ (id)_unknownEntryForDevice:(id)a3 complicationDuration:(double)a4;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)legacyNTKComplicationType;
- (BOOL)alwaysShowIdealizedTemplateInSwitcher;
- (Class)richComplicationDisplayViewClassForDevice:(id)a3;
- (MTTimerManager)timerManager;
- (NTKTimerBundleComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (double)complicationDuration;
- (id)_currentTimelineEntry;
- (id)currentSwitcherTemplate;
- (id)sampleTemplate;
- (void)_handleLocaleChange;
- (void)_handleTimeFormatChange;
- (void)_startObserving;
- (void)_stopObserving;
- (void)_timerDidChange:(id)a3;
- (void)dealloc;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)setComplicationDuration:(double)a3;
- (void)setTimerManager:(id)a3;
@end

@implementation NTKTimerBundleComplicationDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.nanotimer.complication.default";
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  id v4 = a4;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2D039937-4DE9-4AE3-B28E-F65B3D258152"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  return v6;
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  id v6 = a3;
  v7 = (void (**)(id, id))a5;
  v8 = +[NTKBundleLoader rootDirectory];
  v9 = [v8 stringByAppendingString:@"/System/Library/PrivateFrameworks/TimeAppServices.framework"];
  v10 = +[NSURL fileURLWithPath:v9];

  v11 = +[NSBundle bundleWithURL:v10];
  if (v11)
  {
    v12 = +[INSchema _defaultSchemaForBundle:v11];
    v13 = [v12 intentWithName:@"ConfigurationIntent"];
    if (v13)
    {
      if (v6)
      {
        v14 = [v6 userInfo];

        if (v14)
        {
          v15 = [v6 userInfo];
          v14 = [v15 objectForKey:@"Duration"];
        }
      }
      else
      {
        v14 = 0;
      }
      [v13 setValue:v14 forKey:@"duration"];
      v18 = INIntentWithTypedIntent();
      id v19 = objc_alloc((Class)CLKWidgetComplicationDescriptor);
      id v20 = [v19 initWithExtensionBundleIdentifier:@"com.apple.private.NanoTimer.NanoTimerWidgetExtension" containerBundleIdentifier:@"com.apple.private.NanoTimer" kind:MTWatchTimerWidgetKind intent:v18];
      v7[2](v7, v20);
    }
    else
    {
      v17 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_74EC(v17);
      }

      v7[2](v7, 0);
    }
  }
  else
  {
    v16 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_7474((uint64_t)v10, v16);
    }

    v7[2](v7, 0);
  }
}

- (NTKTimerBundleComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKTimerBundleComplicationDataSource;
  id v5 = [(NTKTimerBundleComplicationDataSource *)&v16 initWithComplication:a3 family:a4 forDevice:a5];
  id v6 = v5;
  if (v5)
  {
    v7 = [(NTKTimerBundleComplicationDataSource *)v5 complicationDescriptor];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 userInfo];

      if (v9)
      {
        v10 = [v8 userInfo];
        v11 = [v10 objectForKey:@"Duration"];

        if (v11) {
          [v11 doubleValue];
        }
        else {
          double v12 = 0.0;
        }
        v6->_complicationDuration = v12;
      }
    }
    v13 = (MTTimerManager *)objc_alloc_init((Class)MTTimerManager);
    timerManager = v6->_timerManager;
    v6->_timerManager = v13;

    [(NTKTimerBundleComplicationDataSource *)v6 _startObserving];
  }
  return v6;
}

- (void)dealloc
{
  [(NTKTimerBundleComplicationDataSource *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)NTKTimerBundleComplicationDataSource;
  [(NTKTimerBundleComplicationDataSource *)&v3 dealloc];
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 3;
}

+ (id)legacyNTKComplicationType
{
  return &off_D030;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x13) != 0) {
    return 1;
  }
  BOOL result = 1;
  if (a3 != 12
    && (a3 & 0xFFFFFFFFFFFFFFFCLL) != 8
    && (a3 & 0xFFFFFFFFFFFFFFFALL) != 2
    && CLKComplicationFamilyCircularMedium != a3)
  {
    return CLKComplicationFamilySimpleText == a3;
  }
  return result;
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

- (id)sampleTemplate
{
  return [(NTKTimerBundleComplicationDataSource *)self currentSwitcherTemplate];
}

- (id)currentSwitcherTemplate
{
  if (self->_complicationDuration == 0.0)
  {
    objc_super v3 = [NTKTimerBundleTimelineEntry alloc];
    id v4 = [(NTKTimerBundleComplicationDataSource *)self device];
    id v5 = [(NTKTimerBundleTimelineEntry *)v3 initWithDevice:v4];

    id v6 = +[NTKDate unmodifiedDate];
    [(NTKTimerBundleTimelineEntry *)v5 setEntryDate:v6];

    [(NTKTimerBundleTimelineEntry *)v5 setNumRunningTimers:0];
    [(NTKTimerBundleTimelineEntry *)v5 setNumPausedTimers:0];
    [(NTKTimerBundleTimelineEntry *)v5 setIsDefaultComplication:1];
    [(NTKTimerBundleTimelineEntry *)v5 setCountdownDuration:900.0];
    [(NTKTimerBundleTimelineEntry *)v5 countdownDuration];
    -[NTKTimerBundleTimelineEntry setRemainingTime:](v5, "setRemainingTime:");
    [(NTKTimerBundleTimelineEntry *)v5 setTitle:0];
    [(NTKTimerBundleTimelineEntry *)v5 setState:1];
    v7 = [(NTKTimerBundleTimelineEntry *)v5 entryForComplicationFamily:[(NTKTimerBundleComplicationDataSource *)self family]];
    v8 = [v7 complicationTemplate];
  }
  else
  {
    id v5 = [(NTKTimerBundleComplicationDataSource *)self _currentTimelineEntry];
    v8 = [(NTKTimerBundleTimelineEntry *)v5 complicationTemplate];
  }

  return v8;
}

- (id)_currentTimelineEntry
{
  objc_super v3 = self->_currentTimerEntry;
  if (!v3)
  {
    id v4 = objc_opt_class();
    id v5 = [(NTKTimerBundleComplicationDataSource *)self device];
    objc_super v3 = [v4 _unknownEntryForDevice:v5 complicationDuration:self->_complicationDuration];
  }
  id v6 = [(NTKTimerBundleTimelineEntry *)v3 entryForComplicationFamily:[(NTKTimerBundleComplicationDataSource *)self family]];

  return v6;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKTimerBundleComplicationDataSource *)self device];
  id v6 = [(NTKTimerBundleComplicationDataSource *)self family];
  double complicationDuration = self->_complicationDuration;
  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_3B78;
  objc_super v16 = &unk_C558;
  objc_copyWeak(v19, &location);
  id v8 = v5;
  id v17 = v8;
  v19[1] = *(id *)&complicationDuration;
  id v9 = v4;
  id v18 = v9;
  v19[2] = v6;
  v10 = objc_retainBlock(&v13);
  v11 = [(MTTimerManager *)self->_timerManager timers];
  id v12 = [v11 addCompletionBlock:v10];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

+ (id)appIdentifier
{
  return @"com.apple.private.NanoTimer";
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  if ((char *)[(NTKTimerBundleComplicationDataSource *)self family] - 9 > (unsigned char *)&dword_0 + 3) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = objc_opt_class();
  }

  return (Class)v3;
}

+ (double)_fallbackDurationWithComplicationDuration:(double)result
{
  if (result == 0.0) {
    return 900.0;
  }
  return result;
}

+ (id)_unknownEntryForDevice:(id)a3 complicationDuration:(double)a4
{
  id v5 = a3;
  id v6 = [[NTKTimerBundleTimelineEntry alloc] initWithDevice:v5];

  v7 = +[NTKDate unmodifiedDate];
  [(NTKTimerBundleTimelineEntry *)v6 setEntryDate:v7];

  [(NTKTimerBundleTimelineEntry *)v6 setNumRunningTimers:0];
  [(NTKTimerBundleTimelineEntry *)v6 setNumPausedTimers:0];
  [(NTKTimerBundleTimelineEntry *)v6 setIsDefaultComplication:a4 == 0.0];
  +[NTKTimerBundleComplicationDataSource _fallbackDurationWithComplicationDuration:a4];
  -[NTKTimerBundleTimelineEntry setCountdownDuration:](v6, "setCountdownDuration:");
  [(NTKTimerBundleTimelineEntry *)v6 countdownDuration];
  -[NTKTimerBundleTimelineEntry setRemainingTime:](v6, "setRemainingTime:");
  [(NTKTimerBundleTimelineEntry *)v6 setTitle:0];
  [(NTKTimerBundleTimelineEntry *)v6 setState:1];

  return v6;
}

- (void)_startObserving
{
  if (!self->_listeningForNotifications)
  {
    self->_listeningForNotifications = 1;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_timerDidChange:" name:MTTimerManagerNextTimerChanged object:self->_timerManager];
    [v4 addObserver:self selector:"_timerDidChange:" name:MTTimerManagerTimersChanged object:self->_timerManager];
    [v4 addObserver:self selector:"_timerDidChange:" name:MTTimerManagerStateReset object:self->_timerManager];
    [v4 addObserver:self selector:"_handleLocaleChange" name:NSCurrentLocaleDidChangeNotification object:0];
    [v4 addObserver:self selector:"_handleTimeFormatChange" name:CLKFormatTimeIntervalCacheInvalidateNotification object:0];
    objc_super v3 = [(NTKTimerBundleComplicationDataSource *)self delegate];
    [v3 invalidateEntries];
  }
}

- (void)_stopObserving
{
  self->_listeningForNotifications = 0;
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_timerDidChange:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = [v4 name];
    int v10 = 138412546;
    v11 = v7;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ Received %@ notification", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(NTKTimerBundleComplicationDataSource *)self delegate];
  [v9 invalidateEntries];
}

- (void)_handleLocaleChange
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ Received NSCurrentLocaleDidChangeNotification notification", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(NTKTimerBundleComplicationDataSource *)self delegate];
  [v6 invalidateEntries];
}

- (void)_handleTimeFormatChange
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ Received CLKFormatTimeIntervalCacheInvalidateNotification notification", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(NTKTimerBundleComplicationDataSource *)self delegate];
  [v6 invalidateEntries];
}

- (double)complicationDuration
{
  return self->_complicationDuration;
}

- (void)setComplicationDuration:(double)a3
{
  self->_double complicationDuration = a3;
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerManager, 0);

  objc_storeStrong((id *)&self->_currentTimerEntry, 0);
}

@end