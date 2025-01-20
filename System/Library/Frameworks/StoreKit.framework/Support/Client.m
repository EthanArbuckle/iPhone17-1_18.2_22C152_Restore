@interface Client
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)processInfo;
- (AMSURLRequestEncoder)urlRequestEncoder;
- (AMSURLSession)urlSession;
- (BOOL)canMakePayments;
- (BOOL)hasEverHadIAPs;
- (BOOL)hasMIDBasedSINF;
- (BOOL)isAlmond;
- (BOOL)isAppStoreSigned;
- (BOOL)isBeta;
- (BOOL)isClip;
- (NSString)accountMediaType;
- (NSString)callerBundleID;
- (NSString)currentAccountToken;
- (NSString)localizedName;
- (NSString)objc_clientDescription;
- (NSString)requestBundleID;
- (NSString)requestBundleVersion;
- (NSString)signerOrganization;
- (NSString)vendorName;
- (NSURL)callerBundleURL;
- (NSUUID)deviceVendorID;
- (_TtC9storekitd6Client)init;
- (_TtC9storekitd6Client)initWithAuditTokenData:(id)a3;
- (_TtC9storekitd6Client)initWithBundleIdentifier:(id)a3;
- (_TtC9storekitd6Client)initWithConnection:(id)a3 overridesDictionary:(id)a4;
- (_TtC9storekitd6Client)initWithURL:(id)a3 overridesDictionary:(id)a4;
- (char)objc_clientType;
- (id)queryWith:(BOOL)a3 customReceiptURL:(id)a4;
- (unint64_t)storeExternalVersionID;
- (unint64_t)storeItemID;
@end

@implementation Client

- (NSString)currentAccountToken
{
  v2 = self;
  sub_100007960();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (AMSBagProtocol)bag
{
  v2 = self;
  uint64_t v3 = (void *)sub_100022B3C();

  return (AMSBagProtocol *)v3;
}

- (BOOL)isClip
{
  return sub_100005CC0() & 1;
}

- (ACAccount)account
{
  v2 = self;
  id v3 = sub_100011598();

  return (ACAccount *)v3;
}

- (char)objc_clientType
{
  v2 = self;
  char v3 = sub_1000117B4();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  type metadata accessor for URL();
  sub_10000C9D0();
  sub_1000118BC();
  v3();
  sub_10001E6B0((uint64_t)self + OBJC_IVAR____TtC9storekitd6Client_deviceVendorID, &qword_10039B990);
  sub_100015940();
  sub_100015940();
  sub_100015940();
  sub_10001E6B0((uint64_t)self + OBJC_IVAR____TtC9storekitd6Client_serverOverride, &qword_10039CB20);
  sub_100015940();

  swift_bridgeObjectRelease();
}

- (_TtC9storekitd6Client)initWithConnection:(id)a3 overridesDictionary:(id)a4
{
  if (a4)
  {
    type metadata accessor for SKClientOverridesKey(0);
    sub_10012D624(&qword_10039A560, type metadata accessor for SKClientOverridesKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a3;
  sub_100020748();
  return result;
}

- (BOOL)isBeta
{
  return sub_100022B30() & 1;
}

- (NSString)requestBundleID
{
  return (NSString *)sub_100006580((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100022CA0);
}

- (NSString)callerBundleID
{
  return (NSString *)sub_100006580((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100022CE4);
}

- (NSString)accountMediaType
{
  v2 = self;
  id v3 = sub_1000116A8();

  return (NSString *)v3;
}

- (NSURL)callerBundleURL
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100127644();
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSURL *)v8;
}

- (BOOL)canMakePayments
{
  uint64_t v2 = self;
  sub_1001276E0();
  char v4 = v3;

  return v4 & 1;
}

- (NSUUID)deviceVendorID
{
  uint64_t v2 = sub_10001E6FC(&qword_10039B990);
  __chkstk_darwin(v2 - 8);
  char v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100128024((uint64_t)v4);
  uint64_t v5 = type metadata accessor for UUID();
  Class isa = 0;
  if (sub_10001E448((uint64_t)v4, 1, v5) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return (NSUUID *)isa;
}

- (BOOL)hasEverHadIAPs
{
  return sub_10012807C() & 1;
}

- (BOOL)isAlmond
{
  return sub_1001280B0() & 1;
}

- (BOOL)isAppStoreSigned
{
  return sub_1001280E4() & 1;
}

- (NSString)localizedName
{
  return (NSString *)sub_100006580((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100128108);
}

- (BOOL)hasMIDBasedSINF
{
  return sub_10012815C() & 1;
}

- (AMSProcessInfo)processInfo
{
  uint64_t v2 = self;
  id v3 = sub_100126F4C();

  return (AMSProcessInfo *)v3;
}

- (NSString)requestBundleVersion
{
  return (NSString *)sub_100006580((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1001281C4);
}

- (NSString)signerOrganization
{
  return (NSString *)sub_100128370();
}

- (unint64_t)storeExternalVersionID
{
  return sub_10012822C();
}

- (unint64_t)storeItemID
{
  return sub_100128260();
}

- (AMSURLRequestEncoder)urlRequestEncoder
{
  uint64_t v2 = self;
  id v3 = sub_100126258();

  return (AMSURLRequestEncoder *)v3;
}

- (AMSURLSession)urlSession
{
  uint64_t v2 = self;
  id v3 = sub_10012618C();

  return (AMSURLSession *)v3;
}

- (NSString)vendorName
{
  return (NSString *)sub_100128370();
}

- (_TtC9storekitd6Client)initWithURL:(id)a3 overridesDictionary:(id)a4
{
  uint64_t v5 = type metadata accessor for URL();
  __chkstk_darwin(v5 - 8);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    type metadata accessor for SKClientOverridesKey(0);
    sub_10012D624(&qword_10039A560, type metadata accessor for SKClientOverridesKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_100128A68();
  return result;
}

- (_TtC9storekitd6Client)initWithBundleIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1001291FC();
  return result;
}

- (_TtC9storekitd6Client)initWithAuditTokenData:(id)a3
{
  id v3 = a3;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1001296D4();
  return result;
}

- (id)queryWith:(BOOL)a3 customReceiptURL:(id)a4
{
  uint64_t v6 = sub_10001E6FC((uint64_t *)&unk_10039B760);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for URL();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = type metadata accessor for URL();
    uint64_t v10 = 1;
  }
  sub_10001B5DC((uint64_t)v8, v10, 1, v9);
  v11 = self;
  sub_100126564();

  sub_10001E6B0((uint64_t)v8, (uint64_t *)&unk_10039B760);
  type metadata accessor for SKServerKey(0);
  sub_10012D624(&qword_10039A570, type metadata accessor for SKServerKey);
  v12.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (_TtC9storekitd6Client)init
{
}

- (NSString)objc_clientDescription
{
  uint64_t v2 = self;
  sub_10012C3EC();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end