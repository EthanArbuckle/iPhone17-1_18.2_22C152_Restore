@interface CKPhoneLockStateObserver
+ (CKPhoneLockStateObserver)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (CKPhoneLockStateObserver)init;
- (void)dealloc;
@end

@implementation CKPhoneLockStateObserver

+ (CKPhoneLockStateObserver)sharedInstance
{
  id v2 = static PhoneLockStateObserver.shared.getter();
  return (CKPhoneLockStateObserver *)v2;
}

+ (void)setSharedInstance:(id)a3
{
}

- (CKPhoneLockStateObserver)init
{
  return (CKPhoneLockStateObserver *)PhoneLockStateObserver.init()();
}

- (void)dealloc
{
  id v2 = self;
  PhoneLockStateObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  id v2 = (char *)self + OBJC_IVAR___CKPhoneLockStateObserver__isLocked;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Bool>);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end