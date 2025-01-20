@interface AAAccessTracker
- (AAAccessTracker)init;
- (BOOL)isDiagnosticSubmissionAllowed;
- (id)peekDataEventByName:(id)a3;
- (void)explicitSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5;
- (void)explicitSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6;
- (void)explicitSubmitEventType:(Class)a3 submitTime:(id)a4;
- (void)explicitSubmitEventType:(Class)a3 submitTime:(id)a4 completion:(id)a5;
- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5;
- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6;
- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4;
- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4 completion:(id)a5;
- (void)popDataEventByName:(id)a3;
- (void)popDataEventType:(Class)a3;
- (void)pushDataEvent:(id)a3 traits:(id)a4 file:(id)a5 line:(int64_t)a6;
- (void)submitEventType:(Class)a3;
- (void)submitEventType:(Class)a3 completion:(id)a4;
- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4;
- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5;
- (void)submitRawEvent:(id)a3;
- (void)submitRawEvent:(id)a3 completion:(id)a4;
- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4;
- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5;
- (void)timeEventType:(Class)a3;
- (void)timeEventType:(Class)a3 startTime:(id)a4;
- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4;
- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5;
- (void)timeRawEvent:(id)a3;
- (void)timeRawEvent:(id)a3 startTime:(id)a4;
- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4;
- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5;
@end

@implementation AAAccessTracker

- (AAAccessTracker)init
{
  result = (AAAccessTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)timeEventType:(Class)a3
{
  ObjCClassMetadata = (char *)swift_getObjCClassMetadata();
  v5 = self;
  BridgedAccessTracker.time(eventType:)(ObjCClassMetadata);
}

- (void)timeEventType:(Class)a3 startTime:(id)a4
{
}

- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4
{
  BOOL v4 = a4;
  ObjCClassMetadata = (char *)swift_getObjCClassMetadata();
  v7 = self;
  BridgedAccessTracker.time(eventType:submitAndRestartWithSession:)(ObjCClassMetadata, v4);
}

- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5
{
}

- (void)timeRawEvent:(id)a3
{
}

- (void)timeRawEvent:(id)a3 startTime:(id)a4
{
}

- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  BridgedAccessTracker.time(rawEvent:submitAndRestartWithSession:)(v6, v4);
}

- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5
{
}

- (void)submitEventType:(Class)a3
{
}

- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  v7 = self;
  BridgedAccessTracker.submit(eventType:onlyIfTimed:)(ObjCClassMetadata, v4);
}

- (void)submitEventType:(Class)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v10[4] = sub_1A90F1188;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1A90E015C;
  v10[3] = &block_descriptor_93;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  [(AAAccessTracker *)v9 submitEventType:a3 onlyIfTimed:0 completion:v8];
  _Block_release(v8);

  swift_release();
}

- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = _Block_copy(a5);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AAAccessTracker_eventMirrorStore);
  memset(v13, 0, sizeof(v13));
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1A90F1188;
  *(void *)(v11 + 24) = v9;
  v12 = self;
  swift_retain();
  swift_retain();
  sub_1A90DFCA4(ObjCClassMetadata, v10 | 0x4000000000000000, v5, (uint64_t)v13, (void (*)(uint64_t *))sub_1A90F1214, v11);
  swift_release();
  swift_release();
  sub_1A909B5DC((uint64_t)v13);

  swift_release();
}

- (void)submitRawEvent:(id)a3
{
}

- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  BridgedAccessTracker.submit(rawEvent:onlyIfTimed:)(v6, v4);
}

- (void)submitRawEvent:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v11[4] = sub_1A90F1188;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1A90E015C;
  v11[3] = &block_descriptor_78;
  v8 = _Block_copy(v11);
  id v9 = a3;
  uint64_t v10 = self;
  swift_retain();
  swift_release();
  [(AAAccessTracker *)v10 submitRawEvent:v9 onlyIfTimed:0 completion:v8];
  _Block_release(v8);

  swift_release();
}

- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  memset(v13, 0, sizeof(v13));
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1A90F1188;
  *(void *)(v10 + 24) = v9;
  id v11 = a3;
  v12 = self;
  swift_retain();
  sub_1A90DFCA4((uint64_t)a3, 0x8000000000000000, v5, (uint64_t)v13, (void (*)(uint64_t *))sub_1A90F1214, v10);

  swift_release();
  sub_1A909B5DC((uint64_t)v13);

  swift_release();
}

- (void)explicitSubmitEventType:(Class)a3 submitTime:(id)a4
{
}

- (void)explicitSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5
{
}

- (void)explicitSubmitEventType:(Class)a3 submitTime:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_1A916AC90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1A916AC60();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  v14 = self;
  v15 = (void *)sub_1A916AC10();
  aBlock[4] = sub_1A90F1188;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A90E015C;
  aBlock[3] = &block_descriptor_63;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [(AAAccessTracker *)v14 explicitSubmitEventType:a3 onlyIfTimed:0 submitTime:v15 completion:v16];
  _Block_release(v16);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)explicitSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6
{
  BOOL v19 = a4;
  uint64_t v8 = sub_1A916AC90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1A916AC60();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AAAccessTracker_eventMirrorStore);
  memset(v20, 0, sizeof(v20));
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_1A90F1188;
  *(void *)(v16 + 24) = v14;
  v17 = self;
  swift_retain();
  swift_retain();
  sub_1A90E0E54(ObjCClassMetadata, v15 | 0x4000000000000000, v19, (uint64_t)v11, (uint64_t)v20, (void (*)(void))sub_1A90F1214, v16, (unint64_t *)&unk_1EB686890, (uint64_t)&type metadata for BridgedEvent, (uint64_t)&off_1EFF9D000);
  swift_release();
  swift_release();
  sub_1A909B5DC((uint64_t)v20);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4
{
}

- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5
{
}

- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_1A916AC90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1A916AC60();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  uint64_t v15 = self;
  uint64_t v16 = (void *)sub_1A916AC10();
  aBlock[4] = sub_1A90F1188;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A90E015C;
  aBlock[3] = &block_descriptor_48;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [(AAAccessTracker *)v15 explicitSubmitRawEvent:v14 onlyIfTimed:0 submitTime:v16 completion:v17];
  _Block_release(v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v10 = sub_1A916AC90();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a6);
  sub_1A916AC60();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  memset(v19, 0, sizeof(v19));
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_1A90F0CF8;
  *(void *)(v16 + 24) = v15;
  id v17 = a3;
  uint64_t v18 = self;
  swift_retain();
  sub_1A90E0E54((uint64_t)a3, 0x8000000000000000, v7, (uint64_t)v13, (uint64_t)v19, (void (*)(void))sub_1A90F1214, v16, (unint64_t *)&unk_1EB686890, (uint64_t)&type metadata for BridgedEvent, (uint64_t)&off_1EFF9D000);

  swift_release();
  sub_1A909B5DC((uint64_t)v19);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)pushDataEvent:(id)a3 traits:(id)a4 file:(id)a5 line:(int64_t)a6
{
  uint64_t v10 = sub_1A916AF90();
  uint64_t v12 = v11;
  swift_unknownObjectRetain();
  id v13 = a4;
  id v14 = self;
  BridgedAccessTracker.push(data:traits:file:line:)((uint64_t)a3, (uint64_t)a4, v10, v12, a6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)popDataEventType:(Class)a3
{
  swift_getObjCClassMetadata();
  BOOL v4 = self;
  BridgedAccessTracker.pop(dataType:)();
}

- (void)popDataEventByName:(id)a3
{
  uint64_t v4 = sub_1A916AF90();
  id v6 = v5;
  BOOL v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  BridgedAccessTracker.pop(dataName:)(v8);

  swift_bridgeObjectRelease();
}

- (id)peekDataEventByName:(id)a3
{
  uint64_t v4 = sub_1A916AF90();
  uint64_t v6 = v5;
  BOOL v7 = self;
  BridgedAccessTracker.peek(dataName:)(v4, v6, (uint64_t)v16);

  swift_bridgeObjectRelease();
  uint64_t v8 = v17;
  if (v17)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = MEMORY[0x1F4188790](v9);
    id v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    id v14 = (void *)sub_1A916B9D0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)isDiagnosticSubmissionAllowed
{
  v2 = self;
  sub_1A9095B68((char *)&v6);
  int v3 = v6;

  return (v3 & 1) == 0 && v3 != 2;
}

@end