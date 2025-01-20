@interface CarPlayConnectionManager
+ (CarPlayConnectionManager)shared;
- (CarPlayConnectionManager)init;
- (id)radioStore;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)dealloc;
- (void)registerUpdateHandler:(id)a3;
@end

@implementation CarPlayConnectionManager

- (void)dealloc
{
  v2 = self;
  CarPlayConnectionManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CarPlayConnectionManager____lazy_storage___carRadioListener);
}

+ (CarPlayConnectionManager)shared
{
  id v2 = static CarPlayConnectionManager.shared.getter();
  return (CarPlayConnectionManager *)v2;
}

- (id)radioStore
{
  id v2 = self;
  v3 = (void *)CarPlayConnectionManager.radioStore()();

  return v3;
}

- (void)registerUpdateHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ();
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  CarPlayConnectionManager.registerUpdateHandler(_:)((uint64_t)v7, v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?((uint64_t)v7);
}

- (CarPlayConnectionManager)init
{
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CarPlayConnectionManager.carManager(_:didUpdateCurrentCar:)((uint64_t)v8, (uint64_t)a4);
}

@end