@interface DataTypeTileHeaderView
- (_TtC18HealthExperienceUI22DataTypeTileHeaderView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI22DataTypeTileHeaderView)initWithFrame:(CGRect)a3;
- (id)accessibilityAccessoryLabel;
- (void)didReceiveSignificantTimeChangeNotification:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTitleText;
@end

@implementation DataTypeTileHeaderView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD1B4860(a3);
}

- (_TtC18HealthExperienceUI22DataTypeTileHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI22DataTypeTileHeaderView *)DataTypeTileHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI22DataTypeTileHeaderView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI22DataTypeTileHeaderView *)DataTypeTileHeaderView.init(coder:)(a3);
}

- (void)didReceiveSignificantTimeChangeNotification:(id)a3
{
  uint64_t v4 = sub_1AD739E80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD739E30();
  v8 = self;
  sub_1AD56B4CC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)accessibilityAccessoryLabel
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_accessoryLabel);
  swift_beginAccess();
  return *v2;
}

- (void)updateTitleText
{
  v2 = self;
  sub_1AD1ECCF4();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_heightConstraint));
  sub_1AD21C678((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_currentTileHeaderDetailKind, &qword_1EB741758, (uint64_t (*)(uint64_t))type metadata accessor for TileHeaderDetailKind);
  sub_1AD1AB454((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_dataSource, &qword_1EB73EDB0, (uint64_t)&qword_1EB73EDA8, (uint64_t)&protocol descriptor for TileHeaderDataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_accessoryLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_detailContainerView);
}

@end