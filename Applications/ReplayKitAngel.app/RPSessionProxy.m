@interface RPSessionProxy
- (RPSessionProxy)init;
- (id)currentSessionID;
- (uint64_t)finish;
- (uint64_t)start;
@end

@implementation RPSessionProxy

- (id)currentSessionID
{
  sub_100023414();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return v3;
}

- (RPSessionProxy)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RPSessionProxy();
  return [(RPSessionProxy *)&v3 init];
}

- (uint64_t)start
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  objc_super v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    uint64_t v10 = sub_10001CEC4(0x29287472617473, 0xE700000000000000, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  type metadata accessor for RPSessionGateway();
  uint64_t inited = swift_initStaticObject();
  return (*(uint64_t (**)(void))(*(void *)inited + 176))();
}

- (uint64_t)finish
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  objc_super v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    uint64_t v10 = sub_10001CEC4(0x29286873696E6966, 0xE800000000000000, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  type metadata accessor for RPSessionGateway();
  uint64_t inited = swift_initStaticObject();
  return (*(uint64_t (**)(void))(*(void *)inited + 184))();
}

@end