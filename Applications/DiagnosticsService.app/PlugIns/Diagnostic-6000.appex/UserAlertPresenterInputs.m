@interface UserAlertPresenterInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (UserAlertPresenterInputs)init;
@end

@implementation UserAlertPresenterInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1000032A0();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  char v6 = sub_100001610(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return 1;
}

- (UserAlertPresenterInputs)init
{
  return (UserAlertPresenterInputs *)sub_100001944();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end