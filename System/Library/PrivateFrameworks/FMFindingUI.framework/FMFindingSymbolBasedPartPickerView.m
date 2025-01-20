@interface FMFindingSymbolBasedPartPickerView
- (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)toggle;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMFindingSymbolBasedPartPickerView

- (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_stackView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_value;
  *((void *)v8 + 4) = 0;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;

  result = (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView *)sub_24D39D2B0();
  __break(1u);
  return result;
}

- (void)toggle
{
  v2 = self;
  sub_24D32E158();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMFindingSymbolBasedPartPickerView();
  v2 = (char *)v5.receiver;
  [(FMFindingSymbolBasedPartPickerView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_platterEffectView];
  id v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMFindingSymbolBasedPartPickerView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMFindingSymbolBasedPartPickerView *)&v6 traitCollectionDidChange:v4];
  sub_24D32EE90();
}

- (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_platterEffectView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_style));
  sub_24D2BBFB4((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_value, &qword_269860AA8);
}

@end