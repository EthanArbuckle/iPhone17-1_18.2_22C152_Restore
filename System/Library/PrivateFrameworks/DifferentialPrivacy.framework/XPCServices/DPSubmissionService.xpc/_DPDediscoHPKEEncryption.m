@interface _DPDediscoHPKEEncryption
+ (id)encryptWithPublicKey:(id)a3 info:(id)a4 inputShare:(id)a5 additionalData:(id)a6 error:(id *)a7;
+ (id)generatePublicKey;
- (_DPDediscoHPKEEncryption)init;
@end

@implementation _DPDediscoHPKEEncryption

+ (id)encryptWithPublicKey:(id)a3 info:(id)a4 inputShare:(id)a5 additionalData:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = sub_100058D80();
  unint64_t v16 = v15;

  uint64_t v17 = sub_100058D80();
  unint64_t v19 = v18;

  uint64_t v20 = sub_100058D80();
  unint64_t v22 = v21;

  uint64_t v23 = sub_100058D80();
  unint64_t v25 = v24;

  sub_1000422D0(v14, v16, v17, v19, v20, v22, v23, v25);
  sub_100016B2C(v23, v25);
  sub_100016B2C(v20, v22);
  sub_100016B2C(v17, v19);
  sub_100016B2C(v14, v16);
  v26.super.isa = sub_100059210().super.isa;
  swift_bridgeObjectRelease();
  return v26.super.isa;
}

+ (id)generatePublicKey
{
  uint64_t v2 = sub_100059120();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100059150();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100059140();
  sub_100059130();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v10 = sub_100059100();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v10, v12);
  return v13.super.isa;
}

- (_DPDediscoHPKEEncryption)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _DPDediscoHPKEEncryption();
  return [(_DPDediscoHPKEEncryption *)&v3 init];
}

@end