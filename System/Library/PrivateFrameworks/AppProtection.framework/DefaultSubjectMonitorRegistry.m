@interface DefaultSubjectMonitorRegistry
- (_TtC13AppProtection29DefaultSubjectMonitorRegistry)init;
- (id)addMonitor:(id)a3;
- (id)addMonitor:(id)a3 subjectMask:(unint64_t)a4;
- (id)addMonitor:(id)a3 subjectMask:(unint64_t)a4 subscriptionOptions:(unint64_t)a5;
@end

@implementation DefaultSubjectMonitorRegistry

- (id)addMonitor:(id)a3 subjectMask:(unint64_t)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_247D38F74((uint64_t)a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (id)addMonitor:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  id v5 = sub_247D85EDC();
  swift_unknownObjectRelease();

  return v5;
}

- (id)addMonitor:(id)a3 subjectMask:(unint64_t)a4 subscriptionOptions:(unint64_t)a5
{
  swift_unknownObjectRetain();
  id v8 = self;
  id v9 = sub_247D86048((uint64_t)a3, a4);
  swift_unknownObjectRelease();

  return v9;
}

- (_TtC13AppProtection29DefaultSubjectMonitorRegistry)init
{
  result = (_TtC13AppProtection29DefaultSubjectMonitorRegistry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end