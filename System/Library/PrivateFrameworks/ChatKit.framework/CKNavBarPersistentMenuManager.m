@interface CKNavBarPersistentMenuManager
- (_TtC7ChatKit22CKPersistentMenuButton)button;
- (_TtC7ChatKit29CKNavBarPersistentMenuManager)init;
- (_TtC7ChatKit29CKNavBarPersistentMenuManager)initWithDelegate:(id)a3;
- (void)setButton:(id)a3;
- (void)setupWithPersistentMenu:(id)a3;
@end

@implementation CKNavBarPersistentMenuManager

- (_TtC7ChatKit22CKPersistentMenuButton)button
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit29CKNavBarPersistentMenuManager_button);
  swift_beginAccess();
  return (_TtC7ChatKit22CKPersistentMenuButton *)*v2;
}

- (void)setButton:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit29CKNavBarPersistentMenuManager_button);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC7ChatKit29CKNavBarPersistentMenuManager)initWithDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit29CKNavBarPersistentMenuManager_button) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit29CKNavBarPersistentMenuManager_delegate) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CKNavBarPersistentMenuManager();
  swift_unknownObjectRetain();
  return [(CKNavBarPersistentMenuManager *)&v4 init];
}

- (void)setupWithPersistentMenu:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_18F53324C(a3);
}

- (_TtC7ChatKit29CKNavBarPersistentMenuManager)init
{
  result = (_TtC7ChatKit29CKNavBarPersistentMenuManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end