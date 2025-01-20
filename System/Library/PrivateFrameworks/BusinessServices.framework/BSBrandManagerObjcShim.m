@interface BSBrandManagerObjcShim
- (BSBrandManagerObjcShim)init;
- (BSBrandManagerObjcShim)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceWrapper:(id)a5;
- (void)brandWithURI:(id)a3 completion:(id)a4;
- (void)brandWithURI:(id)a3 usingSim:(id)a4 completion:(id)a5;
- (void)clearUnusedCachedLogos:(id)a3;
- (void)fetchAssetWithURL:(id)a3 assetType:(int64_t)a4 completion:(id)a5;
@end

@implementation BSBrandManagerObjcShim

- (BSBrandManagerObjcShim)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceWrapper:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C5FE8);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_2291673B0();
    uint64_t v11 = sub_2291673E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_2291673E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  id v13 = a5;
  v14 = (BSBrandManagerObjcShim *)sub_22915479C(a3, (uint64_t)v10, v13);

  return v14;
}

- (void)brandWithURI:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_229167520();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_229154B7C;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = self;
  swift_retain();
  sub_22914979C(v6, v8, 0, 0, (uint64_t)sub_229154B80, v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)brandWithURI:(id)a3 usingSim:(id)a4 completion:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_229167520();
  unint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = sub_229167520();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v7;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_229154ADC;
  *(void *)(v14 + 24) = v13;
  v15 = self;
  swift_retain();
  sub_22914979C(v8, v10, v11, (uint64_t)a4, (uint64_t)sub_229154B80, v14);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)clearUnusedCachedLogos:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  swift_retain();
  sub_22914F3A8((uint64_t)sub_229154AD4, v5);

  swift_release();
  swift_release();
}

- (void)fetchAssetWithURL:(id)a3 assetType:(int64_t)a4 completion:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_2291673E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2291673B0();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v7;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_229154ACC;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = self;
  swift_retain();
  swift_retain();
  sub_22914E508((uint64_t)v11, a4, (uint64_t)sub_229154B84, v13);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BSBrandManagerObjcShim)init
{
  result = (BSBrandManagerObjcShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end