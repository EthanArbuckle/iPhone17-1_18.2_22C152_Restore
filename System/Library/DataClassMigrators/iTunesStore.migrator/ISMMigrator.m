@interface ISMMigrator
+ (BOOL)_copyAccountPropertiesIfNeededFromAccount:(id)a3 toAccount:(id)a4;
+ (id)_firstActiveAccountInAccounts:(id)a3;
+ (id)_logConfig;
+ (void)_cleanupBrokenAccounts:(BOOL)a3 emptyAccounts:(BOOL)a4;
+ (void)_cleanupDuplicateAccounts;
+ (void)_cleanupMultipleActiveAccountsWithPreferredActiveAccount:(id)a3;
+ (void)_mergeDuplicateAccounts:(id)a3 inStore:(id)a4;
+ (void)_repairAccounts;
+ (void)_repairAccountsWithStringDSID;
+ (void)_repairBrokenAccounts;
- (BOOL)_isMajorVersionUpdate;
- (BOOL)_migrateAccountsToAccountsFramework;
- (BOOL)performMigration;
- (id)dataClassName;
- (void)_cleanupAutomaticDownloadKindsOfActiveAccount:(id)a3;
- (void)_cleanupFollowUps;
- (void)_encryptAccountFlags;
- (void)_migrateAutomaticDownloadKindsDefaultToActiveAccount:(id)a3 store:(id)a4;
- (void)_migrateSandboxAccounts;
- (void)_migrateServerPromptDefaultsToActiveAccount:(id)a3 store:(id)a4;
- (void)_postPushToken;
- (void)_removePasswordEquivalentTokensFromAccounts;
@end

@implementation ISMMigrator

- (id)dataClassName
{
  return @"iTunes Store";
}

- (BOOL)performMigration
{
  v3 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (v7)
  {
    id v8 = (id)objc_opt_class();
    unsigned int v9 = [(ISMMigrator *)self didMigrateBackupFromDifferentDevice];
    unsigned int v10 = [(ISMMigrator *)self didRestoreFromBackup];
    unsigned int v11 = [(ISMMigrator *)self didRestoreFromCloudBackup];
    unsigned int v12 = [(ISMMigrator *)self didUpgrade];
    *(_DWORD *)buf = 138544386;
    uint64_t v191 = (uint64_t)v8;
    __int16 v192 = 1024;
    *(_DWORD *)v193 = v9;
    *(_WORD *)&v193[4] = 1024;
    *(_DWORD *)&v193[6] = v10;
    LOWORD(v194) = 1024;
    *(_DWORD *)((char *)&v194 + 2) = v11;
    HIWORD(v194) = 1024;
    unsigned int v195 = v12;
    LODWORD(v181) = 36;
    v170 = buf;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_13;
    }
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, buf, v181);
    free(v13);
    v170 = (uint8_t *)v6;
    SSFileLog();
  }

LABEL_13:
  CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
  CFStringRef v14 = (const __CFString *)kITunesStoreDaemonDefaultsID;
  CFPreferencesAppSynchronize(kITunesStoreDaemonDefaultsID);
  if (![(ISMMigrator *)self didUpgrade])
  {
    v69 = [(id)objc_opt_class() _logConfig];
    if (!v69)
    {
      v69 = +[SSLogConfig sharedConfig];
    }
    unsigned int v70 = objc_msgSend(v69, "shouldLog", v170);
    if ([v69 shouldLogToDisk]) {
      v70 |= 2u;
    }
    v71 = [v69 OSLogObject];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
      int v72 = v70;
    }
    else {
      int v72 = v70 & 2;
    }
    if (v72)
    {
      id v73 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v191 = (uint64_t)v73;
      LODWORD(v181) = 12;
      v175 = buf;
      v74 = (void *)_os_log_send_and_compose_impl();

      if (!v74) {
        goto LABEL_105;
      }
      v71 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v74, 4, buf, v181);
      free(v74);
      v175 = (uint8_t *)v71;
      SSFileLog();
    }

LABEL_105:
    CFPreferencesSetAppValue(@"AMSDeviceBiometricsState", &off_10AA8, @"com.apple.AppleMediaServices");
    CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
    v75 = [(id)objc_opt_class() _logConfig];
    if (!v75)
    {
      v75 = +[SSLogConfig sharedConfig];
    }
    unsigned int v76 = objc_msgSend(v75, "shouldLog", v175);
    if ([v75 shouldLogToDisk]) {
      v76 |= 2u;
    }
    v77 = [v75 OSLogObject];
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT)) {
      int v78 = v76;
    }
    else {
      int v78 = v76 & 2;
    }
    if (v78)
    {
      id v79 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v191 = (uint64_t)v79;
      LODWORD(v181) = 12;
      v176 = buf;
      v80 = (void *)_os_log_send_and_compose_impl();

      if (!v80) {
        goto LABEL_116;
      }
      v77 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v80, 4, buf, v181);
      free(v80);
      v176 = (uint8_t *)v77;
      SSFileLog();
    }

LABEL_116:
    CFPreferencesSetAppValue(@"BiometricState", &off_10AC0, v14);
    v81 = [(id)objc_opt_class() _logConfig];
    if (!v81)
    {
      v81 = +[SSLogConfig sharedConfig];
    }
    unsigned int v82 = objc_msgSend(v81, "shouldLog", v176);
    if ([v81 shouldLogToDisk]) {
      v82 |= 2u;
    }
    v83 = [v81 OSLogObject];
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT)) {
      int v84 = v82;
    }
    else {
      int v84 = v82 & 2;
    }
    if (v84)
    {
      id v85 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v191 = (uint64_t)v85;
      LODWORD(v181) = 12;
      v174 = buf;
      v86 = (void *)_os_log_send_and_compose_impl();

      if (!v86)
      {
LABEL_127:

        CFStringRef v87 = @"BiometricStateEnabled";
        v88 = &off_10AC0;
LABEL_128:
        CFPreferencesSetAppValue(v87, v88, v14);
        CFStringRef v68 = v14;
        goto LABEL_129;
      }
      v83 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v86, 4, buf, v181);
      free(v86);
      v174 = (uint8_t *)v83;
      SSFileLog();
    }

    goto LABEL_127;
  }
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"AMSDeviceBiometricsState", @"com.apple.AppleMediaServices", 0);
  v16 = [(id)objc_opt_class() _logConfig];
  if (!v16)
  {
    v16 = +[SSLogConfig sharedConfig];
  }
  unsigned int v17 = objc_msgSend(v16, "shouldLog", v170);
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  v19 = [v16 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    int v20 = v18;
  }
  else {
    int v20 = v18 & 2;
  }
  if (v20)
  {
    id v21 = (id)objc_opt_class();
    v22 = +[NSNumber numberWithLong:AppIntegerValue];
    *(_DWORD *)buf = 138543618;
    uint64_t v191 = (uint64_t)v21;
    __int16 v192 = 2112;
    *(void *)v193 = v22;
    LODWORD(v181) = 22;
    v171 = buf;
    v23 = (void *)_os_log_send_and_compose_impl();

    if (!v23) {
      goto LABEL_26;
    }
    v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, buf, v181);
    free(v23);
    v171 = (uint8_t *)v19;
    SSFileLog();
  }

LABEL_26:
  CFIndex v24 = CFPreferencesGetAppIntegerValue(@"BiometricState", v14, 0);
  v25 = [(id)objc_opt_class() _logConfig];
  if (!v25)
  {
    v25 = +[SSLogConfig sharedConfig];
  }
  unsigned int v26 = objc_msgSend(v25, "shouldLog", v171);
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  v28 = [v25 OSLogObject];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
    int v29 = v27;
  }
  else {
    int v29 = v27 & 2;
  }
  if (v29)
  {
    id v30 = (id)objc_opt_class();
    v31 = +[NSNumber numberWithLong:v24];
    *(_DWORD *)buf = 138543618;
    uint64_t v191 = (uint64_t)v30;
    __int16 v192 = 2112;
    *(void *)v193 = v31;
    LODWORD(v181) = 22;
    v172 = buf;
    v32 = (void *)_os_log_send_and_compose_impl();

    if (!v32) {
      goto LABEL_38;
    }
    v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, buf, v181);
    free(v32);
    v172 = (uint8_t *)v28;
    SSFileLog();
  }

LABEL_38:
  CFIndex v33 = CFPreferencesGetAppIntegerValue(@"BiometricStateDidMigrate", v14, 0);
  v34 = [(id)objc_opt_class() _logConfig];
  if (!v34)
  {
    v34 = +[SSLogConfig sharedConfig];
  }
  unsigned int v35 = objc_msgSend(v34, "shouldLog", v172);
  if ([v34 shouldLogToDisk]) {
    int v36 = v35 | 2;
  }
  else {
    int v36 = v35;
  }
  v37 = [v34 OSLogObject];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
    int v38 = v36;
  }
  else {
    int v38 = v36 & 2;
  }
  if (v38)
  {
    id v39 = (id)objc_opt_class();
    v40 = +[NSNumber numberWithBool:v33 != 0];
    *(_DWORD *)buf = 138543618;
    uint64_t v191 = (uint64_t)v39;
    __int16 v192 = 2112;
    *(void *)v193 = v40;
    LODWORD(v181) = 22;
    v173 = buf;
    v41 = (void *)_os_log_send_and_compose_impl();

    if (!v41) {
      goto LABEL_50;
    }
    v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, buf, v181);
    free(v41);
    v173 = (uint8_t *)v37;
    SSFileLog();
  }

LABEL_50:
  BOOL v42 = [(ISMMigrator *)self _isMajorVersionUpdate];
  v43 = [(id)objc_opt_class() _logConfig];
  if (!v43)
  {
    v43 = +[SSLogConfig sharedConfig];
  }
  unsigned int v44 = objc_msgSend(v43, "shouldLog", v173);
  if ([v43 shouldLogToDisk]) {
    v44 |= 2u;
  }
  v45 = [v43 OSLogObject];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
    int v46 = v44;
  }
  else {
    int v46 = v44 & 2;
  }
  if (v46)
  {
    id v47 = (id)objc_opt_class();
    +[NSNumber numberWithBool:v42];
    v182 = self;
    CFStringRef v48 = v14;
    BOOL v49 = v42;
    BOOL v42 = v33;
    CFIndex v50 = v24;
    v52 = CFIndex v51 = AppIntegerValue;
    *(_DWORD *)buf = 138543618;
    uint64_t v191 = (uint64_t)v47;
    __int16 v192 = 2114;
    *(void *)v193 = v52;
    LODWORD(v181) = 22;
    v174 = buf;
    v53 = (void *)_os_log_send_and_compose_impl();

    CFIndex AppIntegerValue = v51;
    CFIndex v24 = v50;
    CFIndex v33 = v42;
    LODWORD(v42) = v49;
    CFStringRef v14 = v48;
    self = v182;

    if (!v53) {
      goto LABEL_61;
    }
    v45 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, buf, v181);
    free(v53);
    v174 = (uint8_t *)v45;
    SSFileLog();
  }

LABEL_61:
  if (v24 == 1 && v42)
  {
    v55 = [(id)objc_opt_class() _logConfig];
    if (!v55)
    {
      v55 = +[SSLogConfig sharedConfig];
    }
    unsigned int v56 = objc_msgSend(v55, "shouldLog", v174);
    if ([v55 shouldLogToDisk]) {
      v56 |= 2u;
    }
    v57 = [v55 OSLogObject];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
      int v58 = v56;
    }
    else {
      int v58 = v56 & 2;
    }
    if (v58)
    {
      id v59 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v191 = (uint64_t)v59;
      LODWORD(v181) = 12;
      v174 = buf;
      v60 = (void *)_os_log_send_and_compose_impl();

      if (!v60)
      {
LABEL_76:

        CFPreferencesSetAppValue(@"BiometricState", 0, v14);
        goto LABEL_77;
      }
      v57 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, buf, v181);
      free(v60);
      v174 = (uint8_t *)v57;
      SSFileLog();
    }

    goto LABEL_76;
  }
LABEL_77:
  if (v33) {
    BOOL v61 = v42;
  }
  else {
    BOOL v61 = 0;
  }
  if (v61 && AppIntegerValue == 2)
  {
    v62 = [(id)objc_opt_class() _logConfig];
    if (!v62)
    {
      v62 = +[SSLogConfig sharedConfig];
    }
    unsigned int v63 = objc_msgSend(v62, "shouldLog", v174);
    if ([v62 shouldLogToDisk]) {
      v63 |= 2u;
    }
    v64 = [v62 OSLogObject];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT)) {
      int v65 = v63;
    }
    else {
      int v65 = v63 & 2;
    }
    if (v65)
    {
      id v66 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v191 = (uint64_t)v66;
      LODWORD(v181) = 12;
      v174 = buf;
      v67 = (void *)_os_log_send_and_compose_impl();

      if (!v67)
      {
LABEL_93:

        CFPreferencesSetAppValue(@"AMSDeviceBiometricsState", 0, @"com.apple.AppleMediaServices");
        CFStringRef v68 = @"com.apple.AppleMediaServices";
LABEL_129:
        CFPreferencesAppSynchronize(v68);
        goto LABEL_130;
      }
      v64 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v67, 4, buf, v181);
      free(v67);
      v174 = (uint8_t *)v64;
      SSFileLog();
    }

    goto LABEL_93;
  }
  if (!(AppIntegerValue | v33))
  {
    if (v24 == 2)
    {
      uint64_t v93 = 1;
      goto LABEL_251;
    }
    if (!v42 && v24 == 1)
    {
      uint64_t v93 = 2;
LABEL_251:
      uint64_t v183 = v93;
      v162 = [(id)objc_opt_class() _logConfig];
      if (!v162)
      {
        v162 = +[SSLogConfig sharedConfig];
      }
      unsigned int v163 = objc_msgSend(v162, "shouldLog", v174);
      if ([v162 shouldLogToDisk]) {
        v163 |= 2u;
      }
      v164 = [v162 OSLogObject];
      if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT)) {
        int v165 = v163;
      }
      else {
        int v165 = v163 & 2;
      }
      if (v165)
      {
        id v166 = (id)objc_opt_class();
        v167 = +[NSNumber numberWithLong:v24];
        v168 = +[NSNumber numberWithLong:v183];
        *(_DWORD *)buf = 138543874;
        uint64_t v191 = (uint64_t)v166;
        __int16 v192 = 2114;
        *(void *)v193 = v167;
        *(_WORD *)&v193[8] = 2114;
        id v194 = v168;
        LODWORD(v181) = 32;
        v174 = buf;
        v169 = (void *)_os_log_send_and_compose_impl();

        if (!v169)
        {
LABEL_262:

          CFPreferencesSetAppValue(@"AMSDeviceBiometricsState", +[NSNumber numberWithLong:v183], @"com.apple.AppleMediaServices");
          CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
          CFStringRef v87 = @"BiometricStateDidMigrate";
          v88 = &off_10A90;
          goto LABEL_128;
        }
        v164 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v169, 4, buf, v181);
        free(v169);
        v174 = (uint8_t *)v164;
        SSFileLog();
      }

      goto LABEL_262;
    }
  }
LABEL_130:
  if ([(ISMMigrator *)self didRestoreFromBackup])
  {
    CFPreferencesSetAppValue(@"DidShowHardRestoreFailureDialog", 0, v14);
    CFPreferencesSetAppValue(@"RestoreAccountIDs", 0, v14);
    CFPreferencesSetAppValue(@"RestoreFailRetryCount", 0, v14);
    CFPreferencesSetAppValue(@"RestoreItemKinds", 0, v14);
    CFPreferencesSetAppValue(@"RestoreSoftFailRetryCount", 0, v14);
    CFPreferencesSetAppValue(@"RestoreStoreFrontIDs", 0, v14);
    CFPreferencesSetAppValue(@"RestoreSuppressTermsAndConditions", 0, v14);
  }
  if ([(ISMMigrator *)self didUpgrade])
  {
    +[ISFileProtectionClassMigrator setMigrationNeededIfNotSet:1];
  }
  else
  {
    id v89 = [(ISMMigrator *)self didRestoreFromBackup];
    +[ISFileProtectionClassMigrator setMigrationNeededIfNotSet:v89];
    if (!v89)
    {
      char v92 = 1;
      goto LABEL_142;
    }
  }
  CFPreferencesSetAppValue(@"UnsignedBags", 0, v14);
  CFPreferencesAppSynchronize(v14);
  CFStringRef v90 = (const __CFString *)kSSUserDefaultsIdentifier;
  v91 = (void *)CFPreferencesCopyAppValue(@"InitiateSessionURL", kSSUserDefaultsIdentifier);
  if ([v91 isEqualToString:@"https://init.itunes.apple.com/bag.xml?ix=6&custombag=true"])CFPreferencesSetAppValue(@"InitiateSessionURL", 0, v90); {
  CFPreferencesAppSynchronize(v90);
  }

  char v92 = 0;
LABEL_142:
  CFPreferencesAppSynchronize(@"com.apple.mobileipod");
  if (!CFPreferencesGetAppBooleanValue(@"HasMigratedMusicAllowsCellularData", @"com.apple.mobileipod", 0))
  {
    CFPreferencesSetAppValue(@"HasMigratedMusicAllowsCellularData", &__kCFBooleanTrue, @"com.apple.mobileipod");
    v94 = +[NSNumber numberWithUnsignedChar:CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", kSSUserDefaultsIdentifier, 0)];
    CFPreferencesSetAppValue(@"MusicAllowsCellularData", v94, @"com.apple.mobileipod");
    CFPreferencesAppSynchronize(@"com.apple.mobileipod");
  }
  int ShouldUseAppstored = SSDebugShouldUseAppstored();
  if ([(ISMMigrator *)self didUpgrade]) {
    uint64_t v96 = 3;
  }
  else {
    uint64_t v96 = 1;
  }
  if ([(ISMMigrator *)self didRestoreFromCloudBackup]) {
    v96 |= 4uLL;
  }
  if ([(ISMMigrator *)self didMigrateBackupFromDifferentDevice]) {
    v96 |= 8uLL;
  }
  uint64_t v97 = [(id)objc_opt_class() _logConfig];
  v98 = (void *)v97;
  if (ShouldUseAppstored)
  {
    if (!v97)
    {
      v98 = +[SSLogConfig sharedConfig];
    }
    unsigned int v99 = [v98 shouldLog];
    if ([v98 shouldLogToDisk]) {
      v99 |= 2u;
    }
    v100 = [v98 OSLogObject];
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT)) {
      int v101 = v99;
    }
    else {
      int v101 = v99 & 2;
    }
    if (v101)
    {
      id v102 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v191 = (uint64_t)v102;
      LODWORD(v181) = 12;
      v177 = buf;
      v103 = (void *)_os_log_send_and_compose_impl();

      if (!v103)
      {
LABEL_163:

        id v104 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithMigrationType:v96];
        id v105 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v104];
        v189[0] = _NSConcreteStackBlock;
        v189[1] = 3221225472;
        v189[2] = sub_5A00;
        v189[3] = &unk_10330;
        v189[4] = self;
        [v105 startWithCompletionBlock:v189];

        goto LABEL_176;
      }
      v100 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v103, 4, buf, v181);
      free(v103);
      v177 = (uint8_t *)v100;
      SSFileLog();
    }

    goto LABEL_163;
  }
  if (!v97)
  {
    v98 = +[SSLogConfig sharedConfig];
  }
  unsigned int v106 = [v98 shouldLog];
  if ([v98 shouldLogToDisk]) {
    v106 |= 2u;
  }
  v107 = [v98 OSLogObject];
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT)) {
    int v108 = v106;
  }
  else {
    int v108 = v106 & 2;
  }
  if (!v108) {
    goto LABEL_174;
  }
  id v109 = (id)objc_opt_class();
  *(_DWORD *)buf = 138543362;
  uint64_t v191 = (uint64_t)v109;
  LODWORD(v181) = 12;
  v177 = buf;
  v110 = (void *)_os_log_send_and_compose_impl();

  if (v110)
  {
    v107 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v110, 4, buf, v181);
    free(v110);
    v177 = (uint8_t *)v107;
    SSFileLog();
LABEL_174:
  }
  id v104 = objc_alloc_init((Class)SSMigrator);
  v188[0] = _NSConcreteStackBlock;
  v188[1] = 3221225472;
  v188[2] = sub_5B9C;
  v188[3] = &unk_10358;
  v188[4] = self;
  [v104 performMigration:v96 completionBlock:v188];
LABEL_176:

  if (v92) {
    goto LABEL_214;
  }
  v111 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v111)
  {
    v111 = +[SSLogConfig sharedConfig];
  }
  unsigned int v112 = objc_msgSend(v111, "shouldLog", v177);
  if ([v111 shouldLogToDisk]) {
    v112 |= 2u;
  }
  v113 = [v111 OSLogObject];
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT)) {
    int v114 = v112;
  }
  else {
    int v114 = v112 & 2;
  }
  if (v114)
  {
    id v115 = (id)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v191 = (uint64_t)v115;
    LODWORD(v181) = 12;
    v178 = buf;
    v116 = (void *)_os_log_send_and_compose_impl();

    if (!v116) {
      goto LABEL_188;
    }
    v113 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v116, 4, buf, v181);
    free(v116);
    v178 = (uint8_t *)v113;
    SSFileLog();
  }

LABEL_188:
  [(id)objc_opt_class() _repairAccounts];
  unsigned int v117 = [(ISMMigrator *)self _migrateAccountsToAccountsFramework];
  uint64_t v118 = +[SSLogConfig sharedAccountsMigrationConfig];
  v119 = (void *)v118;
  if (!v117)
  {
    if (!v118)
    {
      v119 = +[SSLogConfig sharedConfig];
    }
    unsigned int v125 = objc_msgSend(v119, "shouldLog", v178);
    if ([v119 shouldLogToDisk]) {
      v125 |= 2u;
    }
    v126 = [v119 OSLogObject];
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT)) {
      int v127 = v125;
    }
    else {
      int v127 = v125 & 2;
    }
    if (v127)
    {
      id v128 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v191 = (uint64_t)v128;
      LODWORD(v181) = 12;
      v179 = buf;
      v129 = (void *)_os_log_send_and_compose_impl();

      if (!v129)
      {
LABEL_212:

        goto LABEL_213;
      }
      v126 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v129, 4, buf, v181);
      free(v129);
      v179 = (uint8_t *)v126;
      SSFileLog();
    }

    goto LABEL_212;
  }
  if (!v118)
  {
    v119 = +[SSLogConfig sharedConfig];
  }
  unsigned int v120 = objc_msgSend(v119, "shouldLog", v178);
  if ([v119 shouldLogToDisk]) {
    v120 |= 2u;
  }
  v121 = [v119 OSLogObject];
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT)) {
    int v122 = v120;
  }
  else {
    int v122 = v120 & 2;
  }
  if (!v122) {
    goto LABEL_199;
  }
  id v123 = (id)objc_opt_class();
  *(_DWORD *)buf = 138543362;
  uint64_t v191 = (uint64_t)v123;
  LODWORD(v181) = 12;
  v179 = buf;
  v124 = (void *)_os_log_send_and_compose_impl();

  if (v124)
  {
    v121 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v124, 4, buf, v181);
    free(v124);
    v179 = (uint8_t *)v121;
    SSFileLog();
LABEL_199:
  }
  [(id)objc_opt_class() _repairAccounts];
LABEL_213:
  [(ISMMigrator *)self _migrateSandboxAccounts];
LABEL_214:
  v130 = [(id)objc_opt_class() _logConfig];
  if (!v130)
  {
    v130 = +[SSLogConfig sharedConfig];
  }
  unsigned int v131 = objc_msgSend(v130, "shouldLog", v177);
  if ([v130 shouldLogToDisk]) {
    v131 |= 2u;
  }
  v132 = [v130 OSLogObject];
  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT)) {
    int v133 = v131;
  }
  else {
    int v133 = v131 & 2;
  }
  if (v133)
  {
    id v134 = (id)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v191 = (uint64_t)v134;
    LODWORD(v181) = 12;
    v180 = buf;
    v135 = (void *)_os_log_send_and_compose_impl();

    if (!v135) {
      goto LABEL_225;
    }
    v132 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v135, 4, buf, v181);
    free(v135);
    v180 = (uint8_t *)v132;
    SSFileLog();
  }

LABEL_225:
  +[SSFeatureEnablerMigrator migrate];
  if ((v92 & 1) == 0)
  {
    v136 = +[SSAccountStore defaultStore];
    v137 = [v136 activeAccount];
    [(ISMMigrator *)self _migrateAutomaticDownloadKindsDefaultToActiveAccount:v137 store:v136];
    [(ISMMigrator *)self _migrateServerPromptDefaultsToActiveAccount:v137 store:v136];
    [(ISMMigrator *)self _cleanupAutomaticDownloadKindsOfActiveAccount:v137];
    [(ISMMigrator *)self _encryptAccountFlags];

    [(ISMMigrator *)self _postPushToken];
    [(ISMMigrator *)self _cleanupFollowUps];
  }
  if ([(ISMMigrator *)self didUpgrade])
  {
    if (+[AMSDefaults migratedDeviceOffers])
    {
      v138 = +[AMSLogConfig sharedDataMigrationConfig];
      if (!v138)
      {
        v138 = +[AMSLogConfig sharedConfig];
      }
      v139 = [v138 OSLogObject];
      if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
      {
        uint64_t v140 = objc_opt_class();
        AMSLogKey();
        id v141 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v142 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        uint64_t v191 = v140;
        __int16 v192 = 2114;
        *(void *)v193 = v141;
        *(_WORD *)&v193[8] = 2114;
        id v194 = v142;
        _os_log_impl(&dword_0, v139, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. We already migrated.", buf, 0x20u);
      }
    }
    else
    {
      v143 = +[ACAccountStore ams_sharedAccountStore];
      v138 = objc_msgSend(v143, "ams_activeiTunesAccount");

      if (v138)
      {
        v144 = +[NSDate date];
        v145 = +[AMSLogConfig sharedDataMigrationConfig];
        if (!v145)
        {
          v145 = +[AMSLogConfig sharedConfig];
        }
        v146 = [v145 OSLogObject];
        if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
        {
          uint64_t v147 = objc_opt_class();
          AMSLogKey();
          id v148 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v149 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          uint64_t v191 = v147;
          __int16 v192 = 2114;
          *(void *)v193 = v148;
          *(_WORD *)&v193[8] = 2114;
          id v194 = v149;
          _os_log_impl(&dword_0, v146, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ started.", buf, 0x20u);
        }
        v150 = +[AMSDeviceOfferRegistrationTask bagKeySet];
        v151 = +[AMSDeviceOfferRegistrationTask bagSubProfile];
        v152 = +[AMSDeviceOfferRegistrationTask bagSubProfileVersion];
        +[AMSBagKeySet registerBagKeySet:v150 forProfile:v151 profileVersion:v152];

        v153 = +[AMSDeviceOfferRegistrationTask bagSubProfile];
        v154 = +[AMSDeviceOfferRegistrationTask bagSubProfileVersion];
        v155 = +[AMSBag bagForProfile:v153 profileVersion:v154];

        id v156 = [objc_alloc((Class)AMSDeviceOfferRegistrationTask) initWithAccount:v138 bag:v155];
        [v156 setLightweightCheckOnly:1];
        v157 = [v156 perform];
        v185[0] = _NSConcreteStackBlock;
        v185[1] = 3221225472;
        v185[2] = sub_5D20;
        v185[3] = &unk_10380;
        v185[4] = self;
        SEL v187 = a2;
        v139 = v144;
        v186 = v139;
        [v157 addFinishBlock:v185];
      }
      else
      {
        v139 = +[AMSLogConfig sharedDataMigrationConfig];
        if (!v139)
        {
          v139 = +[AMSLogConfig sharedConfig];
        }
        v155 = [v139 OSLogObject];
        if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
        {
          uint64_t v158 = objc_opt_class();
          AMSLogKey();
          id v159 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v160 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          uint64_t v191 = v158;
          __int16 v192 = 2114;
          *(void *)v193 = v159;
          *(_WORD *)&v193[8] = 2114;
          id v194 = v160;
          _os_log_impl(&dword_0, v155, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. No account is signed in during upgrade.", buf, 0x20u);
        }
      }
    }
  }
  if (+[ISFileProtectionClassMigrator isMigrationNeeded](ISFileProtectionClassMigrator, "isMigrationNeeded"))+[ISFileProtectionClassMigrator migrate]; {
  return 1;
  }
}

+ (id)_logConfig
{
  if (qword_14540 != -1) {
    dispatch_once(&qword_14540, &stru_103C0);
  }
  v2 = (void *)qword_14538;

  return v2;
}

- (void)_cleanupFollowUps
{
  v2 = [(id)objc_opt_class() _logConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    int v27 = 138543362;
    id v28 = (id)objc_opt_class();
    id v6 = v28;
    LODWORD(v21) = 12;
    int v20 = &v27;
    int v7 = (void *)_os_log_send_and_compose_impl();

    if (!v7) {
      goto LABEL_12;
    }
    int v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v27, v21);
    free(v7);
    int v20 = (int *)v5;
    SSFileLog();
  }

LABEL_12:
  id v8 = objc_alloc_init((Class)AMSFollowUp);
  unsigned int v9 = [v8 pendingFollowUps];
  unsigned int v10 = [v9 resultWithError:0];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unsigned int v17 = objc_msgSend(v16, "identifier", v20);
        unsigned int v18 = [v17 hasSuffix:@"(null)"];

        if (v18) {
          id v19 = [v8 clearFollowUpItem:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
}

- (void)_cleanupAutomaticDownloadKindsOfActiveAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ISMMigrator *)self didMigrateBackupFromDifferentDevice];
  uint64_t v6 = [(id)objc_opt_class() _logConfig];
  int v7 = (void *)v6;
  if (!v5)
  {
    if (!v6)
    {
      int v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v7 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      LODWORD(v48) = 138543362;
      *(void *)((char *)&v48 + 4) = objc_opt_class();
      id v17 = *(id *)((char *)&v48 + 4);
      LODWORD(v47) = 12;
      int v46 = &v48;
      unsigned int v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18) {
        goto LABEL_25;
      }
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v48, v47, v48);
      free(v18);
      int v46 = v16;
      SSFileLog();
    }

LABEL_25:
    if (!v4)
    {
      id v13 = +[SSLogConfig sharedAccountsMigrationConfig];
      if (!v13)
      {
        id v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v29 = objc_msgSend(v13, "shouldLog", v46);
      if ([v13 shouldLogToDisk]) {
        int v30 = v29 | 2;
      }
      else {
        int v30 = v29;
      }
      long long v25 = [v13 OSLogObject];
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        v30 &= 2u;
      }
      if (v30)
      {
        v31 = objc_opt_class();
        LODWORD(v48) = 138543362;
        *(void *)((char *)&v48 + 4) = v31;
        id v32 = v31;
        LODWORD(v47) = 12;
        CFIndex v33 = (void *)_os_log_send_and_compose_impl();

        if (!v33) {
          goto LABEL_72;
        }
        long long v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v48, v47);
        free(v33);
        SSFileLog();
      }
      goto LABEL_71;
    }
    id v19 = [v4 accountPropertyForKey:SSAccountPropertyAutomaticDownloadKinds];
    id v20 = [v19 copy];
    objc_opt_class();
    id v13 = SSSafeCast();

    unsigned int v21 = [v13 containsObject:SSDownloadKindEBook];
    uint64_t v22 = SSDownloadKindAudiobook;
    if (!v21 || ([v13 containsObject:SSDownloadKindAudiobook] & 1) != 0)
    {
      unsigned int v23 = objc_msgSend(v13, "containsObject:", v22, v46);
      uint64_t v24 = [(id)objc_opt_class() _logConfig];
      long long v25 = v24;
      if (v23)
      {
        if (!v24)
        {
          long long v25 = +[SSLogConfig sharedConfig];
        }
        unsigned int v26 = [v25 shouldLog];
        if ([v25 shouldLogToDisk]) {
          int v27 = v26 | 2;
        }
        else {
          int v27 = v26;
        }
        id v28 = [v25 OSLogObject];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          v27 &= 2u;
        }
        if (!v27) {
          goto LABEL_70;
        }
      }
      else
      {
        if (!v24)
        {
          long long v25 = +[SSLogConfig sharedConfig];
        }
        unsigned int v34 = [v25 shouldLog];
        if ([v25 shouldLogToDisk]) {
          int v35 = v34 | 2;
        }
        else {
          int v35 = v34;
        }
        id v28 = [v25 OSLogObject];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          v35 &= 2u;
        }
        if (!v35) {
          goto LABEL_70;
        }
      }
      int v36 = objc_opt_class();
      LODWORD(v48) = 138543362;
      *(void *)((char *)&v48 + 4) = v36;
      id v37 = v36;
      LODWORD(v47) = 12;
      int v38 = (void *)_os_log_send_and_compose_impl();

      if (v38)
      {
        id v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v48, v47);
        free(v38);
        SSFileLog();
LABEL_70:
      }
LABEL_71:

      goto LABEL_72;
    }
    id v39 = [(id)objc_opt_class() _logConfig];
    if (!v39)
    {
      id v39 = +[SSLogConfig sharedConfig];
    }
    unsigned int v40 = objc_msgSend(v39, "shouldLog", v46);
    if ([v39 shouldLogToDisk]) {
      int v41 = v40 | 2;
    }
    else {
      int v41 = v40;
    }
    BOOL v42 = [v39 OSLogObject];
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      v41 &= 2u;
    }
    if (v41)
    {
      v43 = objc_opt_class();
      LODWORD(v48) = 138543362;
      *(void *)((char *)&v48 + 4) = v43;
      id v44 = v43;
      LODWORD(v47) = 12;
      v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45)
      {
LABEL_69:

        long long v25 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v22, 0);
        id v28 = +[SSDevice currentDevice];
        [v28 unionAutomaticDownloadKinds:v25 withCompletionBlock:0];
        goto LABEL_70;
      }
      BOOL v42 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v48, v47);
      free(v45);
      SSFileLog();
    }

    goto LABEL_69;
  }
  if (!v6)
  {
    int v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  unsigned int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_12;
  }
  LODWORD(v48) = 138543362;
  *(void *)((char *)&v48 + 4) = objc_opt_class();
  id v11 = *(id *)((char *)&v48 + 4);
  LODWORD(v47) = 12;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    unsigned int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v48, v47, v48);
    free(v12);
    SSFileLog();
LABEL_12:
  }
  id v13 = +[SSDevice currentDevice];
  [v13 setAutomaticDownloadKinds:0 withCompletionBlock:0];
LABEL_72:
}

- (void)_encryptAccountFlags
{
  v2 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  unsigned int v5 = [v2 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    int v6 = v4;
  }
  else {
    int v6 = v4 & 2;
  }
  if (v6)
  {
    int v62 = 138543362;
    id v63 = (id)objc_opt_class();
    id v7 = v63;
    LODWORD(v53) = 12;
    CFIndex v51 = &v62;
    unsigned int v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8) {
      goto LABEL_13;
    }
    unsigned int v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v62, v53);
    free(v8);
    CFIndex v51 = (int *)v5;
    SSFileLog();
  }

LABEL_13:
  v54 = +[ACAccountStore ams_sharedAccountStore];
  int v9 = objc_msgSend(v54, "ams_iTunesAccounts");
  if ([v9 count])
  {
    unsigned int v10 = objc_msgSend(v9, "ams_mapWithTransform:", &stru_10400);
    id v11 = [(id)objc_opt_class() _logConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    unsigned int v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (!v13) {
      goto LABEL_24;
    }
    int v15 = objc_opt_class();
    int v62 = 138543618;
    id v63 = v15;
    __int16 v64 = 2114;
    int v65 = v10;
    id v16 = v15;
    LODWORD(v53) = 22;
    v52 = &v62;
    id v17 = (void *)_os_log_send_and_compose_impl();

    if (v17)
    {
      unsigned int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v62, v53);
      free(v17);
      v52 = (int *)v14;
      SSFileLog();
LABEL_24:
    }
  }
  else
  {
    unsigned int v10 = [(id)objc_opt_class() _logConfig];
    if (!v10)
    {
      unsigned int v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = objc_msgSend(v10, "shouldLog", v51);
    if ([v10 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      id v20 = objc_opt_class();
      int v62 = 138543362;
      id v63 = v20;
      id v21 = v20;
      LODWORD(v53) = 12;
      v52 = &v62;
      uint64_t v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22) {
        goto LABEL_36;
      }
      id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v62, v53);
      free(v22);
      v52 = (int *)v11;
      SSFileLog();
    }
  }

LABEL_36:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v9;
  id v23 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v56 = *(void *)v58;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v58 != v56) {
          objc_enumerationMutation(obj);
        }
        unsigned int v26 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v26, "ams_isLocalAccount", v52, v53))
        {
          int v27 = [(id)objc_opt_class() _logConfig];
          if (!v27)
          {
            int v27 = +[SSLogConfig sharedConfig];
          }
          unsigned int v28 = [v27 shouldLog];
          if ([v27 shouldLogToDisk]) {
            int v29 = v28 | 2;
          }
          else {
            int v29 = v28;
          }
          int v30 = [v27 OSLogObject];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
            int v31 = v29;
          }
          else {
            int v31 = v29 & 2;
          }
          if (!v31) {
            goto LABEL_76;
          }
          id v32 = objc_opt_class();
          id v33 = v32;
          unsigned int v34 = AMSHashIfNeeded();
          int v62 = 138543618;
          id v63 = v32;
          __int16 v64 = 2114;
          int v65 = v34;
          LODWORD(v53) = 22;
          v52 = &v62;
          int v35 = (void *)_os_log_send_and_compose_impl();
        }
        else
        {
          unsigned int v36 = objc_msgSend(v26, "ams_encryptAccountFlags");
          uint64_t v37 = [(id)objc_opt_class() _logConfig];
          int v27 = (void *)v37;
          if (v36)
          {
            if (!v37)
            {
              int v27 = +[SSLogConfig sharedConfig];
            }
            unsigned int v38 = [v27 shouldLog];
            if ([v27 shouldLogToDisk]) {
              v38 |= 2u;
            }
            id v39 = [v27 OSLogObject];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
              int v40 = v38;
            }
            else {
              int v40 = v38 & 2;
            }
            if (v40)
            {
              int v41 = objc_opt_class();
              id v42 = v41;
              v43 = AMSHashIfNeeded();
              int v62 = 138543618;
              id v63 = v41;
              __int16 v64 = 2114;
              int v65 = v43;
              LODWORD(v53) = 22;
              v52 = &v62;
              id v44 = (void *)_os_log_send_and_compose_impl();

              if (v44)
              {
                id v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v44, 4, &v62, v53);
                free(v44);
                v52 = (int *)v39;
                SSFileLog();
                goto LABEL_63;
              }
            }
            else
            {
LABEL_63:
            }
            int v27 = +[ACAccountStore ams_sharedAccountStore];
            id v45 = objc_msgSend(v27, "ams_saveAccount:verifyCredentials:", v26, 0);
            goto LABEL_77;
          }
          if (!v37)
          {
            int v27 = +[SSLogConfig sharedConfig];
          }
          unsigned int v46 = [v27 shouldLog];
          if ([v27 shouldLogToDisk]) {
            v46 |= 2u;
          }
          int v30 = [v27 OSLogObject];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
            int v47 = v46;
          }
          else {
            int v47 = v46 & 2;
          }
          if (!v47) {
            goto LABEL_76;
          }
          long long v48 = objc_opt_class();
          id v49 = v48;
          CFIndex v50 = AMSHashIfNeeded();
          int v62 = 138543618;
          id v63 = v48;
          __int16 v64 = 2114;
          int v65 = v50;
          LODWORD(v53) = 22;
          v52 = &v62;
          int v35 = (void *)_os_log_send_and_compose_impl();
        }
        if (!v35) {
          goto LABEL_77;
        }
        int v30 = +[NSString stringWithCString:v35 encoding:4];
        free(v35);
        v52 = (int *)v30;
        SSFileLog();
LABEL_76:

LABEL_77:
      }
      id v24 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v24);
  }
}

- (BOOL)_isMajorVersionUpdate
{
  id v60 = 0;
  v2 = +[NSRegularExpression regularExpressionWithPattern:@"\\d+" options:0 error:&v60];
  id v3 = v60;
  if (v3)
  {
    int v4 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v4)
    {
      int v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      unsigned int v8 = objc_opt_class();
      int v61 = 138543618;
      int v62 = v8;
      __int16 v63 = 2114;
      id v64 = v3;
      id v9 = v8;
      LODWORD(v54) = 22;
      CFIndex v51 = &v61;
      unsigned int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v61, v54);
      free(v10);
      CFIndex v51 = (int *)v7;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  id v11 = +[NSUserDefaults standardUserDefaults];
  unsigned int v12 = [v11 objectForKey:@"SSDeviceType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [v12 objectForKey:@"buildVersion"];
    unsigned int v14 = v13;
    if (v13)
    {
      int v15 = objc_msgSend(v2, "matchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length"));
      goto LABEL_19;
    }
  }
  else
  {
    unsigned int v14 = 0;
  }
  int v15 = 0;
LABEL_19:
  if ([v15 count])
  {
    id v16 = [v15 objectAtIndexedSubscript:0];
    id v17 = [v16 range];
    long long v59 = objc_msgSend(v14, "substringWithRange:", v17, v18);
  }
  else
  {
    long long v59 = 0;
  }
  long long v57 = v12;
  int v19 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v19)
  {
    int v19 = +[SSLogConfig sharedConfig];
  }
  unsigned int v20 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  uint64_t v22 = [v19 OSLogObject];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
    v21 &= 2u;
  }
  uint64_t v56 = v14;
  if (v21)
  {
    id v23 = objc_opt_class();
    int v61 = 138543874;
    int v62 = v23;
    __int16 v63 = 2114;
    id v64 = v14;
    __int16 v65 = 2114;
    id v66 = v59;
    id v24 = v23;
    LODWORD(v54) = 32;
    v52 = &v61;
    long long v25 = (void *)_os_log_send_and_compose_impl();

    if (!v25) {
      goto LABEL_33;
    }
    uint64_t v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v61, v54);
    free(v25);
    v52 = (int *)v22;
    SSFileLog();
  }

LABEL_33:
  unsigned int v26 = (void *)MGCopyAnswer();
  int v27 = v26;
  if (v26)
  {
    uint64_t v28 = objc_msgSend(v2, "matchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length"));

    int v15 = (void *)v28;
  }
  if (objc_msgSend(v15, "count", v52))
  {
    int v29 = [v15 objectAtIndexedSubscript:0];
    id v30 = [v29 range];
    long long v58 = objc_msgSend(v27, "substringWithRange:", v30, v31);
  }
  else
  {
    long long v58 = 0;
  }
  id v32 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v32)
  {
    id v32 = +[SSLogConfig sharedConfig];
  }
  v55 = v15;
  unsigned int v33 = [v32 shouldLog];
  if ([v32 shouldLogToDisk]) {
    int v34 = v33 | 2;
  }
  else {
    int v34 = v33;
  }
  int v35 = [v32 OSLogObject];
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
    v34 &= 2u;
  }
  if (!v34) {
    goto LABEL_48;
  }
  unsigned int v36 = objc_opt_class();
  int v61 = 138543874;
  int v62 = v36;
  __int16 v63 = 2114;
  id v64 = v27;
  __int16 v65 = 2114;
  id v66 = v58;
  id v37 = v36;
  LODWORD(v54) = 32;
  uint64_t v53 = &v61;
  unsigned int v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    int v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v61, v54);
    free(v38);
    uint64_t v53 = (int *)v35;
    SSFileLog();
LABEL_48:
  }
  uint64_t v39 = 0;
  if (v59 && v58) {
    uint64_t v39 = [v59 isEqualToString:v58] ^ 1;
  }
  int v40 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v40)
  {
    int v40 = +[SSLogConfig sharedConfig];
  }
  unsigned int v41 = [v40 shouldLog];
  if ([v40 shouldLogToDisk]) {
    int v42 = v41 | 2;
  }
  else {
    int v42 = v41;
  }
  v43 = [v40 OSLogObject];
  if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
    v42 &= 2u;
  }
  if (!v42) {
    goto LABEL_62;
  }
  id v44 = objc_opt_class();
  id v45 = v3;
  unsigned int v46 = v2;
  id v47 = v44;
  long long v48 = +[NSNumber numberWithBool:v39];
  int v61 = 138543618;
  int v62 = v44;
  __int16 v63 = 2114;
  id v64 = v48;
  LODWORD(v54) = 22;
  id v49 = (void *)_os_log_send_and_compose_impl();

  v2 = v46;
  id v3 = v45;

  if (v49)
  {
    v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v61, v54);
    free(v49);
    SSFileLog();
LABEL_62:
  }
  return v39;
}

- (BOOL)_migrateAccountsToAccountsFramework
{
  v2 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  unsigned int v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v10) = 138543362;
  *(void *)((char *)&v10 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    unsigned int v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v10, v9, v10);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  return +[SSAccountStore migrateToAccountsFramework];
}

- (void)_migrateAutomaticDownloadKindsDefaultToActiveAccount:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v9 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v9)
    {
      uint64_t v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    id v11 = [v9 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      int v29 = 138543362;
      id v30 = (id)objc_opt_class();
      id v19 = v30;
      LODWORD(v26) = 12;
      unsigned int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_37;
      }
      id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v29, v26);
      free(v20);
      SSFileLog();
    }
    goto LABEL_36;
  }
  CFStringRef v8 = (const __CFString *)kSSUserDefaultsIdentifier;
  uint64_t v9 = (void *)CFPreferencesCopyAppValue(@"AutomaticDownloadKinds", kSSUserDefaultsIdentifier);
  uint64_t v10 = +[SSLogConfig sharedAccountsMigrationConfig];
  id v11 = v10;
  if (!v9)
  {
    if (!v10)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    id v23 = [v11 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      v22 &= 2u;
    }
    if (!v22) {
      goto LABEL_35;
    }
    int v29 = 138543362;
    id v30 = (id)objc_opt_class();
    id v24 = v30;
    LODWORD(v26) = 12;
    long long v25 = (void *)_os_log_send_and_compose_impl();

    if (v25)
    {
      id v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v29, v26);
      free(v25);
      SSFileLog();
LABEL_35:
    }
LABEL_36:

    goto LABEL_37;
  }
  if (!v10)
  {
    id v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  unsigned int v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_13;
  }
  int v29 = 138543362;
  id v30 = (id)objc_opt_class();
  id v15 = v30;
  LODWORD(v26) = 12;
  id v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    unsigned int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v29, v26);
    free(v16);
    SSFileLog();
LABEL_13:
  }
  CFPreferencesSetAppValue(@"AutomaticDownloadKinds", 0, v8);
  CFPreferencesAppSynchronize(v8);
  [v6 setAutomaticDownloadKinds:v9];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_80A8;
  v27[3] = &unk_10428;
  v27[4] = self;
  id v28 = v6;
  [v7 saveAccount:v28 verifyCredentials:0 completion:v27];

LABEL_37:
}

- (void)_migrateSandboxAccounts
{
  v2 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    v3 |= 2u;
  }
  int v4 = [v2 OSLogObject];
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    v3 &= 2u;
  }
  if (v3)
  {
    *(_DWORD *)location = 138543362;
    *(void *)&location[4] = objc_opt_class();
    id v5 = *(id *)&location[4];
    LODWORD(v45) = 12;
    id v44 = location;
    id v6 = (void *)_os_log_send_and_compose_impl();

    if (v6)
    {
      id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, location, v45);
      free(v6);
      id v44 = v7;
      SSFileLog();
    }
  }
  else
  {
  }
  id v50 = objc_alloc_init((Class)ACAccountStore);
  unsigned int v46 = [v50 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifieriTunesStore];
  id v47 = [v50 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifieriTunesStoreSandbox];
  [v50 accountsWithAccountType:v46 options:1 error:0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v55;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        unsigned int v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"scope", v44);
        int v13 = (char *)[v12 unsignedIntegerValue];

        if (v13 == (unsigned char *)&dword_0 + 1)
        {
          unsigned int v14 = +[SSLogConfig sharedAccountsMigrationConfig];
          if (!v14)
          {
            unsigned int v14 = +[SSLogConfig sharedConfig];
          }
          unsigned int v15 = [v14 shouldLog];
          if ([v14 shouldLogToDisk]) {
            v15 |= 2u;
          }
          id v16 = [v14 OSLogObject];
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            v15 &= 2u;
          }
          if (v15)
          {
            unsigned int v17 = objc_opt_class();
            id v18 = v17;
            id v19 = [v11 hashedDescription];
            *(_DWORD *)location = 138543618;
            *(void *)&location[4] = v17;
            __int16 v59 = 2114;
            id v60 = v19;
            LODWORD(v45) = 22;
            id v44 = location;
            unsigned int v20 = (void *)_os_log_send_and_compose_impl();

            if (v20)
            {
              id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, location, v45);
              free(v20);
              id v44 = v16;
              SSFileLog();
              goto LABEL_26;
            }
          }
          else
          {
LABEL_26:
          }
          [v11 setAccountType:v47];
          id v53 = 0;
          unsigned __int8 v21 = [v50 saveVerifiedAccount:v11 error:&v53];
          id v22 = v53;
          id v23 = v22;
          if (v21) {
            goto LABEL_53;
          }
          id v24 = [v22 domain];
          if ([v24 isEqualToString:ACErrorDomain])
          {
            BOOL v25 = [v23 code] == (char *)&dword_4 + 1;

            if (v25)
            {
              uint64_t v26 = +[SSLogConfig sharedAccountsMigrationConfig];
              if (!v26)
              {
                uint64_t v26 = +[SSLogConfig sharedConfig];
              }
              unsigned int v27 = objc_msgSend(v26, "shouldLog", v44);
              if ([v26 shouldLogToDisk]) {
                v27 |= 2u;
              }
              id v28 = [v26 OSLogObject];
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
                v27 &= 2u;
              }
              if (v27)
              {
                int v29 = objc_opt_class();
                *(_DWORD *)location = 138543362;
                *(void *)&location[4] = v29;
                id v30 = v29;
                LODWORD(v45) = 12;
                id v44 = location;
                uint64_t v31 = (void *)_os_log_send_and_compose_impl();

                if (v31)
                {
                  id v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, location, v45);
                  free(v31);
                  id v44 = v28;
                  SSFileLog();
                  goto LABEL_39;
                }
              }
              else
              {
LABEL_39:
              }
              objc_initWeak((id *)location, self);
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = sub_8C08;
              v51[3] = &unk_10450;
              objc_copyWeak(&v52, (id *)location);
              [v50 removeAccount:v11 withCompletionHandler:v51];
              objc_destroyWeak(&v52);
              objc_destroyWeak((id *)location);
LABEL_53:

              continue;
            }
          }
          else
          {
          }
          id v32 = +[SSLogConfig sharedAccountsMigrationConfig];
          if (!v32)
          {
            id v32 = +[SSLogConfig sharedConfig];
          }
          unsigned int v33 = [v32 shouldLog];
          if ([v32 shouldLogToDisk]) {
            v33 |= 2u;
          }
          int v34 = [v32 OSLogObject];
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            v33 &= 2u;
          }
          if (v33)
          {
            int v35 = objc_opt_class();
            *(_DWORD *)location = 138543618;
            *(void *)&location[4] = v35;
            __int16 v59 = 2114;
            id v60 = v23;
            id v36 = v35;
            LODWORD(v45) = 22;
            id v44 = location;
            id v37 = (void *)_os_log_send_and_compose_impl();

            if (v37)
            {
              int v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, location, v45);
              free(v37);
              id v44 = v34;
              SSFileLog();
              goto LABEL_51;
            }
          }
          else
          {
LABEL_51:
          }
          goto LABEL_53;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v8);
  }

  unsigned int v38 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v38)
  {
    unsigned int v38 = +[SSLogConfig sharedConfig];
  }
  unsigned int v39 = objc_msgSend(v38, "shouldLog", v44);
  if ([v38 shouldLogToDisk]) {
    v39 |= 2u;
  }
  int v40 = [v38 OSLogObject];
  if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
    v39 &= 2u;
  }
  if (!v39) {
    goto LABEL_65;
  }
  unsigned int v41 = objc_opt_class();
  *(_DWORD *)location = 138543362;
  *(void *)&location[4] = v41;
  id v42 = v41;
  LODWORD(v45) = 12;
  v43 = (void *)_os_log_send_and_compose_impl();

  if (v43)
  {
    int v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, location, v45);
    free(v43);
    SSFileLog();
LABEL_65:
  }
}

- (void)_migrateServerPromptDefaultsToActiveAccount:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v40 = self;
    uint64_t v8 = SSServerPromptIdentifierAutomaticDownloadsAvailable;
    uint64_t v9 = +[NSString stringWithFormat:@"ServerPrompt-%@", SSServerPromptIdentifierAutomaticDownloadsAvailable];
    Boolean keyExistsAndHasValidFormat = 0;
    CFStringRef v10 = (const __CFString *)kSSUserDefaultsIdentifier;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v9, kSSUserDefaultsIdentifier, &keyExistsAndHasValidFormat);
    int v12 = keyExistsAndHasValidFormat;
    if (!keyExistsAndHasValidFormat) {
      goto LABEL_16;
    }
    int v13 = AppBooleanValue;
    id v39 = v7;
    unsigned int v14 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v14)
    {
      unsigned int v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    unsigned int v17 = [v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      int v18 = v16;
    }
    else {
      int v18 = v16 & 2;
    }
    if (v18)
    {
      id v19 = objc_opt_class();
      int v43 = 138543618;
      id v44 = v19;
      __int16 v45 = 2112;
      unsigned int v46 = v9;
      id v20 = v19;
      LODWORD(v38) = 22;
      unsigned __int8 v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_15:

        [v6 setDisplayedServerPrompt:v13 != 0 withIdentifier:v8];
        CFPreferencesSetAppValue(v9, 0, v10);
        id v7 = v39;
LABEL_16:
        id v22 = +[NSString stringWithFormat:@"ServerPromptDate-%@", v8];

        id v23 = (void *)CFPreferencesCopyAppValue(v22, v10);
        if (!v23)
        {
          if (!v12)
          {
LABEL_43:

            goto LABEL_44;
          }
LABEL_42:
          CFPreferencesAppSynchronize(v10);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_931C;
          v41[3] = &unk_10358;
          v41[4] = v40;
          [v7 saveAccount:v6 verifyCredentials:0 completion:v41];
          goto LABEL_43;
        }
        id v24 = v7;
        BOOL v25 = +[SSLogConfig sharedAccountsMigrationConfig];
        if (!v25)
        {
          BOOL v25 = +[SSLogConfig sharedConfig];
        }
        unsigned int v26 = [v25 shouldLog];
        if ([v25 shouldLogToDisk]) {
          v26 |= 2u;
        }
        unsigned int v27 = [v25 OSLogObject];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          int v28 = v26;
        }
        else {
          int v28 = v26 & 2;
        }
        if (v28)
        {
          int v29 = objc_opt_class();
          int v43 = 138543618;
          id v44 = v29;
          __int16 v45 = 2112;
          unsigned int v46 = v22;
          id v30 = v29;
          LODWORD(v38) = 22;
          uint64_t v31 = (void *)_os_log_send_and_compose_impl();

          if (!v31)
          {
LABEL_28:

            [v6 setLastAttemptDate:v23 forServerPromptWithIdentifier:v8];
            CFPreferencesSetAppValue(v22, 0, v10);
            id v7 = v24;
            goto LABEL_42;
          }
          unsigned int v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v43, v38);
          free(v31);
          SSFileLog();
        }

        goto LABEL_28;
      }
      unsigned int v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v43, v38);
      free(v21);
      SSFileLog();
    }

    goto LABEL_15;
  }
  id v22 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v22)
  {
    id v22 = +[SSLogConfig sharedConfig];
  }
  unsigned int v32 = [(__CFString *)v22 shouldLog];
  if ([(__CFString *)v22 shouldLogToDisk]) {
    int v33 = v32 | 2;
  }
  else {
    int v33 = v32;
  }
  int v34 = [(__CFString *)v22 OSLogObject];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
    int v35 = v33;
  }
  else {
    int v35 = v33 & 2;
  }
  if (!v35) {
    goto LABEL_40;
  }
  int v43 = 138543362;
  id v44 = (id)objc_opt_class();
  id v36 = v44;
  LODWORD(v38) = 12;
  id v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    int v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v43, v38);
    free(v37);
    SSFileLog();
LABEL_40:
  }
LABEL_44:
}

- (void)_postPushToken
{
  v2 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v10) = 138543362;
  *(void *)((char *)&v10 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    id v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v10, v9, v10);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  id v8 = objc_alloc_init((Class)SSPushNotificationTokenRequest);
  [v8 startWithCompletion:0];
}

- (void)_removePasswordEquivalentTokensFromAccounts
{
  unsigned int v3 = +[SSAccountStore defaultStore];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = [v3 accounts];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        long long v10 = [v9 passwordEquivalentToken];

        if (v10)
        {
          [v9 setPasswordEquivalentToken:0];
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_98BC;
          v11[3] = &unk_10428;
          v11[4] = self;
          v11[5] = v9;
          [v3 saveAccount:v9 verifyCredentials:0 completion:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

+ (void)_cleanupBrokenAccounts:(BOOL)a3 emptyAccounts:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  +[SSAccountStore defaultStore];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v45 = long long v56 = 0u;
  id obj = [v45 accounts];
  id v6 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v54;
    BOOL v47 = v5;
    BOOL v48 = v4;
    uint64_t v50 = *(void *)v54;
    do
    {
      uint64_t v9 = 0;
      id v46 = v7;
      do
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v9);
        if ((objc_msgSend(v10, "isLocalAccount", v43, v44) & 1) == 0)
        {
          id v11 = [v10 backingAccount];
          long long v12 = [v10 uniqueIdentifier];
          if (v12)
          {
            long long v13 = [v10 uniqueIdentifier];
            unsigned int v14 = [v13 isEqualToNumber:&off_10AD8];
          }
          else
          {
            unsigned int v14 = 1;
          }

          long long v15 = [v11 accountProperties];
          id v16 = [v15 count];

          if (v16)
          {
            unsigned int v17 = [v11 accountProperties];
            if ([v17 count] == (char *)&dword_0 + 1)
            {
              int v18 = [v11 accountProperties];
              id v19 = [v18 objectForKeyedSubscript:@"originalUsername"];
              BOOL v20 = v19 != 0;
            }
            else
            {
              BOOL v20 = 0;
            }
          }
          else
          {
            BOOL v20 = 1;
          }
          if ((v14 & v5 & 1) == 0 && (!v20 || !v4)) {
            goto LABEL_45;
          }
          unsigned __int8 v21 = +[SSAccountStore defaultStore];
          id v52 = 0;
          unsigned int v22 = [v21 removeAccount:v10 error:&v52];
          id v23 = v52;

          uint64_t v24 = +[SSLogConfig sharedAccountsMigrationConfig];
          BOOL v25 = (void *)v24;
          if (v22)
          {
            id v49 = v23;
            if (!v24)
            {
              BOOL v25 = +[SSLogConfig sharedConfig];
            }
            unsigned int v26 = [v25 shouldLog];
            if ([v25 shouldLogToDisk]) {
              int v27 = v26 | 2;
            }
            else {
              int v27 = v26;
            }
            int v28 = [v25 OSLogObject];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
              int v29 = v27;
            }
            else {
              int v29 = v27 & 2;
            }
            if (v29)
            {
              id v30 = objc_opt_class();
              id v31 = v30;
              unsigned int v32 = [v10 hashedDescription];
              int v57 = 138543618;
              long long v58 = v30;
              __int16 v59 = 2114;
              id v60 = v32;
              LODWORD(v44) = 22;
              int v43 = &v57;
              int v33 = (void *)_os_log_send_and_compose_impl();

              if (v33)
              {
                int v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v57, v44);
                free(v33);
                int v43 = (int *)v28;
                SSFileLog();
                BOOL v5 = v47;
                BOOL v4 = v48;
                goto LABEL_30;
              }
              BOOL v5 = v47;
              BOOL v4 = v48;
              int v34 = v49;
LABEL_44:

LABEL_45:
              uint64_t v8 = v50;
              goto LABEL_46;
            }
LABEL_30:
            int v34 = v49;
          }
          else
          {
            id v35 = v23;
            if (!v24)
            {
              BOOL v25 = +[SSLogConfig sharedConfig];
            }
            unsigned int v36 = [v25 shouldLog];
            if ([v25 shouldLogToDisk]) {
              v36 |= 2u;
            }
            int v28 = [v25 OSLogObject];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              int v37 = v36;
            }
            else {
              int v37 = v36 & 2;
            }
            if (v37)
            {
              uint64_t v38 = objc_opt_class();
              id v39 = v38;
              int v40 = [v10 hashedDescription];
              int v57 = 138543874;
              long long v58 = v38;
              __int16 v59 = 2114;
              id v60 = v40;
              __int16 v61 = 2114;
              int v34 = v35;
              id v62 = v35;
              LODWORD(v44) = 32;
              int v43 = &v57;
              unsigned int v41 = (void *)_os_log_send_and_compose_impl();

              if (!v41)
              {
                BOOL v5 = v47;
                BOOL v4 = v48;
                id v7 = v46;
                goto LABEL_44;
              }
              int v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v57, v44);
              free(v41);
              int v43 = (int *)v28;
              SSFileLog();
              BOOL v5 = v47;
              BOOL v4 = v48;
            }
            else
            {
              int v34 = v35;
            }
            id v7 = v46;
          }

          goto LABEL_44;
        }
LABEL_46:
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v42 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      id v7 = v42;
    }
    while (v42);
  }
}

+ (void)_cleanupDuplicateAccounts
{
  v2 = +[SSAccountStore defaultStore];
  id v24 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unsigned int v22 = v2;
  id obj = [v2 accounts];
  id v3 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v34;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v8 = v24;
        id v9 = [v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v30;
LABEL_8:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
            unsigned int v14 = [v13 firstObject];
            if ([v7 isDuplicate:v14]) {
              break;
            }

            if (v10 == (id)++v12)
            {
              id v10 = [v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v15 = v13;

          if (v15) {
            goto LABEL_17;
          }
        }
        else
        {
LABEL_14:
        }
        id v15 = objc_alloc_init((Class)NSMutableArray);
        [v8 addObject:v15];
LABEL_17:
        [v15 addObject:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v4);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v24;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        [a1 _mergeDuplicateAccounts:*(void *)(*((void *)&v25 + 1) + 8 * (void)j) inStore:v22];
      }
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v18);
  }
}

+ (void)_cleanupMultipleActiveAccountsWithPreferredActiveAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v5)
  {
    uint64_t v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (v9)
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = [v4 hashedDescription];
    int v52 = 138543618;
    long long v53 = v10;
    __int16 v54 = 2114;
    long long v55 = v12;
    LODWORD(v42) = 22;
    unsigned int v41 = &v52;
    long long v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_13;
    }
    id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v52, v42);
    free(v13);
    unsigned int v41 = (int *)v8;
    SSFileLog();
  }

LABEL_13:
  unsigned int v14 = +[SSAccountStore defaultStore];
  id v15 = [v14 accounts];
  id v16 = v15;
  id v17 = objc_msgSend_migrateToAccountsFramework;
  if (!v4)
  {
    id v18 = objc_msgSend(v15, "_ss_arrayByRemovingObjectsPassingTest:", &stru_10490);

    if (![v18 count]) {
      goto LABEL_30;
    }
    uint64_t v19 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v19)
    {
      uint64_t v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = objc_msgSend(v19, "shouldLog", v41);
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    unsigned int v22 = [v19 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      int v23 = v21;
    }
    else {
      int v23 = v21 & 2;
    }
    if (v23)
    {
      id v24 = objc_opt_class();
      int v52 = 138543362;
      long long v53 = v24;
      id v25 = v24;
      LODWORD(v42) = 12;
      unsigned int v41 = &v52;
      long long v26 = (void *)_os_log_send_and_compose_impl();

      id v17 = objc_msgSend_migrateToAccountsFramework;
      if (!v26) {
        goto LABEL_29;
      }
      unsigned int v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v52, v42);
      free(v26);
      unsigned int v41 = (int *)v22;
      SSFileLog();
    }
    else
    {
      id v17 = objc_msgSend_migrateToAccountsFramework;
    }

    goto LABEL_29;
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_A864;
  v49[3] = &unk_104B8;
  id v50 = v4;
  id v18 = objc_msgSend(v16, "_ss_arrayByRemovingObjectsPassingTest:", v49);

  uint64_t v19 = v50;
LABEL_29:

LABEL_30:
  if (!objc_msgSend(v18, "count", v41))
  {
    id v27 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v27)
    {
      id v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v34 = [v27 shouldLog];
    if ([v27 shouldLogToDisk]) {
      int v35 = v34 | 2;
    }
    else {
      int v35 = v34;
    }
    long long v36 = [v27 OSLogObject];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      int v37 = v35;
    }
    else {
      int v37 = v35 & 2;
    }
    if (v37)
    {
      uint64_t v38 = objc_opt_class();
      int v52 = 138543362;
      long long v53 = v38;
      id v39 = v38;
      LODWORD(v42) = 12;
      int v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40) {
        goto LABEL_51;
      }
      long long v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v52, v42);
      free(v40);
      SSFileLog();
    }

    goto LABEL_51;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v27 = v18;
  id v28 = [v27 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v28)
  {
    id v29 = v28;
    int v43 = v18;
    uint64_t v30 = *(void *)v46;
    uint64_t v31 = *((void *)v17 + 263);
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v33 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        [v33 setActive:0];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = v31;
        v44[2] = sub_A90C;
        v44[3] = &unk_104E0;
        v44[4] = v33;
        v44[5] = a1;
        [v14 saveAccount:v33 verifyCredentials:0 completion:v44];
      }
      id v29 = [v27 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v29);
    id v18 = v43;
  }
LABEL_51:
}

+ (BOOL)_copyAccountPropertiesIfNeededFromAccount:(id)a3 toAccount:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [a4 backingAccount];
  long long v32 = v5;
  [v5 backingAccount];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v37 = v41 = 0u;
  int v7 = [v37 accountProperties];
  id v8 = [v7 allKeys];

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v9)
  {
    char v33 = 0;
    goto LABEL_30;
  }
  id v10 = v9;
  char v33 = 0;
  uint64_t v36 = *(void *)v39;
  uint64_t v11 = SSAccountPropertyAltDSIDKey;
  uint64_t v35 = SSAccountPropertyDSIDKey;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v39 != v36) {
        objc_enumerationMutation(obj);
      }
      long long v13 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v12);
      unsigned int v14 = [v37 objectForKeyedSubscript:v13];
      id v15 = [v6 objectForKeyedSubscript:v13];
      if ([v13 isEqualToString:v11]
        && (([v14 isEqual:&stru_10A60] & 1) != 0
         || [v15 isEqual:&stru_10A60]))
      {
        unsigned int v16 = [v14 isEqual:&stru_10A60];
        id v17 = v14;
        if (!v16) {
          goto LABEL_17;
        }
        unsigned __int8 v18 = [v15 isEqual:&stru_10A60];
      }
      else
      {
        if (![v13 isEqualToString:v35]
          || ([v14 isEqual:&off_10AD8] & 1) == 0
          && ![v15 isEqual:&off_10AD8])
        {
          goto LABEL_18;
        }
        unsigned int v19 = [v14 isEqualToNumber:&off_10AD8];
        id v17 = v14;
        if (!v19) {
          goto LABEL_17;
        }
        unsigned __int8 v18 = [v15 isEqualToNumber:&off_10AD8];
      }
      id v17 = v15;
      if ((v18 & 1) == 0)
      {
LABEL_17:
        id v20 = v17;
        if (v20) {
          goto LABEL_22;
        }
      }
LABEL_18:
      int v21 = v15;
      if (v14 && (int v21 = v14, v15) && (v22 = [v14 isEqual:v15], int v21 = v15, !v22)) {
        id v20 = 0;
      }
      else {
        id v20 = v21;
      }
LABEL_22:
      int v23 = [v6 objectForKeyedSubscript:v13];
      unsigned __int8 v24 = [v23 isEqual:v20];

      if ((v24 & 1) == 0)
      {
        [v6 setObject:v20 forKeyedSubscript:v13];
        char v33 = 1;
      }

      uint64_t v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    id v25 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    id v10 = v25;
  }
  while (v25);
LABEL_30:

  long long v26 = [v37 objectForKeyedSubscript:@"originalUsername"];
  if ([v26 length])
  {
    id v27 = [v6 username];
    unsigned int v28 = [v27 isEqualToString:v26];

    char v29 = v33;
    if (v28)
    {
      uint64_t v30 = [v37 username];
      [v6 setUsername:v30];

      char v29 = 1;
    }
  }
  else
  {
    char v29 = v33;
  }

  return v29 & 1;
}

+ (id)_firstActiveAccountInAccounts:(id)a3
{
  id v3 = [a3 sortedArrayUsingComparator:&stru_10520];
  id v4 = objc_msgSend(v3, "_ss_firstObjectPassingTest:", &stru_10540);

  return v4;
}

+ (void)_mergeDuplicateAccounts:(id)a3 inStore:(id)a4
{
  id v6 = a3;
  id v38 = a4;
  if ((unint64_t)[v6 count] < 2) {
    goto LABEL_41;
  }
  int v7 = [v6 sortedArrayUsingComparator:&stru_10560];

  id v8 = [v7 reverseObjectEnumerator];
  id v9 = [v8 allObjects];

  id v10 = objc_msgSend(v9, "_ss_firstObjectPassingTest:", &stru_10580);
  if (!v10)
  {
    id v10 = [v9 firstObject];
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = v9;
  id v11 = [v6 countByEnumeratingWithState:&v47 objects:v59 count:16];
  uint64_t v12 = v6;
  id v40 = v11;
  if (!v11)
  {
LABEL_39:

    goto LABEL_40;
  }
  int v13 = 0;
  uint64_t v39 = *(void *)v48;
  id v36 = v6;
  id v37 = a1;
  do
  {
    unsigned int v14 = 0;
    do
    {
      if (*(void *)v48 != v39) {
        objc_enumerationMutation(v6);
      }
      id v15 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v14);
      if (v15 != v10)
      {
        unsigned int v41 = [a1 _copyAccountPropertiesIfNeededFromAccount:*(void *)(*((void *)&v47 + 1) + 8 * (void)v14) toAccount:v10];
        id v46 = 0;
        unsigned int v16 = [v38 removeAccount:v15 error:&v46];
        id v17 = v46;
        uint64_t v18 = +[SSLogConfig sharedAccountsMigrationConfig];
        unsigned int v19 = (void *)v18;
        int v42 = v13;
        if (v16)
        {
          if (!v18)
          {
            unsigned int v19 = +[SSLogConfig sharedConfig];
          }
          unsigned int v20 = objc_msgSend(v19, "shouldLog", v34);
          if ([v19 shouldLogToDisk]) {
            int v21 = v20 | 2;
          }
          else {
            int v21 = v20;
          }
          unsigned int v22 = [v19 OSLogObject];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
            int v23 = v21;
          }
          else {
            int v23 = v21 & 2;
          }
          if (v23)
          {
            unsigned __int8 v24 = objc_opt_class();
            id v25 = v24;
            long long v26 = [v10 hashedDescription];
            id v27 = [v15 hashedDescription];
            int v51 = 138543874;
            int v52 = v24;
            __int16 v53 = 2114;
            __int16 v54 = v26;
            __int16 v55 = 2114;
            long long v56 = v27;
            LODWORD(v35) = 32;
            unsigned int v34 = &v51;
            goto LABEL_30;
          }
LABEL_32:
          unsigned int v33 = v41;
          int v32 = v42;
        }
        else
        {
          if (!v18)
          {
            unsigned int v19 = +[SSLogConfig sharedConfig];
          }
          unsigned int v28 = objc_msgSend(v19, "shouldLog", v34, v35);
          if ([v19 shouldLogToDisk]) {
            v28 |= 2u;
          }
          unsigned int v22 = [v19 OSLogObject];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            int v29 = v28;
          }
          else {
            int v29 = v28 & 2;
          }
          if (!v29) {
            goto LABEL_32;
          }
          uint64_t v30 = objc_opt_class();
          id v25 = v30;
          long long v26 = [v10 hashedDescription];
          id v27 = [v15 hashedDescription];
          int v51 = 138544130;
          int v52 = v30;
          __int16 v53 = 2114;
          __int16 v54 = v26;
          __int16 v55 = 2114;
          long long v56 = v27;
          __int16 v57 = 2112;
          id v58 = v17;
          LODWORD(v35) = 42;
          unsigned int v34 = &v51;
LABEL_30:
          uint64_t v31 = (void *)_os_log_send_and_compose_impl();

          if (v31)
          {
            unsigned int v22 = +[NSString stringWithCString:v31 encoding:4];
            free(v31);
            unsigned int v34 = (int *)v22;
            SSFileLog();
            id v6 = v36;
            a1 = v37;
            goto LABEL_32;
          }
          id v6 = v36;
          a1 = v37;
          unsigned int v33 = v41;
          int v32 = v42;
        }
        int v13 = v32 | v33;
      }
      unsigned int v14 = (char *)v14 + 1;
    }
    while (v40 != v14);
    id v40 = [v6 countByEnumeratingWithState:&v47 objects:v59 count:16];
  }
  while (v40);

  if (v13)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_B5EC;
    v43[3] = &unk_104E0;
    id v45 = a1;
    id v44 = v10;
    [v38 saveAccount:v44 verifyCredentials:0 completion:v43];
    uint64_t v12 = v44;
    goto LABEL_39;
  }
LABEL_40:

LABEL_41:
}

+ (void)_repairAccounts
{
  id v3 = +[SSAccountStore defaultStore];
  id v4 = [v3 accounts];
  id v5 = objc_msgSend(v4, "_ss_map:", &stru_105C0);

  id v6 = +[SSLogConfig sharedAccountsMigrationConfigOversize];
  if (!v6)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_11;
  }
  *(_DWORD *)id v15 = 138543618;
  *(void *)&v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2114;
  *(void *)&v15[14] = v5;
  id v10 = *(id *)&v15[4];
  LODWORD(v14) = 22;
  id v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16]);
    free(v11);
    SSFileLog();
LABEL_11:
  }
  [a1 _cleanupDuplicateAccounts];
  uint64_t v12 = [v3 accounts];
  int v13 = [a1 _firstActiveAccountInAccounts:v12];

  [a1 _repairBrokenAccounts];
  [a1 _cleanupBrokenAccounts:1 emptyAccounts:1];
  [a1 _cleanupMultipleActiveAccountsWithPreferredActiveAccount:v13];
  [a1 _repairAccountsWithStringDSID];
}

+ (void)_repairAccountsWithStringDSID
{
  +[SSAccountStore defaultStore];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v30 = v40 = 0u;
  id obj = [v30 accounts];
  id v2 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v38;
    uint64_t v5 = SSAccountPropertyDSIDKey;
    int v29 = v36;
    uint64_t v31 = SSAccountPropertyDSIDKey;
    uint64_t v32 = *(void *)v38;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v38 != v4) {
          objc_enumerationMutation(obj);
        }
        unsigned int v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int v8 = objc_msgSend(v7, "accountPropertyForKey:", v5, v27, v28, v29);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = +[SSLogConfig sharedAccountsMigrationConfig];
          if (!v9)
          {
            id v9 = +[SSLogConfig sharedConfig];
          }
          unsigned int v10 = [v9 shouldLog];
          if ([v9 shouldLogToDisk]) {
            int v11 = v10 | 2;
          }
          else {
            int v11 = v10;
          }
          uint64_t v12 = [v9 OSLogObject];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            int v13 = v11;
          }
          else {
            int v13 = v11 & 2;
          }
          if (v13)
          {
            uint64_t v14 = objc_opt_class();
            id v15 = v14;
            unsigned int v16 = [v7 hashedDescription];
            int v41 = 138543618;
            int v42 = v14;
            uint64_t v4 = v32;
            __int16 v43 = 2114;
            id v44 = v16;
            LODWORD(v28) = 22;
            id v27 = &v41;
            id v17 = (void *)_os_log_send_and_compose_impl();

            uint64_t v5 = v31;
            if (v17)
            {
              uint64_t v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v41, v28);
              free(v17);
              id v27 = (int *)v12;
              SSFileLog();
              goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
          }
          uint64_t v18 = SSAccountGetUniqueIdentifierFromValue();
          if (v18)
          {
            [v7 setUniqueIdentifier:v18];
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v36[0] = sub_BF64;
            v36[1] = &unk_105E0;
            v36[2] = a1;
            [v30 saveAccount:v7 verifyCredentials:0 completion:v35];
LABEL_33:

            goto LABEL_34;
          }
          unsigned int v19 = +[SSLogConfig sharedAccountsMigrationConfig];
          if (!v19)
          {
            unsigned int v19 = +[SSLogConfig sharedConfig];
          }
          unsigned int v20 = objc_msgSend(v19, "shouldLog", v27);
          if ([v19 shouldLogToDisk]) {
            v20 |= 2u;
          }
          int v21 = [v19 OSLogObject];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            int v22 = v20;
          }
          else {
            int v22 = v20 & 2;
          }
          if (v22)
          {
            int v23 = objc_opt_class();
            id v24 = v23;
            id v25 = SSHashIfNeeded();
            int v41 = 138543618;
            int v42 = v23;
            __int16 v43 = 2114;
            id v44 = v25;
            LODWORD(v28) = 22;
            id v27 = &v41;
            long long v26 = (void *)_os_log_send_and_compose_impl();

            uint64_t v5 = v31;
            uint64_t v4 = v32;

            if (v26)
            {
              int v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v41, v28);
              free(v26);
              id v27 = (int *)v21;
              SSFileLog();
              goto LABEL_31;
            }
          }
          else
          {
LABEL_31:
          }
          goto LABEL_33;
        }
LABEL_34:
      }
      id v3 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v3);
  }
}

+ (void)_repairBrokenAccounts
{
  id v2 = +[SSAccountStore defaultStore];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(v2, "accounts", 0);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 isLocalAccount] & 1) == 0
          && [v8 hasBrokenDSID])
        {
          [v2 repairAccountWithBrokenDSID:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

@end