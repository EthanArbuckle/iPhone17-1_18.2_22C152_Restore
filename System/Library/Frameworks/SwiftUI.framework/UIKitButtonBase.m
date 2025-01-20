@interface UIKitButtonBase
- (_TtC7SwiftUI15UIKitButtonBase)initWithCoder:(id)a3;
- (_TtC7SwiftUI15UIKitButtonBase)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation UIKitButtonBase

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v9 = MEMORY[0x18C119DF0]((char *)self + OBJC_IVAR____TtC7SwiftUI15UIKitButtonBase_delegate, a2);
  id v10 = a3;
  id v11 = a4;
  swift_unknownObjectRetain();
  v12 = self;
  if (v9)
  {
    Coordinator.menuWillShow(interaction:)();
    swift_unknownObjectRelease();
  }
  v13.receiver = v12;
  v13.super_class = (Class)type metadata accessor for UIKitButtonBase();
  [(UIKitButtonBase *)&v13 contextMenuInteraction:v10 willDisplayMenuForConfiguration:v11 animator:a5];

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  UIKitButtonBase.contextMenuInteraction(_:willEndFor:animator:)((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (_TtC7SwiftUI15UIKitButtonBase)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC7SwiftUI15UIKitButtonBase_delegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UIKitButtonBase();
  return -[UIKitButtonBase initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI15UIKitButtonBase)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC7SwiftUI15UIKitButtonBase_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UIKitButtonBase();
  return [(UIKitButtonBase *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end