@interface ASOAttributionKitBridge
+ (NSString)compactJWSDictionaryKey;
+ (NSString)reengagementURLDictionaryKey;
- (ASOAttributionKitBridge)init;
- (id)processReengagementWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 bundleID:(id)a5 url:(id)a6;
- (void)recordClickThroughWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 bundleID:(id)a5;
- (void)recordViewThroughWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 bundleID:(id)a5;
@end

@implementation ASOAttributionKitBridge

+ (NSString)compactJWSDictionaryKey
{
  return (NSString *)sub_10000F088((uint64_t)a1, (uint64_t)a2, (void (*)(void))&static ImpressionIntake.compactJWSDictionaryKey.getter);
}

+ (NSString)reengagementURLDictionaryKey
{
  return (NSString *)sub_10000F088((uint64_t)a1, (uint64_t)a2, (void (*)(void))&static ImpressionIntake.reengagementURLDictionaryKey.getter);
}

- (void)recordViewThroughWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 bundleID:(id)a5
{
}

- (void)recordClickThroughWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 bundleID:(id)a5
{
}

- (id)processReengagementWithAdvertisedItemID:(unint64_t)a3 compactJWS:(id)a4 bundleID:(id)a5 url:(id)a6
{
  sub_10000EA20(&qword_10002C608);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v20 - v11;
  sub_100018930();
  sub_100018930();
  if (a6)
  {
    sub_100018550();
    uint64_t v13 = sub_100018560();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = sub_100018560();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  v14 = self;
  sub_10000F540();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FD90((uint64_t)v10, &qword_10002C608);
  sub_100018560();
  uint64_t v15 = *(void *)(v13 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v13) != 1)
  {
    sub_100018540(v16);
    v17 = v18;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v13);
  }

  return v17;
}

- (ASOAttributionKitBridge)init
{
  uint64_t v3 = sub_1000188B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = qword_10002C338;
  uint64_t v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10000FD58(v3, (uint64_t)qword_10002D138);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_1000188C0();

  v10 = (objc_class *)type metadata accessor for AttributionKitBridge();
  v12.receiver = v8;
  v12.super_class = v10;
  return [(ASOAttributionKitBridge *)&v12 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___ASOAttributionKitBridge_logger;
  uint64_t v3 = sub_1000188D0();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end