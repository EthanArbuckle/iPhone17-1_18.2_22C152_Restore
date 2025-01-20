@interface ATXSportsServer
+ (ATXSportsServer)sharedInstance;
- (ATXSportsServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)requestedSchedulesForTeamsWithReply:(id)a3;
@end

@implementation ATXSportsServer

+ (ATXSportsServer)sharedInstance
{
  if (qword_1EBD24340 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBD24338;
  return (ATXSportsServer *)v2;
}

- (ATXSportsServer)init
{
  return (ATXSportsServer *)sub_1D13B9F94();
}

- (void)requestedSchedulesForTeamsWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23A30);
  MEMORY[0x1F4188790](v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_1D13F27D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA64E330;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA64E340;
  v13[5] = v12;
  v14 = self;
  sub_1D1399050((uint64_t)v8, (uint64_t)&unk_1EA64E350, (uint64_t)v13);
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1D13C2030(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
}

@end