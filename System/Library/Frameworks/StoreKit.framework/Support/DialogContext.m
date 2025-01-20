@interface DialogContext
- (AMSProcessInfo)processInfo;
- (NSString)bundleID;
- (NSURL)bundleURL;
- (SKDialogProtocol)dialogObserver;
- (_TtC9storekitd13DialogContext)init;
- (_TtC9storekitd13DialogContext)initWithBundleID:(id)a3 bundleURL:(id)a4 processInfo:(id)a5 dialogObserver:(id)a6;
- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 completionHandler:(id)a4;
- (void)handleDialogRequest:(AMSDialogRequest *)a3 completionHandler:(id)a4;
- (void)handleEngagementRequest:(AMSEngagementRequest *)a3 bag:(AMSBagProtocol *)a4 completionHandler:(id)a5;
- (void)handleEngagementRequest:(AMSEngagementRequest *)a3 bag:(AMSBagProtocol *)a4 hostSceneID:(NSString *)a5 completionHandler:(id)a6;
- (void)handlePurchase:(AMSPurchaseSIWA *)a3 paymentSheetDelegate:(PaymentSheetDelegate *)a4 completionHandler:(id)a5;
- (void)setDialogObserver:(id)a3;
@end

@implementation DialogContext

- (NSString)bundleID
{
  sub_100121D60();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSURL)bundleURL
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100121E7C();
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSURL *)v8;
}

- (SKDialogProtocol)dialogObserver
{
  uint64_t v2 = (void *)sub_100121F18();

  return (SKDialogProtocol *)v2;
}

- (void)setDialogObserver:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100121F88((uint64_t)a3);
}

- (AMSProcessInfo)processInfo
{
  id v2 = sub_100121FD4();

  return (AMSProcessInfo *)v2;
}

- (_TtC9storekitd13DialogContext)initWithBundleID:(id)a3 bundleURL:(id)a4 processInfo:(id)a5 dialogObserver:(id)a6
{
  uint64_t v8 = type metadata accessor for URL();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a5;
  swift_unknownObjectRetain();
  return (_TtC9storekitd13DialogContext *)sub_100121FE4(v11, v13, (uint64_t)v10, v14, (uint64_t)a6);
}

- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 completionHandler:(id)a4
{
}

- (void)handleDialogRequest:(AMSDialogRequest *)a3 completionHandler:(id)a4
{
}

- (void)handleEngagementRequest:(AMSEngagementRequest *)a3 bag:(AMSBagProtocol *)a4 completionHandler:(id)a5
{
}

- (void)handleEngagementRequest:(AMSEngagementRequest *)a3 bag:(AMSBagProtocol *)a4 hostSceneID:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  uint64_t v12 = a3;
  swift_unknownObjectRetain();
  uint64_t v13 = a5;
  id v14 = self;

  sub_100175CA0((uint64_t)&unk_10039C990, (uint64_t)v11);
}

- (void)handlePurchase:(AMSPurchaseSIWA *)a3 paymentSheetDelegate:(PaymentSheetDelegate *)a4 completionHandler:(id)a5
{
}

- (_TtC9storekitd13DialogContext)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9storekitd13DialogContext_bundleURL;
  type metadata accessor for URL();
  sub_10000C9D0();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_unknownObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9storekitd13DialogContext_processInfo);
}

@end