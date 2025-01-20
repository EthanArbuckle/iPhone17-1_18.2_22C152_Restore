@interface DragGestureRecognizer
- (_TtC19_RealityKit_SwiftUI21DragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)onPanInternal:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation DragGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)onPanInternal:(id)a3
{
  id v4 = a3;
  v13 = self;
  id v5 = [(DragGestureRecognizer *)v13 view];
  objc_msgSend(v4, sel_locationInView_, v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  v10 = (char *)v13 + OBJC_IVAR____TtC19_RealityKit_SwiftUI21DragGestureRecognizer_draggable;
  if (MEMORY[0x24C5349C0]((char *)v13 + OBJC_IVAR____TtC19_RealityKit_SwiftUI21DragGestureRecognizer_draggable))
  {
    uint64_t v11 = *((void *)v10 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v11 + 24))(v7, v9, 0, ObjectType, v11);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC19_RealityKit_SwiftUI21DragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC19_RealityKit_SwiftUI21DragGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end