@interface VolumeLimitSettingsRoot
- (_TtC19VolumeLimitSettings23VolumeLimitSettingsRoot)initWithCoder:(id)a3;
- (_TtC19VolumeLimitSettings23VolumeLimitSettingsRoot)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation VolumeLimitSettingsRoot

- (void)viewDidLoad
{
  v2 = self;
  sub_8C54();
}

- (_TtC19VolumeLimitSettings23VolumeLimitSettingsRoot)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_CD48();
    id v8 = a4;
    a3 = sub_CD38();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(VolumeLimitSettingsRoot *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC19VolumeLimitSettings23VolumeLimitSettingsRoot)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(VolumeLimitSettingsRoot *)&v5 initWithCoder:a3];
}

@end