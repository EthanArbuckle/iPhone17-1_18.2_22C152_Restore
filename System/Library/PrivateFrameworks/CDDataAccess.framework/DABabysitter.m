@interface DABabysitter
+ (id)sharedBabysitter;
- (BOOL)accountShouldContinue:(id)a3;
- (BOOL)accountWithIDShouldContinue:(id)a3;
- (BOOL)registerAccount:(id)a3 forOperationWithName:(id)a4;
- (DABabysitter)init;
- (NSMutableDictionary)l_failedWaiters;
- (NSMutableDictionary)l_refreshingWaiters;
- (NSMutableDictionary)l_restrictedWaiters;
- (NSString)buildVersion;
- (id)_init;
- (id)_populatedStringDictionaryWithWaitersDictionary:(id)a3;
- (id)tokenByRegisteringAccount:(id)a3 forOperationWithName:(id)a4;
- (os_unfair_lock_s)lock;
- (void)_diagnosticReportWithWaiterID:(id)a3 failureCount:(int)a4;
- (void)_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4;
- (void)_l_decrementRefreshCountForWaiter:(id)a3 forOperationWithName:(id)a4;
- (void)_l_decrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4;
- (void)_l_giveAccountWithIDAnotherChance:(id)a3;
- (void)_l_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4;
- (void)_l_reloadBabysitterWaitersWithRefreshingWaitersPrefs:(id)a3 failedWaitersPrefs:(id)a4 restrictedWaitersPrefs:(id)a5;
- (void)_reloadBabysitterProperties;
- (void)dealloc;
- (void)giveAccountWithIDAnotherChance:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setL_failedWaiters:(id)a3;
- (void)setL_refreshingWaiters:(id)a3;
- (void)setL_restrictedWaiters:(id)a3;
- (void)statusReportWithCompletionBlock:(id)a3;
- (void)unregisterAccount:(id)a3 forOperationWithName:(id)a4;
@end

@implementation DABabysitter

+ (id)sharedBabysitter
{
  if (sharedBabysitter_onceToken != -1) {
    dispatch_once(&sharedBabysitter_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedBabysitter_sBabysitter;
  return v2;
}

uint64_t __32__DABabysitter_sharedBabysitter__block_invoke()
{
  sharedBabysitter_sBabysitter = [[DABabysitter alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (void)_l_reloadBabysitterWaitersWithRefreshingWaitersPrefs:(id)a3 failedWaitersPrefs:(id)a4 restrictedWaitersPrefs:(id)a5
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (NSMutableDictionary *)objc_opt_new();
  l_refreshingWaiters = self->_l_refreshingWaiters;
  self->_l_refreshingWaiters = v11;

  v94 = v10;
  v95 = v9;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      v13 = [v8 allKeys];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v135 objects:v153 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v136;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v136 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v135 + 1) + 8 * i);
            v19 = [v8 objectForKeyedSubscript:v18];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = (void *)[v19 mutableCopy];
              [(NSMutableDictionary *)self->_l_refreshingWaiters setObject:v20 forKeyedSubscript:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v135 objects:v153 count:16];
        }
        while (v15);
      }

      id v10 = v94;
      id v9 = v95;
    }
  }
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v21 = (NSMutableDictionary *)objc_opt_new();
    l_failedWaiters = self->_l_failedWaiters;
    self->_l_failedWaiters = v21;

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v23 = [v9 allKeys];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v131 objects:v152 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v132;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v132 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v131 + 1) + 8 * j);
          v29 = [v95 objectForKeyedSubscript:v28];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v30 = (void *)[v29 mutableCopy];
            [(NSMutableDictionary *)self->_l_failedWaiters setObject:v30 forKeyedSubscript:v28];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v131 objects:v152 count:16];
      }
      while (v25);
      id v10 = v94;
    }
  }
  else
  {
    v31 = (NSMutableDictionary *)objc_opt_new();
    v23 = self->_l_failedWaiters;
    self->_l_failedWaiters = v31;
  }

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v32 = (NSMutableDictionary *)[v10 mutableCopy];
  }
  else {
    v32 = (NSMutableDictionary *)objc_opt_new();
  }
  l_restrictedWaiters = self->_l_restrictedWaiters;
  self->_l_restrictedWaiters = v32;
  v93 = v8;

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_l_refreshingWaiters allKeys];
  v105 = self;
  uint64_t v101 = [obj countByEnumeratingWithState:&v127 objects:v151 count:16];
  if (v101)
  {
    id v99 = *(id *)v128;
    os_log_type_t v34 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(id *)v128 != v99) {
          objc_enumerationMutation(obj);
        }
        uint64_t v103 = v35;
        v36 = *(NSMutableDictionary **)(*((void *)&v127 + 1) + 8 * v35);
        v37 = [(NSMutableDictionary *)self->_l_refreshingWaiters objectForKeyedSubscript:v36];
        v108 = v36;
        v38 = [(NSMutableDictionary *)self->_l_failedWaiters objectForKeyedSubscript:v36];
        if (!v38)
        {
          v38 = [MEMORY[0x1E4F1CA60] dictionary];
          [(NSMutableDictionary *)self->_l_failedWaiters setObject:v38 forKeyedSubscript:v36];
        }
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        id v39 = v37;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v123 objects:v150 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v124;
          do
          {
            for (uint64_t k = 0; k != v41; ++k)
            {
              if (*(void *)v124 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = *(void **)(*((void *)&v123 + 1) + 8 * k);
              v45 = [v38 objectForKeyedSubscript:v44];
              v46 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v45, "intValue") + 1);
              [v38 setObject:v46 forKeyedSubscript:v44];
              v47 = DALoggingwithCategory();
              if (os_log_type_enabled(v47, v34))
              {
                int v48 = [v46 intValue];
                *(_DWORD *)buf = 138543874;
                v145 = v108;
                __int16 v146 = 1024;
                int v147 = v48;
                __int16 v148 = 2114;
                v149 = v44;
                _os_log_impl(&dword_1C86FF000, v47, v34, "Babysitter: Noting that waiter %{public}@ failed %d times for operation %{public}@", buf, 0x1Cu);
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v123 objects:v150 count:16];
          }
          while (v41);
        }

        uint64_t v35 = v103 + 1;
        self = v105;
      }
      while (v103 + 1 != v101);
      uint64_t v101 = [obj countByEnumeratingWithState:&v127 objects:v151 count:16];
    }
    while (v101);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v100 = [(NSMutableDictionary *)self->_l_failedWaiters allKeys];
  uint64_t v49 = [v100 countByEnumeratingWithState:&v119 objects:v143 count:16];
  unint64_t v50 = 0x1E4F1C000uLL;
  if (v49)
  {
    uint64_t v51 = v49;
    uint64_t v52 = *(void *)v120;
    uint64_t v96 = *(void *)v120;
    do
    {
      uint64_t v53 = 0;
      id obja = (id)v51;
      do
      {
        if (*(void *)v120 != v52) {
          objc_enumerationMutation(v100);
        }
        uint64_t v106 = *(void *)(*((void *)&v119 + 1) + 8 * v53);
        v54 = -[NSMutableDictionary objectForKeyedSubscript:](self->_l_failedWaiters, "objectForKeyedSubscript:");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v102 = v53;
          long long v117 = 0u;
          long long v118 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          id v109 = [v54 allKeys];
          uint64_t v55 = [v109 countByEnumeratingWithState:&v115 objects:v142 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v116;
            v104 = v54;
            do
            {
              for (uint64_t m = 0; m != v56; ++m)
              {
                if (*(void *)v116 != v57) {
                  objc_enumerationMutation(v109);
                }
                uint64_t v59 = *(void *)(*((void *)&v115 + 1) + 8 * m);
                v60 = [v54 objectForKeyedSubscript:v59];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v61 = [v60 intValue];
                  if ((int)v61 >= 5)
                  {
                    uint64_t v62 = v61;
                    v63 = [(NSMutableDictionary *)self->_l_restrictedWaiters objectForKeyedSubscript:v106];

                    if (!v63)
                    {
                      [NSString stringWithFormat:@"com.apple.caldavsyncd.babysitter.timeout.%@", v59];
                      ADClientAddValueForScalarKey();
                      v64 = objc_msgSend(*(id *)(v50 + 2504), "dateWithTimeIntervalSinceNow:", fmin((double)(3600 * (int)v62 - 14400), 86400.0) + (double)(arc4random() % 0x384));
                      if (([MEMORY[0x1E4F50E38] babysitterEnabled] & 1) == 0)
                      {
                        uint64_t v65 = [*(id *)(v50 + 2504) distantPast];

                        v64 = (void *)v65;
                      }
                      id v66 = objc_alloc_init(MEMORY[0x1E4F28C10]);
                      [v66 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
                      v67 = [v66 stringFromDate:v64];
                      v140[0] = @"RestrictionTimeout";
                      v68 = NSNumber;
                      [v64 timeIntervalSinceReferenceDate];
                      v69 = objc_msgSend(v68, "numberWithDouble:");
                      v141[0] = v69;
                      v141[1] = v67;
                      v140[1] = @"RestrictionTimeoutDate";
                      v140[2] = @"NumFailures";
                      v70 = [NSNumber numberWithInt:v62];
                      v141[2] = v70;
                      v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:3];

                      [(NSMutableDictionary *)v105->_l_restrictedWaiters setValue:v71 forKey:v106];
                      self = v105;

                      unint64_t v50 = 0x1E4F1C000;
                      v54 = v104;
                    }
                  }
                }
              }
              uint64_t v56 = [v109 countByEnumeratingWithState:&v115 objects:v142 count:16];
            }
            while (v56);
          }

          uint64_t v52 = v96;
          uint64_t v51 = (uint64_t)obja;
          uint64_t v53 = v102;
        }

        ++v53;
      }
      while (v53 != v51);
      uint64_t v51 = [v100 countByEnumeratingWithState:&v119 objects:v143 count:16];
    }
    while (v51);
  }

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v72 = self->_l_restrictedWaiters;
  uint64_t v73 = [(NSMutableDictionary *)v72 countByEnumeratingWithState:&v111 objects:v139 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v112;
    os_log_type_t v110 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    v107 = v72;
    do
    {
      for (uint64_t n = 0; n != v74; ++n)
      {
        if (*(void *)v112 != v75) {
          objc_enumerationMutation(v72);
        }
        v77 = *(NSMutableDictionary **)(*((void *)&v111 + 1) + 8 * n);
        v78 = [(NSMutableDictionary *)self->_l_restrictedWaiters objectForKeyedSubscript:v77];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v79 = [v78 objectForKeyedSubscript:@"NumFailures"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v80 = [v78 objectForKeyedSubscript:@"RestrictionTimeout"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v80 = 0;
            }
            int v81 = [MEMORY[0x1E4F50E38] babysitterEnabled];
            v82 = DALoggingwithCategory();
            BOOL v83 = os_log_type_enabled(v82, v110);
            if (v81)
            {
              if (v83)
              {
                int v84 = [v79 intValue];
                v85 = (void *)MEMORY[0x1E4F1C9C8];
                [v80 doubleValue];
                v86 = objc_msgSend(v85, "dateWithTimeIntervalSinceReferenceDate:");
                *(_DWORD *)buf = 138543874;
                v145 = v77;
                __int16 v146 = 1024;
                int v147 = v84;
                __int16 v148 = 2114;
                v149 = v86;
                _os_log_impl(&dword_1C86FF000, v82, v110, "===================\n\n\n\nBabysitter: Account with ID %{public}@ had previously failed %d times and is from now restricted until it stops crashing. Please file a bug for any remindd crashes you find. (Timeout: %{public}@)\n\n\n===================\n", buf, 0x1Cu);

                v72 = v107;
              }

              -[DABabysitter _diagnosticReportWithWaiterID:failureCount:](v105, "_diagnosticReportWithWaiterID:failureCount:", v77, [v79 intValue]);
            }
            else
            {
              if (v83)
              {
                int v87 = [v79 intValue];
                v88 = (void *)MEMORY[0x1E4F1C9C8];
                [v80 doubleValue];
                v89 = objc_msgSend(v88, "dateWithTimeIntervalSinceReferenceDate:");
                *(_DWORD *)buf = 138543874;
                v145 = v77;
                __int16 v146 = 1024;
                int v147 = v87;
                __int16 v148 = 2114;
                v149 = v89;
                _os_log_impl(&dword_1C86FF000, v82, v110, "===================\n\n\n\nBabysitter: Waiter with ID %{public}@ had crashed %d times. Since you have the babysitter disabled, we're going to assume you know what you're doing and not disable the waiter. Consider yourself warned. (Timeout: %{public}@)\n\n\n===================\n", buf, 0x1Cu);

                v72 = v107;
              }
            }
            self = v105;
          }
        }
      }
      uint64_t v74 = [(NSMutableDictionary *)v72 countByEnumeratingWithState:&v111 objects:v139 count:16];
    }
    while (v74);
  }

  [(NSMutableDictionary *)self->_l_refreshingWaiters removeAllObjects];
  if ([(NSMutableDictionary *)self->_l_restrictedWaiters count])
  {
    v90 = DALoggingwithCategory();
    os_log_type_t v91 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
    if (os_log_type_enabled(v90, v91))
    {
      v92 = self->_l_restrictedWaiters;
      *(_DWORD *)buf = 138543362;
      v145 = v92;
      _os_log_impl(&dword_1C86FF000, v90, v91, "Babysitter: Restricted accounts are: %{public}@", buf, 0xCu);
    }
  }
}

- (void)_reloadBabysitterProperties
{
  CFPreferencesAppSynchronize(@"com.apple.remindd.babysitter");
  v3 = (NSString *)MGCopyAnswer();
  buildVersiouint64_t n = self->_buildVersion;
  self->_buildVersiouint64_t n = v3;

  v5 = (void *)CFPreferencesCopyAppValue(@"LastSystemVersion", @"com.apple.remindd.babysitter");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ![(NSString *)self->_buildVersion isEqualToString:v5])
    {
      v6 = DALoggingwithCategory();
      os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
      if (os_log_type_enabled(v6, v7))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1C86FF000, v6, v7, "Babysitter: The OS version is different. Giving all accounts a second chance at life.", v14, 2u);
      }

      CFPreferencesSetAppValue(@"LastSystemVersion", 0, @"com.apple.remindd.babysitter");
      CFPreferencesSetAppValue(@"RestrictedWaiters", 0, @"com.apple.remindd.babysitter");
      CFPreferencesSetAppValue(@"RefreshingWaiters", 0, @"com.apple.remindd.babysitter");
      CFPreferencesSetAppValue(@"FailedWaiters", 0, @"com.apple.remindd.babysitter");
      CFPreferencesAppSynchronize(@"com.apple.remindd.babysitter");
    }
  }
  id v8 = (void *)CFPreferencesCopyAppValue(@"RefreshingWaiters", @"com.apple.remindd.babysitter");
  id v9 = (void *)CFPreferencesCopyAppValue(@"FailedWaiters", @"com.apple.remindd.babysitter");
  id v10 = (void *)CFPreferencesCopyAppValue(@"RestrictedWaiters", @"com.apple.remindd.babysitter");
  os_unfair_lock_lock(&self->_lock);
  [(DABabysitter *)self _l_reloadBabysitterWaitersWithRefreshingWaitersPrefs:v8 failedWaitersPrefs:v9 restrictedWaitersPrefs:v10];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_l_refreshingWaiters copyItems:1];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_l_failedWaiters copyItems:1];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_l_restrictedWaiters copyItems:1];
  os_unfair_lock_unlock(&self->_lock);
  CFPreferencesSetAppValue(@"LastSystemVersion", self->_buildVersion, @"com.apple.remindd.babysitter");
  CFPreferencesSetAppValue(@"RefreshingWaiters", v11, @"com.apple.remindd.babysitter");
  CFPreferencesSetAppValue(@"FailedWaiters", v12, @"com.apple.remindd.babysitter");
  CFPreferencesSetAppValue(@"RestrictedWaiters", v13, @"com.apple.remindd.babysitter");
  CFPreferencesAppSynchronize(@"com.apple.remindd.babysitter");
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)DABabysitter;
  v2 = [(DABabysitter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    [(DABabysitter *)v2 _reloadBabysitterProperties];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_reloadBabysitterProperties, @"DataAccessBabysitterPrefsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (DABabysitter)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"DABabysitter.m", 242, @"Use the shared babysitter, jerk." object file lineNumber description];

  return 0;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"DataAccessBabysitterPrefsChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)DABabysitter;
  [(DABabysitter *)&v4 dealloc];
}

- (void)_l_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_l_refreshingWaiters objectForKeyedSubscript:v6];
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_l_refreshingWaiters setObject:v8 forKeyedSubscript:v6];
  }
  id v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
  v11 = DALoggingwithCategory();
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 1024;
    int v18 = [v10 intValue];
    _os_log_impl(&dword_1C86FF000, v11, v12, "Babysitter: Marking waiter %@ as performing operation \"%@\" (attempt #%d)", (uint8_t *)&v13, 0x1Cu);
  }

  [v8 setObject:v10 forKeyedSubscript:v7];
}

- (void)_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
{
  if (a3)
  {
    p_locuint64_t k = &self->_lock;
    id v7 = a4;
    id v8 = a3;
    os_unfair_lock_lock(p_lock);
    [(DABabysitter *)self _l_incrementRefreshCountForWaiterID:v8 operationName:v7];

    value = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_l_refreshingWaiters copyItems:1];
    os_unfair_lock_unlock(p_lock);
    CFPreferencesSetAppValue(@"RefreshingWaiters", value, @"com.apple.remindd.babysitter");
    CFPreferencesAppSynchronize(@"com.apple.remindd.babysitter");
  }
}

- (void)_l_decrementRefreshCountForWaiter:(id)a3 forOperationWithName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_l_refreshingWaiters objectForKeyedSubscript:v13];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:v6];
    if ((int)[v9 intValue] < 2)
    {
      [v8 removeObjectForKey:v6];
      id v10 = [(NSMutableDictionary *)self->_l_failedWaiters objectForKeyedSubscript:v13];
      v11 = [v10 objectForKeyedSubscript:v6];
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
      id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue") - 1);
      [v8 setObject:v10 forKeyedSubscript:v6];
    }
  }
}

- (void)_l_decrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(NSMutableDictionary *)self->_l_refreshingWaiters objectForKeyedSubscript:v6];
    id v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
    BOOL v11 = os_log_type_enabled(v9, v10);
    if (v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v7;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl(&dword_1C86FF000, v9, v10, "Babysitter: Decrementing refresh count for operation \"%@\" on account %@", buf, 0x16u);
      }

      [(DABabysitter *)self _l_decrementRefreshCountForWaiter:v6 forOperationWithName:v7];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v6;
        _os_log_impl(&dword_1C86FF000, v9, v10, "Babysitter: Decrementing refresh count for all operations on account %@", buf, 0xCu);
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
            [(DABabysitter *)self _l_decrementRefreshCountForWaiter:v6 forOperationWithName:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v14);
      }
    }
    if (![v8 count]) {
      [(NSMutableDictionary *)self->_l_refreshingWaiters removeObjectForKey:v6];
    }
    __int16 v17 = [(NSMutableDictionary *)self->_l_failedWaiters objectForKeyedSubscript:v6];
    uint64_t v18 = [v17 count];

    if (!v18) {
      [(NSMutableDictionary *)self->_l_failedWaiters removeObjectForKey:v6];
    }
  }
}

- (BOOL)registerAccount:(id)a3 forOperationWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(DABabysitter *)self accountShouldContinue:v6];
  if (v8)
  {
    id v9 = [v6 waiterID];
    [(DABabysitter *)self _incrementRefreshCountForWaiterID:v9 operationName:v7];
  }
  return v8;
}

- (id)tokenByRegisteringAccount:(id)a3 forOperationWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(DABabysitter *)self registerAccount:v6 forOperationWithName:v7])
  {
    BOOL v8 = [DABabysitterRegistrationToken alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__DABabysitter_tokenByRegisteringAccount_forOperationWithName___block_invoke;
    v11[3] = &unk_1E6570F00;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v9 = [(DABabysitterRegistrationToken *)v8 initWithBlock:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __63__DABabysitter_tokenByRegisteringAccount_forOperationWithName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterAccount:*(void *)(a1 + 40) forOperationWithName:*(void *)(a1 + 48)];
}

- (void)unregisterAccount:(id)a3 forOperationWithName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([(DABabysitter *)self accountShouldContinue:v11])
  {
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    BOOL v8 = [v11 waiterID];
    [(DABabysitter *)self _l_decrementRefreshCountForWaiterID:v8 operationName:v6];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_l_refreshingWaiters copyItems:1];
    os_log_type_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_l_failedWaiters copyItems:1];
    os_unfair_lock_unlock(p_lock);
    CFPreferencesSetAppValue(@"RefreshingWaiters", v9, @"com.apple.remindd.babysitter");
    CFPreferencesSetAppValue(@"FailedWaiters", v10, @"com.apple.remindd.babysitter");
    CFPreferencesAppSynchronize(@"com.apple.remindd.babysitter");
  }
}

- (BOOL)accountWithIDShouldContinue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = [(NSMutableDictionary *)self->_l_restrictedWaiters objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 objectForKeyedSubscript:@"RestrictionTimeout"];
      [v7 doubleValue];
      double v9 = v8;

      os_log_type_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:v10];
      double v13 = v12;

      BOOL v14 = v13 >= 0.0;
      if (v13 >= 0.0)
      {
        uint64_t v15 = DALoggingwithCategory();
        os_log_type_t v16 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
        if (os_log_type_enabled(v15, v16))
        {
          int v18 = 138543362;
          id v19 = v4;
          _os_log_impl(&dword_1C86FF000, v15, v16, "Babysitter: It's been long enough, we're going to give account %{public}@ another try. Let's hope it doesn't crash this time.", (uint8_t *)&v18, 0xCu);
        }

        [(NSMutableDictionary *)self->_l_refreshingWaiters removeObjectForKey:v4];
        [(NSMutableDictionary *)self->_l_restrictedWaiters removeObjectForKey:v4];
        CFPreferencesSetAppValue(@"RefreshingWaiters", self->_l_refreshingWaiters, @"com.apple.remindd.babysitter");
        CFPreferencesSetAppValue(@"RestrictedWaiters", self->_l_restrictedWaiters, @"com.apple.remindd.babysitter");
        CFPreferencesAppSynchronize(@"com.apple.remindd.babysitter");
      }
    }
    else
    {
      BOOL v14 = 1;
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)accountShouldContinue:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F50E38] babysitterEnabled])
  {
    v5 = [v4 waiterID];
    BOOL v6 = [(DABabysitter *)self accountWithIDShouldContinue:v5];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_l_giveAccountWithIDAnotherChance:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F50E38] babysitterEnabled])
  {
    [(NSMutableDictionary *)self->_l_refreshingWaiters removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_l_restrictedWaiters removeObjectForKey:v4];
    CFPreferencesSetAppValue(@"RefreshingWaiters", self->_l_refreshingWaiters, @"com.apple.remindd.babysitter");
    [(NSMutableDictionary *)self->_l_failedWaiters removeObjectForKey:v4];
    CFPreferencesSetAppValue(@"FailedWaiters", self->_l_failedWaiters, @"com.apple.remindd.babysitter");
    CFPreferencesSetAppValue(@"RestrictedWaiters", self->_l_restrictedWaiters, @"com.apple.remindd.babysitter");
    CFPreferencesAppSynchronize(@"com.apple.remindd.babysitter");
  }
}

- (void)giveAccountWithIDAnotherChance:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(DABabysitter *)self _l_giveAccountWithIDAnotherChance:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_diagnosticReportWithWaiterID:(id)a3 failureCount:(int)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    id v5 = (objc_class *)MEMORY[0x1E4FA8AF0];
    id v6 = a3;
    id v7 = objc_alloc_init(v5);
    double v8 = [MEMORY[0x1E4F28F80] processInfo];
    double v9 = [v8 processName];
    os_log_type_t v10 = [v7 signatureWithDomain:@"ReminderKit" type:@"DABabysitter" subType:&stru_1F231BAB0 detectedProcess:v9 triggerThresholdValues:0];

    v13[0] = @"watierID";
    v13[1] = @"failureCount";
    v14[0] = v6;
    id v11 = [NSNumber numberWithInt:v4];
    v14[1] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

    [v7 snapshotWithSignature:v10 duration:v12 event:0 payload:&__block_literal_global_71 reply:0.0];
  }
}

void __59__DABabysitter__diagnosticReportWithWaiterID_failureCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 5);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_1C86FF000, v3, v4, "AutoBugCapture did reply {response: %@}", (uint8_t *)&v5, 0xCu);
  }
}

- (void)statusReportWithCompletionBlock:(id)a3
{
  p_locuint64_t k = &self->_lock;
  int v5 = (void (**)(id, id))a3;
  os_unfair_lock_lock(p_lock);
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(DABabysitter *)self _populatedStringDictionaryWithWaitersDictionary:self->_l_refreshingWaiters];
  uint64_t v7 = [(DABabysitter *)self _populatedStringDictionaryWithWaitersDictionary:self->_l_failedWaiters];
  double v8 = [(DABabysitter *)self _populatedStringDictionaryWithWaitersDictionary:self->_l_restrictedWaiters];
  [v9 setValue:v6 forKey:@"refreshingWaiters"];
  [v9 setValue:v7 forKey:@"failedWaiters"];
  [v9 setValue:v8 forKey:@"restrictedWaiters"];
  os_unfair_lock_unlock(p_lock);
  v5[2](v5, v9);
}

- (id)_populatedStringDictionaryWithWaitersDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  os_log_type_t v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        os_log_type_t v10 = (void *)MEMORY[0x1E4F28D90];
        id v11 = [v3 objectForKeyedSubscript:v9];
        id v18 = 0;
        double v12 = [v10 dataWithJSONObject:v11 options:8 error:&v18];
        id v13 = v18;

        if (v12) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 0;
        }
        if (v14)
        {
          uint64_t v15 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
          if (v15) {
            [v17 setValue:v15 forKey:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v17;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSMutableDictionary)l_refreshingWaiters
{
  return self->_l_refreshingWaiters;
}

- (void)setL_refreshingWaiters:(id)a3
{
}

- (NSMutableDictionary)l_failedWaiters
{
  return self->_l_failedWaiters;
}

- (void)setL_failedWaiters:(id)a3
{
}

- (NSMutableDictionary)l_restrictedWaiters
{
  return self->_l_restrictedWaiters;
}

- (void)setL_restrictedWaiters:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_l_restrictedWaiters, 0);
  objc_storeStrong((id *)&self->_l_failedWaiters, 0);
  objc_storeStrong((id *)&self->_l_refreshingWaiters, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end