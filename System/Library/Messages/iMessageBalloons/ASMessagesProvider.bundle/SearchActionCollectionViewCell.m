@interface SearchActionCollectionViewCell
- (_TtC18ASMessagesProvider30SearchActionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30SearchActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC5JetUI12DynamicLabel)accessibilityTextLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SearchActionCollectionViewCell

- (_TtC18ASMessagesProvider30SearchActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30SearchActionCollectionViewCell *)sub_6B90FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider30SearchActionCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider30SearchActionCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC18ASMessagesProvider30SearchActionCollectionViewCell_actionContentView;
  id v8 = objc_allocWithZone((Class)type metadata accessor for SearchActionContentView(0));
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC18ASMessagesProvider30SearchActionCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchActionCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(SearchActionCollectionViewCell *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider30SearchActionCollectionViewCell_actionContentView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchActionCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(SearchActionCollectionViewCell *)&v4 prepareForReuse];
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider30SearchActionCollectionViewCell_actionContentView];
  sub_76E280();
  objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC18ASMessagesProvider23SearchActionContentView_linkLabel), "setText:", 0, v4.receiver, v4.super_class);
}

- (_TtC5JetUI12DynamicLabel)accessibilityTextLabel
{
  return (_TtC5JetUI12DynamicLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC18ASMessagesProvider30SearchActionCollectionViewCell_actionContentView)
                                                                             + OBJC_IVAR____TtC18ASMessagesProvider23SearchActionContentView_linkLabel));
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30SearchActionCollectionViewCell_itemLayoutContext);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider30SearchActionCollectionViewCell_actionContentView);
}

@end