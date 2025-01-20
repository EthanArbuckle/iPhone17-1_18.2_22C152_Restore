@interface CIDCInternalSessionCryptarch
- (BOOL)deriveSessionKeysWithSessionTranscript:(id)a3 ikm:(id)a4 error:(id *)a5;
- (BOOL)setRemoteKey:(id)a3 error:(id *)a4;
- (NSData)publicKey;
- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)init;
- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4 variant:(unint64_t)a5;
- (id)decryptWithData:(id)a3 error:(id *)a4;
- (id)encryptWithData:(id)a3 error:(id *)a4;
@end

@implementation CIDCInternalSessionCryptarch

- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4 variant:(unint64_t)a5
{
  return (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *)CIDCInternalSessionCryptarch.init(role:curve:variant:)(a3, a4, a5);
}

- (BOOL)setRemoteKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_225C7BA80();
  unint64_t v9 = v8;

  sub_225C7BBD0();
  sub_225C74AF8(v7, v9);
  return 1;
}

- (BOOL)deriveSessionKeysWithSessionTranscript:(id)a3 ikm:(id)a4 error:(id *)a5
{
  id v7 = a3;
  unint64_t v8 = self;
  id v9 = a4;
  uint64_t v10 = sub_225C7BA80();
  unint64_t v12 = v11;

  if (v9)
  {
    uint64_t v13 = sub_225C7BA80();
    unint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v15 = 0xF000000000000000;
  }
  sub_225C7BBC0();

  sub_225C74AE4(v13, v15);
  sub_225C74AF8(v10, v12);
  return 1;
}

- (id)decryptWithData:(id)a3 error:(id *)a4
{
  return sub_225C74308(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x263F36180]);
}

- (id)encryptWithData:(id)a3 error:(id *)a4
{
  return sub_225C74308(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x263F36188]);
}

- (NSData)publicKey
{
  v2 = self;
  uint64_t v3 = sub_225C7BC20();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_225C7BA70();
    sub_225C74AE4(v3, v5);
  }

  return (NSData *)v6;
}

- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)init
{
  result = (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end