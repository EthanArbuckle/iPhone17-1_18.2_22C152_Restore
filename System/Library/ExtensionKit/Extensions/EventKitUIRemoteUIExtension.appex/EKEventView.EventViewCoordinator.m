@interface EKEventView.EventViewCoordinator
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)eventViewControllerShouldPresentShareSheet:(id)a3;
- (_TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator)init;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation EKEventView.EventViewCoordinator

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_100015A0C(a4);
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (BOOL)eventViewControllerShouldPresentShareSheet:(id)a3
{
  return 0;
}

- (void)eventViewController:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5
{
  uint64_t v8 = sub_10001F888();
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_10001314C(v9, v8, v10);

  swift_bridgeObjectRelease();
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100015B74(v5);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    v7 = sub_1000165A4;
  }
  id v8 = a3;
  id v9 = self;
  sub_100015EB8(v8);
  sub_1000047A0((uint64_t)v7);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    id v6 = sub_1000164E0;
  }
  else
  {
    id v6 = 0;
  }
  v7 = self;
  sub_10001636C((void (*)(uint64_t))v6);
  sub_1000047A0((uint64_t)v6);
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  v3 = *(void (**)(void, void, void))&self->eventView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                                                     + 40];
  if (v3)
  {
    v4 = self;
    sub_10000DA20((uint64_t)v3);
    v3(0, 0, 0);
    sub_1000047A0((uint64_t)v3);
  }
  else
  {
    id v5 = self;
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
  }
}

- (_TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator)init
{
  result = (_TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->eventView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                 + 8];
  uint64_t v3 = *(void *)&self->eventView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                 + 24];
  uint64_t v4 = *(void *)&self->eventView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                 + 40];
  swift_release();
  sub_1000047A0(v2);
  sub_1000047A0(v3);

  sub_1000047A0(v4);
}

@end