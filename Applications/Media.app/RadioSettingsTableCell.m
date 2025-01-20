@interface RadioSettingsTableCell
- (_TtC5Media22RadioSettingsTableCell)initWithCoder:(id)a3;
- (_TtC5Media22RadioSettingsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation RadioSettingsTableCell

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100036D10(a3, a4, (SEL *)&selRef_setSelected_animated_);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100036D10(a3, a4, (SEL *)&selRef_setHighlighted_animated_);
}

- (_TtC5Media22RadioSettingsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Media22RadioSettingsTableCell_enabled) = 1;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
    *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Media22RadioSettingsTableCell_enabled) = 1;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RadioSettingsTableCell();
  v7 = [(RadioSettingsTableCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC5Media22RadioSettingsTableCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Media22RadioSettingsTableCell_enabled) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RadioSettingsTableCell();
  return [(RadioSettingsTableCell *)&v5 initWithCoder:a3];
}

@end