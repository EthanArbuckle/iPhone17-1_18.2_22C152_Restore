@interface ServerPushListener
- (_TtC23ActivitySharingServices18ServerPushListener)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
@end

@implementation ServerPushListener

- (_TtC23ActivitySharingServices18ServerPushListener)init
{
  result = (_TtC23ActivitySharingServices18ServerPushListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices18ServerPushListener_container);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ActivitySharingServices18ServerPushListener_notificationCenter));
  swift_release();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v4 = a4;
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = v4;
    v4 = (void *)sub_2476B2238();
    unint64_t v10 = v9;
  }
  else
  {
    id v11 = a3;
    v12 = self;
    unint64_t v10 = 0xF000000000000000;
  }
  sub_247690F54(a3, (uint64_t)v4, v10);
  sub_2475AD05C((uint64_t)v4, v10);
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
    id v8 = (void *)sub_2476B2238();
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
  uint64_t v17 = sub_2476B2A38();
  uint64_t v19 = v18;

  if (a6)
  {
LABEL_4:
    uint64_t v20 = sub_2476B2A38();
    uint64_t v22 = v21;

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v20 = 0;
  uint64_t v22 = 0;
LABEL_8:
  sub_247691410((uint64_t)v8, v16, v17, v19, v20, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2475AD05C((uint64_t)v8, v16);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_24769194C(a4);
}

@end