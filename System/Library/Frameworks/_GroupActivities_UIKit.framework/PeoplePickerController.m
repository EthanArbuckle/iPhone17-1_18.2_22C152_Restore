@interface PeoplePickerController
- (_TtC22_GroupActivities_UIKit22PeoplePickerController)init;
- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5;
- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5;
- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4;
@end

@implementation PeoplePickerController

- (_TtC22_GroupActivities_UIKit22PeoplePickerController)init
{
  return (_TtC22_GroupActivities_UIKit22PeoplePickerController *)PeoplePickerController.init()();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController_conversationManagerClient);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController____lazy_storage___connection));
  outlined consume of _EXHostViewController??(*(id *)((char *)&self->super.isa
                                                    + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController____lazy_storage___hostViewControllerConfig));
  outlined consume of _EXHostViewController??(*(id *)((char *)&self->super.isa
                                                    + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController____lazy_storage___extensionViewController));
  v3 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit22PeoplePickerController_hostViewController;

  outlined destroy of weak PeoplePickerViewController?((uint64_t)v3);
}

- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  PeoplePickerController.hostViewController(_:didPrepareToHost:)(v6, v7);
}

- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5
{
}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
}

@end