@interface TitleDetailsView
- (_TtC5Heart16TitleDetailsView)initWithCoder:(id)a3;
- (_TtC5Heart16TitleDetailsView)initWithFrame:(CGRect)a3;
@end

@implementation TitleDetailsView

- (_TtC5Heart16TitleDetailsView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart16TitleDetailsView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart16TitleDetailsView____lazy_storage___detailLabel) = 0;
  id v4 = a3;

  result = (_TtC5Heart16TitleDetailsView *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (_TtC5Heart16TitleDetailsView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Heart16TitleDetailsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16TitleDetailsView____lazy_storage___titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Heart16TitleDetailsView____lazy_storage___detailLabel);
}

@end