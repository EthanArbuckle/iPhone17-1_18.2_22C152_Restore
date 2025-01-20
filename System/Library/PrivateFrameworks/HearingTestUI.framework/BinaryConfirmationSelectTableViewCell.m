@interface BinaryConfirmationSelectTableViewCell
- (_TtC13HearingTestUI37BinaryConfirmationSelectTableViewCell)initWithCoder:(id)a3;
- (_TtC13HearingTestUI37BinaryConfirmationSelectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation BinaryConfirmationSelectTableViewCell

- (_TtC13HearingTestUI37BinaryConfirmationSelectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_251444C20();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  sub_2513DA324(v4, v5);
  return result;
}

- (_TtC13HearingTestUI37BinaryConfirmationSelectTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2513DA4E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI37BinaryConfirmationSelectTableViewCell_accessoryImage));
  id v3 = (char *)self + OBJC_IVAR____TtC13HearingTestUI37BinaryConfirmationSelectTableViewCell_item;

  sub_2513ACE7C((uint64_t)v3);
}

@end