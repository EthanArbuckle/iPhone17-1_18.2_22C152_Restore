@interface AEPerformancePrimitivesProvider
- (AEPerformancePrimitivesProvider)init;
- (id)makePrimitives;
@end

@implementation AEPerformancePrimitivesProvider

- (AEPerformancePrimitivesProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)AEPerformancePrimitivesProvider;
  v2 = [(AEPerformancePrimitivesProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    OSGestalt = v2->_OSGestalt;
    v2->_OSGestalt = (AEOSGestalt *)v3;
  }
  return v2;
}

- (id)makePrimitives
{
  if (self) {
    self = (AEPerformancePrimitivesProvider *)self->_OSGestalt;
  }
  if ([(AEPerformancePrimitivesProvider *)self isInternalOS])
  {
    v2 = [AEConcretePerformancePrimitives alloc];
    uint64_t v3 = -[AEConcretePerformancePrimitives initWithSubsystem:](v2, AACLoggingSubsystem);
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end