@interface ParagraphCollectionViewCell
- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC22SubscribePageExtension27ParagraphCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension27ParagraphCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ParagraphCollectionViewCell

- (_TtC22SubscribePageExtension27ParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension27ParagraphCollectionViewCell *)sub_1002FB6D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension27ParagraphCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension27ParagraphCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC22SubscribePageExtension27ParagraphCollectionViewCell_expandableTextView;
  sub_10001A860(0, (unint64_t *)&qword_100933F20);
  id v8 = a3;
  v9 = (void *)sub_100768270();
  id v10 = objc_allocWithZone((Class)type metadata accessor for ExpandableTextView());
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)sub_100274308(v9, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC22SubscribePageExtension27ParagraphCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = (char *)v17.receiver;
  [(ParagraphCollectionViewCell *)&v17 layoutSubviews];
  id v3 = objc_msgSend(v2, "contentView", v17.receiver, v17.super_class);
  sub_10001A860(0, (unint64_t *)&qword_100932C80);
  sub_10075C580();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension27ParagraphCollectionViewCell_expandableTextView];
  objc_msgSend(v12, "sizeThatFits:", v9, v11);
  double v14 = v13;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  double MinX = CGRectGetMinX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double MinY = CGRectGetMinY(v19);
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  objc_msgSend(v12, "setFrame:", MinX, MinY, CGRectGetWidth(v20), v14);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1002FBB48();
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension27ParagraphCollectionViewCell_expandableTextView);
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension27ParagraphCollectionViewCell_itemLayoutContext);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension27ParagraphCollectionViewCell_expandableTextView);
}

@end