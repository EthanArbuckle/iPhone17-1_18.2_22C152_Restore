@interface IMBAuthenticationHeaderView
- (_TtC8Business27IMBAuthenticationHeaderView)init;
- (_TtC8Business27IMBAuthenticationHeaderView)initWithCoder:(id)a3;
- (_TtC8Business27IMBAuthenticationHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation IMBAuthenticationHeaderView

- (_TtC8Business27IMBAuthenticationHeaderView)init
{
  uint64_t v3 = OBJC_IVAR____TtC8Business27IMBAuthenticationHeaderView_messageLabel;
  id v4 = objc_allocWithZone((Class)UILabel);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)[v4 init];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for IMBAuthenticationHeaderView();
  v6 = -[IMBAuthenticationHeaderView initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_100046C1C();
  sub_100046D88();

  return v6;
}

- (_TtC8Business27IMBAuthenticationHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Business27IMBAuthenticationHeaderView_messageLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC8Business27IMBAuthenticationHeaderView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (_TtC8Business27IMBAuthenticationHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business27IMBAuthenticationHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business27IMBAuthenticationHeaderView_messageLabel));
}

@end