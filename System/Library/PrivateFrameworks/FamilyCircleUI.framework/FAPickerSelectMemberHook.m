@interface FAPickerSelectMemberHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (FAPickerSelectMemberHook)init;
- (RUIServerHookDelegate)delegate;
- (id)activateAction;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setActivateAction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FAPickerSelectMemberHook

- (RUIServerHookDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (RUIServerHookDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)activateAction
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_218A4B7C8;
    aBlock[3] = &block_descriptor_42;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setActivateAction:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_218B00970;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_218AB12E4(v7);
}

- (BOOL)shouldMatchElement:(id)a3
{
  v4 = (FAPickerSelectMemberHook *)a3;
  uint64_t v5 = self;
  id v6 = [(FAPickerSelectMemberHook *)v4 name];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_218CAEE38();
    uint64_t v10 = v9;

    if (v8 == 0xD000000000000014 && v10 == 0x8000000218CD1150)
    {

      swift_bridgeObjectRelease();
      char v11 = 1;
    }
    else
    {
      char v11 = sub_218CAFC08();

      swift_bridgeObjectRelease();
    }
  }
  else
  {

    char v11 = 0;
    v4 = v5;
  }

  return v11 & 1;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  char v6 = sub_218AFEDB0(v4);

  return v6 & 1;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  uint64_t v9 = (void (**)(void *, uint64_t, void))_Block_copy(a6);
  id v10 = a3;
  id v11 = a5;
  v12 = self;
  sub_218AFF51C(v11);
  v13 = (void (**)(id))((char *)v12 + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  swift_beginAccess();
  v14 = *v13;
  if (*v13)
  {
    swift_retain();
    v14(v11);
    sub_218AB12E4((uint64_t)v14);
  }
  v9[2](v9, 1, 0);
  _Block_release(v9);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  char v6 = (void (**)(void *, uint64_t, void))_Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  sub_218AFF51C(v7);
  v6[2](v6, 1, 0);
  _Block_release(v6);
}

- (FAPickerSelectMemberHook)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_delegate) = 0;
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  id v4 = (objc_class *)type metadata accessor for FAPickerSelectMemberHook();
  *uint64_t v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(FAPickerSelectMemberHook *)&v6 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  sub_218AB12E4(v3);
}

@end