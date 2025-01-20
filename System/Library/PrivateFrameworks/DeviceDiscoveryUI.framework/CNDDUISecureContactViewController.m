@interface CNDDUISecureContactViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC17DeviceDiscoveryUI33CNDDUISecureContactViewController)initWithCoder:(id)a3;
- (_TtC17DeviceDiscoveryUI33CNDDUISecureContactViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation CNDDUISecureContactViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC17DeviceDiscoveryUI33CNDDUISecureContactViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_24CBAB418();
    id v6 = a4;
    v7 = (void *)sub_24CBAB3D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CNDDUISecureContactViewController();
  v9 = [(CNDDUISecureContactViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC17DeviceDiscoveryUI33CNDDUISecureContactViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNDDUISecureContactViewController();
  return [(CNDDUISecureContactViewController *)&v5 initWithCoder:a3];
}

@end