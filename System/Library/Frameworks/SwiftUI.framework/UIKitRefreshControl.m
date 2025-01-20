@interface UIKitRefreshControl
- (_TtC7SwiftUI19UIKitRefreshControl)init;
- (_TtC7SwiftUI19UIKitRefreshControl)initWithCoder:(id)a3;
- (_TtC7SwiftUI19UIKitRefreshControl)initWithFrame:(CGRect)a3;
- (void)_swiftui_handleRefreshControl;
- (void)dealloc;
@end

@implementation UIKitRefreshControl

- (_TtC7SwiftUI19UIKitRefreshControl)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI19UIKitRefreshControl_currentTask) = 0;
  id v4 = a3;

  result = (_TtC7SwiftUI19UIKitRefreshControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI19UIKitRefreshControl_currentTask))
  {
    id v4 = self;
    uint64_t v5 = swift_retain();
    MEMORY[0x18C115EE0](v5, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC278]);
    swift_release();
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = ObjectType;
  [(UIRefreshControl *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)_swiftui_handleRefreshControl
{
  v2 = self;
  UIKitRefreshControl._swiftui_handleRefreshControl()();
}

- (_TtC7SwiftUI19UIKitRefreshControl)init
{
  result = (_TtC7SwiftUI19UIKitRefreshControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI19UIKitRefreshControl)initWithFrame:(CGRect)a3
{
  result = (_TtC7SwiftUI19UIKitRefreshControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end