@interface OneFingerDragRepresentable.Coordinator
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator)init;
@end

@implementation OneFingerDragRepresentable.Coordinator

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_24966AC2C(v7);

  return v9;
}

- (_TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator)init
{
  result = (_TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtCV11CalculateUI26OneFingerDragRepresentable11Coordinator_converter;
  uint64_t v3 = sub_24969F768();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end