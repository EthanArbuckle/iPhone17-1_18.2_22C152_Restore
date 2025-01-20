@interface FPMonitor
- (FPMonitor)initWithDelegate:(id)a3;
- (FPMonitorDelegate)delegate;
- (NSDictionary)domainsByPath;
- (NSMutableDictionary)_domainsByPath;
- (id)monitoringContext;
- (void)beginMonitoring;
- (void)setDelegate:(id)a3;
- (void)setMonitoringContext:(id)a3;
- (void)set_domainsByPath:(id)a3;
@end

@implementation FPMonitor

- (FPMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPMonitor;
  v5 = [(FPMonitor *)&v7 init];
  if (v5 == self)
  {
    [(FPMonitor *)self setDelegate:v4];
    [(FPMonitor *)self beginMonitoring];
  }

  return v5;
}

- (NSDictionary)domainsByPath
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->__domainsByPath copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)beginMonitoring
{
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B300;
  v5[3] = &unk_100034F48;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v3 = +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:v5];
  id monitoringContext = self->_monitoringContext;
  self->_id monitoringContext = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (FPMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)monitoringContext
{
  return self->_monitoringContext;
}

- (void)setMonitoringContext:(id)a3
{
}

- (NSMutableDictionary)_domainsByPath
{
  return self->__domainsByPath;
}

- (void)set_domainsByPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__domainsByPath, 0);
  objc_storeStrong(&self->_monitoringContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end