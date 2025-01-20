@interface APNSManager.PushDelegateTrampoline
- (_TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline)init;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)connection:(id)a3 didReceiveURLToken:(id)a4 forInfo:(id)a5;
- (void)connection:(id)a3 didReceiveURLTokenError:(id)a4 forInfo:(id)a5;
- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
@end

@implementation APNSManager.PushDelegateTrampoline

- (void)dealloc
{
  uint64_t v2 = qword_2698D87D8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24E35FD10();
  __swift_project_value_buffer(v4, (uint64_t)qword_2698D8AF0);
  v5 = sub_24E35FCF0();
  os_log_type_t v6 = sub_24E360030();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_24E31F000, v5, v6, "APNSManager deinit", v7, 2u);
    MEMORY[0x25333A4C0](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for APNSManager.PushDelegateTrampoline();
  [(APNSManager.PushDelegateTrampoline *)&v8 dealloc];
}

- (void).cxx_destruct
{
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v21 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v6 - 8);
  objc_super v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = v21;
  v10 = self;
  if (a4)
  {
    id v11 = a4;
    uint64_t v12 = sub_24E35FC80();
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
      uint64_t v18 = sub_24E35FF00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
      v19 = (void *)swift_allocObject();
      v19[2] = 0;
      v19[3] = 0;
      v19[4] = v16;
      v19[5] = v12;
      v19[6] = v14;
      sub_24E337EB8(v12, v14);
      sub_24E346460((uint64_t)v8, (uint64_t)&unk_2698D8C98, (uint64_t)v19);
      swift_release();
      sub_24E337D14(v12, v14);

      return;
    }
    swift_release();
  }
  else
  {
    sub_24E337D14(v12, v14);
  }

  id v17 = v21;
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  objc_super v8 = a4;
  if (a4)
  {
    id v10 = a3;
    id v11 = a5;
    id v12 = a6;
    unint64_t v13 = self;
    id v14 = v8;
    objc_super v8 = (void *)sub_24E35FC80();
    unint64_t v16 = v15;

    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v23 = a3;
  id v24 = a5;
  id v25 = a6;
  v26 = self;
  unint64_t v16 = 0xF000000000000000;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v17 = sub_24E35FDC0();
  uint64_t v19 = v18;

  if (a6)
  {
LABEL_4:
    uint64_t v20 = sub_24E35FDC0();
    uint64_t v22 = v21;

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v20 = 0;
  uint64_t v22 = 0;
LABEL_8:
  sub_24E337808((uint64_t)v8, v16, v17, v19, v20, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E337D14((uint64_t)v8, v16);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
  uint64_t v6 = a4;
  if (a4)
  {
    id v8 = a3;
    id v9 = a5;
    id v10 = self;
    id v11 = v6;
    uint64_t v6 = (void *)sub_24E35FC80();
    unint64_t v13 = v12;
  }
  else
  {
    id v14 = a3;
    id v15 = a5;
    unint64_t v16 = self;
    unint64_t v13 = 0xF000000000000000;
  }
  sub_24E3379B4((uint64_t)v6, v13, a5);
  sub_24E337D14((uint64_t)v6, v13);
}

- (void)connection:(id)a3 didReceiveURLToken:(id)a4 forInfo:(id)a5
{
  uint64_t v8 = qword_2698D87D8;
  id v9 = a3;
  id v10 = a4;
  id v16 = a5;
  id v11 = self;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24E35FD10();
  __swift_project_value_buffer(v12, (uint64_t)qword_2698D8AF0);
  unint64_t v13 = sub_24E35FCF0();
  os_log_type_t v14 = sub_24E360010();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_24E31F000, v13, v14, "NOT IMPLEMENTED: connection:didReceive:info:", v15, 2u);
    MEMORY[0x25333A4C0](v15, -1, -1);
  }
}

- (void)connection:(id)a3 didReceiveURLTokenError:(id)a4 forInfo:(id)a5
{
  uint64_t v8 = qword_2698D87D8;
  id v9 = a3;
  id v10 = a5;
  id v16 = self;
  id v11 = a4;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24E35FD10();
  __swift_project_value_buffer(v12, (uint64_t)qword_2698D8AF0);
  unint64_t v13 = sub_24E35FCF0();
  os_log_type_t v14 = sub_24E360010();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_24E31F000, v13, v14, "NOT IMPLEMENTED: connection:didReceiveURLTokenError:for:", v15, 2u);
    MEMORY[0x25333A4C0](v15, -1, -1);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  sub_24E337B24(a4);
}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  uint64_t v6 = qword_2698D87D8;
  id v7 = a3;
  id v13 = a4;
  id v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24E35FD10();
  __swift_project_value_buffer(v9, (uint64_t)qword_2698D8AF0);
  id v10 = sub_24E35FCF0();
  os_log_type_t v11 = sub_24E360010();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_24E31F000, v10, v11, "NOT IMPLEMENTED: connection:didSend:message:", v12, 2u);
    MEMORY[0x25333A4C0](v12, -1, -1);
  }
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  uint64_t v8 = qword_2698D87D8;
  id v9 = a3;
  id v10 = a4;
  id v16 = self;
  id v11 = a5;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24E35FD10();
  __swift_project_value_buffer(v12, (uint64_t)qword_2698D8AF0);
  id v13 = sub_24E35FCF0();
  os_log_type_t v14 = sub_24E360010();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_24E31F000, v13, v14, "NOT IMPLEMENTED: connection:didFailToSend:error:", v15, 2u);
    MEMORY[0x25333A4C0](v15, -1, -1);
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    uint64_t v12 = sub_24E35FF00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = 0;
    *(void *)(v13 + 24) = 0;
    *(void *)(v13 + 32) = v11;
    *(unsigned char *)(v13 + 40) = a4;
    id v14 = a3;
    id v15 = self;
    sub_24E346460((uint64_t)v9, (uint64_t)&unk_2698D8C30, v13);
    swift_release();
  }
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = sub_24E35FF00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    id v12 = a3;
    uint64_t v13 = self;
    sub_24E346460((uint64_t)v7, (uint64_t)&unk_2698D8C18, (uint64_t)v11);
    swift_release();
  }
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  if (a4)
  {
    sub_24E3375B4(0, (unint64_t *)&unk_2698D8C00);
    sub_24E35FEA0();
  }
  uint64_t v6 = qword_2698D87D8;
  id v7 = a3;
  id v12 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24E35FD10();
  __swift_project_value_buffer(v8, (uint64_t)qword_2698D8AF0);
  uint64_t v9 = sub_24E35FCF0();
  os_log_type_t v10 = sub_24E360010();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_24E31F000, v9, v10, "NOT IMPLEMENTED: channelSubscriptionsFailedWith:", v11, 2u);
    MEMORY[0x25333A4C0](v11, -1, -1);
  }
  swift_bridgeObjectRelease();
}

- (_TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline)init
{
  result = (_TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end