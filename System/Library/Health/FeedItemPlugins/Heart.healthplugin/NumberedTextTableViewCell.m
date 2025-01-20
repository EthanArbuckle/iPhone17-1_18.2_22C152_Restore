@interface NumberedTextTableViewCell
- (_TtC5Heart25NumberedTextTableViewCell)initWithCoder:(id)a3;
- (_TtC5Heart25NumberedTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation NumberedTextTableViewCell

- (_TtC5Heart25NumberedTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_240BB6DE0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC5Heart25NumberedTextTableViewCell *)sub_240BACA6C(v4, v5);
}

- (_TtC5Heart25NumberedTextTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC5Heart25NumberedTextTableViewCell_item;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart25NumberedTextTableViewCell____lazy_storage___numberedTextView) = 0;
  id v5 = a3;

  result = (_TtC5Heart25NumberedTextTableViewCell *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_240ACB6D0((uint64_t)self + OBJC_IVAR____TtC5Heart25NumberedTextTableViewCell_item, (unint64_t *)&qword_268C9ECD8, (unint64_t *)&qword_268CA0B00);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Heart25NumberedTextTableViewCell____lazy_storage___numberedTextView);
}

@end