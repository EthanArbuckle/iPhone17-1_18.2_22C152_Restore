@interface ErrorControllerImplementation
- (void)reportCriticalError:(id)a3 forItem:(id)a4;
- (void)resetWithReason:(id)a3;
- (void)resolveError:(id)a3 forItem:(id)a4 completion:(id)a5;
@end

@implementation ErrorControllerImplementation

- (void)resolveError:(id)a3 forItem:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_21BCD4C7C((uint64_t)v9, (uint64_t)a4, (uint64_t)self, (void (**)(void, void))v8);
  _Block_release(v8);
  swift_unknownObjectRelease();
  swift_release();
}

- (void)reportCriticalError:(id)a3 forItem:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_21BCD5080((uint64_t)v5, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_release();
}

- (void)resetWithReason:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_21BCD5204();
  swift_release();
}

@end