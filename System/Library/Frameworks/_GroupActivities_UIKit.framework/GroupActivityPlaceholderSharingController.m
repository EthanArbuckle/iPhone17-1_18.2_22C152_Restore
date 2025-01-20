@interface GroupActivityPlaceholderSharingController
- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)init;
- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithCoder:(id)a3;
- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithRootViewController:(id)a3;
- (void)cancelButtonTapped:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GroupActivityPlaceholderSharingController

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)init
{
  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_placeholderControllerDidCancel);
  void *v3 = 0;
  v3[1] = 0;
  id v4 = objc_allocWithZone(MEMORY[0x263F82E10]);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  uint64_t v7 = OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_rootViewController;
  *(Class *)((char *)&v5->super.super.super.super.isa
           + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_rootViewController) = v6;

  uint64_t v8 = *(uint64_t *)((char *)&v5->super.super.super.super.isa + v7);
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for GroupActivityPlaceholderSharingController();
  return [(GroupActivityPlaceholderSharingController *)&v10 initWithRootViewController:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_allocWithZone(MEMORY[0x263F824A8]);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_initWithBarButtonSystemItem_target_action_, 1, v6, sel_cancelButtonTapped_);
  id v8 = objc_msgSend(*(id *)((char *)&v6->super.super.super.super.isa+ OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_rootViewController), sel_navigationItem);
  objc_msgSend(v8, sel_setRightBarButtonItem_, v7);

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for GroupActivityPlaceholderSharingController();
  [(GroupActivityPlaceholderSharingController *)&v9 viewWillAppear:v3];
}

- (void)viewDidLoad
{
  v2 = self;
  GroupActivityPlaceholderSharingController.viewDidLoad()();
}

- (void)cancelButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized GroupActivityPlaceholderSharingController.cancelButtonTapped(_:)();
}

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_placeholderControllerDidCancel);
  *id v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_rootViewController));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22_GroupActivities_UIKit41GroupActivityPlaceholderSharingController_placeholderControllerDidCancel);

  outlined consume of (@escaping @callee_guaranteed () -> ())?(v3);
}

@end