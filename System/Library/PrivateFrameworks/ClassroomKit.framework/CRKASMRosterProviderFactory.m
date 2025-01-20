@interface CRKASMRosterProviderFactory
- (id)makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:(id)a3;
- (id)makeEasyMAIDSignInRosterProvider;
- (id)makeInstructorRosterProvider;
- (id)makeInstructorRosterWithoutKeychainAndWithPersonaAdoption;
- (id)makeRosterProviderWithConfiguration:(id)a3;
- (id)makeStudentRosterProvider;
@end

@implementation CRKASMRosterProviderFactory

- (id)makeInstructorRosterProvider
{
  v3 = +[CRKASMRosterProviderConfiguration instructorRosterConfiguration];
  v4 = [(CRKASMRosterProviderFactory *)self makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:v3];

  return v4;
}

- (id)makeEasyMAIDSignInRosterProvider
{
  v3 = [CRKASMEasyMAIDSignInRosterProvider alloc];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__CRKASMRosterProviderFactory_makeEasyMAIDSignInRosterProvider__block_invoke;
  v6[3] = &unk_2646F4310;
  v6[4] = self;
  v4 = [(CRKASMEasyMAIDSignInRosterProvider *)v3 initWithRosterProviderGenerator:v6];

  return v4;
}

uint64_t __63__CRKASMRosterProviderFactory_makeEasyMAIDSignInRosterProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) makeRosterProviderWithConfiguration:a2];
}

- (id)makeStudentRosterProvider
{
  v3 = +[CRKASMRosterProviderConfiguration studentRosterConfiguration];
  v4 = [(CRKASMRosterProviderFactory *)self makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:v3];

  return v4;
}

- (id)makeInstructorRosterWithoutKeychainAndWithPersonaAdoption
{
  v3 = +[CRKASMRosterProviderConfiguration instructorRosterWithoutKeychainAndWithPersonaAdoptionConfiguration];
  v4 = [(CRKASMRosterProviderFactory *)self makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:v3];

  return v4;
}

- (id)makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [CRKASMClassicAdHocSwitchReadingRosterProvider alloc];
  v6 = [v4 classKitFacade];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__CRKASMRosterProviderFactory_makeClassicAdHocSwitchReadingRosterProviderWithConfiguration___block_invoke;
  v10[3] = &unk_2646F4338;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  v8 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)v5 initWithClassKitFacade:v6 rosterProviderGenerator:v10];

  return v8;
}

uint64_t __92__CRKASMRosterProviderFactory_makeClassicAdHocSwitchReadingRosterProviderWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeRosterProviderWithConfiguration:*(void *)(a1 + 40)];
}

- (id)makeRosterProviderWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [[CRKASMConcreteRosterProvider alloc] initWithConfiguration:v3];
  v5 = -[CRKASMCourseSizeLimitingRosterProvider initWithRosterProvider:maxUserCount:maxTrustedUserCount:]([CRKASMCourseSizeLimitingRosterProvider alloc], "initWithRosterProvider:maxUserCount:maxTrustedUserCount:", v4, [v3 maxCourseUsersCount], objc_msgSend(v3, "maxCourseTrustedUsersCount"));

  v6 = [[CRKASMAtomicRosterProvider alloc] initWithRosterProvider:v5];
  id v7 = [CRKASMTimeoutRosterProvider alloc];
  [v3 rosterMutationTimeout];
  double v9 = v8;

  v10 = [(CRKASMTimeoutRosterProvider *)v7 initWithRosterProvider:v6 timeout:v9];
  id v11 = [[CRKASMNetworkCheckingRosterProvider alloc] initWithRosterProvider:v10];

  return v11;
}

@end