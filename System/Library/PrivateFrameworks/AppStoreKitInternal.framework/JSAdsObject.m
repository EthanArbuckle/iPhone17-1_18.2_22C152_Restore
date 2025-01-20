@interface JSAdsObject
- (_TtC19AppStoreKitInternal11JSAdsObject)init;
- (id)fetchAppBinaryTraitsOverride;
- (id)fetchOnDeviceAdPlacement:(id)a3 :(double)a4 :(id)a5 :(id)a6;
- (id)isNativeAdLoggingEnabled;
- (id)processAdvertsForSponsoredSearch:(id)a3 :(id)a4 :(id)a5 :(double)a6 :(BOOL)a7;
- (void)debugLog:(id)a3;
- (void)setTimeoutForCurrentOnDeviceAdFetch:(id)a3 :(double)a4;
@end

@implementation JSAdsObject

- (id)fetchAppBinaryTraitsOverride
{
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v3 = self;
  v4 = (void *)sub_1E1D5CC88();
  v5 = (void *)sub_1E1D5CC98();

  return v5;
}

- (id)processAdvertsForSponsoredSearch:(id)a3 :(id)a4 :(id)a5 :(double)a6 :(BOOL)a7
{
  BOOL v25 = a7;
  uint64_t v11 = sub_1E1D57D28();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1E1D5BE58();
  uint64_t v16 = v15;
  sub_1E1D5A8D8();
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  sub_1E1D5A8C8();
  sub_1E1D57D08();
  sub_1E1D5C9D8();
  v20 = (void *)sub_1E1D5A8C8();
  sub_1E1D57CF8();

  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v21 = (void *)sub_1E1D5CC88();
  v26 = v19;
  id v27 = v17;
  id v28 = v18;
  uint64_t v29 = v24;
  uint64_t v30 = v16;
  BOOL v31 = v25;
  double v32 = a6;
  v33 = "JSAdsObject.processAdvertsForSponsoredSearch";
  uint64_t v34 = 44;
  char v35 = 2;
  v36 = v14;
  v22 = (void *)sub_1E1D5CC98();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  return v22;
}

- (id)fetchOnDeviceAdPlacement:(id)a3 :(double)a4 :(id)a5 :(id)a6
{
  uint64_t v23 = sub_1E1D57D28();
  uint64_t v10 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1E1D5BE58();
  uint64_t v14 = v13;
  if (a5) {
    a5 = (id)sub_1E1D5BCB8();
  }
  if (a6)
  {
    uint64_t v15 = sub_1E1D5BE58();
    a6 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  sub_1E1D5A8D8();
  id v17 = self;
  sub_1E1D5A8C8();
  sub_1E1D57D08();
  sub_1E1D5C9D8();
  id v18 = (void *)sub_1E1D5A8C8();
  sub_1E1D57CF8();

  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v19 = (void *)sub_1E1D5CC88();
  MEMORY[0x1F4188790](v19);
  *(&v22 - 12) = v22;
  *(&v22 - 11) = v14;
  *((double *)&v22 - 10) = a4;
  *(&v22 - 9) = (uint64_t)v17;
  *(&v22 - 8) = (uint64_t)a5;
  *(&v22 - 7) = v15;
  *(&v22 - 6) = (uint64_t)a6;
  *(&v22 - 5) = (uint64_t)"JSAdsObject.fetchOnDeviceAdPlacement";
  *(&v22 - 4) = 36;
  *((unsigned char *)&v22 - 24) = 2;
  *(&v22 - 2) = (uint64_t)v12;
  v20 = (void *)sub_1E1D5CC98();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

- (void)setTimeoutForCurrentOnDeviceAdFetch:(id)a3 :(double)a4
{
  uint64_t v6 = sub_1E1D5BE58();
  v8 = v7;
  v9 = self;
  sub_1E170CD5C(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (id)isNativeAdLoggingEnabled
{
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v3 = self;
  v4 = (void *)sub_1E1D5CC88();
  v5 = (void *)sub_1E1D5CC98();

  return v5;
}

- (void)debugLog:(id)a3
{
  uint64_t v4 = sub_1E1D5BE58();
  uint64_t v6 = v5;
  v7 = self;
  sub_1E170D914(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal11JSAdsObject)init
{
  result = (_TtC19AppStoreKitInternal11JSAdsObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end