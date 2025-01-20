@interface CALNCalendarCoreLocationManager
- (BOOL)allowsLocationAlerts;
- (CALNCalendarCoreLocationManager)initWithCoreLocationProvider:(id)a3;
- (CALNCoreLocationProvider)coreLocationProvider;
- (void)markAsHavingReceivedLocation;
@end

@implementation CALNCalendarCoreLocationManager

- (CALNCalendarCoreLocationManager)initWithCoreLocationProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNCalendarCoreLocationManager;
  v6 = [(CALNCalendarCoreLocationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_coreLocationProvider, a3);
  }

  return v7;
}

- (BOOL)allowsLocationAlerts
{
  v3 = [(CALNCalendarCoreLocationManager *)self coreLocationProvider];
  uint64_t v4 = *MEMORY[0x263F300B0];
  int v5 = [v3 authorizationStatusForBundleIdentifier:*MEMORY[0x263F300B0]];

  v6 = [MEMORY[0x263F30050] bundle];
  v7 = [(CALNCalendarCoreLocationManager *)self coreLocationProvider];
  char v8 = [v7 preciseLocationAuthorizedForBundleIdentifier:v4];

  objc_super v9 = [(CALNCalendarCoreLocationManager *)self coreLocationProvider];
  int v10 = [v9 authorizationStatusForBundle:v6];

  v11 = [(CALNCalendarCoreLocationManager *)self coreLocationProvider];
  char v12 = [v11 preciseLocationAuthorizedForBundle:v6];

  if (v10 != 3 || v5 <= 2) {
    char v14 = 0;
  }
  else {
    char v14 = v8;
  }
  char v15 = v14 & v12;

  return v15;
}

- (void)markAsHavingReceivedLocation
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2216BB000, log, OS_LOG_TYPE_DEBUG, "Marking as heaving received location", v1, 2u);
}

- (CALNCoreLocationProvider)coreLocationProvider
{
  return self->_coreLocationProvider;
}

- (void).cxx_destruct
{
}

@end