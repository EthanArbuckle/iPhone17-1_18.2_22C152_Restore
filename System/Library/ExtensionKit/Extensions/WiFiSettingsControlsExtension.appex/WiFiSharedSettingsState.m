@interface WiFiSharedSettingsState
+ (_TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState)defaultState;
- (BOOL)askToJoinHotspots;
- (BOOL)askToJoinNetworks;
- (BOOL)autoJoinState;
- (BOOL)powerState;
- (NSString)_wifiSettingsBundleIdentifier;
- (NSString)wifiSettingsBundleIdentifier;
- (_TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState)init;
- (int64_t)askToJoinMode;
- (int64_t)autoHotspotMode;
- (void)setAskToJoinHotspots:(BOOL)a3;
- (void)setAskToJoinMode:(int64_t)a3;
- (void)setAskToJoinNetworks:(BOOL)a3;
- (void)setAutoHotspotMode:(int64_t)a3;
- (void)setAutoJoinState:(BOOL)a3;
- (void)setPowerState:(BOOL)a3;
- (void)setWifiSettingsBundleIdentifier:(id)a3;
- (void)set_wifiSettingsBundleIdentifier:(id)a3;
@end

@implementation WiFiSharedSettingsState

+ (_TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState)defaultState
{
  if (qword_10002C480 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100032BB8;

  return (_TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState *)v2;
}

- (NSString)_wifiSettingsBundleIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_10001ED38();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)set_wifiSettingsBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_10001ED48();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState__wifiSettingsBundleIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (NSString)wifiSettingsBundleIdentifier
{
  swift_getKeyPath();
  sub_10001563C(&qword_10002C800, (void (*)(uint64_t))type metadata accessor for WiFiSharedSettingsState);
  v3 = self;
  sub_10001EBD8();
  swift_release();
  swift_bridgeObjectRetain();

  NSString v4 = sub_10001ED38();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (void)setWifiSettingsBundleIdentifier:(id)a3
{
  sub_10001ED48();
  swift_getKeyPath();
  sub_10001563C(&qword_10002C800, (void (*)(uint64_t))type metadata accessor for WiFiSharedSettingsState);
  NSString v4 = self;
  sub_10001EBC8();

  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)powerState
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_1000123D8();

  return v3 & 1;
}

- (void)setPowerState:(BOOL)a3
{
  swift_getKeyPath();
  sub_10001563C(&qword_10002C800, (void (*)(uint64_t))type metadata accessor for WiFiSharedSettingsState);
  NSString v4 = self;
  sub_10001EBC8();

  swift_release();
}

- (int64_t)askToJoinMode
{
  NSString v2 = self;
  id v3 = sub_10001254C();

  return (int64_t)v3;
}

- (void)setAskToJoinMode:(int64_t)a3
{
  swift_getKeyPath();
  sub_10001563C(&qword_10002C800, (void (*)(uint64_t))type metadata accessor for WiFiSharedSettingsState);
  NSString v4 = self;
  sub_10001EBC8();

  swift_release();
}

- (int64_t)autoHotspotMode
{
  NSString v2 = self;
  id v3 = sub_100013520();

  return (int64_t)v3;
}

- (void)setAutoHotspotMode:(int64_t)a3
{
  swift_getKeyPath();
  sub_10001563C(&qword_10002C800, (void (*)(uint64_t))type metadata accessor for WiFiSharedSettingsState);
  NSString v4 = self;
  sub_10001EBC8();

  swift_release();
}

- (BOOL)askToJoinNetworks
{
  NSString v2 = self;
  BOOL v3 = sub_100013D00();

  return v3;
}

- (void)setAskToJoinNetworks:(BOOL)a3
{
  swift_getKeyPath();
  sub_10001563C(&qword_10002C800, (void (*)(uint64_t))type metadata accessor for WiFiSharedSettingsState);
  NSString v4 = self;
  sub_10001EBC8();

  swift_release();
}

- (BOOL)askToJoinHotspots
{
  NSString v2 = self;
  BOOL v3 = sub_100014304();

  return v3;
}

- (void)setAskToJoinHotspots:(BOOL)a3
{
  swift_getKeyPath();
  sub_10001563C(&qword_10002C800, (void (*)(uint64_t))type metadata accessor for WiFiSharedSettingsState);
  NSString v4 = self;
  sub_10001EBC8();

  swift_release();
}

- (BOOL)autoJoinState
{
  NSString v2 = self;
  char v3 = sub_10001222C();

  return v3 & 1;
}

- (void)setAutoJoinState:(BOOL)a3
{
  swift_getKeyPath();
  sub_10001563C(&qword_10002C800, (void (*)(uint64_t))type metadata accessor for WiFiSharedSettingsState);
  NSString v4 = self;
  sub_10001EBC8();

  swift_release();
}

- (_TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState)init
{
  return (_TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState *)sub_100014EB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState____lazy_storage___wifiCWFInterface));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState__wifiCWFNetworkProfile));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState__wifiCWFUserSettings));
  swift_bridgeObjectRelease();
  char v3 = (char *)self + OBJC_IVAR____TtC29WiFiSettingsControlsExtension23WiFiSharedSettingsState___observationRegistrar;
  uint64_t v4 = sub_10001EBF8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end