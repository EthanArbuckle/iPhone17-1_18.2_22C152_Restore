@interface DOCSourceSearchingContext
- (DOCSourceSearchingContext)initWithMonitoringContext:(id)a3;
- (id)monitoringContext;
- (void)setMonitoringContext:(id)a3;
@end

@implementation DOCSourceSearchingContext

- (void).cxx_destruct
{
}

- (id)monitoringContext
{
  return objc_getProperty(self, a2, 8, 1);
}

- (DOCSourceSearchingContext)initWithMonitoringContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DOCSourceSearchingContext;
  v6 = [(DOCSourceSearchingContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_monitoringContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setMonitoringContext:(id)a3
{
}

@end