@interface ObjCDiagnosticsReporterLaunchOptions
- (NSArray)files_to_attach;
- (NSString)log_path;
- (NSString)panic_string;
- (ObjCDiagnosticsReporterLaunchOptions)init;
- (void)setFiles_to_attach:(id)a3;
- (void)setLog_path:(id)a3;
- (void)setPanic_string:(id)a3;
@end

@implementation ObjCDiagnosticsReporterLaunchOptions

- (NSArray)files_to_attach
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setFiles_to_attach:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)log_path
{
  return (NSString *)sub_100011530((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

- (void)setLog_path:(id)a3
{
}

- (NSString)panic_string
{
  return (NSString *)sub_100011530((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

- (void)setPanic_string:(id)a3
{
}

- (ObjCDiagnosticsReporterLaunchOptions)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach) = (Class)&_swiftEmptyArrayStorage;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
  v5 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
  *uint64_t v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(ObjCDiagnosticsReporterLaunchOptions *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end