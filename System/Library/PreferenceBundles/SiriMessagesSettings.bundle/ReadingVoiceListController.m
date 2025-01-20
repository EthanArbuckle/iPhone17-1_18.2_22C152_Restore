@interface ReadingVoiceListController
- (_TtC20SiriMessagesSettings26ReadingVoiceListController)initWithCoder:(id)a3;
- (_TtC20SiriMessagesSettings26ReadingVoiceListController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ReadingVoiceListController

- (id)specifiers
{
  v2 = self;
  v3 = sub_1567C();

  if (v3)
  {
    v4.super.isa = sub_25410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
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
  sub_1AADC((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC20SiriMessagesSettings26ReadingVoiceListController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_253A0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC20SiriMessagesSettings26ReadingVoiceListController *)sub_1C62C(v5, v7, a4);
}

- (_TtC20SiriMessagesSettings26ReadingVoiceListController)initWithCoder:(id)a3
{
  return (_TtC20SiriMessagesSettings26ReadingVoiceListController *)sub_1C828(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end