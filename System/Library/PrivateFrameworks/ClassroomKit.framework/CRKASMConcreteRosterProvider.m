@interface CRKASMConcreteRosterProvider
- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isPopulated;
- (CRKASMCertificateIngestor)certificateIngestor;
- (CRKASMConcreteRosterProvider)initWithConfiguration:(id)a3;
- (CRKASMRoster)roster;
- (CRKASMRosterProviderEnvironment)environment;
- (CRKASMRosterUpdater)rosterUpdater;
- (CRKASMUserFetching)userFetcher;
- (CRKASMWorldBuildOperation)worldBuildOperation;
- (CRKClassKitChangeNotifier)classKitChangeNotifier;
- (NSArray)locations;
- (NSArray)locationsWithManagePermissions;
- (id)instructorDirectoryForLocationIDs:(id)a3;
- (id)studentDirectoryForLocationIDs:(id)a3;
- (void)createCourseWithProperties:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)logDurationOfOperation:(id)a3;
- (void)processFinishedWorldBuild:(id)a3;
- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4;
- (void)setLocations:(id)a3;
- (void)setLocationsWithManagePermissions:(id)a3;
- (void)setPopulated:(BOOL)a3;
- (void)setRoster:(id)a3;
- (void)setWorldBuildOperation:(id)a3;
- (void)startNewWorldBuild;
- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)updateManageableLocations:(id)a3;
- (void)updateRoster:(id)a3 outTrustedPersonIDsChanged:(BOOL *)a4;
- (void)worldBuildDidFinish:(id)a3;
@end

@implementation CRKASMConcreteRosterProvider

- (void)dealloc
{
  [(CRKASMWorldBuildOperation *)self->_worldBuildOperation cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKASMConcreteRosterProvider;
  [(CRKASMConcreteRosterProvider *)&v3 dealloc];
}

- (CRKASMConcreteRosterProvider)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRKASMConcreteRosterProvider;
  v5 = [(CRKASMConcreteRosterProvider *)&v22 init];
  if (v5)
  {
    v6 = [[CRKASMRosterProviderEnvironment alloc] initWithConfiguration:v4];
    environment = v5->_environment;
    v5->_environment = v6;

    v8 = [[CRKASMCertificateIngestor alloc] initWithConfiguration:v4];
    certificateIngestor = v5->_certificateIngestor;
    v5->_certificateIngestor = v8;

    v10 = [CRKClassKitChangeNotifier alloc];
    v11 = [v4 rosterRequirements];
    uint64_t v12 = [(CRKClassKitChangeNotifier *)v10 initWithRequirements:v11];
    classKitChangeNotifier = v5->_classKitChangeNotifier;
    v5->_classKitChangeNotifier = (CRKClassKitChangeNotifier *)v12;

    [(CRKClassKitChangeNotifier *)v5->_classKitChangeNotifier setDelegate:v5];
    v14 = [CRKASMRosterUpdater alloc];
    v15 = [v4 rosterRequirements];
    uint64_t v16 = [(CRKASMRosterUpdater *)v14 initWithRequirements:v15];
    rosterUpdater = v5->_rosterUpdater;
    v5->_rosterUpdater = (CRKASMRosterUpdater *)v16;

    locationsWithManagePermissions = v5->_locationsWithManagePermissions;
    v19 = (NSArray *)MEMORY[0x263EFFA68];
    v5->_locationsWithManagePermissions = (NSArray *)MEMORY[0x263EFFA68];

    locations = v5->_locations;
    v5->_locations = v19;

    [(CRKASMConcreteRosterProvider *)v5 refresh];
  }

  return v5;
}

- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(CRKASMConcreteRosterProvider *)self certificateIngestor];
  LOBYTE(a5) = [v10 ingestCertificates:v9 forTrustedUserIdentifier:v8 error:a5];

  return (char)a5;
}

- (CRKASMUserFetching)userFetcher
{
  objc_super v3 = [CRKASMConcreteUserFetcher alloc];
  id v4 = [(CRKASMConcreteRosterProvider *)self environment];
  v5 = [v4 configuration];
  v6 = [v5 rosterRequirements];
  v7 = [(CRKASMConcreteUserFetcher *)v3 initWithRosterRequirements:v6];

  return (CRKASMUserFetching *)v7;
}

- (id)studentDirectoryForLocationIDs:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMConcreteRosterProvider *)self environment];
  v6 = [v5 configuration];
  v7 = [v6 rosterRequirements];
  id v8 = +[CRKASMConcreteUserDirectory studentDirectoryWithRosterRequirements:v7 locationIDs:v4];

  return v8;
}

- (id)instructorDirectoryForLocationIDs:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMConcreteRosterProvider *)self environment];
  v6 = [v5 configuration];
  v7 = [v6 rosterRequirements];
  id v8 = +[CRKASMConcreteUserDirectory instructorDirectoryWithRosterRequirements:v7 locationIDs:v4];

  return v8;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKASMConcreteRosterProvider *)self rosterUpdater];
  [v8 createClassWithProperties:v7 completion:v6];
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CRKASMConcreteRosterProvider *)self rosterUpdater];
  id v8 = [(CRKASMConcreteRosterProvider *)self roster];
  [v9 removeCourseWithIdentifier:v7 roster:v8 completion:v6];
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(CRKASMConcreteRosterProvider *)self rosterUpdater];
  v11 = [(CRKASMConcreteRosterProvider *)self roster];
  [v12 updateCourseWithIdentifier:v10 properties:v9 roster:v11 completion:v8];
}

- (void)startNewWorldBuild
{
  objc_super v3 = [(CRKASMConcreteRosterProvider *)self environment];
  id v4 = [v3 configuration];
  v5 = [v4 osTransactionPrimitives];
  id v6 = [v5 transactionWithReverseDNSReason:@"com.apple.studentd.roster"];

  id v7 = [(CRKASMConcreteRosterProvider *)self worldBuildOperation];
  [v7 cancel];

  id v8 = [CRKASMWorldBuildOperation alloc];
  id v9 = [(CRKASMConcreteRosterProvider *)self environment];
  id v10 = [(CRKASMWorldBuildOperation *)v8 initWithEnvironment:v9];
  [(CRKASMConcreteRosterProvider *)self setWorldBuildOperation:v10];

  v11 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  id v12 = [(CRKASMConcreteRosterProvider *)self worldBuildOperation];
  [v11 addOperation:v12];

  v13 = [(CRKASMConcreteRosterProvider *)self environment];
  v14 = [v13 configuration];
  [v14 transactionReleaseDelay];
  uint64_t v16 = v15;

  v17 = (void *)MEMORY[0x263F086D0];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke;
  v32[3] = &unk_2646F4EB8;
  uint64_t v34 = v16;
  id v18 = v6;
  id v33 = v18;
  v19 = [v17 blockOperationWithBlock:v32];
  v20 = [(CRKASMConcreteRosterProvider *)self worldBuildOperation];
  [v19 addDependency:v20];

  v21 = [MEMORY[0x263F08A48] mainQueue];
  [v21 addOperation:v19];

  objc_initWeak(&location, self);
  objc_super v22 = [(CRKASMConcreteRosterProvider *)self worldBuildOperation];
  v23 = (void *)MEMORY[0x263F086D0];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke_14;
  v28[3] = &unk_2646F3EC8;
  objc_copyWeak(&v30, &location);
  id v24 = v22;
  id v29 = v24;
  v25 = [v23 blockOperationWithBlock:v28];
  v26 = [(CRKASMConcreteRosterProvider *)self worldBuildOperation];
  [v25 addDependency:v26];

  v27 = [MEMORY[0x263F08A48] mainQueue];
  [v27 addOperation:v25];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _CRKLogASM_14();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_224C00000, v2, OS_LOG_TYPE_DEFAULT, "World build operation finished. Will release OS transaction in %lf seconds.", buf, 0xCu);
  }

  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke_11;
  block[3] = &unk_2646F35C0;
  id v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke_11(uint64_t a1)
{
  v2 = _CRKLogASM_14();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v4 = 0;
    _os_log_impl(&dword_224C00000, v2, OS_LOG_TYPE_DEFAULT, "Now ending OS transaction after finishing world build operation.", v4, 2u);
  }

  return [*(id *)(a1 + 32) cancel];
}

void __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained worldBuildDidFinish:*(void *)(a1 + 32)];
}

- (void)worldBuildDidFinish:(id)a3
{
  id v5 = a3;
  id v4 = [(CRKASMConcreteRosterProvider *)self worldBuildOperation];

  if (v4 == v5)
  {
    [(CRKASMConcreteRosterProvider *)self setWorldBuildOperation:0];
    [(CRKASMConcreteRosterProvider *)self processFinishedWorldBuild:v5];
    if (![(CRKASMConcreteRosterProvider *)self isPopulated]) {
      [(CRKASMConcreteRosterProvider *)self setPopulated:1];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)processFinishedWorldBuild:(id)a3
{
  id v4 = a3;
  [(CRKASMConcreteRosterProvider *)self logDurationOfOperation:v4];
  id v5 = [v4 error];
  if (v5)
  {
    id v6 = _CRKLogASM_14();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CRKASMConcreteRosterProvider processFinishedWorldBuild:](v5, v6);
    }
  }
  else
  {
    id v7 = [v4 resultObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    char v14 = 0;
    id v10 = [v9 roster];
    [(CRKASMConcreteRosterProvider *)self updateRoster:v10 outTrustedPersonIDsChanged:&v14];

    v11 = [v9 manageableLocations];

    [(CRKASMConcreteRosterProvider *)self updateManageableLocations:v11];
    if (v14)
    {
      id v12 = _CRKLogASM_14();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_224C00000, v12, OS_LOG_TYPE_DEFAULT, "World building again because the observed trusted person IDs changed", v13, 2u);
      }

      [(CRKASMConcreteRosterProvider *)self startNewWorldBuild];
    }
  }
}

- (void)updateRoster:(id)a3 outTrustedPersonIDsChanged:(BOOL *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  uint64_t v7 = [(CRKASMConcreteRosterProvider *)self roster];
  if (v6 | v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(CRKASMConcreteRosterProvider *)self roster];
    char v10 = [v9 isEqual:v6];

    if ((v10 & 1) == 0)
    {
      v11 = _CRKLogASM_14();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(id)v6 courses];
        int v19 = 138543362;
        v20 = v12;
        _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "Updating ASM roster with courses: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      v13 = _CRKLogASM_14();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        char v14 = [(id)v6 user];
        int v19 = 138543362;
        v20 = v14;
        _os_log_impl(&dword_224C00000, v13, OS_LOG_TYPE_DEFAULT, "Updating ASM roster with user: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      uint64_t v15 = _CRKLogASM_14();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(id)v6 organization];
        int v19 = 138543362;
        v20 = v16;
        _os_log_impl(&dword_224C00000, v15, OS_LOG_TYPE_DEFAULT, "Updating ASM roster with organization: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      [(CRKASMConcreteRosterProvider *)self setRoster:v6];
      v17 = [(CRKASMConcreteRosterProvider *)self classKitChangeNotifier];
      char v18 = [v17 updateObservedTrustedPersonIDsWithRoster:v6];

      if (a4) {
        *a4 = v18;
      }
    }
  }
}

- (void)updateManageableLocations:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(CRKASMConcreteRosterProvider *)self locationsWithManagePermissions];
  if (v4 | v5)
  {
    unint64_t v6 = (void *)v5;
    uint64_t v7 = [(CRKASMConcreteRosterProvider *)self locationsWithManagePermissions];
    char v8 = [v7 isEqual:v4];

    if ((v8 & 1) == 0)
    {
      id v9 = _CRKLogASM_14();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        uint64_t v11 = [(id)v4 count];
        _os_log_impl(&dword_224C00000, v9, OS_LOG_TYPE_DEFAULT, "Updating Manageable ASM locations. Count: %lu", (uint8_t *)&v10, 0xCu);
      }

      [(CRKASMConcreteRosterProvider *)self setLocationsWithManagePermissions:v4];
    }
  }
}

- (void)logDurationOfOperation:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [v3 finishedDate];
  uint64_t v5 = [v3 startedDate];

  [v4 timeIntervalSinceDate:v5];
  uint64_t v7 = v6;

  char v8 = _CRKLogASM_14();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = v7;
    _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "ASM world build operation took %.2f seconds", (uint8_t *)&v9, 0xCu);
  }
}

- (CRKASMRoster)roster
{
  return self->_roster;
}

- (void)setRoster:(id)a3
{
}

- (BOOL)isPopulated
{
  return self->_populated;
}

- (void)setPopulated:(BOOL)a3
{
  self->_populated = a3;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (NSArray)locationsWithManagePermissions
{
  return self->_locationsWithManagePermissions;
}

- (void)setLocationsWithManagePermissions:(id)a3
{
}

- (CRKASMCertificateIngestor)certificateIngestor
{
  return self->_certificateIngestor;
}

- (CRKClassKitChangeNotifier)classKitChangeNotifier
{
  return self->_classKitChangeNotifier;
}

- (CRKASMWorldBuildOperation)worldBuildOperation
{
  return self->_worldBuildOperation;
}

- (void)setWorldBuildOperation:(id)a3
{
}

- (CRKASMRosterUpdater)rosterUpdater
{
  return self->_rosterUpdater;
}

- (CRKASMRosterProviderEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_rosterUpdater, 0);
  objc_storeStrong((id *)&self->_worldBuildOperation, 0);
  objc_storeStrong((id *)&self->_classKitChangeNotifier, 0);
  objc_storeStrong((id *)&self->_certificateIngestor, 0);
  objc_storeStrong((id *)&self->_locationsWithManagePermissions, 0);
  objc_storeStrong((id *)&self->_locations, 0);

  objc_storeStrong((id *)&self->_roster, 0);
}

- (void)processFinishedWorldBuild:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 verboseDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "ASM world build failed: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end