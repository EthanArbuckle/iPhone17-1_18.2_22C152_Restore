@interface TDMClient
- (_TtC16CryptoKitPrivate9TDMClient)init;
- (_TtC16CryptoKitPrivate9TDMClient)initWithTID:(id)a3;
- (id)blindedElement;
- (id)finalizeWithFSR:(id)a3 evaluatedElement:(id)a4 proof:(id)a5 publicKey:(id)a6 error:(id *)a7;
@end

@implementation TDMClient

- (_TtC16CryptoKitPrivate9TDMClient)initWithTID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1DB0C4A08();
  unint64_t v6 = v5;

  v7 = (_TtC16CryptoKitPrivate9TDMClient *)sub_1DB097D5C(v4, v6);
  sub_1DB042664(v4, v6);
  return v7;
}

- (id)blindedElement
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate9TDMClient_be);
  id v3 = self;
  id result = objc_msgSend(v2, sel_serializedPublicKey_, 1);
  if (result)
  {
    id v5 = result;
    uint64_t v6 = sub_1DB0C4A08();
    unint64_t v8 = v7;

    v9 = (void *)sub_1DB0C49E8();
    sub_1DB042664(v6, v8);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)finalizeWithFSR:(id)a3 evaluatedElement:(id)a4 proof:(id)a5 publicKey:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v32 = self;
  uint64_t v15 = sub_1DB0C4A08();
  unint64_t v17 = v16;

  uint64_t v31 = sub_1DB0C4A08();
  unint64_t v19 = v18;

  uint64_t v20 = sub_1DB0C4A08();
  unint64_t v22 = v21;

  uint64_t v23 = sub_1DB0C4A08();
  unint64_t v25 = v24;

  id v26 = sub_1DB0941CC(v15, v17, v31, v19, v20, v22, v23, v25);
  unint64_t v28 = v27;

  sub_1DB042664(v23, v25);
  sub_1DB042664(v20, v22);
  sub_1DB042664(v31, v19);
  sub_1DB042664(v15, v17);
  v29 = (void *)sub_1DB0C49E8();
  sub_1DB042664((uint64_t)v26, v28);
  return v29;
}

- (_TtC16CryptoKitPrivate9TDMClient)init
{
  id result = (_TtC16CryptoKitPrivate9TDMClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DB042664(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate9TDMClient_input), *(void *)&self->oprfClient[OBJC_IVAR____TtC16CryptoKitPrivate9TDMClient_input]);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate9TDMClient_be);
}

@end