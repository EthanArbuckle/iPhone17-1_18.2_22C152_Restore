@interface DBVolumeSlider
- (_TtC9DashBoard14DBVolumeSlider)init;
- (_TtC9DashBoard14DBVolumeSlider)initWithCoder:(id)a3;
- (_TtC9DashBoard14DBVolumeSlider)initWithFrame:(CGRect)a3;
- (double)continuousSliderCornerRadius;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didChangeSliderValue;
- (void)didEndEditing;
- (void)layoutElasticContentViews;
- (void)minusViewTapped;
- (void)plusViewTapped;
- (void)setContinuousSliderCornerRadius:(double)a3;
@end

@implementation DBVolumeSlider

- (_TtC9DashBoard14DBVolumeSlider)init
{
  return (_TtC9DashBoard14DBVolumeSlider *)sub_22D81C69C();
}

- (_TtC9DashBoard14DBVolumeSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22D81E7BC();
}

- (void)didChangeSliderValue
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.super.isa) + 0xD0);
  v6 = self;
  if (v2())
  {
    uint64_t v4 = v3;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)didEndEditing
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.super.isa) + 0xD0);
  v6 = self;
  if (v2())
  {
    uint64_t v4 = v3;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v4 + 24))(ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC9DashBoard14DBVolumeSlider)initWithFrame:(CGRect)a3
{
  result = (_TtC9DashBoard14DBVolumeSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22D7C465C((uint64_t)self + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_symbolConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider____lazy_storage___maskWidthConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_progressMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_labelMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_symbolMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_symbolView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_backdropLayer));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9DashBoard14DBVolumeSlider_fillLayer);
}

- (void)plusViewTapped
{
}

- (void)minusViewTapped
{
}

- (double)continuousSliderCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DBVolumeSlider();
  [(CCUIBaseSliderView *)&v3 continuousSliderCornerRadius];
  return result;
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DBVolumeSlider();
  id v4 = v6.receiver;
  [(CCUIContinuousSliderView *)&v6 setContinuousSliderCornerRadius:a3];
  id v5 = objc_msgSend(v4, sel_elasticContentView, v6.receiver, v6.super_class);
  objc_msgSend(v4, sel_continuousSliderCornerRadius);
  objc_msgSend(v5, sel__setContinuousCornerRadius_);
}

- (void)layoutElasticContentViews
{
  v2 = self;
  sub_22D81E140();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x180);
  id v8 = a4;
  v9 = self;
  if ((v7() & 1) != 0
    && ([(DBVolumeSlider *)v9 bounds], v14.x = x, v14.double y = y, CGRectContainsPoint(v15, v14)))
  {
  }
  else
  {
    v12.receiver = v9;
    v12.super_class = (Class)type metadata accessor for DBVolumeSlider();
    v10 = (_TtC9DashBoard14DBVolumeSlider *)-[DBVolumeSlider hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v8, x, y);

    v9 = v10;
  }
  return v9;
}

@end