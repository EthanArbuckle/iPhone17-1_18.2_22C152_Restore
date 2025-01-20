@interface FMAPSConnectionHandler
- (_TtC8FMIPCore22FMAPSConnectionHandler)init;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
@end

@implementation FMAPSConnectionHandler

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (a4)
  {
    uint64_t v8 = sub_1D4469B38();
    unint64_t v10 = v9;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  unint64_t v10 = 0;
  if (a5) {
LABEL_3:
  }
    uint64_t v5 = sub_1D4469A58();
LABEL_4:
  id v11 = a3;
  v12 = self;
  sub_1D4290DB8(v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = sub_1D44694E8();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  sub_1D4296258(v9, v11);
  sub_1D42DD08C(v9, v11);
}

- (void)dealloc
{
  v2 = self;
  FMAPSConnectionHandler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1D42F9538((uint64_t)self + OBJC_IVAR____TtC8FMIPCore22FMAPSConnectionHandler_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC8FMIPCore22FMAPSConnectionHandler)init
{
  result = (_TtC8FMIPCore22FMAPSConnectionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
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
    id v8 = (void *)sub_1D44694E8();
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
      sub_1D4469B38();

      if (!a6) {
        goto LABEL_7;
      }
      goto LABEL_4;
    }
  }
  if (a6)
  {
LABEL_4:
    sub_1D4469B38();
  }
LABEL_7:
  sub_1D43BEFE4((uint64_t)v8, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D42DD08C((uint64_t)v8, v16);
}

@end