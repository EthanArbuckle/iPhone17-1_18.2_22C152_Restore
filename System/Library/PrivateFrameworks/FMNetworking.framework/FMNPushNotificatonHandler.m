@interface FMNPushNotificatonHandler
- (_TtC12FMNetworking25FMNPushNotificatonHandler)init;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
@end

@implementation FMNPushNotificatonHandler

- (void)dealloc
{
  v2 = self;
  FMNPushNotificatonHandler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler____lazy_storage___apsConnection);

  sub_1BBC32CF0(v3);
}

- (_TtC12FMNetworking25FMNPushNotificatonHandler)init
{
  result = (_TtC12FMNetworking25FMNPushNotificatonHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = sub_1BBC37C78();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  sub_1BBC32390(v9, v11);
  sub_1BBC054C4(v9, v11);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8 = a4;
  if (a4)
  {
    id v10 = a3;
    id v11 = a5;
    id v12 = a6;
    v13 = self;
    id v14 = v8;
    id v8 = (void *)sub_1BBC37C78();
    unint64_t v16 = v15;

    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = a3;
    id v18 = a5;
    id v19 = a6;
    v20 = self;
    unint64_t v16 = 0xF000000000000000;
    if (a5)
    {
LABEL_3:
      sub_1BBC37E98();

      if (!a6) {
        goto LABEL_7;
      }
      goto LABEL_4;
    }
  }
  if (a6)
  {
LABEL_4:
    sub_1BBC37E98();
  }
LABEL_7:
  sub_1BBC32730((uint64_t)v8, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BBC054C4((uint64_t)v8, v16);
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  if (a4)
  {
    sub_1BBC37E98();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    sub_1BBC37E48();
LABEL_4:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9F6870);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BBC38DE0;
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic);
  uint64_t v9 = *(void *)&self->topic[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic];
  *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v8 + 64) = sub_1BBC04664();
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v9;
  sub_1BBBFAC1C(0, (unint64_t *)&qword_1EB9F6DC0);
  id v11 = a3;
  id v12 = self;
  swift_bridgeObjectRetain();
  id v13 = (id)sub_1BBC380B8();
  sub_1BBC38028();
  sub_1BBC37CF8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end