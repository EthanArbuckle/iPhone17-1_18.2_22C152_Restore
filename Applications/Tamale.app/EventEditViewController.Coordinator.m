@interface EventEditViewController.Coordinator
- (_TtCV6Tamale23EventEditViewController11Coordinator)init;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
@end

@implementation EventEditViewController.Coordinator

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  v8 = self;
  [v6 dismissViewControllerAnimated:1 completion:0];
  v7 = *(void (**)(BOOL))&v8->parent[OBJC_IVAR____TtCV6Tamale23EventEditViewController11Coordinator_parent];
  if (v7)
  {
    swift_retain();
    v7(a4 == 1);
    sub_10000F478((uint64_t)v7);
  }
}

- (_TtCV6Tamale23EventEditViewController11Coordinator)init
{
  result = (_TtCV6Tamale23EventEditViewController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->parent[OBJC_IVAR____TtCV6Tamale23EventEditViewController11Coordinator_parent];

  sub_10000F478(v2);
}

@end