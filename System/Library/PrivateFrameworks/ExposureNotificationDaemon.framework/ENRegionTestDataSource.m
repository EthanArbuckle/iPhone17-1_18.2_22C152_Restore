@interface ENRegionTestDataSource
- (ENRegionMonitorSourceDelegate)delegate;
- (ENRegionTestDataSource)initWithDelegate:(id)a3;
- (NSString)description;
- (id)currentRegionVisit;
- (void)dealloc;
- (void)regionChanged;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation ENRegionTestDataSource

- (ENRegionTestDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENRegionTestDataSource;
  v5 = [(ENRegionTestDataSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ENRegionTestDataSource *)v5 setDelegate:v4];
  }

  return v6;
}

- (NSString)description
{
  v2 = (void *)MEMORY[0x1E4F29020];
  v3 = [(ENRegionTestDataSource *)self currentRegionVisit];
  id v4 = [v2 stringWithFormat:@"ENRegionTestDataSource: %@", v3];

  return (NSString *)v4;
}

- (void)dealloc
{
  if (gLogCategory_ENRegionTestDataSource <= 30
    && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  CFPrefs_RemoveValue();
  v3.receiver = self;
  v3.super_class = (Class)ENRegionTestDataSource;
  [(ENRegionTestDataSource *)&v3 dealloc];
}

- (void)startMonitoring
{
  if (gLogCategory_ENRegionTestDataSource <= 30
    && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
  {
    objc_super v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = NSStringFromSelector(a2);
    LogPrintF_safe();
  }
}

- (void)stopMonitoring
{
  if (gLogCategory_ENRegionTestDataSource <= 30
    && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
  {
    objc_super v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = NSStringFromSelector(a2);
    LogPrintF_safe();
  }
}

- (id)currentRegionVisit
{
  CFDataGetTypeID();
  v2 = (void *)CFPrefs_CopyTypedValue();
  if (![v2 length]
    || (uint64_t v5 = 0,
        [MEMORY[0x1E4F28DB8] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v5],
        (objc_super v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (gLogCategory_ENRegionTestDataSource <= 30
      && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    objc_super v3 = 0;
  }

  return v3;
}

- (void)regionChanged
{
  objc_super v3 = [(ENRegionTestDataSource *)self currentRegionVisit];
  if (v3)
  {
    id v8 = v3;
    id v4 = +[ENLoggingPrefs sharedENLoggingPrefs];
    char v5 = [v4 isSensitiveLoggingAllowed];

    if ((v5 & 1) != 0
      && gLogCategory_ENRegionTestDataSource <= 30
      && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
    {
      id v7 = v8;
      LogPrintF_safe();
    }
    v6 = [(ENRegionTestDataSource *)self delegate];
    [v6 regionDataSource:self updatedWithVisit:v8];

    objc_super v3 = v8;
  }
}

- (ENRegionMonitorSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (ENRegionMonitorSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end