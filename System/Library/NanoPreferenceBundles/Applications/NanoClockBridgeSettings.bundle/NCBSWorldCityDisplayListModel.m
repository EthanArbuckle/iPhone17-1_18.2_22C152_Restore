@interface NCBSWorldCityDisplayListModel
+ (id)sharedInstance;
- (NCBSWorldCityDisplayListModel)init;
- (id)_cachedCityAtIndex:(unint64_t)a3;
- (id)cityDisplayAbbreviationForIndex:(unint64_t)a3;
- (id)cityDisplayNameForIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)_fetchCitiesAndNotify:(BOOL)a3;
- (void)_notifyClientsOfChange;
- (void)dealloc;
- (void)handleAbbreviationStoreChange:(id)a3;
- (void)handleWorldCitiesChanged;
@end

@implementation NCBSWorldCityDisplayListModel

+ (id)sharedInstance
{
  if (qword_115C8 != -1) {
    dispatch_once(&qword_115C8, &stru_C3C0);
  }
  v2 = (void *)qword_115C0;

  return v2;
}

- (NCBSWorldCityDisplayListModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCBSWorldCityDisplayListModel;
  v2 = [(NCBSWorldCityDisplayListModel *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)handleMobileTimerPrefsChange, @"NanoMobileTimerWorldClockPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)handleMobileTimerPrefsChange, MobileTimerUserPreferencesAndLocalNotificationsChanged, v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)handleMobileTimerPrefsChange, MobileTimerUserPreferencesChanged, v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(MobileTimerAppID);
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"handleAbbreviationStoreChange:" name:NTKCustomWorldCityAbbreviationsChangedNotification object:0];

    [(NCBSWorldCityDisplayListModel *)v2 _fetchCitiesAndNotify:0];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NCBSWorldCityDisplayListModel;
  [(NCBSWorldCityDisplayListModel *)&v5 dealloc];
}

- (unint64_t)count
{
  return [(NSArray *)self->_cachedCities count];
}

- (id)cityDisplayNameForIndex:(unint64_t)a3
{
  v3 = [(NCBSWorldCityDisplayListModel *)self _cachedCityAtIndex:a3];
  v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 name];
  }
  else
  {
    objc_super v5 = &stru_C500;
  }

  return v5;
}

- (id)cityDisplayAbbreviationForIndex:(unint64_t)a3
{
  v3 = [(NCBSWorldCityDisplayListModel *)self _cachedCityAtIndex:a3];
  if (v3)
  {
    NTKWorldClockCityAbbreviation();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_C500;
  }

  return v4;
}

- (void)handleAbbreviationStoreChange:(id)a3
{
}

- (void)handleWorldCitiesChanged
{
}

- (void)_fetchCitiesAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = +[WorldClockManager sharedManager];
  [v7 loadCities];
  objc_super v5 = [v7 cities];
  cachedCities = self->_cachedCities;
  self->_cachedCities = v5;

  if (v3) {
    [(NCBSWorldCityDisplayListModel *)self _notifyClientsOfChange];
  }
}

- (id)_cachedCityAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_cachedCities count] <= a3)
  {
    objc_super v5 = 0;
  }
  else
  {
    objc_super v5 = [(NSArray *)self->_cachedCities objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)_notifyClientsOfChange
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"NCBSWorldCityDisplayListChangedNotification" object:self];
}

- (void).cxx_destruct
{
}

@end