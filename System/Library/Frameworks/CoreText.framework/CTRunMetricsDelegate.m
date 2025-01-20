@interface CTRunMetricsDelegate
- (id)beginClusterModificationHandler;
- (id)clusterModificationHandler;
- (id)endClusterModificationHandler;
- (void)dealloc;
- (void)setBeginClusterModificationHandler:(id)a3;
- (void)setClusterModificationHandler:(id)a3;
- (void)setEndClusterModificationHandler:(id)a3;
@end

@implementation CTRunMetricsDelegate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CTRunMetricsDelegate;
  [(CTRunMetricsDelegate *)&v3 dealloc];
}

- (id)beginClusterModificationHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setBeginClusterModificationHandler:(id)a3
{
}

- (id)clusterModificationHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setClusterModificationHandler:(id)a3
{
}

- (id)endClusterModificationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setEndClusterModificationHandler:(id)a3
{
}

@end