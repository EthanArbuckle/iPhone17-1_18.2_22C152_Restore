@interface ListOfLanguagesController
- (_TtC20SiriMessagesSettings25ListOfLanguagesController)initWithCoder:(id)a3;
- (_TtC20SiriMessagesSettings25ListOfLanguagesController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ListOfLanguagesController

- (id)specifiers
{
  return sub_9C54(self, (uint64_t)a2, sub_9AD4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_251E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251D0();
  id v10 = a3;
  v11 = self;
  sub_B2B4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC20SiriMessagesSettings25ListOfLanguagesController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC20SiriMessagesSettings25ListOfLanguagesController *)sub_B7E8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_B6C0);
}

- (_TtC20SiriMessagesSettings25ListOfLanguagesController)initWithCoder:(id)a3
{
  return (_TtC20SiriMessagesSettings25ListOfLanguagesController *)sub_B85C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC20SiriMessagesSettings25ListOfLanguagesController_preferences];
}

@end