@interface DefaultSubjectMonitorToken
- (_TtC13AppProtection26DefaultSubjectMonitorToken)init;
- (uint64_t)hash;
- (void)invalidate;
@end

@implementation DefaultSubjectMonitorToken

- (void)invalidate
{
  v2 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC13AppProtection26DefaultSubjectMonitorToken_invalidationHandler);
  v3 = self;
  v2();
}

- (_TtC13AppProtection26DefaultSubjectMonitorToken)init
{
  result = (_TtC13AppProtection26DefaultSubjectMonitorToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (uint64_t)hash
{
  return MEMORY[0x270F9D578]();
}

@end