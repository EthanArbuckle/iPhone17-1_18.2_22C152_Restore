@interface NTKParmesanGalleryView
- (BOOL)isGeneratingSwatch;
- (NTKParmesanGalleryContentEffect)contentEffect;
- (NTKParmesanGalleryTimeTransitionDelegate)transitionDelegate;
- (NTKParmesanGalleryView)initWithCoder:(id)a3;
- (NTKParmesanGalleryView)initWithFrame:(CGRect)a3;
- (NTKParmesanGalleryView)initWithFrame:(CGRect)a3 device:(id)a4 typeface:(unint64_t)a5 numerals:(unint64_t)a6 timeLayout:(id)a7;
- (NTKParmesanGalleryView)initWithFrame:(CGRect)a3 device:(id)a4 typeface:(unint64_t)a5 numerals:(unint64_t)a6 timeOption:(unint64_t)a7 timeLayout:(id)a8 timePalette:(id)a9;
- (NTKParmesanTimeView)timeView;
- (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem)currentItem;
- (_TtC30NTKParmesanFaceBundleCompanion25ParmesanVibrantEffectView)complicationVibrantEffectView;
- (unint64_t)complicationVisibility;
- (void)setComplicationVisibility:(unint64_t)a3;
- (void)setComposition:(id)a3;
- (void)setContentEffect:(id)a3;
- (void)setCurrentItem:(id)a3;
- (void)setIsGeneratingSwatch:(BOOL)a3;
- (void)setNumerals:(unint64_t)a3;
- (void)setTransitionDelegate:(id)a3;
- (void)setTypeface:(unint64_t)a3;
- (void)swatchSetTimeOption:(unint64_t)a3 typeface:(unint64_t)a4 numerals:(unint64_t)a5 style:(unint64_t)a6;
@end

@implementation NTKParmesanGalleryView

- (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem)currentItem
{
  return (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_currentItem);
}

- (void)setCurrentItem:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_currentItem);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_currentItem) = (Class)a3;
  id v3 = a3;
}

- (NTKParmesanTimeView)timeView
{
  return (NTKParmesanTimeView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                        + OBJC_IVAR___NTKParmesanGalleryView_timeView));
}

- (unint64_t)complicationVisibility
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR___NTKParmesanGalleryView_complicationVisibility);
}

- (void)setComplicationVisibility:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_complicationVisibility) = (Class)a3;
  id v3 = self;
  sub_246BE1000();
}

- (_TtC30NTKParmesanFaceBundleCompanion25ParmesanVibrantEffectView)complicationVibrantEffectView
{
  return (_TtC30NTKParmesanFaceBundleCompanion25ParmesanVibrantEffectView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_complicationVibrantEffectView);
}

- (NTKParmesanGalleryContentEffect)contentEffect
{
  return (NTKParmesanGalleryContentEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR___NTKParmesanGalleryView_contentEffect));
}

- (void)setContentEffect:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_contentEffect);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_contentEffect) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_246BE1158();
}

- (BOOL)isGeneratingSwatch
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_isGeneratingSwatch);
}

- (void)setIsGeneratingSwatch:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_isGeneratingSwatch) = a3;
}

- (NTKParmesanGalleryTimeTransitionDelegate)transitionDelegate
{
  v2 = (void *)MEMORY[0x24C545A70]((char *)self + OBJC_IVAR___NTKParmesanGalleryView_transitionDelegate, a2);

  return (NTKParmesanGalleryTimeTransitionDelegate *)v2;
}

- (void)setTransitionDelegate:(id)a3
{
}

- (NTKParmesanGalleryView)initWithFrame:(CGRect)a3 device:(id)a4 typeface:(unint64_t)a5 numerals:(unint64_t)a6 timeLayout:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = objc_allocWithZone((Class)type metadata accessor for ParmesanGalleryView());
  v16 = sub_246BE1364(a4, a5, a6, a7, 0, 0, x, y, width, height);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (NTKParmesanGalleryView *)v16;
}

- (NTKParmesanGalleryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_246BE4748();
}

- (void)setTypeface:(unint64_t)a3
{
  *(void *)(*(void *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_timeView)
                        + OBJC_IVAR___NTKParmesanTimeView_appearance)
            + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface) = a3;
  id v3 = self;
  sub_246BC5900();
}

- (void)setNumerals:(unint64_t)a3
{
  id v4 = self;
  sub_246BE1B98(a3);
}

- (void)setComposition:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_246BE2430(a3);
}

- (NTKParmesanGalleryView)initWithFrame:(CGRect)a3
{
  result = (NTKParmesanGalleryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKParmesanGalleryView_complicationVibrantEffectView));

  sub_246B98F78((uint64_t)self + OBJC_IVAR___NTKParmesanGalleryView_transitionDelegate);
  sub_246BC80B0(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanGalleryView_transitioningContentEffects), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR___NTKParmesanGalleryView_transitioningContentEffects));

  swift_unknownObjectRelease();
}

- (NTKParmesanGalleryView)initWithFrame:(CGRect)a3 device:(id)a4 typeface:(unint64_t)a5 numerals:(unint64_t)a6 timeOption:(unint64_t)a7 timeLayout:(id)a8 timePalette:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a4;
  id v19 = a8;
  return (NTKParmesanGalleryView *)sub_246C1E43C(v18, a5, a6, a7, a8, a9, x, y, width, height);
}

- (void)swatchSetTimeOption:(unint64_t)a3 typeface:(unint64_t)a4 numerals:(unint64_t)a5 style:(unint64_t)a6
{
  v10 = self;
  sub_246C1E618(a3, a4, a5, a6);
}

@end