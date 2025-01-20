@interface TabChangeDelegate
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (_TtC18ASMessagesProvider17TabChangeDelegate)init;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
@end

@implementation TabChangeDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_5E6AB8(v6, (uint64_t)v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_5E721C(v6);
}

- (_TtC18ASMessagesProvider17TabChangeDelegate)init
{
  result = (_TtC18ASMessagesProvider17TabChangeDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end