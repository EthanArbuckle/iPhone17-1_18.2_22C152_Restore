@interface SearchTransparencyView
- (_TtC20ProductPageExtension22SearchTransparencyView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension22SearchTransparencyView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SearchTransparencyView

- (_TtC20ProductPageExtension22SearchTransparencyView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension22SearchTransparencyView *)sub_1004CF9B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension22SearchTransparencyView)initWithCoder:(id)a3
{
  uint64_t v5 = sub_100779230();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC20ProductPageExtension22SearchTransparencyView_linkedLabel;
  uint64_t v10 = qword_100949818;
  id v11 = a3;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_10000D2C4(v5, (uint64_t)qword_1009AC938);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  id v13 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel());
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_100512298((uint64_t)v8, 0, 0);

  result = (_TtC20ProductPageExtension22SearchTransparencyView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004CFDDC();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchTransparencyView();
  id v2 = v3.receiver;
  [(SearchTransparencyView *)&v3 prepareForReuse];
  sub_100512A3C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22SearchTransparencyView_linkedLabel));
}

@end