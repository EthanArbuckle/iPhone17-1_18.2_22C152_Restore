@interface CloudTelemetryReporter
+ (BOOL)reportWithTeamID:(id)a3 eventType:(id)a4 event:(id)a5 allowCellularAccess:(BOOL)a6 allowExpensiveAccess:(BOOL)a7 bundleID:(id)a8 error:(id *)a9;
+ (id)_privacyLogs:(id *)a3;
- (CloudTelemetryReporter)init;
@end

@implementation CloudTelemetryReporter

+ (BOOL)reportWithTeamID:(id)a3 eventType:(id)a4 event:(id)a5 allowCellularAccess:(BOOL)a6 allowExpensiveAccess:(BOOL)a7 bundleID:(id)a8 error:(id *)a9
{
  BOOL v10 = a6;
  uint64_t v11 = sub_24A3D43A8();
  uint64_t v13 = v12;
  uint64_t v14 = sub_24A3D43A8();
  uint64_t v16 = v15;
  uint64_t v17 = sub_24A3D4348();
  uint64_t v18 = sub_24A3D43A8();
  uint64_t v20 = v19;
  swift_getObjCClassMetadata();
  static Reporter.report(teamID:eventType:event:allowCellularAccess:allowExpensiveAccess:bundleID:)(v11, v13, v14, v16, v17, v10, a7, v18, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

+ (id)_privacyLogs:(id *)a3
{
  sub_24A3C8D8C();
  sub_24A3D4258();
  v3 = (void *)sub_24A3D4428();
  swift_bridgeObjectRelease();
  return v3;
}

- (CloudTelemetryReporter)init
{
  result = (CloudTelemetryReporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end