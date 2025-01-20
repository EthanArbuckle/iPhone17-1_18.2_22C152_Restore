@interface FootnoteCollectionViewCell
- (BOOL)isHighlighted;
- (_TtC22SubscribePageExtension12FootnoteView)accessibilityFootnoteView;
- (_TtC22SubscribePageExtension26FootnoteCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension26FootnoteCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation FootnoteCollectionViewCell

- (_TtC22SubscribePageExtension26FootnoteCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26FootnoteCollectionViewCell *)sub_10026EF88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26FootnoteCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension26FootnoteCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC22SubscribePageExtension26FootnoteCollectionViewCell_footnoteView;
  type metadata accessor for FootnoteView();
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 init];

  result = (_TtC22SubscribePageExtension26FootnoteCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10026F1FC();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(FootnoteCollectionViewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension26FootnoteCollectionViewCell_footnoteView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  sub_10000D514();
  sub_10075C580();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(FootnoteCollectionViewCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_10026F474(a3);
}

- (_TtC22SubscribePageExtension12FootnoteView)accessibilityFootnoteView
{
  return (_TtC22SubscribePageExtension12FootnoteView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                               + OBJC_IVAR____TtC22SubscribePageExtension26FootnoteCollectionViewCell_footnoteView));
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension26FootnoteCollectionViewCell_itemLayoutContext);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension26FootnoteCollectionViewCell_footnoteView);
}

@end