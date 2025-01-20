@interface NTKParmesanGalleryController
- (NSString)placeholderName;
- (NTKParmesanGalleryContentEffect)contentEffect;
- (NTKParmesanGalleryController)init;
- (NTKParmesanGalleryController)initWithFrame:(CGRect)a3 device:(id)a4 faceState:(id)a5 contentEffect:(id)a6;
- (NTKParmesanGalleryView)galleryView;
- (id)compositionForCurrentAssetWithTimeOption:(unint64_t)a3 numerals:(unint64_t)a4;
- (id)currentComposition;
- (unint64_t)complicationVisibility;
- (unint64_t)numerals;
- (unint64_t)timeOption;
- (unint64_t)typeface;
- (void)faceViewTapped;
- (void)loadCurrentComposition;
- (void)setComplicationVisibility:(unint64_t)a3;
- (void)setContentEffect:(id)a3;
- (void)setContentOption:(unint64_t)a3;
- (void)setFaceState:(id)a3;
- (void)setGalleryView:(id)a3;
- (void)setNumerals:(unint64_t)a3;
- (void)setPlaceholderName:(id)a3;
- (void)setResourceDirectory:(id)a3;
- (void)setTimeOption:(unint64_t)a3;
- (void)setTypeface:(unint64_t)a3;
- (void)transitionContentEffectFromEffect:(id)a3 toEffect:(id)a4 progress:(double)a5;
- (void)transitionFromNumerals:(unint64_t)a3 toNumerals:(unint64_t)a4 progress:(double)a5;
- (void)transitionFromTimeOption:(unint64_t)a3 toTimeOption:(unint64_t)a4 progress:(double)a5;
- (void)transitionFromTypeface:(unint64_t)a3 toTypeface:(unint64_t)a4 progress:(double)a5;
- (void)transitionTimeEffectFromPalette:(id)a3 toPalette:(id)a4 progress:(double)a5;
- (void)updateTimeEffectStyleWithPalette:(id)a3;
@end

@implementation NTKParmesanGalleryController

- (NTKParmesanGalleryView)galleryView
{
  return (NTKParmesanGalleryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___NTKParmesanGalleryController_galleryView));
}

- (void)setGalleryView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_galleryView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_galleryView) = (Class)a3;
  id v3 = a3;
}

- (unint64_t)complicationVisibility
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_complicationVisibility);
}

- (void)setComplicationVisibility:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_complicationVisibility) = (Class)a3;
  id v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_galleryView);
  *(void *)&v3[OBJC_IVAR___NTKParmesanGalleryView_complicationVisibility] = a3;
  id v4 = self;
  v5 = v3;
  sub_246BE1000();
}

- (unint64_t)typeface
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_typeface);
}

- (void)setTypeface:(unint64_t)a3
{
  id v4 = self;
  sub_246BF0CB4(a3);
}

- (unint64_t)numerals
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_numerals);
}

- (void)setNumerals:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_numerals) = (Class)a3;
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_galleryView);
  v6 = self;
  id v5 = v4;
  sub_246BE1B98(a3);

  sub_246BF284C();
}

- (unint64_t)timeOption
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_timeOption);
}

- (void)setTimeOption:(unint64_t)a3
{
  id v4 = self;
  sub_246BF0E2C(a3);
}

- (NTKParmesanGalleryContentEffect)contentEffect
{
  return (NTKParmesanGalleryContentEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR___NTKParmesanGalleryController_contentEffect));
}

- (void)setContentEffect:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_246BF3EB0(v5);
}

- (void)setContentOption:(unint64_t)a3
{
  id v4 = self;
  sub_246BF1088(a3);
}

- (NSString)placeholderName
{
  if (*(void *)&self->galleryView[OBJC_IVAR___NTKParmesanGalleryController_placeholderName])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setPlaceholderName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_246C2CC48();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanGalleryController_placeholderName);
  uint64_t *v6 = v4;
  v6[1] = v5;
  v7 = self;
  swift_bridgeObjectRelease();
  sub_246BF129C();
}

- (NTKParmesanGalleryController)initWithFrame:(CGRect)a3 device:(id)a4 faceState:(id)a5 contentEffect:(id)a6
{
  return (NTKParmesanGalleryController *)sub_246BF1740(a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setFaceState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_246BF19E0(v4);
}

- (id)currentComposition
{
  v2 = self;
  id v3 = (void *)sub_246BF2074();

  return v3;
}

- (id)compositionForCurrentAssetWithTimeOption:(unint64_t)a3 numerals:(unint64_t)a4
{
  v6 = self;
  v7 = (void *)sub_246BF2728(a3, a4);

  return v7;
}

- (void)updateTimeEffectStyleWithPalette:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  uint64_t v5 = (objc_class *)sub_246BF2964();
  v6 = *(Class *)((char *)&v4->super.isa + OBJC_IVAR___NTKParmesanGalleryController_timeEffectStyle);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___NTKParmesanGalleryController_timeEffectStyle) = v5;
  v7 = v5;

  sub_246BF0F48();
  swift_unknownObjectRelease();
}

- (void)transitionTimeEffectFromPalette:(id)a3 toPalette:(id)a4 progress:(double)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  sub_246BF2A40(a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)transitionContentEffectFromEffect:(id)a3 toEffect:(id)a4 progress:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_246BF2CAC(v8, v9, a5);
}

- (void)transitionFromNumerals:(unint64_t)a3 toNumerals:(unint64_t)a4 progress:(double)a5
{
  id v8 = self;
  sub_246BF2E34(a3, a4, a5);
}

- (void)transitionFromTypeface:(unint64_t)a3 toTypeface:(unint64_t)a4 progress:(double)a5
{
  id v8 = self;
  sub_246BF2FE0(a3, a4, a5);
}

- (void)transitionFromTimeOption:(unint64_t)a3 toTimeOption:(unint64_t)a4 progress:(double)a5
{
  id v8 = self;
  sub_246BF318C(a3, a4, a5);
}

- (NTKParmesanGalleryController)init
{
  result = (NTKParmesanGalleryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)loadCurrentComposition
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryController_galleryView);
  id v3 = self;
  id v4 = v2;
  id v5 = (id)sub_246BF2074();
  sub_246BE2430(v5);
}

- (void)faceViewTapped
{
  type metadata accessor for ParmesanGalleryTransitionTap();
  uint64_t v3 = swift_allocObject();
  id v4 = self;
  sub_246BF3C94(v3, (uint64_t)v4);

  swift_release();
}

- (void)setResourceDirectory:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_246C2CC48();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_246BF3988(v4, v6);

  swift_bridgeObjectRelease();
}

@end