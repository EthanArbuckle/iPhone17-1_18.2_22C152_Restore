@interface DownloadManager
- (_TtC7parsecd15DownloadManager)init;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6;
- (void)bagChangeNotificationWithNotification:(id)a3;
@end

@implementation DownloadManager

- (void)bagChangeNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A7874();
}

- (_TtC7parsecd15DownloadManager)init
{
}

- (void).cxx_destruct
{
  sub_10001CDE0((uint64_t)self + OBJC_IVAR____TtC7parsecd15DownloadManager_assembly);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = type metadata accessor for URLRequest();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (uint64_t *)((char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = _Block_copy(a6);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v14);
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  sub_1000AC72C((uint64_t)v15, v16, v13, (char *)v17, v14);
  _Block_release(v14);

  (*(void (**)(uint64_t *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_1000AD864();
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1000AF1BC();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end