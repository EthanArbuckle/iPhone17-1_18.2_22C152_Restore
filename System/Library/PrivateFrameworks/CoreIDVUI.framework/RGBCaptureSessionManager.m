@interface RGBCaptureSessionManager
- (_TtC9CoreIDVUI24RGBCaptureSessionManager)init;
@end

@implementation RGBCaptureSessionManager

- (_TtC9CoreIDVUI24RGBCaptureSessionManager)init
{
  result = (_TtC9CoreIDVUI24RGBCaptureSessionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_navigationController));

  swift_release();
  sub_21F47F030((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_config, &qword_267EDF5E8);
  sub_21F4C6ABC((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_passingIMQResult, type metadata accessor for RGBCaptureIMQResult);
  sub_21F47F030((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_lastResult, &qword_267EDE920);
  sub_21F4BD3D8((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_delegate);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_featureFlagProvider;
  uint64_t v4 = sub_21F54F110();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end