@interface AASessionManager
- (AAProcessorManager)processorManager;
- (AASessionManager)init;
- (AASessionManager)initWithAccessQueue:(id)a3;
- (AASessionManager)initWithAccessQueue:(id)a3 privacyValidationProvider:(id)a4;
- (AASessionManager)initWithAccessQueue:(id)a3 privacyValidationProvider:(id)a4 diagnosticsConsentProvider:(id)a5;
- (AASessionManager)initWithPrivacyValidationProvider:(id)a3;
- (AATracker)tracker;
- (void)endSession;
- (void)endSessionWithCompletion:(id)a3;
- (void)endSessionWithEndDate:(id)a3 completion:(id)a4;
- (void)endSync;
- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)pushSessionData:(id)a3;
- (void)pushSessionData:(id)a3 submitEventQueues:(BOOL)a4;
- (void)pushSessionData:(id)a3 traits:(id)a4;
- (void)pushSessionData:(id)a3 traits:(id)a4 submitEventQueues:(BOOL)a5;
- (void)startSessionForKind:(int64_t)a3 withName:(id)a4;
- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5;
- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5 startDate:(id)a6;
- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5 startDate:(id)a6 timestampJitter:(id)a7;
- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5 startDate:(id)a6 timestampJitter:(id)a7 timeDurationGranularity:(int64_t)a8;
- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 startDate:(id)a5;
- (void)transaction:(id)a3;
@end

@implementation AASessionManager

- (AATracker)tracker
{
  return (AATracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___AASessionManager_tracker));
}

- (AAProcessorManager)processorManager
{
  return (AAProcessorManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___AASessionManager_processorManager));
}

- (AASessionManager)init
{
  return (AASessionManager *)BridgedSessionManager.init()();
}

- (AASessionManager)initWithPrivacyValidationProvider:(id)a3
{
  return (AASessionManager *)BridgedSessionManager.init(privacyValidationProvider:)(a3);
}

- (AASessionManager)initWithAccessQueue:(id)a3
{
  return (AASessionManager *)BridgedSessionManager.init(accessQueue:)(a3);
}

- (AASessionManager)initWithAccessQueue:(id)a3 privacyValidationProvider:(id)a4
{
  return (AASessionManager *)BridgedSessionManager.init(accessQueue:privacyValidationProvider:)(a3, a4);
}

- (AASessionManager)initWithAccessQueue:(id)a3 privacyValidationProvider:(id)a4 diagnosticsConsentProvider:(id)a5
{
  return (AASessionManager *)BridgedSessionManager.init(accessQueue:privacyValidationProvider:diagnosticsConsentProvider:)(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)pushSessionData:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits());
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_init);
  [(AASessionManager *)v7 pushSessionData:v6 traits:v8];
}

- (void)pushSessionData:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  BridgedSessionManager.push(_:traits:)((uint64_t)v6);
}

- (void)pushSessionData:(id)a3 submitEventQueues:(BOOL)a4
{
  id v6 = objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits());
  id v7 = a3;
  id v8 = self;
  id v9 = objc_msgSend(v6, sel_init);
  [(AASessionManager *)v8 pushSessionData:v7 traits:v9];
}

- (void)pushSessionData:(id)a3 traits:(id)a4 submitEventQueues:(BOOL)a5
{
}

- (void)transaction:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AASessionManager_sessionManager);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1A9103250;
  *(void *)(v7 + 24) = v5;
  uint64_t v8 = *(void *)(v6 + 48);
  id v9 = (void *)swift_allocObject();
  v9[2] = v6;
  v9[3] = sub_1A9159F54;
  v9[4] = v7;
  v10 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v8, (uint64_t)sub_1A9159F50, (uint64_t)v9);

  swift_release();
  swift_release();

  swift_release();
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_1A916AF90();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = self;
  BridgedSessionManager.start(for:name:)(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5
{
  uint64_t v8 = sub_1A916AC90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    sub_1A916AF90();
    goto LABEL_5;
  }
  sub_1A916AF90();
  uint64_t v13 = v12;
  sub_1A916AF90();
  if (!v13)
  {
LABEL_5:
    v16 = self;
    v15 = 0;
    goto LABEL_6;
  }
  v14 = self;
  v15 = (void *)sub_1A916AF60();
LABEL_6:
  v17 = (void *)sub_1A916AF60();
  sub_1A916AC80();
  v18 = (void *)sub_1A916AC10();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  [(AASessionManager *)self startSessionForKind:a3 withName:v15 identifier:v17 startDate:v18];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 startDate:(id)a5
{
  uint64_t v8 = sub_1A916AC90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v12 = sub_1A916AF90();
    a4 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  sub_1A916AC60();
  v14 = self;
  BridgedSessionManager.start(for:name:startDate:)(a3, v12, a4);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5 startDate:(id)a6
{
  uint64_t v9 = sub_1A916AC90();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1A916AF90();
    a4 = v13;
  }
  sub_1A916AF90();
  sub_1A916AC60();
  v14 = self;
  if (a4) {
    uint64_t v15 = (void *)sub_1A916AF60();
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = (void *)sub_1A916AF60();
  v17 = (void *)sub_1A916AC10();
  if (qword_1EB686FB8 != -1) {
    swift_once();
  }
  [(AASessionManager *)self startSessionForKind:a3 withName:v15 identifier:v16 startDate:v17 timestampJitter:qword_1EB686FB0];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5 startDate:(id)a6 timestampJitter:(id)a7
{
  int64_t v21 = a3;
  uint64_t v10 = sub_1A916AC90();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1A916AF90();
    a4 = v14;
  }
  sub_1A916AF90();
  sub_1A916AC60();
  id v15 = a7;
  v16 = self;
  if (a4) {
    v17 = (void *)sub_1A916AF60();
  }
  else {
    v17 = 0;
  }
  uint64_t v18 = (void *)sub_1A916AF60();
  uint64_t v19 = (void *)sub_1A916AC10();
  [(AASessionManager *)self startSessionForKind:v21 withName:v17 identifier:v18 startDate:v19 timestampJitter:a7 timeDurationGranularity:0];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5 startDate:(id)a6 timestampJitter:(id)a7 timeDurationGranularity:(int64_t)a8
{
  unint64_t v22 = a3;
  uint64_t v23 = a8;
  uint64_t v11 = sub_1A916AC90();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v15 = sub_1A916AF90();
    a4 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v17 = sub_1A916AF90();
  uint64_t v19 = v18;
  sub_1A916AC60();
  id v20 = a7;
  int64_t v21 = self;
  BridgedSessionManager.start(for:name:identifier:startDate:timestampJitter:timeDurationGranularity:)(v22, v15, (unint64_t)a4, v17, v19, (uint64_t)v14, v20, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)endSession
{
  v2 = self;
  BridgedSessionManager.end()();
}

- (void)endSync
{
  v2 = self;
  SessionManager.endSync(timeout:)(4.0);
}

- (void)endSessionWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  BridgedSessionManager.end(completion:)((uint64_t)sub_1A9159F48, v5);

  swift_release();
}

- (void)endSessionWithEndDate:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_1A916AC90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = _Block_copy(a4);
  sub_1A916AC60();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  uint64_t v15 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AASessionManager_sessionManager);
  uint64_t v16 = *(void *)(v15 + 48);
  unint64_t v22 = self;
  sub_1A90F82A4();
  uint64_t v21 = *(void *)(v15 + 56);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v18 = (v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v15;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v19 + v17, v9, v6);
  id v20 = (uint64_t (**)())(v19 + v18);
  *id v20 = sub_1A9159F48;
  v20[1] = (uint64_t (*)())v14;
  swift_retain();
  swift_retain();
  sub_1A908CAA8(v16, (uint64_t)sub_1A9159B4C, v19);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1A90BA534;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  uint64_t v9 = self;
  BridgedSessionManager.flush(callbackQueue:completion:)(v8, (uint64_t)v6, v7);
  sub_1A909E0EC((uint64_t)v6);
}

@end