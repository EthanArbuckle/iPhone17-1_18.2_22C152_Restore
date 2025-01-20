@interface CallScreening.MainAnsweringMachine
- (BOOL)isEnabled;
- (void)openURL:(NSURL *)a3 completion:(id)a4;
- (void)screenCallWithUUID:(NSString *)a3 manualScreening:(BOOL)a4 completion:(id)a5;
@end

@implementation CallScreening.MainAnsweringMachine

- (BOOL)isEnabled
{
  swift_retain();
  char v2 = CallScreening.MainAnsweringMachine.enabled.getter();
  swift_release();
  return v2 & 1;
}

- (void)openURL:(NSURL *)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain();
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in CallScreening.MainAnsweringMachine.open(_:), (uint64_t)v7);
}

- (void)screenCallWithUUID:(NSString *)a3 manualScreening:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = a3;
  swift_retain();
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in CallScreening.MainAnsweringMachine.screenCall(withUUID:manualScreening:), v9);
}

@end