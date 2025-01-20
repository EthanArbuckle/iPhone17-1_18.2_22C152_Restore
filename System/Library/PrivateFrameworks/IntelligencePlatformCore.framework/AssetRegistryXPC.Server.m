@interface AssetRegistryXPC.Server
- (_TtCC24IntelligencePlatformCore16AssetRegistryXPC6Server)init;
- (void)assetEntryResultDataForAssetId:(id)a3 inDomainId:(id)a4 remoteOptionsData:(id)a5 completion:(id)a6;
- (void)overrideAssetEntryForAssetId:(id)a3 inDomainId:(id)a4 overrideAssetEntryParametersData:(id)a5 completion:(id)a6;
@end

@implementation AssetRegistryXPC.Server

- (void)assetEntryResultDataForAssetId:(id)a3 inDomainId:(id)a4 remoteOptionsData:(id)a5 completion:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_1C7925E60();
  unint64_t v11 = v10;
  uint64_t v12 = sub_1C7925E60();
  unint64_t v14 = v13;
  id v15 = a5;
  v16 = self;
  uint64_t v17 = sub_1C791F3C0();
  unint64_t v19 = v18;

  _Block_copy(v8);
  sub_1C6EA93C0(v9, v11, v12, v14, v17, v19, (uint64_t)v16, v8);
  _Block_release(v8);
  sub_1C6E355F8(v17, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)overrideAssetEntryForAssetId:(id)a3 inDomainId:(id)a4 overrideAssetEntryParametersData:(id)a5 completion:(id)a6
{
}

- (_TtCC24IntelligencePlatformCore16AssetRegistryXPC6Server)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC24IntelligencePlatformCore16AssetRegistryXPC6Server_baseServer));
  swift_bridgeObjectRelease();
}

@end