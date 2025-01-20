@interface WKSTextAnimationManager
- (WKSTextAnimationManager)init;
- (WKSTextAnimationManager)initWithDelegate:(id)a3;
- (WKSTextAnimationSourceDelegate)delegate;
- (void)addTextAnimationForAnimationID:(id)a3 withStyleType:(int64_t)a4;
- (void)removeTextAnimationForAnimationID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation WKSTextAnimationManager

- (WKSTextAnimationSourceDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___WKSTextAnimationManager_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x24C52C7D0](v2);

  return (WKSTextAnimationSourceDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (WKSTextAnimationManager)initWithDelegate:(id)a3
{
  return (WKSTextAnimationManager *)TextAnimationManager.init(with:)(a3);
}

- (void)addTextAnimationForAnimationID:(id)a3 withStyleType:(int64_t)a4
{
  uint64_t v6 = sub_246426320();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2464262F0();
  v10 = self;
  TextAnimationManager.beginEffect(for:style:)(v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)removeTextAnimationForAnimationID:(id)a3
{
  uint64_t v4 = sub_246426320();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2464262F0();
  uint64_t v8 = self;
  TextAnimationManager.endEffect(for:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (WKSTextAnimationManager)init
{
  result = (WKSTextAnimationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24641269C((uint64_t)self + OBJC_IVAR___WKSTextAnimationManager_currentEffect, &qword_268F7B170);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___WKSTextAnimationManager_delegate;

  sub_246416C8C((uint64_t)v3);
}

- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268F7B290;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268F7B298;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24640EEA4((uint64_t)v9, (uint64_t)&unk_268F7B2A0, (uint64_t)v14);
  swift_release();
}

- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268F7B260;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268F7B270;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_24640EEA4((uint64_t)v11, (uint64_t)&unk_268F7B280, (uint64_t)v16);
  swift_release();
}

@end