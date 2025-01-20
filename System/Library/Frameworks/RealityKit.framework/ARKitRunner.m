@interface ARKitRunner
- (_TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner)init;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
@end

@implementation ARKitRunner

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  specialized ARKitRunner.session(_:didChange:)(a4);
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized ARKitRunner.session(_:didUpdate:)();
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  specialized ARKitRunner.session(_:didFailWithError:)(v8);
}

- (_TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner)init
{
  uint64_t v3 = OBJC_IVAR____TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner_lock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v4 = (objc_class *)swift_allocObject();
  *((_DWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + v3) = v4;
  v5 = (char *)self + OBJC_IVAR____TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner_continuation;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CheckedContinuation<related decl 'e' for ARErrorCode?, Never>);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ARKitRunner();
  return [(ARKitRunner *)&v8 init];
}

- (void).cxx_destruct
{
}

@end