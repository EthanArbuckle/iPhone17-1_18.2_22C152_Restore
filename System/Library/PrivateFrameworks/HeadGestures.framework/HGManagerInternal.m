@interface HGManagerInternal
- (HGConfigurationInternal)configuration;
- (HGManagerInternal)init;
- (HGManagerInternal)initWithDelegate:(id)a3 config:(id)a4;
- (void)muteAudioFeedbackWithSetting:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)start;
- (void)stopWith:(id)a3;
@end

@implementation HGManagerInternal

- (HGConfigurationInternal)configuration
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  return (HGConfigurationInternal *)*v2;
}

- (void)setConfiguration:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (HGManagerInternal)initWithDelegate:(id)a3 config:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = (HGManagerInternal *)sub_250C0F2B0((uint64_t)a3, v6);
  swift_unknownObjectRelease();

  return v7;
}

- (void)start
{
  v2 = self;
  sub_250C0B9B0();
}

- (void)stopWith:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_250C0FC4C;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_250C0CB90((uint64_t)v7, v6);
  sub_250BEB01C((uint64_t)v7);
}

- (void)muteAudioFeedbackWithSetting:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_250C0E53C(v3);
}

- (HGManagerInternal)init
{
  result = (HGManagerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR___HGManagerInternal_id;
  uint64_t v4 = sub_250C1D348();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  sub_250C0FC5C((uint64_t)self + OBJC_IVAR___HGManagerInternal_delegate);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HGManagerInternal_lock);
}

@end