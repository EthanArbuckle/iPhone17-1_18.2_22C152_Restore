@interface GridView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9CarPlayUI8GridView)initWithCoder:(id)a3;
- (_TtC9CarPlayUI8GridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GridView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GridView();
  id v2 = v3.receiver;
  [(GridView *)&v3 layoutSubviews];
  GridView.updateLayout(animated:)(0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = GridView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (_TtC9CarPlayUI8GridView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9CarPlayUI8GridView_layout);
  v8[3] = (uint64_t)&type metadata for GridView.SquareGrid.Layout;
  v8[4] = (uint64_t)&protocol witness table for GridView.SquareGrid.Layout;
  uint64_t v9 = swift_allocObject();
  *double v8 = v9;
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)(v9 + 16) = _Q0;
  *(_OWORD *)(v9 + 32) = xmmword_227B01710;
  *(void *)(v9 + 48) = 0;
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource) = 0;
  swift_unknownObjectWeakInit();
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9CarPlayUI8GridView_cells);
  v16 = self;
  uint64_t *v15 = specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(MEMORY[0x263F8EE78]);
  v15[1] = v17;
  v15[2] = v18;

  v20.receiver = v16;
  v20.super_class = (Class)type metadata accessor for GridView();
  return -[GridView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9CarPlayUI8GridView)initWithCoder:(id)a3
{
  return (_TtC9CarPlayUI8GridView *)GridView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CarPlayUI8GridView_layout);
  outlined destroy of weak GridView.DataSource?((uint64_t)self + OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource);
  swift_release();
  swift_release();
  swift_release();
}

@end