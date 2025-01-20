@interface AccountDetailsDataModel
- (NSString)phoneNumberServer;
- (_TtC6HomeUI23AccountDetailsDataModel)init;
- (_TtC6HomeUI23AccountDetailsDataModel)initWithMeContact:(id)a3;
- (id)getInfoWithTafFieldKey:(id)a3;
- (void)deserializeWithResults:(id)a3;
@end

@implementation AccountDetailsDataModel

- (_TtC6HomeUI23AccountDetailsDataModel)initWithMeContact:(id)a3
{
  return (_TtC6HomeUI23AccountDetailsDataModel *)AccountDetailsDataModel.init(meContact:)(a3);
}

- (NSString)phoneNumberServer
{
  v2 = self;
  AccountDetailsDataModel.phoneNumberServer.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (id)getInfoWithTafFieldKey:(id)a3
{
  uint64_t v4 = sub_1BE9C49F8();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = AccountDetailsDataModel.getInfo(tafFieldKey:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v10 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)deserializeWithResults:(id)a3
{
  uint64_t v4 = sub_1BE9C4908();
  v5 = self;
  AccountDetailsDataModel.deserialize(results:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (_TtC6HomeUI23AccountDetailsDataModel)init
{
  result = (_TtC6HomeUI23AccountDetailsDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel__contact;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA118588);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel__didSubmitInfo;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA117058);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end