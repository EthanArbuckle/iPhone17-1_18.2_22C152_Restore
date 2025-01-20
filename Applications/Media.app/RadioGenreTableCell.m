@interface RadioGenreTableCell
- (_TtC5Media19RadioGenreTableCell)initWithCoder:(id)a3;
- (_TtC5Media19RadioGenreTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation RadioGenreTableCell

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100033858(a3, a4, (SEL *)&selRef_setHighlighted_animated_);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100033858(a3, a4, (SEL *)&selRef_setSelected_animated_);
}

- (_TtC5Media19RadioGenreTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RadioGenreTableCell();
  v7 = [(RadioGenreTableCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC5Media19RadioGenreTableCell)initWithCoder:(id)a3
{
  return (_TtC5Media19RadioGenreTableCell *)sub_100037530(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for RadioGenreTableCell);
}

@end