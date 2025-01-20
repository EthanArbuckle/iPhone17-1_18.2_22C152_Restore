@interface ViewXPC.Server
- (_TtCC24IntelligencePlatformCore7ViewXPC6Server)init;
- (void)accessInfoForViewName:(NSString *)a3 useCase:(NSString *)a4 completion:(id)a5;
- (void)accessTokenForFeaturesWithIsSandboxed:(BOOL)a3 useCase:(id)a4 completion:(id)a5;
- (void)accessTokenForViewName:(NSString *)a3 isSandboxed:(BOOL)a4 useCase:(NSString *)a5 completion:(id)a6;
- (void)performUpdateForViewNames:(NSArray *)a3 useCase:(NSString *)a4 includeDependencies:(BOOL)a5 completion:(id)a6;
- (void)reportSQLiteErrorForViewName:(NSString *)a3 sqliteErrorCode:(int64_t)a4 useCase:(NSString *)a5 completion:(id)a6;
- (void)reportUnknownErrorForViewName:(NSString *)a3 useCase:(NSString *)a4 completion:(id)a5;
@end

@implementation ViewXPC.Server

- (void)performUpdateForViewNames:(NSArray *)a3 useCase:(NSString *)a4 includeDependencies:(BOOL)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  *(unsigned char *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1C77690E4((uint64_t)&unk_1EA479F20, v11);
}

- (void)accessTokenForViewName:(NSString *)a3 isSandboxed:(BOOL)a4 useCase:(NSString *)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(unsigned char *)(v11 + 24) = a4;
  *(void *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_1C77690E4((uint64_t)&unk_1EA479F10, v11);
}

- (void)accessInfoForViewName:(NSString *)a3 useCase:(NSString *)a4 completion:(id)a5
{
}

- (void)accessTokenForFeaturesWithIsSandboxed:(BOOL)a3 useCase:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a4;
  v10 = self;
  sub_1C776E604(a3, (uint64_t)v9, (uint64_t)v10, v8);
  _Block_release(v8);
}

- (void)reportUnknownErrorForViewName:(NSString *)a3 useCase:(NSString *)a4 completion:(id)a5
{
}

- (void)reportSQLiteErrorForViewName:(NSString *)a3 sqliteErrorCode:(int64_t)a4 useCase:(NSString *)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_1C77690E4((uint64_t)&unk_1EA479EA0, (uint64_t)v11);
}

- (_TtCC24IntelligencePlatformCore7ViewXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore7ViewXPC6Server *)ViewXPC.Server.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end