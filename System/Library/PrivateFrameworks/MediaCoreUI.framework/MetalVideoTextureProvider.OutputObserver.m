@interface MetalVideoTextureProvider.OutputObserver
- (_TtCC11MediaCoreUI25MetalVideoTextureProviderP33_2925FC67195227C5017294884B212F2E14OutputObserver)init;
- (void)dealloc;
- (void)outputMediaDataWillChange:(id)a3;
@end

@implementation MetalVideoTextureProvider.OutputObserver

- (void)outputMediaDataWillChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B29F0C0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_255C80988();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    sub_255C80958();
    id v11 = a3;
    v12 = self;
    id v13 = v11;
    v14 = v12;
    uint64_t v15 = sub_255C80948();
    v16 = (void *)swift_allocObject();
    uint64_t v17 = MEMORY[0x263F8F500];
    v16[2] = v15;
    v16[3] = v17;
    v16[4] = v14;
    v16[5] = v9;
    sub_255B5DB70((uint64_t)v7, (uint64_t)&unk_269F229B0, (uint64_t)v16);
    swift_release();
  }
}

- (void)dealloc
{
  v2 = self;
  sub_255A84BF8();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

- (_TtCC11MediaCoreUI25MetalVideoTextureProviderP33_2925FC67195227C5017294884B212F2E14OutputObserver)init
{
  return (_TtCC11MediaCoreUI25MetalVideoTextureProviderP33_2925FC67195227C5017294884B212F2E14OutputObserver *)sub_255A84E40();
}

@end