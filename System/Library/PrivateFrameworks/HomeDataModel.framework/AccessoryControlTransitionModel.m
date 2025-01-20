@interface AccessoryControlTransitionModel
- (_TtC13HomeDataModel31AccessoryControlTransitionModel)init;
@end

@implementation AccessoryControlTransitionModel

- (_TtC13HomeDataModel31AccessoryControlTransitionModel)init
{
  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel31AccessoryControlTransitionModel_oldAccessoryControlsBearer;
  uint64_t v4 = type metadata accessor for StaticService();
  v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5((char *)self + OBJC_IVAR____TtC13HomeDataModel31AccessoryControlTransitionModel_newAccessoryControlsBearer, 1, 1, v4);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccessoryControlTransitionModel();
  return [(AccessoryControlTransitionModel *)&v7 init];
}

- (void).cxx_destruct
{
  sub_251D739FC((uint64_t)self + OBJC_IVAR____TtC13HomeDataModel31AccessoryControlTransitionModel_oldAccessoryControlsBearer);
  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel31AccessoryControlTransitionModel_newAccessoryControlsBearer;
  sub_251D739FC((uint64_t)v3);
}

@end