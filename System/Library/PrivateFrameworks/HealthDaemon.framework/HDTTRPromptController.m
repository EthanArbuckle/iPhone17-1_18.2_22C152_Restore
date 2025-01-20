@interface HDTTRPromptController
+ (id)_nameForDomainName:(uint64_t)a1;
+ (id)_persistedValueKeys;
+ (id)formattedPersistedValuesForDomainName:(id)a3 database:(id)a4 error:(id *)a5;
- (BOOL)canRepromptOnSameBuild;
- (BOOL)unitTest_setLastPromptBuild:(id)a3 error:(id *)a4;
- (BOOL)unitTest_setLastPromptDate:(id)a3 error:(id *)a4;
- (HDKeyValueDomain)_keyValueDomain;
- (HDTTRPromptController)init;
- (HDTTRPromptController)initWithProfile:(id)a3 domainName:(id)a4 loggingCategory:(id)a5;
- (NSString)name;
- (NSString)notificationMessage;
- (NSString)notificationTitle;
- (NSString)radarDescription;
- (NSString)radarTitle;
- (double)minimumPromptInterval;
- (id)description;
- (id)unitTest_willPresentTTRAlertHandler;
- (int64_t)maximumErrorCount;
- (void)promptIfRequiredForReason:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)setCanRepromptOnSameBuild:(BOOL)a3;
- (void)setMaximumErrorCount:(int64_t)a3;
- (void)setMinimumPromptInterval:(double)a3;
- (void)setNotificationMessage:(id)a3;
- (void)setNotificationTitle:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRadarTitle:(id)a3;
- (void)setUnitTest_willPresentTTRAlertHandler:(id)a3;
@end

@implementation HDTTRPromptController

- (HDTTRPromptController)initWithProfile:(id)a3 domainName:(id)a4 loggingCategory:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDTTRPromptController;
  v9 = [(HDTTRPromptController *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_profile, v7);
    uint64_t v11 = +[HDTTRPromptController _nameForDomainName:]((uint64_t)HDTTRPromptController, v8);
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_minimumPromptInterval = 604800.0;
    v10->_maximumErrorCount = 7;
    v10->_canRepromptOnSameBuild = 0;
    uint64_t v13 = [NSString stringWithFormat:@"Health error, %@", v10->_name];
    notificationTitle = v10->_notificationTitle;
    v10->_notificationTitle = (NSString *)v13;

    uint64_t v15 = [NSString stringWithFormat:@"Health has run into a number of errors. Please file a radar with Tap-to-Radar against 'Health'"];
    notificationMessage = v10->_notificationMessage;
    v10->_notificationMessage = (NSString *)v15;

    uint64_t v17 = [NSString stringWithFormat:@"[%@] Multiple errors detected", v10->_name];
    radarTitle = v10->_radarTitle;
    v10->_radarTitle = (NSString *)v17;

    uint64_t v19 = [NSString stringWithFormat:@"Multiple errors detected %@", v10->_name];
    radarDescription = v10->_radarDescription;
    v10->_radarDescription = (NSString *)v19;
  }
  return v10;
}

+ (id)_nameForDomainName:(uint64_t)a1
{
  id v2 = a2;
  v3 = [NSString stringWithFormat:@"%@.%@", self, v2];

  v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v5 = objc_msgSend(v3, "hk_stringByRemovingCharactersInSet:", v4);

  return v5;
}

- (HDTTRPromptController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)formattedPersistedValuesForDomainName:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = +[HDTTRPromptController _nameForDomainName:]((uint64_t)HDTTRPromptController, a3);
  id v8 = +[HDTTRPromptController _persistedValueKeys]();
  id v29 = 0;
  v9 = +[HDKeyValueEntity _rawValuesForKeys:v8 domain:v7 category:0 database:v6 error:&v29];

  id v10 = v29;
  if (!v9)
  {
    v18 = 0;
    goto LABEL_15;
  }
  if (![v9 count])
  {
    v18 = &stru_1F1728D60;
    goto LABEL_15;
  }
  uint64_t v11 = [v9 objectForKeyedSubscript:@"Errors"];
  if (!v11)
  {
    v16 = 0;
    goto LABEL_9;
  }
  v12 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  id v28 = v10;
  v16 = [v12 unarchivedObjectOfClasses:v15 fromData:v11 error:&v28];
  id v17 = v28;

  if (v16)
  {
    id v10 = v17;
LABEL_9:
    uint64_t v19 = [v9 objectForKeyedSubscript:@"LastPromptDate"];
    v20 = v19;
    v27 = v11;
    if (v19)
    {
      v21 = (void *)MEMORY[0x1E4F1C9C8];
      [v19 doubleValue];
      objc_super v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      objc_super v22 = 0;
    }
    v23 = NSString;
    v24 = HKDiagnosticStringFromDate();
    v25 = [v9 objectForKeyedSubscript:@"LastPromptBuild"];
    v18 = [v23 stringWithFormat:@"%@ Values:\n%@: %@\n%@: %@\n%@: %@\n", v7, @"LastPromptDate", v24, @"LastPromptBuild", v25, @"Errors", v16];

    uint64_t v11 = v27;
    goto LABEL_14;
  }
  v18 = 0;
  id v10 = v17;
LABEL_14:

LABEL_15:

  return v18;
}

+ (id)_persistedValueKeys
{
  v2[3] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"Errors";
  v2[1] = @"LastPromptDate";
  v2[2] = @"LastPromptBuild";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];

  return v0;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HDTTRPromptController;
  uint64_t v4 = [(HDTTRPromptController *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ %@>", v4, self->_name];

  return v5;
}

- (void)promptIfRequiredForReason:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  v116[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (([MEMORY[0x1E4F2B860] isAppleInternalInstall] & 1) != 0 || _HDIsUnitTesting)
  {
    uint64_t v11 = -[HDTTRPromptController _keyValueDomain]((HDKeyValueDomain *)self);
    if (v6)
    {
      v12 = [MEMORY[0x1E4F1CAD0] setWithObject:@"Errors"];
      id v107 = 0;
      char v13 = [v11 removeValuesForKeys:v12 error:&v107];
      id v14 = v107;

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        loggingCategory = self->_loggingCategory;
        if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = @"Errors";
          *(_WORD *)&buf[22] = 2114;
          v109 = v14;
          _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "%{public}@: unable to clear value for %{public}@: %{public}@", buf, 0x20u);
        }
      }
      uint64_t v16 = (uint64_t)v9;
      goto LABEL_75;
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Error not provided");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v100 = v11;
    if (self)
    {
      id v17 = [NSString stringWithFormat:@"%@.ErrorDate", self->_name];
    }
    else
    {
      id v17 = 0;
    }
    v115[0] = v17;
    v18 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v19 = HKDiagnosticStringFromDate();
    v116[0] = v19;
    if (self)
    {
      v20 = [NSString stringWithFormat:@"%@.Reason", self->_name];
    }
    else
    {
      v20 = 0;
    }
    v115[1] = v20;
    v116[1] = v8;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
    uint64_t v16 = objc_msgSend(v9, "hk_errorByAddingEntriesToUserInfo:", v21);

    objc_super v22 = +[HDTTRPromptController _persistedValueKeys]();
    id v106 = 0;
    uint64_t v11 = v100;
    v23 = [v100 valuesForKeys:v22 error:&v106];
    id v14 = v106;
    if (!v23)
    {
      _HKInitializeLogging();
      v32 = self->_loggingCategory;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2114;
        v109 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "%{public}@: unable to get values for keys %@: %{public}@", buf, 0x20u);
      }
      goto LABEL_74;
    }
    v96 = v22;
    v99 = v23;
    uint64_t v24 = [v23 objectForKeyedSubscript:@"Errors"];
    v95 = (void *)v24;
    if (v24)
    {
      uint64_t v25 = v24;
      v26 = (void *)MEMORY[0x1E4F28DC0];
      v27 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v28 = objc_opt_class();
      id v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
      id v105 = v14;
      id v30 = [v26 unarchivedObjectOfClasses:v29 fromData:v25 error:&v105];
      id v31 = v105;

      if (!v30)
      {
        _HKInitializeLogging();
        v74 = self->_loggingCategory;
        if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = v100;
          v63 = v95;
          objc_super v22 = v96;
LABEL_73:

          id v14 = v31;
          v23 = v99;
LABEL_74:

LABEL_75:
          id v9 = (id)v16;
          goto LABEL_76;
        }
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        v63 = v95;
        *(void *)&buf[14] = v95;
        *(_WORD *)&buf[22] = 2112;
        v109 = v31;
        _os_log_error_impl(&dword_1BCB7D000, v74, OS_LOG_TYPE_ERROR, "%{public}@: unable to unarchive errors from data %@: %@", buf, 0x20u);
        uint64_t v11 = v100;
LABEL_72:
        objc_super v22 = v96;
        goto LABEL_73;
      }
      id v14 = v31;
    }
    else
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v91 = v8;
    [v30 insertObject:v16 atIndex:0];
    while ((unint64_t)[v30 count] > self->_maximumErrorCount)
      [v30 removeLastObject];
    uint64_t v33 = v16;
    v34 = [v23 objectForKeyedSubscript:@"LastPromptDate"];
    v94 = v34;
    if (v34)
    {
      v35 = (void *)MEMORY[0x1E4F1C9C8];
      [v34 doubleValue];
      v36 = objc_msgSend(v35, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v36 = 0;
    }
    v37 = [v23 objectForKeyedSubscript:@"LastPromptBuild"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v39 = [WeakRetained daemon];
    v40 = [v39 behavior];
    v98 = [v40 currentOSBuild];

    unint64_t v41 = [v30 count];
    unint64_t maximumErrorCount = self->_maximumErrorCount;
    v97 = v36;
    if (v36)
    {
      [v36 timeIntervalSinceNow];
      BOOL v44 = fabs(v43) <= self->_minimumPromptInterval;
    }
    else
    {
      BOOL v44 = 0;
    }
    uint64_t v16 = v33;
    if (self->_canRepromptOnSameBuild)
    {
      char v45 = 0;
      id v8 = v91;
    }
    else
    {
      id v8 = v91;
      if (v37 == v98) {
        goto LABEL_47;
      }
      if (v98) {
        char v45 = objc_msgSend(v37, "isEqualToString:");
      }
      else {
        char v45 = 0;
      }
    }
    char v46 = v41 < maximumErrorCount || v44;
    if ((v46 & 1) == 0 && (v45 & 1) == 0)
    {
      uint64_t v87 = v16;
      id v47 = v30;
      v48 = v37;
      id v49 = v47;
      v88 = v48;
      id v50 = v48;
      id v51 = v97;
      v52 = NSString;
      radarDescription = self->_radarDescription;
      id v54 = v98;
      v92 = v51;
      v55 = HKDiagnosticStringFromDate();
      uint64_t v56 = [v49 count];
      id v89 = v49;
      id v85 = v49;
      id v57 = v50;
      uint64_t v58 = [v52 stringWithFormat:@"%@. Last Prompt (%@, %@), Current (%@) Errors (%lu): %@", radarDescription, v50, v55, v54, v56, v85];
      id v86 = v54;

      _HKInitializeLogging();
      v59 = self->_loggingCategory;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v58;
        _os_log_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
      }
      v90 = (void *)v58;
      char v60 = _HDIsUnitTesting;
      if (_HDIsUnitTesting)
      {
        v61 = _Block_copy(self->_unitTest_willPresentTTRAlertHandler);
        id v62 = v61;
        v63 = v95;
        v64 = v89;
        v65 = v57;
        if (v61) {
          (*((void (**)(void *, HDTTRPromptController *, id, id, void *))v61 + 2))(v61, self, v89, v57, v92);
        }
        uint64_t v16 = v87;
      }
      else
      {
        atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_isPresenting, (unsigned __int8 *)&v60, 1u);
        v63 = v95;
        v64 = v89;
        uint64_t v16 = v87;
        v65 = v57;
        if (v60)
        {
LABEL_62:

          id v104 = v14;
          v77 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v64 requiringSecureCoding:1 error:&v104];
          id v78 = v104;

          if (v77)
          {
            v93 = v77;
            v114[0] = v77;
            v113[0] = @"Errors";
            v113[1] = @"LastPromptDate";
            v79 = NSNumber;
            v80 = [MEMORY[0x1E4F1C9C8] date];
            [v80 timeIntervalSinceReferenceDate];
            uint64_t v81 = objc_msgSend(v79, "numberWithDouble:");
            v113[2] = @"LastPromptBuild";
            v114[1] = v81;
            v114[2] = v86;
            v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:3];

            id v103 = v78;
            LOBYTE(v81) = [v100 setValuesWithDictionary:v82 error:&v103];
            id v31 = v103;

            v37 = v88;
            if ((v81 & 1) == 0)
            {
              _HKInitializeLogging();
              v83 = self->_loggingCategory;
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v82;
                *(_WORD *)&buf[22] = 2114;
                v109 = v31;
                _os_log_error_impl(&dword_1BCB7D000, v83, OS_LOG_TYPE_ERROR, "%{public}@: unable to set values %{public}@: %{public}@", buf, 0x20u);
              }
            }

            uint64_t v11 = v100;
            v77 = v93;
          }
          else
          {
            _HKInitializeLogging();
            v84 = self->_loggingCategory;
            v37 = v88;
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v64;
              *(_WORD *)&buf[22] = 2112;
              v109 = v78;
              _os_log_error_impl(&dword_1BCB7D000, v84, OS_LOG_TYPE_ERROR, "%{public}@: unable to archive errors %@: %@", buf, 0x20u);
            }
            id v31 = v78;
            uint64_t v11 = v100;
          }

LABEL_71:
          goto LABEL_72;
        }
        id v62 = objc_alloc_init(MEMORY[0x1E4F65D98]);
        [v62 setTitle:self->_notificationTitle];
        v76 = [NSString stringWithFormat:@"%@. Please file a radar with Tap-to-Radar against 'Health'", self->_notificationMessage];
        [v62 setMessage:v76];

        v65 = v57;
        [v62 setDefaultButton:@"Tap-to-Radar"];
        [v62 setCancelButton:@"Not Now"];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __96__HDTTRPromptController__presentTTRPromptForErrors_lastPromptBuild_lastPromptDate_currentBuild___block_invoke;
        v109 = &unk_1E62F8560;
        *(void *)v110 = self;
        *(void *)&v110[8] = v90;
        [v62 presentWithResponseHandler:buf];
      }
      goto LABEL_62;
    }
LABEL_47:
    _HKInitializeLogging();
    v66 = self->_loggingCategory;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v67 = v66;
      v68 = HKDiagnosticStringFromDate();
      uint64_t v69 = [v30 count];
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v68;
      *(_WORD *)&buf[22] = 2114;
      v109 = v37;
      *(_WORD *)v110 = 2114;
      *(void *)&v110[2] = v98;
      *(_WORD *)&v110[10] = 2048;
      *(void *)&v110[12] = v69;
      __int16 v111 = 2114;
      id v112 = v30;
      _os_log_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_INFO, "%{public}@: TTR alert: lastPromptDate %{public}@, lastPromptBuild %{public}@ (current build %{public}@), errors (%lu) %{public}@", buf, 0x3Eu);
    }
    id v102 = v14;
    uint64_t v70 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v30 requiringSecureCoding:1 error:&v102];
    id v31 = v102;

    uint64_t v11 = v100;
    if (v70)
    {
      id v101 = v31;
      char v71 = [v100 setData:v70 forKey:@"Errors" error:&v101];
      id v72 = v101;

      if ((v71 & 1) == 0)
      {
        _HKInitializeLogging();
        v73 = self->_loggingCategory;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = @"Errors";
          *(_WORD *)&buf[22] = 2114;
          v109 = v72;
          _os_log_error_impl(&dword_1BCB7D000, v73, OS_LOG_TYPE_ERROR, "%{public}@: unable to set values for %{public}@: %{public}@", buf, 0x20u);
        }
      }
      v63 = (void *)v70;
      id v31 = v72;
      uint64_t v11 = v100;
    }
    else
    {
      _HKInitializeLogging();
      v75 = self->_loggingCategory;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        v109 = v31;
        _os_log_error_impl(&dword_1BCB7D000, v75, OS_LOG_TYPE_ERROR, "%{public}@: unable to archive errors %@: %@", buf, 0x20u);
      }
      v63 = 0;
    }
    goto LABEL_71;
  }
  _HKInitializeLogging();
  id v10 = self->_loggingCategory;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: skip TTR prompt check", buf, 0xCu);
  }
LABEL_76:
}

- (HDKeyValueDomain)_keyValueDomain
{
  v1 = a1;
  if (a1)
  {
    id v2 = [HDKeyValueDomain alloc];
    int64_t category = v1->_category;
    id WeakRetained = objc_loadWeakRetained((id *)&v1->_profile);
    v1 = [(HDKeyValueDomain *)v2 initWithCategory:0 domainName:category profile:WeakRetained];
  }

  return v1;
}

void __96__HDTTRPromptController__presentTTRPromptForErrors_lastPromptBuild_lastPromptDate_currentBuild___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 24));
  if (a3 == 1)
  {
    _HKInitializeLogging();
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(NSObject **)(v13 + 16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: TTR alert: 'Not Now' button pressed", buf, 0xCu);
    }
  }
  else if (!a3)
  {
    _HKInitializeLogging();
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(NSObject **)(v9 + 16);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: TTR alert: 'Tap-to-Radar' button pressed", buf, 0xCu);
      uint64_t v9 = *(void *)(a1 + 32);
    }
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToHealthRadarURLWithTitle:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", *(void *)(v9 + 72), *(void *)(a1 + 40), 6, 6, 0, 2, 0);
    v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v12 openURL:v11 configuration:0 completionHandler:&__block_literal_global_208];
  }
}

void __96__HDTTRPromptController__presentTTRPromptForErrors_lastPromptBuild_lastPromptDate_currentBuild___block_invoke_347(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Could not open Tap-to-Radar URL %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)unitTest_setLastPromptDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[HDTTRPromptController _keyValueDomain]((HDKeyValueDomain *)self);
  LOBYTE(a4) = [v7 setDate:v6 forKey:@"LastPromptDate" error:a4];

  return (char)a4;
}

- (BOOL)unitTest_setLastPromptBuild:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[HDTTRPromptController _keyValueDomain]((HDKeyValueDomain *)self);
  LOBYTE(a4) = [v7 setString:v6 forKey:@"LastPromptBuild" error:a4];

  return (char)a4;
}

- (NSString)name
{
  return self->_name;
}

- (double)minimumPromptInterval
{
  return self->_minimumPromptInterval;
}

- (void)setMinimumPromptInterval:(double)a3
{
  self->_minimumPromptInterval = a3;
}

- (int64_t)maximumErrorCount
{
  return self->_maximumErrorCount;
}

- (void)setMaximumErrorCount:(int64_t)a3
{
  self->_unint64_t maximumErrorCount = a3;
}

- (BOOL)canRepromptOnSameBuild
{
  return self->_canRepromptOnSameBuild;
}

- (void)setCanRepromptOnSameBuild:(BOOL)a3
{
  self->_canRepromptOnSameBuild = a3;
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
}

- (NSString)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
}

- (id)unitTest_willPresentTTRAlertHandler
{
  return self->_unitTest_willPresentTTRAlertHandler;
}

- (void)setUnitTest_willPresentTTRAlertHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_willPresentTTRAlertHandler, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end