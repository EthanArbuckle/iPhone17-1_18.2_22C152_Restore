@interface NTKCellularConnectivityComplicationDataSource
+ (BOOL)_isDeviceExplorer:(id)a3;
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appGroupIdentifier;
+ (id)localizedAppName;
+ (id)sectionIdentifier;
- (NTKCellularConnectivityComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currentTimelineEntry;
- (id)currentSwitcherTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
@end

@implementation NTKCellularConnectivityComplicationDataSource

+ (id)localizedAppName
{
  return (id)_NTKComplicationTypeLocalizedLabelTextFromTypeKey(@"CELLULAR", a2);
}

+ (id)sectionIdentifier
{
  return [a1 appGroupIdentifier];
}

+ (id)appGroupIdentifier
{
  return NTKComplicationCellularGroupIdentifier;
}

- (NTKCellularConnectivityComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCellularConnectivityComplicationDataSource;
  result = [(NTKCellularConnectivityComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5];
  if (result)
  {
    result->_pauseAnimations = 1;
    result->_cellularConnectivityState = 0;
  }
  return result;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (CLKComplicationFamilyCircularMedium == a3 || (unsigned __int8 v6 = 0, (unint64_t)a3 <= 0xC) && ((1 << a3) & 0x1795) != 0) {
    unsigned __int8 v6 = [(id)objc_opt_class() _isDeviceExplorer:v5];
  }

  return v6;
}

- (id)currentSwitcherTemplate
{
  v3 = objc_alloc_init(NTKCellularConnectivityTimelineEntryModel);
  [(NTKCellularConnectivityTimelineEntryModel *)v3 setCellularConnectivityState:1];
  v4 = [(NTKCellularConnectivityTimelineEntryModel *)v3 entryForComplicationFamily:[(NTKCellularConnectivityComplicationDataSource *)self family]];
  id v5 = [v4 complicationTemplate];

  return v5;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NTKCellularConnectivityComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

+ (BOOL)_isDeviceExplorer:(id)a3
{
  return [a3 isExplorer];
}

- (id)_currentTimelineEntry
{
  if ((CLKIsNTKDaemon() & 1) != 0 || CLKIsFaceSnapshotService())
  {
    v3 = objc_alloc_init(NTKCellularConnectivityTimelineEntryModel);
    [(NTKCellularConnectivityTimelineEntryModel *)v3 setCellularConnectivityState:1];
  }
  else
  {
    v3 = objc_alloc_init(NTKCellularConnectivityTimelineEntryModel);
    v4 = +[CLKDate complicationDate];
    [(NTKCellularConnectivityTimelineEntryModel *)v3 setEntryDate:v4];

    [(NTKCellularConnectivityTimelineEntryModel *)v3 setCellularConnectivityState:self->_cellularConnectivityState];
    [(NTKCellularConnectivityTimelineEntryModel *)v3 setPauseAnimations:self->_pauseAnimations];
  }
  id v5 = [(NTKCellularConnectivityTimelineEntryModel *)v3 entryForComplicationFamily:[(NTKCellularConnectivityComplicationDataSource *)self family]];

  return v5;
}

@end