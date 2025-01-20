@interface SearchTransparencyView
- (_TtC22SubscribePageExtension22SearchTransparencyView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension22SearchTransparencyView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SearchTransparencyView

- (_TtC22SubscribePageExtension22SearchTransparencyView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension22SearchTransparencyView *)sub_100010154(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension22SearchTransparencyView)initWithCoder:(id)a3
{
  uint64_t v5 = sub_100764BD0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC22SubscribePageExtension22SearchTransparencyView_linkedLabel;
  uint64_t v11 = qword_1009319D8;
  id v12 = a3;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_10001076C(v5, (uint64_t)qword_1009944B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v13, v5);
  id v14 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel());
  *(Class *)((char *)&self->super.super.super.super.isa + v10) = (Class)sub_1000612F8((uint64_t)v9, 0, 0);

  result = (_TtC22SubscribePageExtension22SearchTransparencyView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100010578();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchTransparencyView();
  id v2 = v3.receiver;
  [(SearchTransparencyView *)&v3 prepareForReuse];
  sub_100061A9C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22SearchTransparencyView_linkedLabel));
}

@end