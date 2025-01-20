@interface PushService.PushConnectionDelegateWrapper
- (_TtCC18AppleIDSetupDaemon11PushService29PushConnectionDelegateWrapper)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation PushService.PushConnectionDelegateWrapper

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v21 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = v21;
  v10 = self;
  if (a4)
  {
    id v11 = a4;
    uint64_t v12 = sub_2482999B0();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0xF000000000000000;
  }
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v16 = Strong;
    if (v14 >> 60 != 15)
    {
      uint64_t v18 = sub_24829AD90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
      v19 = (void *)swift_allocObject();
      v19[2] = 0;
      v19[3] = 0;
      v19[4] = v16;
      v19[5] = v12;
      v19[6] = v14;
      sub_2482739EC(v12, v14);
      sub_2482652F8((uint64_t)v8, (uint64_t)&unk_2693104A8, (uint64_t)v19);
      swift_release();
      sub_2482050AC(v12, v14);

      return;
    }
    swift_release();
  }
  else
  {
    sub_2482050AC(v12, v14);
  }

  id v17 = v21;
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    if (a4)
    {
      uint64_t v12 = sub_24829AD90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
      unint64_t v13 = (void *)swift_allocObject();
      v13[2] = 0;
      v13[3] = 0;
      v13[4] = v11;
      v13[5] = a4;
      id v14 = a4;
      id v15 = a3;
      uint64_t v16 = self;
      sub_2482652F8((uint64_t)v9, (uint64_t)&unk_269310498, (uint64_t)v13);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

- (_TtCC18AppleIDSetupDaemon11PushService29PushConnectionDelegateWrapper)init
{
  result = (_TtCC18AppleIDSetupDaemon11PushService29PushConnectionDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end