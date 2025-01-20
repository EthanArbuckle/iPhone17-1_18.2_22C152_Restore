@interface MessagingWithSiriController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (_TtC20SiriMessagesSettings27MessagingWithSiriController)initWithCoder:(id)a3;
- (_TtC20SiriMessagesSettings27MessagingWithSiriController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)getMessageWithoutConfCarPlayEnabledWithSpecifier:(id)a3;
- (id)getMessageWithoutConfEnabledWithSpecifier:(id)a3;
- (id)getMessageWithoutConfHeadphonesEnabledWithSpecifier:(id)a3;
- (id)specifiers;
- (void)applicationWillSuspend;
- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4;
- (void)logLongPressWithSpecifier:(id)a3;
- (void)setMessageWithoutConfCarPlayEnabled:(id)a3 specifier:(id)a4;
- (void)setMessageWithoutConfEnabled:(id)a3 specifier:(id)a4;
- (void)setMessageWithoutConfHeadphonesEnabled:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MessagingWithSiriController

- (id)specifiers
{
  return sub_9C54(self, (uint64_t)a2, (uint64_t (*)(void))sub_2E68);
}

- (void)setMessageWithoutConfEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_33A8();
}

- (id)getMessageWithoutConfEnabledWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6.super.super.isa = sub_3828().super.super.isa;

  return v6.super.super.isa;
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_39A0(a3);
}

- (void)applicationWillSuspend
{
  v2 = self;
  sub_3A40();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_3AC4(a3);
}

- (void)setMessageWithoutConfHeadphonesEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = self;
  sub_4240((uint64_t)v6, v8);
}

- (id)getMessageWithoutConfHeadphonesEnabledWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6.super.super.isa = sub_42CC((uint64_t)v5).super.super.isa;

  return v6.super.super.isa;
}

- (void)setMessageWithoutConfCarPlayEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = self;
  sub_433C((uint64_t)v6, v8);
}

- (id)getMessageWithoutConfCarPlayEnabledWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6.super.super.isa = sub_45DC((uint64_t)v5).super.super.isa;

  return v6.super.super.isa;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_251E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251D0();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_61B4(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4
{
  NSNumber v6 = _Block_copy(a4);
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  uint64_t v9 = self;

  sub_75B4((uint64_t)&unk_31628, (uint64_t)v7);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_251E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251D0();
  id v10 = a3;
  v11 = self;
  sub_76B8((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_251E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251D0();
  id v12 = a3;
  id v13 = self;
  sub_7D64((uint64_t)v12, a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_251E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251D0();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_8AB8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)logLongPressWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_8F34();
}

- (_TtC20SiriMessagesSettings27MessagingWithSiriController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC20SiriMessagesSettings27MessagingWithSiriController *)sub_B7E8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_9788);
}

- (_TtC20SiriMessagesSettings27MessagingWithSiriController)initWithCoder:(id)a3
{
  return (_TtC20SiriMessagesSettings27MessagingWithSiriController *)sub_98B4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR____TtC20SiriMessagesSettings27MessagingWithSiriController_tableView];
}

@end