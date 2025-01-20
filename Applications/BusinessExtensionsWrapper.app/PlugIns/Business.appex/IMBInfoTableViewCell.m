@interface IMBInfoTableViewCell
- (_TtC8Business20IMBInfoTableViewCell)initWithCoder:(id)a3;
- (_TtC8Business20IMBInfoTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation IMBInfoTableViewCell

- (_TtC8Business20IMBInfoTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8Business20IMBInfoTableViewCell *)sub_100091FB0(a3, (uint64_t)a4, v6);
}

- (_TtC8Business20IMBInfoTableViewCell)initWithCoder:(id)a3
{
  return (_TtC8Business20IMBInfoTableViewCell *)sub_100092104(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBInfoTableViewCell_leftLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Business20IMBInfoTableViewCell_rightLabel);
}

@end