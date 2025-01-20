@interface WKIntelligenceTextEffectCoordinator
+ (int64_t)characterDeltaForReceivedSuggestions:(id)a3;
- (WKIntelligenceTextEffectCoordinator)init;
- (WKIntelligenceTextEffectCoordinator)initWithDelegate:(id)a3;
- (void)flushReplacementsWithCompletion:(id)a3;
- (void)requestReplacementWithProcessedRange:(_NSRange)a3 finished:(BOOL)a4 characterDelta:(int64_t)a5 operation:(id)a6 completion:;
- (void)restoreSelectionAcceptedReplacements:(BOOL)a3 completion:(id)a4;
- (void)startAnimationForRange:(_NSRange)a3 completion:(id)a4;
@end

@implementation WKIntelligenceTextEffectCoordinator

+ (int64_t)characterDeltaForReceivedSuggestions:(id)a3
{
  sub_246422284(0, &qword_268F7B4A8);
  unint64_t v3 = sub_246426790();
  int64_t v4 = _sSo35WKIntelligenceTextEffectCoordinatorC14libWebKitSwiftE14characterDelta22forReceivedSuggestionsSiSaySo16WTTextSuggestionCG_tFZ_0(v3);
  swift_bridgeObjectRelease();
  return v4;
}

- (WKIntelligenceTextEffectCoordinator)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  int64_t v4 = (WKIntelligenceTextEffectCoordinator *)sub_246421140((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)startAnimationForRange:(_NSRange)a3 completion:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = location;
  v12[3] = length;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268F7B490;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268F7B498;
  v15[5] = v14;
  v16 = self;
  sub_24640EEA4((uint64_t)v10, (uint64_t)&unk_268F7B4A0, (uint64_t)v15);
  swift_release();
}

- (void)requestReplacementWithProcessedRange:(_NSRange)a3 finished:(BOOL)a4 characterDelta:(int64_t)a5 operation:(id)a6 completion:
{
  v7 = v6;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v14 - 8);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = _Block_copy(a6);
  v18 = _Block_copy(v7);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = location;
  *(void *)(v19 + 24) = length;
  *(unsigned char *)(v19 + 32) = a4;
  *(void *)(v19 + 40) = a5;
  *(void *)(v19 + 48) = v17;
  *(void *)(v19 + 56) = v18;
  *(void *)(v19 + 64) = self;
  uint64_t v20 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v16, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_268F7B470;
  v21[5] = v19;
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_268F7B478;
  v22[5] = v21;
  v23 = self;
  sub_24640EEA4((uint64_t)v16, (uint64_t)&unk_268F7B480, (uint64_t)v22);
  swift_release();
}

- (void)flushReplacementsWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268F7B450;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268F7B458;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24640EEA4((uint64_t)v7, (uint64_t)&unk_268F7B460, (uint64_t)v12);
  swift_release();
}

- (void)restoreSelectionAcceptedReplacements:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268F7B430;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268F7B438;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24640EEA4((uint64_t)v9, (uint64_t)&unk_268F7B440, (uint64_t)v14);
  swift_release();
}

- (WKIntelligenceTextEffectCoordinator)init
{
  result = (WKIntelligenceTextEffectCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_onFlushCompletion);

  sub_246407474(v3);
}

@end