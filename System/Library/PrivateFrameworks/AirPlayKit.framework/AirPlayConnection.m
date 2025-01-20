@interface AirPlayConnection
- (_TtC10AirPlayKit17AirPlayConnection)init;
- (void)dealloc;
@end

@implementation AirPlayConnection

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_2689BD428;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2390D8808();
  __swift_project_value_buffer(v6, (uint64_t)qword_2689C6758);
  sub_2390449CC(0xD000000000000060, 0x80000002390DFB90, 0x292865736F6C63, 0xE700000000000000);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC10AirPlayKit17AirPlayConnection_connection), sel_close);
  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(AirPlayConnection *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_23904B874(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10AirPlayKit17AirPlayConnection_onDataReceived));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10AirPlayKit17AirPlayConnection_onClose);
  sub_23904B874(v3);
}

- (_TtC10AirPlayKit17AirPlayConnection)init
{
  result = (_TtC10AirPlayKit17AirPlayConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end