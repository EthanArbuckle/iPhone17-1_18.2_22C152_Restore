@interface DMCProfileViewModel
+ (id)trustTextForProfile:(id)a3;
- (BOOL)isMDMProfile;
- (BOOL)managesAppID:(id)a3;
- (BOOL)managesBook:(id)a3;
- (BOOL)showManagedPayloads;
- (DMCProfileUIDataProvider)profileUIDataProvider;
- (DMCProfileViewModel)initWithProfile:(id)a3 managedPayloads:(BOOL)a4;
- (DMCProfileViewModel)initWithProfile:(id)a3 managedPayloads:(BOOL)a4 profileUIDataProvider:(id)a5;
- (MCProfile)profile;
- (NSArray)accountSections;
- (NSArray)byodInfoSections;
- (NSArray)elevatedPayloadTypes;
- (NSArray)managedAppSections;
- (NSArray)managedBookSections;
- (NSArray)moreDetailsSections;
- (NSArray)payloadInfoSectionSummaries;
- (NSArray)restrictionSections;
- (NSString)managedAppleID;
- (int64_t)_numberOfItemsInSectionsArray:(id)a3;
- (int64_t)finalInstallationWarningStyle;
- (int64_t)numberOfAccounts;
- (int64_t)numberOfManagedApps;
- (int64_t)numberOfManagedBooks;
- (int64_t)numberOfRestrictions;
- (void)_determineAvailableElevatedPayloadInfoTypes;
- (void)_managedAppsChanged:(id)a3;
- (void)_managedBooksChanged:(id)a3;
- (void)_profilesUpdated:(id)a3;
- (void)_reloadProfile:(id)a3;
- (void)dealloc;
- (void)setFinalInstallationWarningStyle:(int64_t)a3;
- (void)setProfile:(id)a3 managedPayloads:(BOOL)a4;
- (void)setProfileUIDataProvider:(id)a3;
- (void)setShowManagedPayloads:(BOOL)a3;
@end

@implementation DMCProfileViewModel

- (DMCProfileViewModel)initWithProfile:(id)a3 managedPayloads:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [(DMCProfileViewModel *)self initWithProfile:v6 managedPayloads:v4 profileUIDataProvider:v7];

  return v8;
}

- (DMCProfileViewModel)initWithProfile:(id)a3 managedPayloads:(BOOL)a4 profileUIDataProvider:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMCProfileViewModel;
  v10 = [(DMCProfileViewModel *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_profileUIDataProvider, a5);
    [(DMCProfileViewModel *)v11 setProfile:v8 managedPayloads:v6];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v11 selector:sel__profilesUpdated_ name:@"kMCUIProfilesUpdatedNotification" object:0];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v11 selector:sel__managedAppsChanged_ name:*MEMORY[0x263F53AF8] object:0];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v11 selector:sel__managedBooksChanged_ name:*MEMORY[0x263F527D8] object:0];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DMCProfileViewModel;
  [(DMCProfileViewModel *)&v4 dealloc];
}

- (void)_managedAppsChanged:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"kMCUIManagedAppsDidChange";
  v6[0] = MEMORY[0x263EFFA88];
  objc_super v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(DMCProfileViewModel *)self _reloadProfile:v4];
}

- (void)_managedBooksChanged:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"kMCUIManagedBooksDidChange";
  v6[0] = MEMORY[0x263EFFA88];
  objc_super v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(DMCProfileViewModel *)self _reloadProfile:v4];
}

- (void)_profilesUpdated:(id)a3
{
}

- (void)setProfile:(id)a3 managedPayloads:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (MCProfile *)a3;
  p_profile = &self->_profile;
  if (self->_profile != v7 || self->_showManagedPayloads != v4)
  {
    id v9 = v7;
    objc_storeStrong((id *)p_profile, a3);
    self->_showManagedPayloads = v4;
    p_profile = (MCProfile **)[(DMCProfileViewModel *)self _reloadProfile:0];
    v7 = v9;
  }
  MEMORY[0x270F9A758](p_profile, v7);
}

- (void)setShowManagedPayloads:(BOOL)a3
{
  if (self->_showManagedPayloads != a3)
  {
    self->_showManagedPayloads = a3;
    [(DMCProfileViewModel *)self _reloadProfile:0];
  }
}

- (void)_reloadProfile:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    v7 = [(DMCProfileViewModel *)self profile];
    id v8 = [v7 identifier];
    int v29 = 138543618;
    v30 = v8;
    __int16 v31 = 2114;
    id v32 = v4;
    _os_log_impl(&dword_221CC5000, v6, OS_LOG_TYPE_DEFAULT, "DMCProfileViewModel (%{public}@) reloading profile with userInfo: %{public}@", (uint8_t *)&v29, 0x16u);
  }
  id v9 = [(DMCProfileViewModel *)self profileUIDataProvider];
  v10 = [(DMCProfileViewModel *)self profile];
  v11 = objc_msgSend(v9, "payloadsSummaryForProfile:showManagedPayloads:", v10, -[DMCProfileViewModel showManagedPayloads](self, "showManagedPayloads"));

  v12 = [v11 managedAppleID];
  managedAppleID = self->_managedAppleID;
  self->_managedAppleID = v12;

  self->_finalInstallationWarningStyle = [v11 finalInstallationWarningStyle];
  v14 = [v11 accountSections];
  accountSections = self->_accountSections;
  self->_accountSections = v14;

  objc_super v16 = [v11 managedAppSections];
  managedAppSections = self->_managedAppSections;
  self->_managedAppSections = v16;

  v18 = [v11 managedBookSections];
  managedBookSections = self->_managedBookSections;
  self->_managedBookSections = v18;

  v20 = [v11 moreDetailsSections];
  moreDetailsSections = self->_moreDetailsSections;
  self->_moreDetailsSections = v20;

  v22 = [v11 restrictionSections];
  restrictionSections = self->_restrictionSections;
  self->_restrictionSections = v22;

  v24 = [v11 byodInfoSections];
  byodInfoSections = self->_byodInfoSections;
  self->_byodInfoSections = v24;

  v26 = [v11 payloadInfoSectionSummaries];
  payloadInfoSectionSummaries = self->_payloadInfoSectionSummaries;
  self->_payloadInfoSectionSummaries = v26;

  [(DMCProfileViewModel *)self _determineAvailableElevatedPayloadInfoTypes];
  v28 = [MEMORY[0x263F08A00] defaultCenter];
  [v28 postNotificationName:@"kMCUIProfileDidChangeNotification" object:0 userInfo:v4];
}

- (void)_determineAvailableElevatedPayloadInfoTypes
{
  v3 = (NSArray *)objc_opt_new();
  if (self->_accountSections)
  {
    id v4 = [NSNumber numberWithInteger:1];
    [(NSArray *)v3 addObject:v4];
  }
  if (self->_managedAppSections)
  {
    v5 = [NSNumber numberWithInteger:2];
    [(NSArray *)v3 addObject:v5];
  }
  if (self->_managedBookSections)
  {
    BOOL v6 = [NSNumber numberWithInteger:3];
    [(NSArray *)v3 addObject:v6];
  }
  if (self->_restrictionSections)
  {
    v7 = [NSNumber numberWithInteger:4];
    [(NSArray *)v3 addObject:v7];
  }
  elevatedPayloadTypes = self->_elevatedPayloadTypes;
  self->_elevatedPayloadTypes = v3;
}

- (BOOL)isMDMProfile
{
  v3 = [(DMCProfileViewModel *)self profile];
  if (v3)
  {
    id v4 = [(DMCProfileViewModel *)self profile];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(DMCProfileViewModel *)self profile];
      char v6 = [v5 isMDMProfile];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)managesAppID:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [(DMCProfileViewModel *)self managedAppSections];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = objc_msgSend(v8, "payloadViewModels", v19);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = [*(id *)(*((void *)&v21 + 1) + 8 * j) managedApp];
              v15 = [v14 bundleID];
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {

                BOOL v17 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      BOOL v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)managesBook:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [(DMCProfileViewModel *)self managedBookSections];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = objc_msgSend(v8, "payloadViewModels", v19);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = [*(id *)(*((void *)&v21 + 1) + 8 * j) managedBook];
              v15 = [v14 persistentID];
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {

                BOOL v17 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      BOOL v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_19:

  return v17;
}

+ (id)trustTextForProfile:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 trustLevel] == 2)
  {
    id v4 = 0;
  }
  else
  {
    if ([v3 isSigned]) {
      v5 = @"DMC_PROFILE_TRUST_NOT_VERIFIED";
    }
    else {
      v5 = @"DMC_PROFILE_TRUST_NOT_SIGNED";
    }
    uint64_t v6 = DMCEnrollmentLocalizedString(v5);
    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v11 = *MEMORY[0x263F81500];
    id v8 = [MEMORY[0x263F1C550] DMCProfileRedColor];
    v12[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v4 = (void *)[v7 initWithString:v6 attributes:v9];
  }
  return v4;
}

- (int64_t)_numberOfItemsInSectionsArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) payloadViewModels];
        v6 += [v9 count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)numberOfAccounts
{
  id v3 = [(DMCProfileViewModel *)self accountSections];
  int64_t v4 = [(DMCProfileViewModel *)self _numberOfItemsInSectionsArray:v3];

  return v4;
}

- (int64_t)numberOfManagedApps
{
  id v3 = [(DMCProfileViewModel *)self managedAppSections];
  int64_t v4 = [(DMCProfileViewModel *)self _numberOfItemsInSectionsArray:v3];

  return v4;
}

- (int64_t)numberOfManagedBooks
{
  id v3 = [(DMCProfileViewModel *)self managedBookSections];
  int64_t v4 = [(DMCProfileViewModel *)self _numberOfItemsInSectionsArray:v3];

  return v4;
}

- (int64_t)numberOfRestrictions
{
  id v3 = [(DMCProfileViewModel *)self restrictionSections];
  int64_t v4 = [(DMCProfileViewModel *)self _numberOfItemsInSectionsArray:v3];

  return v4;
}

- (BOOL)showManagedPayloads
{
  return self->_showManagedPayloads;
}

- (int64_t)finalInstallationWarningStyle
{
  return self->_finalInstallationWarningStyle;
}

- (void)setFinalInstallationWarningStyle:(int64_t)a3
{
  self->_finalInstallationWarningStyle = a3;
}

- (MCProfile)profile
{
  return self->_profile;
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (NSArray)elevatedPayloadTypes
{
  return self->_elevatedPayloadTypes;
}

- (NSArray)accountSections
{
  return self->_accountSections;
}

- (NSArray)managedAppSections
{
  return self->_managedAppSections;
}

- (NSArray)managedBookSections
{
  return self->_managedBookSections;
}

- (NSArray)moreDetailsSections
{
  return self->_moreDetailsSections;
}

- (NSArray)restrictionSections
{
  return self->_restrictionSections;
}

- (NSArray)byodInfoSections
{
  return self->_byodInfoSections;
}

- (NSArray)payloadInfoSectionSummaries
{
  return self->_payloadInfoSectionSummaries;
}

- (DMCProfileUIDataProvider)profileUIDataProvider
{
  return self->_profileUIDataProvider;
}

- (void)setProfileUIDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, 0);
  objc_storeStrong((id *)&self->_payloadInfoSectionSummaries, 0);
  objc_storeStrong((id *)&self->_byodInfoSections, 0);
  objc_storeStrong((id *)&self->_restrictionSections, 0);
  objc_storeStrong((id *)&self->_moreDetailsSections, 0);
  objc_storeStrong((id *)&self->_managedBookSections, 0);
  objc_storeStrong((id *)&self->_managedAppSections, 0);
  objc_storeStrong((id *)&self->_accountSections, 0);
  objc_storeStrong((id *)&self->_elevatedPayloadTypes, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end