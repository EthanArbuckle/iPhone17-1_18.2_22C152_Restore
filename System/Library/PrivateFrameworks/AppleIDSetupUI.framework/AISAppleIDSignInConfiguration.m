@interface AISAppleIDSignInConfiguration
+ (NSArray)defaultServiceTypes;
+ (NSString)defaultPrivacyIdentifier;
- (AIDAServiceContext)aidaServiceContext;
- (AISAppleIDSignInConfiguration)init;
- (BOOL)allowSkip;
- (BOOL)canEditUsername;
- (BOOL)isProximitySetupEnabled;
- (BOOL)shouldShowSystemBackButton;
- (NSArray)privacyLinkIdentifiers;
- (NSArray)serviceTypes;
- (NSString)username;
- (int64_t)signInFlowType;
- (void)setAidaServiceContext:(id)a3;
- (void)setAllowSkip:(BOOL)a3;
- (void)setCanEditUsername:(BOOL)a3;
- (void)setIsProximitySetupEnabled:(BOOL)a3;
- (void)setPrivacyLinkIdentifiers:(id)a3;
- (void)setServiceTypes:(id)a3;
- (void)setShouldShowSystemBackButton:(BOOL)a3;
- (void)setSignInFlowType:(int64_t)a3;
- (void)setUsername:(id)a3;
@end

@implementation AISAppleIDSignInConfiguration

- (NSString)username
{
  v2 = (char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_username;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_24835D3E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setUsername:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_24835D418();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_username);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)canEditUsername
{
  v2 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_canEditUsername;
  swift_beginAccess();
  return *v2;
}

- (void)setCanEditUsername:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_canEditUsername;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)allowSkip
{
  v2 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_allowSkip;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowSkip:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_allowSkip;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)shouldShowSystemBackButton
{
  v2 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_shouldShowSystemBackButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowSystemBackButton:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_shouldShowSystemBackButton;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSArray)serviceTypes
{
  swift_beginAccess();
  type metadata accessor for AIDAServiceType(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24835D548();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setServiceTypes:(id)a3
{
  type metadata accessor for AIDAServiceType(0);
  uint64_t v4 = sub_24835D558();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_serviceTypes);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)isProximitySetupEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_isProximitySetupEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsProximitySetupEnabled:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_isProximitySetupEnabled;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSArray)privacyLinkIdentifiers
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24835D548();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
  uint64_t v4 = sub_24835D558();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_privacyLinkIdentifiers);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (AIDAServiceContext)aidaServiceContext
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInConfiguration_aidaServiceContext);
  swift_beginAccess();
  return (AIDAServiceContext *)*v2;
}

- (void)setAidaServiceContext:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInConfiguration_aidaServiceContext);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (int64_t)signInFlowType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_signInFlowType);
  swift_beginAccess();
  return *v2;
}

- (void)setSignInFlowType:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_signInFlowType);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (AISAppleIDSignInConfiguration)init
{
  return (AISAppleIDSignInConfiguration *)AISAppleIDSignInConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInConfiguration_aidaServiceContext);
}

+ (NSArray)defaultServiceTypes
{
  if (qword_269312B70 != -1) {
    swift_once();
  }
  type metadata accessor for AIDAServiceType(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24835D548();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (NSString)defaultPrivacyIdentifier
{
  v2 = (void *)sub_24835D3E8();
  return (NSString *)v2;
}

@end