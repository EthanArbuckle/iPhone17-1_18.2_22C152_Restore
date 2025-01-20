@interface CKTextEffectCoordinator
+ (BOOL)entryViewTextEffectCoordinationDisabled;
+ (BOOL)inlineRepliesTextEffectCoordinationDisabled;
+ (BOOL)messageEditingTextEffectCoordinationDisabled;
+ (BOOL)transcriptTextEffectCoordinationDisabled;
- (BOOL)isPaused;
- (_NSCustomTextRenderingDisplayLink)customRenderDisplayLink;
- (_TtC7ChatKit23CKTextEffectCoordinator)init;
- (_TtC7ChatKit23CKTextEffectCoordinator)initWithConfiguration:(id)a3;
- (_TtC7ChatKit23CKTextEffectCoordinator)initWithLogIdentifier:(id)a3;
- (_TtP7ChatKit31CKTextEffectCoordinatorDelegate_)delegate;
- (_TtP7ChatKit50CKTextEffectCoordinatorEffectConfigurationDelegate_)configurationDelegate;
- (void)dealloc;
- (void)reset;
- (void)resetAndContinueFromState:(id)a3;
- (void)resetBackoffState;
- (void)setConfigurationDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setPaused:(BOOL)a3 includingAnimators:(BOOL)a4;
- (void)updateWithReason:(id)a3;
@end

@implementation CKTextEffectCoordinator

+ (BOOL)transcriptTextEffectCoordinationDisabled
{
  return sub_18F4BBA20((uint64_t)a1, (uint64_t)a2, qword_1E922BAB0, (unsigned __int8 *)byte_1E922B8D8);
}

+ (BOOL)entryViewTextEffectCoordinationDisabled
{
  return sub_18F4BBA20((uint64_t)a1, (uint64_t)a2, qword_1E922C1E8, (unsigned __int8 *)&byte_1E922C168);
}

+ (BOOL)inlineRepliesTextEffectCoordinationDisabled
{
  return sub_18F4BBA20((uint64_t)a1, (uint64_t)a2, &qword_1E9237630, (unsigned __int8 *)&byte_1E9239098);
}

+ (BOOL)messageEditingTextEffectCoordinationDisabled
{
  return sub_18F4BBA20((uint64_t)a1, (uint64_t)a2, &qword_1E9237638, (unsigned __int8 *)&byte_1E9239099);
}

- (_TtC7ChatKit23CKTextEffectCoordinator)initWithLogIdentifier:(id)a3
{
  uint64_t v4 = sub_18F7B97E0();
  uint64_t v6 = v5;
  id v7 = objc_allocWithZone((Class)type metadata accessor for CKTextEffectCoordinator.Configuration());
  swift_getObjectType();
  uint64_t v8 = sub_18F7B93A0();
  __n128 v9 = MEMORY[0x1F4188790](v8);
  v11 = (uint64_t *)((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v11 = 5;
  (*(void (**)(void *, void, __n128))(v12 + 104))(v11, *MEMORY[0x1E4FBCAE0], v9);
  id v13 = sub_18F610F00(v4, v6, (uint64_t)v11, 1);
  swift_deallocPartialClassInstance();
  v14 = [(CKTextEffectCoordinator *)self initWithConfiguration:v13];

  return v14;
}

- (_TtC7ChatKit23CKTextEffectCoordinator)initWithConfiguration:(id)a3
{
  return (_TtC7ChatKit23CKTextEffectCoordinator *)CKTextEffectCoordinator.init(configuration:)(a3);
}

- (_TtC7ChatKit23CKTextEffectCoordinator)init
{
}

- (void)dealloc
{
  v2 = self;
  CKTextEffectCoordinator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_logger;
  uint64_t v4 = sub_18F7B68E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_resumeDate;
  uint64_t v6 = sub_18F7B61D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  id v7 = (char *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_now;
  uint64_t v8 = sub_18F7B9420();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_delegate);
  __n128 v9 = (char *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_configurationDelegate;

  sub_18F4C25DC((uint64_t)v9);
}

- (_NSCustomTextRenderingDisplayLink)customRenderDisplayLink
{
  return (_NSCustomTextRenderingDisplayLink *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_displayLink));
}

- (BOOL)isPaused
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_isPaused;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPaused:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_isPaused;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (void)setPaused:(BOOL)a3 includingAnimators:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = self;
  sub_18F65C9A0(a3, v4);
}

- (void)reset
{
  v2 = self;
  sub_18F65D57C();
}

- (void)resetAndContinueFromState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18F65D7BC(v4);
}

- (void)resetBackoffState
{
  v2 = self;
  sub_18F65DB1C();
}

- (void)updateWithReason:(id)a3
{
  id v4 = (uint64_t (*)(char *, uint64_t))sub_18F7B97E0();
  unint64_t v6 = v5;
  id v7 = self;
  sub_18F65DD54(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtP7ChatKit31CKTextEffectCoordinatorDelegate_)delegate
{
  return (_TtP7ChatKit31CKTextEffectCoordinatorDelegate_ *)sub_18F569D50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (_TtP7ChatKit50CKTextEffectCoordinatorEffectConfigurationDelegate_)configurationDelegate
{
  return (_TtP7ChatKit50CKTextEffectCoordinatorEffectConfigurationDelegate_ *)sub_18F569D50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_configurationDelegate);
}

- (void)setConfigurationDelegate:(id)a3
{
}

@end