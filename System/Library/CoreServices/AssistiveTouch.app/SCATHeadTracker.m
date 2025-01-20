@interface SCATHeadTracker
- (SCATHeadTracker)init;
- (id)localizedDescriptionForAvailabilityDetail:(int64_t)a3;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)dealloc;
- (void)startRunning;
- (void)stopRunning;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATHeadTracker

- (SCATHeadTracker)init
{
  return (SCATHeadTracker *)HeadTracker.init()();
}

- (void)dealloc
{
  uint64_t v2 = qword_1001F2160;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000E881C(v4, (uint64_t)qword_1001F3958);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Deinitializing Head Tracker Session", v7, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HeadTracker();
  [(SCATCameraInputSource *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)startRunning
{
  uint64_t v2 = self;
  HeadTracker.startRunning()();
}

- (void)stopRunning
{
  uint64_t v2 = self;
  HeadTracker.stopRunning()();
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  BOOL v5 = a5;
  int64_t v6 = a4;
  objc_super v8 = (objc_class *)a3;
  v9 = self;
  char v10 = (char)v9;
  v12 = v9;
  v14.super.isa = v8;
  v14.action = v6;
  v14.shortcutIdentifier = (NSString *)v5;
  HeadTracker._didReceiveAction(withIdentifier:start:ignoreInputHold:)(v14, v10, v11);
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  if (a3)
  {
    sub_1000F00F4(0, (unint64_t *)&qword_1001F02D0);
    sub_1000FA33C();
    uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a4;
  objc_super v8 = self;
  HeadTracker.update(withSwitches:recipe:)(v5, a4);

  swift_bridgeObjectRelease();
}

- (id)localizedDescriptionForAvailabilityDetail:(int64_t)a3
{
  HeadTrackerAvailabilityDetail.localizedDescription.getter(a3);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

@end