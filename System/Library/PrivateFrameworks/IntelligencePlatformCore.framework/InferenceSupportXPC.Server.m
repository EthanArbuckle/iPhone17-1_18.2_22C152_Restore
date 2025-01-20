@interface InferenceSupportXPC.Server
- (_TtCC24IntelligencePlatformCore19InferenceSupportXPC6Server)init;
- (void)assetEntryResultDataForAssetId:(id)a3 inDomainId:(id)a4 remoteOptionsData:(id)a5 completion:(id)a6;
@end

@implementation InferenceSupportXPC.Server

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
  sub_1C72E37BC(v9, v11, v12, v14, v17, v19, (uint64_t)v16, v8);
  _Block_release(v8);
  sub_1C6E355F8(v17, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtCC24IntelligencePlatformCore19InferenceSupportXPC6Server)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC24IntelligencePlatformCore19InferenceSupportXPC6Server_assetRegistryXPCBaseServer);
}

@end