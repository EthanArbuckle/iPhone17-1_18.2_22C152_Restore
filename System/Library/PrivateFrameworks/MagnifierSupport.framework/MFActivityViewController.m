@interface MFActivityViewController
- (BOOL)_canShowWhileLocked;
- (_TtC16MagnifierSupport24MFActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
@end

@implementation MFActivityViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport24MFActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_235949D78();
  if (a4)
  {
    sub_2356F009C();
    a4 = (id)sub_235949D78();
  }
  v7 = (void *)sub_235949D58();
  swift_bridgeObjectRelease();
  if (a4)
  {
    sub_2356F009C();
    v8 = (void *)sub_235949D58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = [(MFActivityViewController *)&v11 initWithActivityItems:v7 applicationActivities:v8];

  return v9;
}

@end