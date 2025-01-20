@interface ObservableThermalController
- (_TtC12ClarityBoard27ObservableThermalController)init;
- (void)thermalLevelDidUpdate;
@end

@implementation ObservableThermalController

- (void)thermalLevelDidUpdate
{
  v2 = self;
  sub_1000AF480();
}

- (_TtC12ClarityBoard27ObservableThermalController)init
{
  uint64_t v3 = sub_100029F90(&qword_10017F998);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC12ClarityBoard27ObservableThermalController__thermalLevel;
  char v13 = 2;
  v8 = self;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);

  v9 = (objc_class *)type metadata accessor for ObservableThermalController();
  v12.receiver = v8;
  v12.super_class = v9;
  return [(CLBThermalController *)&v12 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC12ClarityBoard27ObservableThermalController__thermalLevel;
  uint64_t v3 = sub_100029F90(&qword_10017F998);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end