@interface IMBContentHeaderView
- (_TtC8Business20IMBContentHeaderView)init;
- (_TtC8Business20IMBContentHeaderView)initWithCoder:(id)a3;
- (_TtC8Business20IMBContentHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation IMBContentHeaderView

- (_TtC8Business20IMBContentHeaderView)init
{
  return (_TtC8Business20IMBContentHeaderView *)sub_100059854();
}

- (_TtC8Business20IMBContentHeaderView)initWithCoder:(id)a3
{
  return (_TtC8Business20IMBContentHeaderView *)sub_100059B80(a3);
}

- (_TtC8Business20IMBContentHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business20IMBContentHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBContentHeaderView_separatorColor));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBContentHeaderView_subtitleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business20IMBContentHeaderView_separator);
}

@end