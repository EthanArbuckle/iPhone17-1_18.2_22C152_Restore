@interface LinkableFooterView
- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LinkableFooterView

- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1007675F0();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView *)sub_1004DCB70(v3, v4);
}

- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = sub_100764BD0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView_linkedLabel;
  uint64_t v11 = qword_100931B10;
  id v12 = a3;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_10001076C(v5, (uint64_t)qword_100994860);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v13, v5);
  id v14 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel());
  *(Class *)((char *)&self->super.super.super.super.isa + v10) = (Class)sub_1000612F8((uint64_t)v9, 0, 0);

  result = (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004DD004();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1004DD2A8((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView_linkedLabel));
}

@end