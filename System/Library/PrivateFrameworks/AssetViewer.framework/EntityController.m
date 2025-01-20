@interface EntityController
- (ASVUnifiedGestureRecognizer)worldGestureRecognizer;
- (BOOL)screenPointIsOnAsset:(_TtC11AssetViewer16EntityController *)self;
- (CGRect)calculateAssetScreenBoundingRectIn:(id)a3;
- (NSArray)entityAccessibilityWrappers;
- (NSString)description;
- (NSURL)accessibilityAssetURL;
- (_TtC11AssetViewer16EntityController)init;
- (__n128)assetNaturalSize;
- (__n128)assetTransform;
- (__n128)assetWorldPosition;
- (double)assetHeadScreenPositionForScale:(void *)a1;
- (double)assetScreenPosition;
- (float)assetPitch;
- (float)assetScale;
- (float)assetScaleToFitUnitBox;
- (float)assetYaw;
- (float)levitationHeight;
- (void)dealloc;
- (void)rotateByDeltaYaw:(float)a3 deltaPitch:(float)a4;
- (void)scaleTo:(float)a3 updateARScale:(BOOL)a4;
- (void)setAccessibilityAssetURL:(id)a3;
- (void)setLevitationHeight:(float)a3;
- (void)setWorldGestureRecognizer:(id)a3;
- (void)turntableGestureRecognizer:(id)a3 rotatedAssetByDeltaYaw:(float)a4 deltaPitch:(float)a5;
- (void)unifiedGestureRecognizer:(id)a3 doubleTappedAtScreenPoint:(BOOL)a4 onAsset:;
- (void)unifiedGestureRecognizer:(id)a3 rotatedAssetByDeltaYaw:(float)a4;
- (void)unifiedGestureRecognizer:(id)a3 scaledAssetToScale:(float)a4;
- (void)unifiedGestureRecognizer:(id)a3 singleTappedAtScreenPoint:(BOOL)a4 onAsset:;
- (void)unifiedGestureRecognizerBeganRotation:(id)a3;
- (void)unifiedGestureRecognizerBeganScaling:(id)a3;
- (void)unifiedGestureRecognizerEndedRotation:(id)a3;
- (void)unifiedGestureRecognizerEndedScaling:(id)a3;
- (void)worldGestureRecognizer:(id)a3 decelerationTranslationDelta:;
- (void)worldGestureRecognizer:(id)a3 levitatedAssetToScreenPoint:;
- (void)worldGestureRecognizer:(id)a3 translatedAssetToScreenPoint:;
- (void)worldGestureRecognizerBeganLevitation:(id)a3;
- (void)worldGestureRecognizerBeganTranslation:(id)a3;
- (void)worldGestureRecognizerBeganTranslationDeceleration:(id)a3;
- (void)worldGestureRecognizerEndedLevitation:(id)a3;
- (void)worldGestureRecognizerEndedTranslation:(id)a3;
- (void)worldGestureRecognizerEndedTranslationDeceleration:(id)a3;
@end

@implementation EntityController

- (ASVUnifiedGestureRecognizer)worldGestureRecognizer
{
  return (ASVUnifiedGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC11AssetViewer16EntityController_worldGestureRecognizer));
}

- (void)setWorldGestureRecognizer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_worldGestureRecognizer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_worldGestureRecognizer) = (Class)a3;
  id v3 = a3;
}

- (float)levitationHeight
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_levitationHeight);
}

- (void)setLevitationHeight:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_levitationHeight) = a3;
}

- (NSURL)accessibilityAssetURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EADCC240);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_accessibilityAssetURL;
  swift_beginAccess();
  sub_1E28741EC((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = sub_1E2991AA8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1E29919E8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setAccessibilityAssetURL:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EADCC240);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1E2991A48();
    uint64_t v8 = sub_1E2991AA8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1E2991AA8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_accessibilityAssetURL;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1E2874184((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (NSArray)entityAccessibilityWrappers
{
  v2 = self;
  sub_1E29931A8();

  sub_1E2992988();
  uint64_t v3 = (void *)sub_1E2994418();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSString)description
{
  v2 = self;
  sub_1E29931F8();
  sub_1E2994328();
  swift_bridgeObjectRelease();
  sub_1E2994328();

  uint64_t v3 = (void *)sub_1E29941E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = self;
  sub_1E28723E8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for EntityController();
  [(EntityController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  sub_1E2874254((uint64_t)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1E287427C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11AssetViewer16EntityController_projectPointHandler));
  sub_1E287427C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11AssetViewer16EntityController_shouldDisableGesturesHandler));
  swift_release();

  swift_release();
  swift_release();
  uint64_t v4 = *(void **)&self->type[OBJC_IVAR____TtC11AssetViewer16EntityController_sceneUnderstandingState];
  swift_release();
  sub_1E287428C(v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_accessibilityAssetURL;
  sub_1E28742B0((uint64_t)v3);
}

- (void)rotateByDeltaYaw:(float)a3 deltaPitch:(float)a4
{
  uint64_t v6 = self;
  sub_1E286FB30(a3, a4);
}

- (CGRect)calculateAssetScreenBoundingRectIn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E29931C8();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)scaleTo:(float)a3 updateARScale:(BOOL)a4
{
  uint64_t v5 = self;
  sub_1E2872EBC(a3);
}

- (_TtC11AssetViewer16EntityController)init
{
  CGRect result = (_TtC11AssetViewer16EntityController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)screenPointIsOnAsset:(_TtC11AssetViewer16EntityController *)self
{
  return 1;
}

- (__n128)assetTransform
{
  sub_1E2993248();
  id v2 = a1;
  sub_1E2991EC8();
  long long v5 = v3;

  return (__n128)v5;
}

- (__n128)assetWorldPosition
{
  id v1 = a1;
  sub_1E2872968();
  long long v4 = v2;

  return (__n128)v4;
}

- (double)assetScreenPosition
{
  id v1 = a1;
  double v2 = sub_1E2872A2C();

  return v2;
}

- (double)assetHeadScreenPositionForScale:(void *)a1
{
  id v1 = a1;
  double v2 = sub_1E287389C();

  return v2;
}

- (float)assetYaw
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_currentTurntableYaw);
}

- (float)assetPitch
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_currentTurntablePitch);
}

- (float)assetScale
{
  double v2 = self;
  float v3 = sub_1E2872B64();

  return v3;
}

- (__n128)assetNaturalSize
{
  return *(__n128 *)(a1 + OBJC_IVAR____TtC11AssetViewer16EntityController__assetNaturalSize);
}

- (float)assetScaleToFitUnitBox
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController__assetScaleToFitUnitBox);
}

- (void)worldGestureRecognizerBeganTranslation:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  sub_1E2906028();
}

- (void)worldGestureRecognizerEndedTranslation:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  sub_1E290613C();
}

- (void)worldGestureRecognizerBeganTranslationDeceleration:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  sub_1E28723E8();
}

- (void)worldGestureRecognizer:(id)a3 decelerationTranslationDelta:
{
  id v4 = a3;
  long long v5 = self;
  sub_1E2906314();
}

- (void)worldGestureRecognizerEndedTranslationDeceleration:(id)a3
{
  if (MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2))
  {
    id v5 = a3;
    double v6 = self;
    sub_1E294DFBC((char *)v6);

    swift_unknownObjectRelease();
  }
}

- (void)worldGestureRecognizer:(id)a3 translatedAssetToScreenPoint:
{
  double v4 = v3;
  id v6 = a3;
  double v7 = self;
  sub_1E2906458(v4);
}

- (void)worldGestureRecognizerBeganLevitation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E2906F60();
}

- (void)worldGestureRecognizerEndedLevitation:(id)a3
{
  if (MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2))
  {
    id v5 = a3;
    id v6 = self;
    sub_1E294DFBC((char *)v6);
    sub_1E2963510();

    swift_unknownObjectRelease();
  }
}

- (void)worldGestureRecognizer:(id)a3 levitatedAssetToScreenPoint:
{
  float32x2_t v4 = v3;
  id v6 = a3;
  double v7 = self;
  sub_1E2905514(v6, v4);
}

- (void)turntableGestureRecognizer:(id)a3 rotatedAssetByDeltaYaw:(float)a4 deltaPitch:(float)a5
{
  double v8 = *(uint64_t (**)(uint64_t))((char *)&self->super.isa
                                         + OBJC_IVAR____TtC11AssetViewer16EntityController_shouldDisableGesturesHandler);
  if (!v8)
  {
    id v13 = a3;
    double v14 = self;
    goto LABEL_5;
  }
  id v9 = a3;
  double v10 = self;
  uint64_t v11 = sub_1E2873E2C((uint64_t)v8);
  char v12 = v8(v11);
  sub_1E287427C((uint64_t)v8);
  if ((v12 & 1) == 0) {
LABEL_5:
  }
    sub_1E286FB30(a4, a5);
}

- (void)unifiedGestureRecognizer:(id)a3 doubleTappedAtScreenPoint:(BOOL)a4 onAsset:
{
  float32x2_t v5 = v4;
  uint64_t v8 = MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2, a3, a4);
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = a3;
    uint64_t v11 = self;
    objc_msgSend(v9, sel_entityController_doubleTappedAt_, v11, vcvtq_f64_f32(v5));

    swift_unknownObjectRelease();
  }
}

- (void)unifiedGestureRecognizer:(id)a3 singleTappedAtScreenPoint:(BOOL)a4 onAsset:
{
  uint64_t v9 = v4;
  if (MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2, a3, a4))
  {
    id v7 = a3;
    uint64_t v8 = self;
    sub_1E28DDD50(*(float *)&v9, *((float *)&v9 + 1));

    swift_unknownObjectRelease();
  }
}

- (void)unifiedGestureRecognizerBeganRotation:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_physicsStateManager);
  uint64_t v5 = *(void *)&self->entity[OBJC_IVAR____TtC11AssetViewer16EntityController_physicsStateManager];
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_1E2979EBC(v8, (void (*)(uint64_t, uint64_t))sub_1E2907308);
  swift_bridgeObjectRelease();
  sub_1E2977918(v4, v5);
}

- (void)unifiedGestureRecognizer:(id)a3 rotatedAssetByDeltaYaw:(float)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1E2907068(a4);
}

- (void)unifiedGestureRecognizerEndedRotation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E2907188();
}

- (void)unifiedGestureRecognizerBeganScaling:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E2907220();
}

- (void)unifiedGestureRecognizer:(id)a3 scaledAssetToScale:(float)a4
{
  id v6 = *(uint64_t (**)(uint64_t))((char *)&self->super.isa
                                         + OBJC_IVAR____TtC11AssetViewer16EntityController_shouldDisableGesturesHandler);
  if (!v6)
  {
    id v11 = a3;
    char v12 = self;
    goto LABEL_5;
  }
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = sub_1E2873E2C((uint64_t)v6);
  char v10 = v6(v9);
  sub_1E287427C((uint64_t)v6);
  if ((v10 & 1) == 0) {
LABEL_5:
  }
    sub_1E2872EBC(a4);
}

- (void)unifiedGestureRecognizerEndedScaling:(id)a3
{
  if (MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2))
  {
    id v5 = a3;
    id v6 = self;
    sub_1E28C5CE0((uint64_t)v6, 1);

    swift_unknownObjectRelease();
  }
}

@end