@interface DismissibleTileHeaderView
- (_TtC18HealthExperienceUI25DismissibleTileHeaderView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI25DismissibleTileHeaderView)initWithFrame:(CGRect)a3;
- (id)accessibilityAccessoryLabel;
- (void)didReceiveSignificantTimeChangeNotification:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DismissibleTileHeaderView

- (void)didReceiveSignificantTimeChangeNotification:(id)a3
{
  uint64_t v4 = sub_1AD739E80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD739E30();
  v8 = self;
  sub_1AD6A95C0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1AD6AC890(a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1AD2147D4(0, (unint64_t *)&qword_1E9A2DE88);
  sub_1AD6336A8();
  sub_1AD73F720();
  uint64_t v6 = self;
  id v7 = a4;
  v8 = (void *)sub_1AD73F710();
  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for DismissibleTileHeaderView();
  [(DismissibleTileHeaderView *)&v12 touchesCancelled:v8 withEvent:v7];

  uint64_t v9 = (void **)((char *)&v6->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryLabel);
  swift_beginAccess();
  v10 = *v9;
  if (v10)
  {
    v11 = (Class *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryColor);
    swift_beginAccess();
    objc_msgSend(v10, sel_setTextColor_, *v11);
  }

  swift_bridgeObjectRelease();
}

- (id)accessibilityAccessoryLabel
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryLabel);
  swift_beginAccess();
  return *v2;
}

- (_TtC18HealthExperienceUI25DismissibleTileHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI25DismissibleTileHeaderView *)DismissibleTileHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI25DismissibleTileHeaderView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI25DismissibleTileHeaderView *)DismissibleTileHeaderView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_heightConstraint));
  sub_1AD1AB4C4((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_dataSource, &qword_1EB73EDB0, (uint64_t)&qword_1EB73EDA8, (uint64_t)&protocol descriptor for TileHeaderDataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_detailContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessorySeparator));
  swift_bridgeObjectRelease();
}

@end