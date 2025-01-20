@interface PeoplePickerShellViewController
- (_TtC18RemotePeoplePicker31PeoplePickerShellViewController)initWithCoder:(id)a3;
- (_TtC18RemotePeoplePicker31PeoplePickerShellViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation PeoplePickerShellViewController

- (void)viewDidLoad
{
  v2 = self;
  PeoplePickerShellViewController.viewDidLoad()();
}

- (_TtC18RemotePeoplePicker31PeoplePickerShellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100009D38();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18RemotePeoplePicker31PeoplePickerShellViewController *)PeoplePickerShellViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18RemotePeoplePicker31PeoplePickerShellViewController)initWithCoder:(id)a3
{
  return (_TtC18RemotePeoplePicker31PeoplePickerShellViewController *)PeoplePickerShellViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController));
  sub_100009754(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView));

  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  PeoplePickerShellViewController.messageComposeViewController(_:didFinishWith:)(v6, a4);
}

@end