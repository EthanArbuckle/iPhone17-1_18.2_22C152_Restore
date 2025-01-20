@interface HUTileCellBackgroundView
- (HUBackgroundEffectViewGrouping)effectGrouper;
- (HUTileCellBackgroundView)initWithCoder:(id)a3;
- (HUTileCellBackgroundView)initWithEffectIdentifier:(id)a3 effectGrouper:(id)a4 materialStyle:(int64_t)a5;
- (HUTileCellBackgroundView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setEffectGrouper:(id)a3;
- (void)updateWithEffectIdentifier:(id)a3 materialStyle:(int64_t)a4;
@end

@implementation HUTileCellBackgroundView

- (HUBackgroundEffectViewGrouping)effectGrouper
{
  v2 = (char *)self + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUBackgroundEffectViewGrouping *)v3;
}

- (void)setEffectGrouper:(id)a3
{
}

- (HUTileCellBackgroundView)initWithFrame:(CGRect)a3
{
  return (HUTileCellBackgroundView *)TileCellBackgroundView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUTileCellBackgroundView)initWithEffectIdentifier:(id)a3 effectGrouper:(id)a4 materialStyle:(int64_t)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = -[HUTileCellBackgroundView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_beginAccess();
  uint64_t v9 = swift_unknownObjectWeakAssign();
  v10 = (void *)MEMORY[0x1C1898E00](v9);
  v11 = v8;
  sub_1BE57CF00(v7, v10, a5);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v11;
}

- (HUTileCellBackgroundView)initWithCoder:(id)a3
{
  return (HUTileCellBackgroundView *)TileCellBackgroundView.init(coder:)(a3);
}

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1BE57BD50();
  id v4 = objc_msgSend(v3, sel__captureSource);

  if (v4)
  {
    id v5 = sub_1BE57BD50();
    objc_msgSend(v4, sel__removeCaptureDependent_, v5);
  }
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for TileCellBackgroundView();
  [(HUTileCellBackgroundView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier));
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUTileCellBackgroundView____lazy_storage___visualEffectView));

  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___HUTileCellBackgroundView____lazy_storage___controlCenterMaterialView);

  sub_1BE57D8F8(v3);
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TileCellBackgroundView();
  id v2 = v6.receiver;
  [(HUTileCellBackgroundView *)&v6 layoutSubviews];
  id v3 = sub_1BE57BD50();
  objc_msgSend(v2, sel_bounds, v6.receiver, v6.super_class);
  objc_msgSend(v3, sel_setFrame_);

  id v4 = sub_1BE57C2C0();
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v5, sel_setFrame_);

    id v2 = v5;
  }
}

- (void)prepareForReuse
{
  id v2 = self;
  id v3 = sub_1BE57BD50();
  id v4 = objc_msgSend(v3, sel__captureSource);

  if (v4)
  {
    id v5 = sub_1BE57BD50();
    objc_msgSend(v4, sel__removeCaptureDependent_, v5);
  }
  objc_super v6 = (void **)((char *)&v2->super.super.super.isa + OBJC_IVAR___HUTileCellBackgroundView_currentEffectIdentifier);
  swift_beginAccess();
  id v7 = *v6;
  *objc_super v6 = 0;
}

- (void)updateWithEffectIdentifier:(id)a3 materialStyle:(int64_t)a4
{
  id v7 = (char *)self + OBJC_IVAR___HUTileCellBackgroundView_effectGrouper;
  swift_beginAccess();
  v8 = (void *)MEMORY[0x1C1898E00](v7);
  id v9 = a3;
  v10 = self;
  sub_1BE57CF00(v9, v8, a4);

  swift_unknownObjectRelease();
}

@end