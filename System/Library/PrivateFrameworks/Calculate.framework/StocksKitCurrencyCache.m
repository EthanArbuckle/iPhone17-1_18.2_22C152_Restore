@interface StocksKitCurrencyCache
+ (BOOL)isEnabled;
+ (_TtC9Calculate22StocksKitCurrencyCache)shared;
- (BOOL)needsRefresh;
- (BOOL)refreshSynchronously;
- (BOOL)refreshSynchronouslyWithTimeout:(double)a3;
- (NSDictionary)currencyData;
- (_TtC9Calculate22StocksKitCurrencyCache)init;
- (void)refreshWithCompletionHandler:(id)a3;
- (void)refreshWithTimeout:(double)a3 completionHandler:(id)a4;
@end

@implementation StocksKitCurrencyCache

+ (_TtC9Calculate22StocksKitCurrencyCache)shared
{
  if (qword_1EBA29B28 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBA29B20;
  return (_TtC9Calculate22StocksKitCurrencyCache *)v2;
}

+ (BOOL)isEnabled
{
  if (MEMORY[0x1E4FA80A0]) {
    BOOL v2 = MEMORY[0x1E4FA80A8] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  return !v2 && MEMORY[0x1E4FA80B8] != 0 && MEMORY[0x1E4FA8098] != 0 && MEMORY[0x1E4FA80B0] != 0;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA26900);
  MEMORY[0x1F4188790](v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_1BDDB00C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA0DF198;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA0DF1A0;
  v13[5] = v12;
  v14 = self;
  sub_1BDD2A490((uint64_t)v8, (uint64_t)&unk_1EA0DF1A8, (uint64_t)v13);
  swift_release();
}

- (void)refreshWithTimeout:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA26900);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(double *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = v11;
  *(void *)(v12 + 32) = self;
  uint64_t v13 = sub_1BDDB00C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA0DF178;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA0DF180;
  v15[5] = v14;
  v16 = self;
  sub_1BDD2A490((uint64_t)v10, (uint64_t)&unk_1EA0DF188, (uint64_t)v15);
  swift_release();
}

- (BOOL)refreshSynchronouslyWithTimeout:(double)a3
{
  return 0;
}

- (BOOL)refreshSynchronously
{
  return 0;
}

- (BOOL)needsRefresh
{
  return 0;
}

- (NSDictionary)currencyData
{
  sub_1BDD24D48(MEMORY[0x1E4FBC860]);
  sub_1BDD2C8D4();
  BOOL v2 = (void *)sub_1BDDAFC68();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtC9Calculate22StocksKitCurrencyCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StocksKitCurrencyCache();
  return [(StocksKitCurrencyCache *)&v3 init];
}

@end