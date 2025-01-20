@interface TitleWithSubtitleView
- (_TtC19HealthMedicationsUI21TitleWithSubtitleView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI21TitleWithSubtitleView)initWithFrame:(CGRect)a3;
@end

@implementation TitleWithSubtitleView

- (_TtC19HealthMedicationsUI21TitleWithSubtitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_customConstraints) = (Class)MEMORY[0x1E4FBC860];
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_item;
  v9 = (objc_class *)type metadata accessor for TitleWithSubtitleView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[TitleWithSubtitleView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C1FEB3AC();

  return v10;
}

- (_TtC19HealthMedicationsUI21TitleWithSubtitleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_customConstraints) = (Class)MEMORY[0x1E4FBC860];
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI21TitleWithSubtitleView *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_item;

  sub_1C1F374E4((uint64_t)v3);
}

@end