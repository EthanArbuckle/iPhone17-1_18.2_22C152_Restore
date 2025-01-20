@interface XPCPublisher
- (_TtC11HomeKitCore12XPCPublisher)init;
- (void)cancel;
- (void)dealloc;
@end

@implementation XPCPublisher

- (void)cancel
{
  uint64_t v2 = qword_2688D1248;
  v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_236DB9950();
  __swift_project_value_buffer(v3, (uint64_t)qword_2688D1968);
  v4 = sub_236DB9930();
  os_log_type_t v5 = sub_236DB9F30();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_236D14000, v4, v5, "Cancelling subscription", v6, 2u);
    MEMORY[0x237E101A0](v6, -1, -1);
  }

  (*(void (**)(void))((char *)&v7->super.isa + OBJC_IVAR____TtC11HomeKitCore12XPCPublisher_cancelationHandler))();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_2688D1248;
  os_log_type_t v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_236DB9950();
  __swift_project_value_buffer(v6, (uint64_t)qword_2688D1968);
  v7 = sub_236DB9930();
  os_log_type_t v8 = sub_236DB9F30();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_236D14000, v7, v8, "Publisher deinit", v9, 2u);
    MEMORY[0x237E101A0](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(XPCPublisher *)&v10 dealloc];
}

- (void).cxx_destruct
{
}

- (_TtC11HomeKitCore12XPCPublisher)init
{
  result = (_TtC11HomeKitCore12XPCPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end