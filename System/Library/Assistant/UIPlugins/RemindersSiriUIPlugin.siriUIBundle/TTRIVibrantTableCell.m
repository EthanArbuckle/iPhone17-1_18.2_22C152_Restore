@interface TTRIVibrantTableCell
- (_TtC21RemindersSiriUIPlugin20TTRIVibrantTableCell)initWithCoder:(id)a3;
- (_TtC21RemindersSiriUIPlugin20TTRIVibrantTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation TTRIVibrantTableCell

- (void)layoutSubviews
{
  v2 = self;
  sub_B5D4();
}

- (_TtC21RemindersSiriUIPlugin20TTRIVibrantTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_25330();
    NSString v6 = sub_25300();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIVibrantTableCell();
  v7 = [(TTRIVibrantTableCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC21RemindersSiriUIPlugin20TTRIVibrantTableCell)initWithCoder:(id)a3
{
  return (_TtC21RemindersSiriUIPlugin20TTRIVibrantTableCell *)sub_B814(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for TTRIVibrantTableCell);
}

@end