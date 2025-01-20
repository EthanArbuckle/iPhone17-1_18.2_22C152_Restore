@interface CPManagedConfigurationObserver
- (_TtC14CopresenceCore30CPManagedConfigurationObserver)init;
@end

@implementation CPManagedConfigurationObserver

- (_TtC14CopresenceCore30CPManagedConfigurationObserver)init
{
  return (_TtC14CopresenceCore30CPManagedConfigurationObserver *)CPManagedConfigurationObserver.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14CopresenceCore30CPManagedConfigurationObserver_profileConnection));
  v3 = (char *)self + OBJC_IVAR____TtC14CopresenceCore30CPManagedConfigurationObserver_delegate;
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)v3);
}

@end