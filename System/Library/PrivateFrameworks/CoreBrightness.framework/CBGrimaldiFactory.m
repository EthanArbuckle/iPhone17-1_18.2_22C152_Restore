@interface CBGrimaldiFactory
- (BOOL)isReady;
- (CBGrimaldiEventSource)eventSource;
- (CBGrimaldiSamplingStrategy)samplingStrategy;
- (OS_dispatch_queue)queue;
- (id)newInstance;
- (void)dealloc;
- (void)setEventSource:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSamplingStrategy:(id)a3;
@end

@implementation CBGrimaldiFactory

- (BOOL)isReady
{
  BOOL v3 = 0;
  if (self->_queue)
  {
    BOOL v3 = 0;
    if (self->_eventSource) {
      return self->_samplingStrategy != 0;
    }
  }
  return v3;
}

- (id)newInstance
{
  if ([(CBGrimaldiFactory *)self isReady]) {
    return [[CBGrimaldiModule alloc] initWithQueue:self->_queue andEventSource:self->_eventSource andSamplingStrategy:self->_samplingStrategy];
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_queue) {

  }
  if (v4->_eventSource) {
  if (v4->_samplingStrategy)
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBGrimaldiFactory;
  [(CBGrimaldiFactory *)&v2 dealloc];
}

- (CBGrimaldiEventSource)eventSource
{
  return (CBGrimaldiEventSource *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventSource:(id)a3
{
}

- (CBGrimaldiSamplingStrategy)samplingStrategy
{
  return (CBGrimaldiSamplingStrategy *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSamplingStrategy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

@end