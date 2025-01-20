@interface UserDefaultItem
- (_TtC7ChatKit15UserDefaultItem)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation UserDefaultItem

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit15UserDefaultItem_defaults);
  v3 = self;
  id v4 = v2;
  sub_18F7B6CA0();
  v5 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_removeObserver_forKeyPath_, v3, v5);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for UserDefaultItem(0);
  [(UserDefaultItem *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit15UserDefaultItem__value;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E923E388);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7ChatKit15UserDefaultItem__BOOLValue;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922B2B0);
  v10 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v10)((void *)(v6 - 8), v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC7ChatKit15UserDefaultItem__displayString;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E923E390);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v10((char *)self + OBJC_IVAR____TtC7ChatKit15UserDefaultItem__valueCanBeDisplayedInline, v6);
  v9 = (char *)self + OBJC_IVAR____TtC7ChatKit15UserDefaultItem__isPinned;

  v10(v9, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_18F7B97E0();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v14, 0, sizeof(v14));
    id v11 = a5;
    v12 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_18F7BA320();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_18F66AF1C();
    sub_18F7B9660();
  }
LABEL_7:
  uint64_t v13 = OBJC_IVAR____TtC7ChatKit15UserDefaultItem_shouldSetValueInUserDefaults;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit15UserDefaultItem_shouldSetValueInUserDefaults) = 0;
  sub_18F669CE8();
  *((unsigned char *)&self->super.isa + v13) = 1;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18EF288F8((uint64_t)v14);
}

- (_TtC7ChatKit15UserDefaultItem)init
{
  result = (_TtC7ChatKit15UserDefaultItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end