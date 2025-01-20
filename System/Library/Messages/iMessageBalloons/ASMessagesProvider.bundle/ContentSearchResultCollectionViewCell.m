@interface ContentSearchResultCollectionViewCell
- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ContentSearchResultCollectionViewCell

- (_TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell *)sub_251DEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell_screenshots;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)type metadata accessor for LockupMediaView()) init];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell_preferredImageSizes) = (Class)_swiftEmptyDictionarySingleton;

  result = (_TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2520D8();
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ContentSearchResultCollectionViewCell();
  v2 = (char *)v7.receiver;
  id v3 = [(ContentSearchResultCollectionViewCell *)&v7 prepareForReuse];
  sub_12DFAC((uint64_t)v3, v4, v5);
  id v6 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell_screenshots];
  sub_566774();
  objc_msgSend(v6, "setHidden:", 0, v7.receiver, v7.super_class);
}

- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider37ContentSearchResultCollectionViewCell_screenshots));

  swift_bridgeObjectRelease();
}

@end