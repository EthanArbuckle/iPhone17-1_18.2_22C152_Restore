@interface CAFPositionManagerObservable
- (_TtC10CAFCombine28CAFPositionManagerObservable)init;
- (void)dealloc;
- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4;
@end

@implementation CAFPositionManagerObservable

- (void)dealloc
{
  v2 = self;
  CAFPositionManagerObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10CAFCombine28CAFPositionManagerObservable__state;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFCharacteristicState>);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtC10CAFCombine28CAFPositionManagerObservable)init
{
}

- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4
{
  id v5 = a3;
  v6 = self;
  CAFPositionManagerObservable.positionManager(_:didUpdate:)(v5);
}

@end