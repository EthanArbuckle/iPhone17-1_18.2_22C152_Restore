@interface MUPlaceActionDispatcher
- (MUPlaceActionManager)actionManager;
- (_TtC6MapsUI23MUPlaceActionDispatcher)init;
- (_TtC6MapsUI23MUPlaceActionDispatcher)initWithActionManager:(id)a3;
- (_TtP6MapsUI31MUPlaceActionDispatcherDelegate_)delegate;
- (void)performActionFor:(id)a3 completion:(id)a4;
- (void)setActionManager:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MUPlaceActionDispatcher

- (MUPlaceActionManager)actionManager
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_actionManager);
  swift_beginAccess();
  return (MUPlaceActionManager *)*v2;
}

- (void)setActionManager:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_actionManager);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtP6MapsUI31MUPlaceActionDispatcherDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1996FC540](v2);
  return (_TtP6MapsUI31MUPlaceActionDispatcherDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC6MapsUI23MUPlaceActionDispatcher)initWithActionManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_actionManager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(MUPlaceActionDispatcher *)&v8 init];
}

- (_TtC6MapsUI23MUPlaceActionDispatcher)init
{
  result = (_TtC6MapsUI23MUPlaceActionDispatcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6MapsUI23MUPlaceActionDispatcher_delegate;
  sub_1931F0EAC((uint64_t)v3);
}

- (void)performActionFor:(id)a3 completion:(id)a4
{
  id v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = (uint64_t (*)(uint64_t))sub_1931FEE34;
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_super v8 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *(void *)a3) + 0x50);
  v11 = a3;
  v9 = self;
  uint64_t v10 = v8();
  if ((MUPlaceActionDispatcher.ActionType.buttonItemType.getter(v10) & 0x100000000) != 0) {
    sub_1931FEC50(v11, v6);
  }
  else {
    sub_1931FEAA8(v11, (void (*)(void))v6, v7);
  }
  sub_1931FEDEC((uint64_t)v6);
}

@end