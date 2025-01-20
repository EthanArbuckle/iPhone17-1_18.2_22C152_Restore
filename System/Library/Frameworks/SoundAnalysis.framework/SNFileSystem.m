@interface SNFileSystem
- (SNFileSystem)init;
- (void)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5;
- (void)removeRequest:(id)a3;
@end

@implementation SNFileSystem

- (SNFileSystem)init
{
  sub_1DC8F04F0();
  return result;
}

- (void)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v7;
  *(void *)(swift_allocObject() + 16) = v8;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1DC8F0D78();
  swift_unknownObjectRelease();

  swift_release();

  swift_release();
}

- (void)removeRequest:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1DC8F16D4();
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SNFileSystem_queue);
}

@end