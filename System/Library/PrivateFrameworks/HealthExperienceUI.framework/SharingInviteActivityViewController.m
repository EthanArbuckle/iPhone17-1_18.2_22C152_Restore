@interface SharingInviteActivityViewController
- (_TtC18HealthExperienceUI35SharingInviteActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)_prepareActivity:(id)a3;
@end

@implementation SharingInviteActivityViewController

- (void)_prepareActivity:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD55754C(v4);
}

- (_TtC18HealthExperienceUI35SharingInviteActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  sub_1AD73F4B0();
  if (a4)
  {
    sub_1AD2147D4(0, &qword_1E9A31060);
    a4 = (id)sub_1AD73F4B0();
  }
  v6 = (void *)sub_1AD73F490();
  swift_bridgeObjectRelease();
  if (a4)
  {
    sub_1AD2147D4(0, &qword_1E9A31060);
    v7 = (void *)sub_1AD73F490();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SharingInviteActivityViewController();
  v8 = [(SharingInviteActivityViewController *)&v10 initWithActivityItems:v6 applicationActivities:v7];

  return v8;
}

@end