@interface SURLSessionRunningViewModel
- (_TtC13FTMInternal_427SURLSessionRunningViewModel)init;
- (void)URLSession:(id)a3 didCreateTask:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:;
@end

@implementation SURLSessionRunningViewModel

- (_TtC13FTMInternal_427SURLSessionRunningViewModel)init
{
  result = (_TtC13FTMInternal_427SURLSessionRunningViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_coreTelephonyService));
  v3 = (char *)self + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel__store;
  uint64_t v4 = sub_100157064(&qword_1002DA978);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel__viewState;
  uint64_t v6 = sub_100157064(&qword_1002DA980);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_operationQueue);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100157064(&qword_1002D9670);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100267EF0;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 32) = 0xD000000000000032;
  *(void *)(v12 + 40) = 0x800000010023DB80;
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1001BF698(v7, (uint64_t)&unk_10028D8C0, (uint64_t)sub_1001BFFC4, (uint64_t)&unk_10028D8D8);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1001BF698(v10, (uint64_t)&unk_10028D870, (uint64_t)sub_1001C0214, (uint64_t)&unk_10028D888);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1001BF698(v10, (uint64_t)&unk_10028D820, (uint64_t)sub_1001BFF60, (uint64_t)&unk_10028D838);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1001BF998(v9, v10);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_1001BE1DC(v8, v9, (uint64_t)a5);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:
{
  if (qword_1002D7B38 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1001A9488(v0, (uint64_t)qword_1002E31F0);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)v2 = 136315138;
    sub_1001AB860(0xD000000000000033, 0x800000010023DB10, &v4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

@end