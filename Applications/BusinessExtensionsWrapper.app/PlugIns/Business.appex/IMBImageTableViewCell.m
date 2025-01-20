@interface IMBImageTableViewCell
- (_TtC8Business21IMBImageTableViewCell)initWithCoder:(id)a3;
- (_TtC8Business21IMBImageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation IMBImageTableViewCell

- (_TtC8Business21IMBImageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8Business21IMBImageTableViewCell *)sub_10008FE4C(a3, (uint64_t)a4, v6);
}

- (_TtC8Business21IMBImageTableViewCell)initWithCoder:(id)a3
{
  return (_TtC8Business21IMBImageTableViewCell *)sub_10008FF7C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business21IMBImageTableViewCell_largeImageView));
}

@end