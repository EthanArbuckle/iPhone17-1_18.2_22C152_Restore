@interface AirPlayAndHandoffSettingsRoot
- (_TtC25AirPlayAndHandoffSettings29AirPlayAndHandoffSettingsRoot)initWithCoder:(id)a3;
- (_TtC25AirPlayAndHandoffSettings29AirPlayAndHandoffSettingsRoot)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation AirPlayAndHandoffSettingsRoot

- (void)viewDidLoad
{
  v2 = self;
  sub_13160();
}

- (_TtC25AirPlayAndHandoffSettings29AirPlayAndHandoffSettingsRoot)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_13E10();
    id v8 = a4;
    a3 = sub_13E00();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(AirPlayAndHandoffSettingsRoot *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC25AirPlayAndHandoffSettings29AirPlayAndHandoffSettingsRoot)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AirPlayAndHandoffSettingsRoot *)&v5 initWithCoder:a3];
}

@end