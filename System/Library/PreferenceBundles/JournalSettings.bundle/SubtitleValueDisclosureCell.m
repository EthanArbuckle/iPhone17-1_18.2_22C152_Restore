@interface SubtitleValueDisclosureCell
+ (int64_t)cellStyle;
- (NSString)accessibilityHint;
- (NSString)accessibilityValue;
- (_TtC15JournalSettings27SubtitleValueDisclosureCell)initWithCoder:(id)a3;
- (_TtC15JournalSettings27SubtitleValueDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC15JournalSettings27SubtitleValueDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation SubtitleValueDisclosureCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1248BC(v4);
}

- (NSString)accessibilityValue
{
  v2 = self;
  v3 = (NSString *)[(SubtitleValueDisclosureCell *)v2 _badgeText];
  if (v3
    || (v7.receiver = v2,
        v7.super_class = (Class)type metadata accessor for SubtitleValueDisclosureCell(),
        (v3 = [(SubtitleValueDisclosureCell *)&v7 accessibilityValue]) != 0))
  {
    id v4 = v3;
    sub_145BC0();

    NSString v5 = sub_145B80();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSString)accessibilityHint
{
  v2 = self;
  sub_124DE0();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_145B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityHint:(id)a3
{
}

- (_TtC15JournalSettings27SubtitleValueDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_145BC0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC15JournalSettings27SubtitleValueDisclosureCell *)sub_124F38(a3, v7, v9, a5);
}

- (_TtC15JournalSettings27SubtitleValueDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_145BC0();
    NSString v6 = sub_145B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SubtitleValueDisclosureCell();
  uint64_t v7 = [(SubtitleValueDisclosureCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC15JournalSettings27SubtitleValueDisclosureCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SubtitleValueDisclosureCell();
  return [(SubtitleValueDisclosureCell *)&v5 initWithCoder:a3];
}

@end