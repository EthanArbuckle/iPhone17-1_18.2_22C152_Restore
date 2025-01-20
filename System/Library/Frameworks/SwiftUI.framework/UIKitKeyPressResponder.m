@interface UIKitKeyPressResponder
- (UIResponder)nextResponder;
- (_TtC7SwiftUI22UIKitKeyPressResponder)init;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIKitKeyPressResponder

- (UIResponder)nextResponder
{
  v3 = (char *)self + OBJC_IVAR____TtC7SwiftUI22UIKitKeyPressResponder_fallbackResponderProvider;
  if (MEMORY[0x18C119DF0]((char *)self + OBJC_IVAR____TtC7SwiftUI22UIKitKeyPressResponder_fallbackResponderProvider, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v8 = (void *)v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
    v8 = 0;
  }

  return (UIResponder *)v8;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI22UIKitKeyPressResponder_fallbackResponderProvider);

  swift_bridgeObjectRelease();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC7SwiftUI22UIKitKeyPressResponder)init
{
  result = (_TtC7SwiftUI22UIKitKeyPressResponder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end