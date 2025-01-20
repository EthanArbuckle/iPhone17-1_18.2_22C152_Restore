@interface DeviceActivityMonitorContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_TtC14DeviceActivity28DeviceActivityMonitorContext)init;
- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3;
- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)eventDidReachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5;
- (void)eventDidUnreachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5;
- (void)eventWillReachThresholdWarning:(id)a3 activity:(id)a4 replyHandler:(id)a5;
- (void)intervalDidEndForActivity:(id)a3 replyHandler:(id)a4;
- (void)intervalDidStartForActivity:(id)a3 replyHandler:(id)a4;
- (void)intervalWillEndWarningForActivity:(id)a3 replyHandler:(id)a4;
- (void)intervalWillStartWarningForActivity:(id)a3 replyHandler:(id)a4;
@end

@implementation DeviceActivityMonitorContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1C6C92B70((uint64_t)a1, (uint64_t)a2, &qword_1EA457660, (void **)&qword_1EA457F20);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1C6C92B70((uint64_t)a1, (uint64_t)a2, &qword_1EA457668, (void **)&qword_1EA457F28);
}

- (void)intervalDidStartForActivity:(id)a3 replyHandler:(id)a4
{
}

- (void)intervalDidEndForActivity:(id)a3 replyHandler:(id)a4
{
}

- (void)eventDidReachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
}

- (void)eventDidUnreachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
}

- (void)intervalWillStartWarningForActivity:(id)a3 replyHandler:(id)a4
{
}

- (void)intervalWillEndWarningForActivity:(id)a3 replyHandler:(id)a4
{
}

- (void)eventWillReachThresholdWarning:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
}

- (_TtC14DeviceActivity28DeviceActivityMonitorContext)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC14DeviceActivity28DeviceActivityMonitorContext____lazy_storage___monitor) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DeviceActivityMonitorContext();
  return [(DeviceActivityMonitorContext *)&v3 init];
}

- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1C6CAC908();
  }
  else {
    uint64_t v3 = 0;
  }
  return (_TtC14DeviceActivity28DeviceActivityMonitorContext *)sub_1C6C92EDC(v3);
}

- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA457F98);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1C6CAC908();
  }
  if (a4)
  {
    sub_1C6CAC488();
    uint64_t v9 = sub_1C6CAC4A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_1C6CAC4A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC14DeviceActivity28DeviceActivityMonitorContext *)sub_1C6C92FC0((uint64_t)a3, (uint64_t)v8);
}

- (_TtC14DeviceActivity28DeviceActivityMonitorContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA457F98);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_1C6CAC908();
  }
  if (a5)
  {
    sub_1C6CAC488();
    uint64_t v11 = sub_1C6CAC4A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_1C6CAC4A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  id v13 = a4;
  return (_TtC14DeviceActivity28DeviceActivityMonitorContext *)sub_1C6C9328C((uint64_t)a3, a4, (uint64_t)v10);
}

- (void).cxx_destruct
{
  sub_1C6C935E0(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC14DeviceActivity28DeviceActivityMonitorContext____lazy_storage___monitor));
}

@end