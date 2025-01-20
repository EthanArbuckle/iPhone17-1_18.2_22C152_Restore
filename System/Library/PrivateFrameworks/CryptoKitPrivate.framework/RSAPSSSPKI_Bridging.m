@interface RSAPSSSPKI_Bridging
+ (id)serializeWithKeyBytes:(id)a3 error:(id *)a4;
- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)init;
- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)initWithData:(id)a3 error:(id *)a4;
- (id)publicKeyBytes;
@end

@implementation RSAPSSSPKI_Bridging

- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1DB0C4CB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  uint64_t v11 = sub_1DB0C4A08();
  unint64_t v13 = v12;

  v14 = self;
  sub_1DB04239C(v11, v13);
  sub_1DB0C4C98();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))((uint64_t)v14 + OBJC_IVAR____TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging_backingStruct, v9, v6);

  v15 = (objc_class *)type metadata accessor for RSAPSSSPKI_Bridging();
  v19.receiver = v14;
  v19.super_class = v15;
  v16 = [(RSAPSSSPKI_Bridging *)&v19 init];
  sub_1DB042664(v11, v13);
  return v16;
}

- (id)publicKeyBytes
{
  v2 = self;
  uint64_t v3 = sub_1DB0C4C88();
  unint64_t v5 = v4;

  uint64_t v6 = (void *)sub_1DB0C49E8();
  sub_1DB042664(v3, v5);
  return v6;
}

+ (id)serializeWithKeyBytes:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_1DB0C4A08();
  unint64_t v7 = v6;

  uint64_t v8 = sub_1DB0C4CA8();
  unint64_t v10 = v9;
  sub_1DB042664(v5, v7);
  uint64_t v11 = (void *)sub_1DB0C49E8();
  sub_1DB042664(v8, v10);
  return v11;
}

- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)init
{
  result = (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging_backingStruct;
  uint64_t v3 = sub_1DB0C4CB8();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end