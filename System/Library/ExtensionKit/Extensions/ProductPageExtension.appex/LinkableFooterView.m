@interface LinkableFooterView
- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LinkableFooterView

- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_10077BCB0();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView *)sub_100418A48(v3, v4);
}

- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = sub_100779230();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView_linkedLabel;
  uint64_t v10 = qword_100949950;
  id v11 = a3;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_10000D2C4(v5, (uint64_t)qword_1009ACCE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  id v13 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel());
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_100512298((uint64_t)v8, 0, 0);

  result = (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100418EDC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100419180((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView_linkedLabel));
}

@end