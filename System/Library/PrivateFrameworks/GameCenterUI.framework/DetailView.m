@interface DetailView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI10DetailView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI10DetailView)initWithFrame:(CGRect)a3;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)wasTapped;
@end

@implementation DetailView

- (_TtC12GameCenterUI10DetailView)initWithFrame:(CGRect)a3
{
  sub_1AF566C14();
  return result;
}

- (_TtC12GameCenterUI10DetailView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF5671C0();
}

- (void)wasTapped
{
  v2 = self;
  sub_1AF567C6C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF567D1C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  double v8 = sub_1AF568074(a4, width);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)didTapWithAccessoryView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF5683EC((uint64_t)v4);
}

- (void).cxx_destruct
{
  sub_1AF3726B0((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI10DetailView_accessory, &qword_1E9AC51C8);
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI10DetailView_accessoryAction));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI10DetailView_selectionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI10DetailView_tapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI10DetailView_gameControllerSelectHandler);

  sub_1AF368930(v3);
}

@end