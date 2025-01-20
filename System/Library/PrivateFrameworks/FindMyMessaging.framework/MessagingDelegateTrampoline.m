@interface MessagingDelegateTrampoline
- (_TtC15FindMyMessaging27MessagingDelegateTrampoline)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation MessagingDelegateTrampoline

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  v9 = a5;
  if (a5)
  {
    id v12 = a3;
    id v13 = a4;
    id v14 = a6;
    id v15 = a7;
    v16 = self;
    id v17 = v9;
    v9 = (void *)sub_24E52CE20();
    unint64_t v19 = v18;

    if (a6)
    {
LABEL_3:
      uint64_t v20 = sub_24E52CFF0();
      v22 = v21;

      goto LABEL_6;
    }
  }
  else
  {
    id v23 = a3;
    id v24 = a4;
    id v25 = a6;
    id v26 = a7;
    v27 = self;
    unint64_t v19 = 0xF000000000000000;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  v22 = 0;
LABEL_6:
  sub_24E51F78C(a3, a4, (uint64_t)v9, v19, v20, v22, a7);
  swift_bridgeObjectRelease();
  sub_24E52B08C((uint64_t)v9, v19);
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  v28 = self;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA58);
  MEMORY[0x270FA5388](v14 - 8);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_24E52CDE0();
    uint64_t v17 = sub_24E52CDF0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_24E52CDF0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  if (a6) {
    a6 = (id)sub_24E52CF30();
  }
  if (a7)
  {
    uint64_t v19 = sub_24E52CFF0();
    a7 = v20;
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v21 = a3;
  id v22 = a4;
  id v23 = a8;
  id v24 = v28;
  id v25 = a8;
  id v26 = v24;
  sub_24E520AF8(a3, a4, (uint64_t)v16, (uint64_t)a6, v19, (uint64_t)a7, v25);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E4FB96C((uint64_t)v16, &qword_2698EEA58);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  v8 = (char *)a6;
  if (a5)
  {
    uint64_t v12 = sub_24E52CF30();
    if (v8)
    {
LABEL_3:
      uint64_t v13 = sub_24E52CFF0();
      v8 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  uint64_t v18 = self;
  sub_24E522158(a3, a4, v12, v13, v8, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (a5)
  {
    uint64_t v12 = sub_24E52CFF0();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0;
  }
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  uint64_t v18 = self;
  sub_24E523260(a3, a4, v12, v14, v8, a7);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  BOOL v8 = (char *)a6;
  if (a5)
  {
    uint64_t v12 = (void *)sub_24E52CFF0();
    unint64_t v14 = v13;
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v15 = 0;
    if (a7) {
      goto LABEL_4;
    }
LABEL_7:
    memset(v23, 0, sizeof(v23));
    id v20 = a3;
    id v21 = a4;
    id v22 = self;
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  unint64_t v14 = 0;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v15 = sub_24E52CFF0();
  BOOL v8 = v16;
  if (!a7) {
    goto LABEL_7;
  }
LABEL_4:
  id v17 = a3;
  id v18 = a4;
  uint64_t v19 = self;
  swift_unknownObjectRetain();
  sub_24E52D280();
  swift_unknownObjectRelease();
LABEL_8:
  sub_24E5241B8(a3, a4, v12, v14, v15, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E4FB96C((uint64_t)v23, &qword_2698EE5F0);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = sub_24E52D180();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  BOOL v8 = self;
  sub_24E525314(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
}

- (_TtC15FindMyMessaging27MessagingDelegateTrampoline)init
{
  result = (_TtC15FindMyMessaging27MessagingDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end