@interface JSAMS
- (NSDictionary)props;
- (_TtC14amsengagementd10JSFollowUp)followUp;
- (_TtC14amsengagementd10JSLocalize)localize;
- (_TtC14amsengagementd10JSLocation)location;
- (_TtC14amsengagementd10JSMediaAPI)media;
- (_TtC14amsengagementd11JSExtension)plugin;
- (_TtC14amsengagementd11JSMarketing)marketing;
- (_TtC14amsengagementd11JSTelephony)telephony;
- (_TtC14amsengagementd14JSAccountStore)accounts;
- (_TtC14amsengagementd15JSDatabaseStore)database;
- (_TtC14amsengagementd16JSTreatmentStore)treatmentStore;
- (_TtC14amsengagementd17JSServerDataCache)serverDataCache;
- (_TtC14amsengagementd19JSUserNotifications)userNotifications;
- (_TtC14amsengagementd20JSSubscriptionStatus)subscription;
- (_TtC14amsengagementd5JSAMS)init;
- (_TtC14amsengagementd5JSApp)app;
- (_TtC14amsengagementd5JSLog)log;
- (_TtC14amsengagementd8JSClient)client;
- (_TtC14amsengagementd8JSDevice)device;
- (_TtC14amsengagementd8JSFamily)family;
- (_TtC14amsengagementd9JSBacklog)backlog;
- (_TtC14amsengagementd9JSContent)content;
- (_TtC14amsengagementd9JSMetrics)metrics;
- (_TtC14amsengagementd9JSNetwork)network;
- (_TtC14amsengagementd9JSPrivacy)privacy;
- (void)dealloc;
- (void)setProps:(id)a3;
@end

@implementation JSAMS

- (_TtC14amsengagementd9JSMetrics)metrics
{
  id v2 = sub_100006600();
  return (_TtC14amsengagementd9JSMetrics *)v2;
}

- (_TtC14amsengagementd17JSServerDataCache)serverDataCache
{
  id v2 = sub_100007E10();
  return (_TtC14amsengagementd17JSServerDataCache *)v2;
}

- (_TtC14amsengagementd15JSDatabaseStore)database
{
  id v2 = sub_10000AA9C();
  return (_TtC14amsengagementd15JSDatabaseStore *)v2;
}

- (_TtC14amsengagementd9JSNetwork)network
{
  id v2 = sub_10000AADC();
  return (_TtC14amsengagementd9JSNetwork *)v2;
}

- (_TtC14amsengagementd8JSDevice)device
{
  id v2 = sub_100010B64();
  return (_TtC14amsengagementd8JSDevice *)v2;
}

- (_TtC14amsengagementd14JSAccountStore)accounts
{
  id v2 = sub_100010BA4();
  return (_TtC14amsengagementd14JSAccountStore *)v2;
}

- (_TtC14amsengagementd5JSLog)log
{
  id v2 = sub_100016370();
  return (_TtC14amsengagementd5JSLog *)v2;
}

- (_TtC14amsengagementd5JSApp)app
{
  id v2 = sub_1000CF31C();
  return (_TtC14amsengagementd5JSApp *)v2;
}

- (_TtC14amsengagementd9JSBacklog)backlog
{
  id v2 = sub_1000CF35C();
  return (_TtC14amsengagementd9JSBacklog *)v2;
}

- (_TtC14amsengagementd8JSClient)client
{
  id v2 = sub_1000CF39C();
  return (_TtC14amsengagementd8JSClient *)v2;
}

- (_TtC14amsengagementd9JSContent)content
{
  id v2 = sub_1000CF3DC();
  return (_TtC14amsengagementd9JSContent *)v2;
}

- (_TtC14amsengagementd8JSFamily)family
{
  id v2 = sub_1000CF41C();
  return (_TtC14amsengagementd8JSFamily *)v2;
}

- (_TtC14amsengagementd10JSFollowUp)followUp
{
  id v2 = sub_1000CF45C();
  return (_TtC14amsengagementd10JSFollowUp *)v2;
}

- (_TtC14amsengagementd10JSLocalize)localize
{
  id v2 = sub_1000CF49C();
  return (_TtC14amsengagementd10JSLocalize *)v2;
}

- (_TtC14amsengagementd10JSLocation)location
{
  id v2 = sub_1000CF4DC();
  return (_TtC14amsengagementd10JSLocation *)v2;
}

- (_TtC14amsengagementd11JSMarketing)marketing
{
  id v2 = sub_1000CF51C();
  return (_TtC14amsengagementd11JSMarketing *)v2;
}

- (_TtC14amsengagementd10JSMediaAPI)media
{
  id v2 = sub_1000CF55C();
  return (_TtC14amsengagementd10JSMediaAPI *)v2;
}

- (_TtC14amsengagementd11JSExtension)plugin
{
  id v2 = sub_1000CF59C();
  return (_TtC14amsengagementd11JSExtension *)v2;
}

- (_TtC14amsengagementd9JSPrivacy)privacy
{
  id v2 = sub_1000CF5DC();
  return (_TtC14amsengagementd9JSPrivacy *)v2;
}

- (NSDictionary)props
{
  sub_1000CF650();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (void)setProps:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1000CF6E0(v4);
}

- (_TtC14amsengagementd20JSSubscriptionStatus)subscription
{
  id v2 = sub_1000CF72C();
  return (_TtC14amsengagementd20JSSubscriptionStatus *)v2;
}

- (_TtC14amsengagementd11JSTelephony)telephony
{
  id v2 = sub_1000CF76C();
  return (_TtC14amsengagementd11JSTelephony *)v2;
}

- (_TtC14amsengagementd16JSTreatmentStore)treatmentStore
{
  id v2 = sub_1000CF7AC();
  return (_TtC14amsengagementd16JSTreatmentStore *)v2;
}

- (_TtC14amsengagementd19JSUserNotifications)userNotifications
{
  id v2 = sub_1000CF7EC();
  return (_TtC14amsengagementd19JSUserNotifications *)v2;
}

- (void)dealloc
{
  id v2 = self;
  sub_1000CF7F8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10002CC0C((uint64_t)self + OBJC_IVAR____TtC14amsengagementd5JSAMS_uuid, &qword_10022FCB0);
}

- (_TtC14amsengagementd5JSAMS)init
{
}

@end