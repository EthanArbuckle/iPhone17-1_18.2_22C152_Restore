@interface CoordinationDataModel
+ (_TtC13HomeDataModel21CoordinationDataModel)shared;
- (_TtC13HomeDataModel21CoordinationDataModel)init;
@end

@implementation CoordinationDataModel

- (_TtC13HomeDataModel21CoordinationDataModel)init
{
  return (_TtC13HomeDataModel21CoordinationDataModel *)sub_251AEBE68();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel21CoordinationDataModel__currentStateSnapshot;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B21EAA0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13HomeDataModel21CoordinationDataModel_incomingCoordinationMessagesQueue);
}

+ (_TtC13HomeDataModel21CoordinationDataModel)shared
{
  if (qword_26B21E6D8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B21E630;
  return (_TtC13HomeDataModel21CoordinationDataModel *)v2;
}

@end