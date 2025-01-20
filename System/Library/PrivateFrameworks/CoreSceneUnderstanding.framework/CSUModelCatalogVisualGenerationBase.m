@interface CSUModelCatalogVisualGenerationBase
- (CSUModelCatalogVisualGenerationBase)init;
- (id)fetchWithAssetLock:(id)a3 error:(id *)a4;
- (id)getAssetVersion;
@end

@implementation CSUModelCatalogVisualGenerationBase

- (CSUModelCatalogVisualGenerationBase)init
{
  v2 = self;
  sub_24C72AAC8();
  v3 = (Class *)((char *)&v2->super.isa + OBJC_IVAR___CSUModelCatalogVisualGenerationBase_assetVersionNumber);
  void *v3 = 7104878;
  v3[1] = 0xE300000000000000;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CSUModelCatalogVisualGenerationBase(0);
  return [(CSUModelCatalogVisualGenerationBase *)&v5 init];
}

- (id)fetchWithAssetLock:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_24C72A9B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  sub_24C6DF000(v10, v9);

  v12 = (void *)sub_24C72A9A8();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)getAssetVersion
{
  v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x60);
  v3 = self;
  v2();

  v4 = (void *)sub_24C72AAE8();
  swift_bridgeObjectRelease();
  return v4;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___CSUModelCatalogVisualGenerationBase_logger;
  uint64_t v3 = sub_24C72AAD8();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end