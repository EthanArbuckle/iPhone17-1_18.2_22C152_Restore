@interface ACDDatabaseInitializer
+ (id)new;
- (ACDDatabaseInitializer)init;
- (ACDDatabaseInitializer)initWithDatabaseConnection:(id)a3;
- (BOOL)_ensureAllDataclassesExist;
- (BOOL)_ensureAllInternalAccountTypesExist:(BOOL)a3;
- (BOOL)updateDefaultContentIfNecessary:(id *)a3;
- (id)_accessKeyWithName:(id)a3;
- (id)_accessKeys;
- (id)_accountTypeWithIdentifier:(id)a3;
- (id)_accountTypes;
- (id)_accounts;
- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 credentialType:(id)a7 supportsAuthentication:(BOOL)a8 supportsMultipleAccounts:(BOOL)a9;
- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 syncableDataclasses:(id)a7 credentialType:(id)a8 supportsAuthentication:(BOOL)a9 supportsMultipleAccounts:(BOOL)a10;
- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 syncableDataclasses:(id)a7 credentialType:(id)a8 supportsAuthentication:(BOOL)a9 supportsMultipleAccounts:(BOOL)a10 credentialProtectionPolicy:(id)a11;
- (id)_dataclassWithName:(id)a3;
- (id)_dataclasses;
- (id)_managedDataclassesSetForNames:(id)a3;
- (id)_modernDeviceLocatiorSupportedDataclasses;
- (id)_modernHolidayCalendarSupportedAndSyncableDataclasses;
- (id)_modernIMAPMailSupportedAndSyncableDataclasses;
- (id)_modernIMAPSupportedDataclasses;
- (id)_modernIMAPSyncableDataclasses;
- (id)_modernOnMyDeviceSupportedDataclasses;
- (id)_modernPOPSupportedAndSyncableDataclasses;
- (id)_resultsForEntityNamed:(id)a3;
- (void)_add126AccountType;
- (void)_add163AccountType;
- (void)_addAIMAccountType;
- (void)_addAOLAccountType;
- (void)_addAccessKeyWithName:(id)a3;
- (void)_addAccessKeysAttributeToCloudKitAccountType;
- (void)_addAccessKeysAttributeToFacebookAccountType;
- (void)_addAccessKeysAttributeToLinkedInAccountType;
- (void)_addAccessKeysAttributeToLiverpoolAccountType;
- (void)_addAccessKeysAttributeToTencentWeiboAccountType;
- (void)_addAndConfigureAllOSXAccountTypes;
- (void)_addAppleAccountType;
- (void)_addAppleIDAccountType;
- (void)_addAppleIDAuthenticationAccountType;
- (void)_addBookmarkDAVAccountType;
- (void)_addCalDAVAccountType;
- (void)_addCardDAVAccountType;
- (void)_addCloudKitAccountType;
- (void)_addCloudKitDataclasses;
- (void)_addContactsCalendarsDataclassesToFB;
- (void)_addCredentialType:(id)a3 toAccountType:(id)a4 supportsAuthentication:(BOOL)a5;
- (void)_addDataclassWithName:(id)a3;
- (void)_addDocumentsAndVPNDataclass;
- (void)_addExchangeAccountType;
- (void)_addFMFAccountType;
- (void)_addFaceTimeAccountType;
- (void)_addFacebookAccessKeys;
- (void)_addFacebookAccountType;
- (void)_addFacebookAndDAVLegacyAccountTypes;
- (void)_addFacebookAudienceAccessKey;
- (void)_addFacebookAudienceAccessKeyToFacebookAccountType;
- (void)_addFindMyiPhoneAccountType;
- (void)_addFlickrAccountType;
- (void)_addGameCenterAccountType;
- (void)_addGmailAccountType;
- (void)_addHolidayCalendarAccountType;
- (void)_addHotmailAccountType;
- (void)_addIDMSAccountType;
- (void)_addIMAPAccountType;
- (void)_addIMAPMailAccountType;
- (void)_addIMAPNotesAccountType;
- (void)_addIdentityServicesAccountType;
- (void)_addJabberAccountType;
- (void)_addLDAPAccountType;
- (void)_addLinkedInAccessKeys;
- (void)_addLinkedInAccountType;
- (void)_addLinkedInLegacyAccountType;
- (void)_addLiverpoolAccessKeys;
- (void)_addLiverpoolAccountType;
- (void)_addMSOAccountType;
- (void)_addMadridAccountType;
- (void)_addMissingAccountTypes;
- (void)_addNotesDataclassToAASupportedDataclasses;
- (void)_addOSXServerAccountType;
- (void)_addObsoleteAttributeToAccountTypes;
- (void)_addOnMyDeviceAccountType;
- (void)_addPOPAccountType;
- (void)_addPasswordCredentialTypeToGmailAccountType;
- (void)_addPasswordCredentialTypeToSMTPAccountType;
- (void)_addPublishedCalendarAccountType;
- (void)_addQQAccountType;
- (void)_addRemindersDataclassToCalDAVAccountType;
- (void)_addRemoteManagementAccountType;
- (void)_addSMTPAccountType;
- (void)_addSingleSignOnAccountType;
- (void)_addSubscribedCalendarAccountType;
- (void)_addSupportsAuthenticationAttributeToAccountTypes;
- (void)_addSupportsAuthenticationAttributeToAccounts;
- (void)_addSupportsMultipleAccountsAttributeToAccountTypes;
- (void)_addSyncableDataclassesToCardAndCalDAV;
- (void)_addTencentWeiboAccessKeys;
- (void)_addTencentWeiboAccountType;
- (void)_addTokenCredentialTypeToYahooAccountType;
- (void)_addTudouAccountType;
- (void)_addTwitterAccountType;
- (void)_addVimeoAccountType;
- (void)_addWarmingUpAttributeToAccounts;
- (void)_addWeiboAccountType;
- (void)_addYahooAccountType;
- (void)_addYahooIMAccountType;
- (void)_addYelpAccountType;
- (void)_addYoukuAccountType;
- (void)_addiTunesStoreAccountType;
- (void)_addiTunesStoreSandboxAccountType;
- (void)_allowMultipleAppleIDAuthenticationAccounts;
- (void)_aolSupportsAuthentication;
- (void)_changeFacebookAccountToLegacyAccountType;
- (void)_configureSMTPAccountType;
- (void)_createLiverpoolDataclasses;
- (void)_ensureAccountTypeWithIdentifier:(id)a3 supportsDataclasses:(id)a4 syncsDataclasses:(id)a5;
- (void)_ensureAllDataclassesExist;
- (void)_ensureMajorDataclassesExist;
- (void)_ensurePresenceOfNewsDataclass;
- (void)_ensureProperAccountTypeDataclasses;
- (void)_limitFlickrToOneAccount;
- (void)_limitLinkedInToOneAccount;
- (void)_limitVimeoToOneAccount;
- (void)_makeTencentWeiboSingleton;
- (void)_makeTudouYoukuSingletons;
- (void)_removeAIMAccounts;
- (void)_removeBTMMType;
- (void)_removeFacebookAppVersionAccessKey;
- (void)_removeFacebookPermissionGroupAccessKey;
- (void)_removeLiverpoolTypes;
- (void)_removeMessagesFromAOLSupportedDataclasses;
- (void)_removeMessagesFromGoogleSupportedDataclasses;
- (void)_removeMessengerFromYahooSupportedDataclasses;
- (void)_removeRedundantAccountTypes;
- (void)_removeRedundantDataclasses;
- (void)_setCloudKitAllowsMultipleAccounts;
- (void)_setCloudKitCredentialType;
- (void)_setOwningBundleIDForNativeAccountTypes;
- (void)_setSupportedDataclassesForAOLAccountType;
- (void)_setYahooAccountsProvisionedDataclassesToSupportedOnes;
- (void)_supportiCloudKeychainSyncDataclass;
- (void)_supportiCloudNewsDataclass;
- (void)_switchAolAccountsToOAuth;
- (void)_switchGoogleToOAuthAuthentication;
- (void)_switchHotmailToOAuthAuthentication;
- (void)_switchYahooToOAuthAuthentication;
- (void)_switchYahooToPasswordAuthentication;
- (void)_updateAOLAndAddNotificationsDataclass;
- (void)_updateFlickrCredentialTypeToOAuth;
- (void)_updateIdentityServicesAccountDescription;
- (void)_updateIdentityServicesAccountTypeToSupportAuthenticationAndMultipleAccounts;
- (void)_updateMacOSServerAccountDescription;
- (void)_updateOSXServerAccountDescription;
- (void)_updateTencentWeiboCredentialTypeToOAuth2;
- (void)_updateVimeoCredentialTypeToOAuth;
- (void)_updateWeiboAccountTypeIfNecessary;
- (void)_upgradeLinkedInAccountType;
@end

@implementation ACDDatabaseInitializer

+ (id)new
{
  return 0;
}

- (ACDDatabaseInitializer)init
{
  return 0;
}

- (ACDDatabaseInitializer)initWithDatabaseConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ACDDatabaseInitializer.m", 193, @"Invalid parameter not satisfying: %@", @"databaseConnection" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)ACDDatabaseInitializer;
  v7 = [(ACDDatabaseInitializer *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_databaseConnection, a3);
  }

  return v8;
}

- (BOOL)updateDefaultContentIfNecessary:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  v5 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke;
  v8[3] = &unk_264320D18;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  [v5 performBlockAndWait:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 4);
  v3 = [*(id *)(a1[4] + 8) version];
  v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 integerValue];
  }
  else {
    unint64_t v5 = -1;
  }

  char v6 = _ACDLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithInteger:v5];
    v8 = @"not migrating";
    *(_DWORD *)buf = 138412802;
    v26 = v7;
    v28 = &unk_26C998958;
    __int16 v27 = 2112;
    if ((uint64_t)v5 < 104) {
      v8 = @"migrating";
    }
    __int16 v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_2183AD000, v6, OS_LOG_TYPE_DEFAULT, "\"Opened database at version %@, current config version %@, %@\"", buf, 0x20u);
  }
  if ((uint64_t)v5 >= 105)
  {
    uint64_t v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_3();
    }

    goto LABEL_13;
  }
  if (v5 != 104)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      [*v2 _addTwitterAccountType];
    }
    else
    {
      if (v5 == 1)
      {
LABEL_113:
        [*v2 _addFacebookAccountType];
        [*v2 _addCalDAVAccountType];
        [*v2 _addCardDAVAccountType];
        [*v2 _addDataclassWithName:*MEMORY[0x263EFB3E0]];
        [*v2 _addDataclassWithName:*MEMORY[0x263EFB3F0]];
        goto LABEL_114;
      }
      if (v5)
      {
        if (v5 > 2)
        {
          if (v5 != 3)
          {
            if (v5 > 4)
            {
              if (v5 != 5)
              {
                if (v5 > 6)
                {
                  if (v5 != 7)
                  {
                    if (v5 > 8)
                    {
                      if (v5 != 9)
                      {
                        if (v5 > 0xA)
                        {
                          if (v5 != 11)
                          {
                            if (v5 > 0xC)
                            {
                              if (v5 != 13)
                              {
                                if (v5 > 0xE)
                                {
                                  if (v5 != 15)
                                  {
                                    if (v5 > 0x10)
                                    {
                                      if (v5 != 17)
                                      {
                                        if (v5 > 0x12)
                                        {
                                          if (v5 != 19)
                                          {
                                            if (v5 > 0x14)
                                            {
                                              if (v5 != 21)
                                              {
                                                if (v5 > 0x16)
                                                {
                                                  if (v5 != 23)
                                                  {
                                                    if (v5 > 0x18)
                                                    {
                                                      if (v5 > 0x1A)
                                                      {
                                                        if (v5 != 27)
                                                        {
                                                          if (v5 > 0x1C)
                                                          {
                                                            if (v5 != 29)
                                                            {
                                                              if (v5 > 0x1E)
                                                              {
                                                                if (v5 > 0x20)
                                                                {
                                                                  if (v5 != 33)
                                                                  {
                                                                    if (v5 > 0x22)
                                                                    {
                                                                      if (v5 != 35)
                                                                      {
                                                                        if (v5 > 0x24)
                                                                        {
                                                                          if (v5 != 37)
                                                                          {
                                                                            if (v5 > 0x26)
                                                                            {
                                                                              if (v5 > 0x29)
                                                                              {
                                                                                if (v5 != 42)
                                                                                {
                                                                                  if (v5 > 0x2C)
                                                                                  {
                                                                                    if (v5 != 45)
                                                                                    {
                                                                                      if (v5 > 0x2E)
                                                                                      {
                                                                                        if (v5 != 47)
                                                                                        {
                                                                                          if (v5 > 0x30)
                                                                                          {
                                                                                            if (v5 != 49)
                                                                                            {
                                                                                              if (v5 > 0x33)
                                                                                              {
                                                                                                if (v5 != 52)
                                                                                                {
                                                                                                  if (v5 > 0x35)
                                                                                                  {
                                                                                                    if (v5 > 0x37)
                                                                                                    {
                                                                                                      if (v5 != 56)
                                                                                                      {
                                                                                                        if (v5 > 0x39)
                                                                                                        {
                                                                                                          if (v5 != 58)
                                                                                                          {
                                                                                                            if (v5 > 0x3B)
                                                                                                            {
                                                                                                              if (v5 != 60)
                                                                                                              {
                                                                                                                if (v5 > 0x3D)
                                                                                                                {
                                                                                                                  if (v5 != 62)
                                                                                                                  {
                                                                                                                    if (v5 > 0x3F)
                                                                                                                    {
                                                                                                                      if (v5 != 64)
                                                                                                                      {
                                                                                                                        if (v5 > 0x41)
                                                                                                                        {
                                                                                                                          if (v5 != 66)
                                                                                                                          {
                                                                                                                            if (v5 > 0x43)
                                                                                                                            {
                                                                                                                              if (v5 != 68)
                                                                                                                              {
                                                                                                                                if (v5 > 0x45)
                                                                                                                                {
                                                                                                                                  if (v5 != 70)
                                                                                                                                  {
                                                                                                                                    if (v5 > 0x47)
                                                                                                                                    {
                                                                                                                                      if (v5 != 72)
                                                                                                                                      {
                                                                                                                                        if (v5 > 0x49)
                                                                                                                                        {
                                                                                                                                          if (v5 != 74)
                                                                                                                                          {
                                                                                                                                            if (v5 > 0x4B)
                                                                                                                                            {
                                                                                                                                              if (v5 != 76)
                                                                                                                                              {
                                                                                                                                                if (v5 > 0x4D)
                                                                                                                                                {
                                                                                                                                                  if (v5 != 78)
                                                                                                                                                  {
                                                                                                                                                    if (v5 > 0x4F)
                                                                                                                                                    {
                                                                                                                                                      if (v5 != 80)
                                                                                                                                                      {
                                                                                                                                                        if (v5 > 0x51)
                                                                                                                                                        {
                                                                                                                                                          if (v5 != 82)
                                                                                                                                                          {
                                                                                                                                                            if (v5 > 0x53)
                                                                                                                                                            {
                                                                                                                                                              if (v5 != 84)
                                                                                                                                                              {
                                                                                                                                                                if (v5 > 0x55)
                                                                                                                                                                {
                                                                                                                                                                  if (v5 != 86)
                                                                                                                                                                  {
                                                                                                                                                                    if (v5 > 0x57)
                                                                                                                                                                    {
                                                                                                                                                                      if (v5 != 88)
                                                                                                                                                                      {
                                                                                                                                                                        if (v5 > 0x59)
                                                                                                                                                                        {
                                                                                                                                                                          if (v5 != 90)
                                                                                                                                                                          {
                                                                                                                                                                            if (v5 > 0x5B)
                                                                                                                                                                            {
                                                                                                                                                                              if (v5 != 92)
                                                                                                                                                                              {
                                                                                                                                                                                if (v5 > 0x5E)
                                                                                                                                                                                {
                                                                                                                                                                                  if (v5 != 95)
                                                                                                                                                                                  {
                                                                                                                                                                                    if (v5 > 0x60)
                                                                                                                                                                                    {
                                                                                                                                                                                      if (v5 != 97)
                                                                                                                                                                                      {
                                                                                                                                                                                        if (v5 > 0x62)
                                                                                                                                                                                        {
                                                                                                                                                                                          if (v5 != 99)
                                                                                                                                                                                          {
                                                                                                                                                                                            if (v5 > 0x64)
                                                                                                                                                                                            {
                                                                                                                                                                                              if (v5 != 101)
                                                                                                                                                                                              {
                                                                                                                                                                                                if (v5 > 0x66) {
                                                                                                                                                                                                  goto LABEL_207;
                                                                                                                                                                                                }
                                                                                                                                                                                                goto LABEL_206;
                                                                                                                                                                                              }
LABEL_205:
                                                                                                                                                                                              [*v2 _addDataclassWithName:*MEMORY[0x263EFACD0]];
LABEL_206:
                                                                                                                                                                                              [*v2 _addDataclassWithName:*MEMORY[0x263EFACF0]];
LABEL_207:
                                                                                                                                                                                              [*v2 _addDataclassWithName:*MEMORY[0x263EFACA0]];
                                                                                                                                                                                              char v10 = 1;
                                                                                                                                                                                              goto LABEL_208;
                                                                                                                                                                                            }
LABEL_204:
                                                                                                                                                                                            [*v2 _removeRedundantAccountTypes];
                                                                                                                                                                                            goto LABEL_205;
                                                                                                                                                                                          }
LABEL_203:
                                                                                                                                                                                          [*v2 _addDataclassWithName:*MEMORY[0x263EFAC88]];
                                                                                                                                                                                          goto LABEL_204;
                                                                                                                                                                                        }
LABEL_202:
                                                                                                                                                                                        [*v2 _addDataclassWithName:*MEMORY[0x263EFAD18]];
                                                                                                                                                                                        goto LABEL_203;
                                                                                                                                                                                      }
LABEL_201:
                                                                                                                                                                                      [*v2 _addPublishedCalendarAccountType];
                                                                                                                                                                                      goto LABEL_202;
                                                                                                                                                                                    }
LABEL_200:
                                                                                                                                                                                    [*v2 _removeRedundantDataclasses];
                                                                                                                                                                                    goto LABEL_201;
                                                                                                                                                                                  }
LABEL_199:
                                                                                                                                                                                  [*v2 _addDataclassWithName:*MEMORY[0x263EFAC80]];
                                                                                                                                                                                  goto LABEL_200;
                                                                                                                                                                                }
LABEL_198:
                                                                                                                                                                                [*v2 _addWarmingUpAttributeToAccounts];
                                                                                                                                                                                goto LABEL_199;
                                                                                                                                                                              }
LABEL_197:
                                                                                                                                                                              [*v2 _addRemoteManagementAccountType];
                                                                                                                                                                              goto LABEL_198;
                                                                                                                                                                            }
LABEL_196:
                                                                                                                                                                            [*v2 _removeRedundantDataclasses];
                                                                                                                                                                            goto LABEL_197;
                                                                                                                                                                          }
LABEL_195:
                                                                                                                                                                          [*v2 _addFindMyiPhoneAccountType];
                                                                                                                                                                          goto LABEL_196;
                                                                                                                                                                        }
LABEL_194:
                                                                                                                                                                        [*v2 _addDataclassWithName:*MEMORY[0x263EFAD00]];
                                                                                                                                                                        goto LABEL_195;
                                                                                                                                                                      }
LABEL_193:
                                                                                                                                                                      [*v2 _aolSupportsAuthentication];
                                                                                                                                                                      goto LABEL_194;
                                                                                                                                                                    }
LABEL_192:
                                                                                                                                                                    [*v2 _switchAolAccountsToOAuth];
                                                                                                                                                                    goto LABEL_193;
                                                                                                                                                                  }
LABEL_191:
                                                                                                                                                                  [*v2 _addDataclassWithName:*MEMORY[0x263EFB4B8]];
                                                                                                                                                                  goto LABEL_192;
                                                                                                                                                                }
LABEL_190:
                                                                                                                                                                [*v2 _removeBTMMType];
                                                                                                                                                                goto LABEL_191;
                                                                                                                                                              }
LABEL_189:
                                                                                                                                                              [*v2 _changeSocialAccountTypeObsoleteAttributes];
                                                                                                                                                              goto LABEL_190;
                                                                                                                                                            }
LABEL_188:
                                                                                                                                                            [*v2 _changeFacebookAndLinkedInAccountsToLegacyAccountTypes];
                                                                                                                                                            goto LABEL_189;
                                                                                                                                                          }
LABEL_187:
                                                                                                                                                          [*v2 _addLinkedInLegacyAccountType];
                                                                                                                                                          goto LABEL_188;
                                                                                                                                                        }
LABEL_186:
                                                                                                                                                        [*v2 _addiTunesStoreSandboxAccountType];
                                                                                                                                                        goto LABEL_187;
                                                                                                                                                      }
LABEL_185:
                                                                                                                                                      [*v2 _addDataclassWithName:*MEMORY[0x263EFB470]];
                                                                                                                                                      goto LABEL_186;
                                                                                                                                                    }
LABEL_184:
                                                                                                                                                    [*v2 _removeMessagesFromAOLSupportedDataclasses];
                                                                                                                                                    goto LABEL_185;
                                                                                                                                                  }
LABEL_183:
                                                                                                                                                  [*v2 _addObsoleteAttributeToAccountTypes];
                                                                                                                                                  goto LABEL_184;
                                                                                                                                                }
LABEL_182:
                                                                                                                                                [*v2 _addFacebookAndDAVLegacyAccountTypes];
                                                                                                                                                [*v2 _changeFacebookAccountToLegacyAccountType];
                                                                                                                                                goto LABEL_183;
                                                                                                                                              }
LABEL_181:
                                                                                                                                              [*v2 _removeAIMAccounts];
                                                                                                                                              goto LABEL_182;
                                                                                                                                            }
LABEL_180:
                                                                                                                                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB4A8]];
                                                                                                                                            goto LABEL_181;
                                                                                                                                          }
LABEL_179:
                                                                                                                                          [*v2 _removeMessagesFromGoogleSupportedDataclasses];
                                                                                                                                          goto LABEL_180;
                                                                                                                                        }
LABEL_178:
                                                                                                                                        [*v2 _addDataclassWithName:*MEMORY[0x263EFB418]];
                                                                                                                                        goto LABEL_179;
                                                                                                                                      }
LABEL_177:
                                                                                                                                      [*v2 _addDataclassWithName:*MEMORY[0x263EFB420]];
                                                                                                                                      [*v2 _addDataclassWithName:*MEMORY[0x263EFB408]];
                                                                                                                                      goto LABEL_178;
                                                                                                                                    }
LABEL_176:
                                                                                                                                    [*v2 _setCloudKitAllowsMultipleAccounts];
                                                                                                                                    goto LABEL_177;
                                                                                                                                  }
LABEL_175:
                                                                                                                                  [*v2 _setYahooAccountsProvisionedDataclassesToSupportedOnes];
                                                                                                                                  goto LABEL_176;
                                                                                                                                }
LABEL_174:
                                                                                                                                [*v2 _removeMessengerFromYahooSupportedDataclasses];
                                                                                                                                goto LABEL_175;
                                                                                                                              }
LABEL_173:
                                                                                                                              [*v2 _updateMacOSServerAccountDescription];
                                                                                                                              goto LABEL_174;
                                                                                                                            }
LABEL_172:
                                                                                                                            [*v2 _addNotesDataclassToAASupportedDataclasses];
                                                                                                                            goto LABEL_173;
                                                                                                                          }
LABEL_171:
                                                                                                                          [*v2 _setSupportedDataclassesForAOLAccountType];
                                                                                                                          goto LABEL_172;
                                                                                                                        }
LABEL_170:
                                                                                                                        [*v2 _switchHotmailToOAuthAuthentication];
                                                                                                                        goto LABEL_171;
                                                                                                                      }
LABEL_169:
                                                                                                                      [*v2 _addSingleSignOnAccountType];
                                                                                                                      [*v2 _addDataclassWithName:*MEMORY[0x263EFB3E8]];
                                                                                                                      goto LABEL_170;
                                                                                                                    }
LABEL_168:
                                                                                                                    [*v2 _addMSOAccountType];
                                                                                                                    goto LABEL_169;
                                                                                                                  }
LABEL_167:
                                                                                                                  [*v2 _supportiCloudKeychainSyncDataclass];
                                                                                                                  goto LABEL_168;
                                                                                                                }
LABEL_166:
                                                                                                                [*v2 _ensurePresenceOfNewsDataclass];
                                                                                                                goto LABEL_167;
                                                                                                              }
LABEL_165:
                                                                                                              [*v2 _supportiCloudNewsDataclass];
                                                                                                              goto LABEL_166;
                                                                                                            }
LABEL_164:
                                                                                                            [*v2 _allowMultipleAppleIDAuthenticationAccounts];
                                                                                                            [*v2 _makeTudouYoukuSingletons];
                                                                                                            goto LABEL_165;
                                                                                                          }
LABEL_163:
                                                                                                          [*v2 _addDataclassWithName:*MEMORY[0x263EFB490]];
                                                                                                          [*v2 _addDataclassWithName:*MEMORY[0x263EFB4B0]];
                                                                                                          goto LABEL_164;
                                                                                                        }
LABEL_162:
                                                                                                        [*v2 _configureSMTPAccountType];
                                                                                                        goto LABEL_163;
                                                                                                      }
LABEL_161:
                                                                                                      [*v2 _updateOSXServerAccountDescription];
                                                                                                      goto LABEL_162;
                                                                                                    }
LABEL_160:
                                                                                                    [*v2 _addOnMyDeviceAccountType];
                                                                                                    [*v2 _switchYahooToOAuthAuthentication];
                                                                                                    goto LABEL_161;
                                                                                                  }
LABEL_159:
                                                                                                  [*v2 _updateAOLAndAddNotificationsDataclass];
                                                                                                  goto LABEL_160;
                                                                                                }
LABEL_158:
                                                                                                [*v2 _addIDMSAccountType];
                                                                                                goto LABEL_159;
                                                                                              }
LABEL_157:
                                                                                              [*v2 _addDocumentsAndVPNDataclass];
                                                                                              goto LABEL_158;
                                                                                            }
LABEL_156:
                                                                                            [*v2 _switchGoogleToOAuthAuthentication];
                                                                                            goto LABEL_157;
                                                                                          }
LABEL_155:
                                                                                          [*v2 _addAndConfigureAllOSXAccountTypes];
                                                                                          goto LABEL_156;
                                                                                        }
LABEL_154:
                                                                                        [*v2 _removeLiverpoolTypes];
                                                                                        [*v2 _addCloudKitDataclasses];
                                                                                        [*v2 _setCloudKitCredentialType];
                                                                                        goto LABEL_155;
                                                                                      }
LABEL_153:
                                                                                      [*v2 _addAppleIDAuthenticationAccountType];
                                                                                      goto LABEL_154;
                                                                                    }
LABEL_152:
                                                                                    [*v2 _addCloudKitAccountType];
                                                                                    [*v2 _addAccessKeysAttributeToCloudKitAccountType];
                                                                                    goto LABEL_153;
                                                                                  }
LABEL_151:
                                                                                  [*v2 _createLiverpoolDataclasses];
                                                                                  goto LABEL_152;
                                                                                }
LABEL_150:
                                                                                [*v2 _setOwningBundleIDForNativeAccountTypes];
                                                                                goto LABEL_151;
                                                                              }
LABEL_149:
                                                                              [*v2 _addFMFAccountType];
                                                                              goto LABEL_150;
                                                                            }
LABEL_148:
                                                                            [*v2 _addHolidayCalendarAccountType];
                                                                            goto LABEL_149;
                                                                          }
LABEL_147:
                                                                          [*v2 _makeTencentWeiboSingleton];
                                                                          goto LABEL_148;
                                                                        }
LABEL_146:
                                                                        [*v2 _updateIdentityServicesAccountDescription];
                                                                        goto LABEL_147;
                                                                      }
LABEL_145:
                                                                      [*v2 _updateIdentityServicesAccountTypeToSupportAuthenticationAndMultipleAccounts];
                                                                      goto LABEL_146;
                                                                    }
LABEL_144:
                                                                    [*v2 _addFindMyiPhoneAccountType];
                                                                    goto LABEL_145;
                                                                  }
LABEL_143:
                                                                  [*v2 _addTencentWeiboAccessKeys];
                                                                  [*v2 _addAccessKeysAttributeToTencentWeiboAccountType];
                                                                  goto LABEL_144;
                                                                }
LABEL_142:
                                                                [*v2 _updateTencentWeiboCredentialTypeToOAuth2];
                                                                goto LABEL_143;
                                                              }
LABEL_141:
                                                              [*v2 _addDataclassWithName:*MEMORY[0x263EFB430]];
                                                              [*v2 _addDataclassWithName:*MEMORY[0x263EFB400]];
                                                              goto LABEL_142;
                                                            }
LABEL_140:
                                                            [*v2 _addIMAPMailAccountType];
                                                            goto LABEL_141;
                                                          }
LABEL_139:
                                                          [*v2 _addIMAPAccountType];
                                                          [*v2 _addPOPAccountType];
                                                          goto LABEL_140;
                                                        }
LABEL_138:
                                                        [*v2 _addPasswordCredentialTypeToSMTPAccountType];
                                                        [*v2 _addPasswordCredentialTypeToGmailAccountType];
                                                        [*v2 _addTokenCredentialTypeToYahooAccountType];
                                                        goto LABEL_139;
                                                      }
LABEL_137:
                                                      [*v2 _ensureMajorDataclassesExist];
                                                      [*v2 _addSubscribedCalendarAccountType];
                                                      [*v2 _addBookmarkDAVAccountType];
                                                      [*v2 _addExchangeAccountType];
                                                      [*v2 _addHotmailAccountType];
                                                      [*v2 _addIMAPNotesAccountType];
                                                      [*v2 _addLDAPAccountType];
                                                      [*v2 _ensureProperAccountTypeDataclasses];
                                                      goto LABEL_138;
                                                    }
LABEL_136:
                                                    [*v2 _limitLinkedInToOneAccount];
                                                    goto LABEL_137;
                                                  }
LABEL_135:
                                                  [*v2 _addIdentityServicesAccountType];
                                                  goto LABEL_136;
                                                }
LABEL_134:
                                                [*v2 _updateVimeoCredentialTypeToOAuth];
                                                goto LABEL_135;
                                              }
LABEL_133:
                                              [*v2 _updateFlickrCredentialTypeToOAuth];
                                              goto LABEL_134;
                                            }
LABEL_132:
                                            [*v2 _limitFlickrToOneAccount];
                                            [*v2 _limitVimeoToOneAccount];
                                            goto LABEL_133;
                                          }
LABEL_131:
                                          [*v2 _addLinkedInAccessKeys];
                                          [*v2 _addAccessKeysAttributeToLinkedInAccountType];
                                          goto LABEL_132;
                                        }
LABEL_130:
                                        [*v2 _addiTunesStoreAccountType];
                                        goto LABEL_131;
                                      }
LABEL_129:
                                      [*v2 _addFaceTimeAccountType];
                                      [*v2 _addMadridAccountType];
                                      [*v2 _addGameCenterAccountType];
                                      goto LABEL_130;
                                    }
LABEL_128:
                                    [*v2 _addRemindersDataclassToCalDAVAccountType];
                                    goto LABEL_129;
                                  }
LABEL_127:
                                  [*v2 _addSMTPAccountType];
                                  [*v2 _addGmailAccountType];
                                  [*v2 _addYahooAccountType];
                                  goto LABEL_128;
                                }
LABEL_126:
                                [*v2 _addTencentWeiboAccountType];
                                [*v2 _upgradeLinkedInAccountType];
                                goto LABEL_127;
                              }
LABEL_125:
                              [*v2 _addLiverpoolAccountType];
                              [*v2 _addLiverpoolAccessKeys];
                              [*v2 _addAccessKeysAttributeToLiverpoolAccountType];
                              goto LABEL_126;
                            }
LABEL_124:
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB3C0]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB438]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB478]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB460]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB3F8]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB410]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB440]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB498]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB3B8]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB4C0]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB428]];
                            [*v2 _addDataclassWithName:*MEMORY[0x263EFB4A0]];
                            [*v2 _addAppleAccountType];
                            goto LABEL_125;
                          }
LABEL_123:
                          [*v2 _removeFacebookPermissionGroupAccessKey];
                          [*v2 _removeFacebookAppVersionAccessKey];
                          [*v2 _addFacebookAudienceAccessKey];
                          [*v2 _addFacebookAudienceAccessKeyToFacebookAccountType];
                          goto LABEL_124;
                        }
LABEL_122:
                        [*v2 _addFacebookAccessKeys];
                        [*v2 _addAccessKeysAttributeToFacebookAccountType];
                        goto LABEL_123;
                      }
LABEL_121:
                      [*v2 _addYelpAccountType];
                      goto LABEL_122;
                    }
LABEL_120:
                    [*v2 _addSupportsMultipleAccountsAttributeToAccountTypes];
                    goto LABEL_121;
                  }
LABEL_119:
                  [*v2 _addSyncableDataclassesToCardAndCalDAV];
                  goto LABEL_120;
                }
LABEL_118:
                [*v2 _addMissingAccountTypes];
                goto LABEL_119;
              }
LABEL_117:
              [*v2 _addSupportsAuthenticationAttributeToAccountTypes];
              [*v2 _addSupportsAuthenticationAttributeToAccounts];
              goto LABEL_118;
            }
LABEL_116:
            [*v2 _updateWeiboAccountTypeIfNecessary];
            goto LABEL_117;
          }
LABEL_115:
          [*v2 _addTudouAccountType];
          [*v2 _addYoukuAccountType];
          goto LABEL_116;
        }
LABEL_114:
        [*v2 _addContactsCalendarsDataclassesToFB];
        goto LABEL_115;
      }
    }
    [*v2 _addWeiboAccountType];
    [*v2 _addAppleIDAccountType];
    [*v2 _addFlickrAccountType];
    [*v2 _addVimeoAccountType];
    [*v2 _addLinkedInAccountType];
    goto LABEL_113;
  }
LABEL_13:
  char v10 = 0;
LABEL_208:
  uint64_t v11 = [*v2 _ensureAllDataclassesExist];
  int v12 = [*v2 _ensureAllInternalAccountTypesExist:v11];
  if ((v11 & 1) != 0 || (v10 & 1) != 0 || v12)
  {
    uint64_t v13 = (uint64_t)(a1 + 6);
    id v14 = *(void **)(a1[4] + 8);
    uint64_t v15 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v15 + 40);
    char v16 = [v14 saveWithError:&obj];
    objc_storeStrong((id *)(v15 + 40), obj);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v16;
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      [*(id *)(a1[4] + 8) setVersion:&unk_26C998958];
      uint64_t v17 = *(void **)(a1[4] + 8);
      uint64_t v18 = *(void *)(a1[6] + 8);
      id v23 = *(id *)(v18 + 40);
      char v19 = [v17 saveWithError:&v23];
      objc_storeStrong((id *)(v18 + 40), v23);
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v19;
      LODWORD(v18) = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
      v20 = _ACDLogSystem();
      v21 = v20;
      if (v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [NSNumber numberWithInteger:v5];
          *(_DWORD *)buf = 138412546;
          v26 = v22;
          __int16 v27 = 2112;
          v28 = &unk_26C998958;
          _os_log_impl(&dword_2183AD000, v21, OS_LOG_TYPE_DEFAULT, "\"Updated database from version %@ to %@\"", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_2(v13, v21);
      }
    }
    else
    {
      v21 = _ACDLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_1(v5, v13, v21);
      }
    }
  }
}

- (id)_resultsForEntityNamed:(id)a3
{
  return [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:a3];
}

- (id)_accounts
{
  accounts = self->_accounts;
  if (!accounts)
  {
    v4 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"Account"];
    unint64_t v5 = self->_accounts;
    self->_accounts = v4;

    accounts = self->_accounts;
  }

  return accounts;
}

- (id)_accountTypes
{
  accountTypes = self->_accountTypes;
  if (!accountTypes)
  {
    v4 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"AccountType"];
    unint64_t v5 = self->_accountTypes;
    self->_accountTypes = v4;

    accountTypes = self->_accountTypes;
  }

  return accountTypes;
}

- (id)_dataclasses
{
  dataclasses = self->_dataclasses;
  if (!dataclasses)
  {
    v4 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"Dataclass"];
    unint64_t v5 = self->_dataclasses;
    self->_dataclasses = v4;

    dataclasses = self->_dataclasses;
  }

  return dataclasses;
}

- (id)_accessKeys
{
  accessKeys = self->_accessKeys;
  if (!accessKeys)
  {
    v4 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"AccessOptionsKey"];
    unint64_t v5 = self->_accessKeys;
    self->_accessKeys = v4;

    accessKeys = self->_accessKeys;
  }

  return accessKeys;
}

- (id)_dataclassWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = [(ACDDatabaseInitializer *)self _dataclasses];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 name];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_accountTypeWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = [(ACDDatabaseInitializer *)self _accountTypes];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 identifier];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_accessKeyWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = [(ACDDatabaseInitializer *)self _accessKeys];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 name];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 credentialType:(id)a7 supportsAuthentication:(BOOL)a8 supportsMultipleAccounts:(BOOL)a9
{
  BYTE1(v10) = a9;
  LOBYTE(v10) = a8;
  return -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", a3, a4, *(void *)&a5, a6, 0, a7, v10);
}

- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 syncableDataclasses:(id)a7 credentialType:(id)a8 supportsAuthentication:(BOOL)a9 supportsMultipleAccounts:(BOOL)a10
{
  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:", a3, a4, *(void *)&a5, a6, a7, a8, v11, 0);
}

- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 syncableDataclasses:(id)a7 credentialType:(id)a8 supportsAuthentication:(BOOL)a9 supportsMultipleAccounts:(BOOL)a10 credentialProtectionPolicy:(id)a11
{
  uint64_t v14 = *(void *)&a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a11;
  id v22 = a4;
  uint64_t v23 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:v17];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = _ACDLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v17;
      _os_log_impl(&dword_2183AD000, v25, OS_LOG_TYPE_DEFAULT, "@\"Attempt to add account type %@ which already exists, will modify to match expected\"", buf, 0xCu);
    }
  }
  else
  {
    v24 = [(ACDDatabaseConnection *)self->_databaseConnection insertNewObjectForEntityForName:@"AccountType"];
  }
  [v24 setIdentifier:v17];
  [v24 setAccountTypeDescription:v22];

  v26 = [NSNumber numberWithInt:v14];
  [v24 setVisibility:v26];

  __int16 v27 = [NSNumber numberWithBool:a9];
  [v24 setSupportsAuthentication:v27];

  v28 = [NSNumber numberWithBool:a10];
  [v24 setSupportsMultipleAccounts:v28];

  if (v18) {
    [v24 setSupportedDataclasses:v18];
  }
  if (v19) {
    [v24 setSyncableDataclasses:v19];
  }
  if (v20) {
    [v24 setCredentialType:v20];
  }
  if (v21)
  {
    __int16 v29 = v24;
    id v30 = v21;
  }
  else
  {
    id v30 = (id)*MEMORY[0x263F16E98];
    __int16 v29 = v24;
  }
  [v29 setCredentialProtectionPolicy:v30];
  uint64_t v31 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"AccountType"];
  v32 = (NSArray *)[v31 mutableCopy];
  accountTypes = self->_accountTypes;
  self->_accountTypes = v32;

  return v24;
}

- (void)_addCredentialType:(id)a3 toAccountType:(id)a4 supportsAuthentication:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:v9];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 setCredentialType:v8];
      if (v5) {
        uint64_t v12 = MEMORY[0x263EFFA88];
      }
      else {
        uint64_t v12 = MEMORY[0x263EFFA80];
      }
      [v11 setSupportsAuthentication:v12];
    }
    else
    {
      long long v13 = _ACDLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ACDDatabaseInitializer _addCredentialType:toAccountType:supportsAuthentication:]();
      }
    }
  }
}

- (void)_addDataclassWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:v4];

  if (v5)
  {
    id v6 = _ACDLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseInitializer _addDataclassWithName:]();
    }
  }
  else
  {
    uint64_t v7 = [(ACDDatabaseConnection *)self->_databaseConnection insertNewObjectForEntityForName:@"Dataclass"];
    [v7 setName:v4];
    id v8 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"Dataclass"];
    id v9 = (NSArray *)[v8 mutableCopy];
    dataclasses = self->_dataclasses;
    self->_dataclasses = v9;
  }
}

- (void)_addAccessKeyWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACDDatabaseInitializer *)self _accessKeyWithName:v4];

  if (v5)
  {
    id v6 = _ACDLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseInitializer _addAccessKeyWithName:]();
    }
  }
  else
  {
    uint64_t v7 = [(ACDDatabaseConnection *)self->_databaseConnection insertNewObjectForEntityForName:@"AccessOptionsKey"];
    [v7 setName:v4];
    id v8 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"AccessOptionsKey"];
    id v9 = (NSArray *)[v8 mutableCopy];
    accessKeys = self->_accessKeys;
    self->_accessKeys = v9;
  }
}

- (void)_addTwitterAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFD0] displayName:@"Twitter" visibility:1 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB038] supportsAuthentication:1 supportsMultipleAccounts:v3];
}

- (void)_addAppleIDAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE70] displayName:@"AppleID" visibility:0 supportedDataclasses:v5 credentialType:@"appleid-tokens" supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addFaceTimeAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAEB8] displayName:@"FaceTime" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addMadridAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF60] displayName:@"Messages" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addGameCenterAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAEE0] displayName:@"Game Center" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addiTunesStoreAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFB000] displayName:@"iTunes Store" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addFacebookAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  id v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = 0;
  id v6 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAEC0] displayName:@"Facebook" visibility:1 supportedDataclasses:v8 credentialType:*MEMORY[0x263EFB040] supportsAuthentication:1 supportsMultipleAccounts:v7];
}

- (void)_addWeiboAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFA0] displayName:@"Sina Weibo" visibility:1 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB038] supportsAuthentication:1 supportsMultipleAccounts:v3];
}

- (void)_updateWeiboAccountTypeIfNecessary
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:@"com.apple.weibo"];
  if (v2)
  {
    id v3 = v2;
    [v2 setIdentifier:*MEMORY[0x263EFAFA0]];
    [v3 setAccountTypeDescription:@"Sina Weibo"];
    id v2 = v3;
  }
}

- (void)_addCalDAVAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  id v5 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE80] displayName:@"CalDAV" visibility:0 supportedDataclasses:v7 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v6];
}

- (void)_addCardDAVAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  id v5 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE90] displayName:@"CardDAV" visibility:0 supportedDataclasses:v7 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v6];
}

- (void)_addFlickrAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAED8] displayName:@"Flickr" visibility:1 supportedDataclasses:v5 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v4];
}

- (void)_addVimeoAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFD8] displayName:@"Vimeo" visibility:1 supportedDataclasses:v5 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v4];
}

- (void)_addLinkedInAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:@"com.apple.linkedin" displayName:@"LinkedIn" visibility:1 supportedDataclasses:v5 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v4];
}

- (void)_addTudouAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFC0] displayName:@"Tudou" visibility:1 supportedDataclasses:v5 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v4];
}

- (void)_addYoukuAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFF8] displayName:@"Youku" visibility:1 supportedDataclasses:v5 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v4];
}

- (void)_addYelpAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 0;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFF0] displayName:@"Yelp" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB038] supportsAuthentication:0 supportsMultipleAccounts:v4];
}

- (void)_addAppleAccountType
{
  id v15 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v14 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  id v18 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  id v17 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB438]];
  uint64_t v12 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB478]];
  long long v13 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3C0]];
  id v3 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB410]];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB440]];
  id v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB498]];
  uint64_t v6 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3B8]];
  id v7 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB4C0]];
  id v8 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB428]];
  id v9 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB4A0]];
  long long v16 = objc_msgSend(v15, "initWithObjects:", v14, v18, v17, v12, v13, v3, v4, v5, v6, v7, v8, v9, 0);

  LOBYTE(v11) = 1;
  id v10 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE58] displayName:@"iCloud" visibility:1 supportedDataclasses:v16 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:1 supportsMultipleAccounts:v11];
}

- (void)_addLiverpoolAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 0;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:@"com.apple.account.Liverpool" displayName:@"Liverpool" visibility:1 supportedDataclasses:v5 credentialType:@"liverpool-tokens" supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addTencentWeiboAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFB8] displayName:@"Tencent Weibo" visibility:1 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB038] supportsAuthentication:1 supportsMultipleAccounts:v3];
}

- (void)_upgradeLinkedInAccountType
{
  id v3 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:@"com.apple.linkedin"];
  [v3 setCredentialType:*MEMORY[0x263EFB038]];
  uint64_t v2 = MEMORY[0x263EFFA88];
  [v3 setSupportsAuthentication:MEMORY[0x263EFFA88]];
  [v3 setSupportsMultipleAccounts:v2];
}

- (void)_addContactsCalendarsDataclassesToFB
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  id v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEC0]];
  [v6 setSupportedDataclasses:v7];
}

- (void)_addSupportsAuthenticationAttributeToAccountTypes
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v2 = [(ACDDatabaseInitializer *)self _accountTypes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    uint64_t v6 = *MEMORY[0x263EFAE70];
    uint64_t v23 = *MEMORY[0x263EFAFD0];
    uint64_t v24 = *MEMORY[0x263EFAEC0];
    uint64_t v20 = *MEMORY[0x263EFAFA0];
    uint64_t v18 = *MEMORY[0x263EFAE80];
    uint64_t v16 = *MEMORY[0x263EFAE90];
    id v21 = v2;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v9 = [v8 identifier];
        if ([v9 isEqual:v6])
        {
          uint64_t v10 = 1;
        }
        else
        {
          uint64_t v11 = v6;
          uint64_t v12 = [v8 identifier];
          if ([v12 isEqual:v24])
          {
            uint64_t v10 = 1;
          }
          else
          {
            long long v13 = [v8 identifier];
            if ([v13 isEqual:v23])
            {
              uint64_t v10 = 1;
            }
            else
            {
              uint64_t v14 = [v8 identifier];
              if ([v14 isEqual:v20])
              {
                uint64_t v10 = 1;
              }
              else
              {
                id v19 = [v8 identifier];
                if ([v19 isEqual:v18])
                {
                  uint64_t v10 = 1;
                }
                else
                {
                  id v17 = [v8 identifier];
                  uint64_t v10 = [v17 isEqual:v16];
                }
              }

              uint64_t v2 = v21;
            }

            uint64_t v5 = v22;
          }

          uint64_t v6 = v11;
        }

        id v15 = [NSNumber numberWithBool:v10];
        [v8 setSupportsAuthentication:v15];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }
}

- (void)_addSupportsAuthenticationAttributeToAccounts
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [(ACDDatabaseInitializer *)self _accounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    uint64_t v6 = *MEMORY[0x263EFAE80];
    uint64_t v7 = *MEMORY[0x263EFAE90];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 accountType];
        uint64_t v11 = [v10 identifier];
        if (([v11 isEqual:v6] & 1) != 0 || objc_msgSend(v11, "isEqual:", v7))
        {
          uint64_t v12 = [NSNumber numberWithBool:1];
        }
        else
        {
          uint64_t v12 = [v10 supportsAuthentication];
        }
        long long v13 = (void *)v12;
        [v9 setSupportsAuthentication:v12];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (void)_addMissingAccountTypes
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(ACDDatabaseInitializer *)self _accountTypes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) identifier];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if (([v3 containsObject:*MEMORY[0x263EFAFD0]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addTwitterAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAFA0]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addWeiboAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAE70]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addAppleIDAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAED8]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addFlickrAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAFD8]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addVimeoAccountType];
  }
  if (([v3 containsObject:@"com.apple.linkedin"] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addLinkedInAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAEC0]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addFacebookAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAE80]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addCalDAVAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAE90]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addCardDAVAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAFC0]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addTudouAccountType];
  }
  if (([v3 containsObject:*MEMORY[0x263EFAFF8]] & 1) == 0) {
    [(ACDDatabaseInitializer *)self _addYoukuAccountType];
  }
}

- (void)_addSyncableDataclassesToCardAndCalDAV
{
  id v10 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE90]];
  if (v10)
  {
    id v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
    uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, 0);

    [v10 setSyncableDataclasses:v5];
  }
  uint64_t v6 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE80]];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
    id v9 = objc_msgSend(v7, "setWithObjects:", v8, 0);

    [v6 setSyncableDataclasses:v9];
  }
}

- (void)_addSupportsMultipleAccountsAttributeToAccountTypes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [(ACDDatabaseInitializer *)self _accountTypes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = *MEMORY[0x263EFAEC0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 identifier];
        int v10 = [v9 isEqual:v6];

        long long v11 = [NSNumber numberWithBool:v10 ^ 1u];
        [v8 setSupportsMultipleAccounts:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)_addFacebookAccessKeys
{
  [(ACDDatabaseInitializer *)self _addAccessKeyWithName:*MEMORY[0x263EFB080]];
  uint64_t v3 = *MEMORY[0x263EFB090];

  [(ACDDatabaseInitializer *)self _addAccessKeyWithName:v3];
}

- (void)_addLiverpoolAccessKeys
{
}

- (void)_addAccessKeysAttributeToFacebookAccountType
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB080]];
  v8[0] = v3;
  uint64_t v4 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB090]];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  uint64_t v6 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEC0]];
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  [v6 setAccessKeys:v7];
}

- (void)_addAccessKeysAttributeToLiverpoolAccountType
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB0D0]];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  uint64_t v5 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:@"com.apple.account.Liverpool"];
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  [v5 setAccessKeys:v6];
}

- (void)_removeFacebookPermissionGroupAccessKey
{
  uint64_t v3 = [(ACDDatabaseInitializer *)self _accessKeyWithName:@"ACFacebookPermissionGroupKey"];
  if (v3) {
    [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v3];
  }

  MEMORY[0x270F9A758]();
}

- (void)_removeFacebookAppVersionAccessKey
{
  uint64_t v3 = [(ACDDatabaseInitializer *)self _accessKeyWithName:@"ACFacebookAppVersionKey"];
  if (v3) {
    [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v3];
  }

  MEMORY[0x270F9A758]();
}

- (void)_addFacebookAudienceAccessKey
{
}

- (void)_addFacebookAudienceAccessKeyToFacebookAccountType
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB080]];
  uint64_t v4 = -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x263EFB090], v3);
  v9[1] = v4;
  uint64_t v5 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB088]];
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];

  uint64_t v7 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEC0]];
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:v6];
  [v7 setAccessKeys:v8];
}

- (void)_addSMTPAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF98] displayName:@"SMTP" visibility:0 supportedDataclasses:0 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addGmailAccountType
{
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB438]];
  uint64_t v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  uint64_t v6 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  uint64_t v7 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB460]];
  id v10 = (id)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, 0);

  LOBYTE(v9) = 1;
  id v8 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAEE8] displayName:@"Gmail" visibility:0 supportedDataclasses:v10 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v9];
}

- (void)_addYahooAccountType
{
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB438]];
  uint64_t v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  uint64_t v6 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB478]];
  uint64_t v7 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  id v8 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB460]];
  id v11 = (id)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, 0);

  LOBYTE(v10) = 1;
  id v9 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFE0] displayName:@"Yahoo" visibility:0 supportedDataclasses:v11 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v10];
}

- (void)_addRemindersDataclassToCalDAVAccountType
{
  id v7 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE80]];
  if (v7)
  {
    id v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
    uint64_t v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB478]];
    uint64_t v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

    [v7 setSyncableDataclasses:v6];
    [v7 setSupportedDataclasses:v6];
  }
}

- (void)_addLinkedInAccessKeys
{
  [(ACDDatabaseInitializer *)self _addAccessKeyWithName:@"ACLinkedInAppIdKey"];

  [(ACDDatabaseInitializer *)self _addAccessKeyWithName:@"ACLinkedInPermissionsKey"];
}

- (void)_addAccessKeysAttributeToLinkedInAccountType
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = [(ACDDatabaseInitializer *)self _accessKeyWithName:@"ACLinkedInAppIdKey"];
  v8[0] = v3;
  uint64_t v4 = [(ACDDatabaseInitializer *)self _accessKeyWithName:@"ACLinkedInPermissionsKey"];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  uint64_t v6 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:@"com.apple.linkedin"];
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  [v6 setAccessKeys:v7];
}

- (void)_limitFlickrToOneAccount
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAED8]];
  [v2 setSupportsMultipleAccounts:MEMORY[0x263EFFA80]];
}

- (void)_limitVimeoToOneAccount
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFD8]];
  [v2 setSupportsMultipleAccounts:MEMORY[0x263EFFA80]];
}

- (void)_updateFlickrCredentialTypeToOAuth
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAED8]];
  [v2 setSupportsAuthentication:MEMORY[0x263EFFA88]];
  [v2 setCredentialType:*MEMORY[0x263EFB038]];
}

- (void)_updateVimeoCredentialTypeToOAuth
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFD8]];
  [v2 setSupportsAuthentication:MEMORY[0x263EFFA88]];
  [v2 setCredentialType:*MEMORY[0x263EFB038]];
}

- (void)_addSubscribedCalendarAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  id v5 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFB0] displayName:@"SubscribedCalendar" visibility:0 supportedDataclasses:v7 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v6];
}

- (void)_addBookmarkDAVAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3C0]];
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  id v5 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE78] displayName:@"BookmarkDAV" visibility:0 supportedDataclasses:v7 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v6];
}

- (void)_addExchangeAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB438]];
  id v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  uint64_t v6 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  id v7 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB478]];
  id v8 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB460]];
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = 1;
  id v9 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAEB0] displayName:@"Exchange" visibility:0 supportedDataclasses:v11 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v10];
}

- (void)_addIMAPNotesAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB460]];
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  id v5 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF18] displayName:@"IMAPNotes" visibility:0 supportedDataclasses:v7 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v6];
}

- (void)_addLDAPAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F8]];
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  id v5 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF40] displayName:@"LDAP" visibility:0 supportedDataclasses:v7 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v6];
}

- (void)_addHotmailAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB438]];
  id v5 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  uint64_t v6 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  id v7 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB478]];
  id v8 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB460]];
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = 1;
  id v9 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAEF8] displayName:@"Hotmail" visibility:0 supportedDataclasses:v11 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v10];
}

- (void)_ensureAccountTypeWithIdentifier:(id)a3 supportsDataclasses:(id)a4 syncsDataclasses:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:a3];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [(ACDDatabaseInitializer *)self _dataclassWithName:*(void *)(*((void *)&v33 + 1) + 8 * v16)];
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v14);
  }

  id v18 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *(void *)(*((void *)&v29 + 1) + 8 * v23), (void)v29);
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v21);
  }

  long long v25 = [v10 supportedDataclasses];
  char v26 = [v25 isEqualToSet:v11];

  if ((v26 & 1) == 0) {
    [v10 setSupportedDataclasses:v11];
  }
  long long v27 = objc_msgSend(v10, "syncableDataclasses", (void)v29);
  char v28 = [v27 isEqualToSet:v18];

  if ((v28 & 1) == 0) {
    [v10 setSyncableDataclasses:v18];
  }
}

- (void)_ensureMajorDataclassesExist
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = *MEMORY[0x263EFB460];
  v17[0] = *MEMORY[0x263EFB438];
  v17[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFB3E0];
  v17[2] = *MEMORY[0x263EFB3F0];
  v17[3] = v4;
  uint64_t v5 = *MEMORY[0x263EFB3F8];
  v17[4] = *MEMORY[0x263EFB478];
  v17[5] = v5;
  v17[6] = *MEMORY[0x263EFB3C0];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v17, 7, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v12 = [(ACDDatabaseInitializer *)self _dataclassWithName:v11];

        if (!v12) {
          [(ACDDatabaseInitializer *)self _addDataclassWithName:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_ensureProperAccountTypeDataclasses
{
  v62[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFAEC0];
  uint64_t v5 = *MEMORY[0x263EFB3E0];
  v62[0] = *MEMORY[0x263EFB3F0];
  uint64_t v4 = v62[0];
  v62[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v3 supportsDataclasses:v6 syncsDataclasses:0];

  uint64_t v7 = *MEMORY[0x263EFAFB0];
  uint64_t v61 = v5;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
  uint64_t v60 = v5;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v7 supportsDataclasses:v8 syncsDataclasses:v9];

  uint64_t v10 = *MEMORY[0x263EFAE80];
  uint64_t v11 = *MEMORY[0x263EFB478];
  v59[0] = v5;
  v59[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
  v58[0] = v5;
  v58[1] = v11;
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v10 supportsDataclasses:v12 syncsDataclasses:v13];

  uint64_t v14 = *MEMORY[0x263EFAE90];
  uint64_t v15 = *MEMORY[0x263EFB3F8];
  v57[0] = v4;
  v57[1] = v15;
  long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
  v56[0] = v4;
  v56[1] = v15;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v14 supportsDataclasses:v16 syncsDataclasses:v17];

  uint64_t v18 = *MEMORY[0x263EFAE78];
  uint64_t v55 = *MEMORY[0x263EFB3C0];
  uint64_t v19 = v55;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
  uint64_t v54 = v19;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v18 supportsDataclasses:v20 syncsDataclasses:v21];

  uint64_t v22 = *MEMORY[0x263EFAEB0];
  uint64_t v24 = *MEMORY[0x263EFB460];
  v53[0] = *MEMORY[0x263EFB438];
  uint64_t v23 = v53[0];
  v53[1] = v24;
  v53[2] = v4;
  v53[3] = v5;
  v53[4] = v11;
  v53[5] = v15;
  long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:6];
  v52[0] = v23;
  v52[1] = v24;
  v52[2] = v4;
  v52[3] = v5;
  v52[4] = v11;
  v52[5] = v15;
  char v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:6];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v22 supportsDataclasses:v25 syncsDataclasses:v26];

  uint64_t v27 = *MEMORY[0x263EFAEF8];
  v51[0] = v23;
  v51[1] = v4;
  v51[2] = v5;
  v51[3] = v11;
  v51[4] = v15;
  char v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:5];
  v50[0] = v23;
  v50[1] = v4;
  v50[2] = v5;
  v50[3] = v11;
  v50[4] = v15;
  long long v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:5];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v27 supportsDataclasses:v28 syncsDataclasses:v29];

  uint64_t v30 = *MEMORY[0x263EFAF40];
  uint64_t v49 = v15;
  long long v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  uint64_t v48 = v15;
  long long v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v30 supportsDataclasses:v31 syncsDataclasses:v32];

  uint64_t v33 = *MEMORY[0x263EFAEE8];
  v47[0] = v23;
  v47[1] = v24;
  v47[2] = v4;
  v47[3] = v5;
  long long v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
  uint64_t v46 = v23;
  long long v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v33 supportsDataclasses:v34 syncsDataclasses:v35];

  uint64_t v36 = *MEMORY[0x263EFAFE0];
  v45[0] = v23;
  v45[1] = v24;
  v45[2] = v4;
  v45[3] = v5;
  v45[4] = v11;
  uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:5];
  uint64_t v44 = v23;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v36 supportsDataclasses:v37 syncsDataclasses:v38];

  uint64_t v39 = *MEMORY[0x263EFAF18];
  uint64_t v43 = v24;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  uint64_t v42 = v24;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v39 supportsDataclasses:v40 syncsDataclasses:v41];
}

- (void)_addPasswordCredentialTypeToSMTPAccountType
{
}

- (void)_addPasswordCredentialTypeToGmailAccountType
{
}

- (void)_addTokenCredentialTypeToYahooAccountType
{
}

- (id)_modernIMAPSupportedDataclasses
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFB460];
  v5[0] = *MEMORY[0x263EFB438];
  v5[1] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];

  return v3;
}

- (id)_modernIMAPSyncableDataclasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263EFB438];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)_addIMAPAccountType
{
  uint64_t v3 = [(ACDDatabaseInitializer *)self _modernIMAPSupportedDataclasses];
  id v8 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v3];

  uint64_t v4 = [(ACDDatabaseInitializer *)self _modernIMAPSyncableDataclasses];
  uint64_t v5 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v4];

  LOWORD(v7) = 257;
  id v6 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x263EFAF08], @"IMAP", 0, v8, v5, *MEMORY[0x263EFB048], v7);
}

- (id)_modernPOPSupportedAndSyncableDataclasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263EFB438];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)_addPOPAccountType
{
  uint64_t v3 = [(ACDDatabaseInitializer *)self _modernPOPSupportedAndSyncableDataclasses];
  id v8 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v3];

  uint64_t v4 = [(ACDDatabaseInitializer *)self _modernPOPSupportedAndSyncableDataclasses];
  uint64_t v5 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v4];

  LOWORD(v7) = 257;
  id v6 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x263EFAF78], @"POP", 0, v8, v5, *MEMORY[0x263EFB048], v7);
}

- (id)_modernIMAPMailSupportedAndSyncableDataclasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263EFB438];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)_addIMAPMailAccountType
{
  uint64_t v3 = [(ACDDatabaseInitializer *)self _modernIMAPMailSupportedAndSyncableDataclasses];
  id v8 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v3];

  uint64_t v4 = [(ACDDatabaseInitializer *)self _modernIMAPMailSupportedAndSyncableDataclasses];
  uint64_t v5 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v4];

  LOWORD(v7) = 257;
  id v6 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x263EFAF10], @"IMAPMail", 0, v8, v5, *MEMORY[0x263EFB048], v7);
}

- (void)_addIdentityServicesAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF20] displayName:@"Messages" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:1 supportsMultipleAccounts:v3];
}

- (void)_limitLinkedInToOneAccount
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:@"com.apple.linkedin"];
  [v2 setSupportsMultipleAccounts:MEMORY[0x263EFFA80]];
}

- (void)_updateTencentWeiboCredentialTypeToOAuth2
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFB8]];
  [v2 setCredentialType:*MEMORY[0x263EFB040]];
}

- (id)_modernDeviceLocatiorSupportedDataclasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263EFB410];
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)_addFindMyiPhoneAccountType
{
  uint64_t v3 = *MEMORY[0x263EFAEA8];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEA8]];
  if (!v4)
  {
    uint64_t v5 = [(ACDDatabaseInitializer *)self _modernDeviceLocatiorSupportedDataclasses];
    id v6 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v5];

    LOWORD(v8) = 0;
    id v7 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:", v3, @"Device Locator", 0, v6, 0, *MEMORY[0x263EFB050], v8, *MEMORY[0x263F16EB0]);

    uint64_t v4 = 0;
  }
}

- (void)_addTencentWeiboAccessKeys
{
}

- (void)_addAccessKeysAttributeToTencentWeiboAccountType
{
  id v6 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFB8]];
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB1E8]];
  uint64_t v5 = [v3 setWithObject:v4];
  [v6 setAccessKeys:v5];
}

- (void)_updateIdentityServicesAccountTypeToSupportAuthenticationAndMultipleAccounts
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFAF20];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAF20]];
  uint64_t v5 = MEMORY[0x263EFFA88];
  [v4 setSupportsAuthentication:MEMORY[0x263EFFA88]];
  uint64_t v15 = v4;
  [v4 setSupportsMultipleAccounts:v5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(ACDDatabaseInitializer *)self _accounts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 accountType];
        long long v13 = [v12 identifier];
        if ([v13 isEqual:v3])
        {
          uint64_t v14 = [NSNumber numberWithBool:1];
          [v11 setSupportsAuthentication:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)_updateIdentityServicesAccountDescription
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAF20]];
  [v2 setAccountTypeDescription:@"Messages"];
}

- (void)_updateOSXServerAccountDescription
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAF68]];
  [v2 setAccountTypeDescription:@"OS X Server"];
}

- (void)_updateMacOSServerAccountDescription
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAF68]];
  [v2 setAccountTypeDescription:@"macOS Server"];
}

- (void)_makeTencentWeiboSingleton
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFB8]];
  [v2 setSupportsMultipleAccounts:MEMORY[0x263EFFA80]];
}

- (id)_modernHolidayCalendarSupportedAndSyncableDataclasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263EFB3E0];
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)_addHolidayCalendarAccountType
{
  uint64_t v3 = [(ACDDatabaseInitializer *)self _modernHolidayCalendarSupportedAndSyncableDataclasses];
  id v6 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v3];

  LOWORD(v5) = 0;
  id v4 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:", *MEMORY[0x263EFAEF0], @"Holiday Calendar", 0, v6, v6, *MEMORY[0x263EFB048], v5, *MEMORY[0x263F16EB0]);
}

- (void)_addFMFAccountType
{
  id v5 = [MEMORY[0x263EFFA08] set];
  LOBYTE(v4) = 0;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAED0] displayName:@"Find My Friends" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:0 supportsMultipleAccounts:v4];
}

- (void)_addAppleIDAuthenticationAccountType
{
  id v5 = [MEMORY[0x263EFFA08] set];
  LOBYTE(v4) = 0;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE68] displayName:@"Apple ID" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB030] supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_setOwningBundleIDForNativeAccountTypes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(ACDDatabaseInitializer *)self _accountTypes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = [v7 owningBundleID];

        if (!v8) {
          [v7 setOwningBundleID:@"com.apple.accountsd"];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_createLiverpoolDataclasses
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE58]];
  uint64_t v4 = [v3 supportedDataclasses];
  uint64_t v5 = (void *)[v4 mutableCopy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [&unk_26C998A18 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(&unk_26C998A18);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = [(ACDDatabaseInitializer *)self _dataclassWithName:v10];

        if (!v11) {
          [(ACDDatabaseInitializer *)self _addDataclassWithName:v10];
        }
        long long v12 = [(ACDDatabaseInitializer *)self _dataclassWithName:v10];
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v7 = [&unk_26C998A18 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  [v3 setSupportedDataclasses:v5];
}

- (void)_addCloudKitAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 0;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAEA0] displayName:@"CloudKit" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addAccessKeysAttributeToCloudKitAccountType
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB0D0]];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  id v5 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEA0]];
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  [v5 setAccessKeys:v6];
}

- (void)_removeLiverpoolTypes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:@"com.apple.account.Liverpool"];
  if (v3) {
    [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v3];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [&unk_26C998A30 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(&unk_26C998A30);
        }
        uint64_t v8 = [(ACDDatabaseInitializer *)self _dataclassWithName:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        if (v8) {
          [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_26C998A30 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_addCloudKitDataclasses
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = *MEMORY[0x263EFB3D0];
  v22[0] = *MEMORY[0x263EFB3C8];
  v22[1] = v4;
  v22[2] = *MEMORY[0x263EFB3D8];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v22, 3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v11 = [(ACDDatabaseInitializer *)self _dataclassWithName:v10];

        if (!v11) {
          [(ACDDatabaseInitializer *)self _addDataclassWithName:v10];
        }
        long long v12 = [(ACDDatabaseInitializer *)self _dataclassWithName:v10];
        if (v12) {
          [v3 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v7);
  }

  long long v13 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE58]];
  uint64_t v14 = [v13 supportedDataclasses];
  long long v15 = (void *)[v14 mutableCopy];

  long long v16 = [v3 allObjects];
  [v15 addObjectsFromArray:v16];

  [v13 setSupportedDataclasses:v15];
  long long v17 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEA0]];
  [v17 setSupportedDataclasses:v3];
  [v17 setSyncableDataclasses:v3];
}

- (void)_setCloudKitCredentialType
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEA0]];
  [v2 setCredentialType:*MEMORY[0x263EFB050]];
}

- (void)_add126AccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE38] displayName:@"126" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_add163AccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE40] displayName:@"163" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addAOLAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE50] displayName:@"Aol" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addQQAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF88] displayName:@"QQ" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addJabberAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF28] displayName:@"Jabber" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addYahooIMAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFE8] displayName:@"Yahoo IM" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addAIMAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAE48] displayName:@"AIM" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addOSXServerAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF68] displayName:@"OSX Server" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addAndConfigureAllOSXAccountTypes
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Adding OS X account types...\"", v2, v3, v4, v5, v6);
}

- (void)_switchGoogleToOAuthAuthentication
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEE8]];
  [v2 setCredentialType:*MEMORY[0x263EFB040]];
}

- (void)_switchHotmailToOAuthAuthentication
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEF8]];
  [v2 setCredentialType:*MEMORY[0x263EFB040]];
}

- (void)_switchYahooToPasswordAuthentication
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFE0]];
  [v2 setCredentialType:*MEMORY[0x263EFB048]];
}

- (void)_addDocumentsAndVPNDataclass
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFB450];
  [(ACDDatabaseInitializer *)self _addDataclassWithName:*MEMORY[0x263EFB450]];
  uint64_t v4 = *MEMORY[0x263EFB480];
  [(ACDDatabaseInitializer *)self _addDataclassWithName:*MEMORY[0x263EFB480]];
  uint64_t v12 = *MEMORY[0x263EFAF68];
  uint64_t v6 = *MEMORY[0x263EFB478];
  v14[0] = *MEMORY[0x263EFB3E0];
  uint64_t v5 = v14[0];
  v14[1] = v6;
  uint64_t v8 = *MEMORY[0x263EFB438];
  uint64_t v15 = *MEMORY[0x263EFB460];
  uint64_t v7 = v15;
  uint64_t v16 = v8;
  uint64_t v17 = *MEMORY[0x263EFB3F0];
  uint64_t v9 = v17;
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:7];
  v13[0] = v5;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v8;
  v13[4] = v9;
  v13[5] = v3;
  v13[6] = v4;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];
  [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v12 supportsDataclasses:v10 syncsDataclasses:v11];
}

- (void)_addIDMSAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF00] displayName:@"IDMS" visibility:0 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:0 supportsMultipleAccounts:v3];
}

- (void)_addMSOAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF58] displayName:@"MSO" visibility:1 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:1 supportsMultipleAccounts:v3];
}

- (void)_addSingleSignOnAccountType
{
  LOBYTE(v3) = 1;
  id v2 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAFA8] displayName:@"Single Sign-on" visibility:1 supportedDataclasses:0 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v3];
}

- (void)_updateAOLAndAddNotificationsDataclass
{
}

- (id)_modernOnMyDeviceSupportedDataclasses
{
  v6[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFB3F0];
  v6[0] = *MEMORY[0x263EFB438];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFB3E0];
  v6[2] = *MEMORY[0x263EFB460];
  v6[3] = v3;
  v6[4] = *MEMORY[0x263EFB478];
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];

  return v4;
}

- (void)_addOnMyDeviceAccountType
{
  uint64_t v3 = *MEMORY[0x263EFAF70];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAF70]];

  if (!v4)
  {
    id v8 = [(ACDDatabaseInitializer *)self _modernOnMyDeviceSupportedDataclasses];
    uint64_t v5 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v8];
    LOBYTE(v7) = 0;
    id v6 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:v3 displayName:@"On My Device" visibility:0 supportedDataclasses:v5 credentialType:0 supportsAuthentication:0 supportsMultipleAccounts:v7];
  }
}

- (void)_switchYahooToOAuthAuthentication
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFE0]];
  [v2 setCredentialType:*MEMORY[0x263EFB040]];
}

- (void)_configureSMTPAccountType
{
  id v6 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAF98]];
  [v6 setSupportsAuthentication:MEMORY[0x263EFFA88]];
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB438]];
  uint64_t v5 = [v3 setWithObject:v4];
  [v6 setSupportedDataclasses:v5];
}

- (void)_allowMultipleAppleIDAuthenticationAccounts
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE68]];
  [v2 setSupportsMultipleAccounts:MEMORY[0x263EFFA88]];
}

- (void)_makeTudouYoukuSingletons
{
  id v5 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFC0]];
  uint64_t v3 = MEMORY[0x263EFFA80];
  [v5 setSupportsMultipleAccounts:MEMORY[0x263EFFA80]];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFF8]];
  [v4 setSupportsMultipleAccounts:v3];
}

- (void)_supportiCloudNewsDataclass
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Missing kAccountDataclassNews!\"", v2, v3, v4, v5, v6);
}

- (void)_ensurePresenceOfNewsDataclass
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"kAccountDataclassNews is already present.\"", v2, v3, v4, v5, v6);
}

- (void)_supportiCloudKeychainSyncDataclass
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Unable to get kAccountDataclassKeychainSync!\"", v2, v3, v4, v5, v6);
}

- (void)_setSupportedDataclassesForAOLAccountType
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Missing kAccountDataclassMail!\"", v2, v3, v4, v5, v6);
}

- (void)_addNotesDataclassToAASupportedDataclasses
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Missing account type with ID: ACAccountTypeIdentifierAppleAccount\"", v2, v3, v4, v5, v6);
}

- (void)_removeMessengerFromYahooSupportedDataclasses
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAFE0]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = objc_msgSend(v2, "supportedDataclasses", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = *MEMORY[0x263EFB448];
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      uint64_t v10 = [v9 name];
      char v11 = [v10 isEqualToString:v7];

      if (v11) {
        break;
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_13;
    }
    long long v13 = [v2 supportedDataclasses];
    uint64_t v14 = (void *)[v13 mutableCopy];

    [v14 removeObject:v12];
    [v2 setSupportedDataclasses:v14];

    uint64_t v3 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)_setYahooAccountsProvisionedDataclassesToSupportedOnes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [(ACDDatabaseInitializer *)self _accounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = *MEMORY[0x263EFAFE0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v8 accountType];
        uint64_t v10 = [v9 identifier];

        if ([v10 isEqual:v6])
        {
          char v11 = [v8 accountType];
          id v12 = [v11 supportedDataclasses];
          [v8 setProvisionedDataclasses:v12];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)_setCloudKitAllowsMultipleAccounts
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEA0]];
  [v2 setSupportsMultipleAccounts:MEMORY[0x263EFFA88]];
}

- (void)_removeMessagesFromGoogleSupportedDataclasses
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFAEE8];
  [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAEE8]];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v29 = v37 = 0u;
  uint64_t v4 = [v29 supportedDataclasses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    uint64_t v8 = *MEMORY[0x263EFB448];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v35 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
      char v11 = [v10 name];
      char v12 = [v11 isEqualToString:v8];

      if (v12) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (!v13)
    {
      id v27 = 0;
      goto LABEL_16;
    }
    long long v14 = _ACLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"Removing Messages from google account type.\"", buf, 2u);
    }

    long long v15 = [v29 supportedDataclasses];
    uint64_t v4 = (void *)[v15 mutableCopy];

    [v4 removeObject:v13];
    [v29 setSupportedDataclasses:v4];
  }
  else
  {
LABEL_9:
    id v13 = 0;
  }
  id v27 = v13;

LABEL_16:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v16 = [(ACDDatabaseInitializer *)self _accounts];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v22 = [v21 accountType];
        uint64_t v23 = [v22 identifier];

        if ([v23 isEqual:v3])
        {
          uint64_t v24 = _ACLogSystem();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = v21;
            _os_log_impl(&dword_2183AD000, v24, OS_LOG_TYPE_DEFAULT, "\"Updating supported dataclass on account %@\"", buf, 0xCu);
          }

          long long v25 = [v21 accountType];
          char v26 = [v25 supportedDataclasses];
          [v21 setProvisionedDataclasses:v26];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v18);
  }
}

- (void)_removeAIMAccounts
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [(ACDDatabaseInitializer *)self _accounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  uint64_t v6 = *MEMORY[0x263EFAE48];
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v5 = 138412290;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v11 = objc_msgSend(v10, "accountType", v16);
        char v12 = [v11 identifier];

        if ([v12 isEqual:v6])
        {
          id v13 = _ACLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v10;
            _os_log_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEFAULT, "\"Removing AIM account %@\"", buf, 0xCu);
          }

          [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v10];
        }
      }
      uint64_t v7 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  long long v14 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:v6];
  if (v14)
  {
    long long v15 = _ACLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v15, OS_LOG_TYPE_DEFAULT, "\"Removing AIM account type\"", buf, 2u);
    }

    [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v14];
  }
}

- (void)_addFacebookAndDAVLegacyAccountTypes
{
  v33[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Adding Facebook legacy account types\"", buf, 2u);
  }

  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263EFB3F0];
  uint64_t v6 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
  uint64_t v7 = *MEMORY[0x263EFB3E0];
  uint64_t v8 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  uint64_t v9 = objc_msgSend(v4, "setWithObjects:", v6, v8, 0);

  uint64_t v10 = *MEMORY[0x263EFAEC8];
  LOBYTE(v29) = 0;
  id v11 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAEC8] displayName:@"Facebook Legacy" visibility:0 supportedDataclasses:v9 credentialType:*MEMORY[0x263EFB040] supportsAuthentication:1 supportsMultipleAccounts:v29];
  char v12 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB080]];
  v33[0] = v12;
  id v13 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB090]];
  v33[1] = v13;
  long long v14 = [(ACDDatabaseInitializer *)self _accessKeyWithName:*MEMORY[0x263EFB088]];
  v33[2] = v14;
  long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];

  long long v16 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:v10];
  long long v17 = [MEMORY[0x263EFFA08] setWithArray:v15];
  [v16 setAccessKeys:v17];

  long long v18 = (void *)MEMORY[0x263EFFA08];
  long long v19 = [(ACDDatabaseInitializer *)self _dataclassWithName:v7];
  long long v20 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB478]];
  long long v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, 0);

  uint64_t v22 = *MEMORY[0x263EFB048];
  LOWORD(v30) = 257;
  id v23 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x263EFAE88], @"CalDAV Legacy", 0, v21, v21, *MEMORY[0x263EFB048], v30);
  uint64_t v24 = (void *)MEMORY[0x263EFFA08];
  long long v25 = [(ACDDatabaseInitializer *)self _dataclassWithName:v5];
  char v26 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F8]];
  id v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, 0);

  LOWORD(v31) = 257;
  id v28 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x263EFAE98], @"CardDAV Legacy", 0, v27, v27, v22, v31);
}

- (void)_changeFacebookAccountToLegacyAccountType
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Changing Facebook account types\"", buf, 2u);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(ACDDatabaseInitializer *)self _accounts];
  uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v41;
    uint64_t v7 = *MEMORY[0x263EFAEC0];
    uint64_t v26 = *MEMORY[0x263EFAEC8];
    uint64_t v8 = *MEMORY[0x263EFAE80];
    uint64_t v35 = *MEMORY[0x263EFAE90];
    uint64_t v33 = *MEMORY[0x263EFAE98];
    uint64_t v34 = *MEMORY[0x263EFAE88];
    uint64_t v27 = *MEMORY[0x263EFAEC0];
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      uint64_t v29 = v5;
      do
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        id v11 = objc_msgSend(v10, "accountType", v26);
        char v12 = [v11 identifier];

        if ([v12 isEqual:v7])
        {
          uint64_t v31 = v12;
          uint64_t v32 = v9;
          id v13 = _ACLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v46 = v10;
            _os_log_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEFAULT, "\"Changing account type of Facebook account %@\"", buf, 0xCu);
          }

          long long v14 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:v26];
          [v10 setAccountType:v14];

          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v15 = [v10 childAccounts];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v37 != v18) {
                  objc_enumerationMutation(v15);
                }
                long long v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                long long v21 = [v20 accountType];
                uint64_t v22 = [v21 identifier];

                if ([v22 isEqualToString:v8])
                {
                  id v23 = _ACLogSystem();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v46 = v20;
                    _os_log_impl(&dword_2183AD000, v23, OS_LOG_TYPE_DEFAULT, "\"Changing account type of Facebook child CalDAV account %@\"", buf, 0xCu);
                  }
                  uint64_t v24 = v34;
                }
                else
                {
                  if (![v22 isEqualToString:v35]) {
                    goto LABEL_25;
                  }
                  id v23 = _ACLogSystem();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v46 = v20;
                    _os_log_impl(&dword_2183AD000, v23, OS_LOG_TYPE_DEFAULT, "\"Changing account type of Facebook child CardDAV account %@\"", buf, 0xCu);
                  }
                  uint64_t v24 = v33;
                }

                long long v25 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:v24];
                [v20 setAccountType:v25];

LABEL_25:
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v17);
          }

          uint64_t v6 = v28;
          uint64_t v5 = v29;
          uint64_t v7 = v27;
          char v12 = v31;
          uint64_t v9 = v32;
        }

        ++v9;
      }
      while (v9 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v5);
  }
}

- (void)_addObsoleteAttributeToAccountTypes
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Adding obsolete attribute to Account Types\"", buf, 2u);
  }

  uint64_t v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFAEC0], *MEMORY[0x263EFAFD0], *MEMORY[0x263EFAFA0], *MEMORY[0x263EFAFB8], @"com.apple.linkedin", *MEMORY[0x263EFAED8], *MEMORY[0x263EFAFD8], *MEMORY[0x263EFAFC0], *MEMORY[0x263EFAFF8], 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(ACDDatabaseInitializer *)self _accountTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 identifier];
        uint64_t v12 = [v4 containsObject:v11];

        if (v12)
        {
          id v13 = _ACLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v20 = v10;
            _os_log_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEFAULT, "\"Marking account type %@ as obsolete\"", buf, 0xCu);
          }
        }
        long long v14 = [NSNumber numberWithBool:v12];
        [v10 setObsolete:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)_removeMessagesFromAOLSupportedDataclasses
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFAE50];
  [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE50]];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v29 = v37 = 0u;
  uint64_t v4 = [v29 supportedDataclasses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    uint64_t v8 = *MEMORY[0x263EFB448];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v35 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
      id v11 = [v10 name];
      char v12 = [v11 isEqualToString:v8];

      if (v12) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (!v13)
    {
      id v27 = 0;
      goto LABEL_16;
    }
    long long v14 = _ACLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"Removing Messages from AOL account type.\"", buf, 2u);
    }

    long long v15 = [v29 supportedDataclasses];
    uint64_t v4 = (void *)[v15 mutableCopy];

    [v4 removeObject:v13];
    [v29 setSupportedDataclasses:v4];
  }
  else
  {
LABEL_9:
    id v13 = 0;
  }
  id v27 = v13;

LABEL_16:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v16 = [(ACDDatabaseInitializer *)self _accounts];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v22 = [v21 accountType];
        id v23 = [v22 identifier];

        if ([v23 isEqual:v3])
        {
          uint64_t v24 = _ACLogSystem();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v39 = v21;
            _os_log_impl(&dword_2183AD000, v24, OS_LOG_TYPE_DEFAULT, "\"Updating supported dataclass on account %@\"", buf, 0xCu);
          }

          long long v25 = [v21 accountType];
          uint64_t v26 = [v25 supportedDataclasses];
          [v21 setProvisionedDataclasses:v26];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v18);
  }
}

- (void)_addiTunesStoreSandboxAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFB008] displayName:@"iTunes Store (Sandbox)" visibility:0 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB048] supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addLinkedInLegacyAccountType
{
  id v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Adding LinkedIn legacy account type\"", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263EFF9C0] set];
  id v5 = (void *)MEMORY[0x263EFAF50];
  if (v4)
  {
    uint64_t v6 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3F0]];
    uint64_t v7 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB468]];
    if (v6) {
      [v4 addObject:v6];
    }
    if (v7) {
      [v4 addObject:v7];
    }
    LOBYTE(v14) = 0;
    id v8 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*v5 displayName:@"LinkedIn Legacy" visibility:0 supportedDataclasses:v4 credentialType:*MEMORY[0x263EFB038] supportsAuthentication:1 supportsMultipleAccounts:v14];
  }
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  if (v9)
  {
    uint64_t v10 = [(ACDDatabaseInitializer *)self _accessKeyWithName:@"ACLinkedInAppIdKey"];
    id v11 = [(ACDDatabaseInitializer *)self _accessKeyWithName:@"ACLinkedInPermissionsKey"];
    if (v10) {
      [v9 addObject:v10];
    }
    if (v11) {
      [v9 addObject:v11];
    }
    char v12 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*v5];
    if (v12)
    {
      id v13 = [MEMORY[0x263EFFA08] setWithArray:v9];
      [v12 setAccessKeys:v13];
    }
  }
}

- (void)_removeBTMMType
{
  uint64_t v3 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3B0]];
  if (v3) {
    [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v3];
  }

  MEMORY[0x270F9A758]();
}

- (void)_switchAolAccountsToOAuth
{
  id v2 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE50]];
  [v2 setCredentialType:*MEMORY[0x263EFB040]];
}

- (void)_aolSupportsAuthentication
{
  uint64_t v3 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:*MEMORY[0x263EFAE50]];
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB438]];
    if (v4)
    {
      [v6 setSupportsAuthentication:MEMORY[0x263EFFA88]];
      id v5 = [MEMORY[0x263EFFA08] setWithObject:v4];
      [v6 setSyncableDataclasses:v5];
    }
    uint64_t v3 = v6;
  }
}

- (void)_removeRedundantDataclasses
{
  uint64_t v173 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v123 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id obj = [(ACDDatabaseInitializer *)self _dataclasses];
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v156 objects:v172 count:16];
  if (!v5) {
    goto LABEL_117;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v157;
  id v111 = v3;
  v112 = self;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v157 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v156 + 1) + 8 * v9);
      id v11 = objc_msgSend(v10, "name", v111);
      char v12 = [v3 objectForKeyedSubscript:v11];

      if (v12)
      {
        id v13 = _ACLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v10 name];
          *(_DWORD *)buf = 138412546;
          v169 = v14;
          __int16 v170 = 2112;
          v171 = v10;
          _os_log_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEFAULT, "\"Removing redundant dataclass of name %@ %@\"", buf, 0x16u);
        }
        long long v15 = _ACLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v169 = v12;
          _os_log_impl(&dword_2183AD000, v15, OS_LOG_TYPE_DEFAULT, "\"Replacing with canonical dataclass %@\"", buf, 0xCu);
        }

        long long v16 = [v10 objectID];
        uint64_t v17 = [v16 URIRepresentation];
        [v4 addObject:v17];

        uint64_t v18 = [v10 provisionedAccounts];
        uint64_t v19 = [v18 count];

        if (v19)
        {
          long long v20 = [v10 provisionedAccounts];
          [v12 addProvisionedAccounts:v20];

          long long v21 = [v10 provisionedAccounts];
          [v123 unionSet:v21];
        }
        uint64_t v22 = [v10 enabledAccounts];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          uint64_t v24 = [v10 enabledAccounts];
          [v12 addEnabledAccounts:v24];

          long long v25 = [v10 enabledAccounts];
          [v123 unionSet:v25];
        }
        uint64_t v26 = [v10 supportedTypes];
        uint64_t v27 = [v26 count];

        if (v27)
        {
          uint64_t v28 = [v10 supportedTypes];
          [v12 addSupportedTypes:v28];

          uint64_t v29 = [v10 supportedTypes];
          [v123 unionSet:v29];
        }
        long long v30 = [v10 syncableTypes];
        uint64_t v31 = [v30 count];

        if (v31)
        {
          long long v32 = [v10 syncableTypes];
          [v12 addSyncableTypes:v32];

          long long v33 = [v10 syncableTypes];
          [v123 unionSet:v33];
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      long long v34 = [v10 name];

      if (v34)
      {
        long long v35 = [v10 name];
        [v3 setObject:v10 forKeyedSubscript:v35];

        goto LABEL_31;
      }
      long long v36 = _ACDLogSystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v169 = v10;
        _os_log_error_impl(&dword_2183AD000, v36, OS_LOG_TYPE_ERROR, "@\"There was no name on the dataclass %@\"", buf, 0xCu);
      }

      long long v37 = [v10 supportedTypes];
      if ([v37 count])
      {

        self = v112;
        goto LABEL_31;
      }
      long long v38 = [v10 syncableTypes];
      if ([v38 count]) {
        goto LABEL_30;
      }
      long long v39 = [v10 enabledAccounts];
      if ([v39 count])
      {

LABEL_30:
        id v3 = v111;
        self = v112;
        goto LABEL_31;
      }
      id v113 = [v10 provisionedAccounts];
      uint64_t v116 = [v113 count];

      id v3 = v111;
      self = v112;
      if (!v116)
      {
        long long v33 = _ACDLogSystem();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v169 = v10;
          _os_log_error_impl(&dword_2183AD000, v33, OS_LOG_TYPE_ERROR, "@\"Dataclass %@ has no types or accounts, deleting\"", buf, 0xCu);
        }
LABEL_19:

LABEL_20:
        [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v10];
        char v7 = 1;
      }
LABEL_31:

      ++v9;
    }
    while (v6 != v9);
    uint64_t v40 = [(NSArray *)obj countByEnumeratingWithState:&v156 objects:v172 count:16];
    uint64_t v6 = v40;
  }
  while (v40);

  if (v7)
  {
    long long v41 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"Dataclass"];
    uint64_t v42 = (NSArray *)[v41 mutableCopy];
    dataclasses = self->_dataclasses;
    self->_dataclasses = v42;

    uint64_t v44 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"Account"];
    v45 = (NSArray *)[v44 mutableCopy];
    accounts = self->_accounts;
    self->_accounts = v45;

    v47 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"AccountType"];
    uint64_t v48 = (NSArray *)[v47 mutableCopy];
    accountTypes = self->_accountTypes;
    self->_accountTypes = v48;

    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id v50 = v123;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v152 objects:v167 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v153;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v153 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void **)(*((void *)&v152 + 1) + 8 * i);
          v56 = _ACLogSystem();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v169 = v55;
            _os_log_impl(&dword_2183AD000, v56, OS_LOG_TYPE_DEFAULT, "\"Redundant dataclass removal affected %@\"", buf, 0xCu);
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v152 objects:v167 count:16];
      }
      while (v52);
    }

    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    v57 = v112->_dataclasses;
    uint64_t v58 = [(NSArray *)v57 countByEnumeratingWithState:&v148 objects:v166 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v149;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v149 != v60) {
            objc_enumerationMutation(v57);
          }
          v62 = *(void **)(*((void *)&v148 + 1) + 8 * j);
          v63 = [v62 objectID];
          v64 = [v63 URIRepresentation];
          int v65 = [v4 containsObject:v64];

          if (v65)
          {
            v66 = _ACLogSystem();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v169 = v62;
              _os_log_error_impl(&dword_2183AD000, v66, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still exists! %@\"", buf, 0xCu);
            }
          }
        }
        uint64_t v59 = [(NSArray *)v57 countByEnumeratingWithState:&v148 objects:v166 count:16];
      }
      while (v59);
    }

    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    v114 = v112->_accounts;
    uint64_t v119 = [(NSArray *)v114 countByEnumeratingWithState:&v144 objects:v165 count:16];
    if (v119)
    {
      uint64_t v117 = *(void *)v145;
      do
      {
        v67 = 0;
        do
        {
          if (*(void *)v145 != v117) {
            objc_enumerationMutation(v114);
          }
          obja = v67;
          v68 = *(void **)(*((void *)&v144 + 1) + 8 * (void)v67);
          long long v140 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          v69 = [v68 provisionedDataclasses];
          uint64_t v70 = [v69 countByEnumeratingWithState:&v140 objects:v164 count:16];
          if (v70)
          {
            uint64_t v71 = v70;
            uint64_t v72 = *(void *)v141;
            do
            {
              for (uint64_t k = 0; k != v71; ++k)
              {
                if (*(void *)v141 != v72) {
                  objc_enumerationMutation(v69);
                }
                v74 = *(void **)(*((void *)&v140 + 1) + 8 * k);
                v75 = [v74 objectID];
                v76 = [v75 URIRepresentation];
                int v77 = [v4 containsObject:v76];

                if (v77)
                {
                  v78 = _ACLogSystem();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v169 = v74;
                    __int16 v170 = 2112;
                    v171 = v68;
                    _os_log_error_impl(&dword_2183AD000, v78, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still among account.provisionedDataclasses! %@ %@\"", buf, 0x16u);
                  }
                }
              }
              uint64_t v71 = [v69 countByEnumeratingWithState:&v140 objects:v164 count:16];
            }
            while (v71);
          }

          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          v79 = [v68 enabledDataclasses];
          uint64_t v80 = [v79 countByEnumeratingWithState:&v136 objects:v163 count:16];
          if (v80)
          {
            uint64_t v81 = v80;
            uint64_t v82 = *(void *)v137;
            do
            {
              for (uint64_t m = 0; m != v81; ++m)
              {
                if (*(void *)v137 != v82) {
                  objc_enumerationMutation(v79);
                }
                v84 = *(void **)(*((void *)&v136 + 1) + 8 * m);
                v85 = [v84 objectID];
                v86 = [v85 URIRepresentation];
                int v87 = [v4 containsObject:v86];

                if (v87)
                {
                  v88 = _ACLogSystem();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v169 = v84;
                    __int16 v170 = 2112;
                    v171 = v68;
                    _os_log_error_impl(&dword_2183AD000, v88, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still among account.enabledDataclasses! %@ %@\"", buf, 0x16u);
                  }
                }
              }
              uint64_t v81 = [v79 countByEnumeratingWithState:&v136 objects:v163 count:16];
            }
            while (v81);
          }

          v67 = obja + 1;
        }
        while (obja + 1 != (char *)v119);
        uint64_t v119 = [(NSArray *)v114 countByEnumeratingWithState:&v144 objects:v165 count:16];
      }
      while (v119);
    }

    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id obj = v112->_accountTypes;
    uint64_t v118 = [(NSArray *)obj countByEnumeratingWithState:&v132 objects:v162 count:16];
    if (v118)
    {
      id v115 = *(id *)v133;
      do
      {
        uint64_t v89 = 0;
        do
        {
          if (*(id *)v133 != v115) {
            objc_enumerationMutation(obj);
          }
          uint64_t v120 = v89;
          v90 = *(void **)(*((void *)&v132 + 1) + 8 * v89);
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          v91 = [v90 supportedDataclasses];
          uint64_t v92 = [v91 countByEnumeratingWithState:&v128 objects:v161 count:16];
          if (v92)
          {
            uint64_t v93 = v92;
            uint64_t v94 = *(void *)v129;
            do
            {
              for (uint64_t n = 0; n != v93; ++n)
              {
                if (*(void *)v129 != v94) {
                  objc_enumerationMutation(v91);
                }
                v96 = *(void **)(*((void *)&v128 + 1) + 8 * n);
                v97 = [v96 objectID];
                v98 = [v97 URIRepresentation];
                int v99 = [v4 containsObject:v98];

                if (v99)
                {
                  v100 = _ACLogSystem();
                  if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v169 = v96;
                    __int16 v170 = 2112;
                    v171 = v90;
                    _os_log_error_impl(&dword_2183AD000, v100, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still among accountType.supportedDataclasses! %@ %@\"", buf, 0x16u);
                  }
                }
              }
              uint64_t v93 = [v91 countByEnumeratingWithState:&v128 objects:v161 count:16];
            }
            while (v93);
          }

          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          v101 = [v90 syncableDataclasses];
          uint64_t v102 = [v101 countByEnumeratingWithState:&v124 objects:v160 count:16];
          if (v102)
          {
            uint64_t v103 = v102;
            uint64_t v104 = *(void *)v125;
            do
            {
              for (iuint64_t i = 0; ii != v103; ++ii)
              {
                if (*(void *)v125 != v104) {
                  objc_enumerationMutation(v101);
                }
                v106 = *(void **)(*((void *)&v124 + 1) + 8 * ii);
                v107 = [v106 objectID];
                v108 = [v107 URIRepresentation];
                int v109 = [v4 containsObject:v108];

                if (v109)
                {
                  v110 = _ACLogSystem();
                  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v169 = v106;
                    __int16 v170 = 2112;
                    v171 = v90;
                    _os_log_error_impl(&dword_2183AD000, v110, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still among accountType.syncableDataclasses! %@ %@\"", buf, 0x16u);
                  }
                }
              }
              uint64_t v103 = [v101 countByEnumeratingWithState:&v124 objects:v160 count:16];
            }
            while (v103);
          }

          uint64_t v89 = v120 + 1;
        }
        while (v120 + 1 != v118);
        uint64_t v118 = [(NSArray *)obj countByEnumeratingWithState:&v132 objects:v162 count:16];
      }
      while (v118);
    }
    id v3 = v111;
LABEL_117:
  }
}

- (void)_addRemoteManagementAccountType
{
  id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  LOBYTE(v4) = 1;
  id v3 = [(ACDDatabaseInitializer *)self _addAccountTypeWithIdentifier:*MEMORY[0x263EFAF90] displayName:@"Remote Management" visibility:1 supportedDataclasses:v5 credentialType:*MEMORY[0x263EFB050] supportsAuthentication:1 supportsMultipleAccounts:v4];
}

- (void)_addPublishedCalendarAccountType
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(ACDDatabaseInitializer *)self _dataclassWithName:*MEMORY[0x263EFB3E0]];
  id v7 = [v3 setWithObject:v4];

  LOWORD(v6) = 257;
  id v5 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x263EFAF80], @"Published Calendar", 0, v7, v7, *MEMORY[0x263EFB048], v6);
}

- (void)_removeRedundantAccountTypes
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v69 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v68 = self;
  id v5 = [(ACDDatabaseInitializer *)self _accountTypes];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v82 objects:v93 count:16];
  if (!v6)
  {
LABEL_53:

    goto LABEL_54;
  }
  uint64_t v7 = v6;
  char v8 = 0;
  uint64_t v9 = *(void *)v83;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v83 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      char v12 = [v11 identifier];
      id v13 = [v3 objectForKeyedSubscript:v12];

      if (v13)
      {
        uint64_t v14 = _ACLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          long long v15 = [v11 identifier];
          *(_DWORD *)buf = 138412546;
          v90 = v15;
          __int16 v91 = 2112;
          uint64_t v92 = v11;
          _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"Removing redundant account type of name %@ %@\"", buf, 0x16u);
        }
        long long v16 = _ACLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v90 = v13;
          _os_log_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEFAULT, "\"Replacing with canonical account type %@\"", buf, 0xCu);
        }

        uint64_t v17 = [v11 objectID];
        uint64_t v18 = [v17 URIRepresentation];
        [v69 addObject:v18];

        uint64_t v19 = [v11 accounts];

        if (v19)
        {
          long long v20 = [v11 accounts];
          [v13 addAccounts:v20];

          long long v21 = [v11 accounts];
          [v4 unionSet:v21];
        }
        uint64_t v22 = [v11 permission];

        if (v22)
        {
          uint64_t v23 = [v11 permission];
          [v13 addPermission:v23];

          uint64_t v24 = [v11 permission];
          [v4 unionSet:v24];
        }
        long long v25 = [v11 accessKeys];

        if (v25)
        {
          uint64_t v26 = [v11 accessKeys];
          [v13 addAccessKeys:v26];

          uint64_t v27 = [v11 accessKeys];
          [v4 unionSet:v27];
        }
        [(ACDDatabaseConnection *)v68->_databaseConnection deleteObject:v11];
        char v8 = 1;
      }
      else
      {
        uint64_t v28 = [v11 identifier];
        [v3 setObject:v11 forKeyedSubscript:v28];
      }
    }
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v82 objects:v93 count:16];
  }
  while (v7);

  if (v8)
  {
    uint64_t v29 = [(ACDDatabaseConnection *)v68->_databaseConnection fetchObjectsForEntityNamed:@"Dataclass"];
    uint64_t v30 = [v29 mutableCopy];
    dataclasses = v68->_dataclasses;
    v68->_dataclasses = (NSArray *)v30;

    long long v32 = [(ACDDatabaseConnection *)v68->_databaseConnection fetchObjectsForEntityNamed:@"Account"];
    uint64_t v33 = [v32 mutableCopy];
    accounts = v68->_accounts;
    v68->_accounts = (NSArray *)v33;

    long long v35 = [(ACDDatabaseConnection *)v68->_databaseConnection fetchObjectsForEntityNamed:@"AccountType"];
    uint64_t v36 = [v35 mutableCopy];
    accountTypes = v68->_accountTypes;
    v68->_accountTypes = (NSArray *)v36;

    long long v38 = [(ACDDatabaseConnection *)v68->_databaseConnection fetchObjectsForEntityNamed:@"AccessOptionsKey"];
    uint64_t v39 = [v38 mutableCopy];
    accessKeys = v68->_accessKeys;
    v68->_accessKeys = (NSArray *)v39;

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v41 = v4;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v78 objects:v88 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v79 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          v47 = _ACLogSystem();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v46;
            _os_log_impl(&dword_2183AD000, v47, OS_LOG_TYPE_DEFAULT, "\"Redundant account type removal affected %@\"", buf, 0xCu);
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v78 objects:v88 count:16];
      }
      while (v43);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v68->_accounts;
    uint64_t v48 = [(NSArray *)obj countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (*(void *)v75 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v52 = *(void **)(*((void *)&v74 + 1) + 8 * k);
          uint64_t v53 = [v52 accountType];
          uint64_t v54 = [v53 objectID];
          uint64_t v55 = [v54 URIRepresentation];
          int v56 = [v69 containsObject:v55];

          if (v56)
          {
            v57 = _ACLogSystem();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              uint64_t v58 = [v52 accountType];
              *(_DWORD *)buf = 138412546;
              v90 = v58;
              __int16 v91 = 2112;
              uint64_t v92 = v52;
              _os_log_error_impl(&dword_2183AD000, v57, OS_LOG_TYPE_ERROR, "\"Ostensibly removed account type still set for account.accountType! %@ %@\"", buf, 0x16u);
            }
          }
        }
        uint64_t v49 = [(NSArray *)obj countByEnumeratingWithState:&v74 objects:v87 count:16];
      }
      while (v49);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v5 = v68->_accessKeys;
    uint64_t v59 = [(NSArray *)v5 countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v71;
      do
      {
        for (uint64_t m = 0; m != v60; ++m)
        {
          if (*(void *)v71 != v61) {
            objc_enumerationMutation(v5);
          }
          v63 = *(void **)(*((void *)&v70 + 1) + 8 * m);
          v64 = [v63 owningAccountTypes];
          uint64_t v65 = [v64 count];

          if (!v65)
          {
            v66 = _ACLogSystem();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v63;
              _os_log_error_impl(&dword_2183AD000, v66, OS_LOG_TYPE_ERROR, "\"Unowned access key! %@\"", buf, 0xCu);
            }
          }
        }
        uint64_t v60 = [(NSArray *)v5 countByEnumeratingWithState:&v70 objects:v86 count:16];
      }
      while (v60);
    }
    goto LABEL_53;
  }
LABEL_54:
}

- (id)_managedDataclassesSetForNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_ensureAllInternalAccountTypesExist:(BOOL)a3
{
  BOOL v31 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v29 = [MEMORY[0x263EFF980] array];
  id v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseInitializer _ensureAllInternalAccountTypesExist:]();
  }

  id v5 = +[ACDDatabasePersistentConfiguration accountTypes];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [v5 allKeys];
  uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v39)
  {
    uint64_t v6 = *(void *)v41;
    uint64_t v27 = *(void *)v41;
    uint64_t v28 = v5;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v9 = [v5 objectForKeyedSubscript:v8];
        uint64_t v10 = [(ACDDatabaseInitializer *)self _accountTypeWithIdentifier:v8];

        if (v10)
        {
          if (!v31) {
            goto LABEL_13;
          }
          id v11 = [v9 objectForKeyedSubscript:@"ACDAccountTypeSupportedDataclasses"];
          char v12 = [v9 objectForKeyedSubscript:@"ACDAccountTypeSyncableDataclasses"];
          [(ACDDatabaseInitializer *)self _ensureAccountTypeWithIdentifier:v8 supportsDataclasses:v11 syncsDataclasses:v12];
        }
        else
        {
          [v29 addObject:v8];
          uint64_t v36 = [v9 objectForKeyedSubscript:@"ACDAccountTypeDisplayName"];
          long long v37 = [v9 objectForKeyedSubscript:@"ACDAccountTypeVisibility"];
          unsigned int v34 = [v37 unsignedIntValue];
          long long v38 = [v9 objectForKeyedSubscript:@"ACDAccountTypeSupportedDataclasses"];
          long long v13 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v38];
          long long v35 = [v9 objectForKeyedSubscript:@"ACDAccountTypeSyncableDataclasses"];
          uint64_t v33 = [(ACDDatabaseInitializer *)self _managedDataclassesSetForNames:v35];
          long long v32 = [v9 objectForKeyedSubscript:@"ACDAccountTypeCredentialType"];
          long long v14 = [v9 objectForKeyedSubscript:@"ACDAccountTypeSupportsAuthentication"];
          long long v15 = self;
          char v16 = [v14 BOOLValue];
          uint64_t v17 = [v9 objectForKeyedSubscript:@"ACDAccountTypeSupportsMultipleAccounts"];
          char v18 = [v17 BOOLValue];
          uint64_t v19 = [v9 objectForKeyedSubscript:@"ACDAccountTypeCredentialProtectionPolicy"];
          BYTE1(v26) = v18;
          LOBYTE(v26) = v16;
          self = v15;
          id v11 = (void *)v36;
          id v20 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:", v8, v36, v34, v13, v33, v32, v26, v19);

          char v12 = v37;
          uint64_t v6 = v27;

          id v5 = v28;
        }

LABEL_13:
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v39);
  }

  uint64_t v21 = [v29 count];
  if (v21)
  {
    uint64_t v22 = [NSString stringWithFormat:@"Missing account types: %@", v29];
    uint64_t v23 = _ACDLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseInitializer _ensureAllInternalAccountTypesExist:]();
    }

    uint64_t v24 = +[ACDEventLedger sharedLedger];
    [v24 simulateCrashWithMessage:v22];
  }
  return v21 != 0;
}

- (BOOL)_ensureAllDataclassesExist
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = _ACDLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ACDDatabaseInitializer _ensureAllDataclassesExist]();
  }

  id v4 = +[ACDDatabasePersistentConfiguration dataclasses];
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = [(ACDDatabaseInitializer *)self _dataclasses];
  uint64_t v7 = [v6 valueForKeyPath:@"name"];
  uint64_t v8 = [v5 setWithArray:v7];

  uint64_t v9 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (([v8 containsObject:v15] & 1) == 0)
        {
          [(ACDDatabaseInitializer *)self _addDataclassWithName:v15];
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [v9 count];
  if (v16)
  {
    uint64_t v17 = [NSString stringWithFormat:@"Missing dataclasses: %@", v9];
    char v18 = _ACDLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseInitializer _ensureAllInternalAccountTypesExist:]();
    }

    uint64_t v19 = +[ACDEventLedger sharedLedger];
    [v19 simulateCrashWithMessage:v17];
  }
  return v16 != 0;
}

- (void)_addWarmingUpAttributeToAccounts
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(ACDDatabaseInitializer *)self _accounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = [NSNumber numberWithBool:0];
        [v7 setWarmingUp:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKeys, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_accountTypes, 0);
  objc_storeStrong((id *)&self->_dataclasses, 0);

  objc_storeStrong((id *)&self->_databaseConnection, 0);
}

void __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_6();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_2183AD000, a3, OS_LOG_TYPE_ERROR, "\"Database initialization failed. Stuck at version %@. Error: %@\"", v6, 0x16u);
}

void __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412546;
  uint64_t v4 = &unk_26C998958;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Failed to update current version %@. Error: %@\"", (uint8_t *)&v3, 0x16u);
}

void __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Opened a database with a newer configuration than this version of the framework supports, here there be krakens.\"", v2, v3, v4, v5, v6);
}

- (void)_addCredentialType:toAccountType:supportsAuthentication:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2183AD000, v1, OS_LOG_TYPE_ERROR, "\"Could not find account type %@ to set credential type %@\"", v2, 0x16u);
}

- (void)_addDataclassWithName:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Attempt to insert duplicate dataclass name %@\"", v2, v3, v4, v5, v6);
}

- (void)_addAccessKeyWithName:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Attempt to insert duplicate access key name %@\"", v2, v3, v4, v5, v6);
}

- (void)_ensureAllInternalAccountTypesExist:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"%@\"", v2, v3, v4, v5, v6);
}

- (void)_ensureAllInternalAccountTypesExist:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Ensuring all internal account types exist...\"", v2, v3, v4, v5, v6);
}

- (void)_ensureAllDataclassesExist
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Ensuring all dataclasses exist...\"", v2, v3, v4, v5, v6);
}

@end