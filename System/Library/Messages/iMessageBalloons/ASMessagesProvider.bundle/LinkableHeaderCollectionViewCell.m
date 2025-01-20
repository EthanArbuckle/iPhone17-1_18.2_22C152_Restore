@interface LinkableHeaderCollectionViewCell
- (_TtC18ASMessagesProvider32LinkableHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider32LinkableHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LinkableHeaderCollectionViewCell

- (_TtC18ASMessagesProvider32LinkableHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider32LinkableHeaderCollectionViewCell *)sub_1230D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider32LinkableHeaderCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider32LinkableHeaderCollectionViewCell *)sub_77EB20();
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
  sub_2C368();
  sub_772580();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18ASMessagesProvider32LinkableHeaderCollectionViewCell_headerView], "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32LinkableHeaderCollectionViewCell_headerView));
}

@end