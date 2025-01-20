@interface PlacardHeaderView
- (_TtC15JournalSettings17PlacardHeaderView)initWithCoder:(id)a3;
- (_TtC15JournalSettings17PlacardHeaderView)initWithReuseIdentifier:(id)a3;
- (_TtC15JournalSettings17PlacardHeaderView)initWithSpecifier:(id)a3;
- (void)refreshContentsWithSpecifier:(id)a3;
@end

@implementation PlacardHeaderView

- (_TtC15JournalSettings17PlacardHeaderView)initWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlacardHeaderView();
  id v4 = a3;
  v5 = [(PlacardHeaderView *)&v7 initWithReuseIdentifier:0];
  sub_12910C(v4);

  return v5;
}

- (_TtC15JournalSettings17PlacardHeaderView)initWithCoder:(id)a3
{
  return 0;
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_12910C(v4);
}

- (_TtC15JournalSettings17PlacardHeaderView)initWithReuseIdentifier:(id)a3
{
  result = (_TtC15JournalSettings17PlacardHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end