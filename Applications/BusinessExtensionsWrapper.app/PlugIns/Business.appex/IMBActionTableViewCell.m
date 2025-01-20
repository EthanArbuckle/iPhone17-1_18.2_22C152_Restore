@interface IMBActionTableViewCell
- (_TtC8Business22IMBActionTableViewCell)initWithCoder:(id)a3;
- (_TtC8Business22IMBActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation IMBActionTableViewCell

- (_TtC8Business22IMBActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8Business22IMBActionTableViewCell *)sub_10005ABCC(a3, (uint64_t)a4, v6);
}

- (_TtC8Business22IMBActionTableViewCell)initWithCoder:(id)a3
{
  return (_TtC8Business22IMBActionTableViewCell *)sub_10005AD2C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business22IMBActionTableViewCell_iconView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business22IMBActionTableViewCell_titleLabel);
}

@end