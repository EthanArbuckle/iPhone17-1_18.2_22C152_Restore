@interface DKIDSHandler
- (_TtC11DockKitCore12DKIDSHandler)init;
- (uint64_t)service:(void *)a3 devicesChanged:(uint64_t)a4;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation DKIDSHandler

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
    v9 = (void *)sub_24CF3A870();
    unint64_t v19 = v18;

    if (a6)
    {
LABEL_3:
      uint64_t v20 = sub_24CF3B320();
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
  sub_24CEA1140((uint64_t)v9, v19, v20, v22);
  swift_bridgeObjectRelease();
  sub_24CE8F2C8((uint64_t)v9, v19);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a6;
  if (a5)
  {
    sub_24CF3B2A0();
    if (v8)
    {
LABEL_3:
      uint64_t v12 = sub_24CF3B320();
      id v8 = v13;
      goto LABEL_6;
    }
  }
  else if (a6)
  {
    goto LABEL_3;
  }
  uint64_t v12 = 0;
LABEL_6:
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = self;
  sub_24CEA1964(a3, v12, (unint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (uint64_t)service:(void *)a3 devicesChanged:(uint64_t)a4
{
  v5 = (void *)result;
  if (!a4)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    __break(1u);
    return result;
  }
  result = sub_24CF3B470();
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  v6 = *(void (**)(id))((*MEMORY[0x263F8EED0] & *v5) + 0x70);
  id v7 = a3;
  id v8 = v5;
  v6(v7);

  return swift_bridgeObjectRelease();
}

- (_TtC11DockKitCore12DKIDSHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DKIDSHandler();
  return [(DKIDSHandler *)&v3 init];
}

@end