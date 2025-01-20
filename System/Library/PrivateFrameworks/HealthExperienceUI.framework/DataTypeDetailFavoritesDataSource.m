@interface DataTypeDetailFavoritesDataSource
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation DataTypeDetailFavoritesDataSource

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_1AD20E2C8();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  uint64_t v13 = v12;
  sub_1AD73D2B0();
  swift_retain();
  sub_1AD57C1D8(v11, v13, v14, a5);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end