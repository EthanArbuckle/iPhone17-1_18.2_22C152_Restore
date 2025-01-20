@interface PKTiledViewAnimationController
- (PKTiledViewAnimationController)init;
- (PKTiledViewAnimationController)initWithTiledView:(id)a3;
- (void)avoidSnapshot:(id)a3;
- (void)didEndDrawing;
- (void)refineFrom:(NSArray *)a3 to:(NSArray *)a4 in:(PKDrawing *)a5 completionHandler:(id)a6;
- (void)setupRefineAnimationFrom:(NSArray *)a3 to:(NSArray *)a4 in:(PKDrawing *)a5 completionHandler:(id)a6;
- (void)setupStrokeInAnimationTo:(NSArray *)a3 in:(PKDrawing *)a4 completionHandler:(id)a5;
- (void)startRefineAnimationWithDuration:(double)a3;
- (void)stopRefineAnimation;
@end

@implementation PKTiledViewAnimationController

- (void)didEndDrawing
{
  v2 = self;
  PKTiledViewAnimationController.didEndDrawing()();
}

- (PKTiledViewAnimationController)initWithTiledView:(id)a3
{
  id v3 = a3;
  v4 = (PKTiledViewAnimationController *)specialized PKTiledViewAnimationController.init(tiledView:)();

  return v4;
}

- (void)avoidSnapshot:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (void)setupRefineAnimationFrom:(NSArray *)a3 to:(NSArray *)a4 in:(PKDrawing *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v11 - 8, v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = v15;
  v16[6] = self;
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &async function pointer to partial apply for @objc closure #1 in PKTiledViewAnimationController.setupRefineAnimation(from:to:in:);
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &_sIeghH_IeAgH_TRTA_87Tu;
  v19[5] = v18;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v14, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_92Tu, (uint64_t)v19);
  swift_release();
}

- (void)setupStrokeInAnimationTo:(NSArray *)a3 in:(PKDrawing *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &async function pointer to partial apply for @objc closure #1 in PKTiledViewAnimationController.setupStrokeInAnimation(to:in:);
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &_sIeghH_IeAgH_TRTA_72Tu;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v12, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_77Tu, (uint64_t)v17);
  swift_release();
}

- (void)startRefineAnimationWithDuration:(double)a3
{
  v4 = self;
  PKTiledViewAnimationController.startRefineAnimation(duration:)(a3);
}

- (void)stopRefineAnimation
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKTiledViewAnimationController_mtkView);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_removeFromSuperview);
  }
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKTiledViewAnimationController_renderer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKTiledViewAnimationController_renderer) = 0;
}

- (void)refineFrom:(NSArray *)a3 to:(NSArray *)a4 in:(PKDrawing *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v11 - 8, v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a6);
  v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = v15;
  v16[6] = self;
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &async function pointer to partial apply for @objc closure #1 in PKTiledViewAnimationController.refine(from:to:in:);
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &_sIeghH_IeAgH_TRTATu;
  v19[5] = v18;
  v20 = a3;
  uint64_t v21 = a4;
  v22 = a5;
  v23 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v14, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v19);
  swift_release();
}

- (PKTiledViewAnimationController)init
{
  result = (PKTiledViewAnimationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKTiledViewAnimationController_newBehavior);
}

@end