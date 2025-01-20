@interface SearchBar
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (NSArray)keyCommands;
- (_TtC18ASMessagesProvider9SearchBar)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider9SearchBar)initWithFrame:(CGRect)a3;
- (void)handleCancelKeyCommand;
- (void)layoutSubviews;
@end

@implementation SearchBar

- (_TtC18ASMessagesProvider9SearchBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SearchBar();
  v7 = -[SearchBar initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  -[SearchBar _setOverrideContentInsets:forRectEdges:](v7, "_setOverrideContentInsets:forRectEdges:", 1, 28.0, 0.0, 0.0, 0.0);
  return v7;
}

- (_TtC18ASMessagesProvider9SearchBar)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider9SearchBar *)sub_77EB20();
  __break(1u);
  return result;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  v3 = sub_4D0710();

  if (v3)
  {
    sub_FE2C(0, (unint64_t *)&qword_951CB0);
    v4.super.isa = sub_77D880().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleCancelKeyCommand
{
  NSArray v4 = self;
  id v2 = [(SearchBar *)v4 delegate];
  if (v2)
  {
    v3 = v2;
    if ([v2 respondsToSelector:"searchBarCancelButtonClicked:"]) {
      [v3 searchBarCancelButtonClicked:v4];
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchBar();
  id v2 = v3.receiver;
  [(SearchBar *)&v3 layoutSubviews];
  sub_4D09BC();
}

@end