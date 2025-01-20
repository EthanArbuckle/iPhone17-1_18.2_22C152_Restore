@interface LinkableHeaderCollectionViewCell
- (_TtC22SubscribePageExtension32LinkableHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32LinkableHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LinkableHeaderCollectionViewCell

- (_TtC22SubscribePageExtension32LinkableHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32LinkableHeaderCollectionViewCell *)sub_10000B9C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32LinkableHeaderCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension32LinkableHeaderCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for LinkableHeaderCollectionViewCell();
  v2 = (char *)v12.receiver;
  [(LinkableHeaderCollectionViewCell *)&v12 layoutSubviews];
  id v3 = objc_msgSend(v2, "contentView", v12.receiver, v12.super_class);
  sub_10000D514();
  sub_10075C580();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension32LinkableHeaderCollectionViewCell_headerView], "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32LinkableHeaderCollectionViewCell_headerView));
}

@end