@interface BinaryConfirmationSelectTableViewCell
- (_TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell)initWithCoder:(id)a3;
- (_TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation BinaryConfirmationSelectTableViewCell

- (_TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_25126C488();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  sub_251246D80(v4, v5);
  return result;
}

- (_TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_251246FBC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI37BinaryConfirmationSelectTableViewCell_accessoryImage));
}

@end