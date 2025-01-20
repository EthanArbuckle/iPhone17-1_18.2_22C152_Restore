@interface SearchResultCollectionViewCell
- (_TtC22SubscribePageExtension30SearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30SearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SearchResultCollectionViewCell

- (_TtC22SubscribePageExtension30SearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30SearchResultCollectionViewCell *)sub_100304044(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30SearchResultCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30SearchResultCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension30SearchResultCollectionViewCell_resultContents);
  void *v7 = 0;
  v7[1] = 0;
  swift_weakInit();
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension30SearchResultCollectionViewCell_impressionsUpdateBlock);
  void *v8 = 0;
  v8[1] = 0;
  id v9 = a3;

  result = (_TtC22SubscribePageExtension30SearchResultCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100305084();
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchResultCollectionViewCell();
  v2 = (char *)v8.receiver;
  [(SearchResultCollectionViewCell *)&v8 prepareForReuse];
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension30SearchResultCollectionViewCell_resultContents];
  if (v3)
  {
    uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension30SearchResultCollectionViewCell_resultContents + 8];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 40);
    v7 = v3;
    v6(ObjectType, v4);

    v2 = v7;
  }
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30SearchResultCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30SearchResultCollectionViewCell_resultContents));
  swift_weakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension30SearchResultCollectionViewCell_impressionsUpdateBlock);

  sub_10001A4D0(v3);
}

@end