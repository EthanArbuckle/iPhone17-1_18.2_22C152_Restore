@interface EnvironmentMonitor
- (_TtC11MediaCoreUI18EnvironmentMonitor)init;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangeThermalLevel:(id)a3;
@end

@implementation EnvironmentMonitor

- (_TtC11MediaCoreUI18EnvironmentMonitor)init
{
  return (_TtC11MediaCoreUI18EnvironmentMonitor *)sub_255C29E74();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedMonitor);
  objc_msgSend(v5, sel_unregisterObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for EnvironmentMonitor();
  [(EnvironmentMonitor *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MediaCoreUI18EnvironmentMonitor__isNetworkConstrained;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B29F098);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC11MediaCoreUI18EnvironmentMonitor__thermalLevel;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B29F0A0);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
}

@end