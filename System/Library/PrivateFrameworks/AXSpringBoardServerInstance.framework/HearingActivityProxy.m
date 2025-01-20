@interface HearingActivityProxy
- (_TtC27AXSpringBoardServerInstance20HearingActivityProxy)init;
- (void)finishWithCompletionHandler:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation HearingActivityProxy

- (void)startWithCompletionHandler:(id)a3
{
  v5 = _Block_copy(a3);
  v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v5;
  *(void *)(v4 + 24) = self;
  sub_226EF9CF0((uint64_t)&unk_268161108, v4);
}

- (void)finishWithCompletionHandler:(id)a3
{
  v5 = _Block_copy(a3);
  v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v5;
  *(void *)(v4 + 24) = self;
  sub_226EF9CF0((uint64_t)aIp, v4);
}

- (_TtC27AXSpringBoardServerInstance20HearingActivityProxy)init
{
  return (_TtC27AXSpringBoardServerInstance20HearingActivityProxy *)HearingActivityProxy.init()();
}

@end