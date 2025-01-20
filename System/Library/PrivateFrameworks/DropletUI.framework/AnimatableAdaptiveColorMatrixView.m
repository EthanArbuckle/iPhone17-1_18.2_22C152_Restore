@interface AnimatableAdaptiveColorMatrixView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView)initWithCoder:(id)a3;
- (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView)initWithFrame:(CGRect)a3;
@end

@implementation AnimatableAdaptiveColorMatrixView

+ (Class)layerClass
{
  sub_24D114FEC(0, &qword_26B1894C0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView)initWithFrame:(CGRect)a3
{
  return (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView *)sub_24D13A254(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  id v5 = a3;

  result = (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView *)sub_24D149448();
  __break(1u);
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_24D149268();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = qword_26B189298;
  v8 = self;
  if (v7 == -1)
  {
    if (v6) {
      goto LABEL_6;
    }
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  swift_once();
  if (!v6) {
    goto LABEL_14;
  }
LABEL_6:
  BOOL v9 = v4 == qword_26B189BF0 && v6 == *(void *)algn_26B189BF8;
  if (!v9 && (sub_24D1494C8() & 1) == 0)
  {
    v11 = (void *)sub_24D149258();
LABEL_15:
    v13.receiver = v8;
    v13.super_class = (Class)type metadata accessor for AnimatableAdaptiveColorMatrixView();
    BOOL v10 = [(AnimatableAdaptiveColorMatrixView *)&v13 _shouldAnimatePropertyWithKey:v11];

    swift_bridgeObjectRelease();
    return v10;
  }

  swift_bridgeObjectRelease();
  return 1;
}

@end