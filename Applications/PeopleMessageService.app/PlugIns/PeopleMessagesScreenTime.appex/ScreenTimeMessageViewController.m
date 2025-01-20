@interface ScreenTimeMessageViewController
- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithCoder:(id)a3;
- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ScreenTimeMessageViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100017B28();
}

- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10002A890();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController *)sub_100017C14(v5, v7, a4);
}

- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail;
  uint64_t v6 = enum case for FirstPartyApps.screentime(_:);
  uint64_t v7 = sub_10002A0F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  uint64_t v8 = OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor;
  uint64_t v9 = qword_100039358;
  id v10 = a3;
  v11 = self;
  if (v9 != -1) {
    swift_once();
  }
  v12 = (void *)qword_10003AB48;
  *(Class *)((char *)&v11->super.super.super.super.super.isa + v8) = (Class)qword_10003AB48;
  id v13 = v12;

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for ScreenTimeMessageViewController();
  v14 = [(RequestMessageViewController *)&v16 initWithCoder:v10];

  return v14;
}

- (_TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail;
  uint64_t v6 = enum case for FirstPartyApps.screentime(_:);
  uint64_t v7 = sub_10002A0F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  uint64_t v8 = OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor;
  uint64_t v9 = qword_100039358;
  id v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  v11 = (void *)qword_10003AB48;
  *(Class *)((char *)&v10->super.super.super.super.super.isa + v8) = (Class)qword_10003AB48;
  id v12 = v11;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for ScreenTimeMessageViewController();
  return [(RequestMessageViewController *)&v14 initWithShouldBeSheetPresentationControllerDelegate:v3];
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail;
  uint64_t v4 = sub_10002A0F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor);
}

@end