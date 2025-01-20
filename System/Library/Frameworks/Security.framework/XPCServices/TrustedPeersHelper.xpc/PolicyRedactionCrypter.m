@interface PolicyRedactionCrypter
- (_TtC18TrustedPeersHelper22PolicyRedactionCrypter)init;
- (id)decryptData:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 withKey:(id)a4 error:(id *)a5;
@end

@implementation PolicyRedactionCrypter

- (id)decryptData:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = sub_100221BF0();
  v12 = v11;

  id v13 = sub_100007CD0(v7, v10, v12);
  unint64_t v15 = v14;

  sub_100005A40(v10, (unint64_t)v12);
  v16.super.isa = sub_100221BD0().super.isa;
  sub_100005A40((uint64_t)v13, v15);

  return v16.super.isa;
}

- (id)encryptData:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = sub_100221BF0();
  unint64_t v12 = v11;

  uint64_t v13 = sub_100221BF0();
  unint64_t v15 = v14;

  NSData v16 = sub_100007FFC(v10, v12, v13, v15);
  sub_100005A40(v13, v15);
  sub_100005A40(v10, v12);

  return v16;
}

- (_TtC18TrustedPeersHelper22PolicyRedactionCrypter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PolicyRedactionCrypter();
  return [(PolicyRedactionCrypter *)&v3 init];
}

@end