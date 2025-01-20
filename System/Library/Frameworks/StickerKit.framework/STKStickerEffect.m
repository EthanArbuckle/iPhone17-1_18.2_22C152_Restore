@interface STKStickerEffect
+ (STKStickerEffect)comicEffect;
+ (STKStickerEffect)iridescentEffect;
+ (STKStickerEffect)liveEffect;
+ (STKStickerEffect)noneEffect;
+ (STKStickerEffect)puffyEffect;
+ (STKStickerEffect)strokeEffect;
- (BOOL)applyBrushBeforeStroke;
- (BOOL)applyIridescenceBeforeStroke;
- (BOOL)forceSmallStrokeRadiusMultiplier;
- (BOOL)isBrushed;
- (BOOL)isComicEnabled;
- (BOOL)isCurlEnabled;
- (BOOL)isPuffy;
- (BOOL)isStroked;
- (BOOL)requiresDeviceMotion;
- (NSString)description;
- (STKStickerEffect)init;
- (double)shadowOffset;
- (double)shadowParallax;
- (float)normalsRadius;
- (float)shadowAlpha;
- (float)shadowRadius;
- (float)smallShadowAlphaMultiplier;
- (float)smallShadowSizeMultiplier;
- (float)smallStrokeRadiusMultiplier;
- (float)strokeBlurRadius;
- (float)strokeRadius;
- (int)iridescence;
- (void)applyComicInkParameters;
- (void)applyComicParameters;
- (void)applyTo:(id)a3 completionHandler:(id)a4;
- (void)setApplyBrushBeforeStroke:(BOOL)a3;
- (void)setApplyIridescenceBeforeStroke:(BOOL)a3;
- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3;
- (void)setIridescence:(int)a3;
- (void)setIsBrushed:(BOOL)a3;
- (void)setIsComicEnabled:(BOOL)a3;
- (void)setIsCurlEnabled:(BOOL)a3;
- (void)setIsPuffy:(BOOL)a3;
- (void)setIsStroked:(BOOL)a3;
- (void)setNormalsRadius:(float)a3;
- (void)setShadowAlpha:(float)a3;
- (void)setShadowOffset:(STKStickerEffect *)self;
- (void)setShadowParallax:(STKStickerEffect *)self;
- (void)setShadowRadius:(float)a3;
- (void)setSmallShadowAlphaMultiplier:(float)a3;
- (void)setSmallShadowSizeMultiplier:(float)a3;
- (void)setSmallStrokeRadiusMultiplier:(float)a3;
- (void)setStrokeBlurRadius:(float)a3;
- (void)setStrokeRadius:(float)a3;
@end

@implementation STKStickerEffect

- (NSString)description
{
  sub_245293684();
  v2 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)isStroked
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isStroked;
  swift_beginAccess();
  return *v2;
}

- (void)setIsStroked:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isStroked;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (float)strokeRadius
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_strokeRadius);
}

- (void)setStrokeRadius:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_strokeRadius) = a3;
}

- (float)strokeBlurRadius
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_strokeBlurRadius);
}

- (void)setStrokeBlurRadius:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_strokeBlurRadius) = a3;
}

- (float)smallStrokeRadiusMultiplier
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallStrokeRadiusMultiplier);
}

- (void)setSmallStrokeRadiusMultiplier:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallStrokeRadiusMultiplier) = a3;
}

- (BOOL)forceSmallStrokeRadiusMultiplier
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_forceSmallStrokeRadiusMultiplier);
}

- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_forceSmallStrokeRadiusMultiplier) = a3;
}

- (BOOL)isPuffy
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_isPuffy);
}

- (void)setIsPuffy:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_isPuffy) = a3;
}

- (float)normalsRadius
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_normalsRadius);
}

- (void)setNormalsRadius:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_normalsRadius) = a3;
}

- (int)iridescence
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_iridescence);
}

- (void)setIridescence:(int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_iridescence) = a3;
}

- (BOOL)applyIridescenceBeforeStroke
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_applyIridescenceBeforeStroke);
}

- (void)setApplyIridescenceBeforeStroke:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_applyIridescenceBeforeStroke) = a3;
}

- (BOOL)isBrushed
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_isBrushed);
}

- (void)setIsBrushed:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_isBrushed) = a3;
}

- (BOOL)applyBrushBeforeStroke
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_applyBrushBeforeStroke);
}

- (void)setApplyBrushBeforeStroke:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_applyBrushBeforeStroke) = a3;
}

- (float)shadowRadius
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowRadius);
}

- (void)setShadowRadius:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowRadius) = a3;
}

- (float)shadowAlpha
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowAlpha);
}

- (void)setShadowAlpha:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowAlpha) = a3;
}

- (double)shadowOffset
{
  return *(double *)(a1 + OBJC_IVAR___STKStickerEffect_shadowOffset);
}

- (void)setShadowOffset:(STKStickerEffect *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowOffset) = v2;
}

- (double)shadowParallax
{
  return *(double *)(a1 + OBJC_IVAR___STKStickerEffect_shadowParallax);
}

- (void)setShadowParallax:(STKStickerEffect *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowParallax) = v2;
}

- (float)smallShadowSizeMultiplier
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallShadowSizeMultiplier);
}

- (void)setSmallShadowSizeMultiplier:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallShadowSizeMultiplier) = a3;
}

- (float)smallShadowAlphaMultiplier
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallShadowAlphaMultiplier);
}

- (void)setSmallShadowAlphaMultiplier:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallShadowAlphaMultiplier) = a3;
}

- (BOOL)isComicEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isComicEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsComicEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isComicEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)requiresDeviceMotion
{
  return sub_245293EA8();
}

- (BOOL)isCurlEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isCurlEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCurlEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isCurlEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)applyComicParameters
{
  v2 = (char *)self + OBJC_IVAR___STKStickerEffect_comicParameters;
  char *v2 = 0;
  *(_OWORD *)(v2 + 4) = xmmword_24540B160;
  *(void *)(v2 + 20) = 0x3DCCCCCD3F000000;
  *((void *)v2 + 4) = 6;
}

- (void)applyComicInkParameters
{
  v2 = (char *)self + OBJC_IVAR___STKStickerEffect_comicParameters;
  char *v2 = 1;
  *(_OWORD *)(v2 + 4) = xmmword_24540B170;
  *(void *)(v2 + 20) = 0x3DCCCCCD3F000000;
  *((void *)v2 + 4) = 6;
}

- (void)applyTo:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  v10 = sub_245294194();
  if (v10)
  {
    v11 = v10;
    v12 = (void *)swift_allocObject();
    v12[2] = v11;
    v12[3] = v8;
    v12[4] = v9;
    v12[5] = sub_24520E598;
    v12[6] = v7;
    v16[4] = sub_2452956D4;
    v16[5] = v12;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1107296256;
    v16[2] = sub_2452934DC;
    v16[3] = &block_descriptor_75;
    v13 = _Block_copy(v16);
    id v14 = v8;
    v9 = v9;
    v15 = v11;
    swift_retain();
    swift_release();
    itk_performBlockOnMainThread();
    _Block_release(v13);
  }
  swift_release();
}

+ (STKStickerEffect)noneEffect
{
  return (STKStickerEffect *)sub_2452952BC((uint64_t)a1, (uint64_t)a2, &qword_268ECF208, (void **)&qword_268ED20B8);
}

+ (STKStickerEffect)strokeEffect
{
  return (STKStickerEffect *)sub_2452952BC((uint64_t)a1, (uint64_t)a2, &qword_268ECF210, (void **)&qword_268ED20C0);
}

+ (STKStickerEffect)comicEffect
{
  return (STKStickerEffect *)sub_2452952BC((uint64_t)a1, (uint64_t)a2, &qword_268ECF218, (void **)&qword_268ED20C8);
}

+ (STKStickerEffect)puffyEffect
{
  return (STKStickerEffect *)sub_2452952BC((uint64_t)a1, (uint64_t)a2, &qword_268ECF220, (void **)&qword_268ED20D0);
}

+ (STKStickerEffect)iridescentEffect
{
  return (STKStickerEffect *)sub_2452952BC((uint64_t)a1, (uint64_t)a2, &qword_268ECF228, (void **)&qword_268ED20D8);
}

+ (STKStickerEffect)liveEffect
{
  return (STKStickerEffect *)sub_2452952BC((uint64_t)a1, (uint64_t)a2, &qword_268ECF230, (void **)&qword_268ED20E0);
}

- (STKStickerEffect)init
{
  return (STKStickerEffect *)StickerEffect.init()();
}

- (void).cxx_destruct
{
}

@end