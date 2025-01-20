@interface TouchesOnScreenCountGestureRecognizer
- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)init;
- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)initWithCoder:(id)a3;
- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TouchesOnScreenCountGestureRecognizer

- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)init
{
  *(void *)((char *)&self->super._gestureFlags
            + OBJC_IVAR____TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer_asvDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TouchesOnScreenCountGestureRecognizer();
  v3 = [(TouchesOnScreenCountGestureRecognizer *)&v5 initWithTarget:0 action:0];
  [(TouchesOnScreenCountGestureRecognizer *)v3 setCancelsTouchesInView:0];
  [(TouchesOnScreenCountGestureRecognizer *)v3 setDelaysTouchesEnded:0];
  [(TouchesOnScreenCountGestureRecognizer *)v3 setState:0];

  return v3;
}

- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super._gestureFlags
            + OBJC_IVAR____TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer_asvDelegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *)sub_1E2994D88();
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_1E294A574();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1E294A4DC();
  sub_1E294A51C();
  uint64_t v6 = sub_1E29945A8();
  id v7 = a4;
  v8 = self;
  sub_1E294A660(v6);

  swift_bridgeObjectRelease();
}

- (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1E2994958();
    swift_unknownObjectRelease();
  }
  result = (_TtC11AssetViewer37TouchesOnScreenCountGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end