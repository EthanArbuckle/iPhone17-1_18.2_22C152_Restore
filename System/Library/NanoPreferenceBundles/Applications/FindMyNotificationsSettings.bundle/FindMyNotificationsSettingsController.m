@interface FindMyNotificationsSettingsController
- (BOOL)suppressAlertSpecifiers;
- (BOOL)suppressAllMirrorSpecifiers;
- (BOOL)suppressMirrorOption;
- (BOOL)suppressSendToNotificationCenterOption;
- (_TtC27FindMyNotificationsSettings37FindMyNotificationsSettingsController)initWithCoder:(id)a3;
- (_TtC27FindMyNotificationsSettings37FindMyNotificationsSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
@end

@implementation FindMyNotificationsSettingsController

- (id)localizedPaneTitle
{
  type metadata accessor for FindMyNotificationsSettingsController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = self;
  v5 = self;
  v6 = (objc_class *)[v4 bundleForClass:ObjCClassFromMetadata];
  v10._countAndFlagsBits = 0x8000000000003CA0;
  v12._countAndFlagsBits = 0x454D414E5F505041;
  v12._object = (void *)0xE800000000000000;
  v13.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v13.value._object = (void *)0xEB00000000656C62;
  v7.super.isa = v6;
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  sub_3AC8(v12, v13, v7, v14, v10);

  NSString v8 = sub_3AD8();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)applicationBundleIdentifier
{
  NSString v2 = sub_3AD8();

  return v2;
}

- (BOOL)suppressMirrorOption
{
  return 1;
}

- (BOOL)suppressAllMirrorSpecifiers
{
  return 1;
}

- (BOOL)suppressAlertSpecifiers
{
  return 0;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (_TtC27FindMyNotificationsSettings37FindMyNotificationsSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_3AE8();
    id v6 = a4;
    NSString v7 = sub_3AD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FindMyNotificationsSettingsController();
  v9 = [(FindMyNotificationsSettingsController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC27FindMyNotificationsSettings37FindMyNotificationsSettingsController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FindMyNotificationsSettingsController();
  return [(FindMyNotificationsSettingsController *)&v5 initWithCoder:a3];
}

@end