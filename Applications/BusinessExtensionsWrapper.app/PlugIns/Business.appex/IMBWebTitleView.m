@interface IMBWebTitleView
- (_TtC8Business15IMBWebTitleView)init;
- (_TtC8Business15IMBWebTitleView)initWithCoder:(id)a3;
- (_TtC8Business15IMBWebTitleView)initWithFrame:(CGRect)a3;
@end

@implementation IMBWebTitleView

- (_TtC8Business15IMBWebTitleView)init
{
  uint64_t v3 = OBJC_IVAR____TtC8Business15IMBWebTitleView_titleLabel;
  id v4 = objc_allocWithZone((Class)UILabel);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)[v4 init];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for IMBWebTitleView();
  v6 = -[IMBWebTitleView initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_10008D464();
  sub_10008D740();

  return v6;
}

- (_TtC8Business15IMBWebTitleView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Business15IMBWebTitleView_titleLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC8Business15IMBWebTitleView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (_TtC8Business15IMBWebTitleView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business15IMBWebTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end