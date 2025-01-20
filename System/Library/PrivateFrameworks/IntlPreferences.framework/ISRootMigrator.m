@interface ISRootMigrator
- (BOOL)isErase;
- (BOOL)isRestoreFromBackup;
- (BOOL)performMigration;
- (id)appendRegionalVariantsToLanguageIdentifiers:(id)a3 regionCode:(id)a4;
- (id)importPreferredLanguagesForPreferences:(id)a3;
- (id)importPreferredLanguages_macOS_10_9_forPreferences:(id)a3;
- (id)performMigrationForPreferences:(id)a3;
- (id)performMigrationForUserPreferences:(id)a3 systemPreferences:(id)a4;
- (void)performMigration;
- (void)setIsErase:(BOOL)a3;
- (void)setIsRestoreFromBackup:(BOOL)a3;
- (void)updateAppleLanguagesSchemaVersionToCurrent;
@end

@implementation ISRootMigrator

- (BOOL)performMigration
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  v3 = MigrationLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(ISMigrator *)self previousVersion];
    v5 = [(ISMigrator *)self currentVersion];
    *(_DWORD *)buf = 136316418;
    v127 = "-[ISRootMigrator performMigration]";
    __int16 v128 = 2114;
    uint64_t v129 = (uint64_t)v4;
    __int16 v130 = 2114;
    id v131 = v5;
    __int16 v132 = 1024;
    BOOL v133 = [(ISRootMigrator *)self isErase];
    __int16 v134 = 1024;
    BOOL v135 = [(ISRootMigrator *)self isRestoreFromBackup];
    __int16 v136 = 1024;
    BOOL v137 = [(ISMigrator *)self newUserAccount];
    _os_log_impl(&dword_1BECA5000, v3, OS_LOG_TYPE_DEFAULT, "%s: previousVersion='%{public}@', currentVersion='%{public}@', isErase=%d, isRestoreFromBackup=%d, isNewUserAccount=%d", buf, 0x32u);
  }
  v6 = [(ISMigrator *)self previousVersion];
  v7 = [(ISMigrator *)self currentVersion];
  if ([v7 length])
  {
    if (![v6 length])
    {
      v8 = v7;
      id v9 = v7;

      v10 = MigrationLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v127 = "-[ISRootMigrator performMigration]";
        _os_log_impl(&dword_1BECA5000, v10, OS_LOG_TYPE_DEFAULT, "%s: failed to retrieve previousVersion. Setting it to currentVersion.", buf, 0xCu);
      }

      v6 = v9;
      v7 = v8;
    }
    v106 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([(ISMigrator *)self platform] == 1)
    {
      v105 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    else
    {
      v105 = 0;
    }
    unint64_t v11 = [(ISMigrator *)self platform];
    v96 = v6;
    v97 = self;
    v95 = v7;
    if (v11 - 3 < 2)
    {
      v12 = (void *)MEMORY[0x1E4F1CA80];
      v123[0] = @"AppleLanguages";
      v123[1] = @"AppleLocale";
      v13 = (void *)MEMORY[0x1E4F1C978];
      v14 = v123;
      uint64_t v16 = 2;
    }
    else
    {
      if (v11 == 2)
      {
        v12 = (void *)MEMORY[0x1E4F1CA80];
        v124[0] = @"AppleLanguages";
        v124[1] = @"AppleLocale";
        v124[2] = @"PreferredLanguages";
        v13 = (void *)MEMORY[0x1E4F1C978];
        v14 = v124;
      }
      else
      {
        if (v11 != 1)
        {
          v18 = 0;
          goto LABEL_25;
        }
        v12 = (void *)MEMORY[0x1E4F1CA80];
        v125[0] = @"AppleLanguages";
        v125[1] = @"AppleLocale";
        v125[2] = @"AppleUserLanguages";
        v13 = (void *)MEMORY[0x1E4F1C978];
        v14 = v125;
      }
      uint64_t v16 = 3;
    }
    v17 = [v13 arrayWithObjects:v14 count:v16];
    v18 = [v12 setWithArray:v17];

LABEL_25:
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v115 objects:v122 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v116;
      CFStringRef v23 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
      CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v25 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFStringRef v26 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v116 != v22) {
            objc_enumerationMutation(v19);
          }
          CFStringRef v28 = *(const __CFString **)(*((void *)&v115 + 1) + 8 * i);
          v29 = (void *)CFPreferencesCopyValue(v28, v23, v24, v25);
          if (v29) {
            [v106 setObject:v29 forKeyedSubscript:v28];
          }

          if (v105)
          {
            v30 = (void *)CFPreferencesCopyValue(v28, v23, v26, v25);
            if (v30) {
              [v105 setObject:v30 forKeyedSubscript:v28];
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v115 objects:v122 count:16];
      }
      while (v21);
    }

    v31 = [(ISRootMigrator *)v97 performMigrationForUserPreferences:v106 systemPreferences:v105];
    v32 = MigrationLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v127 = "-[ISRootMigrator performMigration]";
      __int16 v128 = 2114;
      uint64_t v129 = (uint64_t)v106;
      __int16 v130 = 2114;
      id v131 = v31;
      _os_log_impl(&dword_1BECA5000, v32, OS_LOG_TYPE_DEFAULT, "%s: oldPreferences = %{public}@, migratedPreferences = %{public}@", buf, 0x20u);
    }

    v33 = [v31 allKeys];
    [v19 addObjectsFromArray:v33];

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    obuint64_t j = v19;
    uint64_t v34 = [obj countByEnumeratingWithState:&v111 objects:v121 count:16];
    v103 = v31;
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v112;
      CFStringRef v37 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
      CFStringRef v102 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v100 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v112 != v36) {
            objc_enumerationMutation(obj);
          }
          v39 = *(__CFString **)(*((void *)&v111 + 1) + 8 * j);
          v40 = [v106 objectForKeyedSubscript:v39];
          v41 = [v31 objectForKeyedSubscript:v39];
          if (!v40 || ([v40 isEqual:v41] & 1) == 0)
          {
            if ([(__CFString *)v39 isEqualToString:@"AppleLanguages"])
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v41 count])
              {
                v42 = MigrationLogger();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  v43 = [v41 componentsJoinedByString:@", "];
                  *(_DWORD *)buf = 136315394;
                  v127 = "-[ISRootMigrator performMigration]";
                  __int16 v128 = 2114;
                  uint64_t v129 = (uint64_t)v43;
                  _os_log_impl(&dword_1BECA5000, v42, OS_LOG_TYPE_DEFAULT, "%s: [NSLocale setPreferredLanguages:@[ %{public}@ ]]", buf, 0x16u);

                  v31 = v103;
                }

                [MEMORY[0x1E4F1CA20] setPreferredLanguages:v41];
              }
            }
            else if ([(__CFString *)v39 isEqualToString:@"AppleLocale"])
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v41 length]) {
                [MEMORY[0x1E4F1CA20] setLocaleOnly:v41];
              }
            }
            else
            {
              v44 = MigrationLogger();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v127 = "-[ISRootMigrator performMigration]";
                __int16 v128 = 2114;
                uint64_t v129 = (uint64_t)v39;
                __int16 v130 = 2114;
                id v131 = v41;
                _os_log_impl(&dword_1BECA5000, v44, OS_LOG_TYPE_DEFAULT, "%s: CFPreferencesSetValue(%{public}@ → %{public}@)", buf, 0x20u);
              }

              CFPreferencesSetValue(v39, v41, v37, v102, v100);
              v31 = v103;
            }
          }
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v111 objects:v121 count:16];
      }
      while (v35);
    }

    uint64_t v45 = [v96 compare:@"17A450" options:64];
    if ([(ISMigrator *)v97 platform] == 2
      && (v45 == -1 || [(ISRootMigrator *)v97 isRestoreFromBackup]))
    {
      v46 = MigrationLogger();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v127 = "-[ISRootMigrator performMigration]";
        _os_log_impl(&dword_1BECA5000, v46, OS_LOG_TYPE_DEFAULT, "%s: Migrating to enable watch mirroring.", buf, 0xCu);
      }

      v47 = objc_opt_new();
      [v47 initializeMirrorSettings];
    }
    CFStringRef v48 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
    CFStringRef v49 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v50 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    v51 = (void *)CFPreferencesCopyValue(@"AppleLanguagesSchemaVersion", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v52 = [v51 unsignedIntegerValue];

    v53 = MigrationLogger();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v127 = "-[ISRootMigrator performMigration]";
      __int16 v128 = 2048;
      uint64_t v129 = v52;
      _os_log_impl(&dword_1BECA5000, v53, OS_LOG_TYPE_DEFAULT, "%s: AppleLanguagesSchemaVersion = %lu", buf, 0x16u);
    }

    v54 = (void *)CFPreferencesCopyValue(@"AppleLanguages", v48, v49, v50);
    v55 = (void *)CFPreferencesCopyValue(@"AppleLocale", v48, v49, v50);
    v56 = [MEMORY[0x1E4F1CA60] dictionary];
    v57 = v56;
    if (v54) {
      [v56 setObject:v54 forKeyedSubscript:@"AppleLanguages"];
    }
    if (v55) {
      [v57 setObject:v55 forKeyedSubscript:@"AppleLocale"];
    }
    v58 = +[ISMigrator migratorFromSchemaVersion:v52];
    v59 = [v58 performMigrationForPreferences:v57];
    v60 = (void *)[v59 mutableCopy];

    uint64_t v61 = [v60 objectForKeyedSubscript:@"AppleLanguages"];
    v101 = v60;
    if (v61
      && (v62 = (void *)v61,
          [v60 objectForKeyedSubscript:@"AppleLocale"],
          v63 = objc_claimAutoreleasedReturnValue(),
          v63,
          v62,
          v63))
    {
      v93 = v58;
      v94 = v54;
      v99 = v55;
      v64 = [(ISMigrator *)v97 previousVersion];
      v65 = [(ISMigrator *)v97 currentVersion];
      v66 = +[ISMigrator migratorFromVersion:v64 toVersion:v65];
      v120[0] = v66;
      v67 = +[ISMigrator migratorFromSchemaVersion:v52];
      v120[1] = v67;
      v68 = +[ISMigrator migratorFromSchemaVersion:v52];
      v120[2] = v68;
      uint64_t v69 = +[ISMigrator migratorFromSchemaVersion:v52];
      uint64_t v70 = v52;
      v71 = (void *)v69;
      v120[3] = v69;
      uint64_t v98 = v70;
      v72 = +[ISMigrator migratorFromSchemaVersion:](IP_advancedSettings_migrator, "migratorFromSchemaVersion:");
      v120[4] = v72;
      v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:5];

      v74 = MigrationLogger();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v127 = "-[ISRootMigrator performMigration]";
        __int16 v128 = 2114;
        uint64_t v129 = (uint64_t)v60;
        _os_log_impl(&dword_1BECA5000, v74, OS_LOG_TYPE_DEFAULT, "%s: Preferences before running preferences migrators: %{public}@", buf, 0x16u);
      }

      id v75 = v60;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v76 = v73;
      uint64_t v77 = [v76 countByEnumeratingWithState:&v107 objects:v119 count:16];
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = *(void *)v108;
        do
        {
          uint64_t v80 = 0;
          v81 = v75;
          do
          {
            if (*(void *)v108 != v79) {
              objc_enumerationMutation(v76);
            }
            id v75 = [*(id *)(*((void *)&v107 + 1) + 8 * v80) performMigrationForPreferences:v81];

            v82 = MigrationLogger();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              v83 = (objc_class *)objc_opt_class();
              v84 = NSStringFromClass(v83);
              *(_DWORD *)buf = 136315650;
              v127 = "-[ISRootMigrator performMigration]";
              __int16 v128 = 2114;
              uint64_t v129 = (uint64_t)v84;
              __int16 v130 = 2114;
              id v131 = v75;
              _os_log_impl(&dword_1BECA5000, v82, OS_LOG_TYPE_DEFAULT, "%s: Preferences after running <%{public}@>: %{public}@", buf, 0x20u);
            }
            ++v80;
            v81 = v75;
          }
          while (v78 != v80);
          uint64_t v78 = [v76 countByEnumeratingWithState:&v107 objects:v119 count:16];
        }
        while (v78);
      }

      v85 = [v75 objectForKeyedSubscript:@"AppleLanguages"];
      objc_opt_class();
      v7 = v95;
      v6 = v96;
      v86 = v97;
      uint64_t v52 = v98;
      v54 = v94;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [v85 count]
        && ([v94 isEqualToArray:v85] & 1) == 0)
      {
        v87 = MigrationLogger();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v127 = "-[ISRootMigrator performMigration]";
          __int16 v128 = 2114;
          uint64_t v129 = (uint64_t)v85;
          _os_log_impl(&dword_1BECA5000, v87, OS_LOG_TYPE_DEFAULT, "%s: AppleLanguages changed to %{public}@. Writing to disk.", buf, 0x16u);
        }

        [MEMORY[0x1E4F1CA20] setPreferredLanguages:v85];
      }
      v88 = [v75 objectForKeyedSubscript:@"AppleLocale"];
      objc_opt_class();
      v55 = v99;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [v88 length]
        && ([v99 isEqualToString:v88] & 1) == 0)
      {
        v89 = MigrationLogger();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v127 = "-[ISRootMigrator performMigration]";
          __int16 v128 = 2114;
          uint64_t v129 = (uint64_t)v88;
          _os_log_impl(&dword_1BECA5000, v89, OS_LOG_TYPE_DEFAULT, "%s: AppleLocale changed to %{public}@. Writing to disk.", buf, 0x16u);
        }

        [MEMORY[0x1E4F1CA20] setLocaleOnly:v88];
        v55 = v99;
      }

      v31 = v103;
      v58 = v93;
    }
    else
    {
      v76 = MigrationLogger();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v127 = "-[ISRootMigrator performMigration]";
        __int16 v128 = 2114;
        uint64_t v129 = (uint64_t)v54;
        __int16 v130 = 2114;
        id v131 = v55;
        _os_log_impl(&dword_1BECA5000, v76, OS_LOG_TYPE_DEFAULT, "%s: AppleLanguages (%{public}@) or AppleLocale (%{public}@) is nil. Skipping preferences migrators.", buf, 0x20u);
      }
      v86 = v97;
      v7 = v95;
      v6 = v96;
    }

    v90 = +[ISMigrator migratorFromSchemaVersion:v52];
    [v90 migrateOtherSystemSettings];

    if (v52 == 4000)
    {
      v91 = MigrationLogger();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v127 = "-[ISRootMigrator performMigration]";
        _os_log_impl(&dword_1BECA5000, v91, OS_LOG_TYPE_DEFAULT, "%s: AppleLanguagesSchemaVersion is up to date.", buf, 0xCu);
      }
    }
    else
    {
      [(ISRootMigrator *)v86 updateAppleLanguagesSchemaVersionToCurrent];
    }

    goto LABEL_109;
  }
  if ([(ISMigrator *)self platform] == 1 || ![(ISRootMigrator *)self isErase])
  {
    v15 = MigrationLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ISRootMigrator performMigration](v15);
    }
  }
  else
  {
    [(ISRootMigrator *)self updateAppleLanguagesSchemaVersionToCurrent];
  }
LABEL_109:

  return 1;
}

- (void)updateAppleLanguagesSchemaVersionToCurrent
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = MigrationLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[ISRootMigrator updateAppleLanguagesSchemaVersionToCurrent]";
    __int16 v8 = 2048;
    uint64_t v9 = 4000;
    _os_log_impl(&dword_1BECA5000, v2, OS_LOG_TYPE_DEFAULT, "%s: Updating AppleLanguagesSchemaVersion to %lu.", (uint8_t *)&v6, 0x16u);
  }

  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(@"AppleLanguagesSchemaVersion", &unk_1F19D8828, (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(v3, v4, v5);
}

- (id)performMigrationForUserPreferences:(id)a3 systemPreferences:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(ISMigrator *)self previousVersion];
  uint64_t v9 = [(ISMigrator *)self currentVersion];
  uint64_t v10 = (void *)[v6 mutableCopy];
  if ([(ISMigrator *)self platform] == 1 && [(ISMigrator *)self newUserAccount])
  {
    unint64_t v11 = MigrationLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      __int16 v86 = 2114;
      v87 = v8;
      __int16 v88 = 2114;
      v89 = v9;
      _os_log_impl(&dword_1BECA5000, v11, OS_LOG_TYPE_DEFAULT, "%s: (1) previousVersion=%{public}@, currentVersion=%{public}@ → Performing New User Account Migration", buf, 0x20u);
    }

    v12 = MigrationLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v7 objectForKeyedSubscript:@"AppleLanguages"];
      v14 = [v13 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 136315394;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      __int16 v86 = 2114;
      v87 = v14;
      _os_log_impl(&dword_1BECA5000, v12, OS_LOG_TYPE_DEFAULT, "%s: (1) System AppleLanguages= [ %{public}@ ]", buf, 0x16u);
    }
    v15 = MigrationLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v7 objectForKeyedSubscript:@"AppleLocale"];
      *(_DWORD *)buf = 136315394;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      __int16 v86 = 2114;
      v87 = v16;
      _os_log_impl(&dword_1BECA5000, v15, OS_LOG_TYPE_DEFAULT, "%s: (1) System AppleLocale= %{public}@", buf, 0x16u);
    }
    v17 = [v7 objectForKeyedSubscript:@"AppleLanguages"];
    [v10 setObject:v17 forKeyedSubscript:@"AppleLanguages"];

    v18 = [v7 objectForKeyedSubscript:@"AppleLocale"];
    [v10 setObject:v18 forKeyedSubscript:@"AppleLocale"];
    goto LABEL_69;
  }
  unint64_t v19 = [(ISMigrator *)self platform] - 1;
  if (v19 > 3) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = off_1E63BFC50[v19];
  }
  uint64_t v21 = MigrationLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
    __int16 v86 = 2114;
    v87 = v8;
    __int16 v88 = 2114;
    v89 = v9;
    __int16 v90 = 2114;
    v91 = v20;
    _os_log_impl(&dword_1BECA5000, v21, OS_LOG_TYPE_DEFAULT, "%s: (1) previousVersion=%{public}@, currentVersion=%{public}@, upgradeThreshold=%{public}@", buf, 0x2Au);
  }

  uint64_t v78 = v9;
  if ([v8 compare:v20 options:64] == -1
    && [v9 compare:v20 options:64] != -1)
  {
    uint64_t v22 = MigrationLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      __int16 v86 = 2114;
      v87 = v8;
      __int16 v88 = 2114;
      v89 = v9;
      __int16 v90 = 2114;
      v91 = v20;
      _os_log_impl(&dword_1BECA5000, v22, OS_LOG_TYPE_DEFAULT, "%s: (1) { %{public}@, %{public}@, %{public}@ } qualifies for AppleLanguages migration", buf, 0x2Au);
    }

    CFStringRef v23 = [v10 objectForKeyedSubscript:@"AppleLanguages"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v23 count])
    {
      CFStringRef v25 = MigrationLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
        _os_log_impl(&dword_1BECA5000, v25, OS_LOG_TYPE_DEFAULT, "%s: (1) current AppleLanguages is nil/empty; skipping migration",
          buf,
          0xCu);
      }
      goto LABEL_33;
    }
    CFStringRef v24 = v8;
    CFStringRef v25 = [(ISRootMigrator *)self importPreferredLanguagesForPreferences:v10];
    CFStringRef v26 = (void *)MEMORY[0x1E4F1CA20];
    v27 = [v10 objectForKeyedSubscript:@"AppleLocale"];
    CFStringRef v28 = [v26 localeWithLocaleIdentifier:v27];
    v29 = [v28 objectForKey:*MEMORY[0x1E4F1C400]];

    if (v29)
    {
      [(ISRootMigrator *)self appendRegionalVariantsToLanguageIdentifiers:v25 regionCode:v29];
      CFStringRef v25 = v30 = v25;
    }
    else
    {
      v30 = MigrationLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
          buf,
          0xCu);
      }
    }
    __int16 v8 = v24;

    [v10 setObject:v25 forKeyedSubscript:@"AppleLanguages"];
    if ([(ISMigrator *)self platform] == 1)
    {
      v31 = @"AppleUserLanguages";
    }
    else
    {
      if ([(ISMigrator *)self platform] != 2)
      {
LABEL_32:

        uint64_t v9 = v78;
LABEL_33:

        goto LABEL_34;
      }
      v31 = @"PreferredLanguages";
    }
    [v10 setObject:0 forKeyedSubscript:v31];
    goto LABEL_32;
  }
LABEL_34:
  v32 = [v10 objectForKeyedSubscript:@"AppleLanguages"];
  if ([v32 count] == 1)
  {
    v72 = v10;
    v74 = v8;
    id v75 = v7;
    id v76 = v6;
    v33 = (void *)MEMORY[0x1E4F1CA20];
    uint64_t v34 = [v32 firstObject];
    uint64_t v35 = [v33 localeWithLocaleIdentifier:v34];

    uint64_t v36 = [v35 languageCode];
    v73 = v35;
    uint64_t v77 = [v35 countryCode];
    CFStringRef v37 = [MEMORY[0x1E4F1CA20] baseSystemLanguages];
    v38 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v37, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v39 = v37;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v79 objects:v83 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v80 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v79 + 1) + 8 * i)];
          uint64_t v45 = [v44 languageCode];
          [v38 addObject:v45];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v79 objects:v83 count:16];
      }
      while (v41);
    }

    v46 = v36;
    uint64_t v47 = [v36 length];
    uint64_t v10 = v72;
    CFStringRef v48 = v77;
    if (v47)
    {
      if (([v38 containsObject:v46] & 1) == 0)
      {
        if ([v77 length])
        {
          CFStringRef v49 = (void *)MEMORY[0x1E4F28B50];
          CFStringRef v50 = [MEMORY[0x1E4F1CA20] baseSystemLanguages];
          v51 = [v49 preferredLocalizationsFromArray:v50 forPreferences:v32];
          uint64_t v52 = [v51 firstObject];
          int v53 = [v52 isEqualToString:@"en"];

          CFStringRef v48 = v77;
          if (v53)
          {
            v54 = [MEMORY[0x1E4F1CA20] languageFromLanguage:@"en" byReplacingRegion:v77];
            if ([v54 length])
            {
              v55 = MigrationLogger();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                v56 = [v32 componentsJoinedByString:@", "];
                *(_DWORD *)buf = 136315394;
                v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
                __int16 v86 = 2114;
                v87 = v56;
                _os_log_impl(&dword_1BECA5000, v55, OS_LOG_TYPE_DEFAULT, "%s: (2) AppleLanguages = [ %{public}@ ] qualifies for AppleLanguages repair", buf, 0x16u);
              }
              v57 = [v32 arrayByAddingObject:v54];
              [v72 setObject:v57 forKeyedSubscript:@"AppleLanguages"];

              v58 = MigrationLogger();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                log = v58;
                v59 = [v32 componentsJoinedByString:@", "];
                v60 = [v72 objectForKeyedSubscript:@"AppleLanguages"];
                uint64_t v61 = [v60 componentsJoinedByString:@", "];
                *(_DWORD *)buf = 136315650;
                v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
                __int16 v86 = 2114;
                v87 = v59;
                __int16 v88 = 2114;
                v89 = v61;
                _os_log_impl(&dword_1BECA5000, log, OS_LOG_TYPE_DEFAULT, "%s: (2) AppleLanguages = [ %{public}@ ] → [ %{public}@ ]", buf, 0x20u);

                v58 = log;
              }
            }
          }
        }
      }
    }

    id v7 = v75;
    id v6 = v76;
    __int16 v8 = v74;
    uint64_t v9 = v78;
  }

  v62 = [v10 objectForKeyedSubscript:@"AppleLanguages"];
  v18 = [v62 firstObject];

  v63 = [v10 objectForKeyedSubscript:@"AppleLocale"];
  if ([v18 length] && objc_msgSend(v63, "length"))
  {
    v64 = MigrationLogger();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      __int16 v86 = 2114;
      v87 = v63;
      _os_log_impl(&dword_1BECA5000, v64, OS_LOG_TYPE_DEFAULT, "%s: (3) AppleLocale = %{public}@", buf, 0x16u);
    }

    v65 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifier:v63 withNewLanguageIdentifier:v18];
    uint64_t v66 = [v65 length];
    v67 = MigrationLogger();
    BOOL v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
    if (v66)
    {
      if (v68)
      {
        uint64_t v69 = [v10 objectForKeyedSubscript:@"AppleLocale"];
        *(_DWORD *)buf = 136315650;
        v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
        __int16 v86 = 2114;
        v87 = v69;
        __int16 v88 = 2114;
        v89 = v65;
        _os_log_impl(&dword_1BECA5000, v67, OS_LOG_TYPE_DEFAULT, "%s: (3) AppleLocale = %{public}@ → %{public}@", buf, 0x20u);
      }
      [v10 setObject:v65 forKeyedSubscript:@"AppleLocale"];
    }
    else
    {
      if (v68)
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
        _os_log_impl(&dword_1BECA5000, v67, OS_LOG_TYPE_DEFAULT, "%s: (3) new AppleLocale is nil/empty; skipping migration",
          buf,
          0xCu);
      }
    }
    uint64_t v9 = v78;
  }
  else
  {
    v65 = MigrationLogger();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[ISRootMigrator performMigrationForUserPreferences:systemPreferences:]";
      _os_log_impl(&dword_1BECA5000, v65, OS_LOG_TYPE_DEFAULT, "%s: (3) current AppleLanguages or AppleLocale is nil/empty; skipping migration",
        buf,
        0xCu);
    }
  }

LABEL_69:
  return v10;
}

- (id)performMigrationForPreferences:(id)a3
{
  return [(ISRootMigrator *)self performMigrationForUserPreferences:a3 systemPreferences:0];
}

- (id)appendRegionalVariantsToLanguageIdentifiers:(id)a3 regionCode:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v37 = v5;
    obuint64_t j = v5;
    uint64_t v40 = (void *)v7;
    id v41 = v6;
    __int16 v8 = (void *)v7;
    uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (!v43) {
      goto LABEL_16;
    }
    uint64_t v9 = *(void *)v45;
    uint64_t v10 = *MEMORY[0x1E4F1C400];
    unint64_t v11 = 0x1E4F1C000uLL;
    uint64_t v38 = *MEMORY[0x1E4F1C400];
    uint64_t v39 = *(void *)v45;
    while (1)
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(*((void *)&v44 + 1) + 8 * i);
        v14 = [*(id *)(v11 + 2592) componentsFromLocaleIdentifier:v13];
        id v15 = v6;
        uint64_t v16 = [*(id *)(v11 + 2592) languageFromLanguage:v13 byReplacingRegion:v6];
        v17 = [v14 objectForKeyedSubscript:v10];

        if (!v17)
        {
          v18 = v13;
          id v13 = v16;
LABEL_13:
          CFStringRef v26 = v8;
          goto LABEL_14;
        }
        v18 = [*(id *)(v11 + 2592) baseLanguageFromLanguage:v13];
        if (![v18 length]) {
          goto LABEL_13;
        }
        unint64_t v19 = (void *)MEMORY[0x1E4F28B50];
        v49[0] = v18;
        v49[1] = v13;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
        CFStringRef v48 = v16;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
        uint64_t v22 = [v19 preferredLocalizationsFromArray:v20 forPreferences:v21];
        CFStringRef v23 = [v22 firstObject];
        int v24 = [v23 isEqualToString:v13];

        if (v24)
        {
          id v25 = v16;

          id v13 = v25;
        }
        CFStringRef v26 = v40;
        id v15 = v41;
        uint64_t v10 = v38;
        uint64_t v9 = v39;
LABEL_14:

        __int16 v8 = v26;
        [v26 addObject:v13];

        unint64_t v11 = 0x1E4F1C000;
        id v6 = v15;
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (!v43)
      {
LABEL_16:

        v27 = MigrationLogger();
        CFStringRef v28 = v8;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [obj componentsJoinedByString:@", "];
          v30 = [v28 array];
          v31 = [v30 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 136315906;
          uint64_t v52 = "-[ISRootMigrator appendRegionalVariantsToLanguageIdentifiers:regionCode:]";
          __int16 v53 = 2114;
          id v54 = v41;
          __int16 v55 = 2114;
          v56 = v29;
          __int16 v57 = 2114;
          v58 = v31;
          _os_log_impl(&dword_1BECA5000, v27, OS_LOG_TYPE_DEFAULT, "%s: regionCode=%{public}@, preferredLanguages = [ %{public}@ ] → [ %{public}@ ]", buf, 0x2Au);

          CFStringRef v28 = v40;
          id v6 = v41;
        }

        id v32 = [v28 array];

        id v5 = v37;
        goto LABEL_22;
      }
    }
  }
  v33 = MigrationLogger();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = [v5 componentsJoinedByString:@", "];
    uint64_t v35 = [v5 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136315906;
    uint64_t v52 = "-[ISRootMigrator appendRegionalVariantsToLanguageIdentifiers:regionCode:]";
    __int16 v53 = 2114;
    id v54 = 0;
    __int16 v55 = 2114;
    v56 = v34;
    __int16 v57 = 2114;
    v58 = v35;
    _os_log_impl(&dword_1BECA5000, v33, OS_LOG_TYPE_DEFAULT, "%s: regionCode=%{public}@, preferredLanguages = [ %{public}@ ] → [ %{public}@ ]", buf, 0x2Au);
  }
  id v32 = v5;
LABEL_22:

  return v32;
}

- (id)importPreferredLanguagesForPreferences:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ISMigrator *)self previousVersion];
  id v6 = [v4 objectForKeyedSubscript:@"AppleLanguages"];
  if ([(ISMigrator *)self platform] == 1)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"AppleUserLanguages"];
    if (v7)
    {
      __int16 v8 = MigrationLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
        _os_log_impl(&dword_1BECA5000, v8, OS_LOG_TYPE_DEFAULT, "%s: Possible upgrade from macOS 10.9", buf, 0xCu);
      }

      uint64_t v9 = @"10.9";
      if ([v5 compare:@"10.9" options:64] != -1
        && [v5 compare:@"10.10" options:64] == -1)
      {
        uint64_t v10 = MigrationLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
          _os_log_impl(&dword_1BECA5000, v10, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from macOS 10.9", buf, 0xCu);
        }

        id v11 = [(ISRootMigrator *)self importPreferredLanguages_macOS_10_9_forPreferences:v4];
LABEL_20:
        id v16 = v11;
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v9 = @"10.9";
    }
  }
  else
  {
    if ([(ISMigrator *)self platform] != 2) {
      goto LABEL_24;
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"PreferredLanguages"];
    if (v7 || [v6 count] == 1)
    {
      v12 = MigrationLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
        _os_log_impl(&dword_1BECA5000, v12, OS_LOG_TYPE_DEFAULT, "%s: Possible upgrade from iOS 8", buf, 0xCu);
      }

      uint64_t v9 = @"12A";
      if ([v5 compare:@"12A" options:64] != -1
        && [v5 compare:@"13A" options:64] == -1)
      {
        id v13 = MigrationLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v6 componentsJoinedByString:@", "];
          id v15 = [v6 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 136315650;
          v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
          __int16 v28 = 2114;
          v29 = v14;
          __int16 v30 = 2114;
          v31 = v15;
          _os_log_impl(&dword_1BECA5000, v13, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from iOS 8; preferredLanguages = [ %{public}@ ] → [ %{public}@ ]",
            buf,
            0x20u);
        }
        id v11 = v6;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v9 = @"12A";
    }
  }

  if ([v5 compare:v9 options:64] == -1 && objc_msgSend(v6, "count"))
  {
    uint64_t v20 = [v6 objectAtIndexedSubscript:0];
    uint64_t v21 = +[IntlUtility normalizedLanguageIDFromString:v20];
    id v25 = v21;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];

    uint64_t v7 = MigrationLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v6 componentsJoinedByString:@", "];
      CFStringRef v23 = [v16 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 136315650;
      v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
      __int16 v28 = 2114;
      v29 = v22;
      __int16 v30 = 2114;
      v31 = v23;
      _os_log_impl(&dword_1BECA5000, v7, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from pre-{ macOS 10.9, iOS 8 }; preferredLanguages = [ %{public}@ ] → [ %{public}@ ]",
        buf,
        0x20u);
    }
    goto LABEL_30;
  }
LABEL_24:
  v17 = MigrationLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v6 componentsJoinedByString:@", "];
    unint64_t v19 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136315650;
    v27 = "-[ISRootMigrator importPreferredLanguagesForPreferences:]";
    __int16 v28 = 2114;
    v29 = v18;
    __int16 v30 = 2114;
    v31 = v19;
    _os_log_impl(&dword_1BECA5000, v17, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from post-{ macOS 10.9, iOS 8 }; preferredLanguages = [ %{public}@ ] → [ %{public}@ ]",
      buf,
      0x20u);
  }
  id v16 = v6;
LABEL_31:

  return v16;
}

- (id)importPreferredLanguages_macOS_10_9_forPreferences:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v3 objectForKeyedSubscript:@"AppleLanguages"];
  int v24 = v3;
  id v6 = [v3 objectForKeyedSubscript:@"AppleUserLanguages"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v7 = [v6 unsignedIntegerValue];
    __int16 v8 = MigrationLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      CFStringRef v26 = "-[ISRootMigrator importPreferredLanguages_macOS_10_9_forPreferences:]";
      __int16 v27 = 1024;
      LODWORD(v28) = v7;
      _os_log_impl(&dword_1BECA5000, v8, OS_LOG_TYPE_DEFAULT, "%s: preferredLanguagesIndex=%u", buf, 0x12u);
    }

    if (v7 && v7 <= [v5 count])
    {
      uint64_t v9 = objc_msgSend(v5, "subarrayWithRange:", 0, v7);
      [v4 addObjectsFromArray:v9];
    }
  }
  if (![v4 count] && objc_msgSend(v5, "count"))
  {
    uint64_t v10 = [v5 objectAtIndexedSubscript:0];
    v31[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [v4 setArray:v11];
  }
  CFStringRef v23 = v5;
  uint64_t v12 = [v4 count];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t i = 0; i != v13; ++i)
    {
      id v15 = [v4 objectAtIndexedSubscript:i];
      id v16 = +[IntlUtility normalizedLanguageIDFromString:v15];

      v17 = MigrationLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v4 objectAtIndexedSubscript:i];
        *(_DWORD *)buf = 136315650;
        CFStringRef v26 = "-[ISRootMigrator importPreferredLanguages_macOS_10_9_forPreferences:]";
        __int16 v27 = 2114;
        __int16 v28 = v18;
        __int16 v29 = 2114;
        __int16 v30 = v16;
        _os_log_impl(&dword_1BECA5000, v17, OS_LOG_TYPE_DEFAULT, "%s: Normalizing %{public}@ → %{public}@", buf, 0x20u);
      }
      [v4 setObject:v16 atIndexedSubscript:i];
    }
  }
  unint64_t v19 = MigrationLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [v23 componentsJoinedByString:@", "];
    uint64_t v21 = [v4 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136315650;
    CFStringRef v26 = "-[ISRootMigrator importPreferredLanguages_macOS_10_9_forPreferences:]";
    __int16 v27 = 2114;
    __int16 v28 = v20;
    __int16 v29 = 2114;
    __int16 v30 = v21;
    _os_log_impl(&dword_1BECA5000, v19, OS_LOG_TYPE_DEFAULT, "%s: Upgrade from macOS 10.9; preferredLanguages = [ %{public}@ ] → [ %{public}@ ]",
      buf,
      0x20u);
  }
  return v4;
}

- (BOOL)isErase
{
  return self->_isErase;
}

- (void)setIsErase:(BOOL)a3
{
  self->_isErase = a3;
}

- (BOOL)isRestoreFromBackup
{
  return self->_isRestoreFromBackup;
}

- (void)setIsRestoreFromBackup:(BOOL)a3
{
  self->_isRestoreFromBackup = a3;
}

- (void)performMigration
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ISRootMigrator performMigration]";
  _os_log_fault_impl(&dword_1BECA5000, log, OS_LOG_TYPE_FAULT, "%s: failed to retrieve currentVersion; bailing...",
    (uint8_t *)&v1,
    0xCu);
}

@end