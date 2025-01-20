@interface CRKASMSuspendableRosterProvider
- (BOOL)hasRosterProvider;
- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isPopulated;
- (CRKASMRoster)roster;
- (CRKASMRosterProviding)underlyingRosterProvider;
- (CRKASMSuspendableRosterProvider)initWithGenerator:(id)a3;
- (CRKASMUserFetching)userFetcher;
- (NSArray)locationsWithManagePermissions;
- (id)generator;
- (id)instructorDirectoryForLocationIDs:(id)a3;
- (id)noRosterProviderError;
- (id)observedKeyPaths;
- (id)studentDirectoryForLocationIDs:(id)a3;
- (void)createCourseWithProperties:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchASMUsersWithIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchNextUsersWithCompletion:(id)a3;
- (void)latchDefaultValues;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refresh;
- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4;
- (void)resume;
- (void)setLocationsWithManagePermissions:(id)a3;
- (void)setPopulated:(BOOL)a3;
- (void)setRoster:(id)a3;
- (void)setUnderlyingRosterProvider:(id)a3;
- (void)startObservingUnderlyingProvider;
- (void)stopObservingUnderlyingProvider;
- (void)suspend;
- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5;
@end

@implementation CRKASMSuspendableRosterProvider

- (void)dealloc
{
  [(CRKASMSuspendableRosterProvider *)self stopObservingUnderlyingProvider];
  v3.receiver = self;
  v3.super_class = (Class)CRKASMSuspendableRosterProvider;
  [(CRKASMSuspendableRosterProvider *)&v3 dealloc];
}

- (CRKASMSuspendableRosterProvider)initWithGenerator:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMSuspendableRosterProvider;
  v5 = [(CRKASMSuspendableRosterProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A620AF0](v4);
    id generator = v5->_generator;
    v5->_id generator = (id)v6;

    [(CRKASMSuspendableRosterProvider *)v5 latchDefaultValues];
  }

  return v5;
}

- (void)suspend
{
  if ([(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    [(CRKASMSuspendableRosterProvider *)self setUnderlyingRosterProvider:0];
  }
}

- (void)resume
{
  if (![(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    id v4 = [(CRKASMSuspendableRosterProvider *)self generator];
    objc_super v3 = v4[2]();
    [(CRKASMSuspendableRosterProvider *)self setUnderlyingRosterProvider:v3];
  }
}

- (BOOL)hasRosterProvider
{
  v2 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)noRosterProviderError
{
  return CRKErrorWithCodeAndUserInfo(2, &unk_26D819FD8);
}

- (void)latchDefaultValues
{
  uint64_t v3 = [(CRKASMSuspendableRosterProvider *)self roster];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(CRKASMSuspendableRosterProvider *)self roster];
    char v6 = [v5 isEqual:0];

    if ((v6 & 1) == 0) {
      [(CRKASMSuspendableRosterProvider *)self setRoster:0];
    }
  }
  v7 = [(CRKASMSuspendableRosterProvider *)self locationsWithManagePermissions];
  v8 = [(CRKASMSuspendableRosterProvider *)self locationsWithManagePermissions];
  char v9 = [v8 isEqual:MEMORY[0x263EFFA68]];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = MEMORY[0x263EFFA68];
    [(CRKASMSuspendableRosterProvider *)self setLocationsWithManagePermissions:v10];
  }
}

- (void)setUnderlyingRosterProvider:(id)a3
{
  v5 = (CRKASMRosterProviding *)a3;
  if (self->_underlyingRosterProvider != v5)
  {
    char v6 = v5;
    [(CRKASMSuspendableRosterProvider *)self stopObservingUnderlyingProvider];
    objc_storeStrong((id *)&self->_underlyingRosterProvider, a3);
    if (self->_underlyingRosterProvider) {
      [(CRKASMSuspendableRosterProvider *)self startObservingUnderlyingProvider];
    }
    else {
      [(CRKASMSuspendableRosterProvider *)self latchDefaultValues];
    }
    v5 = v6;
  }
}

- (id)observedKeyPaths
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"roster";
  v4[1] = @"locationsWithManagePermissions";
  v4[2] = @"populated";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];

  return v2;
}

- (void)startObservingUnderlyingProvider
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(CRKASMSuspendableRosterProvider *)self observedKeyPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        char v9 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
        [v9 addObserver:self forKeyPath:v8 options:4 context:@"CRKASMSuspendableRosterProviderObservationContext"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)stopObservingUnderlyingProvider
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(CRKASMSuspendableRosterProvider *)self observedKeyPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        char v9 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
        [v9 removeObserver:self forKeyPath:v8 context:@"CRKASMSuspendableRosterProviderObservationContext"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  long long v11 = v10;
  if (a6 != @"CRKASMSuspendableRosterProviderObservationContext")
  {
    v28.receiver = self;
    v28.super_class = (Class)CRKASMSuspendableRosterProvider;
    [(CRKASMSuspendableRosterProvider *)&v28 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
    goto LABEL_27;
  }
  if ([v10 isEqualToString:@"roster"])
  {
    long long v12 = [(CRKASMSuspendableRosterProvider *)self roster];
    if (v12)
    {
LABEL_7:
      v14 = [(CRKASMSuspendableRosterProvider *)self roster];
      uint64_t v15 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
      v16 = [v15 roster];
      char v17 = [v14 isEqual:v16];

      if (v12)
      {

        if (v17) {
          goto LABEL_27;
        }
      }
      else
      {

        if (v17) {
          goto LABEL_27;
        }
      }
      a6 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
      v27 = [a6 roster];
      [(CRKASMSuspendableRosterProvider *)self setRoster:v27];
      goto LABEL_25;
    }
    a6 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    long long v13 = [a6 roster];
    if (v13)
    {
      a4 = v13;
      goto LABEL_7;
    }
LABEL_26:

    goto LABEL_27;
  }
  if ([v11 isEqualToString:@"locationsWithManagePermissions"])
  {
    v18 = [(CRKASMSuspendableRosterProvider *)self locationsWithManagePermissions];
    if (!v18)
    {
      a6 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
      v19 = [a6 locationsWithManagePermissions];
      if (!v19) {
        goto LABEL_26;
      }
      a4 = v19;
    }
    v20 = [(CRKASMSuspendableRosterProvider *)self locationsWithManagePermissions];
    v21 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    v22 = [v21 locationsWithManagePermissions];
    char v23 = [v20 isEqual:v22];

    if (v18)
    {

      if (v23) {
        goto LABEL_27;
      }
    }
    else
    {

      if (v23) {
        goto LABEL_27;
      }
    }
    a6 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    v27 = [a6 locationsWithManagePermissions];
    [(CRKASMSuspendableRosterProvider *)self setLocationsWithManagePermissions:v27];
LABEL_25:

    goto LABEL_26;
  }
  if ([v11 isEqualToString:@"populated"])
  {
    if (![(CRKASMSuspendableRosterProvider *)self isPopulated])
    {
      int v24 = [(CRKASMSuspendableRosterProvider *)self isPopulated];
      v25 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
      int v26 = [v25 isPopulated];

      if (v24 != v26)
      {
        a6 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
        -[CRKASMSuspendableRosterProvider setPopulated:](self, "setPopulated:", [a6 isPopulated]);
        goto LABEL_26;
      }
    }
  }
LABEL_27:
}

- (CRKASMUserFetching)userFetcher
{
  if ([(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    uint64_t v3 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    uint64_t v4 = [v3 userFetcher];
  }
  else
  {
    uint64_t v4 = self;
  }

  return (CRKASMUserFetching *)v4;
}

- (id)studentDirectoryForLocationIDs:(id)a3
{
  id v4 = a3;
  if ([(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    uint64_t v5 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    uint64_t v6 = [v5 studentDirectoryForLocationIDs:v4];
  }
  else
  {
    uint64_t v6 = self;
  }

  return v6;
}

- (id)instructorDirectoryForLocationIDs:(id)a3
{
  id v4 = a3;
  if ([(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    uint64_t v5 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    uint64_t v6 = [v5 instructorDirectoryForLocationIDs:v4];
  }
  else
  {
    uint64_t v6 = self;
  }

  return v6;
}

- (void)refresh
{
  id v2 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
  [v2 refresh];
}

- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    id v10 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    char v11 = [v10 ingestCertificates:v8 forTrustedUserIdentifier:v9 error:a5];
  }
  else if (a5)
  {
    [(CRKASMSuspendableRosterProvider *)self noRosterProviderError];
    char v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if ([(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    uint64_t v7 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    [v7 createCourseWithProperties:v8 completion:v6];
  }
  else
  {
    uint64_t v7 = [(CRKASMSuspendableRosterProvider *)self noRosterProviderError];
    v6[2](v6, v7);
  }
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if ([(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    uint64_t v7 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    [v7 removeCourseWithIdentifier:v8 completion:v6];
  }
  else
  {
    uint64_t v7 = [(CRKASMSuspendableRosterProvider *)self noRosterProviderError];
    v6[2](v6, v7);
  }
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if ([(CRKASMSuspendableRosterProvider *)self hasRosterProvider])
  {
    id v10 = [(CRKASMSuspendableRosterProvider *)self underlyingRosterProvider];
    [v10 updateCourseWithIdentifier:v11 properties:v8 completion:v9];
  }
  else
  {
    id v10 = [(CRKASMSuspendableRosterProvider *)self noRosterProviderError];
    v9[2](v9, v10);
  }
}

- (void)fetchASMUsersWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(CRKASMSuspendableRosterProvider *)self noRosterProviderError];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)fetchNextUsersWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(CRKASMSuspendableRosterProvider *)self noRosterProviderError];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (id)generator
{
  return self->_generator;
}

- (CRKASMRosterProviding)underlyingRosterProvider
{
  return self->_underlyingRosterProvider;
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

- (NSArray)locationsWithManagePermissions
{
  return self->_locationsWithManagePermissions;
}

- (void)setLocationsWithManagePermissions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsWithManagePermissions, 0);
  objc_storeStrong((id *)&self->_roster, 0);
  objc_storeStrong((id *)&self->_underlyingRosterProvider, 0);

  objc_storeStrong(&self->_generator, 0);
}

@end