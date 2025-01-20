@interface CRKASMRosterProviderConfiguration
+ (BOOL)userCachingEnabled;
+ (CRKASMRosterProviderConfiguration)instructorRosterConfiguration;
+ (CRKASMRosterProviderConfiguration)instructorRosterWithoutKeychainAndWithPersonaAdoptionConfiguration;
+ (CRKASMRosterProviderConfiguration)instructorRosterWithoutKeychainConfiguration;
+ (CRKASMRosterProviderConfiguration)studentRosterConfiguration;
+ (id)instructorRosterConfigurationWithCredentialStore:(id)a3 personaAdoption:(BOOL)a4;
- (CRKASMCredentialStore)credentialStore;
- (CRKASMRosterProviderConfiguration)initWithUserCommonNamePrefix:(id)a3 trustedUserCommonNamePrefix:(id)a4 classKitFacade:(id)a5 rosterRequirements:(id)a6 credentialStore:(id)a7 maxCourseUsersCount:(int64_t)a8 maxCourseTrustedUsersCount:(int64_t)a9 rosterMutationTimeout:(double)a10 userCachingEnabled:(BOOL)a11;
- (CRKASMRosterProviderConfiguration)initWithUserCommonNamePrefix:(id)a3 trustedUserCommonNamePrefix:(id)a4 classKitFacade:(id)a5 rosterRequirements:(id)a6 credentialStore:(id)a7 maxCourseUsersCount:(int64_t)a8 maxCourseTrustedUsersCount:(int64_t)a9 rosterMutationTimeout:(double)a10 userCachingEnabled:(BOOL)a11 osTransactionPrimitives:(id)a12 transactionReleaseDelay:(double)a13;
- (CRKClassKitFacade)classKitFacade;
- (CRKClassKitRosterRequirements)rosterRequirements;
- (CRKOSTransactionPrimitives)osTransactionPrimitives;
- (NSMapTable)trustedUserCache;
- (NSMapTable)userCache;
- (NSString)trustedUserCommonNamePrefix;
- (NSString)userCommonNamePrefix;
- (double)rosterMutationTimeout;
- (double)transactionReleaseDelay;
- (int64_t)maxCourseTrustedUsersCount;
- (int64_t)maxCourseUsersCount;
@end

@implementation CRKASMRosterProviderConfiguration

+ (CRKASMRosterProviderConfiguration)studentRosterConfiguration
{
  v3 = +[CRKClassKitFacadeFactory makeStudentClassKitFacade];
  v4 = +[CRKConcreteClassKitRosterRequirements studentRosterRequirementsWithClassKitFacade:v3];
  v5 = +[CRKASMCredentialStoreFactory studentCredentialStore];
  id v6 = objc_alloc((Class)a1);
  LOBYTE(v9) = [a1 userCachingEnabled];
  v7 = (void *)[v6 initWithUserCommonNamePrefix:@"member: ASM" trustedUserCommonNamePrefix:@"leader: ASM" classKitFacade:v3 rosterRequirements:v4 credentialStore:v5 maxCourseUsersCount:100 maxCourseTrustedUsersCount:60.0 rosterMutationTimeout:15 userCachingEnabled:v9];

  return (CRKASMRosterProviderConfiguration *)v7;
}

+ (CRKASMRosterProviderConfiguration)instructorRosterConfiguration
{
  v3 = +[CRKASMCredentialStoreFactory instructorCredentialStore];
  v4 = [a1 instructorRosterConfigurationWithCredentialStore:v3 personaAdoption:0];

  return (CRKASMRosterProviderConfiguration *)v4;
}

+ (CRKASMRosterProviderConfiguration)instructorRosterWithoutKeychainConfiguration
{
  v3 = +[CRKASMCredentialStoreFactory instructorCredentialStoreWithoutKeychain];
  v4 = [a1 instructorRosterConfigurationWithCredentialStore:v3 personaAdoption:0];

  return (CRKASMRosterProviderConfiguration *)v4;
}

+ (CRKASMRosterProviderConfiguration)instructorRosterWithoutKeychainAndWithPersonaAdoptionConfiguration
{
  v3 = +[CRKASMCredentialStoreFactory instructorCredentialStoreWithoutKeychain];
  v4 = [a1 instructorRosterConfigurationWithCredentialStore:v3 personaAdoption:1];

  return (CRKASMRosterProviderConfiguration *)v4;
}

- (CRKASMRosterProviderConfiguration)initWithUserCommonNamePrefix:(id)a3 trustedUserCommonNamePrefix:(id)a4 classKitFacade:(id)a5 rosterRequirements:(id)a6 credentialStore:(id)a7 maxCourseUsersCount:(int64_t)a8 maxCourseTrustedUsersCount:(int64_t)a9 rosterMutationTimeout:(double)a10 userCachingEnabled:(BOOL)a11
{
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = objc_opt_new();
  LOBYTE(v26) = a11;
  v24 = [(CRKASMRosterProviderConfiguration *)self initWithUserCommonNamePrefix:v22 trustedUserCommonNamePrefix:v21 classKitFacade:v20 rosterRequirements:v19 credentialStore:v18 maxCourseUsersCount:a8 maxCourseTrustedUsersCount:a10 rosterMutationTimeout:10.0 userCachingEnabled:a9 osTransactionPrimitives:v26 transactionReleaseDelay:v23];

  return v24;
}

- (CRKASMRosterProviderConfiguration)initWithUserCommonNamePrefix:(id)a3 trustedUserCommonNamePrefix:(id)a4 classKitFacade:(id)a5 rosterRequirements:(id)a6 credentialStore:(id)a7 maxCourseUsersCount:(int64_t)a8 maxCourseTrustedUsersCount:(int64_t)a9 rosterMutationTimeout:(double)a10 userCachingEnabled:(BOOL)a11 osTransactionPrimitives:(id)a12 transactionReleaseDelay:(double)a13
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v36 = a12;
  v37.receiver = self;
  v37.super_class = (Class)CRKASMRosterProviderConfiguration;
  v25 = [(CRKASMRosterProviderConfiguration *)&v37 init];
  if (v25)
  {
    uint64_t v26 = [v20 copy];
    userCommonNamePrefix = v25->_userCommonNamePrefix;
    v25->_userCommonNamePrefix = (NSString *)v26;

    uint64_t v28 = [v21 copy];
    trustedUserCommonNamePrefix = v25->_trustedUserCommonNamePrefix;
    v25->_trustedUserCommonNamePrefix = (NSString *)v28;

    objc_storeStrong((id *)&v25->_classKitFacade, a5);
    objc_storeStrong((id *)&v25->_rosterRequirements, a6);
    objc_storeStrong((id *)&v25->_credentialStore, a7);
    v25->_maxCourseUsersCount = a8;
    v25->_maxCourseTrustedUsersCount = a9;
    v25->_rosterMutationTimeout = a10;
    objc_storeStrong((id *)&v25->_osTransactionPrimitives, a12);
    v25->_transactionReleaseDelay = a13;
    if (a11)
    {
      uint64_t v30 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
      userCache = v25->_userCache;
      v25->_userCache = (NSMapTable *)v30;

      uint64_t v32 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
      trustedUserCache = v25->_trustedUserCache;
      v25->_trustedUserCache = (NSMapTable *)v32;
    }
  }

  return v25;
}

+ (id)instructorRosterConfigurationWithCredentialStore:(id)a3 personaAdoption:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[CRKClassKitFacadeFactory makeInstructorClassKitFacadeWithPersonaAdoption:v4];
  v8 = +[CRKConcreteClassKitRosterRequirements instructorRosterRequirementsWithClassKitFacade:v7];
  id v9 = objc_alloc((Class)a1);
  LOBYTE(v12) = [a1 userCachingEnabled];
  v10 = (void *)[v9 initWithUserCommonNamePrefix:@"leader: ASM" trustedUserCommonNamePrefix:@"member: ASM" classKitFacade:v7 rosterRequirements:v8 credentialStore:v6 maxCourseUsersCount:15 maxCourseTrustedUsersCount:60.0 rosterMutationTimeout:100 userCachingEnabled:v12];

  return v10;
}

+ (BOOL)userCachingEnabled
{
  v2 = objc_opt_new();
  v3 = [v2 makeFeatureFlags];
  char v4 = [v3 isASMUserCachingEnabled];

  return v4;
}

- (NSString)userCommonNamePrefix
{
  return self->_userCommonNamePrefix;
}

- (NSString)trustedUserCommonNamePrefix
{
  return self->_trustedUserCommonNamePrefix;
}

- (CRKClassKitFacade)classKitFacade
{
  return self->_classKitFacade;
}

- (CRKClassKitRosterRequirements)rosterRequirements
{
  return self->_rosterRequirements;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (int64_t)maxCourseUsersCount
{
  return self->_maxCourseUsersCount;
}

- (int64_t)maxCourseTrustedUsersCount
{
  return self->_maxCourseTrustedUsersCount;
}

- (double)rosterMutationTimeout
{
  return self->_rosterMutationTimeout;
}

- (NSMapTable)userCache
{
  return self->_userCache;
}

- (NSMapTable)trustedUserCache
{
  return self->_trustedUserCache;
}

- (CRKOSTransactionPrimitives)osTransactionPrimitives
{
  return self->_osTransactionPrimitives;
}

- (double)transactionReleaseDelay
{
  return self->_transactionReleaseDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransactionPrimitives, 0);
  objc_storeStrong((id *)&self->_trustedUserCache, 0);
  objc_storeStrong((id *)&self->_userCache, 0);
  objc_storeStrong((id *)&self->_credentialStore, 0);
  objc_storeStrong((id *)&self->_rosterRequirements, 0);
  objc_storeStrong((id *)&self->_classKitFacade, 0);
  objc_storeStrong((id *)&self->_trustedUserCommonNamePrefix, 0);

  objc_storeStrong((id *)&self->_userCommonNamePrefix, 0);
}

@end