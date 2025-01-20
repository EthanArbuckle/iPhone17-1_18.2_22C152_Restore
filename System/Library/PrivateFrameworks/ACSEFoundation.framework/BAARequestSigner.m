@interface BAARequestSigner
- (NSDate)date;
- (_TtC14ACSEFoundation16BAARequestSigner)init;
- (_TtC14ACSEFoundation16BAARequestSigner)initWithDate:(id)a3;
- (void)signWithRequest:(NSURLRequest *)a3 completionHandler:(id)a4;
@end

@implementation BAARequestSigner

- (NSDate)date
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938);
  MEMORY[0x270FA5388]();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246D2ADC8((uint64_t)self + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_date, (uint64_t)v4, &qword_2691E2938);
  uint64_t v5 = sub_246D3DF28();
  uint64_t v6 = *(void *)(v5 - 8);
  v7 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    v7 = (void *)sub_246D3DED8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  return (NSDate *)v7;
}

- (_TtC14ACSEFoundation16BAARequestSigner)initWithDate:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691E2938);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)v15 - v7;
  if (a3)
  {
    sub_246D3DEF8();
    uint64_t v9 = sub_246D3DF28();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_246D3DF28();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  sub_246D2ADC8((uint64_t)v8, (uint64_t)v6, &qword_2691E2938);
  v11 = (objc_class *)type metadata accessor for BAARequestSigner();
  memset(v15, 0, sizeof(v15));
  uint64_t v16 = 0;
  id v12 = objc_allocWithZone(v11);
  v13 = (_TtC14ACSEFoundation16BAARequestSigner *)sub_246D30ED0((uint64_t)v6, (uint64_t)v15);
  sub_246D2EFCC((uint64_t)v8, &qword_2691E2938);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (void)signWithRequest:(NSURLRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B121CD8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_246D3E178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2691E29B8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2691E29C8;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_246D3436C((uint64_t)v9, (uint64_t)&unk_2691E29D8, (uint64_t)v14);
  swift_release();
}

- (_TtC14ACSEFoundation16BAARequestSigner)init
{
  result = (_TtC14ACSEFoundation16BAARequestSigner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_246D2EFCC((uint64_t)self + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_date, &qword_2691E2938);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14ACSEFoundation16BAARequestSigner_baaCertificateFetcher;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
}

@end