@interface RegistrationDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (id)dataClassName;
@end

@implementation RegistrationDataMigrator

- (id)dataClassName
{
  return @"facetime-registration";
}

- (BOOL)performMigration
{
  uint64_t v155 = *MEMORY[0x263EF8340];
  if ([(DataClassMigrator *)self didRestoreFromBackup])
  {
    CFPreferencesSetAppValue(@"restoredFromBackup", &unk_26F34D9A8, @"com.apple.conference");
    CFPreferencesAppSynchronize(@"com.apple.conference");
  }
  id v2 = objc_alloc_init(MEMORY[0x263EFB210]);
  uint64_t v3 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAF20]];
  uint64_t v4 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAF60]];
  uint64_t v5 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAEB8]];
  v88 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAE60]];
  v89 = (void *)v3;
  v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, 0);
  v86 = (void *)v5;
  v87 = (void *)v4;
  v91 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, v5, 0);
  v7 = [MEMORY[0x263F4A860] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v150 = v6;
    _os_log_impl(&dword_23F846000, v7, OS_LOG_TYPE_DEFAULT, "Account types to cleanup: %@", buf, 0xCu);
  }

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  obuint64_t j = v6;
  uint64_t v96 = [obj countByEnumeratingWithState:&v138 objects:v154 count:16];
  if (v96)
  {
    id v94 = *(id *)v139;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(id *)v139 != v94) {
          objc_enumerationMutation(obj);
        }
        uint64_t v98 = v8;
        v9 = *(NSObject **)(*((void *)&v138 + 1) + 8 * v8);
        v10 = [MEMORY[0x263F4A860] registration];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v150 = v9;
          _os_log_impl(&dword_23F846000, v10, OS_LOG_TYPE_DEFAULT, "  Cleaning up type: %@", buf, 0xCu);
        }

        v11 = [v2 accountsWithAccountType:v9];
        id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v134 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v134 objects:v153 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v135;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v135 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v134 + 1) + 8 * i);
              v19 = [v18 username];
              uint64_t v20 = [v19 length];

              if (!v20)
              {
                v21 = [MEMORY[0x263F4A860] registration];
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = [v18 username];
                  *(_DWORD *)buf = 138412546;
                  v150 = v22;
                  __int16 v151 = 2112;
                  v152 = v18;
                  _os_log_impl(&dword_23F846000, v21, OS_LOG_TYPE_DEFAULT, "  Queueing account with username: %@  (%@)", buf, 0x16u);
                }
                [v12 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v134 objects:v153 count:16];
          }
          while (v15);
        }

        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id v23 = v12;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v130 objects:v148 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v131;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v131 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(NSObject **)(*((void *)&v130 + 1) + 8 * j);
              v29 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v150 = v28;
                _os_log_impl(&dword_23F846000, v29, OS_LOG_TYPE_DEFAULT, "  Deleting account: %@", buf, 0xCu);
              }

              [v2 removeAccount:v28 withCompletionHandler:&unk_26F34D7B8];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v130 objects:v148 count:16];
          }
          while (v25);
        }

        uint64_t v8 = v98 + 1;
      }
      while (v98 + 1 != v96);
      uint64_t v96 = [obj countByEnumeratingWithState:&v138 objects:v154 count:16];
    }
    while (v96);
  }

  v30 = [MEMORY[0x263F4A860] registration];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v150 = v91;
    _os_log_impl(&dword_23F846000, v30, OS_LOG_TYPE_DEFAULT, "Account types to delete: %@", buf, 0xCu);
  }

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  v95 = v91;
  uint64_t v99 = [v95 countByEnumeratingWithState:&v126 objects:v147 count:16];
  if (v99)
  {
    uint64_t v97 = *(void *)v127;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v127 != v97) {
          objc_enumerationMutation(v95);
        }
        uint64_t v101 = v31;
        v32 = *(NSObject **)(*((void *)&v126 + 1) + 8 * v31);
        v33 = [MEMORY[0x263F4A860] registration];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v150 = v32;
          _os_log_impl(&dword_23F846000, v33, OS_LOG_TYPE_DEFAULT, "  Deleting type: %@", buf, 0xCu);
        }

        v34 = [v2 accountsWithAccountType:v32];
        id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v36 = v34;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v122 objects:v146 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v123;
          do
          {
            for (uint64_t k = 0; k != v38; ++k)
            {
              if (*(void *)v123 != v39) {
                objc_enumerationMutation(v36);
              }
              v41 = *(NSObject **)(*((void *)&v122 + 1) + 8 * k);
              v42 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v150 = v41;
                _os_log_impl(&dword_23F846000, v42, OS_LOG_TYPE_DEFAULT, "  Queued account to delete: %@", buf, 0xCu);
              }

              [v35 addObject:v41];
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v122 objects:v146 count:16];
          }
          while (v38);
        }

        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id v43 = v35;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v118 objects:v145 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v119;
          do
          {
            for (uint64_t m = 0; m != v45; ++m)
            {
              if (*(void *)v119 != v46) {
                objc_enumerationMutation(v43);
              }
              v48 = *(NSObject **)(*((void *)&v118 + 1) + 8 * m);
              v49 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v150 = v48;
                _os_log_impl(&dword_23F846000, v49, OS_LOG_TYPE_DEFAULT, "  Deleting account: %@", buf, 0xCu);
              }

              [v2 removeAccount:v48 withCompletionHandler:&unk_26F34D7D8];
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v118 objects:v145 count:16];
          }
          while (v45);
        }

        uint64_t v31 = v101 + 1;
      }
      while (v101 + 1 != v99);
      uint64_t v99 = [v95 countByEnumeratingWithState:&v126 objects:v147 count:16];
    }
    while (v99);
  }

  v50 = v89;
  if (!v89)
  {
    v51 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F846000, v51, OS_LOG_TYPE_DEFAULT, "Didn't get an account type for IDS account, bailing...", buf, 2u);
    }
    goto LABEL_118;
  }
  v51 = [v2 accountsWithAccountType:v89];
  if (!v88)
  {
    v53 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F846000, v53, OS_LOG_TYPE_DEFAULT, "Didn't get an account type for Apple ID account", buf, 2u);
    }
LABEL_94:

    goto LABEL_95;
  }
  v52 = objc_msgSend(v2, "accountsWithAccountType:");
  if (v52)
  {
    v53 = v52;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    uint64_t v104 = [v52 countByEnumeratingWithState:&v114 objects:v144 count:16];
    if (v104)
    {
      uint64_t v100 = *(void *)v115;
      v102 = v51;
      v92 = v53;
      do
      {
        for (uint64_t n = 0; n != v104; ++n)
        {
          if (*(void *)v115 != v100) {
            objc_enumerationMutation(v92);
          }
          v55 = *(NSObject **)(*((void *)&v114 + 1) + 8 * n);
          v56 = [MEMORY[0x263F4A860] registration];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v150 = v55;
            _os_log_impl(&dword_23F846000, v56, OS_LOG_TYPE_DEFAULT, "Checking %@", buf, 0xCu);
          }

          v57 = [v55 username];
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          v58 = v51;
          uint64_t v59 = [v58 countByEnumeratingWithState:&v110 objects:v143 count:16];
          if (v59)
          {
            uint64_t v60 = v59;
            uint64_t v61 = *(void *)v111;
            while (2)
            {
              for (iuint64_t i = 0; ii != v60; ++ii)
              {
                if (*(void *)v111 != v61) {
                  objc_enumerationMutation(v58);
                }
                v63 = *(void **)(*((void *)&v110 + 1) + 8 * ii);
                v64 = [v63 username];
                if (IMAreEmailsLogicallyTheSame())
                {
                  v65 = [v63 accountProperties];
                  v66 = [v65 objectForKey:@"profileID"];
                  if (![v66 length])
                  {
                    v90 = v65;
                    v67 = [v55 accountProperties];
                    v68 = [v67 objectForKey:@"profileID"];

                    v69 = [v55 accountProperties];
                    v70 = [v69 objectForKey:@"dsid"];

                    [v63 setAccountProperty:v68 forKey:@"profileID"];
                    [v63 setAccountProperty:v70 forKey:@"dsid"];
                    v71 = [MEMORY[0x263F4A860] registration];
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v150 = v68;
                      _os_log_impl(&dword_23F846000, v71, OS_LOG_TYPE_DEFAULT, "Didn't find a profileID on the account, updating with value from the AppleID account %@", buf, 0xCu);
                    }

                    v109[0] = MEMORY[0x263EF8330];
                    v109[1] = 3221225472;
                    v109[2] = sub_23F848598;
                    v109[3] = &unk_2650729D0;
                    v109[4] = v63;
                    [v2 saveVerifiedAccount:v63 withCompletionHandler:v109];

                    v65 = v90;
                  }

                  goto LABEL_87;
                }
              }
              uint64_t v60 = [v58 countByEnumeratingWithState:&v110 objects:v143 count:16];
              if (v60) {
                continue;
              }
              break;
            }
          }
LABEL_87:

          v51 = v102;
        }
        v53 = v92;
        uint64_t v104 = [v92 countByEnumeratingWithState:&v114 objects:v144 count:16];
      }
      while (v104);
    }
    goto LABEL_94;
  }
LABEL_95:
  v72 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAE58]];
  if (v72)
  {
    [v2 accountsWithAccountType:v72];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v73 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v74 = [v73 countByEnumeratingWithState:&v105 objects:v142 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      v103 = v51;
      uint64_t v76 = *(void *)v106;
      while (2)
      {
        for (juint64_t j = 0; jj != v75; ++jj)
        {
          if (*(void *)v106 != v76) {
            objc_enumerationMutation(v73);
          }
          v78 = *(void **)(*((void *)&v105 + 1) + 8 * jj);
          v79 = [v78 accountPropertyForKey:@"primaryAccount"];
          int v80 = [v79 BOOLValue];

          if (v80)
          {
            v81 = [v78 username];
            v82 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v150 = v81;
              _os_log_impl(&dword_23F846000, v82, OS_LOG_TYPE_DEFAULT, "Found iCloud account with username %@", buf, 0xCu);
            }

            goto LABEL_108;
          }
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v105 objects:v142 count:16];
        if (v75) {
          continue;
        }
        break;
      }
      v81 = 0;
LABEL_108:
      v51 = v103;
    }
    else
    {
      v81 = 0;
    }

    if ([v81 length])
    {
      v83 = [MEMORY[0x263F4A860] registration];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v150 = v81;
        _os_log_impl(&dword_23F846000, v83, OS_LOG_TYPE_DEFAULT, "Kicking sign in with: %@", buf, 0xCu);
      }

      IDSiCloudSignIn();
    }
  }
  else
  {
    v81 = [MEMORY[0x263F4A860] registration];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F846000, v81, OS_LOG_TYPE_DEFAULT, "Didn't get an account type for iCloud account, bailing...", buf, 2u);
    }
  }

  v50 = v89;
LABEL_118:

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, @"FaceTimeRegistrationRestoredFromBackupNotification", 0, 0, 1uLL);

  return 1;
}

- (float)estimatedDuration
{
  return 1.0;
}

@end