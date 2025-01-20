@interface HPRFSubtitleMultilineCell
+ (int64_t)cellStyle;
- (HPRFSubtitleMultilineCell)initWithCoder:(id)a3;
- (HPRFSubtitleMultilineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HPRFSubtitleMultilineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HPRFSubtitleMultilineCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SubtitleMultilineCell();
  id v4 = v8.receiver;
  id v5 = a3;
  [(HPRFSubtitleMultilineCell *)&v8 refreshCellContentsWithSpecifier:v5];
  id v6 = objc_msgSend(v4, "detailTextLabel", v8.receiver, v8.super_class);
  if (v6)
  {
    id v7 = v6;
    [v6 setNumberOfLines:0];

    id v5 = v4;
    id v4 = v7;
  }
}

- (HPRFSubtitleMultilineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_20290();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (HPRFSubtitleMultilineCell *)sub_1B3A8(a3, v7, v9, a5);
}

- (HPRFSubtitleMultilineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_20290();
    NSString v6 = sub_20280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SubtitleMultilineCell();
  uint64_t v7 = [(HPRFSubtitleMultilineCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (HPRFSubtitleMultilineCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SubtitleMultilineCell();
  return [(HPRFSubtitleMultilineCell *)&v5 initWithCoder:a3];
}

@end