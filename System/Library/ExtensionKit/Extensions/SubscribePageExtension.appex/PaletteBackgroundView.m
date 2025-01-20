@interface PaletteBackgroundView
- (_TtC22SubscribePageExtension21PaletteBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension21PaletteBackgroundView)initWithEffect:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)didMoveToWindow;
@end

@implementation PaletteBackgroundView

- (void)didMoveToWindow
{
  v2 = self;
  sub_10073D0B0((SEL *)&selRef_didMoveToWindow);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_10073D0B0((SEL *)&selRef__dynamicUserInterfaceTraitDidChange);
}

- (_TtC22SubscribePageExtension21PaletteBackgroundView)initWithEffect:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension21PaletteBackgroundView_blurEffectOverride) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  return [(PaletteBackgroundView *)&v5 initWithEffect:a3];
}

- (_TtC22SubscribePageExtension21PaletteBackgroundView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension21PaletteBackgroundView_blurEffectOverride) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  return [(PaletteBackgroundView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21PaletteBackgroundView_blurEffectOverride));
}

@end