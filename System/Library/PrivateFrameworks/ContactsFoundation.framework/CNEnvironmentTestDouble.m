@interface CNEnvironmentTestDouble
- (CNEnvironmentTestDouble)init;
- (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_)keychainFacade;
- (void)setAuthorizationContext:(id)a3;
- (void)setCommLimitsEnabled:(BOOL)a3;
- (void)setCurrentCountryCode:(id)a3;
- (void)setCurrentLocale:(id)a3;
- (void)setCurrentRegionCode:(id)a3;
- (void)setDefaultCountryCode:(id)a3;
- (void)setDistributedNotificationCenter:(id)a3;
- (void)setEntitlementVerifier:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setGreenTeaDevice:(BOOL)a3;
- (void)setHomeCountryCode:(id)a3;
- (void)setInternalBuild:(BOOL)a3;
- (void)setKeychainEnabled:(BOOL)a3;
- (void)setKeychainFacade:(id)a3;
- (void)setLocalizationServices:(id)a3;
- (void)setMainBundleIdentifier:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setProbabilityUtility:(id)a3;
- (void)setSchedulerProvider:(id)a3;
- (void)setTimeProvider:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setWatchdog:(id)a3;
@end

@implementation CNEnvironmentTestDouble

- (CNEnvironmentTestDouble)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNEnvironmentTestDouble;
  v2 = [(CNEnvironment *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(CNProbabilityUtilityTestDouble);
    probabilityUtility = v2->super._probabilityUtility;
    v2->super._probabilityUtility = (CNProbabilityUtility *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)setFileManager:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CNEnvironmentTestDouble_setFileManager___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __42__CNEnvironmentTestDouble_setFileManager___block_invoke(uint64_t a1)
{
}

- (void)setUserDefaults:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CNEnvironmentTestDouble_setUserDefaults___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __43__CNEnvironmentTestDouble_setUserDefaults___block_invoke(uint64_t a1)
{
}

- (void)setFeatureFlags:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CNEnvironmentTestDouble_setFeatureFlags___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __43__CNEnvironmentTestDouble_setFeatureFlags___block_invoke(uint64_t a1)
{
}

- (void)setSchedulerProvider:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CNEnvironmentTestDouble_setSchedulerProvider___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __48__CNEnvironmentTestDouble_setSchedulerProvider___block_invoke(uint64_t a1)
{
}

- (void)setTimeProvider:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CNEnvironmentTestDouble_setTimeProvider___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __43__CNEnvironmentTestDouble_setTimeProvider___block_invoke(uint64_t a1)
{
}

- (void)setNotificationCenter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CNEnvironmentTestDouble_setNotificationCenter___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __49__CNEnvironmentTestDouble_setNotificationCenter___block_invoke(uint64_t a1)
{
}

- (void)setDistributedNotificationCenter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CNEnvironmentTestDouble_setDistributedNotificationCenter___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __60__CNEnvironmentTestDouble_setDistributedNotificationCenter___block_invoke(uint64_t a1)
{
}

- (void)setEntitlementVerifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CNEnvironmentTestDouble_setEntitlementVerifier___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __50__CNEnvironmentTestDouble_setEntitlementVerifier___block_invoke(uint64_t a1)
{
}

- (void)setAuthorizationContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CNEnvironmentTestDouble_setAuthorizationContext___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __51__CNEnvironmentTestDouble_setAuthorizationContext___block_invoke(uint64_t a1)
{
}

- (void)setLocalizationServices:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CNEnvironmentTestDouble_setLocalizationServices___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __51__CNEnvironmentTestDouble_setLocalizationServices___block_invoke(uint64_t a1)
{
}

- (void)setProbabilityUtility:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CNEnvironmentTestDouble_setProbabilityUtility___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __49__CNEnvironmentTestDouble_setProbabilityUtility___block_invoke(uint64_t a1)
{
}

- (void)setWatchdog:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CNEnvironmentTestDouble_setWatchdog___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __39__CNEnvironmentTestDouble_setWatchdog___block_invoke(uint64_t a1)
{
}

- (void)setMainBundleIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CNEnvironmentTestDouble_setMainBundleIdentifier___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

uint64_t __51__CNEnvironmentTestDouble_setMainBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setDefaultCountryCode:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CNEnvironmentTestDouble_setDefaultCountryCode___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

uint64_t __49__CNEnvironmentTestDouble_setDefaultCountryCode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 120);
  *(void *)(v3 + 120) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setHomeCountryCode:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CNEnvironmentTestDouble_setHomeCountryCode___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __46__CNEnvironmentTestDouble_setHomeCountryCode___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v2 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v5);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = v2;
}

- (void)setCurrentCountryCode:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CNEnvironmentTestDouble_setCurrentCountryCode___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __49__CNEnvironmentTestDouble_setCurrentCountryCode___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v2 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v5);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = v2;
}

- (void)setCurrentLocale:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__CNEnvironmentTestDouble_setCurrentLocale___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

uint64_t __44__CNEnvironmentTestDouble_setCurrentLocale___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 144);
  *(void *)(v3 + 144) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setInternalBuild:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__CNEnvironmentTestDouble_setInternalBuild___block_invoke;
  v3[3] = &unk_1E56A2298;
  v3[4] = self;
  BOOL v4 = a3;
  cn_runWithObjectLock(self, v3);
}

uint64_t __44__CNEnvironmentTestDouble_setInternalBuild___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 160);
  *(void *)(v3 + 160) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setGreenTeaDevice:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__CNEnvironmentTestDouble_setGreenTeaDevice___block_invoke;
  v3[3] = &unk_1E56A2298;
  v3[4] = self;
  BOOL v4 = a3;
  cn_runWithObjectLock(self, v3);
}

uint64_t __45__CNEnvironmentTestDouble_setGreenTeaDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 176);
  *(void *)(v3 + 176) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setCurrentRegionCode:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CNEnvironmentTestDouble_setCurrentRegionCode___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cn_runWithObjectLock(self, v6);
}

void __48__CNEnvironmentTestDouble_setCurrentRegionCode___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v2 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v5);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;
}

- (void)setCommLimitsEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__CNEnvironmentTestDouble_setCommLimitsEnabled___block_invoke;
  v3[3] = &unk_1E56A2298;
  v3[4] = self;
  BOOL v4 = a3;
  cn_runWithObjectLock(self, v3);
}

uint64_t __48__CNEnvironmentTestDouble_setCommLimitsEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 184);
  *(void *)(v3 + 184) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setKeychainEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__CNEnvironmentTestDouble_setKeychainEnabled___block_invoke;
  v3[3] = &unk_1E56A2298;
  v3[4] = self;
  BOOL v4 = a3;
  cn_runWithObjectLock(self, v3);
}

uint64_t __46__CNEnvironmentTestDouble_setKeychainEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 192);
  *(void *)(v3 + 192) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_)keychainFacade
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_19099E1B8();

  return (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_ *)v3;
}

- (void)setKeychainFacade:(id)a3
{
  uint64_t v5 = qword_1E92A0CE0;
  swift_unknownObjectRetain();
  v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)sub_1909A4200();
  [(CNEnvironment *)v6 setValue:a3 forKey:v7];

  swift_unknownObjectRelease();
}

@end