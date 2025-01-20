@interface MacListPickerTableViewCell
- (_TtC8Business26MacListPickerTableViewCell)initWithCoder:(id)a3;
- (_TtC8Business26MacListPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation MacListPickerTableViewCell

- (_TtC8Business26MacListPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1000BBAC8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC8Business26MacListPickerTableViewCell *)sub_10006FFD8(a3, (uint64_t)a4, v6);
}

- (_TtC8Business26MacListPickerTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100071C80();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1000BB548();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB528();
  v9 = self;
  sub_10007109C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_checkmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_checkmarkPlacholderView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell____lazy_storage___separatorView);
}

@end