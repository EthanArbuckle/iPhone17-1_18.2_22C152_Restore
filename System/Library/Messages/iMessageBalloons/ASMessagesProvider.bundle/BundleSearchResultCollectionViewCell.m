@interface BundleSearchResultCollectionViewCell
- (_TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BundleSearchResultCollectionViewCell

- (_TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell *)sub_5C7E74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell_bundleView;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BundleView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BundleSearchResultCollectionViewCell();
  id v2 = v6.receiver;
  id v3 = [(BundleSearchResultCollectionViewCell *)&v6 prepareForReuse];
  sub_12DFAC((uint64_t)v3, v4, v5);
  sub_32E0A8();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_5C8190();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell_lockupView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider36BundleSearchResultCollectionViewCell_bundleView);
}

@end