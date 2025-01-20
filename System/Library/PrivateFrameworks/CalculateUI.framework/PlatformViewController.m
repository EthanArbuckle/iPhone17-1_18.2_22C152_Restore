@interface PlatformViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC11CalculateUI22PlatformViewController)initWithCoder:(id)a3;
- (_TtC11CalculateUI22PlatformViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)buildMenuWithBuilder:(id)a3;
- (void)copy:(id)a3;
- (void)loadView;
- (void)longPress:(id)a3;
- (void)paste:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)viewDidLoad;
@end

@implementation PlatformViewController

- (void)loadView
{
  type metadata accessor for PlatformView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  [(PlatformViewController *)v4 setView:v5];
}

- (_TtC11CalculateUI22PlatformViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2496A0388();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11CalculateUI22PlatformViewController *)sub_24963AB10(v5, v7, a4);
}

- (BOOL)_canShowWhileLocked
{
  return sub_24963B170() & 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_24963BA0C();
}

- (void)longPress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)1) {
    sub_24965FDD0(v4);
  }
}

- (void)buildMenuWithBuilder:(id)a3
{
  uint64_t v5 = *MEMORY[0x263F83830];
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  objc_msgSend(a3, sel_removeMenuForIdentifier_, v5);
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for PlatformViewController();
  [(PlatformViewController *)&v7 buildMenuWithBuilder:a3];
  swift_unknownObjectRelease();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v5 = self;
    swift_unknownObjectRetain();
    sub_2496A0728();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v6 = self;
  }
  char v7 = sub_249660BD4();

  sub_249657E54((uint64_t)v9);
  return v7 & 1;
}

- (void)copy:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_2496A0728();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    uint64_t v5 = self;
  }
  uint64_t v6 = *(void (**)(void, void))((char *)&self->super.super.super.isa
                                             + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_handlePasteboard);
  if (v6)
  {
    swift_retain();
    v6(0, 0);
    sub_24963B160((uint64_t)v6);
  }

  sub_249657E54((uint64_t)v7);
}

- (void)paste:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_2496A0728();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_249660100();

  sub_249657E54((uint64_t)v6);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_24963FF50(0, (unint64_t *)&qword_2696C8650);
  sub_2496607EC();
  uint64_t v6 = sub_2496A05C8();
  id v7 = a4;
  id v8 = self;
  sub_2496603B0(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (_TtC11CalculateUI22PlatformViewController)initWithCoder:(id)a3
{
  return (_TtC11CalculateUI22PlatformViewController *)sub_24966056C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_editMenuInteraction));
  sub_24963B160(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_handleKeypress));
  sub_24963B160(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_handlePasteboard));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11CalculateUI22PlatformViewController_allowHighPrecision);

  sub_24963B160(v3);
}

@end