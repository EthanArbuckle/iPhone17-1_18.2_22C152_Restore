@interface IMBTableHeaderView
- (_TtC8Business18IMBTableHeaderView)initWithCoder:(id)a3;
- (_TtC8Business18IMBTableHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation IMBTableHeaderView

- (_TtC8Business18IMBTableHeaderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___separatorView) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8Business18IMBTableHeaderView_separatorColor;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 blackColor];

  result = (_TtC8Business18IMBTableHeaderView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (_TtC8Business18IMBTableHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business18IMBTableHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___separatorView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business18IMBTableHeaderView_separatorColor);
}

@end