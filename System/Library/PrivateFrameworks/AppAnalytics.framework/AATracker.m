@interface AATracker
- (AATracker)init;
- (NSArray)debugPath;
- (NSArray)path;
- (NSString)identifier;
- (NSString)name;
- (id)chainWithName:(id)a3;
- (id)chainWithName:(id)a3 identifier:(id)a4;
- (id)delayedSubmitEventType:(Class)a3;
- (id)delayedSubmitEventType:(Class)a3 completion:(id)a4;
- (id)delayedSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4;
- (id)delayedSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5;
- (id)delayedSubmitRawEvent:(id)a3;
- (id)delayedSubmitRawEvent:(id)a3 completion:(id)a4;
- (id)delayedSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4;
- (id)delayedSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5;
- (id)onSessionChangeWithBlock:(id)a3;
- (void)clearStack:(Class)a3;
- (void)clearStackEventType:(Class)a3 includeParentTrackers:(BOOL)a4;
- (void)dynamicTransactionWithIdentifier:(id)a3 block:(id)a4;
- (void)enterGroup;
- (void)enterGroupWithName:(id)a3;
- (void)enterGroupWithName:(id)a3 contentType:(int64_t)a4;
- (void)explicitSubmitEvent:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5;
- (void)explicitSubmitEvent:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6;
- (void)explicitSubmitEvent:(Class)a3 submitTime:(id)a4;
- (void)explicitSubmitEvent:(Class)a3 submitTime:(id)a4 completion:(id)a5;
- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5;
- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6;
- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4;
- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4 completion:(id)a5;
- (void)ifSession:(id)a3;
- (void)leaveGroup;
- (void)popDataEventByName:(id)a3;
- (void)popDataEventType:(Class)a3;
- (void)pushDataEvent:(id)a3 traits:(id)a4 file:(id)a5 line:(int64_t)a6;
- (void)registerDataEventType:(Class)a3 block:(id)a4;
- (void)removeSessionObserversForObject:(id)a3;
- (void)resume;
- (void)submitEventType:(Class)a3;
- (void)submitEventType:(Class)a3 completion:(id)a4;
- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4;
- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5;
- (void)submitRawEvent:(id)a3;
- (void)submitRawEvent:(id)a3 completion:(id)a4;
- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4;
- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5;
- (void)suspend;
- (void)timeEventType:(Class)a3;
- (void)timeEventType:(Class)a3 startTime:(id)a4;
- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4;
- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5;
- (void)timeRawEvent:(id)a3;
- (void)timeRawEvent:(id)a3 startTime:(id)a4;
- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4;
- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5;
- (void)transactionWithBlock:(id)a3;
- (void)whenSession:(id)a3;
@end

@implementation AATracker

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)identifier
{
  if (*(void *)&self->name[OBJC_IVAR___AATracker_identifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A916AF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (AATracker)init
{
  result = (AATracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)timeEventType:(Class)a3
{
}

- (void)timeEventType:(Class)a3 startTime:(id)a4
{
}

- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  v7 = self;
  BridgedTracker.time(eventType:submitAndRestartWithSession:)(ObjCClassMetadata, v4);
}

- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5
{
}

- (void)timeRawEvent:(id)a3
{
}

- (void)timeRawEvent:(id)a3 startTime:(id)a4
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916AC60();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1A916AC10();
  [(AATracker *)v11 timeRawEvent:v10 submitAndRestartWithSession:1 startTime:v12];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  BridgedTracker.time(rawEvent:submitAndRestartWithSession:)(v6, v4);
}

- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5
{
  BOOL v24 = a4;
  uint64_t v7 = sub_1A916AC90();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v21 - v12;
  sub_1A916AC60();
  uint64_t v14 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  uint64_t v15 = *(void *)(v14 + 88);
  uint64_t v22 = *(void *)(v14 + 80);
  uint64_t v23 = v15;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = v16 + v9;
  v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = v14;
  *((void *)v18 + 3) = a3;
  *((void *)v18 + 4) = 0x8000000000000000;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v16], v10, v7);
  v18[v17] = v24;
  id v19 = a3;
  v20 = self;
  swift_retain();
  sub_1A908CAA8(v22, (uint64_t)sub_1A9102570, (uint64_t)v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)submitEventType:(Class)a3
{
}

- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v7 = self;
  BridgedTracker.submit(eventType:onlyIfTimed:)(ObjCClassMetadata, v4);
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
  v10[3] = &block_descriptor_315;
  uint64_t v8 = _Block_copy(v10);
  uint64_t v9 = self;
  swift_retain();
  swift_release();
  [(AATracker *)v9 submitEventType:a3 onlyIfTimed:0 completion:v8];
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
  id v10 = self;
  BridgedTracker.submit(eventType:onlyIfTimed:completion:)(ObjCClassMetadata, v5, (uint64_t)sub_1A90F1188, v9);

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
  BridgedTracker.submit(rawEvent:onlyIfTimed:)(v6, v4);
}

- (void)submitRawEvent:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  BridgedTracker.submit(rawEvent:completion:)(v8, (uint64_t)sub_1A90F1188, v7);

  swift_release();
}

- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  uint64_t v11 = self;
  BridgedTracker.submit(rawEvent:onlyIfTimed:completion:)(v10, v5, (uint64_t)sub_1A90F1188, v9);

  swift_release();
}

- (id)delayedSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = _Block_copy(a5);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = self;
  id v11 = BridgedTracker.delayedSubmit(eventType:onlyIfTimed:completion:)(ObjCClassMetadata, v5, (uint64_t)sub_1A90F1188, v9);

  swift_release();

  return v11;
}

- (id)delayedSubmitEventType:(Class)a3
{
  v9[4] = j_nullsub_1;
  v9[5] = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1A90E015C;
  v9[3] = &block_descriptor_292;
  BOOL v5 = _Block_copy(v9);
  id v6 = self;
  id v7 = [(AATracker *)v6 delayedSubmitEventType:a3 onlyIfTimed:0 completion:v5];
  _Block_release(v5);

  return v7;
}

- (id)delayedSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4
{
  BOOL v4 = a4;
  v11[4] = j_nullsub_1;
  v11[5] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1A90E015C;
  v11[3] = &block_descriptor_289;
  id v7 = _Block_copy(v11);
  id v8 = self;
  id v9 = [(AATracker *)v8 delayedSubmitEventType:a3 onlyIfTimed:v4 completion:v7];
  _Block_release(v7);

  return v9;
}

- (id)delayedSubmitEventType:(Class)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v12[4] = sub_1A90F1188;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1A90E015C;
  v12[3] = &block_descriptor_286;
  id v8 = _Block_copy(v12);
  id v9 = self;
  swift_retain();
  swift_release();
  id v10 = [(AATracker *)v9 delayedSubmitEventType:a3 onlyIfTimed:0 completion:v8];
  _Block_release(v8);

  swift_release();

  return v10;
}

- (id)delayedSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = self;
  id v12 = BridgedTracker.delayedSubmit(rawEvent:onlyIfTimed:completion:)(v10, v5, (uint64_t)sub_1A90F1188, v9);

  swift_release();

  return v12;
}

- (id)delayedSubmitRawEvent:(id)a3
{
  v10[4] = j_nullsub_1;
  v10[5] = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1A90E015C;
  v10[3] = &block_descriptor_275;
  BOOL v5 = _Block_copy(v10);
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = [(AATracker *)v7 delayedSubmitRawEvent:v6 onlyIfTimed:0 completion:v5];
  _Block_release(v5);

  return v8;
}

- (id)delayedSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4
{
  BOOL v4 = a4;
  v12[4] = nullsub_1;
  v12[5] = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1A90E015C;
  v12[3] = &block_descriptor_272;
  uint64_t v7 = _Block_copy(v12);
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = [(AATracker *)v9 delayedSubmitRawEvent:v8 onlyIfTimed:v4 completion:v7];
  _Block_release(v7);

  return v10;
}

- (id)delayedSubmitRawEvent:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v13[4] = sub_1A90F1188;
  v13[5] = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1A90E015C;
  v13[3] = &block_descriptor_269;
  id v8 = _Block_copy(v13);
  id v9 = a3;
  id v10 = self;
  swift_retain();
  swift_release();
  id v11 = [(AATracker *)v10 delayedSubmitRawEvent:v9 onlyIfTimed:0 completion:v8];
  _Block_release(v8);

  swift_release();

  return v11;
}

- (void)explicitSubmitEvent:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v9 = sub_1A916AC90();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1A916AC60();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  unint64_t v16 = self;
  BridgedTracker.explicitSubmit(eventType:onlyIfTimed:submitTime:completion:)(ObjCClassMetadata, v7, (uint64_t)v12, (uint64_t)sub_1A90F1188, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)explicitSubmitEvent:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5
{
}

- (void)explicitSubmitEvent:(Class)a3 submitTime:(id)a4
{
}

- (void)explicitSubmitEvent:(Class)a3 submitTime:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_1A916AC90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  sub_1A916AC60();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = self;
  uint64_t v15 = (void *)sub_1A916AC10();
  aBlock[4] = sub_1A90F1188;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A90E015C;
  aBlock[3] = &block_descriptor_258;
  unint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [(AATracker *)v14 explicitSubmitEvent:a3 onlyIfTimed:0 submitTime:v15 completion:v16];
  _Block_release(v16);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v10 = sub_1A916AC90();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  sub_1A916AC60();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = a3;
  uint64_t v17 = self;
  BridgedTracker.explicitSubmit(rawEvent:onlyIfTimed:submitTime:completion:)(v16, v7, (uint64_t)v13, (uint64_t)sub_1A90F1188, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5
{
  uint64_t v8 = sub_1A916AC90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916AC60();
  id v12 = a3;
  uint64_t v13 = self;
  BridgedTracker.explicitSubmit(rawEvent:onlyIfTimed:submitTime:)(v12, a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916AC60();
  id v10 = a3;
  uint64_t v11 = self;
  BridgedTracker.explicitRawSubmit(rawEvent:submitTime:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_1A916AC90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_1A916AC60();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = (void *)sub_1A916AC10();
  aBlock[4] = sub_1A90F0CF8;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A90E015C;
  aBlock[3] = &block_descriptor_247;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [(AATracker *)v15 explicitSubmitRawEvent:v14 onlyIfTimed:0 submitTime:v16 completion:v17];
  _Block_release(v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)registerDataEventType:(Class)a3 block:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  BridgedTracker.register(dataType:block:)(ObjCClassMetadata, (uint64_t)sub_1A910340C, v7);

  swift_release();
}

- (void)pushDataEvent:(id)a3 traits:(id)a4 file:(id)a5 line:(int64_t)a6
{
  uint64_t v10 = sub_1A916AF90();
  uint64_t v12 = v11;
  swift_unknownObjectRetain();
  id v13 = a4;
  id v14 = self;
  BridgedTracker.push(data:traits:file:line:)((uint64_t)a3, (uint64_t)a4, v10, v12, a6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)popDataEventType:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  BOOL v5 = self;
  BridgedTracker.pop(dataType:)(ObjCClassMetadata);
}

- (void)popDataEventByName:(id)a3
{
  uint64_t v4 = sub_1A916AF90();
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  uint64_t v8 = *(void *)(v7 + 80);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v4;
  v9[4] = v6;
  uint64_t v10 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1A908CAA8(v8, (uint64_t)sub_1A9102DE8, (uint64_t)v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)clearStack:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v5 = self;
  BridgedTracker.clearStack(dataType:)(ObjCClassMetadata);
}

- (void)clearStackEventType:(Class)a3 includeParentTrackers:(BOOL)a4
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v7 = self;
  BridgedTracker.clearStack(of:includeParentTrackers:)(ObjCClassMetadata, a4);
}

- (id)chainWithName:(id)a3
{
  uint64_t v4 = sub_1A916AF90();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = BridgedTracker.chain(name:)(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (id)chainWithName:(id)a3 identifier:(id)a4
{
  uint64_t v6 = sub_1A916AF90();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_1A916AF90();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = self;
  id v12 = BridgedTracker.chain(name:identifier:)(v6, v8, v9, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

- (NSArray)path
{
  return (NSArray *)sub_1A9100CCC(self, (uint64_t)a2, (void (*)(void))Tracker.path.getter);
}

- (NSArray)debugPath
{
  return (NSArray *)sub_1A9100CCC(self, (uint64_t)a2, (void (*)(void))Tracker.debugPath.getter);
}

- (id)onSessionChangeWithBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  id v7 = BridgedTracker.onSessionChange(block:)((uint64_t)sub_1A91033AC, v5);

  swift_release();

  return v7;
}

- (void)removeSessionObserversForObject:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  BridgedTracker.removeSessionObservers(forObject:)((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)transactionWithBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  id v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_1A910394C;
  v7[4] = v5;
  uint64_t v8 = *(void *)(v6 + 80);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v6;
  v9[3] = sub_1A9103944;
  v9[4] = v7;
  uint64_t v10 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v8, (uint64_t)sub_1A9103A40, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)dynamicTransactionWithIdentifier:(id)a3 block:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A916AF90();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = self;
  v11[3] = sub_1A910394C;
  v11[4] = v9;
  uint64_t v12 = *(void *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  v13[2] = v10;
  v13[3] = v6;
  v13[4] = v8;
  v13[5] = sub_1A9103944;
  void v13[6] = v11;
  id v14 = self;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A908CAA8(v12, (uint64_t)sub_1A9102F6C, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)whenSession:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = sub_1A910394C;
  v7[3] = v5;
  v7[4] = self;
  uint64_t v8 = *(void *)(v6 + 80);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v6;
  v9[3] = sub_1A9103948;
  v9[4] = v7;
  uint64_t v10 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v8, (uint64_t)sub_1A9103A3C, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)ifSession:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = sub_1A9103250;
  v7[3] = v5;
  v7[4] = self;
  uint64_t v8 = *(void *)(v6 + 80);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v6;
  v9[3] = sub_1A9103948;
  v9[4] = v7;
  uint64_t v10 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v8, (uint64_t)sub_1A9103A38, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)enterGroupWithName:(id)a3
{
  uint64_t v4 = sub_1A916AF90();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  BridgedTracker.enterGroup(groupName:)(v8);

  swift_bridgeObjectRelease();
}

- (void)enterGroupWithName:(id)a3 contentType:(int64_t)a4
{
  uint64_t v6 = sub_1A916AF90();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  BridgedTracker.enterGroup(groupName:contentType:)(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)enterGroup
{
  v2 = self;
  BridgedTracker.enterGroup()();
}

- (void)leaveGroup
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  uint64_t v4 = *(void *)(v3 + 80);
  uint64_t v5 = (void *)swift_allocObject();
  v5[3] = 0;
  v5[4] = 0;
  v5[2] = v3;
  uint64_t v6 = self;
  swift_retain();
  sub_1A908CAA8(v4, (uint64_t)sub_1A9103A34, (uint64_t)v5);

  swift_release();
}

- (void)suspend
{
}

- (void)resume
{
}

@end