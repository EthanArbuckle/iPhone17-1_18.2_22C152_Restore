@interface SCATAirPodsHeadGesturesDelegate
- (void)didDetectedError;
- (void)didDetectedWithHeadGesture:(id)a3;
- (void)didStartStreamingWithIsStreaming:(BOOL)a3;
@end

@implementation SCATAirPodsHeadGesturesDelegate

- (void)didDetectedWithHeadGesture:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_10010D628(v3);

  swift_release();
}

- (void)didStartStreamingWithIsStreaming:(BOOL)a3
{
  BOOL v3 = a3;
  swift_retain();
  sub_10010D8A0(v3);

  swift_release();
}

- (void)didDetectedError
{
  uint64_t v2 = qword_1001F3400;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000E881C(v3, (uint64_t)qword_1001F3988);
  oslog = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "HeadGestures: Did detect error", v5, 2u);
    swift_slowDealloc();
  }
  swift_release();
}

@end