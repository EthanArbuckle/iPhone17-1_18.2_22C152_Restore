@interface SkannerSyncActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored19SkannerSyncActivity)init;
- (int64_t)deadline;
- (void)run;
@end

@implementation SkannerSyncActivity

- (int64_t)deadline
{
  return 0;
}

- (NSString)descriptiveName
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isEnabled
{
  return 1;
}

- (_TtC9appstored19SkannerSyncActivity)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19SkannerSyncActivity_deadline) = 0;
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19SkannerSyncActivity_descriptiveName);
  void *v4 = 0xD000000000000013;
  v4[1] = 0x800000010044F4A0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19SkannerSyncActivity_isEnabled) = 1;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ActivityClass *)&v6 init];
}

- (void).cxx_destruct
{
}

- (void)run
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.skanner.getter();
  v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    objc_super v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Run sync activity", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_1005A2FD0 != -1) {
    swift_once();
  }
  sub_10003E29C();
}

@end