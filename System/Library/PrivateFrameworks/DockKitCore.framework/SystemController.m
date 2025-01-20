@interface SystemController
- (_TtC11DockKitCore16SystemController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6;
- (_TtC11DockKitCore16SystemController)initWithCoder:(id)a3;
- (_TtC11DockKitCore16SystemController)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5;
@end

@implementation SystemController

- (_TtC11DockKitCore16SystemController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6
{
  uint64_t v10 = sub_24CF3B320();
  uint64_t v12 = v11;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore6System_components) = (Class)MEMORY[0x263F8EE80];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore6System_id) = (Class)a4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore6System_type) = (Class)a5;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11DockKitCore6System_name);
  uint64_t *v13 = v10;
  v13[1] = v12;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for System();
  id v14 = a3;
  v15 = [(System *)&v17 init];
  swift_unknownObjectWeakAssign();

  return v15;
}

- (_TtC11DockKitCore16SystemController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v4 = a3;
  v5 = (_TtC11DockKitCore16SystemController *)sub_24CEC00A8();

  return v5;
}

- (_TtC11DockKitCore16SystemController)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5
{
  result = (_TtC11DockKitCore16SystemController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end