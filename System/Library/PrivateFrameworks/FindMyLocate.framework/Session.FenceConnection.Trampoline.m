@interface Session.FenceConnection.Trampoline
- (_TtCCC12FindMyLocate7Session15FenceConnection10Trampoline)init;
- (void)request:(id)a3 completion:(id)a4;
@end

@implementation Session.FenceConnection.Trampoline

- (void)request:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v11 = self;
  uint64_t v8 = sub_24E474728();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_24E392D28(v8, v10, (uint64_t)v11, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_24E381E08(v8, v10);
}

- (_TtCCC12FindMyLocate7Session15FenceConnection10Trampoline)init
{
  result = (_TtCCC12FindMyLocate7Session15FenceConnection10Trampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end