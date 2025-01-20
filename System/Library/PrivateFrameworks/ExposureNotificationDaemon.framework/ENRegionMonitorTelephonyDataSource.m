@interface ENRegionMonitorTelephonyDataSource
- (ENCoreTelephonyUtility)telephonyUtility;
- (ENRegionMonitorSourceDelegate)delegate;
- (ENRegionMonitorTelephonyDataSource)initWithDelegate:(id)a3;
- (ENRegionVisit)cachedRegionVisit;
- (OS_dispatch_queue)dataSourceQueue;
- (void)mobileCountryCodeChanged:(id)a3 withISOString:(id)a4;
- (void)setCachedRegionVisit:(id)a3;
- (void)setDataSourceQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTelephonyUtility:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)telephonyUtility:(id)a3 mobileCountryCodeChanged:(id)a4 andCountryCodeISO:(id)a5;
@end

@implementation ENRegionMonitorTelephonyDataSource

- (void)telephonyUtility:(id)a3 mobileCountryCodeChanged:(id)a4 andCountryCodeISO:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v8 && v9 && [v9 length])
  {
    [(ENRegionMonitorTelephonyDataSource *)self mobileCountryCodeChanged:v8 withISOString:v10];
  }
  else if (gLogCategory__ENRegionMonitorTelephonyDataSource <= 90 {
         && (gLogCategory__ENRegionMonitorTelephonyDataSource != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (void)mobileCountryCodeChanged:(id)a3 withISOString:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [(ENRegionMonitorTelephonyDataSource *)self cachedRegionVisit];

  if (!v7
    && gLogCategory_ENRegionMonitorTelephonyDataSource <= 30
    && (gLogCategory_ENRegionMonitorTelephonyDataSource != -1 || _LogCategory_Initialize()))
  {
    [v13 integerValue];
    LogPrintF_safe();
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v6];

  id v9 = objc_alloc(MEMORY[0x1E4F257E0]);
  v10 = [MEMORY[0x1E4F1C9C0] date];
  id v11 = (void *)[v9 initWithRegion:v8 date:v10];

  [(ENRegionMonitorTelephonyDataSource *)self setCachedRegionVisit:v11];
  v12 = [(ENRegionMonitorTelephonyDataSource *)self delegate];
  [v12 regionDataSource:self updatedWithVisit:v11];
}

- (void)setCachedRegionVisit:(id)a3
{
}

- (ENRegionMonitorSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (ENRegionMonitorSourceDelegate *)WeakRetained;
}

- (ENRegionVisit)cachedRegionVisit
{
  return self->_cachedRegionVisit;
}

- (ENRegionMonitorTelephonyDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ENRegionMonitorTelephonyDataSource;
  v5 = [(ENRegionMonitorTelephonyDataSource *)&v10 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.exposureNotification.regionSource.telephony", v6);
    [(ENRegionMonitorTelephonyDataSource *)v5 setDataSourceQueue:v7];

    [(ENRegionMonitorTelephonyDataSource *)v5 setDelegate:v4];
    id v8 = +[ENCoreTelephonyUtility sharedInstance];
    [(ENRegionMonitorTelephonyDataSource *)v5 setTelephonyUtility:v8];
  }
  return v5;
}

- (void)startMonitoring
{
  if (gLogCategory_ENRegionMonitorTelephonyDataSource <= 30
    && (gLogCategory_ENRegionMonitorTelephonyDataSource != -1 || _LogCategory_Initialize()))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    NSStringFromSelector(a2);
    v7 = id v6 = v5;
    LogPrintF_safe();
  }
  id v8 = [(ENRegionMonitorTelephonyDataSource *)self telephonyUtility];
  [v8 addObserver:self];
}

- (void)stopMonitoring
{
  if (gLogCategory_ENRegionMonitorTelephonyDataSource <= 30
    && (gLogCategory_ENRegionMonitorTelephonyDataSource != -1 || _LogCategory_Initialize()))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    NSStringFromSelector(a2);
    v7 = id v6 = v5;
    LogPrintF_safe();
  }
  id v8 = [(ENRegionMonitorTelephonyDataSource *)self telephonyUtility];
  [v8 removeObserver:self];
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dataSourceQueue
{
  return self->_dataSourceQueue;
}

- (void)setDataSourceQueue:(id)a3
{
}

- (ENCoreTelephonyUtility)telephonyUtility
{
  return self->_telephonyUtility;
}

- (void)setTelephonyUtility:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyUtility, 0);
  objc_storeStrong((id *)&self->_dataSourceQueue, 0);
  objc_storeStrong((id *)&self->_cachedRegionVisit, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end