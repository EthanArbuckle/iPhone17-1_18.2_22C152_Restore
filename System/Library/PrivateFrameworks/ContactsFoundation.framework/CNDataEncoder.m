@interface CNDataEncoder
+ (id)decodeAddressingGrammarData:(id)a3;
+ (id)encodeAddressingGrammar:(id)a3;
- (_TtC18ContactsFoundation13CNDataEncoder)init;
@end

@implementation CNDataEncoder

+ (id)encodeAddressingGrammar:(id)a3
{
  uint64_t v4 = sub_1909A3F80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  sub_1909A3F70();

  uint64_t v9 = _s18ContactsFoundation13CNDataEncoderC6encodey0B04DataVSgAE13TermOfAddressVFZ_0();
  unint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = 0;
  if (v11 >> 60 != 15)
  {
    v12 = (void *)sub_1909A4010();
    sub_19099DE48(v9, v11);
  }

  return v12;
}

+ (id)decodeAddressingGrammarData:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0CD0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = a3;
  uint64_t v8 = sub_1909A4020();
  unint64_t v10 = v9;

  static CNDataEncoder.decode(_:)((uint64_t)v6);
  sub_19099A398(v8, v10);
  uint64_t v11 = sub_1909A3F80();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    v13 = (void *)sub_1909A3F60();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }

  return v13;
}

- (_TtC18ContactsFoundation13CNDataEncoder)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNDataEncoder();
  return [(CNDataEncoder *)&v3 init];
}

@end