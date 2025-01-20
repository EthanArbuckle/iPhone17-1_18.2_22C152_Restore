@interface MacTableHeaderView
- (_TtC8Business18MacTableHeaderView)init;
- (_TtC8Business18MacTableHeaderView)initWithCoder:(id)a3;
- (_TtC8Business18MacTableHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation MacTableHeaderView

- (_TtC8Business18MacTableHeaderView)init
{
  return (_TtC8Business18MacTableHeaderView *)sub_100014D4C();
}

- (_TtC8Business18MacTableHeaderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___separatorView) = 0;
  id v4 = a3;

  result = (_TtC8Business18MacTableHeaderView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (_TtC8Business18MacTableHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business18MacTableHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___subtitleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Business18MacTableHeaderView____lazy_storage___separatorView);
}

@end