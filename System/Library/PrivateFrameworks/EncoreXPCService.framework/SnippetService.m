@interface SnippetService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC16EncoreXPCService14SnippetService)init;
- (void)echoWithEvent:(id)a3;
- (void)handleEventWithEvent:(id)a3;
- (void)publishWithEvent:(id)a3;
- (void)subscribeWithCompletion:(id)a3;
@end

@implementation SnippetService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_24D1AFB88();

  return v9 & 1;
}

- (void)subscribeWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_24D1AF0E8((uint64_t)sub_24D1B0124, v5);

  swift_release();
}

- (void)handleEventWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D1AF294(v4);
}

- (void)publishWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D1AF770(v4);
}

- (void)echoWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D1AF7EC(v4);
}

- (_TtC16EncoreXPCService14SnippetService)init
{
  result = (_TtC16EncoreXPCService14SnippetService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_24D1AB200(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_connection);
}

@end