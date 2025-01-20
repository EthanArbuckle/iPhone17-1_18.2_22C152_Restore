@interface ATDispatchCenter
+ (_TtC5AskTo16ATDispatchCenter)shared;
- (_TtC5AskTo16ATDispatchCenter)init;
- (void)addResponseListener:(id)a3;
- (void)dealloc;
- (void)removeResponseListener:(id)a3;
- (void)send:(_TtC5AskTo10ATQuestion *)a3 to:(signed __int16)a4 completionHandler:(id)a5;
@end

@implementation ATDispatchCenter

+ (_TtC5AskTo16ATDispatchCenter)shared
{
  if (qword_269323E80 != -1) {
    swift_once();
  }
  v2 = (void *)qword_269323ED0;
  return (_TtC5AskTo16ATDispatchCenter *)v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ATDispatchCenter *)&v3 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC5AskTo16ATDispatchCenter_dispatcher);
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners);
}

- (void)send:(_TtC5AskTo10ATQuestion *)a3 to:(signed __int16)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269323F00);
  MEMORY[0x270FA5388](v9 - 8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(_WORD *)(v14 + 24) = a4;
  *(void *)(v14 + 32) = v13;
  *(void *)(v14 + 40) = self;
  uint64_t v15 = sub_248741AD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269323F10;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269323F20;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_248740AD8((uint64_t)v12, (uint64_t)&unk_269323F30, (uint64_t)v17);
  swift_release();
}

- (void)addResponseListener:(id)a3
{
}

- (void)removeResponseListener:(id)a3
{
}

- (_TtC5AskTo16ATDispatchCenter)init
{
  result = (_TtC5AskTo16ATDispatchCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end