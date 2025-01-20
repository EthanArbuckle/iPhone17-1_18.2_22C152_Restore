@interface CloudSignInContext
- (BOOL)backgroundDataclassEnablement;
- (BOOL)shouldStashLoginResponse;
- (BOOL)skipCDPEnablement;
- (BOOL)skipDataclassEnablement;
- (CDPContext)cdpContext;
- (NSSet)requiredTerms;
- (_TtC18AppleIDSetupDaemon18CloudSignInContext)init;
- (unint64_t)findMyActivationAction;
- (void)setBackgroundDataclassEnablement:(BOOL)a3;
- (void)setCdpContext:(id)a3;
- (void)setFindMyActivationAction:(unint64_t)a3;
- (void)setRequiredTerms:(id)a3;
- (void)setShouldStashLoginResponse:(BOOL)a3;
- (void)setSkipCDPEnablement:(BOOL)a3;
- (void)setSkipDataclassEnablement:(BOOL)a3;
- (void)signInFlowController:(AASignInFlowController *)a3 enableFindMyWithAction:(unint64_t)a4 completion:(id)a5;
- (void)signInFlowController:(AASignInFlowController *)a3 presentProgressViewForAccount:(ACAccount *)a4 completion:(id)a5;
@end

@implementation CloudSignInContext

- (CDPContext)cdpContext
{
  return (CDPContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_cdpContext));
}

- (void)setCdpContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_cdpContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_cdpContext) = (Class)a3;
  id v3 = a3;
}

- (BOOL)skipCDPEnablement
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_skipCDPEnablement);
}

- (void)setSkipCDPEnablement:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_skipCDPEnablement) = a3;
}

- (BOOL)backgroundDataclassEnablement
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_backgroundDataclassEnablement);
}

- (void)setBackgroundDataclassEnablement:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_backgroundDataclassEnablement) = a3;
}

- (BOOL)skipDataclassEnablement
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_skipDataclassEnablement);
}

- (void)setSkipDataclassEnablement:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_skipDataclassEnablement) = a3;
}

- (NSSet)requiredTerms
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_requiredTerms))
  {
    type metadata accessor for AATermsEntry(0);
    sub_248241DD4(&qword_26930F158, type metadata accessor for AATermsEntry);
    swift_bridgeObjectRetain();
    v2 = (void *)sub_24829AE00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (void)setRequiredTerms:(id)a3
{
  if (a3)
  {
    type metadata accessor for AATermsEntry(0);
    sub_248241DD4(&qword_26930F158, type metadata accessor for AATermsEntry);
    id v4 = (objc_class *)sub_24829AE10();
  }
  else
  {
    id v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_requiredTerms) = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)shouldStashLoginResponse
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_shouldStashLoginResponse);
}

- (void)setShouldStashLoginResponse:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_shouldStashLoginResponse) = a3;
}

- (unint64_t)findMyActivationAction
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_findMyActivationAction);
}

- (void)setFindMyActivationAction:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_findMyActivationAction) = (Class)a3;
}

- (void)signInFlowController:(AASignInFlowController *)a3 enableFindMyWithAction:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24829AD90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26930FE30;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26930FE38;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_248285628((uint64_t)v11, (uint64_t)&unk_26930FE40, (uint64_t)v16);
  swift_release();
}

- (void)signInFlowController:(AASignInFlowController *)a3 presentProgressViewForAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24829AD90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26930FE08;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26930FE10;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_248285628((uint64_t)v11, (uint64_t)&unk_26930F350, (uint64_t)v16);
  swift_release();
}

- (_TtC18AppleIDSetupDaemon18CloudSignInContext)init
{
  result = (_TtC18AppleIDSetupDaemon18CloudSignInContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end