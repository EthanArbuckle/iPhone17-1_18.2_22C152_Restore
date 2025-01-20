@interface FPDAccessControlStore
- (id)swift_bookmarkForItemID:(id)a3 consumerIdentifier:(id)a4 installSessionIdentifier:(id)a5;
- (id)swift_parseUnverifiedBookmark:(id)a3;
- (id)swift_verifyBookmark:(id)a3 consumerIdentifier:(id)a4 installSessionIdentifier:(id)a5;
@end

@implementation FPDAccessControlStore

- (id)swift_bookmarkForItemID:(id)a3 consumerIdentifier:(id)a4 installSessionIdentifier:(id)a5
{
  uint64_t v8 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v10 = v9;
  id v11 = a3;
  v12 = self;
  if (a5)
  {
    id v13 = a5;
    a5 = (id)sub_10096AF60();
    unint64_t v15 = v14;
  }
  else
  {
    unint64_t v15 = 0xF000000000000000;
  }
  FPDAccessControlStore.swift_bookmark(for:consumerIdentifier:installSessionIdentifier:)(a3, v8, v10, (uint64_t)a5, v15);
  uint64_t v17 = v16;
  sub_10001E9AC((uint64_t)a5, v15);

  swift_bridgeObjectRelease();
  if (v17)
  {
    NSString v18 = sub_10096BC00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v18 = 0;
  }

  return v18;
}

- (id)swift_verifyBookmark:(id)a3 consumerIdentifier:(id)a4 installSessionIdentifier:(id)a5
{
  uint64_t v7 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  unint64_t v9 = v8;
  uint64_t v10 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  v12 = v11;
  id v13 = self;
  if (a5)
  {
    id v14 = a5;
    a5 = (id)sub_10096AF60();
    unint64_t v16 = v15;
  }
  else
  {
    unint64_t v16 = 0xF000000000000000;
  }
  id v17 = sub_1006B2A34(v7, v9, v10, v12, (uint64_t)a5, v16);
  sub_10001E9AC((uint64_t)a5, v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v17;
}

- (id)swift_parseUnverifiedBookmark:(id)a3
{
  uint64_t v4 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1006B3AA4(v4, v6, v13);
  sub_1006B3D60((uint64_t)v13, (uint64_t)v14);
  if (v15)
  {
    unint64_t v8 = v16;
    unint64_t v9 = v17;
    uint64_t v10 = v18;
    swift_bridgeObjectRelease();
    id v11 = [objc_allocWithZone((Class)FPItemID) initWithProviderID:v8 domainIdentifier:v9 itemIdentifier:v10];

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    id v11 = 0;
  }

  return v11;
}

@end