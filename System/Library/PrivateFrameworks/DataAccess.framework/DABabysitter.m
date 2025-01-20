@interface DABabysitter
+ (id)sharedBabysitter;
- (BOOL)accountShouldContinue:(id)a3;
- (BOOL)accountWithIDShouldContinue:(id)a3;
- (BOOL)registerAccount:(id)a3 forOperationWithName:(id)a4;
- (DABabysitter)init;
- (NSMutableDictionary)failedWaiters;
- (NSMutableDictionary)refreshingWaiters;
- (NSMutableDictionary)restrictedWaiters;
- (NSString)buildVersion;
- (id)_init;
- (void)_decrementRefreshCountForWaiter:(id)a3 forOperationWithName:(id)a4;
- (void)_decrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4;
- (void)_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4;
- (void)_reloadBabysitterProperties;
- (void)giveAccountWithIDAnotherChance:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setFailedWaiters:(id)a3;
- (void)setRefreshingWaiters:(id)a3;
- (void)setRestrictedWaiters:(id)a3;
- (void)unregisterAccount:(id)a3 forOperationWithName:(id)a4;
@end

@implementation DABabysitter

+ (id)sharedBabysitter
{
  if (sharedBabysitter_onceToken != -1) {
    dispatch_once(&sharedBabysitter_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedBabysitter_sBabysitter;
  return v2;
}

uint64_t __32__DABabysitter_sharedBabysitter__block_invoke()
{
  sharedBabysitter_sBabysitter = [[DABabysitter alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (void)_reloadBabysitterProperties
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  if (DAIsRunningInDataAccessD())
  {
    CFPreferencesAppSynchronize(@"com.apple.dataaccess.babysitter");
    v3 = (NSString *)MGCopyAnswer();
    buildVersiouint64_t n = self->_buildVersion;
    self->_buildVersiouint64_t n = v3;

    CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"LastSystemVersion", @"com.apple.dataaccess.babysitter");
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ![(NSString *)self->_buildVersion isEqualToString:v5])
      {
        v6 = DALoggingwithCategory();
        os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
        if (os_log_type_enabled(v6, v7))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BA384000, v6, v7, "Babysitter: The OS version is different. Giving all accounts a second chance at life.", buf, 2u);
        }

        CFPreferencesSetAppValue(@"LastSystemVersion", 0, @"com.apple.dataaccess.babysitter");
        CFPreferencesSetAppValue(@"RestrictedWaiters", 0, @"com.apple.dataaccess.babysitter");
        CFPreferencesSetAppValue(@"RefreshingWaiters", 0, @"com.apple.dataaccess.babysitter");
        CFPreferencesSetAppValue(@"FailedWaiters", 0, @"com.apple.dataaccess.babysitter");
        CFPreferencesAppSynchronize(@"com.apple.dataaccess.babysitter");
      }
    }
    v8 = (NSMutableDictionary *)objc_opt_new();
    refreshingWaiters = self->_refreshingWaiters;
    self->_refreshingWaiters = v8;

    v103 = self;
    v95 = (void *)CFPreferencesCopyAppValue(@"RefreshingWaiters", @"com.apple.dataaccess.babysitter");
    if (v95)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        v10 = [v95 allKeys];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v132 objects:v150 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v133;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v133 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v132 + 1) + 8 * i);
              v16 = [v95 objectForKeyedSubscript:v15];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = (void *)[v16 mutableCopy];
                [(NSMutableDictionary *)v103->_refreshingWaiters setObject:v17 forKeyedSubscript:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v132 objects:v150 count:16];
          }
          while (v12);
        }

        self = v103;
      }
    }
    CFPropertyListRef v18 = CFPreferencesCopyAppValue(@"FailedWaiters", @"com.apple.dataaccess.babysitter");
    v94 = (void *)v18;
    if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v20 = (NSMutableDictionary *)objc_opt_new();
      failedWaiters = self->_failedWaiters;
      self->_failedWaiters = v20;

      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      v22 = [v19 allKeys];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v128 objects:v149 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v129;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v129 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v128 + 1) + 8 * j);
            v28 = [v19 objectForKeyedSubscript:v27];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v29 = (void *)[v28 mutableCopy];
              [(NSMutableDictionary *)v103->_failedWaiters setObject:v29 forKeyedSubscript:v27];

              v19 = v94;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v128 objects:v149 count:16];
        }
        while (v24);
        self = v103;
      }
    }
    else
    {
      v30 = (NSMutableDictionary *)objc_opt_new();
      v22 = self->_failedWaiters;
      self->_failedWaiters = v30;
    }

    CFPropertyListRef v31 = CFPreferencesCopyAppValue(@"RestrictedWaiters", @"com.apple.dataaccess.babysitter");
    v92 = (void *)v31;
    if (v31 && (v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      v33 = (NSMutableDictionary *)[v32 mutableCopy];
    }
    else {
      v33 = (NSMutableDictionary *)objc_opt_new();
    }
    restrictedWaiters = self->_restrictedWaiters;
    self->_restrictedWaiters = v33;
    v93 = (void *)v5;

    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    obuint64_t j = [(NSMutableDictionary *)self->_refreshingWaiters allKeys];
    uint64_t v99 = [obj countByEnumeratingWithState:&v124 objects:v148 count:16];
    if (v99)
    {
      uint64_t v97 = *(void *)v125;
      os_log_type_t v35 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v125 != v97) {
            objc_enumerationMutation(obj);
          }
          uint64_t v101 = v36;
          uint64_t v37 = *(void *)(*((void *)&v124 + 1) + 8 * v36);
          v38 = [(NSMutableDictionary *)v103->_refreshingWaiters objectForKeyedSubscript:v37];
          *(void *)type = v37;
          v39 = [(NSMutableDictionary *)v103->_failedWaiters objectForKeyedSubscript:v37];
          if (!v39)
          {
            v39 = [MEMORY[0x1E4F1CA60] dictionary];
            [(NSMutableDictionary *)v103->_failedWaiters setObject:v39 forKeyedSubscript:v37];
          }
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          id v40 = v38;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v120 objects:v147 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v121;
            do
            {
              for (uint64_t k = 0; k != v42; ++k)
              {
                if (*(void *)v121 != v43) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v45 = *(void *)(*((void *)&v120 + 1) + 8 * k);
                v46 = [v39 objectForKeyedSubscript:v45];
                v47 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v46, "intValue") + 1);
                [v39 setObject:v47 forKeyedSubscript:v45];
                v48 = DALoggingwithCategory();
                if (os_log_type_enabled(v48, v35))
                {
                  int v49 = [v46 intValue];
                  *(_DWORD *)buf = 138412802;
                  *(void *)v144 = *(void *)type;
                  *(_WORD *)&v144[8] = 1024;
                  *(_DWORD *)&v144[10] = v49;
                  __int16 v145 = 2112;
                  uint64_t v146 = v45;
                  _os_log_impl(&dword_1BA384000, v48, v35, "Babysitter: Noting that waiter %@ failed %d times for operation %@", buf, 0x1Cu);
                }
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v120 objects:v147 count:16];
            }
            while (v42);
          }

          uint64_t v36 = v101 + 1;
        }
        while (v101 + 1 != v99);
        uint64_t v99 = [obj countByEnumeratingWithState:&v124 objects:v148 count:16];
      }
      while (v99);
    }

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    v50 = v103;
    v102 = [(NSMutableDictionary *)v103->_failedWaiters allKeys];
    uint64_t v51 = [v102 countByEnumeratingWithState:&v116 objects:v142 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v117;
      uint64_t v98 = *(void *)v117;
      do
      {
        uint64_t v54 = 0;
        uint64_t v100 = v52;
        do
        {
          if (*(void *)v117 != v53) {
            objc_enumerationMutation(v102);
          }
          *(void *)typea = *(void *)(*((void *)&v116 + 1) + 8 * v54);
          v55 = -[NSMutableDictionary objectForKeyedSubscript:](v50->_failedWaiters, "objectForKeyedSubscript:");
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v104 = v54;
            long long v114 = 0u;
            long long v115 = 0u;
            long long v112 = 0u;
            long long v113 = 0u;
            v56 = [v55 allKeys];
            uint64_t v57 = [v56 countByEnumeratingWithState:&v112 objects:v141 count:16];
            if (v57)
            {
              uint64_t v58 = v57;
              uint64_t v59 = *(void *)v113;
              do
              {
                for (uint64_t m = 0; m != v58; ++m)
                {
                  if (*(void *)v113 != v59) {
                    objc_enumerationMutation(v56);
                  }
                  uint64_t v61 = *(void *)(*((void *)&v112 + 1) + 8 * m);
                  v62 = [v55 objectForKeyedSubscript:v61];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v63 = [v62 intValue];
                    if ((int)v63 >= 3)
                    {
                      uint64_t v64 = v63;
                      v65 = [(NSMutableDictionary *)v50->_restrictedWaiters objectForKeyedSubscript:*(void *)typea];

                      if (!v65)
                      {
                        v139 = @"failedOp";
                        uint64_t v140 = v61;
                        v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
                        AnalyticsSendEvent();

                        v67 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(arc4random() % 0x384 + 3598 * v64)];
                        if (([MEMORY[0x1E4F5E940] babysitterEnabled] & 1) == 0)
                        {
                          uint64_t v68 = [MEMORY[0x1E4F1C9C8] distantPast];

                          v67 = (void *)v68;
                        }
                        v137[0] = @"RestrictionTimeout";
                        v69 = NSNumber;
                        [v67 timeIntervalSinceReferenceDate];
                        v70 = objc_msgSend(v69, "numberWithDouble:");
                        v138[0] = v70;
                        v137[1] = @"NumFailures";
                        v71 = [NSNumber numberWithInt:v64];
                        v138[1] = v71;
                        v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:v137 count:2];

                        [(NSMutableDictionary *)v103->_restrictedWaiters setValue:v72 forKey:*(void *)typea];
                        v50 = v103;
                      }
                    }
                  }
                }
                uint64_t v58 = [v56 countByEnumeratingWithState:&v112 objects:v141 count:16];
              }
              while (v58);
            }

            uint64_t v53 = v98;
            uint64_t v52 = v100;
            uint64_t v54 = v104;
          }

          ++v54;
        }
        while (v54 != v52);
        uint64_t v52 = [v102 countByEnumeratingWithState:&v116 objects:v142 count:16];
      }
      while (v52);
    }

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v73 = v50->_restrictedWaiters;
    uint64_t v74 = [(NSMutableDictionary *)v73 countByEnumeratingWithState:&v108 objects:v136 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v109;
      os_log_type_t typeb = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      do
      {
        for (uint64_t n = 0; n != v75; ++n)
        {
          if (*(void *)v109 != v76) {
            objc_enumerationMutation(v73);
          }
          uint64_t v78 = *(void *)(*((void *)&v108 + 1) + 8 * n);
          v79 = [(NSMutableDictionary *)v103->_restrictedWaiters objectForKeyedSubscript:v78];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v80 = [v79 objectForKeyedSubscript:@"NumFailures"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v81 = [MEMORY[0x1E4F5E940] babysitterEnabled];
              v82 = DALoggingwithCategory();
              BOOL v83 = os_log_type_enabled(v82, typeb);
              if (v81)
              {
                if (v83)
                {
                  int v84 = [v80 intValue];
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v144 = v84;
                  *(_WORD *)&v144[4] = 2112;
                  *(void *)&v144[6] = v78;
                  v85 = v82;
                  os_log_type_t v86 = typeb;
                  v87 = "===================\n"
                        "\n"
                        "\n"
                        "\n"
                        "Babysitter: You're once, twice, %d times a failure. Disabling account with ID %@ until it stops "
                        "crashing. Please file a bug for any dataaccessd crashes you find.\n"
                        "\n"
                        "\n"
                        "===================\n";
                  goto LABEL_89;
                }
              }
              else if (v83)
              {
                int v88 = [v80 intValue];
                *(_DWORD *)buf = 138412546;
                *(void *)v144 = v78;
                *(_WORD *)&v144[8] = 1024;
                *(_DWORD *)&v144[10] = v88;
                v85 = v82;
                os_log_type_t v86 = typeb;
                v87 = "===================\n"
                      "\n"
                      "\n"
                      "\n"
                      "Babysitter: Waiter %@ has crashed %d times now. Since you have the babysitter disabled, we're goin"
                      "g to assume you know what you're doing and not disable the waiter. Consider yourself warned.\n"
                      "\n"
                      "\n"
                      "===================\n";
LABEL_89:
                _os_log_impl(&dword_1BA384000, v85, v86, v87, buf, 0x12u);
              }
            }
          }
        }
        uint64_t v75 = [(NSMutableDictionary *)v73 countByEnumeratingWithState:&v108 objects:v136 count:16];
      }
      while (v75);
    }

    [(NSMutableDictionary *)v103->_refreshingWaiters removeAllObjects];
    if ([(NSMutableDictionary *)v103->_restrictedWaiters count])
    {
      v89 = DALoggingwithCategory();
      os_log_type_t v90 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
      if (os_log_type_enabled(v89, v90))
      {
        v91 = v103->_restrictedWaiters;
        *(_DWORD *)buf = 138412290;
        *(void *)v144 = v91;
        _os_log_impl(&dword_1BA384000, v89, v90, "Restricted accounts are: %@", buf, 0xCu);
      }
    }
    CFPreferencesSetAppValue(@"LastSystemVersion", v103->_buildVersion, @"com.apple.dataaccess.babysitter");
    CFPreferencesSetAppValue(@"RefreshingWaiters", v103->_refreshingWaiters, @"com.apple.dataaccess.babysitter");
    CFPreferencesSetAppValue(@"FailedWaiters", v103->_failedWaiters, @"com.apple.dataaccess.babysitter");
    CFPreferencesSetAppValue(@"RestrictedWaiters", v103->_restrictedWaiters, @"com.apple.dataaccess.babysitter");
    CFPreferencesAppSynchronize(@"com.apple.dataaccess.babysitter");
  }
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)DABabysitter;
  v2 = [(DABabysitter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(DABabysitter *)v2 _reloadBabysitterProperties];
    [MEMORY[0x1E4F576F8] addObserver:v3 selector:sel__reloadBabysitterProperties name:@"DataAccessBabysitterPrefsChanged"];
  }
  return v3;
}

- (DABabysitter)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"DABabysitter.m", 187, @"Use the shared babysitter, jerk." object file lineNumber description];

  return 0;
}

- (void)_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(NSMutableDictionary *)self->_refreshingWaiters objectForKeyedSubscript:v6];
    if (!v8)
    {
      v8 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_refreshingWaiters setObject:v8 forKeyedSubscript:v6];
    }
    v9 = [v8 objectForKeyedSubscript:v7];
    v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
    uint64_t v11 = DALoggingwithCategory();
    os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    if (os_log_type_enabled(v11, v12))
    {
      int v13 = 138412802;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 1024;
      int v18 = [v10 intValue];
      _os_log_impl(&dword_1BA384000, v11, v12, "Babysitter: Marking waiter %@ as performing operation \"%@\" (attempt #%d)", (uint8_t *)&v13, 0x1Cu);
    }

    [v8 setObject:v10 forKeyedSubscript:v7];
    CFPreferencesSetAppValue(@"RefreshingWaiters", self->_refreshingWaiters, @"com.apple.dataaccess.babysitter");
    CFPreferencesAppSynchronize(@"com.apple.dataaccess.babysitter");
  }
}

- (void)_decrementRefreshCountForWaiter:(id)a3 forOperationWithName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_refreshingWaiters objectForKeyedSubscript:v13];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:v6];
    if ((int)[v9 intValue] < 2)
    {
      [v8 removeObjectForKey:v6];
      v10 = [(NSMutableDictionary *)self->_failedWaiters objectForKeyedSubscript:v13];
      uint64_t v11 = [v10 objectForKeyedSubscript:v6];
      if ((int)[v11 intValue] < 2)
      {
        [v10 removeObjectForKey:v6];
      }
      else
      {
        os_log_type_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "intValue") - 1);
        [v10 setObject:v12 forKeyedSubscript:v6];
      }
    }
    else
    {
      v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue") - 1);
      [v8 setObject:v10 forKeyedSubscript:v6];
    }
  }
}

- (void)_decrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(NSMutableDictionary *)self->_refreshingWaiters objectForKeyedSubscript:v6];
    v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
    BOOL v11 = os_log_type_enabled(v9, v10);
    if (v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v7;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl(&dword_1BA384000, v9, v10, "Babysitter: Decrementing refresh count for operation \"%@\" on account %@", buf, 0x16u);
      }

      [(DABabysitter *)self _decrementRefreshCountForWaiter:v6 forOperationWithName:v7];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v6;
        _os_log_impl(&dword_1BA384000, v9, v10, "Babysitter: Decrementing refresh count for all operations on account %@", buf, 0xCu);
      }

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      os_log_type_t v12 = objc_msgSend(v8, "allKeys", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            [(DABabysitter *)self _decrementRefreshCountForWaiter:v6 forOperationWithName:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v14);
      }
    }
    if (![v8 count]) {
      [(NSMutableDictionary *)self->_refreshingWaiters removeObjectForKey:v6];
    }
    __int16 v17 = [(NSMutableDictionary *)self->_failedWaiters objectForKeyedSubscript:v6];
    uint64_t v18 = [v17 count];

    if (!v18) {
      [(NSMutableDictionary *)self->_failedWaiters removeObjectForKey:v6];
    }
    CFPreferencesSetAppValue(@"RefreshingWaiters", self->_refreshingWaiters, @"com.apple.dataaccess.babysitter");
    CFPreferencesSetAppValue(@"FailedWaiters", self->_failedWaiters, @"com.apple.dataaccess.babysitter");
    CFPreferencesAppSynchronize(@"com.apple.dataaccess.babysitter");
  }
}

- (BOOL)registerAccount:(id)a3 forOperationWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (DAIsRunningInDataAccessD())
  {
    if (![(DABabysitter *)self accountShouldContinue:v6])
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    v8 = [v6 waiterID];
    [(DABabysitter *)self _incrementRefreshCountForWaiterID:v8 operationName:v7];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (void)unregisterAccount:(id)a3 forOperationWithName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (DAIsRunningInDataAccessD()
    && [(DABabysitter *)self accountShouldContinue:v8])
  {
    id v7 = [v8 waiterID];
    [(DABabysitter *)self _decrementRefreshCountForWaiterID:v7 operationName:v6];
  }
}

- (BOOL)accountWithIDShouldContinue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = DAIsRunningInDataAccessD();
  BOOL v6 = 1;
  if (v4 && v5)
  {
    id v7 = [(NSMutableDictionary *)self->_restrictedWaiters objectForKeyedSubscript:v4];
    id v8 = v7;
    if (v7)
    {
      BOOL v9 = (void *)MEMORY[0x1E4F1C9C8];
      os_log_type_t v10 = [v7 objectForKeyedSubscript:@"RestrictionTimeout"];
      [v10 doubleValue];
      BOOL v11 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");

      os_log_type_t v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:v11];
      double v14 = v13;

      BOOL v6 = v14 >= 0.0;
      if (v14 >= 0.0)
      {
        uint64_t v15 = DALoggingwithCategory();
        os_log_type_t v16 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 4);
        if (os_log_type_enabled(v15, v16))
        {
          int v18 = 138412290;
          id v19 = v4;
          _os_log_impl(&dword_1BA384000, v15, v16, "Babysitter: It's been long enough, we're going to give account %@ another try. Let's hope it doesn't crash this time.", (uint8_t *)&v18, 0xCu);
        }

        [(NSMutableDictionary *)self->_refreshingWaiters removeObjectForKey:v4];
        CFPreferencesSetAppValue(@"RefreshingWaiters", self->_refreshingWaiters, @"com.apple.dataaccess.babysitter");
        [(NSMutableDictionary *)self->_restrictedWaiters removeObjectForKey:v4];
        CFPreferencesSetAppValue(@"RestrictedWaiters", self->_restrictedWaiters, @"com.apple.dataaccess.babysitter");
        CFPreferencesAppSynchronize(@"com.apple.dataaccess.babysitter");
      }
    }
  }

  return v6;
}

- (BOOL)accountShouldContinue:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F5E940] babysitterEnabled] && DAIsRunningInDataAccessD())
  {
    int v5 = [v4 waiterID];
    BOOL v6 = [(DABabysitter *)self accountWithIDShouldContinue:v5];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)giveAccountWithIDAnotherChance:(id)a3
{
  id v5 = a3;
  if (DAIsRunningInDataAccessD() && [MEMORY[0x1E4F5E940] babysitterEnabled])
  {
    id v4 = self;
    objc_sync_enter(v4);
    [(NSMutableDictionary *)v4->_refreshingWaiters removeObjectForKey:v5];
    [(NSMutableDictionary *)v4->_restrictedWaiters removeObjectForKey:v5];
    CFPreferencesSetAppValue(@"RefreshingWaiters", v4->_refreshingWaiters, @"com.apple.dataaccess.babysitter");
    [(NSMutableDictionary *)v4->_failedWaiters removeObjectForKey:v5];
    CFPreferencesSetAppValue(@"FailedWaiters", v4->_failedWaiters, @"com.apple.dataaccess.babysitter");
    CFPreferencesSetAppValue(@"RestrictedWaiters", v4->_restrictedWaiters, @"com.apple.dataaccess.babysitter");
    CFPreferencesAppSynchronize(@"com.apple.dataaccess.babysitter");
    objc_sync_exit(v4);
  }
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSMutableDictionary)refreshingWaiters
{
  return self->_refreshingWaiters;
}

- (void)setRefreshingWaiters:(id)a3
{
}

- (NSMutableDictionary)failedWaiters
{
  return self->_failedWaiters;
}

- (void)setFailedWaiters:(id)a3
{
}

- (NSMutableDictionary)restrictedWaiters
{
  return self->_restrictedWaiters;
}

- (void)setRestrictedWaiters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedWaiters, 0);
  objc_storeStrong((id *)&self->_failedWaiters, 0);
  objc_storeStrong((id *)&self->_refreshingWaiters, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end