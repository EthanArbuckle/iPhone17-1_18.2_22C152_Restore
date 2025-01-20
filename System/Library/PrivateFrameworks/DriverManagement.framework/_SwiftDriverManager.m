@interface _SwiftDriverManager
+ (id)sharedManager;
- (_SwiftDriverManager)init;
- (id)driverApprovalStatesForThirdPartyApp:(id)a3;
- (int64_t)driverCount;
- (int64_t)driverCountForAppID:(id)a3;
- (int64_t)thirdPartyDriverCount;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)refresh;
- (void)removeObserver:(id)a3;
- (void)setDriverState:(id)a3 approved:(BOOL)a4;
@end

@implementation _SwiftDriverManager

+ (id)sharedManager
{
  uint64_t v2 = sub_24D006950();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  v6 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (qword_26B183078 != -1) {
    swift_once();
  }
  id v7 = (id)static DriverManager.shared;

  return v7;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (int64_t)driverCount
{
  uint64_t v2 = self;
  Swift::Int v3 = DriverManager.driverCount()();

  return v3;
}

- (int64_t)thirdPartyDriverCount
{
  uint64_t v2 = self;
  Swift::Int v3 = DriverManager.thirdPartyDriverCount()();

  return v3;
}

- (int64_t)driverCountForAppID:(id)a3
{
  uint64_t v4 = sub_24D006A60();
  v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  Swift::Int v9 = DriverManager.driverCount(forAppID:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)refresh
{
  uint64_t v2 = self;
  DriverManager.refresh()();
}

- (_SwiftDriverManager)init
{
  return (_SwiftDriverManager *)sub_24CFF71E4();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = self;
  swift_retain();
  sub_24D0031DC();
  sub_24D006A90();
  swift_bridgeObjectRelease();
  xpc_set_event();
  swift_release();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(_SwiftDriverManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  Swift::Int v3 = (char *)self + OBJC_IVAR____SwiftDriverManager__driverApprovalStates;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D458);
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)setDriverState:(id)a3 approved:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (char *)a3;
  Swift::String v8 = self;
  if (v4) {
    int v7 = 1;
  }
  else {
    int v7 = 2;
  }
  DriverManager.setDriverState(driverApprovalState:state:)(v6, v7);
}

- (id)driverApprovalStatesForThirdPartyApp:(id)a3
{
  uint64_t v4 = sub_24D006A60();
  uint64_t v6 = v5;
  int v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  Swift::String v8 = self;
  objc_msgSend(v7, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  v11[2] = v4;
  v11[3] = v6;
  sub_24CFFBDD8((uint64_t (*)(id *))sub_24D0009D0, (uint64_t)v11, v11[5]);
  objc_msgSend(v7, sel_unlock);

  swift_bridgeObjectRelease();
  type metadata accessor for DriverApprovalState();
  Swift::Int v9 = (void *)sub_24D006B60();
  swift_bridgeObjectRelease();

  return v9;
}

@end