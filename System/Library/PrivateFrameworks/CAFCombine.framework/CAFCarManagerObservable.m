@interface CAFCarManagerObservable
- (_TtC10CAFCombine23CAFCarManagerObservable)init;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)dealloc;
@end

@implementation CAFCarManagerObservable

- (void)dealloc
{
  v2 = self;
  CAFCarManagerObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10CAFCombine23CAFCarManagerObservable__currentCar;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<CAFCar?>);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtC10CAFCombine23CAFCarManagerObservable)init
{
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFCarManagerObservable.carManager(_:didUpdateCurrentCar:)((uint64_t)v8, a4);
}

@end