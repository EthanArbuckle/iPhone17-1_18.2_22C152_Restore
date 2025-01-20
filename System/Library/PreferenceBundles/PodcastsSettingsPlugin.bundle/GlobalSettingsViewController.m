@interface GlobalSettingsViewController
- (_TtC22PodcastsSettingsPlugin28GlobalSettingsViewController)initWithCoder:(id)a3;
- (_TtC22PodcastsSettingsPlugin28GlobalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)viewDidLoad;
@end

@implementation GlobalSettingsViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for GlobalSettingsViewController();
  id v2 = v6.receiver;
  [(GlobalSettingsViewController *)&v6 viewDidLoad];
  v7._countAndFlagsBits = 0x5354534143444F50;
  v7._object = (void *)0xE800000000000000;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_209B8(v7, v8);
  NSString v3 = sub_21178();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, "setTitle:", v3, v6.receiver, v6.super_class);

  v4.super.super.Class isa = (Class)sub_3B50();
  Class isa = v4.super.super.isa;
  sub_21328(v4, 0);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  if (a3) {
    a3 = (id)sub_21138();
  }
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    Swift::String v7 = sub_4384;
  }
  else
  {
    Swift::String v7 = 0;
  }
  Swift::String v8 = self;
  sub_3C80((uint64_t)a3, (uint64_t (*)(uint64_t))v7);
  sub_433C((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (_TtC22PodcastsSettingsPlugin28GlobalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_21198();
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC22PodcastsSettingsPlugin28GlobalSettingsViewController____lazy_storage___hostingController] = 0;
    id v6 = a4;
    NSString v7 = sub_21178();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC22PodcastsSettingsPlugin28GlobalSettingsViewController____lazy_storage___hostingController] = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for GlobalSettingsViewController();
  v9 = [(GlobalSettingsViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC22PodcastsSettingsPlugin28GlobalSettingsViewController)initWithCoder:(id)a3
{
  *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC22PodcastsSettingsPlugin28GlobalSettingsViewController____lazy_storage___hostingController] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GlobalSettingsViewController();
  return [(GlobalSettingsViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end