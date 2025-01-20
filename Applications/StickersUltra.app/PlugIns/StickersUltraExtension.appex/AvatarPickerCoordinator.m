@interface AvatarPickerCoordinator
- (_TtC22StickersUltraExtension23AvatarPickerCoordinator)init;
- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4;
- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4;
@end

@implementation AvatarPickerCoordinator

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_10000B974((uint64_t)a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  void (*v6)(void *__return_ptr);
  id v7;
  _TtC22StickersUltraExtension23AvatarPickerCoordinator *v8;
  uint64_t v9;
  uint64_t v10;
  void v11[3];
  uint64_t v12;
  uint64_t v13;
  void v14[9];

  BOOL v4 = a4;
  v6 = *(void (**)(void *__return_ptr))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v7 = a3;
  v8 = self;
  v6(v14);
  if (v14[3])
  {
    sub_10000BAC0((uint64_t)v14, (uint64_t)v11);
    sub_10000AD78((uint64_t)v14);
    v9 = v12;
    v10 = v13;
    sub_10000BB24(v11, v12);
    (*(void (**)(id, BOOL, uint64_t, uint64_t))(v10 + 16))(v7, v4, v9, v10);
    sub_10000A7C0((uint64_t)v11);
  }
  else
  {
    sub_10000AD78((uint64_t)v14);
  }
}

- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4
{
  void (*v9)(void *__return_ptr);
  _TtC22StickersUltraExtension23AvatarPickerCoordinator *v10;
  uint64_t v11;
  uint64_t v12;
  void v13[3];
  uint64_t v14;
  uint64_t v15;
  void v16[9];

  BOOL v4 = a4;
  if (a3)
  {
    uint64_t v6 = sub_10007A250();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  v9 = *(void (**)(void *__return_ptr))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v10 = self;
  v9(v16);
  if (v16[3])
  {
    sub_10000BAC0((uint64_t)v16, (uint64_t)v13);
    sub_10000AD78((uint64_t)v16);
    v11 = v14;
    v12 = v15;
    sub_10000BB24(v13, v14);
    (*(void (**)(uint64_t, uint64_t, BOOL, uint64_t, uint64_t))(v12 + 24))(v6, v8, v4, v11, v12);
    sub_10000A7C0((uint64_t)v13);
  }
  else
  {
    sub_10000AD78((uint64_t)v16);
  }

  swift_bridgeObjectRelease();
}

- (_TtC22StickersUltraExtension23AvatarPickerCoordinator)init
{
  result = (_TtC22StickersUltraExtension23AvatarPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end