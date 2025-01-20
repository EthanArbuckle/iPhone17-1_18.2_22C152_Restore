@interface PushService.PushConnectionDelegateWrapper
- (_TtCC18AAAFoundationSwift11PushService29PushConnectionDelegateWrapper)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation PushService.PushConnectionDelegateWrapper

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v22 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v6 - 8, v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = v22;
  v11 = self;
  if (a4)
  {
    id v12 = a4;
    uint64_t v13 = sub_1B8F57170();
    unint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v15 = 0xF000000000000000;
  }
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v17 = Strong;
    if (v15 >> 60 != 15)
    {
      uint64_t v19 = sub_1B8F57740();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
      v20 = (void *)swift_allocObject();
      v20[2] = 0;
      v20[3] = 0;
      v20[4] = v17;
      v20[5] = v13;
      v20[6] = v15;
      sub_1B8F0932C(v13, v15);
      sub_1B8F07C44((uint64_t)v9, (uint64_t)&unk_1E9EF4010, (uint64_t)v20);
      swift_release();
      sub_1B8F091C0(v13, v15);

      return;
    }
    swift_release();
  }
  else
  {
    sub_1B8F091C0(v13, v15);
  }

  id v18 = v22;
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v12 = Strong;
    if (a4)
    {
      uint64_t v13 = sub_1B8F57740();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
      unint64_t v14 = (void *)swift_allocObject();
      v14[2] = 0;
      v14[3] = 0;
      v14[4] = v12;
      v14[5] = a4;
      id v15 = a4;
      id v16 = a3;
      uint64_t v17 = self;
      sub_1B8F07C44((uint64_t)v10, (uint64_t)&unk_1E9EF3FF0, (uint64_t)v14);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

- (_TtCC18AAAFoundationSwift11PushService29PushConnectionDelegateWrapper)init
{
  result = (_TtCC18AAAFoundationSwift11PushService29PushConnectionDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end