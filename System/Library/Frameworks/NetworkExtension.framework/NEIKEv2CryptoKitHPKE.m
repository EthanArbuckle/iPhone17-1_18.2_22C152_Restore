@interface NEIKEv2CryptoKitHPKE
- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)init;
- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)initWithPayload:(id)a3 aad:(id)a4 psk:(id)a5 pskID:(id)a6 keyData:(id)a7;
- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)initWithPayload:(id)a3 aad:(id)a4 psk:(id)a5 pskID:(id)a6 keyRef:(__SecKey *)a7;
- (id)performHPKEOpenAndReturnError:(id *)a3;
- (id)performHPKESealAndReturnError:(id *)a3;
@end

@implementation NEIKEv2CryptoKitHPKE

- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)initWithPayload:(id)a3 aad:(id)a4 psk:(id)a5 pskID:(id)a6 keyRef:(__SecKey *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = a7;
  id v15 = a4;
  uint64_t v16 = sub_19DF72A50();
  unint64_t v18 = v17;

  if (v15)
  {
    uint64_t v19 = sub_19DF72A50();
    unint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v21 = 0xF000000000000000;
  }
  uint64_t v22 = sub_19DF72A50();
  unint64_t v24 = v23;

  uint64_t v25 = sub_19DF72A50();
  unint64_t v27 = v26;

  uint64_t v28 = v16;
  v29 = (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *)sub_19DDBF1CC(v16, v18, v19, v21, v22, v24, v25, v27, v14);

  sub_19DDBF398(v25, v27);
  sub_19DDBF398(v22, v24);
  sub_19DDBF3F0(v19, v21);
  sub_19DDBF398(v28, v18);
  return v29;
}

- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)initWithPayload:(id)a3 aad:(id)a4 psk:(id)a5 pskID:(id)a6 keyData:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  uint64_t v16 = sub_19DF72A50();
  unint64_t v35 = v17;
  uint64_t v36 = v16;

  if (v15)
  {
    uint64_t v18 = sub_19DF72A50();
    unint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v20 = 0xF000000000000000;
  }
  unint64_t v34 = v20;
  uint64_t v21 = sub_19DF72A50();
  unint64_t v23 = v22;

  uint64_t v24 = sub_19DF72A50();
  unint64_t v26 = v25;

  uint64_t v27 = sub_19DF72A50();
  unint64_t v29 = v28;

  unint64_t v30 = v20;
  uint64_t v31 = v18;
  v32 = (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *)sub_19DDBF404(v36, v35, v18, v30, v21, v23, v24, v26, v27, v29);
  sub_19DDBF398(v27, v29);
  sub_19DDBF398(v24, v26);
  sub_19DDBF398(v21, v23);
  sub_19DDBF3F0(v31, v34);
  sub_19DDBF398(v36, v35);
  return v32;
}

- (id)performHPKESealAndReturnError:(id *)a3
{
  return sub_19DDBADC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))NEIKEv2CryptoKitHPKE.performHPKESeal());
}

- (id)performHPKEOpenAndReturnError:(id *)a3
{
  return sub_19DDBADC8(self, (uint64_t)a2, (uint64_t)a3, NEIKEv2CryptoKitHPKE.performHPKEOpen());
}

- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)init
{
  result = (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19DDBF398(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_payload), *(void *)&self->payload[OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_payload]);
  sub_19DDBF3F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_aad), *(void *)&self->payload[OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_aad]);
  v3 = (char *)self + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_psk;
  uint64_t v4 = sub_19DF72C60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_19DDBF398(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_pskID), *(void *)&self->payload[OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_pskID]);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_key);
  uint64_t v6 = *(void *)&self->payload[OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_key];

  sub_19DDC0384(v5, v6);
}

@end