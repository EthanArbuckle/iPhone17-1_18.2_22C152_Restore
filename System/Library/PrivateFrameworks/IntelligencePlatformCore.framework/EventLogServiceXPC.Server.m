@interface EventLogServiceXPC.Server
- (_TtCC24IntelligencePlatformCore18EventLogServiceXPC6Server)init;
- (void)dealloc;
- (void)logEndWithId:(int64_t)a3 timestamp:(id)a4 dependencies:(id)a5 payloadType:(id)a6 payloadVariant:(id)a7 payload:(id)a8 completion:(id)a9;
- (void)logInstantWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 dependencies:(id)a7 payloadType:(id)a8 payloadVariant:(id)a9 payload:(id)a10 completion:(id)a11;
- (void)logStartWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 completion:(id)a7;
@end

@implementation EventLogServiceXPC.Server

- (void)dealloc
{
  v2 = self;
  EventLogServiceXPC.Server.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (void)logStartWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 completion:(id)a7
{
  uint64_t v9 = sub_1C791F620();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a7);
  sub_1C791F5C0();
  sub_1C7925E60();
  *(void *)(swift_allocObject() + 16) = v13;
  v14 = self;
  EventLogServiceXPC.Server.logStart(withId:timestamp:name:parent:completion:)();

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)logEndWithId:(int64_t)a3 timestamp:(id)a4 dependencies:(id)a5 payloadType:(id)a6 payloadVariant:(id)a7 payload:(id)a8 completion:(id)a9
{
  uint64_t v29 = a3;
  uint64_t v30 = sub_1C791F620();
  uint64_t v12 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = _Block_copy(a9);
  sub_1C791F5C0();
  sub_1C6E3EDD4(0, (unint64_t *)&qword_1EBC32650);
  uint64_t v15 = sub_1C7926390();
  uint64_t v27 = sub_1C7925E60();
  uint64_t v17 = v16;
  if (a7)
  {
    uint64_t v18 = sub_1C7925E60();
    a7 = v19;
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v20 = a8;
  v21 = self;
  uint64_t v22 = sub_1C791F3C0();
  unint64_t v24 = v23;

  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v28;
  EventLogServiceXPC.Server.logEnd(withId:timestamp:dependencies:payloadType:payloadVariant:payload:completion:)(v29, (uint64_t)v14, v15, v27, v17, v18, (uint64_t)a7, v22, v24, (uint64_t)sub_1C70F3744, v25, v26, v27, (uint64_t)v28, v29, v30, v31, v32, v33,
    v34,
    v35,
    v36,
    v37);
  swift_release();
  sub_1C6E355F8(v22, v24);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v30);
}

- (void)logInstantWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 dependencies:(id)a7 payloadType:(id)a8 payloadVariant:(id)a9 payload:(id)a10 completion:(id)a11
{
  uint64_t v32 = a3;
  uint64_t v33 = a6;
  id v12 = a9;
  uint64_t v13 = sub_1C791F620();
  uint64_t v34 = *(void *)(v13 - 8);
  uint64_t v35 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = _Block_copy(a11);
  sub_1C791F5C0();
  uint64_t v30 = sub_1C7925E60();
  uint64_t v31 = v16;
  sub_1C6E3EDD4(0, (unint64_t *)&qword_1EBC32650);
  uint64_t v17 = sub_1C7926390();
  uint64_t v28 = sub_1C7925E60();
  uint64_t v19 = v18;
  if (a9)
  {
    uint64_t v20 = sub_1C7925E60();
    id v12 = v21;
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v22 = a10;
  unint64_t v23 = self;
  uint64_t v24 = sub_1C791F3C0();
  unint64_t v26 = v25;

  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v29;
  EventLogServiceXPC.Server.logInstant(withId:timestamp:name:parent:dependencies:payloadType:payloadVariant:payload:completion:)(v32, (uint64_t)v15, v30, v31, v33, v17, v28, v19, v20, (uint64_t)v12, v24, v26, (uint64_t)sub_1C70F36EC, v27, v28, (uint64_t)v29, v30, v31, v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39);
  swift_release();
  sub_1C6E355F8(v24, v26);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v15, v35);
}

- (_TtCC24IntelligencePlatformCore18EventLogServiceXPC6Server)init
{
}

@end