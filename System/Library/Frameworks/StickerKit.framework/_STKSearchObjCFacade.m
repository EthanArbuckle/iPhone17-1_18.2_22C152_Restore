@interface _STKSearchObjCFacade
- (BOOL)enableEmojiSearch;
- (BOOL)enableStickerSearch;
- (_STKSearchObjCFacade)init;
- (void)search:(STKStickerSearchQuery *)a3 completionHandler:(id)a4;
- (void)setEnableEmojiSearch:(BOOL)a3;
- (void)setEnableStickerSearch:(BOOL)a3;
@end

@implementation _STKSearchObjCFacade

- (BOOL)enableEmojiSearch
{
  v2 = (BOOL *)self + OBJC_IVAR____STKSearchObjCFacade_enableEmojiSearch;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableEmojiSearch:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____STKSearchObjCFacade_enableEmojiSearch;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)enableStickerSearch
{
  v2 = (BOOL *)self + OBJC_IVAR____STKSearchObjCFacade_enableStickerSearch;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableStickerSearch:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____STKSearchObjCFacade_enableStickerSearch;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_STKSearchObjCFacade)init
{
  _STKSearchObjCFacade.init()();
  return result;
}

- (void)search:(STKStickerSearchQuery *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268ED00C0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268ED41F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2453D38BC((uint64_t)v9, (uint64_t)&unk_268ED2550, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____STKSearchObjCFacade_logger;
  uint64_t v4 = sub_2453FDBB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____STKSearchObjCFacade_stickerSearchDataSource);
  v5 = (char *)self + OBJC_IVAR____STKSearchObjCFacade_emojiSearchDataSource;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

@end